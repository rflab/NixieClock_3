
//
// nixie3.c
//
// Created: 2014/07/30 23:03:32
//  Author: Owner
//

//----------------------------
// include std
//----------------------------

// none

//----------------------------
// include avr
//----------------------------
#include <avr/io.h>

// �����N���b�N8MHz���̂܂܂œ������Ȃ�,
// Fuse�̕����ݒ��OFF�ɂ���(CKDIV8=0)
#ifndef F_CPU
	#define F_CPU 8000000UL
#endif
#include <util/delay.h>
#include <stdbool.h>

// �^�C�}���荞��
#include <avr/interrupt.h>

//----------------------------
// macros/defines
//----------------------------
#define setbits(reg, mask, offset, dat) \
	do{reg = ((reg & ~mask)|((dat)<<offset)); }while(0)
#define chkbit(reg, mask) (reg & (1<<mask))
#define lo(c) ((c)&0x0f)
#define hi(c) (((c)>>4)&0x0f)

#define IIC_READ_BIT  1
#define IIC_WRITE_BIT 0
#define RTC_SLAVE_ADDRESS 0xa2
#define IIC_SCL_CLOCK 100000L

//----------------------------
// enum
//----------------------------
typedef enum _e_digit
{
	DIGIT_0        = 0,
	DIGIT_1        = 1,
	DIGIT_COLON_L  = 2,
	DIGIT_2        = 3,
	DIGIT_3        = 4,
	DIGIT_COLON_R  = 5,
	DIGIT_4        = 6,
	DIGIT_5        = 7
}e_digit;

typedef struct BIT_FOELD_PORTB
{
	unsigned NOT_ISE1     : 1;
	unsigned BEEP         : 1;
	unsigned NOT_USE0     : 3;
	unsigned NIXIE_DIGIT  : 3;
}BIT_FOELD_PORTB;
#define PORT_BEEP              PORTB
#define PORT_NIXIE_DIGIT       PORTB
#define OFFSET_BEEP           6
#define OFFSET_NIXIE_DIGIT    0
#define MASK_BEEP             0b01000000
#define MASK_NIXIE_DIGIT      0b00000111
#define BIT_FIELD_BEEP        BIT_FOELD_PORTB
#define BIT_FIELD_NIXIE_DIGIT BIT_FOELD_PORTB

typedef struct BIT_FOELD_PORTC
{
	unsigned NA           : 1;
	unsigned RESET_LOW    : 1;
	unsigned SCL          : 1;
	unsigned SDA          : 1;
	unsigned NIXIE_DRIVER : 4;
}BIT_FOELD_PORTC;
#define PORT_SCL                PORTC
#define PORT_SDA                PORTC
#define PORT_NIXIE_DRIVER       PORTC
#define OFFSET_SCL             5
#define OFFSET_SDA             4
#define OFFSET_NIXIE_DRIVER    0
#define MASK_SCL               0b00100000
#define MASK_SDA               0b00010000
#define MASK_NIXIE_DRIVER      0b00001111
#define BIT_FIELD_SCL          BIT_FOELD_PORTC
#define BIT_FIELD_SDA          BIT_FOELD_PORTC
#define BIT_FIELD_NIXIE_DRIVER BIT_FOELD_PORTC

typedef struct BIT_FOELD_PORTD
{
	unsigned LED          : 1; // LED
	unsigned SW_A         : 1; // switch A external interrupt
	unsigned SW_B         : 1; // switch B external interrupt
	unsigned RTC_CLKOE    : 1; // RTC output enable
	unsigned RTC_CLKOUT   : 1; // RTC output port
}BIT_FOELD_PORTD;
#define PORT_LED             PORTD
#define PORT_SWA             PORTD
#define PORT_SWB             PORTD
#define PORT_RTC_CLKOE       PORTD
#define PORT_RTC_CLKOUT      PORTD
#define PIN_LED              PIND
#define PIN_SWA              PIND
#define PIN_SWB              PIND
#define PIN_RTC_CLKOE        PIND
#define PIN_RTC_CLKOUT       PIND
#define OFFSET_LED           4
#define OFFSET_SW_A          3
#define OFFSET_SW_B          2
#define OFFSET_RTC_CLKOE     1
#define OFFSET_RTC_CLKOUT    0
#define MASK_LED             0b00010000
#define MASK_SW_A            0b00001000
#define MASK_SW_B            0b00000100
#define MASK_RTC_CLKOE       0b00000010
#define MASK_RTC_CLKOUT      0b00000001
#define BIT_FIELD_LED        BIT_FOELD_PORTD
#define BIT_FIELD_SWA        BIT_FOELD_PORTD
#define BIT_FIELD_SWB        BIT_FOELD_PORTD
#define BIT_FIELD_RTC_CLKOE  BIT_FOELD_PORTD
#define BIT_FIELD_RTC_CLKOUT BIT_FOELD_PORTD


