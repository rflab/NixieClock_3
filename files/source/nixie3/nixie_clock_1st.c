#include <3694.h>
#include <stdlib.h>

// static assert
#define STATIC_ASSERT(exp) {char is_size[(exp)?1:0]; (void)is_size;}
#define LO(c_) (c_&0x0f)
#define HI(c_) ((c_>>4)&0x0f)


// iic�^�C���A�E�g
#define IDLE_LOOP	  (1000)
#define TX_END_LOOP	  (1000)
#define RX_END_LOOP	  (1000)
#define BUSBUSY_LOOP  (1000)

// �\������
#define DIGITS (8)
#define DIGITS_OFF_ALL (DIGITS)


// timer_v
#define MSEC_TO_TIMERV (2)
#define MAX_TRANSITION (40)

// �\���t���O
// �f�o�C�X�ɂ��킹��B
unsigned char NUM2REG_TABLE[] = 
{
	0, //����
	9,
	8,
	7,
	6,
	5,
	4,
	3,
	2,
	1,
};
#define DISP_DOT (sizeof(NUM2REG_TABLE))
#define DISP_OFF (DISP_DOT+1)

// �{�^���R�[���o�b�N
typedef void (*t_callback)(void);
t_callback g_timer_v_callback = NULL;
t_callback g_timer_a_callback = NULL;
static unsigned long g_timer_v_callback_time_left = 0;

// �X�e�[�g�}�V��
typedef struct {
	t_callback on_button0;
	t_callback on_button1;
	t_callback on_button2;
}STATE;
STATE g_state_clock			  = {NULL, NULL, NULL};
STATE g_state_calendar		  = {NULL, NULL, NULL};
STATE g_state_dispoff		  = {NULL, NULL, NULL};
STATE g_state_hour_h_set	  = {NULL, NULL, NULL};
STATE g_state_hour_l_set	  = {NULL, NULL, NULL};
STATE g_state_minute_h_set	  = {NULL, NULL, NULL};
STATE g_state_minute_l_set	  = {NULL, NULL, NULL};
STATE g_state_second_h_set	  = {NULL, NULL, NULL};
STATE g_state_second_l_set	  = {NULL, NULL, NULL};
STATE g_state_year_h_set	  = {NULL, NULL, NULL};
STATE g_state_year_l_set	  = {NULL, NULL, NULL};
STATE g_state_month_h_set	  = {NULL, NULL, NULL};
STATE g_state_month_l_set	  = {NULL, NULL, NULL};
STATE g_state_date_h_set	  = {NULL, NULL, NULL};
STATE g_state_date_l_set	  = {NULL, NULL, NULL};
//STATE g_state_alarm_set	  = {NULL, NULL, NULL};
//STATE g_state_stopwatch_set = {NULL, NULL, NULL};
//STATE g_state_timer_set	  = {NULL, NULL, NULL};
STATE* g_state_current;
unsigned char g_setting_digit = DIGITS;
unsigned short g_blink_timer = 0;
static const unsigned short BLINK_INTERVAL = 500*MSEC_TO_TIMERV;


// �\���f�[�^
static unsigned char g_disp[DIGITS] = {0,0,0,0,0,0,0,0};
static unsigned char g_disp_prev[DIGITS] = {0,0,DISP_DOT,0,0,DISP_DOT,0,0};
static unsigned short g_transition[DIGITS] = {0,0,0,0,0,0,0,0};
static unsigned char g_next_random = 0x0;

static unsigned char g_hour	  = 0x00;
static unsigned char g_minute = 0x00;
static unsigned char g_second = 0x00;
static unsigned char g_year	  = 0x00;
static unsigned char g_month  = 0x00;
static unsigned char g_date	  = 0x00;
static unsigned char g_week	  = 0x00;
static unsigned char g_dot    = 0x00; // 0�����A1�_��
//static unsigned char hour_h	= 0;
//static unsigned char hour_l	= 0;
//static unsigned char minute_h = 0;
//static unsigned char minute_l = 0;
//static unsigned char second_h = 0;
//static unsigned char second_l = 0;
//static unsigned char year_h	= 0;
//static unsigned char year_l	= 0;
//static unsigned char month_h	= 0;
//static unsigned char month_l	= 0;
//static unsigned char date_h	= 0;
//static unsigned char date_l	= 0;



// �Ƃ肠�����v���g�^�C�v
void ChangeDiap(unsigned char ch_, unsigned char num_);
void StateChangeRandomDisp();

//-----------------------------------------------
// ��{�֐�
//-----------------------------------------------

// msec�P�ʂ�wait
void wait_msec(int msec_)
{
	volatile int i,j;
	for (i=0;i<msec_;i++)
	{
		for (j=0;j<1588;j++); /*1588�͖�1ms*/
	}
}

short iic_init(void)
{
	// �]�����[�g
	IIC2.ICCR1.BIT.CKS = 0x0f;
	IIC2.ICCR1.BIT.ICE = 1;
	
	return 1;
}

// busy end wait
short iic_busbusy(void)
{
	volatile short	i = 0;

	while (1)
	{
		if (i++ > BUSBUSY_LOOP)
			return 0;
		if (IIC2.ICCR2.BIT.BBSY == 0)
			break;
	}

	return (IIC2.ICCR2.BIT.BBSY == 0);
}

