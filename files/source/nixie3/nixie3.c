
//
// nixie3.c
//
// Created: 2014/07/30 23:03:32
//  Author: Owner
//


#include <avr/io.h>

// �����N���b�N8MHz���̂܂܂œ������Ȃ�,
// Fuse�̕����ݒ��OFF�ɂ���(CKDIV8=0)
#define F_CPU (8000000UL)
#include <util/delay.h>
#include <stdbool.h>

// �^�C�}���荞��
#include <avr/interrupt.h>


int number = 0;
volatile bool num_up   = false;
volatile bool num_down = false;


void led(bool on_)
{
	if (on_)
	PORTD |= 0b00010000;
	else
	PORTD &= 0b11101111;
}

#define setbit(reg, bit)   do{reg |= (1<<bit); }while(0)
#define clearbit(reg, bit) do{reg &= ~(1<<bit);}while(0)
#define checkbit(reg, bit) (reg & (1<<bit))


// 10�͓_������
void ChangeNumber(unsigned char num_)
{
	static unsigned char num2pin[] = {3, 4, 6, 9, 8, 1, 5, 0, 2, 7, 10};
	PORTC = (PORTC & 0b11110000) | num2pin[num_];
	return;
}

// �^�C�}���荞��
ISR(TIMER0_COMPA_vect)
{
	static unsigned char digit = 0;
	static unsigned char blank = 0;

	// blank���ԂȂ�SLED��OFF
	blank = blank == 0 ? 1 : 0;
	if (blank)
	{
		PORTB &= 0b11100000;
		ChangeNumber(10);

		return;
	}
	
	// �\��LED��؂�ւ�
	digit++;
	digit &= 0x7;
	switch (digit)
	{
		case 0:
			setbit(PORTB, 3);
			ChangeNumber(number);
			break;
		case 1:
			setbit(PORTB, 4);
			ChangeNumber(number);
			break;
		case 2:
			setbit(PORTB, 0);
			ChangeNumber(number);
			break;
		case 3:
			setbit(PORTB, 1);
			ChangeNumber(number);
			break;
		case 4:
			setbit(PORTB, 0);
			ChangeNumber(number);
			break;
		case 5:
			setbit(PORTB, 0);
			ChangeNumber(number);
			break;
		case 6:
			setbit(PORTB, 0);
			ChangeNumber(number);
			break;
		case 7:
			setbit(PORTB, 0);
			ChangeNumber(number);
			break;

		default:
		setbit(PORTB, 4);
		break;
	}
	return;
}

// External interrupt 0
ISR(INT0_vect)
{
	led(true);
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
}

// setup
void setup()
{
	MCUCR &= 0b11101111; // PUD = 0, intrrupt on

	// PIN (I/O, interrupt)
	{
		// port config
		DDRB   = 0b11111111; // 0~5���L�� 0134:line direct(012:line decoder), 6:beep
		DDRC   = 0b10001111; // 0~7���L�� 0123:nixie_driver, 45:IIC, 6:reset
		DDRD   = 0b00010001; // 0~7���L�� 0:rtc_oe, 1:rtc_out, 23:sw_AB, 5:remote, 6:�œd�Z���T(�v���_�E������), 7:sw_push
		PORTB  = 0b00000000;
		PORTC  = 0b00110000; // 45:IIC�v���A�b�v, 6:reset�v���A�b�v
		PORTD  = 0b10101111; // 6�̓Z���T�������v���_�E���Ȃ̂�HiZ
		
		// pin change interrupt
		PCMSK0 = 0b00000000;
		PCMSK1 = 0b00000000;
		PCMSK2 = 0b10000000; // 7:PCINT7
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
}

// loop
void loop()
{
	
	if ((PIND & 0b10000000) == 0)
	{
		number = 0;
		setbit(PORTB, 6);
		_delay_ms(200);
		_delay_ms(200);
		_delay_ms(200);
		_delay_ms(200);
		_delay_ms(200);
		clearbit(PORTB, 6);
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
	
	
	if (checkbit(PIND, PIND6))
	{
		led(true);
	}
	else
	{
		led(false);
	}

	_delay_ms(20);

}

int main(void)
{
	setup();
	
	while(1)
	{
		loop();
	}
	
	return 0;
}