//----------------------------
// globals
//----------------------------
volatile int number = 0;
volatile bool clkout_flag = false;
volatile bool num_up   = false;
volatile bool num_down = false;

// ���ԋL���̈�
volatile static unsigned char g_hour	     = 0x00;
volatile static unsigned char g_minute	     = 0x00;
volatile static unsigned char g_second	     = 0x00;
volatile static unsigned char g_year	     = 0x00;
volatile static unsigned char g_month	     = 0x00;
volatile static unsigned char g_date	     = 0x00;
volatile static unsigned char g_week         = 0x00;
volatile static unsigned char g_alarm_hour	 = 0x12;
volatile static unsigned char g_alarm_minute = 0x00;


// �悭�g���̂Ńv���g�^�C�v
void led(bool on_);
void beep(int num_beep_);

//----------------------------
// util
//----------------------------

//------
// IIC
// �G���[�`�F�b�N�Ƃ��Ȃ��łƂ肠���������Ă��邾���Ȃ̂Œ���
//
// start  : �}�X�^�[������SCL_H����SDA_L (�X���[�u�A�h���X+R/~W�𑗂�ack��҂�)
// stop   : �}�X�^�[������SCL_H����SDA_H
// repeat : ��{�I��start�Ɠ����APIC�ł͌ʂ̃��W�X�^���������̂ŕ�����
// write  : ���������ack��҂�
// read   : �ǂݍ����ack/nack��Ԃ�
// ack    : ��M������9bit�ڂ�SDA_L, 
// nack   : ��M������9bit�ڂ�SDA_H (�}�X�^�[����̃f�[�^�]���I���v�����Ɏg��)

ISR(TWI_vect)
{
	// none
}

// TWI���荞�݊����҂�
bool iic_wait_job()
{
	#if 0
		unsigned char i = 0;
		for(i=0; i<0xff; ++i)
		{
			if ((TWCR & (1<<TWINT)) == 0)
				return true;
	}
	return false;
	#else
		while(!(TWCR & (1<<TWINT)));
		return true;
	#endif
}

// IIC�X�^�[�g�R���f�B�V����
bool iic_start(unsigned char sla_rw_)
{
	// �X�^�[�g�R���f�B�V�������M
	TWCR = (1<<TWINT) | (1<<TWSTA) | (1<<TWEN);// | (1<<TWIE);
	iic_wait_job();
	
	// �X���[�u�A�h���X��RW�𑗐M
	TWDR = sla_rw_;
	TWCR = (1<<TWINT) | (1<<TWEN);// | (1<<TWIE);
	iic_wait_job();

	return true;
}

// IIC���s�[�g�X�^�[�g�R���f�B�V����
bool iic_repeat(unsigned char sla_rw_)
{
	return iic_start(sla_rw_);
}

// IIC�X�g�b�v�R���f�B�V����
void iic_stop()
{
	// �X�g�b�v�R���f�B�V�������M
	TWCR = (1<<TWINT) | (1<<TWSTO) | (1<<TWEN);// | (1<<TWIE);

	// stop�R���f�B�V�����ɂ��Ă͊��荞�݂��������Ȃ��H
	// iic_wait_job();�ł��Ȃ�
	while(TWCR & (1<<TWSTO));
}

// IIC���M
bool iic_write(unsigned char data_)
{
	TWDR = data_;
	TWCR = (1<<TWINT) | (1<<TWEN);// | (1<<TWIE);
	iic_wait_job();
	
	// �X�e�[�^�X���W�X�^�m�F�iACK 0x28)
	//return (TWSR & 0xF8 ) == 0x28;
	return true;
}