// start condition
short iic_start(void)
{
	volatile short	i = 0;

	// �r�W�[��ԉ����҂�
	iic_busbusy();
	
	// �}�X�^���M���[�h���w��
	IIC2.ICCR1.BYTE = (IIC2.ICCR1.BYTE & 0xcf) | 0x30; 
	
	// �J�n
	//BBSY=1,SCP=0 / �X�^�[�g�R���f�B�V�����A���s
	IIC2.ICCR2.BYTE = (IIC2.ICCR2.BYTE & 0xbe) | 0x80;
	//do 
	//{
	//	IIC2.ICCR2.BYTE = (IIC2.ICCR2.BYTE & 0xbe) | 0x80;
	//	IIC2.ICDRT = SLA;
	//	
	//}while(IIC2.ICIER.BIT.ACKBR)

	// DRT/DRR����ɂȂ�܂ő҂�
	while (IIC2.ICSR.BIT.TDRE == 0);
	{
		if (i++ > TX_END_LOOP)
		{
			return 0;
		}
	}

	return 1;
}

// stop condition
short iic_stop(void)
{
	volatile short	i = 0;
	_BYTE			result;

	// �_�~�[���[�h
	result = IIC2.ICSR.BYTE;
	
	// TEND�t���O�N���A
	IIC2.ICSR.BIT.TEND = 0;

	// �}�X�^���M���[�h���w��
	IIC2.ICCR1.BYTE = (IIC2.ICCR1.BYTE & 0xcf) | 0x30;
	
	// ��~��������(BBSY=0, SCP=0/�X�g�b�v�R���f�B�V�����A���s)
	IIC2.ICCR2.BYTE &= 0x3f;

	// ��~���������҂�
	while (IIC2.ICSR.BIT.STOP == 0)
	{
		if (i++ > TX_END_LOOP)
			return 0;
	}
	return 1;
}


short iic_put(_BYTE data)
{
	volatile short	i = 0;

	// �}�X�^���M���[�h���w��
	IIC2.ICCR1.BYTE = (IIC2.ICCR1.BYTE & 0xcf) | 0x30; 

	// �f�[�^��������
	IIC2.ICDRT = data;

	// ���M�҂�
	while (IIC2.ICSR.BIT.TEND == 0)
	{
		// �^�C���A�E�g
		if (i++ > TX_END_LOOP)
			return 0;
	}
	
	// ACK?
	if (IIC2.ICIER.BIT.ACKBR != 0)
	{
		// ��~�������s
		iic_stop();
		return 0;
	}
	return 1;
}

char iic_get(int ack_)
{
	volatile short	i = 0;
	_BYTE data = 0;
	
	// �}�X�^���M���[�h���w��
	IIC2.ICCR1.BYTE = (IIC2.ICCR1.BYTE & 0xcf) | 0x20; 
	
	// �_�~�[���[�h����Ǝ�M���J�n
	data = IIC2.ICDRR;

	// ���V�[�u�f�[�^�t���҂�
	while (IIC2.ICSR.BIT.RDRF == 0)
	{
		// �^�C���A�E�g
		if (i++ > RX_END_LOOP)
			return 0;
	}

	// �ǂݍ���
	data = IIC2.ICDRR;

	// ACK?
	if (IIC2.ICIER.BIT.ACKBR != 0)
	{
		// ��~�������s
		iic_stop();
		return data;
	}
	
	return data;
}

// H8������
void InitH8(void)
{
	// �^�C�}V�ݒ�
	TV.TCRV0.BIT.CCLR = 1;	// �R���y�A�}�b�`A��TCNV�N���A
	TV.TCRV0.BIT.CKS = 0;	// ��~
	TV.TCRV1.BIT.ICKS = 1;	// ��LCKS=3�ƕ��p�� /128=156.25kH�� z
	TV.TCSRV.BIT.CMFA = 0;	// �t���O�N���A
	TV.TCNTV = 0;			// �^�C�}�J�E���^�N���A
	TV.TCORA = 80;			// ��500us
	TV.TCRV0.BIT.CMIEA = 1; // �R���y�A�}�b�`�Ŋ��荞��
	TV.TCRV0.BIT.CKS = 3;	// �^�C�}V�X�^�[�g

	// IIC
	iic_init();

	// �^�C�}A�ݒ�
	TA.TMA.BIT.CKSI = 8;	// �v���X�P�[��W/���v�p�I�� ��=1Hz
	IENR1.BIT.IENTA = 1;	// �^�C�}A���荞�ݗv������

	// IO�|�[�gPCR8 �ݒ�
	IO.PCR8 = 0xFF;			// PCR8 = �o��
	
	// IO�|�[�gPCR5 �ݒ�
	IO.PCR5 = 0xFF;			// PCR5 = �o��
	
	// IO�|�[�gPCR1 �ݒ�
	IO.PCR1 = 0xe9;			// PIO10 = �o�́APIO11,PIO12,PIO14 = ����
}

void RtcInit()
{	  
	wait_msec(1700);
	iic_start();
	iic_put(0xa2);	// �������݃��[�h
	iic_put(0x00);	// control0�̃A�h���X
	iic_put(0x0);	// test=0	
	iic_put(0x0);	//AIE=TIE=0
	iic_stop(); 
}

