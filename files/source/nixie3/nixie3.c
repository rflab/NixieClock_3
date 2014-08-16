
//
// nixie3.c
//
// Created: 2014/07/30 23:03:32
//  Author: Owner
//


#include <avr/io.h>

// 内蔵クロック8MHzそのままで動かすなら,
// Fuseの分周設定をOFFにする(CKDIV8=0)
#define F_CPU (8000000UL)
#include <util/delay.h>
#include <stdbool.h>

// タイマ割り込み
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


// 10は点灯せず
void ChangeNumber(unsigned char num_)
{
	static unsigned char num2pin[] = {3, 4, 6, 9, 8, 1, 5, 0, 2, 7, 10};
	PORTC = (PORTC & 0b11110000) | num2pin[num_];
	return;
}

// タイマ割り込み
ISR(TIMER0_COMPA_vect)
{
	static unsigned char digit = 0;
	static unsigned char blank = 0;

	// blank期間なら全LEDをOFF
	blank = blank == 0 ? 1 : 0;
	if (blank)
	{
		PORTB &= 0b11100000;
		ChangeNumber(10);

		return;
	}
	
	// 表示LEDを切り替え
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
	// PCINTでロータリーエンコーダ検出するとき
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
		DDRB   = 0b11111111; // 0~5が有効 0134:line direct(012:line decoder), 6:beep
		DDRC   = 0b10001111; // 0~7が有効 0123:nixie_driver, 45:IIC, 6:reset
		DDRD   = 0b00010001; // 0~7が有効 0:rtc_oe, 1:rtc_out, 23:sw_AB, 5:remote, 6:焦電センサ(プルダウン内臓), 7:sw_push
		PORTB  = 0b00000000;
		PORTC  = 0b00110000; // 45:IICプルアップ, 6:resetプルアップ
		PORTD  = 0b10101111; // 6はセンサが内臓プルダウンなのでHiZ
		
		// pin change interrupt
		PCMSK0 = 0b00000000;
		PCMSK1 = 0b00000000;
		PCMSK2 = 0b10000000; // 7:PCINT7
		PCICR  = 0b00000100; // PCINT2 enable
		
		// interrupt
		EICRA  = 0b00001010; // INT0, INT1立ち下がり検出
		EIMSK  = 0b00000011; // INT0, INT1有効化
	}

	// Timer
	// 8桁ニキシーを30Hz表示したい、ブランク時間を半分とする
	// マスタクロック8Mhz / 8 / 30 / 2 = 166666 (16.3 * 1024)回に一度割り込みでOK
	// 約2msで割り込みさせる
	{
		TIMSK0 = 0b0000010; // output compare A

		// CTC, 1024分周prescaler入力
		TCCR0A = 0b00000010;
		TCCR0B = 0b00000101;
		
		// 16でリセット
		OCR0A  = 8; // 暫定で16→8
		
		// Compare Match A Interrupt Enable
		TIMSK0 = 0b00000010;
	}
	
	// ADC
	{
		// ADMUX    外部基準電圧選択、ch1選択
		// ADCSRA   BV(ADEN)|_BV(ADIE)|0b110;
		// ADEN     A/D許可 (ADC Enable
		// ADSC     A/D変換開始
		// ADATE    A/D変換自動起動許可
		// ADIE     A/D変換完了割り込み許可
		// ADPS2～0 A/D変換ｸﾛｯｸ選択
	}

	// 割り込み有効化アセンブラ命令コール
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