// IIC��M
unsigned char iic_read(bool ack_)
{
	//TWDR = 0;

	if (ack_ != false)
	{
		TWCR = (1<<TWINT) | (1<<TWEN) | (1<<TWEA);
	}
	else
	{
		TWCR = (1<<TWINT) | (1<<TWEN);// | (1<<TWIE);
	}

	while(!(TWCR & (1<<TWINT)));
	return TWDR;
}

//------
// EEPROM

//----------------------------
// functions
//----------------------------

// LED
void led(bool on_)
{
	if (on_)
		PORT_LED |= MASK_LED;
	else
		PORT_LED &= ~MASK_LED;

	return;
}

// BEEP
void beep(int num_beep_)
{	
	int i = 0;

	for (i = 0; i < num_beep_; ++i)
	{
		PORT_BEEP |= MASK_BEEP;
		_delay_ms(50);
		PORT_BEEP &= ~MASK_BEEP;
		_delay_ms(50);
	}

	// �A�����s�̔��ʂ̂��߈�Uwait������
	_delay_ms(50);

	return;
}

// ���邳�Z���T / brightness sensor
static void update_brightness()
{
	return;
}

// �C���Z���T / atmospheric pressure sensor
static void update_atmospheric_pressure()
{
	return;
}

// ���x�Z���T / temparature and humidity sensor
static void update_humidity()
{
	return;
}

// �l���Z���T / motion sensor
static void update_mosion_sensor()
{
	return;
}



// RTC / real time clock
static void rtc_load()
{
	iic_start(RTC_SLAVE_ADDRESS|IIC_WRITE_BIT);
	iic_write(0x02); // �b�̃A�h���X
	iic_repeat(RTC_SLAVE_ADDRESS|IIC_READ_BIT);
	g_second       = iic_read(true); // �b�̒l 0-59
	g_minute       = iic_read(true); // ���̒l 0-59
	g_hour	       = iic_read(true); // ���̒l 0-23
	g_date	       = iic_read(true); // ���̒l 1-31
	g_week	       = iic_read(true); // �j�̒l �����ΐ��؋��y 0123456
	g_month	       = iic_read(true); // ���̒l (C:MSB)1-12	C��1�̂Ƃ�21���I
	g_year         = iic_read(true); // �N�̒l 00-99
	g_alarm_minute = iic_read(true); // �A���[��
	g_alarm_hour   = iic_read(false); // �A���[��
	iic_stop();

	// �L���r�b�g�̎��o��
	g_second  &= 0x7f;
	g_minute  &= 0x7f;
	g_hour	  &= 0x3f;
	g_date	  &= 0x3f;
	g_week	  &= 0x07;
	g_month	  &= 0x1f;
		
	// g_year	  &= 0xff; �N�͑S�r�b�g�L���Ȃ̂Ń}�X�N���Ȃ�
	// g_century = g_month & 0x80 ? 21 : 20;
	g_alarm_minute &= 0x7f;
	g_alarm_hour &= 0x3f;
}

static void rtc_save()
{
	return;
}

static void rtc_init()
{
	unsigned char vl_bit;
	
	// Rtc�̗����オ���700ms�K�v�Ȃ̂œ�����wait����
	_delay_ms(250);
	_delay_ms(250);
	_delay_ms(200);
	
	// VL�r�b�g���`�F�b�N
	// �ǂݏo���̏ꍇ��repeat����
	// �b�̃A�h���X�̐擪�r�b�g���o�b�N�A�b�v�ُ팟�oVL
	iic_start(RTC_SLAVE_ADDRESS|IIC_WRITE_BIT);
	iic_write(0x02);
	iic_repeat(RTC_SLAVE_ADDRESS|IIC_READ_BIT);
	vl_bit = iic_read(false) & 0x80; 
	iic_stop();

	// VL�r�b�g�ُ킪����Ώ���������
	if (vl_bit)
	{
		// ������
		iic_start(RTC_SLAVE_ADDRESS|IIC_WRITE_BIT);
		iic_write(0x00); // control0�̃A�h���X
		iic_write(0x0);  // control0 -> test=0, STOP=0
		iic_write(0x0);  // control1 -> AIE=TIE=0
		iic_write(0x0);  // seconds
		iic_write(0x0);  // minutes
		iic_write(0x0);  // hours
		iic_write(0x0);  // days
		iic_write(0x0);  // weekdays
		iic_write(0x0);  // month/century
		iic_write(0x0);  // years
		iic_write(0x0);  // alarm_minutes
		iic_write(0x0);  // alarm_hours
		iic_write(0x0);  // alarm_days
		iic_write(0x0);  // alarm_weekdays
		iic_write(0x83); // clkout -> enable,1Hz
		iic_write(0x0);  // timer control
		iic_write(0x0);  // timer
		iic_stop();
		beep(5);
	}
	else
	{
		iic_start(RTC_SLAVE_ADDRESS|IIC_WRITE_BIT);
		iic_write(0x00); // control0�̃A�h���X
		iic_write(0x0);  // control0 -> test=0, STOP=1
		iic_write(0x0);  // control1 -> AIE=TIE=0
		iic_stop();
		
		iic_start(RTC_SLAVE_ADDRESS|IIC_WRITE_BIT);
		iic_write(0x0d); // clkout�̃A�h���X
		iic_write(0x83); // clkout -> enable,1Hz
		iic_stop();
	}
		
	return;
}