// ��i���\�i�@�œ��t��ݒ�
void RtcDateSetBcdInDirect(short year_, char month_, char week_, char date_, char hour_, char minute_, char second_)
{
	iic_start();
	iic_put(0xa2);	   // �������݃��[�h
	iic_put(0x02);	   // �b�̃A�h���X
	iic_put(second_);  // �b�̒l 0-59
	iic_put(minute_);  // ���̒l 0-59
	iic_put(hour_);	   // ���̒l 0-23
	iic_put(date_);	   // ���̒l 1-31
	iic_put(week_);	   // �j�̒l �����ΐ��؋��y 0123456
	iic_put(year_>0x2000 ? 0x80|month_ : month_); // ���̒l (C:MSB)1-12	  C��1�̂Ƃ�21���I
	iic_put((char)(year_&0x00ff)); // �N�̒l 00-99
	iic_stop();
}

// �O���[�o���̒l���g����RTC�̎��Ԃ�ݒ�
void RtcDateSetBcd()
{
	RtcDateSetBcdInDirect(
		0x2000 | ((HI(g_year)<<4)&0xf0) | LO(g_year),
		(HI(g_month)  << 4) | LO(g_month),
		g_week,
		(HI(g_date)   << 4) | LO(g_date),
		(HI(g_hour)   << 4) | LO(g_hour),
		(HI(g_minute) << 4) | LO(g_minute),
		(HI(g_second) << 4) | LO(g_second));
}

// RTC�̃N���b�N�l��ǂݏo��
void RtcDateGetBcd()
{
	//char sec	 = 0; // �b�̒l
	//char min	 = 0; // ���̒l
	//char hour	 = 0; // ���̒l
	//char day	 = 0; // ���̒l
	//char week	 = 0; // �j�̒l
	//char month = 0; // ���̒l
	//char year	 = 0; // �N�̒l
	
	// �ʐM
	#if 1
		iic_start();
		iic_put(0xa2);	 // �������݃��[�h
		iic_put(0x02);	 // �b�̃A�h���X
		wait_msec(100);
		iic_start();
		iic_put(0xa3);	 // �ǂݍ��݃��[�h
		g_second = iic_get(1); // �b�̒l
		g_minute = iic_get(1); // ���̒l
		g_hour	 = iic_get(1); // ���̒l
		g_date	 = iic_get(1); // ���̒l
		g_week	 = iic_get(1); // �j�̒l
		g_month	 = iic_get(1); // ���̒l
		g_year	 = iic_get(0); // �N�̒l
		iic_stop();
		g_second &= 0x7f;
		g_minute &= 0x7f;
		g_hour	 &= 0x3f;
		g_date	 &= 0x3f;
		g_week	 &= 0x07;
		g_month	 &= 0x1f;
		g_year	 &= 0x7f;
	#else
		iic_start();
		iic_put(0xa2);	 // �������݃��[�h
		iic_put(0x02);	 // �b�̃A�h���X
		wait_msec(100);
		iic_start();
		iic_put(0xa3);	 // �ǂݍ��݃��[�h
		sec	  = iic_get(1); // �b�̒l
		min	  = iic_get(1); // ���̒l
		hour  = iic_get(1); // ���̒l
		day	  = iic_get(1); // ���̒l
		week  = iic_get(1); // �j�̒l
		month = iic_get(1); // ���̒l
		year  = iic_get(0); // �N�̒l
		iic_stop();
		// ��i���\�i���\�i
		sec	  &= 0x7f;
		min	  &= 0x7f;
		hour  &= 0x3f;
		day	  &= 0x3f;
		week  &= 0x07;
		month &= 0x1f;
		year  &= 0x7f;
		// �\���l�ɕϊ�
		hour_h	 = (hour >> 4)& 0xf;
		hour_l	 = (hour) & 0xf;
		minute_h = (min >> 4) & 0xf;
		minute_l = (min) & 0xf;
		second_h = (sec >> 4) & 0xf;
		second_l = (sec) & 0xf;
		year_h	 = (year >> 4)& 0xf;
		year_l	 = (year) & 0xf;
		month_h	 = (month >> 4) & 0xf;
		month_l	 = (month) & 0xf;
		date_h	 = (day >> 4) & 0xf;
		date_l	 = (day) & 0xf;
	#endif
}

// �\���ݒ�
void ChangeDigit(unsigned char ch_, unsigned char num_)
{
	// short��2�o�C�g?
	STATIC_ASSERT(sizeof(short) != 2)
	
	if ((ch_ >= DIGITS)
	||	(num_ == DISP_OFF))
	{
		IO.PDR8.BYTE = 0xFF; // �\������16�͔z�����Ă��Ȃ��̂Ŕ�\���ƂȂ�
		IO.PDR1.BYTE = 0x01; // �h�b�g�Ȃ�
	}

	// �\���`�����l��
	if (num_ < sizeof(NUM2REG_TABLE))
	{
		IO.PDR8.BYTE = (ch_<<4) & 0xf0;
	
		//����
		IO.PDR8.BYTE |= NUM2REG_TABLE[num_] & 0x0f;

		//�h�b�g�Ȃ�
		IO.PDR1.BYTE = 0x01;
	}
	else if (num_ == DISP_DOT)
	{
		// �G��Ȃ���ΐ����Ȃ�
		// num = All Hi�͔�\���ƂȂ�
		// �������͔�\��
		IO.PDR8.BYTE = (ch_<<4) & 0xf0; 
		IO.PDR8.BYTE |= 0x0f;
		
		//�h�b�g����
		IO.PDR1.BYTE = 0x00;
	}
	else
	{
		//error
	}
}

// �ʏ�\��
// ���l�ɕω����������ꍇ�̓N���X�t�F�[�h����B
void DynamicDispCallbackNormal()
{
	static unsigned char digits= 0;
	static unsigned char flag = 0;
	
	// �_�ŃJ�E���g�A�b�v
	++g_blink_timer;
	if (g_blink_timer >= BLINK_INTERVAL)
	{
		g_blink_timer = 0;
	}
	
	// �������
	// �_�����
	if( flag == 0)
	{
		ChangeDigit(DIGITS_OFF_ALL, DISP_OFF);
	}
	else
	{
		if (g_transition[digits] == MAX_TRANSITION)
		{
			if (digits == g_setting_digit)
			{
				if (g_blink_timer > BLINK_INTERVAL/2)
				{
					ChangeDigit(digits, g_disp[digits]);
				}
				else
				{
					ChangeDigit(DIGITS_OFF_ALL, DISP_OFF);
				}
			}
			else
			{
				ChangeDigit(digits, g_disp[digits]);
			}
		}
		else
		{
			if (g_transition[digits]%(g_transition[digits]/(MAX_TRANSITION/2)+1) == 0)
			{
				ChangeDigit(digits, g_disp_prev[digits]);
			}
			else
			{
				ChangeDigit(digits, g_disp[digits]);
			}
			
			++g_transition[digits];
		}
	}
	
	++flag;
	if( flag > 3 )
	{
		++digits;
		if( digits >= DIGITS )
		{
			digits = 0;
		}
		flag = 0;
	}
}

// �K�`���K�`�������\��
void DynamicDispCallbackRandom()
{
	static unsigned char digits= 0;
	static unsigned char flag = 0;
	
	// �������
	// �_�����
	if( flag == 0)
	{
		ChangeDigit(DIGITS_OFF_ALL, DISP_OFF);
	}
	else
	{
		ChangeDigit(digits, rand()%10);
	}
	
	++flag;
	if( flag > 3 )
	{
		++digits;
		if( digits >= DIGITS )
		{
			digits = 0;
		}
		flag = 0;
	}
}

// �N���b�N���[�h
void ModeCallbackClock()
{
	if (g_next_random == 1)
	{
		g_next_random = 0;
		
		// �Ȃ�ƂȂ�10���Ɉ�x�����_���\������
		StateChangeRandomDisp();
		g_timer_v_callback_time_left = MSEC_TO_TIMERV * 6000L;
	}

	// �b ����
	g_disp_prev[2] = (g_dot&0x01)==0 ? DISP_OFF : DISP_DOT;
	g_disp_prev[5] = (g_dot&0x01)==0 ? DISP_OFF : DISP_DOT;
	++g_dot;
	g_transition[2] = 0; //dot
	g_transition[5] = 0; //dot
	
	g_disp_prev[0] = LO(g_second);
	g_transition[0] = 0;
	g_second += 0x01;

	if( LO(g_second) >= 10)
	{
		// �b ���
		g_disp_prev[1] = HI(g_second);
		g_transition[1] = 0;
		g_second &= 0xf0;
		g_second += 0x10;

		if (HI(g_second) >= 6)
		{
			// �� ����
			g_disp_prev[3] = LO(g_minute);
			g_transition[3] = 0;
			g_second = 0x00;
			g_minute += 0x01;

			if (LO(g_minute) >= 10)
			{
				// �Ȃ�ƂȂ�10���Ɉ�x�����_���\������
				g_next_random = 1;
				
				// �� ���
				g_disp_prev[4] = HI(g_minute);
				g_transition[4] = 0;
				g_minute &= 0xf0;
				g_minute += 0x10;

				if (HI(g_minute)  >= 6)
				{
					// ���� ����
					g_disp_prev[6] = LO(g_hour);
					g_transition[6] = 0;
					g_minute = 0x00;
					g_hour += 0x01;

					if(HI(g_hour) < 2 && LO(g_hour) >= 10)
					{
						// ���ԏ��
						g_disp_prev[6] = HI(g_hour);
						g_disp_prev[6] = LO(g_hour);
						g_transition[7] = 0;
						g_hour &= 0xf0;
						g_hour += 0x10;
					}
					else if (HI(g_hour) >= 2 && LO(g_hour) >= 4)
					{
						g_disp_prev[6] = 2;
						g_disp_prev[6] = 4;
						g_transition[7] = 0;
						#if 1
							// ���ݎ������O��23��59���Ƃ��̏ꍇ�A�������J��Ԃ��悤�ɂȂ�̂�wait�ł�����Ɨ]�T����������B
							wait_msec(1000);
							RtcDateGetBcd();
						#else
							//// ���� ��� + ���t ����
							//g_hour = 0x00;
							//g_date += 1;
							//g_disp_prev[7] = 0;
							//g_transition[7] = 0;
							// �ʓ|�Ȃ̂ł��
							//if (LO(g_date) >= 10)
							//{
							//	// ���t ���
							//	g_date &= 0xf0;
							//	  g_date += 0x10;
							//	if (month_l == 2 || month_l == 4 || month_l == 6 || month_l == 9 || month == 11 )
							//	{
							//		// �����������̌�
							//
							//	}
							//	else (date_h >= 3 && date_l >= 1)
							//	{
							//		date_h = 0
							//		date_l = 1
							//		++month_l;
							//		if (month >= 9)
							//		{
							//		}
							//		else
							//		{
							//		}
							//	}
							//	if (LO(g_date) >= 10)
							//	{
							//		g_date += 0x10;;
							//	}
							//	
							//}
						#endif
					}
				}
			}
		}
	}
	
	// �\���f�[�^�Z�b�g
	g_disp[0] = LO(g_second);
	g_disp[1] = HI(g_second);
	g_disp[2] = (g_dot&0x01)==0 ? DISP_OFF : DISP_DOT;
	g_disp[3] = LO(g_minute);
	g_disp[4] = HI(g_minute);
	g_disp[5] = (g_dot&0x01)==0 ? DISP_OFF : DISP_DOT;
	g_disp[6] = LO(g_hour);
	g_disp[7] = HI(g_hour);
}