// �j�L�V�[�� / Nixie tube
// ���ݕ\�����̕ύX
// �J��Ԃ��R�[�����ă_�C�i�~�b�N�_�����s��
static void ChangeDigit(e_digit digit_)
{
	setbits(PORT_NIXIE_DIGIT, MASK_NIXIE_DIGIT, OFFSET_NIXIE_DIGIT, (char)digit_);
	return;
}

// �j�L�V�[�� / Nixie tube
// ���ݕ\�������w�肵���l�ɕύX
// 10~15�͓_������
static void ChangeNumber(unsigned char num_)
{
	static const unsigned char num2bit[] = {3, 4, 6, 9, 8, 1, 5, 0, 2, 7, 10};
	setbits(PORT_NIXIE_DRIVER, MASK_NIXIE_DRIVER, OFFSET_NIXIE_DRIVER, num2bit[num_]);
	return;
}


//----------------------------
// interrupts
//----------------------------
// �^�C�}���荞��
ISR(TIMER0_COMPA_vect)
{
	static unsigned char digit = 0;
	static unsigned char blank = 0;

	// blank���ԂȂ�SLED��OFF
	blank = blank == 0 ? 1 : 0;
	if (blank)
	{
		ChangeNumber(10); // 10�͓_������

		return;
	}
	
	// �\��LED��؂�ւ�
	digit++;
	digit &= 0x7;
	switch (digit)
	{
		case 0:
			ChangeDigit(DIGIT_0);
			ChangeNumber(number);
			break;
		case 1:
			ChangeDigit(DIGIT_1);
			ChangeNumber(number);
			break;
		case 2:
			ChangeDigit(DIGIT_COLON_L);
			ChangeNumber(number);
			break;
		case 3:
			ChangeDigit(DIGIT_2);
			ChangeNumber(number);
			break;
		case 4:
			ChangeDigit(DIGIT_3);
			ChangeNumber(number);
			break;
		case 5:
			ChangeDigit(DIGIT_COLON_R);
			ChangeNumber(number);
			break;
		case 6:
			ChangeDigit(DIGIT_4);
			ChangeNumber(number);
			break;
		case 7:
			ChangeDigit(DIGIT_5);
			ChangeNumber(number);
			break;
		default:
			break;
	}
	return;
}

// External interrupt 0
ISR(INT0_vect)
{
	if (!num_up)
	{
		num_down = true;
	}
}

// External interrupt 1
ISR(INT1_vect)
{
	if (!num_down)
	{
		num_up = true;
	}
}

// PIN change interrupt
ISR(PCINT2_vect)
{
	// PCINT�Ń��[�^���[�G���R�[�_���o����Ƃ�
	#if 0
	if (((PIND & 0b10000000) == 0)
	||  ((PIND & 0b01000000) == 1))
	{
		if (!num_up)
		{
			num_down = true;
		}
	}

	if (((PIND & 0b01000000) == 0)
	||  ((PIND & 0b10000000) == 1))
	{
		if (!num_down)
		{
			num_up = true;
		}
	}
	#endif
	
	if (PIN_RTC_CLKOUT & MASK_RTC_CLKOUT)
	{
		clkout_flag = true;
	}
}