// �J�����_�[���[�h
void ModeCallbackCalendar()
{
	g_disp[0] = LO(g_date);
	g_disp[1] = HI(g_date);
	g_disp[2] = LO(g_month);
	g_disp[3] = HI(g_month);
	g_disp[4] = LO(g_year);
	g_disp[5] = HI(g_year);
	g_disp[6] = 0;
	g_disp[7] = 2;
}

// ��\�����[�h
void ModeCallbackDispoff()
{
	g_disp[0] = DISP_OFF;
	g_disp[1] = DISP_OFF;
	g_disp[2] = DISP_OFF;
	g_disp[3] = DISP_OFF;
	g_disp[4] = DISP_OFF;
	g_disp[5] = DISP_OFF;
	g_disp[6] = DISP_OFF;
	g_disp[7] = DISP_OFF;
}

//--------------------------------------------------
// ���荞��
//--------------------------------------------------

// �^�C�}V���荞��
void int_timerv(void)
{
	// ��~
	TV.TCRV0.BIT.CKS = 0;

	// �t���O�N���A
	TV.TCSRV.BIT.CMFA = 0;
	
	// �\���ω��I��
	if (g_timer_v_callback_time_left == 0)
	{
		g_timer_v_callback = DynamicDispCallbackNormal;
	}
	else
	{
		--g_timer_v_callback_time_left;
	}
	
	// �R�[���o�b�N
	if (g_timer_v_callback != NULL)
	{
		(*g_timer_v_callback)();
	}

	// �^�C�}V�X�^�[�g
	TV.TCRV0.BIT.CKS = 3; 
}

// �^�C�}A���荞��
void int_timera(void)
{
	// �\��
	if (g_timer_a_callback != NULL)
	{
		(*g_timer_a_callback)();
	}

	// �^�C�}A���荞�ݗv���t���O�N���A
	IRR1.BIT.IRRTA = 0;
}

//--------------------------------------------------
// �A�v��
//--------------------------------------------------

///
/// �X�e�[�g���Ƃ̏���
///