//----------------------------
// initialize
//----------------------------
static void setup()
{
	MCUCR &= 0b11101111; // PUD = 0, intrrupt on

	// PIN (I/O, interrupt)
	{
		// port config
		DDRB   = 0b11111111; // 0~5���L�� 0134:line direct(012:line decoder), 6:beep
		DDRC   = 0b10001111; // 0~7���L�� 0123:nixie_driver, 45:IIC, 6:reset
		DDRD   = 0b00010010; // 0~7���L�� 0:rtc_out, 1:rtc_oe, 23:sw_AB, 5:remote, 6:�œd�Z���T(�v���_�E������), 7:sw_push
		PORTB  = 0b00000000;
		PORTC  = 0b00110000; // 45:IIC�v���A�b�v, 6:reset�v���A�b�v
		PORTD  = 0b10101111; // 6�̓Z���T�������v���_�E���Ȃ̂�HiZ

		// pin change interrupt
		PCMSK0 = 0b00000000;
		PCMSK1 = 0b00000000;
		PCMSK2 = 0b00000001; // 7:PCINT7
		PCICR  = 0b00000100; // PCINT2 enable
		
		// interrupt
		EICRA  = 0b00001010; // INT0, INT1���������茟�o
		EIMSK  = 0b00000011; // INT0, INT1�L����
	}

	// Timer
	// 8���j�L�V�[��30Hz�\���������A�u�����N���Ԃ𔼕��Ƃ���
	// �}�X�^�N���b�N8Mhz / 8 / 30 / 2 = 166666 (16.3 * 1024)��Ɉ�x���荞�݂�OK
	// ��2ms�Ŋ��荞�݂�����
	{
		TIMSK0 = 0b0000010; // output compare A

		// CTC, 1024����prescaler����
		TCCR0A = 0b00000010;
		TCCR0B = 0b00000101;
		
		// 16�Ń��Z�b�g
		OCR0A  = 8; // �b���16��8
		
		// Compare Match A Interrupt Enable
		TIMSK0 = 0b00000010;
	}
	
	// IIC
	{
		// ���x���x�Z���T�EAM2321�ƒʐM����I2C�o�X�̃f�[�^�]�����x�́A�ő�100KHz�ł��B
		// F_SCL = (F_CPU / ((16 + 2(TWBR)) * prescaler)
		// TWBR = (F_CPU / (F_SCL * prescaler) -16) / 2
		// 20kHz�ʐM�A4�����Ƃ����
		setbits(TWSR, 0x0, 0, 2); // 0, 1, 2, 3 -> 1, 4, 16, 64
		TWBR = ((F_CPU/100000UL) - 16) / 2;
		TWCR = 1<<TWEN;
	}
	
	// ADC
	{
		// ADMUX    �O����d���I���Ach1�I��
		// ADCSRA   BV(ADEN)|_BV(ADIE)|0b110;
		// ADEN     A/D���� (ADC Enable
		// ADSC     A/D�ϊ��J�n
		// ADATE    A/D�ϊ������N������
		// ADIE     A/D�ϊ��������荞�݋���
		// ADPS2�`0 A/D�ϊ��ۯ��I��
	}

	// ���荞�ݗL�����A�Z���u�����߃R�[��
	sei();
	
	/// RTC ������
	rtc_init();
	rtc_load();
	
	// �����������A�N������x����
	beep(1);
}

//----------------------------
// routine
//----------------------------

// loop
static void loop()
{	
	if ((PIND & 0b10000000) == 0)
	{
		number = 0;
		rtc_load();
		beep(lo(g_second));
		led(true);
	}	
	
	if (num_up)
	{
		++number;
		if (number > 9)
		{
			number = 0;
		}
		_delay_ms(200);
	}
	else if (num_down)
	{
		--number;
		if (number < 0)
		{
			number = 9;
		}
		_delay_ms(200);
	}
	num_up = false;
	num_down = false;
	
	////�l���Z���T
	//if (chkbit(PIND, PIND6))
	//{
	//	led(true);
	//}
	//else
	//{
	//	led(false);
	//}


	if (clkout_flag)
	{
		//beep(1);
		clkout_flag = 0;
	}

	_delay_ms(20);

}

// main
int main(void)
{
	setup();
	
	while(1)
	{
		loop();
	}
	
	return 0;
}