void StateChangeClock()
{
	int i = 0;
	for (i=0; i<DIGITS; ++i)
	{
		g_transition[i]=MAX_TRANSITION;
	}
	RtcDateGetBcd();
	g_timer_a_callback = ModeCallbackClock;
	g_timer_v_callback = DynamicDispCallbackRandom;
	g_timer_v_callback_time_left = MSEC_TO_TIMERV * 300L;
	g_state_current = &g_state_clock;
	g_setting_digit = 8;
	g_disp[0] = LO(g_second);
	g_disp[1] = HI(g_second);
	g_disp[2] = DISP_DOT;
	g_disp[3] = LO(g_minute);
	g_disp[4] = HI(g_minute);
	g_disp[5] = DISP_DOT;
	g_disp[6] = LO(g_hour);
	g_disp[7] = HI(g_hour);
}
void StateChangeCalendar()
{
	int i = 0;
	for (i=0; i<DIGITS; ++i)
	{
		g_transition[i]=MAX_TRANSITION;
	}
	RtcDateGetBcd();
	g_timer_a_callback = ModeCallbackCalendar;
	g_timer_v_callback = DynamicDispCallbackRandom;
	g_timer_v_callback_time_left = MSEC_TO_TIMERV * 300L;
	g_state_current = &g_state_calendar;
	g_setting_digit = 8;
	g_disp[0] = LO(g_date);
	g_disp[1] = HI(g_date);
	g_disp[2] = LO(g_month);
	g_disp[3] = HI(g_month);
	g_disp[4] = LO(g_year);
	g_disp[5] = HI(g_year);
	g_disp[6] = 0;
	g_disp[7] = 2;
}
void StateChangeDispoff()
{
	int i = 0;
	for (i=0; i<DIGITS; ++i)
	{
		g_transition[i]=MAX_TRANSITION;
	}
	RtcDateGetBcd();
	g_timer_a_callback = ModeCallbackDispoff;
	g_timer_v_callback = DynamicDispCallbackRandom;
	g_timer_v_callback_time_left = MSEC_TO_TIMERV * 300L;
	g_state_current = &g_state_dispoff;
	g_setting_digit = 8;
	g_disp[0] = DISP_OFF;
	g_disp[1] = DISP_OFF;
	g_disp[2] = DISP_OFF;
	g_disp[3] = DISP_OFF;
	g_disp[4] = DISP_OFF;
	g_disp[5] = DISP_OFF;
	g_disp[6] = DISP_OFF;
	g_disp[7] = DISP_OFF;
}
void StateChangeRandomDisp()
{
	g_timer_v_callback = DynamicDispCallbackRandom;
	g_timer_v_callback_time_left = MSEC_TO_TIMERV * 300L;
}
void StateChangeHourHSet()
{
	RtcDateGetBcd();
	g_timer_a_callback = ModeCallbackClock;
	g_timer_v_callback = DynamicDispCallbackNormal;
	//g_timer_v_callback_time_left = MSEC_TO_TIMERV * 300L;
	g_state_current = &g_state_hour_h_set;
	g_setting_digit = 7;
	g_blink_timer = 0;
}
void StateChangeHourLSet()
{
	RtcDateGetBcd();
	g_timer_a_callback = ModeCallbackClock;
	g_timer_v_callback = DynamicDispCallbackNormal;
	g_state_current = &g_state_hour_l_set;
	g_setting_digit = 6;
	g_blink_timer = 0;
}
void StateChangeMinuteHSet()
{
	RtcDateGetBcd();
	g_timer_a_callback = ModeCallbackClock;
	g_timer_v_callback = DynamicDispCallbackNormal;
	g_state_current = &g_state_minute_h_set;
	g_setting_digit = 4;
	g_blink_timer = 0;
}
void StateChangeMinuteLSet()
{
	RtcDateGetBcd();
	g_timer_a_callback = ModeCallbackClock;
	g_timer_v_callback = DynamicDispCallbackNormal;
	g_state_current = &g_state_minute_l_set;
	g_setting_digit = 3;
	g_blink_timer = 0;
}
void StateChangeSecondHSet()
{
	RtcDateGetBcd();
	g_timer_a_callback = ModeCallbackClock;
	g_timer_v_callback = DynamicDispCallbackNormal;
	g_state_current = &g_state_second_h_set;
	g_setting_digit = 1;
	g_blink_timer = 0;
}
void StateChangeSecondLSet()
{
	RtcDateGetBcd();
	g_timer_a_callback = ModeCallbackClock;
	g_timer_v_callback = DynamicDispCallbackNormal;
	g_state_current = &g_state_second_l_set;
	g_setting_digit = 0;
	g_blink_timer = 0;
}
void StateChangeYearHSet()
{
	RtcDateGetBcd();
	g_timer_a_callback = ModeCallbackCalendar;
	g_timer_v_callback = DynamicDispCallbackNormal;
	g_state_current = &g_state_year_h_set;
	g_setting_digit = 5;
	g_blink_timer = 0;
}
void StateChangeYearLSet()
{
	RtcDateGetBcd();
	g_timer_a_callback = ModeCallbackCalendar;
	g_timer_v_callback = DynamicDispCallbackNormal;
	g_state_current = &g_state_year_l_set;
	g_setting_digit = 4;
	g_blink_timer = 0;
}
void StateChangeMonthHSet()
{
	RtcDateGetBcd();
	g_timer_a_callback = ModeCallbackCalendar;
	g_timer_v_callback = DynamicDispCallbackNormal;
	g_state_current = &g_state_month_h_set;
	g_setting_digit = 3;
	g_blink_timer = 0;
}
void StateChangeMonthLSet()
{
	RtcDateGetBcd();
	g_timer_a_callback = ModeCallbackCalendar;
	g_timer_v_callback = DynamicDispCallbackNormal;
	g_state_current = &g_state_month_l_set;
	g_setting_digit = 2;
	g_blink_timer = 0;
}
void StateChangeDateHSet()
{
	RtcDateGetBcd();
	g_timer_a_callback = ModeCallbackCalendar;
	g_timer_v_callback = DynamicDispCallbackNormal;
	g_state_current = &g_state_date_h_set;
	g_setting_digit = 1;
	g_blink_timer = 0;
}
void StateChangeDateLSet()
{
	RtcDateGetBcd();
	g_timer_a_callback = ModeCallbackCalendar;
	g_timer_v_callback = DynamicDispCallbackNormal;
	g_state_current = &g_state_date_l_set;
	g_setting_digit = 0;
	g_blink_timer = 0;
}


#define SET_HI(c_, val_) (c_=(c_&0x0f)|(val_<<4))
#define SET_LO(c_, val_) (c_=(c_&0xf0)|val_)

void HourHDown()
{
	RtcDateGetBcd();
	HI(g_hour) == 0 ? SET_HI(g_hour, 2) : (g_hour-=0x10);
	RtcDateSetBcd();
	g_blink_timer = BLINK_INTERVAL/2;
}
void HourHUp()
{
	RtcDateGetBcd();
	HI(g_hour) >= 2 ? SET_HI(g_hour, 0) : (g_hour+=0x10);
	RtcDateSetBcd();
	g_blink_timer = BLINK_INTERVAL/2;
}
void HourLDown()
{
	RtcDateGetBcd();
	LO(g_hour) == 0 ? SET_LO(g_hour, 9) : (g_hour-=0x01);
	RtcDateSetBcd();
	g_blink_timer = BLINK_INTERVAL/2;
}
void HourLUp()
{
	RtcDateGetBcd();
	LO(g_hour) >= 9 ? SET_LO(g_hour, 0) : (g_hour+=0x01);
	RtcDateSetBcd();
	g_blink_timer = BLINK_INTERVAL/2;
}
void MinuteHDown()
{
	RtcDateGetBcd();
	HI(g_minute) == 0 ? SET_HI(g_minute, 5) : (g_minute-=0x10);
	RtcDateSetBcd();
	g_blink_timer = BLINK_INTERVAL/2;
}
void MinuteHUp()
{
	RtcDateGetBcd();
	HI(g_minute) >= 5 ? SET_HI(g_minute, 0) : (g_minute+=0x10);
	RtcDateSetBcd();
	g_blink_timer = BLINK_INTERVAL/2;
}
void MinuteLDown()
{
	RtcDateGetBcd();
	LO(g_minute) == 0 ? SET_LO(g_minute, 9) : (g_minute-=0x01);
	RtcDateSetBcd();
	g_blink_timer = BLINK_INTERVAL/2;
}
void MinuteLUp()
{
	RtcDateGetBcd();
	LO(g_minute) >= 9 ? SET_LO(g_minute, 0) : (g_minute+=0x01);
	RtcDateSetBcd();
	g_blink_timer = BLINK_INTERVAL/2;
}
void SecondHDown()
{
	RtcDateGetBcd();
	HI(g_second) == 0 ? SET_HI(g_second, 5) : (g_second-=0x10);
	RtcDateSetBcd();
	g_blink_timer = BLINK_INTERVAL/2;
}
void SecondHUp()
{
	RtcDateGetBcd();
	HI(g_second) >= 5 ? SET_HI(g_second, 0) : (g_second+=0x10);
	RtcDateSetBcd();
	g_blink_timer = BLINK_INTERVAL/2;
}
void SecondLDown()
{
	RtcDateGetBcd();
	LO(g_second) == 0 ? SET_LO(g_second, 9) : (g_second-=0x01);
	RtcDateSetBcd();
	g_blink_timer = BLINK_INTERVAL/2;
}
void SecondLUp()
{
	RtcDateGetBcd();
	LO(g_second) >= 9 ? SET_LO(g_second, 0) : (g_second+=0x01);
	RtcDateSetBcd();
	g_blink_timer = BLINK_INTERVAL/2;
}
void YearHDown()
{
	RtcDateGetBcd();
	HI(g_year) == 0 ? SET_HI(g_year, 9) : (g_year-=0x10);
	RtcDateSetBcd();
	g_blink_timer = BLINK_INTERVAL/2;
}
void YearHUp()
{
	RtcDateGetBcd();
	HI(g_year) >= 9 ? SET_HI(g_year, 0) : (g_year+=0x10);
	RtcDateSetBcd();
	g_blink_timer = BLINK_INTERVAL/2;
}
void YearLDown()
{
	RtcDateGetBcd();
	LO(g_year) == 0 ? SET_LO(g_year, 9) : (g_year-=0x01);
	RtcDateSetBcd();
	g_blink_timer = BLINK_INTERVAL/2;
}
void YearLUp()
{
	RtcDateGetBcd();
	LO(g_year) >= 9 ? SET_LO(g_year, 0) : (g_year+=0x01);
	RtcDateSetBcd();
	g_blink_timer = BLINK_INTERVAL/2;
}
void MonthHDown()
{
	RtcDateGetBcd();
	HI(g_month) == 0 ? SET_HI(g_month, 1) : (g_month-=0x10);
	RtcDateSetBcd();
	g_blink_timer = BLINK_INTERVAL/2;
}
void MonthHUp()
{
	RtcDateGetBcd();
	HI(g_month) >= 1 ? SET_HI(g_month, 0) : (g_month+=0x10);
	RtcDateSetBcd();
	g_blink_timer = BLINK_INTERVAL/2;
}
void MonthLDown()
{
	RtcDateGetBcd();
	LO(g_month) == 0 ? SET_LO(g_month, 9) : (g_month-=0x01);
	RtcDateSetBcd();
	g_blink_timer = BLINK_INTERVAL/2;
}
void MonthLUp()
{
	RtcDateGetBcd();
	LO(g_month) >= 9 ? SET_LO(g_month, 0) : (g_month+=0x01);
	RtcDateSetBcd();
	g_blink_timer = BLINK_INTERVAL/2;
}
void DateHDown()
{
	RtcDateGetBcd();
	HI(g_date) == 0 ? SET_HI(g_date, 3) : (g_date-=0x10);
	RtcDateSetBcd();
	g_blink_timer = BLINK_INTERVAL/2;
}
void DateHUp()
{
	RtcDateGetBcd();
	HI(g_date) >= 3 ? SET_HI(g_date, 0) : (g_date+=0x10);
	RtcDateSetBcd();
	g_blink_timer = BLINK_INTERVAL/2;
}
void DateLDown()
{
	RtcDateGetBcd();
	LO(g_date) == 0 ? SET_LO(g_date, 9) : (g_date-=0x01);
	RtcDateSetBcd();
	g_blink_timer = BLINK_INTERVAL/2;
}
void DateLUp()
{
	RtcDateGetBcd();
	LO(g_date) >= 9 ? SET_LO(g_date, 0) : (g_date+=0x01);
	RtcDateSetBcd();
	g_blink_timer = BLINK_INTERVAL/2;
}




// ���C��
void main(void)
{
	// �\���R�[���o�b�N��ݒ�
	g_timer_v_callback = DynamicDispCallbackRandom;
	g_timer_a_callback = ModeCallbackClock;
	g_timer_v_callback_time_left = MSEC_TO_TIMERV * 2000L;

	// �}�C�R����������
	InitH8();
	ChangeDigit(DIGITS_OFF_ALL, DISP_OFF);

	RtcInit();
	//RtcDateSetBcd();
	RtcDateGetBcd();

	// �X�e�[�g�}�V����������
	//�ŏ��͎��v�X�e�[�g
	g_state_clock.on_button0		= StateChangeDispoff;
	g_state_clock.on_button1		= StateChangeCalendar;
	g_state_clock.on_button2		= StateChangeHourHSet;
	g_state_hour_h_set.on_button0	= HourHDown;
	g_state_hour_h_set.on_button1	= HourHUp;
	g_state_hour_h_set.on_button2	= StateChangeHourLSet;
	g_state_hour_l_set.on_button0	= HourLDown;
	g_state_hour_l_set.on_button1	= HourLUp;
	g_state_hour_l_set.on_button2	= StateChangeMinuteHSet;
	g_state_minute_h_set.on_button0 = MinuteHDown;
	g_state_minute_h_set.on_button1 = MinuteHUp;
	g_state_minute_h_set.on_button2 = StateChangeMinuteLSet;
	g_state_minute_l_set.on_button0 = MinuteLDown;
	g_state_minute_l_set.on_button1 = MinuteLUp;
	g_state_minute_l_set.on_button2 = StateChangeSecondHSet;
	g_state_second_h_set.on_button0 = SecondHDown;
	g_state_second_h_set.on_button1 = SecondHUp;
	g_state_second_h_set.on_button2 = StateChangeSecondLSet;
	g_state_second_l_set.on_button0 = SecondLDown;
	g_state_second_l_set.on_button1 = SecondLUp;
	g_state_second_l_set.on_button2 = StateChangeClock;
	g_state_calendar.on_button0		= StateChangeClock;
	g_state_calendar.on_button1		= StateChangeDispoff;
	g_state_calendar.on_button2		= StateChangeYearHSet;
	g_state_year_h_set.on_button0	= YearHDown;
	g_state_year_h_set.on_button1	= YearHUp;
	g_state_year_h_set.on_button2	= StateChangeYearLSet;
	g_state_year_l_set.on_button0	= YearLDown;
	g_state_year_l_set.on_button1	= YearLUp;
	g_state_year_l_set.on_button2	= StateChangeMonthHSet;
	g_state_month_h_set.on_button0	= MonthHDown;
	g_state_month_h_set.on_button1	= MonthHUp;
	g_state_month_h_set.on_button2	= StateChangeMonthLSet;
	g_state_month_l_set.on_button0	= MonthLDown;
	g_state_month_l_set.on_button1	= MonthLUp;
	g_state_month_l_set.on_button2	= StateChangeDateHSet;
	g_state_date_h_set.on_button0	= DateHDown;
	g_state_date_h_set.on_button1	= DateHUp;
	g_state_date_h_set.on_button2	= StateChangeDateLSet;
	g_state_date_l_set.on_button0	= DateLDown;
	g_state_date_l_set.on_button1	= DateLUp;
	g_state_date_l_set.on_button2	= StateChangeCalendar;
	g_state_dispoff.on_button0		= StateChangeCalendar;
	g_state_dispoff.on_button1		= StateChangeClock;
	g_state_dispoff.on_button2		= StateChangeRandomDisp;
	StateChangeClock();
	
	EI; //?
	
	//main loop
	{
		// �X�e�[�g
		static int prev_button0_pressed = 0;
		static int prev_button1_pressed = 0;
		static int prev_button2_pressed = 0;
		while (1)
		{
			// �{�^���P
			if (IO.PDR1.BIT.B1 == 0)
			{	
				if ((g_state_current->on_button0 != NULL)
				&&	(prev_button0_pressed == 0))
				{
					(*(g_state_current->on_button0))();
				}
				
				prev_button0_pressed = 1;
			}
			else
			{
				prev_button0_pressed = 0;
			}
			
			// �{�^���Q
			if (IO.PDR1.BIT.B2 == 0)
			{	
				if ((g_state_current->on_button1 != NULL)
				&&	(prev_button1_pressed == 0))
				{
					(*(g_state_current->on_button1))();
				}
				
				prev_button1_pressed = 1;
			}
			else
			{
				prev_button1_pressed = 0;
			}
					
			// �{�^���R
			if (IO.PDR1.BIT.B4 == 0)
			{	
				if ((g_state_current->on_button2 != NULL)
				&&	(prev_button2_pressed == 0))
				{
					(*(g_state_current->on_button2))();
				}
				
				prev_button2_pressed = 1;
			}
			else
			{
				prev_button2_pressed = 0;
			}

			//�`���^�����O�h�~
			wait_msec(20);
		}
	}
}
