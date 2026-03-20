
main.elf:     file format elf32-littleriscv


Disassembly of section .vectors:

00000000 <__vector_start>:

.section .vectors, "ax"
.option norvc
vector_table:
	//  0 : exception Handler and user software interrupt
	j handler_exception
   0:	5a50006f          	j	da4 <handler_exception>
	//  1 : supervisor software interrupt
	j __no_irq_handler
   4:	20c0006f          	j	210 <__no_irq_handler>
	//  2 : unmapped
	j __no_irq_handler
   8:	2080006f          	j	210 <__no_irq_handler>
	//  3 : machine software interrupt handler
	j handler_irq_software
   c:	6110006f          	j	e1c <handler_irq_software>
	//  4 : user timer interrupt
	j __no_irq_handler
  10:	2000006f          	j	210 <__no_irq_handler>
	//  5 : supervisor timer interrupt
	j __no_irq_handler
  14:	1fc0006f          	j	210 <__no_irq_handler>
	//  6 : unmapped
	j __no_irq_handler
  18:	1f80006f          	j	210 <__no_irq_handler>
	//  7 : machine timer interrupt handler
	j handler_irq_timer
  1c:	6310006f          	j	e4c <handler_irq_timer>
	//  8 : user external interrupt
	j __no_irq_handler
  20:	1f00006f          	j	210 <__no_irq_handler>
	//  9 : supervisor external interrupt
	j __no_irq_handler
  24:	1ec0006f          	j	210 <__no_irq_handler>
	// 10 : unmapped
	j __no_irq_handler
  28:	1e80006f          	j	210 <__no_irq_handler>
	// 11 : machine external interrupt handler
	j handler_irq_external
  2c:	05d0006f          	j	888 <handler_irq_external>
	// 12 : unmapped
	j __no_irq_handler
  30:	1e00006f          	j	210 <__no_irq_handler>
	// 13 : unmapped
	j __no_irq_handler
  34:	1dc0006f          	j	210 <__no_irq_handler>
	// 14 : unmapped
	j __no_irq_handler
  38:	1d80006f          	j	210 <__no_irq_handler>
	// 15 : unmapped
	j __no_irq_handler
  3c:	1d40006f          	j	210 <__no_irq_handler>
	// 16 : fast interrupt - timer_1
	j handler_irq_fast_timer_1
  40:	45d0006f          	j	c9c <handler_irq_fast_timer_1>
	// 17 : fast interrupt - timer_2
	j handler_irq_fast_timer_2
  44:	4010006f          	j	c44 <handler_irq_fast_timer_2>
	// 18 : fast interrupt - timer_3
	j handler_irq_fast_timer_3
  48:	3a50006f          	j	bec <handler_irq_fast_timer_3>
	// 19 : fast interrupt - dma_done
	j handler_irq_fast_dma_done
  4c:	4a90006f          	j	cf4 <handler_irq_fast_dma_done>
	// 20 : fast interrupt - spi
	j handler_irq_fast_spi
  50:	7f50006f          	j	1044 <handler_irq_fast_spi>
	// 21 : fast interrupt - spi_flash
	j handler_irq_fast_spi_flash
  54:	71d0006f          	j	f70 <handler_irq_fast_spi_flash>
	// 22 : fast interrupt - gpio_0
	j handler_irq_fast_gpio_0
  58:	2e50006f          	j	b3c <handler_irq_fast_gpio_0>
	// 23 : fast interrupt - gpio_1
	j handler_irq_fast_gpio_1
  5c:	28d0006f          	j	ae8 <handler_irq_fast_gpio_1>
	// 24 : fast interrupt - gpio_2
	j handler_irq_fast_gpio_2
  60:	2350006f          	j	a94 <handler_irq_fast_gpio_2>
	// 25 : fast interrupt - gpio_3
	j handler_irq_fast_gpio_3
  64:	1dd0006f          	j	a40 <handler_irq_fast_gpio_3>
	// 26 : fast interrupt - gpio_4
	j handler_irq_fast_gpio_4
  68:	1850006f          	j	9ec <handler_irq_fast_gpio_4>
	// 27 : fast interrupt - gpio_5
	j handler_irq_fast_gpio_5
  6c:	1290006f          	j	994 <handler_irq_fast_gpio_5>
	// 28 : fast interrupt - gpio_6
	j handler_irq_fast_gpio_6
  70:	0d10006f          	j	940 <handler_irq_fast_gpio_6>
	// 29 : fast interrupt - gpio_7
	j handler_irq_fast_gpio_7
  74:	0790006f          	j	8ec <handler_irq_fast_gpio_7>
	// 30 : fast interrupt - dma_window
	j handler_irq_fast_dma_window
  78:	4d50006f          	j	d4c <handler_irq_fast_dma_window>
	// 31 : fast interrupt - external peripheral
	j handler_irq_fast_external_peripheral
  7c:	3190006f          	j	b94 <handler_irq_fast_external_peripheral>

Disassembly of section .init:

00000180 <_start>:

_start:
/* initialize global pointer */
.option push
.option norelax
1: auipc gp, %pcrel_hi(__global_pointer$)
 180:	0000b197          	auipc	gp,0xb
   addi  gp, gp, %pcrel_lo(1b)
 184:	74018193          	addi	gp,gp,1856 # b8c0 <__global_pointer$>
.option pop

/* initialize stack pointer */
   la sp, _sp
 188:	0000c117          	auipc	sp,0xc
 18c:	2c810113          	addi	sp,sp,712 # c450 <_sp>

/* set the frequency */
   li a0, SOC_CTRL_START_ADDRESS
 190:	20000537          	lui	a0,0x20000
   li a2, REFERENCE_CLOCK_Hz
 194:	05f5e637          	lui	a2,0x5f5e
 198:	10060613          	addi	a2,a2,256 # 5f5e100 <_sp+0x5f51cb0>
   sw a2, SOC_CTRL_SYSTEM_FREQUENCY_HZ_REG_OFFSET(a0)
 19c:	cd50                	sw	a2,28(a0)

0000019e <_init_bss>:

#endif

/* clear the bss segment */
_init_bss:
    la     a0, __bss_start
 19e:	0000b517          	auipc	a0,0xb
 1a2:	05a50513          	addi	a0,a0,90 # b1f8 <__stdio_exit_handler>
    la     a2, __bss_end
 1a6:	0000b617          	auipc	a2,0xb
 1aa:	2a660613          	addi	a2,a2,678 # b44c <__BSS_END__>
    sub    a2, a2, a0
 1ae:	8e09                	sub	a2,a2,a0
    li     a1, 0
 1b0:	4581                	li	a1,0
    call   memset
 1b2:	210010ef          	jal	13c2 <memset>
    blt a1, a2, loop_init_data
    end_init_data:
#endif

/* set vector table address and vectored mode */
    la a0, __vector_start
 1b6:	00000517          	auipc	a0,0x0
 1ba:	e4a50513          	addi	a0,a0,-438 # 0 <__vector_start>
    ori a0, a0, 0x1
 1be:	00156513          	ori	a0,a0,1
    csrw mtvec, a0
 1c2:	30551073          	csrw	mtvec,a0

/* new-style constructors and destructors */
    la a0, __libc_fini_array
 1c6:	00001517          	auipc	a0,0x1
 1ca:	1ca50513          	addi	a0,a0,458 # 1390 <__libc_fini_array>
    call atexit
 1ce:	6cb000ef          	jal	1098 <atexit>
    call __libc_init_array
 1d2:	168010ef          	jal	133a <__libc_init_array>

/* call main */
    lw a0, 0(sp)                    /* a0 = argc */
 1d6:	4502                	lw	a0,0(sp)
    addi a1, sp, __SIZEOF_POINTER__ /* a1 = argv */
 1d8:	004c                	addi	a1,sp,4
    li a2, 0                        /* a2 = envp = NULL */
 1da:	4601                	li	a2,0
    call main
 1dc:	042020ef          	jal	221e <main>
    tail exit
 1e0:	00c0006f          	j	1ec <exit>

000001e4 <_init>:
.global _init
.type   _init, @function
.global _fini
.type   _fini, @function
_init:
    call init
 1e4:	497000ef          	jal	e7a <init>

000001e8 <_fini>:
_fini:
 /* These don't have to do anything since we use init_array/fini_array. Prevent
    missing symbol error */
    ret
 1e8:	8082                	ret

Disassembly of section .text:

000001ec <exit>:
     1ec:	1141                	addi	sp,sp,-16
     1ee:	6785                	lui	a5,0x1
     1f0:	c422                	sw	s0,8(sp)
     1f2:	c606                	sw	ra,12(sp)
     1f4:	44678793          	addi	a5,a5,1094 # 1446 <__call_exitprocs>
     1f8:	842a                	mv	s0,a0
     1fa:	c781                	beqz	a5,202 <exit+0x16>
     1fc:	4581                	li	a1,0
     1fe:	248010ef          	jal	1446 <__call_exitprocs>
     202:	9381a783          	lw	a5,-1736(gp) # b1f8 <__stdio_exit_handler>
     206:	c391                	beqz	a5,20a <exit+0x1e>
     208:	9782                	jalr	a5
     20a:	8522                	mv	a0,s0
     20c:	477000ef          	jal	e82 <_exit>

00000210 <__no_irq_handler>:
	This will not print an error message in case of not finding
	the proper handler to manage an interrupt.
	la a0, no_exception_handler_msg
	jal ra, puts
	*/
	j __no_irq_handler
     210:	0000006f          	j	210 <__no_irq_handler>

00000214 <fic_irq_dma_window>:
/*                           EXPORTED FUNCTIONS                             */
/**                                                                        **/
/****************************************************************************/

void fic_irq_dma_window(void)
{
     214:	1101                	addi	sp,sp,-32
     216:	ce06                	sw	ra,28(sp)
     218:	cc22                	sw	s0,24(sp)
     21a:	1000                	addi	s0,sp,32
     * Find out which channel raised the interrupt and call
     * either the weak implementation provided in this module,
     * or the non-weak implementation.
     */

    for (int i = 0; i < DMA_CH_NUM; i++)
     21c:	fe042623          	sw	zero,-20(s0)
     220:	a815                	j	254 <fic_irq_dma_window+0x40>
    {
        if (dma_subsys_per[i].peri->WINDOW_IFR == 1)
     222:	95c18693          	addi	a3,gp,-1700 # b21c <dma_subsys_per>
     226:	fec42703          	lw	a4,-20(s0)
     22a:	87ba                	mv	a5,a4
     22c:	0786                	slli	a5,a5,0x1
     22e:	97ba                	add	a5,a5,a4
     230:	078a                	slli	a5,a5,0x2
     232:	97b6                	add	a5,a5,a3
     234:	479c                	lw	a5,8(a5)
     236:	57b8                	lw	a4,104(a5)
     238:	4785                	li	a5,1
     23a:	00f71863          	bne	a4,a5,24a <fic_irq_dma_window+0x36>
        {
            dma_intr_handler_window_done(i);
     23e:	fec42783          	lw	a5,-20(s0)
     242:	0ff7f793          	zext.b	a5,a5
     246:	853e                	mv	a0,a5
     248:	2055                	jal	2ec <dma_intr_handler_window_done>
    for (int i = 0; i < DMA_CH_NUM; i++)
     24a:	fec42783          	lw	a5,-20(s0)
     24e:	0785                	addi	a5,a5,1
     250:	fef42623          	sw	a5,-20(s0)
     254:	fec42703          	lw	a4,-20(s0)
     258:	478d                	li	a5,3
     25a:	fce7d4e3          	bge	a5,a4,222 <fic_irq_dma_window+0xe>
            #endif

            #endif
        }
    }
    return;
     25e:	0001                	nop
}
     260:	40f2                	lw	ra,28(sp)
     262:	4462                	lw	s0,24(sp)
     264:	6105                	addi	sp,sp,32
     266:	8082                	ret

00000268 <fic_irq_dma_done>:

void fic_irq_dma_done(void)
{
     268:	1101                	addi	sp,sp,-32
     26a:	ce06                	sw	ra,28(sp)
     26c:	cc22                	sw	s0,24(sp)
     26e:	1000                	addi	s0,sp,32
     * Find out which channel raised the interrupt and call
     * either the weak implementation provided in this module,
     * or the non-weak implementation.
     */
    
    for (int i = 0; i < DMA_CH_NUM; i++)
     270:	fe042623          	sw	zero,-20(s0)
     274:	a0b1                	j	2c0 <fic_irq_dma_done+0x58>
    {
        if (dma_subsys_per[i].peri->TRANSACTION_IFR == 1)
     276:	95c18693          	addi	a3,gp,-1700 # b21c <dma_subsys_per>
     27a:	fec42703          	lw	a4,-20(s0)
     27e:	87ba                	mv	a5,a4
     280:	0786                	slli	a5,a5,0x1
     282:	97ba                	add	a5,a5,a4
     284:	078a                	slli	a5,a5,0x2
     286:	97b6                	add	a5,a5,a3
     288:	479c                	lw	a5,8(a5)
     28a:	53f8                	lw	a4,100(a5)
     28c:	4785                	li	a5,1
     28e:	02f71463          	bne	a4,a5,2b6 <fic_irq_dma_done+0x4e>
        {
            dma_subsys_per[i].intrFlag = 1;
     292:	95c18693          	addi	a3,gp,-1700 # b21c <dma_subsys_per>
     296:	fec42703          	lw	a4,-20(s0)
     29a:	87ba                	mv	a5,a4
     29c:	0786                	slli	a5,a5,0x1
     29e:	97ba                	add	a5,a5,a4
     2a0:	078a                	slli	a5,a5,0x2
     2a2:	97b6                	add	a5,a5,a3
     2a4:	4705                	li	a4,1
     2a6:	00e78223          	sb	a4,4(a5)
            dma_intr_handler_trans_done(i);
     2aa:	fec42783          	lw	a5,-20(s0)
     2ae:	0ff7f793          	zext.b	a5,a5
     2b2:	853e                	mv	a0,a5
     2b4:	2005                	jal	2d4 <dma_intr_handler_trans_done>
    for (int i = 0; i < DMA_CH_NUM; i++)
     2b6:	fec42783          	lw	a5,-20(s0)
     2ba:	0785                	addi	a5,a5,1
     2bc:	fef42623          	sw	a5,-20(s0)
     2c0:	fec42703          	lw	a4,-20(s0)
     2c4:	478d                	li	a5,3
     2c6:	fae7d8e3          	bge	a5,a4,276 <fic_irq_dma_done+0xe>
            #endif

            #endif
        }
    }
    return;
     2ca:	0001                	nop
}
     2cc:	40f2                	lw	ra,28(sp)
     2ce:	4462                	lw	s0,24(sp)
     2d0:	6105                	addi	sp,sp,32
     2d2:	8082                	ret

000002d4 <dma_intr_handler_trans_done>:
    dma_subsys_per[channel].peri->MODE = DMA_TRANS_MODE_SINGLE;
}


__attribute__((weak, optimize("O0"))) void dma_intr_handler_trans_done(uint8_t channel)
{
     2d4:	1101                	addi	sp,sp,-32
     2d6:	ce06                	sw	ra,28(sp)
     2d8:	cc22                	sw	s0,24(sp)
     2da:	1000                	addi	s0,sp,32
     2dc:	87aa                	mv	a5,a0
     2de:	fef407a3          	sb	a5,-17(s0)
     * This is a weak implementation.
     * Create your own function called
     * void dma_intr_handler_trans_done()
     * to override this one.
     */
}
     2e2:	0001                	nop
     2e4:	40f2                	lw	ra,28(sp)
     2e6:	4462                	lw	s0,24(sp)
     2e8:	6105                	addi	sp,sp,32
     2ea:	8082                	ret

000002ec <dma_intr_handler_window_done>:

__attribute__((weak, optimize("O0"))) void dma_intr_handler_window_done(uint8_t channel)
{
     2ec:	1101                	addi	sp,sp,-32
     2ee:	ce06                	sw	ra,28(sp)
     2f0:	cc22                	sw	s0,24(sp)
     2f2:	1000                	addi	s0,sp,32
     2f4:	87aa                	mv	a5,a0
     2f6:	fef407a3          	sb	a5,-17(s0)
     * This is a weak implementation.
     * Create your own function called
     * void dma_intr_handler_window_done()
     * to override this one.
     */
}
     2fa:	0001                	nop
     2fc:	40f2                	lw	ra,28(sp)
     2fe:	4462                	lw	s0,24(sp)
     300:	6105                	addi	sp,sp,32
     302:	8082                	ret

00000304 <fic_irq_timer_1>:
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    return kFastIntrCtrlOk_e;
}

__attribute__((weak, optimize("O0"))) void fic_irq_timer_1(void)
{
     304:	1141                	addi	sp,sp,-16
     306:	c606                	sw	ra,12(sp)
     308:	c422                	sw	s0,8(sp)
     30a:	0800                	addi	s0,sp,16
    /* Users should implement their non-weak version */
}
     30c:	0001                	nop
     30e:	40b2                	lw	ra,12(sp)
     310:	4422                	lw	s0,8(sp)
     312:	0141                	addi	sp,sp,16
     314:	8082                	ret

00000316 <fic_irq_timer_2>:

__attribute__((weak, optimize("O0"))) void fic_irq_timer_2(void)
{
     316:	1141                	addi	sp,sp,-16
     318:	c606                	sw	ra,12(sp)
     31a:	c422                	sw	s0,8(sp)
     31c:	0800                	addi	s0,sp,16
    /* Users should implement their non-weak version */
}
     31e:	0001                	nop
     320:	40b2                	lw	ra,12(sp)
     322:	4422                	lw	s0,8(sp)
     324:	0141                	addi	sp,sp,16
     326:	8082                	ret

00000328 <fic_irq_timer_3>:

__attribute__((weak, optimize("O0"))) void fic_irq_timer_3(void)
{
     328:	1141                	addi	sp,sp,-16
     32a:	c606                	sw	ra,12(sp)
     32c:	c422                	sw	s0,8(sp)
     32e:	0800                	addi	s0,sp,16
    /* Users should implement their non-weak version */
}
     330:	0001                	nop
     332:	40b2                	lw	ra,12(sp)
     334:	4422                	lw	s0,8(sp)
     336:	0141                	addi	sp,sp,16
     338:	8082                	ret

0000033a <fic_irq_ext_peripheral>:
{
    /* Users should implement their non-weak version */
}

__attribute__((weak, optimize("O0"))) void fic_irq_ext_peripheral(void)
{
     33a:	1141                	addi	sp,sp,-16
     33c:	c606                	sw	ra,12(sp)
     33e:	c422                	sw	s0,8(sp)
     340:	0800                	addi	s0,sp,16
    /* Users should implement their non-weak version */
}
     342:	0001                	nop
     344:	40b2                	lw	ra,12(sp)
     346:	4422                	lw	s0,8(sp)
     348:	0141                	addi	sp,sp,16
     34a:	8082                	ret

0000034c <fic_irq_gpio_0>:
{
    /* Users should implement their non-weak version */
}

__attribute__((weak, optimize("O0"))) void fic_irq_gpio_0(void)
{
     34c:	1141                	addi	sp,sp,-16
     34e:	c606                	sw	ra,12(sp)
     350:	c422                	sw	s0,8(sp)
     352:	0800                	addi	s0,sp,16
    /* Users should implement their non-weak version */
}
     354:	0001                	nop
     356:	40b2                	lw	ra,12(sp)
     358:	4422                	lw	s0,8(sp)
     35a:	0141                	addi	sp,sp,16
     35c:	8082                	ret

0000035e <fic_irq_gpio_1>:

__attribute__((weak, optimize("O0"))) void fic_irq_gpio_1(void)
{
     35e:	1141                	addi	sp,sp,-16
     360:	c606                	sw	ra,12(sp)
     362:	c422                	sw	s0,8(sp)
     364:	0800                	addi	s0,sp,16
    /* Users should implement their non-weak version */
}
     366:	0001                	nop
     368:	40b2                	lw	ra,12(sp)
     36a:	4422                	lw	s0,8(sp)
     36c:	0141                	addi	sp,sp,16
     36e:	8082                	ret

00000370 <fic_irq_gpio_2>:

__attribute__((weak, optimize("O0"))) void fic_irq_gpio_2(void)
{
     370:	1141                	addi	sp,sp,-16
     372:	c606                	sw	ra,12(sp)
     374:	c422                	sw	s0,8(sp)
     376:	0800                	addi	s0,sp,16
    /* Users should implement their non-weak version */
}
     378:	0001                	nop
     37a:	40b2                	lw	ra,12(sp)
     37c:	4422                	lw	s0,8(sp)
     37e:	0141                	addi	sp,sp,16
     380:	8082                	ret

00000382 <fic_irq_gpio_3>:

__attribute__((weak, optimize("O0"))) void fic_irq_gpio_3(void)
{
     382:	1141                	addi	sp,sp,-16
     384:	c606                	sw	ra,12(sp)
     386:	c422                	sw	s0,8(sp)
     388:	0800                	addi	s0,sp,16
    /* Users should implement their non-weak version */
}
     38a:	0001                	nop
     38c:	40b2                	lw	ra,12(sp)
     38e:	4422                	lw	s0,8(sp)
     390:	0141                	addi	sp,sp,16
     392:	8082                	ret

00000394 <fic_irq_gpio_4>:

__attribute__((weak, optimize("O0"))) void fic_irq_gpio_4(void)
{
     394:	1141                	addi	sp,sp,-16
     396:	c606                	sw	ra,12(sp)
     398:	c422                	sw	s0,8(sp)
     39a:	0800                	addi	s0,sp,16
    /* Users should implement their non-weak version */
}
     39c:	0001                	nop
     39e:	40b2                	lw	ra,12(sp)
     3a0:	4422                	lw	s0,8(sp)
     3a2:	0141                	addi	sp,sp,16
     3a4:	8082                	ret

000003a6 <fic_irq_gpio_5>:

__attribute__((weak, optimize("O0"))) void fic_irq_gpio_5(void)
{
     3a6:	1141                	addi	sp,sp,-16
     3a8:	c606                	sw	ra,12(sp)
     3aa:	c422                	sw	s0,8(sp)
     3ac:	0800                	addi	s0,sp,16
    /* Users should implement their non-weak version */
}
     3ae:	0001                	nop
     3b0:	40b2                	lw	ra,12(sp)
     3b2:	4422                	lw	s0,8(sp)
     3b4:	0141                	addi	sp,sp,16
     3b6:	8082                	ret

000003b8 <fic_irq_gpio_6>:

__attribute__((weak, optimize("O0"))) void fic_irq_gpio_6(void)
{
     3b8:	1141                	addi	sp,sp,-16
     3ba:	c606                	sw	ra,12(sp)
     3bc:	c422                	sw	s0,8(sp)
     3be:	0800                	addi	s0,sp,16
    /* Users should implement their non-weak version */
}
     3c0:	0001                	nop
     3c2:	40b2                	lw	ra,12(sp)
     3c4:	4422                	lw	s0,8(sp)
     3c6:	0141                	addi	sp,sp,16
     3c8:	8082                	ret

000003ca <fic_irq_gpio_7>:

__attribute__((weak, optimize("O0"))) void fic_irq_gpio_7(void)
{
     3ca:	1141                	addi	sp,sp,-16
     3cc:	c606                	sw	ra,12(sp)
     3ce:	c422                	sw	s0,8(sp)
     3d0:	0800                	addi	s0,sp,16
    /* Users should implement their non-weak version */
}
     3d2:	0001                	nop
     3d4:	40b2                	lw	ra,12(sp)
     3d6:	4422                	lw	s0,8(sp)
     3d8:	0141                	addi	sp,sp,16
     3da:	8082                	ret

000003dc <spi_get_events>:
/**                                                                        **/
/*                            LOCAL FUNCTIONS                               */
/**                                                                        **/
/****************************************************************************/

spi_return_flags_e spi_get_events(spi_host_t* spi, spi_event_e* events) {
     3dc:	1141                	addi	sp,sp,-16
 */
static inline __attribute__((always_inline)) 
const volatile spi_status_t spi_get_status(spi_host_t* spi)
{
    spi_status_t status;
    status.value = SPI_HW(spi)->STATUS; // Assuming SPI_HW(spi)->STATUS returns a uint32_t value representing the status
     3de:	495c                	lw	a5,20(a0)
    return status;
     3e0:	c63e                	sw	a5,12(sp)
    volatile spi_status_t status = spi_get_status(spi);
    // Also, we do not need any NULL check since this function is made to be called
    // __ONLY__ from `handler_irq_spi`, `fic_irq_spi`, `fic_irq_spi_flash`.
    // Therefore we know that spi argument will not be NULL.
    *events = bitfield_write(*events, BIT_MASK_1, 
                             SPI_HOST_EVENT_ENABLE_RXFULL_BIT,  status.rxfull);
     3e2:	46b2                	lw	a3,12(sp)
     3e4:	82e5                	srli	a3,a3,0x19
     3e6:	8a85                	andi	a3,a3,1
static inline uint32_t bitfield_write(uint32_t bitfield,
                                       uint32_t mask, 
                                       uint32_t index,
                                       uint32_t value) 
{
  bitfield &= ~(mask << index);
     3e8:	419c                	lw	a5,0(a1)
    *events = bitfield_write(*events, BIT_MASK_1, 
                             SPI_HOST_EVENT_ENABLE_TXEMPTY_BIT, status.txempty);
     3ea:	4732                	lw	a4,12(sp)
     3ec:	836d                	srli	a4,a4,0x1b
  bitfield |= (value & mask) << index;
     3ee:	9bf1                	andi	a5,a5,-4
  bitfield &= ~(mask << index);
     3f0:	8fd5                	or	a5,a5,a3
    *events = bitfield_write(*events, BIT_MASK_1, 
                             SPI_HOST_EVENT_ENABLE_RXWM_BIT,    status.rxwm);
     3f2:	46b2                	lw	a3,12(sp)
     3f4:	82c9                	srli	a3,a3,0x12
  bitfield |= (value & mask) << index;
     3f6:	8b09                	andi	a4,a4,2
     3f8:	8f5d                	or	a4,a4,a5
    *events = bitfield_write(*events, BIT_MASK_1, 
                             SPI_HOST_EVENT_ENABLE_TXWM_BIT,    status.txwm);
     3fa:	47b2                	lw	a5,12(sp)
     3fc:	83dd                	srli	a5,a5,0x17
     3fe:	8a91                	andi	a3,a3,4
     400:	9b4d                	andi	a4,a4,-13
  bitfield &= ~(mask << index);
     402:	8f55                	or	a4,a4,a3
    *events = bitfield_write(*events, BIT_MASK_1, 
                             SPI_HOST_EVENT_ENABLE_READY_BIT,   status.ready);
     404:	46b2                	lw	a3,12(sp)
     406:	82fd                	srli	a3,a3,0x1f
  bitfield |= (value & mask) << index;
     408:	8ba1                	andi	a5,a5,8
     40a:	8fd9                	or	a5,a5,a4
    *events = bitfield_write(*events, BIT_MASK_1, 
                             SPI_HOST_EVENT_ENABLE_IDLE_BIT,   ~status.active);
     40c:	4732                	lw	a4,12(sp)
     40e:	8379                	srli	a4,a4,0x1e
     410:	0692                	slli	a3,a3,0x4
     412:	fcf7f793          	andi	a5,a5,-49
  bitfield &= ~(mask << index);
     416:	8fd5                	or	a5,a5,a3
  bitfield |= (value & mask) << index;
     418:	0716                	slli	a4,a4,0x5
     41a:	02000693          	li	a3,32
     41e:	40e6f733          	andn	a4,a3,a4
     422:	8fd9                	or	a5,a5,a4
    *events = bitfield_write(*events, BIT_MASK_1, 
     424:	c19c                	sw	a5,0(a1)
    return SPI_FLAG_OK;
}
     426:	4501                	li	a0,0
     428:	0141                	addi	sp,sp,16
     42a:	8082                	ret

0000042c <_write>:
    return -1;
}

int _write(int file, const void *ptr, int len)
{
    if (file != STDOUT_FILENO) {
     42c:	4785                	li	a5,1
     42e:	04f51c63          	bne	a0,a5,486 <_write+0x5a>
 * @param offset the offset to read at, in bytes.
 * @return the read value.
 */
MMIO_WARN_UNUSED_RESULT
static inline uint32_t mmio_region_read32(mmio_region_t base, ptrdiff_t offset) {
  return ((volatile uint32_t *)base.base)[offset / sizeof(uint32_t)];
     432:	200007b7          	lui	a5,0x20000
     436:	4fdc                	lw	a5,28(a5)
system_error_t uart_init(const uart_t *uart) {
  if (uart == NULL) {
    return kErrorUartInvalidArgument;
  }

  if (uart->baudrate == 0 || uart->clk_freq_hz == 0) {
     438:	cfa9                	beqz	a5,492 <_write+0x66>
 * @param offset the offset to write at, in bytes.
 * @param value the value to write.
 */
static inline void mmio_region_write32(mmio_region_t base, ptrdiff_t offset,
                                uint32_t value) {
  ((volatile uint32_t *)base.base)[offset / sizeof(uint32_t)] = value;
     43a:	300807b7          	lui	a5,0x30080
     43e:	0007a623          	sw	zero,12(a5) # 3008000c <_sp+0x30073bbc>
     442:	470d                	li	a4,3
     444:	cfd8                	sw	a4,28(a5)
     446:	0207a223          	sw	zero,36(a5)
     44a:	0207a623          	sw	zero,44(a5)
     44e:	0007a223          	sw	zero,4(a5)
     452:	577d                	li	a4,-1
     454:	c398                	sw	a4,0(a5)
     456:	0a7c0737          	lui	a4,0xa7c0
     45a:	070d                	addi	a4,a4,3 # a7c0003 <_sp+0xa7b3bb3>
     45c:	c7d8                	sw	a4,12(a5)
     45e:	0007a223          	sw	zero,4(a5)
/**
 * Write `len` bytes to the UART TX FIFO.
 */
size_t uart_write(const uart_t *uart, const uint8_t *data, size_t len) {
  size_t total = len;
  while (len) {
     462:	c205                	beqz	a2,482 <_write+0x56>
     464:	00c58833          	add	a6,a1,a2
  return ((volatile uint32_t *)base.base)[offset / sizeof(uint32_t)];
     468:	873e                	mv	a4,a5
    uart_putchar(uart, *data);
     46a:	0005c683          	lbu	a3,0(a1)
     46e:	4b1c                	lw	a5,16(a4)
  while (uart_tx_full(uart)) {
     470:	8b85                	andi	a5,a5,1
     472:	fff5                	bnez	a5,46e <_write+0x42>
  ((volatile uint32_t *)base.base)[offset / sizeof(uint32_t)] = value;
     474:	cf14                	sw	a3,24(a4)
  return ((volatile uint32_t *)base.base)[offset / sizeof(uint32_t)];
     476:	4b1c                	lw	a5,16(a4)
  while (!uart_tx_idle(uart)) {
     478:	8ba1                	andi	a5,a5,8
     47a:	dff5                	beqz	a5,476 <_write+0x4a>
    data++;
     47c:	0585                	addi	a1,a1,1
  while (len) {
     47e:	ff0596e3          	bne	a1,a6,46a <_write+0x3e>
        errno = ENOSYS;
        return -1;
    }
    return uart_write(&uart,(uint8_t *)ptr,len);

}
     482:	8532                	mv	a0,a2
     484:	8082                	ret
        errno = ENOSYS;
     486:	05800713          	li	a4,88
     48a:	92e1ae23          	sw	a4,-1732(gp) # b1fc <errno>
        return -1;
     48e:	567d                	li	a2,-1
     490:	bfcd                	j	482 <_write+0x56>
        errno = ENOSYS;
     492:	05800713          	li	a4,88
     496:	92e1ae23          	sw	a4,-1732(gp) # b1fc <errno>
        return -1;
     49a:	567d                	li	a2,-1
     49c:	b7dd                	j	482 <_write+0x56>

0000049e <spi_empty_rx>:
    }
    return false;
}

bool spi_empty_rx(spi_peripheral_t* peri) 
{
     49e:	872a                	mv	a4,a0
    // If we have a RX buffer and didn't exceed the count then read from RX FIFO
    if (peri->txn.rxbuffer != NULL && peri->rxcnt < peri->txn.rxlen) {
     4a0:	515c                	lw	a5,36(a0)
     4a2:	cf8d                	beqz	a5,4dc <spi_empty_rx+0x3e>
     4a4:	595c                	lw	a5,52(a0)
     4a6:	5514                	lw	a3,40(a0)
            peri->rxcnt < peri->txn.rxlen 
            && !spi_read_word(peri->instance, &peri->txn.rxbuffer[peri->rxcnt])
        ) peri->rxcnt++; // Keep track of counter
        return true;
    }
    return false;
     4a8:	4501                	li	a0,0
    if (peri->txn.rxbuffer != NULL && peri->rxcnt < peri->txn.rxlen) {
     4aa:	00d7ee63          	bltu	a5,a3,4c6 <spi_empty_rx+0x28>
}
     4ae:	8082                	ret
    *dst = SPI_HW(spi)->RXDATA;
     4b0:	5614                	lw	a3,40(a2)
     4b2:	5350                	lw	a2,36(a4)
     4b4:	20c7c7b3          	sh2add	a5,a5,a2
     4b8:	c394                	sw	a3,0(a5)
        ) peri->rxcnt++; // Keep track of counter
     4ba:	5b5c                	lw	a5,52(a4)
     4bc:	0785                	addi	a5,a5,1
     4be:	db5c                	sw	a5,52(a4)
            && !spi_read_word(peri->instance, &peri->txn.rxbuffer[peri->rxcnt])
     4c0:	5714                	lw	a3,40(a4)
     4c2:	00d7fb63          	bgeu	a5,a3,4d8 <spi_empty_rx+0x3a>
     4c6:	4310                	lw	a2,0(a4)
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
     4c8:	ce01                	beqz	a2,4e0 <spi_empty_rx+0x42>
    status.value = SPI_HW(spi)->STATUS; // Assuming SPI_HW(spi)->STATUS returns a uint32_t value representing the status
     4ca:	4a54                	lw	a3,20(a2)
    if (spi_get_rx_queue_depth(spi) == 0) return SPI_FLAG_RX_QUEUE_EMPTY;
     4cc:	82a1                	srli	a3,a3,0x8
     4ce:	0ff6f693          	zext.b	a3,a3
     4d2:	fef9                	bnez	a3,4b0 <spi_empty_rx+0x12>
        return true;
     4d4:	4505                	li	a0,1
     4d6:	8082                	ret
     4d8:	4505                	li	a0,1
     4da:	8082                	ret
    return false;
     4dc:	4501                	li	a0,0
     4de:	8082                	ret
        return true;
     4e0:	4505                	li	a0,1
     4e2:	8082                	ret

000004e4 <spi_event_handler>:
    peri->txn       = (spi_transaction_t) {0};
    peri->callbacks = NULL_CALLBACKS;
}

void spi_event_handler(spi_peripheral_t* peri, spi_event_e events) 
{
     4e4:	1141                	addi	sp,sp,-16
     4e6:	c606                	sw	ra,12(sp)
     4e8:	c426                	sw	s1,8(sp)
     4ea:	c24a                	sw	s2,4(sp)
     4ec:	84aa                	mv	s1,a0
     4ee:	892e                	mv	s2,a1
    // Ready means it is ready to accept new command segments. So we have two
    // possibilities if the device is ready:
    //  1) It is ready but not idle
    //  2) It is ready and idle
    if (events & SPI_EVENT_READY) 
     4f0:	0105f793          	andi	a5,a1,16
     4f4:	cb99                	beqz	a5,50a <spi_event_handler+0x26>
    {
        // If SPI is ready and there are still commands to execute, issue next command
        if (peri->txn.segments != NULL && peri->scnt < peri->txn.seglen) 
     4f6:	4958                	lw	a4,20(a0)
     4f8:	c711                	beqz	a4,504 <spi_event_handler+0x20>
     4fa:	5554                	lw	a3,44(a0)
     4fc:	01854783          	lbu	a5,24(a0)
     500:	02f6e163          	bltu	a3,a5,522 <spi_event_handler+0x3e>
        {
            spi_issue_next_seg(peri);
        }
        // If no more commands and SPI is idle, it means the transaction is over
        else if (events & SPI_EVENT_IDLE) 
     504:	02097793          	andi	a5,s2,32
     508:	ebad                	bnez	a5,57a <spi_event_handler+0x96>
            // Reset all transaction related variables
            spi_reset_transaction(peri);
            return;
        }
    }
    if (events & SPI_EVENT_TXWM)
     50a:	00897793          	andi	a5,s2,8
     50e:	e7f9                	bnez	a5,5dc <spi_event_handler+0xf8>
        {
            peri->callbacks.txwm_cb(peri->txn.txbuffer, peri->txcnt, 
                                    peri->txn.rxbuffer, peri->rxcnt);
        }
    }
    if (events & SPI_EVENT_RXWM)
     510:	00497913          	andi	s2,s2,4
     514:	10091863          	bnez	s2,624 <spi_event_handler+0x140>
        {
            peri->callbacks.rxwm_cb(peri->txn.txbuffer, peri->txcnt, 
                                    peri->txn.rxbuffer, peri->rxcnt);
        }
    }
}
     518:	40b2                	lw	ra,12(sp)
     51a:	44a2                	lw	s1,8(sp)
     51c:	4912                	lw	s2,4(sp)
     51e:	0141                	addi	sp,sp,16
     520:	8082                	ret
    const spi_segment_t seg = peri->txn.segments[peri->scnt];
     522:	20e6c733          	sh2add	a4,a3,a4
     526:	4318                	lw	a4,0(a4)
     528:	00871613          	slli	a2,a4,0x8
     52c:	00865593          	srli	a1,a2,0x8
     530:	8361                	srli	a4,a4,0x18
     532:	8b3d                	andi	a4,a4,15
    peri->scnt++;
     534:	0685                	addi	a3,a3,1
     536:	d554                	sw	a3,44(a0)
    spi_set_command(peri->instance, cmd_reg);
     538:	4108                	lw	a0,0(a0)
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
     53a:	d961                	beqz	a0,50a <spi_event_handler+0x26>
  return (bitfield >> index) & mask;
     53c:	00275613          	srli	a2,a4,0x2
  bitfield |= (value & mask) << index;
     540:	0666                	slli	a2,a2,0x19
     542:	8b0d                	andi	a4,a4,3
     544:	076e                	slli	a4,a4,0x1b
     546:	8f51                	or	a4,a4,a2
        .csaat     = peri->txn.seglen == peri->scnt ? false : true,
     548:	8f95                	sub	a5,a5,a3
     54a:	00f037b3          	snez	a5,a5
     54e:	07e2                	slli	a5,a5,0x18
     550:	8fd9                	or	a5,a5,a4
        .len       = seg.len - 1, // -1 because of SPI Host IP specifications
     552:	fff58613          	addi	a2,a1,-1
     556:	0622                	slli	a2,a2,0x8
     558:	8221                	srli	a2,a2,0x8
     55a:	8e5d                	or	a2,a2,a5
  return (bitfield >> index) & mask;
     55c:	83e5                	srli	a5,a5,0x19
    if (!spi_validate_cmd(direction, speed))     flags |= SPI_FLAG_SPEED_INVALID;
     55e:	8b8d                	andi	a5,a5,3
    if (speed > SPI_SPEED_QUAD || direction > SPI_DIR_BIDIR || 
     560:	4709                	li	a4,2
     562:	0cf76e63          	bltu	a4,a5,63e <spi_event_handler+0x15a>
    status.value = SPI_HW(spi)->STATUS; // Assuming SPI_HW(spi)->STATUS returns a uint32_t value representing the status
     566:	4958                	lw	a4,20(a0)
 */
static inline __attribute__((always_inline)) 
spi_tristate_e spi_get_ready(spi_host_t* spi)
{
    SPI_NULL_CHECK(spi, SPI_TRISTATE_ERROR)
    return spi_get_status(spi).ready ? SPI_TRISTATE_TRUE : SPI_TRISTATE_FALSE;
     568:	fa0751e3          	bgez	a4,50a <spi_event_handler+0x26>
       (direction == SPI_DIR_BIDIR && speed != SPI_SPEED_STANDARD))
     56c:	01b65713          	srli	a4,a2,0x1b
     570:	1775                	addi	a4,a4,-3
    if (flags) return flags;
     572:	e311                	bnez	a4,576 <spi_event_handler+0x92>
     574:	fbd9                	bnez	a5,50a <spi_event_handler+0x26>
    SPI_HW(spi)->COMMAND = cmd_reg;
     576:	d150                	sw	a2,36(a0)
    return SPI_FLAG_OK;
     578:	bf49                	j	50a <spi_event_handler+0x26>
            spi_set_events_enabled(peri->instance, SPI_EVENT_ALL, false);
     57a:	409c                	lw	a5,0(s1)
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
     57c:	cb91                	beqz	a5,590 <spi_event_handler+0xac>
    else        SPI_HW(spi)->EVENT_ENABLE &= ~events;
     57e:	5f98                	lw	a4,56(a5)
     580:	fc077713          	andi	a4,a4,-64
     584:	df98                	sw	a4,56(a5)
            spi_enable_evt_intr   (peri->instance, false);
     586:	409c                	lw	a5,0(s1)
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
     588:	c781                	beqz	a5,590 <spi_event_handler+0xac>
    SPI_HW(spi)->INTR_ENABLE = bitfield_write(SPI_HW(spi)->INTR_ENABLE, BIT_MASK_1, 
     58a:	43d8                	lw	a4,4(a5)
  bitfield &= ~(mask << index);
     58c:	9b75                	andi	a4,a4,-3
     58e:	c3d8                	sw	a4,4(a5)
            spi_empty_rx(peri);
     590:	8526                	mv	a0,s1
     592:	3731                	jal	49e <spi_empty_rx>
            peri->state = SPI_STATE_DONE;
     594:	4791                	li	a5,4
     596:	c89c                	sw	a5,16(s1)
            if (peri->callbacks.done_cb != NULL) 
     598:	5c9c                	lw	a5,56(s1)
     59a:	c791                	beqz	a5,5a6 <spi_event_handler+0xc2>
                peri->callbacks.done_cb(peri->txn.txbuffer, peri->txcnt, 
     59c:	58d4                	lw	a3,52(s1)
     59e:	50d0                	lw	a2,36(s1)
     5a0:	588c                	lw	a1,48(s1)
     5a2:	4cc8                	lw	a0,28(s1)
     5a4:	9782                	jalr	a5
    peri->scnt      = 0;
     5a6:	0204a623          	sw	zero,44(s1)
    peri->txcnt     = 0;
     5aa:	0204a823          	sw	zero,48(s1)
    peri->rxcnt     = 0;
     5ae:	0204aa23          	sw	zero,52(s1)
    peri->txn       = (spi_transaction_t) {0};
     5b2:	0004aa23          	sw	zero,20(s1)
     5b6:	0004ac23          	sw	zero,24(s1)
     5ba:	0004ae23          	sw	zero,28(s1)
     5be:	0204a023          	sw	zero,32(s1)
     5c2:	0204a223          	sw	zero,36(s1)
     5c6:	0204a423          	sw	zero,40(s1)
    peri->callbacks = NULL_CALLBACKS;
     5ca:	0204ac23          	sw	zero,56(s1)
     5ce:	0204ae23          	sw	zero,60(s1)
     5d2:	0404a023          	sw	zero,64(s1)
     5d6:	0404a223          	sw	zero,68(s1)
}
     5da:	bf3d                	j	518 <spi_event_handler+0x34>
    if (peri->txn.txbuffer != NULL && peri->txcnt < peri->txn.txlen) {
     5dc:	4cdc                	lw	a5,28(s1)
     5de:	db8d                	beqz	a5,510 <spi_event_handler+0x2c>
     5e0:	589c                	lw	a5,48(s1)
     5e2:	5098                	lw	a4,32(s1)
     5e4:	f2e7f6e3          	bgeu	a5,a4,510 <spi_event_handler+0x2c>
    if (spi_get_tx_queue_depth(spi) >= SPI_HOST_PARAM_TX_DEPTH) 
     5e8:	04700613          	li	a2,71
     5ec:	a821                	j	604 <spi_event_handler+0x120>
            && !spi_write_word(peri->instance, peri->txn.txbuffer[peri->txcnt])
     5ee:	4cd4                	lw	a3,28(s1)
     5f0:	20d7c7b3          	sh2add	a5,a5,a3
     5f4:	439c                	lw	a5,0(a5)
    SPI_HW(spi)->TXDATA = wdata;
     5f6:	d75c                	sw	a5,44(a4)
        ) peri->txcnt++; // Keep track of counter
     5f8:	589c                	lw	a5,48(s1)
     5fa:	0785                	addi	a5,a5,1
     5fc:	d89c                	sw	a5,48(s1)
            && !spi_write_word(peri->instance, peri->txn.txbuffer[peri->txcnt])
     5fe:	5098                	lw	a4,32(s1)
     600:	00e7f963          	bgeu	a5,a4,612 <spi_event_handler+0x12e>
     604:	4098                	lw	a4,0(s1)
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
     606:	c711                	beqz	a4,612 <spi_event_handler+0x12e>
    status.value = SPI_HW(spi)->STATUS; // Assuming SPI_HW(spi)->STATUS returns a uint32_t value representing the status
     608:	4b54                	lw	a3,20(a4)
    if (spi_get_tx_queue_depth(spi) >= SPI_HOST_PARAM_TX_DEPTH) 
     60a:	0ff6f693          	zext.b	a3,a3
     60e:	fed670e3          	bgeu	a2,a3,5ee <spi_event_handler+0x10a>
        if (spi_fill_tx(peri) && peri->callbacks.txwm_cb != NULL)
     612:	5cdc                	lw	a5,60(s1)
     614:	ee078ee3          	beqz	a5,510 <spi_event_handler+0x2c>
            peri->callbacks.txwm_cb(peri->txn.txbuffer, peri->txcnt, 
     618:	58d4                	lw	a3,52(s1)
     61a:	50d0                	lw	a2,36(s1)
     61c:	588c                	lw	a1,48(s1)
     61e:	4cc8                	lw	a0,28(s1)
     620:	9782                	jalr	a5
     622:	b5fd                	j	510 <spi_event_handler+0x2c>
        if (spi_empty_rx(peri) && peri->callbacks.rxwm_cb != NULL)
     624:	8526                	mv	a0,s1
     626:	3da5                	jal	49e <spi_empty_rx>
     628:	ee0508e3          	beqz	a0,518 <spi_event_handler+0x34>
     62c:	40bc                	lw	a5,64(s1)
     62e:	ee0785e3          	beqz	a5,518 <spi_event_handler+0x34>
            peri->callbacks.rxwm_cb(peri->txn.txbuffer, peri->txcnt, 
     632:	58d4                	lw	a3,52(s1)
     634:	50d0                	lw	a2,36(s1)
     636:	588c                	lw	a1,48(s1)
     638:	4cc8                	lw	a0,28(s1)
     63a:	9782                	jalr	a5
     63c:	bdf1                	j	518 <spi_event_handler+0x34>
     63e:	495c                	lw	a5,20(a0)
    return status;
     640:	b5e9                	j	50a <spi_event_handler+0x26>

00000642 <spi_error_handler>:

void spi_error_handler(spi_peripheral_t* peri, spi_error_e error) 
{
     642:	1101                	addi	sp,sp,-32
     644:	ce06                	sw	ra,28(sp)
     646:	cc26                	sw	s1,24(sp)
     648:	84aa                	mv	s1,a0
    // Disable event interrupts
    spi_set_events_enabled(peri->instance, SPI_EVENT_ALL, false);
     64a:	411c                	lw	a5,0(a0)
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
     64c:	cb91                	beqz	a5,660 <spi_error_handler+0x1e>
    else        SPI_HW(spi)->EVENT_ENABLE &= ~events;
     64e:	5f98                	lw	a4,56(a5)
     650:	fc077713          	andi	a4,a4,-64
     654:	df98                	sw	a4,56(a5)
    spi_enable_evt_intr   (peri->instance, false);
     656:	411c                	lw	a5,0(a0)
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
     658:	c781                	beqz	a5,660 <spi_error_handler+0x1e>
    SPI_HW(spi)->INTR_ENABLE = bitfield_write(SPI_HW(spi)->INTR_ENABLE, BIT_MASK_1, 
     65a:	43d8                	lw	a4,4(a5)
     65c:	9b75                	andi	a4,a4,-3
     65e:	c3d8                	sw	a4,4(a5)
    // If there is a callback defined invoke it
    if (peri->callbacks.error_cb != NULL) 
     660:	40fc                	lw	a5,68(s1)
     662:	c791                	beqz	a5,66e <spi_error_handler+0x2c>
    {
        peri->callbacks.error_cb(peri->txn.txbuffer, peri->txcnt, 
     664:	58d4                	lw	a3,52(s1)
     666:	50d0                	lw	a2,36(s1)
     668:	588c                	lw	a1,48(s1)
     66a:	4cc8                	lw	a0,28(s1)
     66c:	9782                	jalr	a5
    peri->scnt      = 0;
     66e:	0204a623          	sw	zero,44(s1)
    peri->txcnt     = 0;
     672:	0204a823          	sw	zero,48(s1)
    peri->rxcnt     = 0;
     676:	0204aa23          	sw	zero,52(s1)
    peri->txn       = (spi_transaction_t) {0};
     67a:	0004aa23          	sw	zero,20(s1)
     67e:	0004ac23          	sw	zero,24(s1)
     682:	0004ae23          	sw	zero,28(s1)
     686:	0204a023          	sw	zero,32(s1)
     68a:	0204a223          	sw	zero,36(s1)
     68e:	0204a423          	sw	zero,40(s1)
    peri->callbacks = NULL_CALLBACKS;
     692:	0204ac23          	sw	zero,56(s1)
     696:	0204ae23          	sw	zero,60(s1)
     69a:	0404a023          	sw	zero,64(s1)
     69e:	0404a223          	sw	zero,68(s1)
    spi_sw_reset(peri->instance);
     6a2:	4094                	lw	a3,0(s1)
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
     6a4:	c2d1                	beqz	a3,728 <spi_error_handler+0xe6>
    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, BIT_MASK_1, 
     6a6:	4a9c                	lw	a5,16(a3)
  bitfield |= (value & mask) << index;
     6a8:	40000737          	lui	a4,0x40000
     6ac:	8fd9                	or	a5,a5,a4
     6ae:	ca9c                	sw	a5,16(a3)
    status.value = SPI_HW(spi)->STATUS; // Assuming SPI_HW(spi)->STATUS returns a uint32_t value representing the status
     6b0:	4adc                	lw	a5,20(a3)
    return status;
     6b2:	c63e                	sw	a5,12(sp)
    while (status.active || status.txqd || status.rxqd);
     6b4:	47b2                	lw	a5,12(sp)
     6b6:	00179713          	slli	a4,a5,0x1
     6ba:	fe074de3          	bltz	a4,6b4 <spi_error_handler+0x72>
     6be:	00c14783          	lbu	a5,12(sp)
     6c2:	fbed                	bnez	a5,6b4 <spi_error_handler+0x72>
     6c4:	00d14783          	lbu	a5,13(sp)
     6c8:	f7f5                	bnez	a5,6b4 <spi_error_handler+0x72>
    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, BIT_MASK_1, 
     6ca:	4a9c                	lw	a5,16(a3)
  bitfield &= ~(mask << index);
     6cc:	c0000737          	lui	a4,0xc0000
     6d0:	177d                	addi	a4,a4,-1 # bfffffff <_sp+0xbfff3baf>
     6d2:	8ff9                	and	a5,a5,a4
     6d4:	ca9c                	sw	a5,16(a3)
    spi_set_enable(peri->instance, true);
     6d6:	409c                	lw	a5,0(s1)
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
     6d8:	cba1                	beqz	a5,728 <spi_error_handler+0xe6>
    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, BIT_MASK_1, 
     6da:	4b98                	lw	a4,16(a5)
  bitfield |= (value & mask) << index;
     6dc:	800006b7          	lui	a3,0x80000
     6e0:	8f55                	or	a4,a4,a3
     6e2:	cb98                	sw	a4,16(a5)
    spi_output_enable(peri->instance, true);
     6e4:	409c                	lw	a5,0(s1)
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
     6e6:	c3a9                	beqz	a5,728 <spi_error_handler+0xe6>
    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, BIT_MASK_1, 
     6e8:	4b98                	lw	a4,16(a5)
     6ea:	200006b7          	lui	a3,0x20000
     6ee:	8f55                	or	a4,a4,a3
     6f0:	cb98                	sw	a4,16(a5)
    spi_set_errors_enabled(peri->instance, SPI_ERROR_IRQALL, true);
     6f2:	409c                	lw	a5,0(s1)
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
     6f4:	cb95                	beqz	a5,728 <spi_error_handler+0xe6>
    if (enable) SPI_HW(spi)->ERROR_ENABLE |= errors;
     6f6:	5b98                	lw	a4,48(a5)
     6f8:	01f76713          	ori	a4,a4,31
     6fc:	db98                	sw	a4,48(a5)
    spi_enable_error_intr(peri->instance, true);
     6fe:	409c                	lw	a5,0(s1)
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
     700:	c3a1                	beqz	a5,740 <spi_error_handler+0xfe>
    SPI_HW(spi)->INTR_ENABLE = bitfield_write(SPI_HW(spi)->INTR_ENABLE, BIT_MASK_1, 
     702:	43d8                	lw	a4,4(a5)
     704:	00176713          	ori	a4,a4,1
     708:	c3d8                	sw	a4,4(a5)
    spi_set_tx_watermark(peri->instance, peri->txwm);
     70a:	4098                	lw	a4,0(s1)
     70c:	0044c783          	lbu	a5,4(s1)
    if (watermark > SPI_HOST_PARAM_TX_DEPTH) return SPI_FLAG_WATERMARK_EXCEEDS;
     710:	cf01                	beqz	a4,728 <spi_error_handler+0xe6>
     712:	0497b693          	sltiu	a3,a5,73
     716:	ca89                	beqz	a3,728 <spi_error_handler+0xe6>
    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, 
     718:	4b14                	lw	a3,16(a4)
  bitfield &= ~(mask << index);
     71a:	7641                	lui	a2,0xffff0
     71c:	0ff60613          	addi	a2,a2,255 # ffff00ff <_sp+0xfffe3caf>
     720:	8ef1                	and	a3,a3,a2
  bitfield |= (value & mask) << index;
     722:	07a2                	slli	a5,a5,0x8
     724:	8fd5                	or	a5,a5,a3
     726:	cb1c                	sw	a5,16(a4)
    spi_set_rx_watermark(peri->instance, peri->rxwm);
     728:	4098                	lw	a4,0(s1)
     72a:	0054c783          	lbu	a5,5(s1)
    if (watermark > SPI_HOST_PARAM_RX_DEPTH) return SPI_FLAG_WATERMARK_EXCEEDS;
     72e:	0417b693          	sltiu	a3,a5,65
     732:	c699                	beqz	a3,740 <spi_error_handler+0xfe>
     734:	c711                	beqz	a4,740 <spi_error_handler+0xfe>
    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, 
     736:	4b14                	lw	a3,16(a4)
  bitfield &= ~(mask << index);
     738:	f006f693          	andi	a3,a3,-256
  bitfield |= (value & mask) << index;
     73c:	8fd5                	or	a5,a5,a3
     73e:	cb1c                	sw	a5,16(a4)
    peri->last_id = 0;
     740:	0004a423          	sw	zero,8(s1)
                                 peri->txn.rxbuffer, peri->rxcnt);
    }
    spi_reset_peri(peri);
    // Set the state to error
    peri->state = SPI_STATE_ERROR;
     744:	47a1                	li	a5,8
     746:	c89c                	sw	a5,16(s1)
}
     748:	40f2                	lw	ra,28(sp)
     74a:	44e2                	lw	s1,24(sp)
     74c:	6105                	addi	sp,sp,32
     74e:	8082                	ret

00000750 <_writestr>:
{
    return _write(fd,buf,cnt);
}

void _writestr(const void *ptr)
{
     750:	1141                	addi	sp,sp,-16
     752:	c606                	sw	ra,12(sp)
     754:	c426                	sw	s1,8(sp)
     756:	84aa                	mv	s1,a0
    _write(STDOUT_FILENO, ptr, strlen(ptr)+1);
     758:	168010ef          	jal	18c0 <strlen>
     75c:	00150613          	addi	a2,a0,1
     760:	85a6                	mv	a1,s1
     762:	4505                	li	a0,1
     764:	31e1                	jal	42c <_write>
}
     766:	40b2                	lw	ra,12(sp)
     768:	44a2                	lw	s1,8(sp)
     76a:	0141                	addi	sp,sp,16
     76c:	8082                	ret

0000076e <print_exc_msg>:
/**
 * Default Error Handling
 * @param msg error message supplied by caller
 * TODO - this will be soon by a real print formatting
 */
static void print_exc_msg(const char *msg) {
     76e:	1101                	addi	sp,sp,-32
     770:	ce06                	sw	ra,28(sp)
     772:	cc26                	sw	s1,24(sp)
  _writestr(msg );
     774:	3ff1                	jal	750 <_writestr>
  uint32_t mtval; 
  CSR_READ(CSR_REG_MTVAL, &mtval);
     776:	343024f3          	csrr	s1,mtval
  _writestr("MTVAL value is ");
     77a:	6529                	lui	a0,0xa
     77c:	5dc50513          	addi	a0,a0,1500 # a5dc <heap.cpp.7337fd52+0x454>
     780:	3fc1                	jal	750 <_writestr>
  const char p[6] = {(mtval >> 24) & 0xFF, (mtval >> 16) & 0xFF, (mtval >> 8) & 0xFF, mtval & 0xFF, '\n', 0};
     782:	0184d793          	srli	a5,s1,0x18
     786:	00f10423          	sb	a5,8(sp)
     78a:	0104d793          	srli	a5,s1,0x10
     78e:	00f104a3          	sb	a5,9(sp)
     792:	0084d793          	srli	a5,s1,0x8
     796:	00f10523          	sb	a5,10(sp)
     79a:	009105a3          	sb	s1,11(sp)
     79e:	47a9                	li	a5,10
     7a0:	00f10623          	sb	a5,12(sp)
     7a4:	000106a3          	sb	zero,13(sp)
  _writestr(p);
     7a8:	0028                	addi	a0,sp,8
     7aa:	375d                	jal	750 <_writestr>
  while (1) {
     7ac:	a001                	j	7ac <print_exc_msg+0x3e>

000007ae <inferenceTPG>:
                  const fixedpt * restrict in1,
                  const fixedpt * restrict in2,
                  const fixedpt * restrict in3,
                  const fixedpt * restrict in4,
				  uint32_t * total_cycles)
{
     7ae:	7179                	addi	sp,sp,-48
	enum vertices currentVertex = T0;
     7b0:	4701                	li	a4,0

	while (1) {
		switch (currentVertex) {
     7b2:	4e19                	li	t3,6
     7b4:	65a9                	lui	a1,0xa
     7b6:	50058593          	addi	a1,a1,1280 # a500 <heap.cpp.7337fd52+0x378>
     7ba:	00ee6063          	bltu	t3,a4,7ba <inferenceTPG+0xc>
     7be:	20b74733          	sh2add	a4,a4,a1
     7c2:	4318                	lw	a4,0(a4)
     7c4:	8702                	jr	a4
     7c6:	4789                	li	a5,2
			case T0:  currentVertex = T0_func(in1, in2, in3, in4, total_cycles); break;
			case A1: actions[0] = 1; return;
     7c8:	c11c                	sw	a5,0(a0)
			case A4: actions[0] = 4; return;
			case A5: actions[0] = 5; return;
			case A6: actions[0] = 6; return;
		}
	}
     7ca:	6145                	addi	sp,sp,48
     7cc:	8082                	ret
    CSR_CLEAR_BITS(CSR_REG_MCOUNTINHIBIT, 0x1); // enable cycle counting
     7ce:	4705                	li	a4,1
     7d0:	32073073          	csrc	mcountinhibit,a4
	CSR_WRITE(CSR_REG_MCYCLE, 0);
     7d4:	4701                	li	a4,0
     7d6:	b0071073          	csrw	mcycle,a4
	const enum vertices next[6] = { A1, A2, A3, A4, A5, A6 };
     7da:	6729                	lui	a4,0xa
     7dc:	54c70713          	addi	a4,a4,1356 # a54c <heap.cpp.7337fd52+0x3c4>
     7e0:	00072f03          	lw	t5,0(a4)
     7e4:	00472e83          	lw	t4,4(a4)
     7e8:	00872303          	lw	t1,8(a4)
     7ec:	00c72883          	lw	a7,12(a4)
     7f0:	01072803          	lw	a6,16(a4)
     7f4:	c07a                	sw	t5,0(sp)
     7f6:	c276                	sw	t4,4(sp)
     7f8:	c41a                	sw	t1,8(sp)
     7fa:	c646                	sw	a7,12(sp)
     7fc:	c842                	sw	a6,16(sp)
     7fe:	4b58                	lw	a4,20(a4)
     800:	ca3a                	sw	a4,20(sp)


inline __attribute__((always_inline)) fixedpt P0(const fixedpt * restrict in1, const fixedpt * restrict in2, const fixedpt * restrict in3, const fixedpt * restrict in4) {
	fixedpt reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		fixedpt op0 = in3[1];
     802:	42d8                	lw	a4,4(a3)
		fixedpt op1 = in3[2];
     804:	0086a803          	lw	a6,8(a3) # 20000008 <_sp+0x1fff3bb8>
		reg[0] = op0 + op1;
     808:	01070333          	add	t1,a4,a6
	scores[0] = P0(in1, in2, in3, in4);
     80c:	cc1a                	sw	t1,24(sp)
inline __attribute__((always_inline)) fixedpt P1(const fixedpt * restrict in1, const fixedpt * restrict in2, const fixedpt * restrict in3, const fixedpt * restrict in4) {
	fixedpt reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		fixedpt op0 = in3[2];
		fixedpt op1 = in3[2];
		reg[1] = op0 + op1;
     80e:	00181e93          	slli	t4,a6,0x1
	}
	{
		fixedpt op0 = in2[0];
		fixedpt op1 = reg[1];
		reg[0] = op0 - op1;
     812:	00062883          	lw	a7,0(a2)
     816:	41d888b3          	sub	a7,a7,t4
	scores[1] = P1(in1, in2, in3, in4);
     81a:	ce46                	sw	a7,28(sp)
inline __attribute__((always_inline)) fixedpt P2(const fixedpt * restrict in1, const fixedpt * restrict in2, const fixedpt * restrict in3, const fixedpt * restrict in4) {
	fixedpt reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		fixedpt op0 = in3[1];
		fixedpt op1 = in3[2];
		reg[0] = op0 - op1;
     81c:	41070833          	sub	a6,a4,a6
	scores[2] = P2(in1, in2, in3, in4);
     820:	d042                	sw	a6,32(sp)
//   return result;
// }

static inline __attribute__((always_inline)) fixedpt f_log2(fixedpt n) {
    if (n <= 0) {
        return 0; // Handle error for non-positive input
     822:	4801                	li	a6,0
    if (n <= 0) {
     824:	00e05763          	blez	a4,832 <__heap_size+0x32>
    }
    return 31 - __builtin_clz(n);
     828:	60071893          	clz	a7,a4
     82c:	487d                	li	a6,31
     82e:	41180833          	sub	a6,a6,a7
	scores[3] = P3(in1, in2, in3, in4);
     832:	d242                	sw	a6,36(sp)
inline __attribute__((always_inline)) fixedpt P4(const fixedpt * restrict in1, const fixedpt * restrict in2, const fixedpt * restrict in3, const fixedpt * restrict in4) {
	fixedpt reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		fixedpt op0 = reg[4];
		fixedpt op1 = in3[1];
		reg[0] = (op0 > op1) ? op0 : op1;
     834:	0a076733          	max	a4,a4,zero
	scores[4] = P4(in1, in2, in3, in4);
     838:	d43a                	sw	a4,40(sp)
	scores[5] = P5(in1, in2, in3, in4);
     83a:	d61a                	sw	t1,44(sp)
	CSR_READ(CSR_REG_MCYCLE, total_cycles);
     83c:	b0002773          	csrr	a4,mcycle
     840:	c398                	sw	a4,0(a5)
	fixedpt bestScore = results[0];
     842:	4362                	lw	t1,24(sp)
	for (int i = 1; i < nb; i++) {
     844:	01c10813          	addi	a6,sp,28
	int bestProgram = 0;
     848:	4f01                	li	t5,0
	for (int i = 1; i < nb; i++) {
     84a:	4705                	li	a4,1
     84c:	4e99                	li	t4,6
     84e:	a029                	j	858 <__heap_size+0x58>
     850:	0705                	addi	a4,a4,1
     852:	0811                	addi	a6,a6,4
     854:	01d70963          	beq	a4,t4,866 <__heap_size+0x66>
		fixedpt challengerScore = results[i];
     858:	00082883          	lw	a7,0(a6)
		if (challengerScore >= bestScore) {
     85c:	fe68cae3          	blt	a7,t1,850 <__heap_size+0x50>
			bestScore = challengerScore;
     860:	8346                	mv	t1,a7
			bestProgram = i;
     862:	8f3a                	mv	t5,a4
     864:	b7f5                	j	850 <__heap_size+0x50>
	return next[bestProgram(scores, 6)];
     866:	1818                	addi	a4,sp,48
     868:	20ef4f33          	sh2add	t5,t5,a4
     86c:	fd0f2703          	lw	a4,-48(t5)
			case T0:  currentVertex = T0_func(in1, in2, in3, in4, total_cycles); break;
     870:	b7a9                	j	7ba <inferenceTPG+0xc>
			case A3: actions[0] = 3; return;	
     872:	478d                	li	a5,3
     874:	bf91                	j	7c8 <inferenceTPG+0x1a>
			case A4: actions[0] = 4; return;
     876:	4791                	li	a5,4
     878:	bf81                	j	7c8 <inferenceTPG+0x1a>
			case A5: actions[0] = 5; return;
     87a:	4795                	li	a5,5
     87c:	b7b1                	j	7c8 <inferenceTPG+0x1a>
			case A6: actions[0] = 6; return;
     87e:	4799                	li	a5,6
     880:	b7a1                	j	7c8 <inferenceTPG+0x1a>
		switch (currentVertex) {
     882:	4785                	li	a5,1
     884:	b791                	j	7c8 <inferenceTPG+0x1a>
	...

00000888 <handler_irq_external>:
/*                           EXPORTED FUNCTIONS                             */
/**                                                                        **/
/****************************************************************************/

void handler_irq_external(void)
{
     888:	715d                	addi	sp,sp,-80
     88a:	c686                	sw	ra,76(sp)
     88c:	c496                	sw	t0,72(sp)
     88e:	c29a                	sw	t1,68(sp)
     890:	c09e                	sw	t2,64(sp)
     892:	de26                	sw	s1,60(sp)
     894:	dc2a                	sw	a0,56(sp)
     896:	da2e                	sw	a1,52(sp)
     898:	d832                	sw	a2,48(sp)
     89a:	d636                	sw	a3,44(sp)
     89c:	d43a                	sw	a4,40(sp)
     89e:	d23e                	sw	a5,36(sp)
     8a0:	d042                	sw	a6,32(sp)
     8a2:	ce46                	sw	a7,28(sp)
     8a4:	cc4a                	sw	s2,24(sp)
     8a6:	ca72                	sw	t3,20(sp)
     8a8:	c876                	sw	t4,16(sp)
     8aa:	c67a                	sw	t5,12(sp)
     8ac:	c47e                	sw	t6,8(sp)
  if (claim_data == NULL)
  {
    return kPlicBadArg;
  }

  *claim_data = rv_plic_peri->CC0;
     8ae:	300004b7          	lui	s1,0x30000
     8b2:	20c4a903          	lw	s2,524(s1) # 3000020c <_sp+0x2fff3dbc>
    handlers[int_id](int_id);
     8b6:	854a                	mv	a0,s2
     8b8:	4781                	li	a5,0
     8ba:	9782                	jalr	a5
    return kPlicBadArg;
  }

  // Write back the claimed IRQ ID to the target specific CC register,
  // to notify the PLIC of the IRQ completion.
  rv_plic_peri->CC0 = *complete_data;
     8bc:	2124a623          	sw	s2,524(s1)
}
     8c0:	40b6                	lw	ra,76(sp)
     8c2:	42a6                	lw	t0,72(sp)
     8c4:	4316                	lw	t1,68(sp)
     8c6:	4386                	lw	t2,64(sp)
     8c8:	54f2                	lw	s1,60(sp)
     8ca:	5562                	lw	a0,56(sp)
     8cc:	55d2                	lw	a1,52(sp)
     8ce:	5642                	lw	a2,48(sp)
     8d0:	56b2                	lw	a3,44(sp)
     8d2:	5722                	lw	a4,40(sp)
     8d4:	5792                	lw	a5,36(sp)
     8d6:	5802                	lw	a6,32(sp)
     8d8:	48f2                	lw	a7,28(sp)
     8da:	4962                	lw	s2,24(sp)
     8dc:	4e52                	lw	t3,20(sp)
     8de:	4ec2                	lw	t4,16(sp)
     8e0:	4f32                	lw	t5,12(sp)
     8e2:	4fa2                	lw	t6,8(sp)
     8e4:	6161                	addi	sp,sp,80
     8e6:	30200073          	mret
	...

000008ec <handler_irq_fast_gpio_7>:
    // call the weak fic handler
    fic_irq_gpio_6();
}

void handler_irq_fast_gpio_7(void)
{
     8ec:	7139                	addi	sp,sp,-64
     8ee:	de06                	sw	ra,60(sp)
     8f0:	dc16                	sw	t0,56(sp)
     8f2:	da1a                	sw	t1,52(sp)
     8f4:	d81e                	sw	t2,48(sp)
     8f6:	d62a                	sw	a0,44(sp)
     8f8:	d42e                	sw	a1,40(sp)
     8fa:	d232                	sw	a2,36(sp)
     8fc:	d036                	sw	a3,32(sp)
     8fe:	ce3a                	sw	a4,28(sp)
     900:	cc3e                	sw	a5,24(sp)
     902:	ca42                	sw	a6,20(sp)
     904:	c846                	sw	a7,16(sp)
     906:	c672                	sw	t3,12(sp)
     908:	c476                	sw	t4,8(sp)
     90a:	c27a                	sw	t5,4(sp)
     90c:	c07e                	sw	t6,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     90e:	200607b7          	lui	a5,0x20060
     912:	6709                	lui	a4,0x2
     914:	c3d8                	sw	a4,4(a5)
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_7_fic_e);
    // call the weak fic handler
    fic_irq_gpio_7();
     916:	3c55                	jal	3ca <fic_irq_gpio_7>
}
     918:	50f2                	lw	ra,60(sp)
     91a:	52e2                	lw	t0,56(sp)
     91c:	5352                	lw	t1,52(sp)
     91e:	53c2                	lw	t2,48(sp)
     920:	5532                	lw	a0,44(sp)
     922:	55a2                	lw	a1,40(sp)
     924:	5612                	lw	a2,36(sp)
     926:	5682                	lw	a3,32(sp)
     928:	4772                	lw	a4,28(sp)
     92a:	47e2                	lw	a5,24(sp)
     92c:	4852                	lw	a6,20(sp)
     92e:	48c2                	lw	a7,16(sp)
     930:	4e32                	lw	t3,12(sp)
     932:	4ea2                	lw	t4,8(sp)
     934:	4f12                	lw	t5,4(sp)
     936:	4f82                	lw	t6,0(sp)
     938:	6121                	addi	sp,sp,64
     93a:	30200073          	mret
     93e:	0001                	nop

00000940 <handler_irq_fast_gpio_6>:
{
     940:	7139                	addi	sp,sp,-64
     942:	de06                	sw	ra,60(sp)
     944:	dc16                	sw	t0,56(sp)
     946:	da1a                	sw	t1,52(sp)
     948:	d81e                	sw	t2,48(sp)
     94a:	d62a                	sw	a0,44(sp)
     94c:	d42e                	sw	a1,40(sp)
     94e:	d232                	sw	a2,36(sp)
     950:	d036                	sw	a3,32(sp)
     952:	ce3a                	sw	a4,28(sp)
     954:	cc3e                	sw	a5,24(sp)
     956:	ca42                	sw	a6,20(sp)
     958:	c846                	sw	a7,16(sp)
     95a:	c672                	sw	t3,12(sp)
     95c:	c476                	sw	t4,8(sp)
     95e:	c27a                	sw	t5,4(sp)
     960:	c07e                	sw	t6,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     962:	200607b7          	lui	a5,0x20060
     966:	6705                	lui	a4,0x1
     968:	c3d8                	sw	a4,4(a5)
    fic_irq_gpio_6();
     96a:	34b9                	jal	3b8 <fic_irq_gpio_6>
}
     96c:	50f2                	lw	ra,60(sp)
     96e:	52e2                	lw	t0,56(sp)
     970:	5352                	lw	t1,52(sp)
     972:	53c2                	lw	t2,48(sp)
     974:	5532                	lw	a0,44(sp)
     976:	55a2                	lw	a1,40(sp)
     978:	5612                	lw	a2,36(sp)
     97a:	5682                	lw	a3,32(sp)
     97c:	4772                	lw	a4,28(sp)
     97e:	47e2                	lw	a5,24(sp)
     980:	4852                	lw	a6,20(sp)
     982:	48c2                	lw	a7,16(sp)
     984:	4e32                	lw	t3,12(sp)
     986:	4ea2                	lw	t4,8(sp)
     988:	4f12                	lw	t5,4(sp)
     98a:	4f82                	lw	t6,0(sp)
     98c:	6121                	addi	sp,sp,64
     98e:	30200073          	mret
     992:	0001                	nop

00000994 <handler_irq_fast_gpio_5>:
{
     994:	7139                	addi	sp,sp,-64
     996:	de06                	sw	ra,60(sp)
     998:	dc16                	sw	t0,56(sp)
     99a:	da1a                	sw	t1,52(sp)
     99c:	d81e                	sw	t2,48(sp)
     99e:	d62a                	sw	a0,44(sp)
     9a0:	d42e                	sw	a1,40(sp)
     9a2:	d232                	sw	a2,36(sp)
     9a4:	d036                	sw	a3,32(sp)
     9a6:	ce3a                	sw	a4,28(sp)
     9a8:	cc3e                	sw	a5,24(sp)
     9aa:	ca42                	sw	a6,20(sp)
     9ac:	c846                	sw	a7,16(sp)
     9ae:	c672                	sw	t3,12(sp)
     9b0:	c476                	sw	t4,8(sp)
     9b2:	c27a                	sw	t5,4(sp)
     9b4:	c07e                	sw	t6,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     9b6:	20060737          	lui	a4,0x20060
     9ba:	6785                	lui	a5,0x1
     9bc:	80078793          	addi	a5,a5,-2048 # 800 <__heap_size>
     9c0:	c35c                	sw	a5,4(a4)
    fic_irq_gpio_5();
     9c2:	32d5                	jal	3a6 <fic_irq_gpio_5>
}
     9c4:	50f2                	lw	ra,60(sp)
     9c6:	52e2                	lw	t0,56(sp)
     9c8:	5352                	lw	t1,52(sp)
     9ca:	53c2                	lw	t2,48(sp)
     9cc:	5532                	lw	a0,44(sp)
     9ce:	55a2                	lw	a1,40(sp)
     9d0:	5612                	lw	a2,36(sp)
     9d2:	5682                	lw	a3,32(sp)
     9d4:	4772                	lw	a4,28(sp)
     9d6:	47e2                	lw	a5,24(sp)
     9d8:	4852                	lw	a6,20(sp)
     9da:	48c2                	lw	a7,16(sp)
     9dc:	4e32                	lw	t3,12(sp)
     9de:	4ea2                	lw	t4,8(sp)
     9e0:	4f12                	lw	t5,4(sp)
     9e2:	4f82                	lw	t6,0(sp)
     9e4:	6121                	addi	sp,sp,64
     9e6:	30200073          	mret
     9ea:	0001                	nop

000009ec <handler_irq_fast_gpio_4>:
{
     9ec:	7139                	addi	sp,sp,-64
     9ee:	de06                	sw	ra,60(sp)
     9f0:	dc16                	sw	t0,56(sp)
     9f2:	da1a                	sw	t1,52(sp)
     9f4:	d81e                	sw	t2,48(sp)
     9f6:	d62a                	sw	a0,44(sp)
     9f8:	d42e                	sw	a1,40(sp)
     9fa:	d232                	sw	a2,36(sp)
     9fc:	d036                	sw	a3,32(sp)
     9fe:	ce3a                	sw	a4,28(sp)
     a00:	cc3e                	sw	a5,24(sp)
     a02:	ca42                	sw	a6,20(sp)
     a04:	c846                	sw	a7,16(sp)
     a06:	c672                	sw	t3,12(sp)
     a08:	c476                	sw	t4,8(sp)
     a0a:	c27a                	sw	t5,4(sp)
     a0c:	c07e                	sw	t6,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     a0e:	200607b7          	lui	a5,0x20060
     a12:	40000713          	li	a4,1024
     a16:	c3d8                	sw	a4,4(a5)
    fic_irq_gpio_4();
     a18:	3ab5                	jal	394 <fic_irq_gpio_4>
}
     a1a:	50f2                	lw	ra,60(sp)
     a1c:	52e2                	lw	t0,56(sp)
     a1e:	5352                	lw	t1,52(sp)
     a20:	53c2                	lw	t2,48(sp)
     a22:	5532                	lw	a0,44(sp)
     a24:	55a2                	lw	a1,40(sp)
     a26:	5612                	lw	a2,36(sp)
     a28:	5682                	lw	a3,32(sp)
     a2a:	4772                	lw	a4,28(sp)
     a2c:	47e2                	lw	a5,24(sp)
     a2e:	4852                	lw	a6,20(sp)
     a30:	48c2                	lw	a7,16(sp)
     a32:	4e32                	lw	t3,12(sp)
     a34:	4ea2                	lw	t4,8(sp)
     a36:	4f12                	lw	t5,4(sp)
     a38:	4f82                	lw	t6,0(sp)
     a3a:	6121                	addi	sp,sp,64
     a3c:	30200073          	mret

00000a40 <handler_irq_fast_gpio_3>:
{
     a40:	7139                	addi	sp,sp,-64
     a42:	de06                	sw	ra,60(sp)
     a44:	dc16                	sw	t0,56(sp)
     a46:	da1a                	sw	t1,52(sp)
     a48:	d81e                	sw	t2,48(sp)
     a4a:	d62a                	sw	a0,44(sp)
     a4c:	d42e                	sw	a1,40(sp)
     a4e:	d232                	sw	a2,36(sp)
     a50:	d036                	sw	a3,32(sp)
     a52:	ce3a                	sw	a4,28(sp)
     a54:	cc3e                	sw	a5,24(sp)
     a56:	ca42                	sw	a6,20(sp)
     a58:	c846                	sw	a7,16(sp)
     a5a:	c672                	sw	t3,12(sp)
     a5c:	c476                	sw	t4,8(sp)
     a5e:	c27a                	sw	t5,4(sp)
     a60:	c07e                	sw	t6,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     a62:	200607b7          	lui	a5,0x20060
     a66:	20000713          	li	a4,512
     a6a:	c3d8                	sw	a4,4(a5)
    fic_irq_gpio_3();
     a6c:	3a19                	jal	382 <fic_irq_gpio_3>
}
     a6e:	50f2                	lw	ra,60(sp)
     a70:	52e2                	lw	t0,56(sp)
     a72:	5352                	lw	t1,52(sp)
     a74:	53c2                	lw	t2,48(sp)
     a76:	5532                	lw	a0,44(sp)
     a78:	55a2                	lw	a1,40(sp)
     a7a:	5612                	lw	a2,36(sp)
     a7c:	5682                	lw	a3,32(sp)
     a7e:	4772                	lw	a4,28(sp)
     a80:	47e2                	lw	a5,24(sp)
     a82:	4852                	lw	a6,20(sp)
     a84:	48c2                	lw	a7,16(sp)
     a86:	4e32                	lw	t3,12(sp)
     a88:	4ea2                	lw	t4,8(sp)
     a8a:	4f12                	lw	t5,4(sp)
     a8c:	4f82                	lw	t6,0(sp)
     a8e:	6121                	addi	sp,sp,64
     a90:	30200073          	mret

00000a94 <handler_irq_fast_gpio_2>:
{
     a94:	7139                	addi	sp,sp,-64
     a96:	de06                	sw	ra,60(sp)
     a98:	dc16                	sw	t0,56(sp)
     a9a:	da1a                	sw	t1,52(sp)
     a9c:	d81e                	sw	t2,48(sp)
     a9e:	d62a                	sw	a0,44(sp)
     aa0:	d42e                	sw	a1,40(sp)
     aa2:	d232                	sw	a2,36(sp)
     aa4:	d036                	sw	a3,32(sp)
     aa6:	ce3a                	sw	a4,28(sp)
     aa8:	cc3e                	sw	a5,24(sp)
     aaa:	ca42                	sw	a6,20(sp)
     aac:	c846                	sw	a7,16(sp)
     aae:	c672                	sw	t3,12(sp)
     ab0:	c476                	sw	t4,8(sp)
     ab2:	c27a                	sw	t5,4(sp)
     ab4:	c07e                	sw	t6,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     ab6:	200607b7          	lui	a5,0x20060
     aba:	10000713          	li	a4,256
     abe:	c3d8                	sw	a4,4(a5)
    fic_irq_gpio_2();
     ac0:	3845                	jal	370 <fic_irq_gpio_2>
}
     ac2:	50f2                	lw	ra,60(sp)
     ac4:	52e2                	lw	t0,56(sp)
     ac6:	5352                	lw	t1,52(sp)
     ac8:	53c2                	lw	t2,48(sp)
     aca:	5532                	lw	a0,44(sp)
     acc:	55a2                	lw	a1,40(sp)
     ace:	5612                	lw	a2,36(sp)
     ad0:	5682                	lw	a3,32(sp)
     ad2:	4772                	lw	a4,28(sp)
     ad4:	47e2                	lw	a5,24(sp)
     ad6:	4852                	lw	a6,20(sp)
     ad8:	48c2                	lw	a7,16(sp)
     ada:	4e32                	lw	t3,12(sp)
     adc:	4ea2                	lw	t4,8(sp)
     ade:	4f12                	lw	t5,4(sp)
     ae0:	4f82                	lw	t6,0(sp)
     ae2:	6121                	addi	sp,sp,64
     ae4:	30200073          	mret

00000ae8 <handler_irq_fast_gpio_1>:
{
     ae8:	7139                	addi	sp,sp,-64
     aea:	de06                	sw	ra,60(sp)
     aec:	dc16                	sw	t0,56(sp)
     aee:	da1a                	sw	t1,52(sp)
     af0:	d81e                	sw	t2,48(sp)
     af2:	d62a                	sw	a0,44(sp)
     af4:	d42e                	sw	a1,40(sp)
     af6:	d232                	sw	a2,36(sp)
     af8:	d036                	sw	a3,32(sp)
     afa:	ce3a                	sw	a4,28(sp)
     afc:	cc3e                	sw	a5,24(sp)
     afe:	ca42                	sw	a6,20(sp)
     b00:	c846                	sw	a7,16(sp)
     b02:	c672                	sw	t3,12(sp)
     b04:	c476                	sw	t4,8(sp)
     b06:	c27a                	sw	t5,4(sp)
     b08:	c07e                	sw	t6,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     b0a:	200607b7          	lui	a5,0x20060
     b0e:	08000713          	li	a4,128
     b12:	c3d8                	sw	a4,4(a5)
    fic_irq_gpio_1();
     b14:	30a9                	jal	35e <fic_irq_gpio_1>
}
     b16:	50f2                	lw	ra,60(sp)
     b18:	52e2                	lw	t0,56(sp)
     b1a:	5352                	lw	t1,52(sp)
     b1c:	53c2                	lw	t2,48(sp)
     b1e:	5532                	lw	a0,44(sp)
     b20:	55a2                	lw	a1,40(sp)
     b22:	5612                	lw	a2,36(sp)
     b24:	5682                	lw	a3,32(sp)
     b26:	4772                	lw	a4,28(sp)
     b28:	47e2                	lw	a5,24(sp)
     b2a:	4852                	lw	a6,20(sp)
     b2c:	48c2                	lw	a7,16(sp)
     b2e:	4e32                	lw	t3,12(sp)
     b30:	4ea2                	lw	t4,8(sp)
     b32:	4f12                	lw	t5,4(sp)
     b34:	4f82                	lw	t6,0(sp)
     b36:	6121                	addi	sp,sp,64
     b38:	30200073          	mret

00000b3c <handler_irq_fast_gpio_0>:
{
     b3c:	7139                	addi	sp,sp,-64
     b3e:	de06                	sw	ra,60(sp)
     b40:	dc16                	sw	t0,56(sp)
     b42:	da1a                	sw	t1,52(sp)
     b44:	d81e                	sw	t2,48(sp)
     b46:	d62a                	sw	a0,44(sp)
     b48:	d42e                	sw	a1,40(sp)
     b4a:	d232                	sw	a2,36(sp)
     b4c:	d036                	sw	a3,32(sp)
     b4e:	ce3a                	sw	a4,28(sp)
     b50:	cc3e                	sw	a5,24(sp)
     b52:	ca42                	sw	a6,20(sp)
     b54:	c846                	sw	a7,16(sp)
     b56:	c672                	sw	t3,12(sp)
     b58:	c476                	sw	t4,8(sp)
     b5a:	c27a                	sw	t5,4(sp)
     b5c:	c07e                	sw	t6,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     b5e:	200607b7          	lui	a5,0x20060
     b62:	04000713          	li	a4,64
     b66:	c3d8                	sw	a4,4(a5)
    fic_irq_gpio_0();
     b68:	fe4ff0ef          	jal	34c <fic_irq_gpio_0>
}
     b6c:	50f2                	lw	ra,60(sp)
     b6e:	52e2                	lw	t0,56(sp)
     b70:	5352                	lw	t1,52(sp)
     b72:	53c2                	lw	t2,48(sp)
     b74:	5532                	lw	a0,44(sp)
     b76:	55a2                	lw	a1,40(sp)
     b78:	5612                	lw	a2,36(sp)
     b7a:	5682                	lw	a3,32(sp)
     b7c:	4772                	lw	a4,28(sp)
     b7e:	47e2                	lw	a5,24(sp)
     b80:	4852                	lw	a6,20(sp)
     b82:	48c2                	lw	a7,16(sp)
     b84:	4e32                	lw	t3,12(sp)
     b86:	4ea2                	lw	t4,8(sp)
     b88:	4f12                	lw	t5,4(sp)
     b8a:	4f82                	lw	t6,0(sp)
     b8c:	6121                	addi	sp,sp,64
     b8e:	30200073          	mret
	...

00000b94 <handler_irq_fast_external_peripheral>:
{
     b94:	7139                	addi	sp,sp,-64
     b96:	de06                	sw	ra,60(sp)
     b98:	dc16                	sw	t0,56(sp)
     b9a:	da1a                	sw	t1,52(sp)
     b9c:	d81e                	sw	t2,48(sp)
     b9e:	d62a                	sw	a0,44(sp)
     ba0:	d42e                	sw	a1,40(sp)
     ba2:	d232                	sw	a2,36(sp)
     ba4:	d036                	sw	a3,32(sp)
     ba6:	ce3a                	sw	a4,28(sp)
     ba8:	cc3e                	sw	a5,24(sp)
     baa:	ca42                	sw	a6,20(sp)
     bac:	c846                	sw	a7,16(sp)
     bae:	c672                	sw	t3,12(sp)
     bb0:	c476                	sw	t4,8(sp)
     bb2:	c27a                	sw	t5,4(sp)
     bb4:	c07e                	sw	t6,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     bb6:	200607b7          	lui	a5,0x20060
     bba:	6721                	lui	a4,0x8
     bbc:	c3d8                	sw	a4,4(a5)
    fic_irq_ext_peripheral();
     bbe:	f7cff0ef          	jal	33a <fic_irq_ext_peripheral>
}
     bc2:	50f2                	lw	ra,60(sp)
     bc4:	52e2                	lw	t0,56(sp)
     bc6:	5352                	lw	t1,52(sp)
     bc8:	53c2                	lw	t2,48(sp)
     bca:	5532                	lw	a0,44(sp)
     bcc:	55a2                	lw	a1,40(sp)
     bce:	5612                	lw	a2,36(sp)
     bd0:	5682                	lw	a3,32(sp)
     bd2:	4772                	lw	a4,28(sp)
     bd4:	47e2                	lw	a5,24(sp)
     bd6:	4852                	lw	a6,20(sp)
     bd8:	48c2                	lw	a7,16(sp)
     bda:	4e32                	lw	t3,12(sp)
     bdc:	4ea2                	lw	t4,8(sp)
     bde:	4f12                	lw	t5,4(sp)
     be0:	4f82                	lw	t6,0(sp)
     be2:	6121                	addi	sp,sp,64
     be4:	30200073          	mret
     be8:	0001                	nop
	...

00000bec <handler_irq_fast_timer_3>:
{
     bec:	7139                	addi	sp,sp,-64
     bee:	de06                	sw	ra,60(sp)
     bf0:	dc16                	sw	t0,56(sp)
     bf2:	da1a                	sw	t1,52(sp)
     bf4:	d81e                	sw	t2,48(sp)
     bf6:	d62a                	sw	a0,44(sp)
     bf8:	d42e                	sw	a1,40(sp)
     bfa:	d232                	sw	a2,36(sp)
     bfc:	d036                	sw	a3,32(sp)
     bfe:	ce3a                	sw	a4,28(sp)
     c00:	cc3e                	sw	a5,24(sp)
     c02:	ca42                	sw	a6,20(sp)
     c04:	c846                	sw	a7,16(sp)
     c06:	c672                	sw	t3,12(sp)
     c08:	c476                	sw	t4,8(sp)
     c0a:	c27a                	sw	t5,4(sp)
     c0c:	c07e                	sw	t6,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     c0e:	200607b7          	lui	a5,0x20060
     c12:	4711                	li	a4,4
     c14:	c3d8                	sw	a4,4(a5)
    fic_irq_timer_3();
     c16:	f12ff0ef          	jal	328 <fic_irq_timer_3>
}
     c1a:	50f2                	lw	ra,60(sp)
     c1c:	52e2                	lw	t0,56(sp)
     c1e:	5352                	lw	t1,52(sp)
     c20:	53c2                	lw	t2,48(sp)
     c22:	5532                	lw	a0,44(sp)
     c24:	55a2                	lw	a1,40(sp)
     c26:	5612                	lw	a2,36(sp)
     c28:	5682                	lw	a3,32(sp)
     c2a:	4772                	lw	a4,28(sp)
     c2c:	47e2                	lw	a5,24(sp)
     c2e:	4852                	lw	a6,20(sp)
     c30:	48c2                	lw	a7,16(sp)
     c32:	4e32                	lw	t3,12(sp)
     c34:	4ea2                	lw	t4,8(sp)
     c36:	4f12                	lw	t5,4(sp)
     c38:	4f82                	lw	t6,0(sp)
     c3a:	6121                	addi	sp,sp,64
     c3c:	30200073          	mret
     c40:	0001                	nop
	...

00000c44 <handler_irq_fast_timer_2>:
{
     c44:	7139                	addi	sp,sp,-64
     c46:	de06                	sw	ra,60(sp)
     c48:	dc16                	sw	t0,56(sp)
     c4a:	da1a                	sw	t1,52(sp)
     c4c:	d81e                	sw	t2,48(sp)
     c4e:	d62a                	sw	a0,44(sp)
     c50:	d42e                	sw	a1,40(sp)
     c52:	d232                	sw	a2,36(sp)
     c54:	d036                	sw	a3,32(sp)
     c56:	ce3a                	sw	a4,28(sp)
     c58:	cc3e                	sw	a5,24(sp)
     c5a:	ca42                	sw	a6,20(sp)
     c5c:	c846                	sw	a7,16(sp)
     c5e:	c672                	sw	t3,12(sp)
     c60:	c476                	sw	t4,8(sp)
     c62:	c27a                	sw	t5,4(sp)
     c64:	c07e                	sw	t6,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     c66:	200607b7          	lui	a5,0x20060
     c6a:	4709                	li	a4,2
     c6c:	c3d8                	sw	a4,4(a5)
    fic_irq_timer_2();
     c6e:	ea8ff0ef          	jal	316 <fic_irq_timer_2>
}
     c72:	50f2                	lw	ra,60(sp)
     c74:	52e2                	lw	t0,56(sp)
     c76:	5352                	lw	t1,52(sp)
     c78:	53c2                	lw	t2,48(sp)
     c7a:	5532                	lw	a0,44(sp)
     c7c:	55a2                	lw	a1,40(sp)
     c7e:	5612                	lw	a2,36(sp)
     c80:	5682                	lw	a3,32(sp)
     c82:	4772                	lw	a4,28(sp)
     c84:	47e2                	lw	a5,24(sp)
     c86:	4852                	lw	a6,20(sp)
     c88:	48c2                	lw	a7,16(sp)
     c8a:	4e32                	lw	t3,12(sp)
     c8c:	4ea2                	lw	t4,8(sp)
     c8e:	4f12                	lw	t5,4(sp)
     c90:	4f82                	lw	t6,0(sp)
     c92:	6121                	addi	sp,sp,64
     c94:	30200073          	mret
     c98:	0001                	nop
	...

00000c9c <handler_irq_fast_timer_1>:
{
     c9c:	7139                	addi	sp,sp,-64
     c9e:	de06                	sw	ra,60(sp)
     ca0:	dc16                	sw	t0,56(sp)
     ca2:	da1a                	sw	t1,52(sp)
     ca4:	d81e                	sw	t2,48(sp)
     ca6:	d62a                	sw	a0,44(sp)
     ca8:	d42e                	sw	a1,40(sp)
     caa:	d232                	sw	a2,36(sp)
     cac:	d036                	sw	a3,32(sp)
     cae:	ce3a                	sw	a4,28(sp)
     cb0:	cc3e                	sw	a5,24(sp)
     cb2:	ca42                	sw	a6,20(sp)
     cb4:	c846                	sw	a7,16(sp)
     cb6:	c672                	sw	t3,12(sp)
     cb8:	c476                	sw	t4,8(sp)
     cba:	c27a                	sw	t5,4(sp)
     cbc:	c07e                	sw	t6,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     cbe:	200607b7          	lui	a5,0x20060
     cc2:	4705                	li	a4,1
     cc4:	c3d8                	sw	a4,4(a5)
    fic_irq_timer_1();
     cc6:	e3eff0ef          	jal	304 <fic_irq_timer_1>
}
     cca:	50f2                	lw	ra,60(sp)
     ccc:	52e2                	lw	t0,56(sp)
     cce:	5352                	lw	t1,52(sp)
     cd0:	53c2                	lw	t2,48(sp)
     cd2:	5532                	lw	a0,44(sp)
     cd4:	55a2                	lw	a1,40(sp)
     cd6:	5612                	lw	a2,36(sp)
     cd8:	5682                	lw	a3,32(sp)
     cda:	4772                	lw	a4,28(sp)
     cdc:	47e2                	lw	a5,24(sp)
     cde:	4852                	lw	a6,20(sp)
     ce0:	48c2                	lw	a7,16(sp)
     ce2:	4e32                	lw	t3,12(sp)
     ce4:	4ea2                	lw	t4,8(sp)
     ce6:	4f12                	lw	t5,4(sp)
     ce8:	4f82                	lw	t6,0(sp)
     cea:	6121                	addi	sp,sp,64
     cec:	30200073          	mret
     cf0:	0001                	nop
	...

00000cf4 <handler_irq_fast_dma_done>:
{
     cf4:	7139                	addi	sp,sp,-64
     cf6:	de06                	sw	ra,60(sp)
     cf8:	dc16                	sw	t0,56(sp)
     cfa:	da1a                	sw	t1,52(sp)
     cfc:	d81e                	sw	t2,48(sp)
     cfe:	d62a                	sw	a0,44(sp)
     d00:	d42e                	sw	a1,40(sp)
     d02:	d232                	sw	a2,36(sp)
     d04:	d036                	sw	a3,32(sp)
     d06:	ce3a                	sw	a4,28(sp)
     d08:	cc3e                	sw	a5,24(sp)
     d0a:	ca42                	sw	a6,20(sp)
     d0c:	c846                	sw	a7,16(sp)
     d0e:	c672                	sw	t3,12(sp)
     d10:	c476                	sw	t4,8(sp)
     d12:	c27a                	sw	t5,4(sp)
     d14:	c07e                	sw	t6,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     d16:	200607b7          	lui	a5,0x20060
     d1a:	4721                	li	a4,8
     d1c:	c3d8                	sw	a4,4(a5)
    fic_irq_dma_done();
     d1e:	d4aff0ef          	jal	268 <fic_irq_dma_done>
}
     d22:	50f2                	lw	ra,60(sp)
     d24:	52e2                	lw	t0,56(sp)
     d26:	5352                	lw	t1,52(sp)
     d28:	53c2                	lw	t2,48(sp)
     d2a:	5532                	lw	a0,44(sp)
     d2c:	55a2                	lw	a1,40(sp)
     d2e:	5612                	lw	a2,36(sp)
     d30:	5682                	lw	a3,32(sp)
     d32:	4772                	lw	a4,28(sp)
     d34:	47e2                	lw	a5,24(sp)
     d36:	4852                	lw	a6,20(sp)
     d38:	48c2                	lw	a7,16(sp)
     d3a:	4e32                	lw	t3,12(sp)
     d3c:	4ea2                	lw	t4,8(sp)
     d3e:	4f12                	lw	t5,4(sp)
     d40:	4f82                	lw	t6,0(sp)
     d42:	6121                	addi	sp,sp,64
     d44:	30200073          	mret
     d48:	0001                	nop
	...

00000d4c <handler_irq_fast_dma_window>:
{
     d4c:	7139                	addi	sp,sp,-64
     d4e:	de06                	sw	ra,60(sp)
     d50:	dc16                	sw	t0,56(sp)
     d52:	da1a                	sw	t1,52(sp)
     d54:	d81e                	sw	t2,48(sp)
     d56:	d62a                	sw	a0,44(sp)
     d58:	d42e                	sw	a1,40(sp)
     d5a:	d232                	sw	a2,36(sp)
     d5c:	d036                	sw	a3,32(sp)
     d5e:	ce3a                	sw	a4,28(sp)
     d60:	cc3e                	sw	a5,24(sp)
     d62:	ca42                	sw	a6,20(sp)
     d64:	c846                	sw	a7,16(sp)
     d66:	c672                	sw	t3,12(sp)
     d68:	c476                	sw	t4,8(sp)
     d6a:	c27a                	sw	t5,4(sp)
     d6c:	c07e                	sw	t6,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     d6e:	200607b7          	lui	a5,0x20060
     d72:	6711                	lui	a4,0x4
     d74:	c3d8                	sw	a4,4(a5)
    fic_irq_dma_window();
     d76:	c9eff0ef          	jal	214 <fic_irq_dma_window>
}
     d7a:	50f2                	lw	ra,60(sp)
     d7c:	52e2                	lw	t0,56(sp)
     d7e:	5352                	lw	t1,52(sp)
     d80:	53c2                	lw	t2,48(sp)
     d82:	5532                	lw	a0,44(sp)
     d84:	55a2                	lw	a1,40(sp)
     d86:	5612                	lw	a2,36(sp)
     d88:	5682                	lw	a3,32(sp)
     d8a:	4772                	lw	a4,28(sp)
     d8c:	47e2                	lw	a5,24(sp)
     d8e:	4852                	lw	a6,20(sp)
     d90:	48c2                	lw	a7,16(sp)
     d92:	4e32                	lw	t3,12(sp)
     d94:	4ea2                	lw	t4,8(sp)
     d96:	4f12                	lw	t5,4(sp)
     d98:	4f82                	lw	t6,0(sp)
     d9a:	6121                	addi	sp,sp,64
     d9c:	30200073          	mret
     da0:	0001                	nop
	...

00000da4 <handler_exception>:
  };
}

// Below functions are default weak exception handlers meant to be overriden
__attribute__((weak)) void handler_exception(void) {
     da4:	7139                	addi	sp,sp,-64
     da6:	de06                	sw	ra,60(sp)
     da8:	dc16                	sw	t0,56(sp)
     daa:	da1a                	sw	t1,52(sp)
     dac:	d81e                	sw	t2,48(sp)
     dae:	d62a                	sw	a0,44(sp)
     db0:	d42e                	sw	a1,40(sp)
     db2:	d232                	sw	a2,36(sp)
     db4:	d036                	sw	a3,32(sp)
     db6:	ce3a                	sw	a4,28(sp)
     db8:	cc3e                	sw	a5,24(sp)
     dba:	ca42                	sw	a6,20(sp)
     dbc:	c846                	sw	a7,16(sp)
     dbe:	c672                	sw	t3,12(sp)
     dc0:	c476                	sw	t4,8(sp)
     dc2:	c27a                	sw	t5,4(sp)
     dc4:	c07e                	sw	t6,0(sp)
  uint32_t mcause;
  exc_id_t exc_cause;

  CSR_READ(CSR_REG_MCAUSE, &mcause);
     dc6:	342027f3          	csrr	a5,mcause
  exc_cause = (exc_id_t)(mcause & kIdMax);
     dca:	8bfd                	andi	a5,a5,31

  switch (exc_cause) {
     dcc:	472d                	li	a4,11
     dce:	04f76663          	bltu	a4,a5,e1a <handler_exception+0x76>
     dd2:	6729                	lui	a4,0xa
     dd4:	51c70713          	addi	a4,a4,1308 # a51c <heap.cpp.7337fd52+0x394>
     dd8:	20e7c7b3          	sh2add	a5,a5,a4
     ddc:	439c                	lw	a5,0(a5)
     dde:	8782                	jr	a5
  while (1) {
  }
}

__attribute__((weak)) void handler_instr_acc_fault(void) {
  print_exc_msg("Instruction access fault, mtval shows fault address\n");
     de0:	6529                	lui	a0,0xa
     de2:	5ec50513          	addi	a0,a0,1516 # a5ec <heap.cpp.7337fd52+0x464>
     de6:	3261                	jal	76e <print_exc_msg>
     de8:	6529                	lui	a0,0xa
     dea:	5ec50513          	addi	a0,a0,1516 # a5ec <heap.cpp.7337fd52+0x464>
     dee:	3241                	jal	76e <print_exc_msg>
}

__attribute__((weak)) void handler_instr_ill_fault(void) {
  print_exc_msg( "Illegal Instruction fault, mtval shows instruction content\n");
     df0:	6529                	lui	a0,0xa
     df2:	62450513          	addi	a0,a0,1572 # a624 <heap.cpp.7337fd52+0x49c>
     df6:	3aa5                	jal	76e <print_exc_msg>
}

__attribute__((weak)) void handler_bkpt(void) {
  print_exc_msg("Breakpoint triggerd, mtval shows the breakpoint address\n");
     df8:	6529                	lui	a0,0xa
     dfa:	66050513          	addi	a0,a0,1632 # a660 <heap.cpp.7337fd52+0x4d8>
     dfe:	3a85                	jal	76e <print_exc_msg>
}

__attribute__((weak)) void handler_lsu_fault(void) {
  print_exc_msg("Load/Store fault, mtval shows the fault address\n");
     e00:	6529                	lui	a0,0xa
     e02:	69c50513          	addi	a0,a0,1692 # a69c <heap.cpp.7337fd52+0x514>
     e06:	32a5                	jal	76e <print_exc_msg>
     e08:	6529                	lui	a0,0xa
     e0a:	69c50513          	addi	a0,a0,1692 # a69c <heap.cpp.7337fd52+0x514>
     e0e:	3285                	jal	76e <print_exc_msg>
}

__attribute__((weak)) void handler_ecall(void) {
  _writestr("Environment call encountered\n");
     e10:	6529                	lui	a0,0xa
     e12:	6d050513          	addi	a0,a0,1744 # a6d0 <heap.cpp.7337fd52+0x548>
     e16:	3a2d                	jal	750 <_writestr>
  while (1) {
     e18:	a001                	j	e18 <handler_exception+0x74>
      while (1) {
     e1a:	a001                	j	e1a <handler_exception+0x76>

00000e1c <handler_irq_software>:
__attribute__((weak)) void handler_irq_software(void) {
     e1c:	7139                	addi	sp,sp,-64
     e1e:	de06                	sw	ra,60(sp)
     e20:	dc16                	sw	t0,56(sp)
     e22:	da1a                	sw	t1,52(sp)
     e24:	d81e                	sw	t2,48(sp)
     e26:	d62a                	sw	a0,44(sp)
     e28:	d42e                	sw	a1,40(sp)
     e2a:	d232                	sw	a2,36(sp)
     e2c:	d036                	sw	a3,32(sp)
     e2e:	ce3a                	sw	a4,28(sp)
     e30:	cc3e                	sw	a5,24(sp)
     e32:	ca42                	sw	a6,20(sp)
     e34:	c846                	sw	a7,16(sp)
     e36:	c672                	sw	t3,12(sp)
     e38:	c476                	sw	t4,8(sp)
     e3a:	c27a                	sw	t5,4(sp)
     e3c:	c07e                	sw	t6,0(sp)
  _writestr("Software IRQ triggered!\n"); 
     e3e:	6529                	lui	a0,0xa
     e40:	6f050513          	addi	a0,a0,1776 # a6f0 <heap.cpp.7337fd52+0x568>
     e44:	3231                	jal	750 <_writestr>
  while (1) {
     e46:	a001                	j	e46 <handler_irq_software+0x2a>
     e48:	0001                	nop
	...

00000e4c <handler_irq_timer>:
__attribute__((weak)) void handler_irq_timer(void) {
     e4c:	7139                	addi	sp,sp,-64
     e4e:	de06                	sw	ra,60(sp)
     e50:	dc16                	sw	t0,56(sp)
     e52:	da1a                	sw	t1,52(sp)
     e54:	d81e                	sw	t2,48(sp)
     e56:	d62a                	sw	a0,44(sp)
     e58:	d42e                	sw	a1,40(sp)
     e5a:	d232                	sw	a2,36(sp)
     e5c:	d036                	sw	a3,32(sp)
     e5e:	ce3a                	sw	a4,28(sp)
     e60:	cc3e                	sw	a5,24(sp)
     e62:	ca42                	sw	a6,20(sp)
     e64:	c846                	sw	a7,16(sp)
     e66:	c672                	sw	t3,12(sp)
     e68:	c476                	sw	t4,8(sp)
     e6a:	c27a                	sw	t5,4(sp)
     e6c:	c07e                	sw	t6,0(sp)
  _writestr("Timer IRQ triggered!\n"); 
     e6e:	6529                	lui	a0,0xa
     e70:	70c50513          	addi	a0,a0,1804 # a70c <heap.cpp.7337fd52+0x584>
     e74:	38f1                	jal	750 <_writestr>
  while (1) {
     e76:	a001                	j	e76 <handler_irq_timer+0x2a>
     e78:	0001                	nop

00000e7a <init>:
#endif

int init()
{
    return 0;
}
     e7a:	4501                	li	a0,0
     e7c:	8082                	ret

00000e7e <_close>:
}
     e7e:	557d                	li	a0,-1
     e80:	8082                	ret

00000e82 <_exit>:
  ((volatile uint32_t *)base.base)[offset / sizeof(uint32_t)] = value;
     e82:	200007b7          	lui	a5,0x20000
     e86:	c3c8                	sw	a0,4(a5)
  ((volatile uint8_t *)base.base)[offset / sizeof(uint8_t)] = value;
     e88:	4705                	li	a4,1
     e8a:	00e78023          	sb	a4,0(a5) # 20000000 <_sp+0x1fff3bb0>
    asm volatile("wfi");
     e8e:	10500073          	wfi

00000e92 <_fstat>:
    st->st_mode = S_IFCHR;
     e92:	6789                	lui	a5,0x2
     e94:	c1dc                	sw	a5,4(a1)
}
     e96:	4501                	li	a0,0
     e98:	8082                	ret

00000e9a <_isatty>:
    return (file == STDOUT_FILENO);
     e9a:	157d                	addi	a0,a0,-1
}
     e9c:	00153513          	seqz	a0,a0
     ea0:	8082                	ret

00000ea2 <_lseek>:
}
     ea2:	4501                	li	a0,0
     ea4:	8082                	ret

00000ea6 <_read>:
}
     ea6:	4501                	li	a0,0
     ea8:	8082                	ret

00000eaa <_write_r>:
{
     eaa:	1141                	addi	sp,sp,-16
     eac:	c606                	sw	ra,12(sp)
     eae:	852e                	mv	a0,a1
     eb0:	85b2                	mv	a1,a2
    return _write(fd,buf,cnt);
     eb2:	8636                	mv	a2,a3
     eb4:	d78ff0ef          	jal	42c <_write>
}
     eb8:	40b2                	lw	ra,12(sp)
     eba:	0141                	addi	sp,sp,16
     ebc:	8082                	ret

00000ebe <_sbrk>:
        return -1; 
    }
}

void *_sbrk(ptrdiff_t incr)
{
     ebe:	87aa                	mv	a5,a0
    char *old_brk = brk;

    if (__heap_start == __heap_end) {
     ec0:	b8c18693          	addi	a3,gp,-1140 # b44c <__BSS_END__>
     ec4:	6731                	lui	a4,0xc
     ec6:	c4c70713          	addi	a4,a4,-948 # bc4c <__heap_end>
     eca:	00e68f63          	beq	a3,a4,ee8 <_sbrk+0x2a>
    char *old_brk = brk;
     ece:	9301a503          	lw	a0,-1744(gp) # b1f0 <brk>
        return NULL; 
    }

    if (brk + incr < __heap_end && brk + incr >= __heap_start) {
     ed2:	97aa                	add	a5,a5,a0
     ed4:	00d7ec63          	bltu	a5,a3,eec <_sbrk+0x2e>
     ed8:	6731                	lui	a4,0xc
     eda:	c4c70713          	addi	a4,a4,-948 # bc4c <__heap_end>
     ede:	00e7f763          	bgeu	a5,a4,eec <_sbrk+0x2e>
        brk += incr;
     ee2:	92f1a823          	sw	a5,-1744(gp) # b1f0 <brk>
    } else {
        return (void *)-1; 
    }
    return old_brk;
     ee6:	8082                	ret
        return NULL; 
     ee8:	4501                	li	a0,0
     eea:	8082                	ret
        return (void *)-1; 
     eec:	557d                	li	a0,-1
}
     eee:	8082                	ret

00000ef0 <spi_intr_handler_event_flash>:
/**
 * @brief Implementation of the weak function of the HAL
 */
void spi_intr_handler_event_flash(spi_event_e events) 
{
    if (SPI_NOT_BUSY(peripherals[SPI_IDX_FLASH])) return;
     ef0:	67ad                	lui	a5,0xb
     ef2:	0c078793          	addi	a5,a5,192 # b0c0 <peripherals>
     ef6:	4b98                	lw	a4,16(a5)
     ef8:	4789                	li	a5,2
     efa:	00f70363          	beq	a4,a5,f00 <spi_intr_handler_event_flash+0x10>
     efe:	8082                	ret
{
     f00:	1141                	addi	sp,sp,-16
     f02:	c606                	sw	ra,12(sp)
    spi_event_handler(&peripherals[SPI_IDX_FLASH], events);
     f04:	85aa                	mv	a1,a0
     f06:	652d                	lui	a0,0xb
     f08:	0c050513          	addi	a0,a0,192 # b0c0 <peripherals>
     f0c:	dd8ff0ef          	jal	4e4 <spi_event_handler>
}
     f10:	40b2                	lw	ra,12(sp)
     f12:	0141                	addi	sp,sp,16
     f14:	8082                	ret

00000f16 <spi_intr_handler_error_flash>:
/**
 * @brief Implementation of the weak function of the HAL
 */
void spi_intr_handler_error_flash(spi_error_e errors) 
{
    if (SPI_NOT_BUSY(peripherals[SPI_IDX_FLASH])) return;
     f16:	67ad                	lui	a5,0xb
     f18:	0c078793          	addi	a5,a5,192 # b0c0 <peripherals>
     f1c:	4b98                	lw	a4,16(a5)
     f1e:	4789                	li	a5,2
     f20:	00f70363          	beq	a4,a5,f26 <spi_intr_handler_error_flash+0x10>
     f24:	8082                	ret
{
     f26:	1141                	addi	sp,sp,-16
     f28:	c606                	sw	ra,12(sp)
    spi_error_handler(&peripherals[SPI_IDX_FLASH], errors);
     f2a:	85aa                	mv	a1,a0
     f2c:	652d                	lui	a0,0xb
     f2e:	0c050513          	addi	a0,a0,192 # b0c0 <peripherals>
     f32:	f10ff0ef          	jal	642 <spi_error_handler>
}
     f36:	40b2                	lw	ra,12(sp)
     f38:	0141                	addi	sp,sp,16
     f3a:	8082                	ret

00000f3c <fic_irq_spi_flash>:
{
     f3c:	1101                	addi	sp,sp,-32
     f3e:	ce06                	sw	ra,28(sp)
    *errors = bitfield_read(SPI_HW(spi)->ERROR_STATUS, SPI_ERROR_ALL, SPI_ERRORS_INDEX);
     f40:	200207b7          	lui	a5,0x20020
     f44:	5bc8                	lw	a0,52(a5)
  return (bitfield >> index) & mask;
     f46:	03f57513          	andi	a0,a0,63
    if (errors) {
     f4a:	c509                	beqz	a0,f54 <fic_irq_spi_flash+0x18>
        spi_intr_handler_error_flash(errors);
     f4c:	37e9                	jal	f16 <spi_intr_handler_error_flash>
}
     f4e:	40f2                	lw	ra,28(sp)
     f50:	6105                	addi	sp,sp,32
     f52:	8082                	ret

spi_return_flags_e spi_acknowledge_event(spi_host_t* spi) {
    // We do not need any NULL check since this function is made to be called
    // __ONLY__ from `handler_irq_spi`, `fic_irq_spi`, `fic_irq_spi_flash`.
    // Therefore we know that spi argument will not be NULL.
    SPI_HW(spi)->INTR_STATE = bitfield_write(SPI_HW(spi)->INTR_STATE, BIT_MASK_1, 
     f54:	20020737          	lui	a4,0x20020
     f58:	431c                	lw	a5,0(a4)
  bitfield |= (value & mask) << index;
     f5a:	0027e793          	ori	a5,a5,2
     f5e:	c31c                	sw	a5,0(a4)
        spi_get_events(spi_flash, &events);
     f60:	006c                	addi	a1,sp,12
     f62:	853a                	mv	a0,a4
     f64:	c78ff0ef          	jal	3dc <spi_get_events>
        spi_intr_handler_event_flash(events);
     f68:	4532                	lw	a0,12(sp)
     f6a:	3759                	jal	ef0 <spi_intr_handler_event_flash>
}
     f6c:	b7cd                	j	f4e <fic_irq_spi_flash+0x12>
	...

00000f70 <handler_irq_fast_spi_flash>:
{
     f70:	7139                	addi	sp,sp,-64
     f72:	de06                	sw	ra,60(sp)
     f74:	dc16                	sw	t0,56(sp)
     f76:	da1a                	sw	t1,52(sp)
     f78:	d81e                	sw	t2,48(sp)
     f7a:	d62a                	sw	a0,44(sp)
     f7c:	d42e                	sw	a1,40(sp)
     f7e:	d232                	sw	a2,36(sp)
     f80:	d036                	sw	a3,32(sp)
     f82:	ce3a                	sw	a4,28(sp)
     f84:	cc3e                	sw	a5,24(sp)
     f86:	ca42                	sw	a6,20(sp)
     f88:	c846                	sw	a7,16(sp)
     f8a:	c672                	sw	t3,12(sp)
     f8c:	c476                	sw	t4,8(sp)
     f8e:	c27a                	sw	t5,4(sp)
     f90:	c07e                	sw	t6,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     f92:	200607b7          	lui	a5,0x20060
     f96:	02000713          	li	a4,32
     f9a:	c3d8                	sw	a4,4(a5)
    fic_irq_spi_flash();
     f9c:	3745                	jal	f3c <fic_irq_spi_flash>
}
     f9e:	50f2                	lw	ra,60(sp)
     fa0:	52e2                	lw	t0,56(sp)
     fa2:	5352                	lw	t1,52(sp)
     fa4:	53c2                	lw	t2,48(sp)
     fa6:	5532                	lw	a0,44(sp)
     fa8:	55a2                	lw	a1,40(sp)
     faa:	5612                	lw	a2,36(sp)
     fac:	5682                	lw	a3,32(sp)
     fae:	4772                	lw	a4,28(sp)
     fb0:	47e2                	lw	a5,24(sp)
     fb2:	4852                	lw	a6,20(sp)
     fb4:	48c2                	lw	a7,16(sp)
     fb6:	4e32                	lw	t3,12(sp)
     fb8:	4ea2                	lw	t4,8(sp)
     fba:	4f12                	lw	t5,4(sp)
     fbc:	4f82                	lw	t6,0(sp)
     fbe:	6121                	addi	sp,sp,64
     fc0:	30200073          	mret

00000fc4 <spi_intr_handler_event_host>:
/**
 * @brief Implementation of the weak function of the HAL
 */
void spi_intr_handler_event_host(spi_event_e events) 
{
    if (SPI_NOT_BUSY(peripherals[SPI_IDX_HOST])) return;
     fc4:	67ad                	lui	a5,0xb
     fc6:	0c078793          	addi	a5,a5,192 # b0c0 <peripherals>
     fca:	4fb8                	lw	a4,88(a5)
     fcc:	4789                	li	a5,2
     fce:	00f70363          	beq	a4,a5,fd4 <spi_intr_handler_event_host+0x10>
     fd2:	8082                	ret
{
     fd4:	1141                	addi	sp,sp,-16
     fd6:	c606                	sw	ra,12(sp)
    spi_event_handler(&peripherals[SPI_IDX_HOST], events);
     fd8:	85aa                	mv	a1,a0
     fda:	652d                	lui	a0,0xb
     fdc:	10850513          	addi	a0,a0,264 # b108 <peripherals+0x48>
     fe0:	d04ff0ef          	jal	4e4 <spi_event_handler>
}
     fe4:	40b2                	lw	ra,12(sp)
     fe6:	0141                	addi	sp,sp,16
     fe8:	8082                	ret

00000fea <spi_intr_handler_error_host>:
/**
 * @brief Implementation of the weak function of the HAL
 */
void spi_intr_handler_error_host(spi_error_e errors) 
{
    if (SPI_NOT_BUSY(peripherals[SPI_IDX_HOST])) return;
     fea:	67ad                	lui	a5,0xb
     fec:	0c078793          	addi	a5,a5,192 # b0c0 <peripherals>
     ff0:	4fb8                	lw	a4,88(a5)
     ff2:	4789                	li	a5,2
     ff4:	00f70363          	beq	a4,a5,ffa <spi_intr_handler_error_host+0x10>
     ff8:	8082                	ret
{
     ffa:	1141                	addi	sp,sp,-16
     ffc:	c606                	sw	ra,12(sp)
    spi_error_handler(&peripherals[SPI_IDX_HOST], errors);
     ffe:	85aa                	mv	a1,a0
    1000:	652d                	lui	a0,0xb
    1002:	10850513          	addi	a0,a0,264 # b108 <peripherals+0x48>
    1006:	e3cff0ef          	jal	642 <spi_error_handler>
}
    100a:	40b2                	lw	ra,12(sp)
    100c:	0141                	addi	sp,sp,16
    100e:	8082                	ret

00001010 <fic_irq_spi>:
{
    1010:	1101                	addi	sp,sp,-32
    1012:	ce06                	sw	ra,28(sp)
    *errors = bitfield_read(SPI_HW(spi)->ERROR_STATUS, SPI_ERROR_ALL, SPI_ERRORS_INDEX);
    1014:	300107b7          	lui	a5,0x30010
    1018:	5bc8                	lw	a0,52(a5)
  return (bitfield >> index) & mask;
    101a:	03f57513          	andi	a0,a0,63
    if (errors) {
    101e:	c509                	beqz	a0,1028 <fic_irq_spi+0x18>
        spi_intr_handler_error_host(errors);
    1020:	37e9                	jal	fea <spi_intr_handler_error_host>
}
    1022:	40f2                	lw	ra,28(sp)
    1024:	6105                	addi	sp,sp,32
    1026:	8082                	ret
    SPI_HW(spi)->INTR_STATE = bitfield_write(SPI_HW(spi)->INTR_STATE, BIT_MASK_1, 
    1028:	30010737          	lui	a4,0x30010
    102c:	431c                	lw	a5,0(a4)
  bitfield |= (value & mask) << index;
    102e:	0027e793          	ori	a5,a5,2
    1032:	c31c                	sw	a5,0(a4)
        spi_get_events(spi_host1, &events);
    1034:	006c                	addi	a1,sp,12
    1036:	853a                	mv	a0,a4
    1038:	ba4ff0ef          	jal	3dc <spi_get_events>
        spi_intr_handler_event_host(events);
    103c:	4532                	lw	a0,12(sp)
    103e:	3759                	jal	fc4 <spi_intr_handler_event_host>
}
    1040:	b7cd                	j	1022 <fic_irq_spi+0x12>
	...

00001044 <handler_irq_fast_spi>:
{
    1044:	7139                	addi	sp,sp,-64
    1046:	de06                	sw	ra,60(sp)
    1048:	dc16                	sw	t0,56(sp)
    104a:	da1a                	sw	t1,52(sp)
    104c:	d81e                	sw	t2,48(sp)
    104e:	d62a                	sw	a0,44(sp)
    1050:	d42e                	sw	a1,40(sp)
    1052:	d232                	sw	a2,36(sp)
    1054:	d036                	sw	a3,32(sp)
    1056:	ce3a                	sw	a4,28(sp)
    1058:	cc3e                	sw	a5,24(sp)
    105a:	ca42                	sw	a6,20(sp)
    105c:	c846                	sw	a7,16(sp)
    105e:	c672                	sw	t3,12(sp)
    1060:	c476                	sw	t4,8(sp)
    1062:	c27a                	sw	t5,4(sp)
    1064:	c07e                	sw	t6,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1066:	200607b7          	lui	a5,0x20060
    106a:	4741                	li	a4,16
    106c:	c3d8                	sw	a4,4(a5)
    fic_irq_spi();
    106e:	374d                	jal	1010 <fic_irq_spi>
}
    1070:	50f2                	lw	ra,60(sp)
    1072:	52e2                	lw	t0,56(sp)
    1074:	5352                	lw	t1,52(sp)
    1076:	53c2                	lw	t2,48(sp)
    1078:	5532                	lw	a0,44(sp)
    107a:	55a2                	lw	a1,40(sp)
    107c:	5612                	lw	a2,36(sp)
    107e:	5682                	lw	a3,32(sp)
    1080:	4772                	lw	a4,28(sp)
    1082:	47e2                	lw	a5,24(sp)
    1084:	4852                	lw	a6,20(sp)
    1086:	48c2                	lw	a7,16(sp)
    1088:	4e32                	lw	t3,12(sp)
    108a:	4ea2                	lw	t4,8(sp)
    108c:	4f12                	lw	t5,4(sp)
    108e:	4f82                	lw	t6,0(sp)
    1090:	6121                	addi	sp,sp,64
    1092:	30200073          	mret
    1096:	0001                	nop

00001098 <atexit>:
    1098:	85aa                	mv	a1,a0
    109a:	4681                	li	a3,0
    109c:	4601                	li	a2,0
    109e:	4501                	li	a0,0
    10a0:	ae0d                	j	13d2 <__register_exitproc>

000010a2 <std>:
    10a2:	1141                	addi	sp,sp,-16
    10a4:	c422                	sw	s0,8(sp)
    10a6:	c606                	sw	ra,12(sp)
    10a8:	842a                	mv	s0,a0
    10aa:	00b51623          	sh	a1,12(a0)
    10ae:	00c51723          	sh	a2,14(a0)
    10b2:	00052023          	sw	zero,0(a0)
    10b6:	00052223          	sw	zero,4(a0)
    10ba:	00052423          	sw	zero,8(a0)
    10be:	06052223          	sw	zero,100(a0)
    10c2:	00052823          	sw	zero,16(a0)
    10c6:	00052a23          	sw	zero,20(a0)
    10ca:	00052c23          	sw	zero,24(a0)
    10ce:	4621                	li	a2,8
    10d0:	4581                	li	a1,0
    10d2:	05c50513          	addi	a0,a0,92
    10d6:	24f5                	jal	13c2 <memset>
    10d8:	6785                	lui	a5,0x1
    10da:	1f678793          	addi	a5,a5,502 # 11f6 <__sread>
    10de:	d05c                	sw	a5,36(s0)
    10e0:	6785                	lui	a5,0x1
    10e2:	22678793          	addi	a5,a5,550 # 1226 <__swrite>
    10e6:	d41c                	sw	a5,40(s0)
    10e8:	6785                	lui	a5,0x1
    10ea:	27478793          	addi	a5,a5,628 # 1274 <__sseek>
    10ee:	d45c                	sw	a5,44(s0)
    10f0:	6785                	lui	a5,0x1
    10f2:	2ae78793          	addi	a5,a5,686 # 12ae <__sclose>
    10f6:	40b2                	lw	ra,12(sp)
    10f8:	d000                	sw	s0,32(s0)
    10fa:	d81c                	sw	a5,48(s0)
    10fc:	4422                	lw	s0,8(sp)
    10fe:	0141                	addi	sp,sp,16
    1100:	8082                	ret

00001102 <stdio_exit_handler>:
    1102:	6589                	lui	a1,0x2
    1104:	8d818613          	addi	a2,gp,-1832 # b198 <__sglue>
    1108:	82e58593          	addi	a1,a1,-2002 # 182e <_fflush_r>
    110c:	8e418513          	addi	a0,gp,-1820 # b1a4 <_impure_data>
    1110:	a059                	j	1196 <_fwalk_sglue>

00001112 <cleanup_stdio>:
    1112:	414c                	lw	a1,4(a0)
    1114:	1141                	addi	sp,sp,-16
    1116:	c422                	sw	s0,8(sp)
    1118:	c606                	sw	ra,12(sp)
    111a:	98c18793          	addi	a5,gp,-1652 # b24c <__sf>
    111e:	842a                	mv	s0,a0
    1120:	00f58363          	beq	a1,a5,1126 <cleanup_stdio+0x14>
    1124:	2729                	jal	182e <_fflush_r>
    1126:	440c                	lw	a1,8(s0)
    1128:	9f418793          	addi	a5,gp,-1548 # b2b4 <__sf+0x68>
    112c:	00f58463          	beq	a1,a5,1134 <cleanup_stdio+0x22>
    1130:	8522                	mv	a0,s0
    1132:	2df5                	jal	182e <_fflush_r>
    1134:	444c                	lw	a1,12(s0)
    1136:	a5c18793          	addi	a5,gp,-1444 # b31c <__sf+0xd0>
    113a:	00f58763          	beq	a1,a5,1148 <cleanup_stdio+0x36>
    113e:	8522                	mv	a0,s0
    1140:	4422                	lw	s0,8(sp)
    1142:	40b2                	lw	ra,12(sp)
    1144:	0141                	addi	sp,sp,16
    1146:	a5e5                	j	182e <_fflush_r>
    1148:	40b2                	lw	ra,12(sp)
    114a:	4422                	lw	s0,8(sp)
    114c:	0141                	addi	sp,sp,16
    114e:	8082                	ret

00001150 <global_stdio_init.part.0>:
    1150:	6785                	lui	a5,0x1
    1152:	1141                	addi	sp,sp,-16
    1154:	10278793          	addi	a5,a5,258 # 1102 <stdio_exit_handler>
    1158:	4601                	li	a2,0
    115a:	4591                	li	a1,4
    115c:	98c18513          	addi	a0,gp,-1652 # b24c <__sf>
    1160:	c606                	sw	ra,12(sp)
    1162:	92f1ac23          	sw	a5,-1736(gp) # b1f8 <__stdio_exit_handler>
    1166:	3f35                	jal	10a2 <std>
    1168:	4605                	li	a2,1
    116a:	45a5                	li	a1,9
    116c:	9f418513          	addi	a0,gp,-1548 # b2b4 <__sf+0x68>
    1170:	3f0d                	jal	10a2 <std>
    1172:	40b2                	lw	ra,12(sp)
    1174:	4609                	li	a2,2
    1176:	45c9                	li	a1,18
    1178:	a5c18513          	addi	a0,gp,-1444 # b31c <__sf+0xd0>
    117c:	0141                	addi	sp,sp,16
    117e:	b715                	j	10a2 <std>

00001180 <__sinit>:
    1180:	511c                	lw	a5,32(a0)
    1182:	eb89                	bnez	a5,1194 <__sinit+0x14>
    1184:	6785                	lui	a5,0x1
    1186:	11278793          	addi	a5,a5,274 # 1112 <cleanup_stdio>
    118a:	d11c                	sw	a5,32(a0)
    118c:	9381a783          	lw	a5,-1736(gp) # b1f8 <__stdio_exit_handler>
    1190:	e391                	bnez	a5,1194 <__sinit+0x14>
    1192:	bf7d                	j	1150 <global_stdio_init.part.0>
    1194:	8082                	ret

00001196 <_fwalk_sglue>:
    1196:	7179                	addi	sp,sp,-48
    1198:	d422                	sw	s0,40(sp)
    119a:	d04a                	sw	s2,32(sp)
    119c:	ce4e                	sw	s3,28(sp)
    119e:	cc52                	sw	s4,24(sp)
    11a0:	ca56                	sw	s5,20(sp)
    11a2:	d606                	sw	ra,44(sp)
    11a4:	d226                	sw	s1,36(sp)
    11a6:	8a2a                	mv	s4,a0
    11a8:	8aae                	mv	s5,a1
    11aa:	4401                	li	s0,0
    11ac:	4905                	li	s2,1
    11ae:	59fd                	li	s3,-1
    11b0:	460c                	lw	a1,8(a2)
    11b2:	4244                	lw	s1,4(a2)
    11b4:	14fd                	addi	s1,s1,-1
    11b6:	0004de63          	bgez	s1,11d2 <_fwalk_sglue+0x3c>
    11ba:	4210                	lw	a2,0(a2)
    11bc:	fa75                	bnez	a2,11b0 <_fwalk_sglue+0x1a>
    11be:	50b2                	lw	ra,44(sp)
    11c0:	8522                	mv	a0,s0
    11c2:	5422                	lw	s0,40(sp)
    11c4:	5492                	lw	s1,36(sp)
    11c6:	5902                	lw	s2,32(sp)
    11c8:	49f2                	lw	s3,28(sp)
    11ca:	4a62                	lw	s4,24(sp)
    11cc:	4ad2                	lw	s5,20(sp)
    11ce:	6145                	addi	sp,sp,48
    11d0:	8082                	ret
    11d2:	00c5d783          	lhu	a5,12(a1)
    11d6:	00f97d63          	bgeu	s2,a5,11f0 <_fwalk_sglue+0x5a>
    11da:	00e59783          	lh	a5,14(a1)
    11de:	01378963          	beq	a5,s3,11f0 <_fwalk_sglue+0x5a>
    11e2:	8552                	mv	a0,s4
    11e4:	c632                	sw	a2,12(sp)
    11e6:	c42e                	sw	a1,8(sp)
    11e8:	9a82                	jalr	s5
    11ea:	4632                	lw	a2,12(sp)
    11ec:	45a2                	lw	a1,8(sp)
    11ee:	8c49                	or	s0,s0,a0
    11f0:	06858593          	addi	a1,a1,104
    11f4:	b7c1                	j	11b4 <_fwalk_sglue+0x1e>

000011f6 <__sread>:
    11f6:	1141                	addi	sp,sp,-16
    11f8:	c422                	sw	s0,8(sp)
    11fa:	842e                	mv	s0,a1
    11fc:	00e59583          	lh	a1,14(a1)
    1200:	c606                	sw	ra,12(sp)
    1202:	2229                	jal	130c <_read_r>
    1204:	00054963          	bltz	a0,1216 <__sread+0x20>
    1208:	487c                	lw	a5,84(s0)
    120a:	97aa                	add	a5,a5,a0
    120c:	c87c                	sw	a5,84(s0)
    120e:	40b2                	lw	ra,12(sp)
    1210:	4422                	lw	s0,8(sp)
    1212:	0141                	addi	sp,sp,16
    1214:	8082                	ret
    1216:	00c45783          	lhu	a5,12(s0)
    121a:	777d                	lui	a4,0xfffff
    121c:	177d                	addi	a4,a4,-1 # ffffefff <_sp+0xffff2baf>
    121e:	8ff9                	and	a5,a5,a4
    1220:	00f41623          	sh	a5,12(s0)
    1224:	b7ed                	j	120e <__sread+0x18>

00001226 <__swrite>:
    1226:	00c5d783          	lhu	a5,12(a1)
    122a:	1101                	addi	sp,sp,-32
    122c:	cc22                	sw	s0,24(sp)
    122e:	ca26                	sw	s1,20(sp)
    1230:	c84a                	sw	s2,16(sp)
    1232:	c64e                	sw	s3,12(sp)
    1234:	ce06                	sw	ra,28(sp)
    1236:	1007f793          	andi	a5,a5,256
    123a:	84aa                	mv	s1,a0
    123c:	842e                	mv	s0,a1
    123e:	8932                	mv	s2,a2
    1240:	89b6                	mv	s3,a3
    1242:	c791                	beqz	a5,124e <__swrite+0x28>
    1244:	00e59583          	lh	a1,14(a1)
    1248:	4689                	li	a3,2
    124a:	4601                	li	a2,0
    124c:	2849                	jal	12de <_lseek_r>
    124e:	00c45783          	lhu	a5,12(s0)
    1252:	777d                	lui	a4,0xfffff
    1254:	177d                	addi	a4,a4,-1 # ffffefff <_sp+0xffff2baf>
    1256:	8ff9                	and	a5,a5,a4
    1258:	00e41583          	lh	a1,14(s0)
    125c:	00f41623          	sh	a5,12(s0)
    1260:	4462                	lw	s0,24(sp)
    1262:	40f2                	lw	ra,28(sp)
    1264:	86ce                	mv	a3,s3
    1266:	864a                	mv	a2,s2
    1268:	49b2                	lw	s3,12(sp)
    126a:	4942                	lw	s2,16(sp)
    126c:	8526                	mv	a0,s1
    126e:	44d2                	lw	s1,20(sp)
    1270:	6105                	addi	sp,sp,32
    1272:	b925                	j	eaa <_write_r>

00001274 <__sseek>:
    1274:	1141                	addi	sp,sp,-16
    1276:	c422                	sw	s0,8(sp)
    1278:	842e                	mv	s0,a1
    127a:	00e59583          	lh	a1,14(a1)
    127e:	c606                	sw	ra,12(sp)
    1280:	28b9                	jal	12de <_lseek_r>
    1282:	577d                	li	a4,-1
    1284:	00c41783          	lh	a5,12(s0)
    1288:	00e51d63          	bne	a0,a4,12a2 <__sseek+0x2e>
    128c:	80050713          	addi	a4,a0,-2048
    1290:	80070713          	addi	a4,a4,-2048
    1294:	8ff9                	and	a5,a5,a4
    1296:	00f41623          	sh	a5,12(s0)
    129a:	40b2                	lw	ra,12(sp)
    129c:	4422                	lw	s0,8(sp)
    129e:	0141                	addi	sp,sp,16
    12a0:	8082                	ret
    12a2:	6705                	lui	a4,0x1
    12a4:	8fd9                	or	a5,a5,a4
    12a6:	00f41623          	sh	a5,12(s0)
    12aa:	c868                	sw	a0,84(s0)
    12ac:	b7fd                	j	129a <__sseek+0x26>

000012ae <__sclose>:
    12ae:	00e59583          	lh	a1,14(a1)
    12b2:	a009                	j	12b4 <_close_r>

000012b4 <_close_r>:
    12b4:	1141                	addi	sp,sp,-16
    12b6:	c422                	sw	s0,8(sp)
    12b8:	c226                	sw	s1,4(sp)
    12ba:	84aa                	mv	s1,a0
    12bc:	852e                	mv	a0,a1
    12be:	c606                	sw	ra,12(sp)
    12c0:	9201ae23          	sw	zero,-1732(gp) # b1fc <errno>
    12c4:	3e6d                	jal	e7e <_close>
    12c6:	57fd                	li	a5,-1
    12c8:	00f51663          	bne	a0,a5,12d4 <_close_r+0x20>
    12cc:	93c1a783          	lw	a5,-1732(gp) # b1fc <errno>
    12d0:	c391                	beqz	a5,12d4 <_close_r+0x20>
    12d2:	c09c                	sw	a5,0(s1)
    12d4:	40b2                	lw	ra,12(sp)
    12d6:	4422                	lw	s0,8(sp)
    12d8:	4492                	lw	s1,4(sp)
    12da:	0141                	addi	sp,sp,16
    12dc:	8082                	ret

000012de <_lseek_r>:
    12de:	1141                	addi	sp,sp,-16
    12e0:	c422                	sw	s0,8(sp)
    12e2:	c226                	sw	s1,4(sp)
    12e4:	84aa                	mv	s1,a0
    12e6:	852e                	mv	a0,a1
    12e8:	85b2                	mv	a1,a2
    12ea:	8636                	mv	a2,a3
    12ec:	c606                	sw	ra,12(sp)
    12ee:	9201ae23          	sw	zero,-1732(gp) # b1fc <errno>
    12f2:	3e45                	jal	ea2 <_lseek>
    12f4:	57fd                	li	a5,-1
    12f6:	00f51663          	bne	a0,a5,1302 <_lseek_r+0x24>
    12fa:	93c1a783          	lw	a5,-1732(gp) # b1fc <errno>
    12fe:	c391                	beqz	a5,1302 <_lseek_r+0x24>
    1300:	c09c                	sw	a5,0(s1)
    1302:	40b2                	lw	ra,12(sp)
    1304:	4422                	lw	s0,8(sp)
    1306:	4492                	lw	s1,4(sp)
    1308:	0141                	addi	sp,sp,16
    130a:	8082                	ret

0000130c <_read_r>:
    130c:	1141                	addi	sp,sp,-16
    130e:	c422                	sw	s0,8(sp)
    1310:	c226                	sw	s1,4(sp)
    1312:	84aa                	mv	s1,a0
    1314:	852e                	mv	a0,a1
    1316:	85b2                	mv	a1,a2
    1318:	8636                	mv	a2,a3
    131a:	c606                	sw	ra,12(sp)
    131c:	9201ae23          	sw	zero,-1732(gp) # b1fc <errno>
    1320:	3659                	jal	ea6 <_read>
    1322:	57fd                	li	a5,-1
    1324:	00f51663          	bne	a0,a5,1330 <_read_r+0x24>
    1328:	93c1a783          	lw	a5,-1732(gp) # b1fc <errno>
    132c:	c391                	beqz	a5,1330 <_read_r+0x24>
    132e:	c09c                	sw	a5,0(s1)
    1330:	40b2                	lw	ra,12(sp)
    1332:	4422                	lw	s0,8(sp)
    1334:	4492                	lw	s1,4(sp)
    1336:	0141                	addi	sp,sp,16
    1338:	8082                	ret

0000133a <__libc_init_array>:
    133a:	1141                	addi	sp,sp,-16
    133c:	c422                	sw	s0,8(sp)
    133e:	c226                	sw	s1,4(sp)
    1340:	642d                	lui	s0,0xb
    1342:	64ad                	lui	s1,0xb
    1344:	0c040413          	addi	s0,s0,192 # b0c0 <peripherals>
    1348:	0c048493          	addi	s1,s1,192 # b0c0 <peripherals>
    134c:	8c81                	sub	s1,s1,s0
    134e:	c04a                	sw	s2,0(sp)
    1350:	c606                	sw	ra,12(sp)
    1352:	8489                	srai	s1,s1,0x2
    1354:	4901                	li	s2,0
    1356:	02991363          	bne	s2,s1,137c <__libc_init_array+0x42>
    135a:	642d                	lui	s0,0xb
    135c:	64ad                	lui	s1,0xb
    135e:	0c040413          	addi	s0,s0,192 # b0c0 <peripherals>
    1362:	0c048493          	addi	s1,s1,192 # b0c0 <peripherals>
    1366:	8c81                	sub	s1,s1,s0
    1368:	8489                	srai	s1,s1,0x2
    136a:	4901                	li	s2,0
    136c:	00991d63          	bne	s2,s1,1386 <__libc_init_array+0x4c>
    1370:	40b2                	lw	ra,12(sp)
    1372:	4422                	lw	s0,8(sp)
    1374:	4492                	lw	s1,4(sp)
    1376:	4902                	lw	s2,0(sp)
    1378:	0141                	addi	sp,sp,16
    137a:	8082                	ret
    137c:	401c                	lw	a5,0(s0)
    137e:	0905                	addi	s2,s2,1
    1380:	0411                	addi	s0,s0,4
    1382:	9782                	jalr	a5
    1384:	bfc9                	j	1356 <__libc_init_array+0x1c>
    1386:	401c                	lw	a5,0(s0)
    1388:	0905                	addi	s2,s2,1
    138a:	0411                	addi	s0,s0,4
    138c:	9782                	jalr	a5
    138e:	bff9                	j	136c <__libc_init_array+0x32>

00001390 <__libc_fini_array>:
    1390:	1141                	addi	sp,sp,-16
    1392:	c422                	sw	s0,8(sp)
    1394:	c226                	sw	s1,4(sp)
    1396:	642d                	lui	s0,0xb
    1398:	64ad                	lui	s1,0xb
    139a:	0c048493          	addi	s1,s1,192 # b0c0 <peripherals>
    139e:	0c040413          	addi	s0,s0,192 # b0c0 <peripherals>
    13a2:	8c05                	sub	s0,s0,s1
    13a4:	c606                	sw	ra,12(sp)
    13a6:	8409                	srai	s0,s0,0x2
    13a8:	e411                	bnez	s0,13b4 <__libc_fini_array+0x24>
    13aa:	40b2                	lw	ra,12(sp)
    13ac:	4422                	lw	s0,8(sp)
    13ae:	4492                	lw	s1,4(sp)
    13b0:	0141                	addi	sp,sp,16
    13b2:	8082                	ret
    13b4:	147d                	addi	s0,s0,-1
    13b6:	00241793          	slli	a5,s0,0x2
    13ba:	97a6                	add	a5,a5,s1
    13bc:	439c                	lw	a5,0(a5)
    13be:	9782                	jalr	a5
    13c0:	b7e5                	j	13a8 <__libc_fini_array+0x18>

000013c2 <memset>:
    13c2:	832a                	mv	t1,a0
    13c4:	c611                	beqz	a2,13d0 <memset+0xe>
    13c6:	00b30023          	sb	a1,0(t1)
    13ca:	167d                	addi	a2,a2,-1
    13cc:	0305                	addi	t1,t1,1
    13ce:	fe65                	bnez	a2,13c6 <memset+0x4>
    13d0:	8082                	ret

000013d2 <__register_exitproc>:
    13d2:	9401a783          	lw	a5,-1728(gp) # b200 <__atexit>
    13d6:	8e2a                	mv	t3,a0
    13d8:	ef81                	bnez	a5,13f0 <__register_exitproc+0x1e>
    13da:	ac418793          	addi	a5,gp,-1340 # b384 <__atexit0>
    13de:	94f1a023          	sw	a5,-1728(gp) # b200 <__atexit>
    13e2:	00000513          	li	a0,0
    13e6:	c509                	beqz	a0,13f0 <__register_exitproc+0x1e>
    13e8:	00002703          	lw	a4,0(zero) # 0 <__vector_start>
    13ec:	08e7a423          	sw	a4,136(a5)
    13f0:	43d8                	lw	a4,4(a5)
    13f2:	487d                	li	a6,31
    13f4:	557d                	li	a0,-1
    13f6:	04e84763          	blt	a6,a4,1444 <__register_exitproc+0x72>
    13fa:	020e0e63          	beqz	t3,1436 <__register_exitproc+0x64>
    13fe:	0887a803          	lw	a6,136(a5)
    1402:	04080163          	beqz	a6,1444 <__register_exitproc+0x72>
    1406:	00271893          	slli	a7,a4,0x2
    140a:	98c2                	add	a7,a7,a6
    140c:	00c8a023          	sw	a2,0(a7)
    1410:	10082303          	lw	t1,256(a6)
    1414:	4605                	li	a2,1
    1416:	00e61633          	sll	a2,a2,a4
    141a:	00c36333          	or	t1,t1,a2
    141e:	10682023          	sw	t1,256(a6)
    1422:	08d8a023          	sw	a3,128(a7)
    1426:	4689                	li	a3,2
    1428:	00de1763          	bne	t3,a3,1436 <__register_exitproc+0x64>
    142c:	10482683          	lw	a3,260(a6)
    1430:	8ed1                	or	a3,a3,a2
    1432:	10d82223          	sw	a3,260(a6)
    1436:	00170693          	addi	a3,a4,1 # 1001 <spi_intr_handler_error_host+0x17>
    143a:	070a                	slli	a4,a4,0x2
    143c:	c3d4                	sw	a3,4(a5)
    143e:	97ba                	add	a5,a5,a4
    1440:	c78c                	sw	a1,8(a5)
    1442:	4501                	li	a0,0
    1444:	8082                	ret

00001446 <__call_exitprocs>:
    1446:	7179                	addi	sp,sp,-48
    1448:	ca56                	sw	s5,20(sp)
    144a:	c85a                	sw	s6,16(sp)
    144c:	c65e                	sw	s7,12(sp)
    144e:	c266                	sw	s9,4(sp)
    1450:	d606                	sw	ra,44(sp)
    1452:	d422                	sw	s0,40(sp)
    1454:	d226                	sw	s1,36(sp)
    1456:	d04a                	sw	s2,32(sp)
    1458:	ce4e                	sw	s3,28(sp)
    145a:	cc52                	sw	s4,24(sp)
    145c:	c462                	sw	s8,8(sp)
    145e:	8caa                	mv	s9,a0
    1460:	8b2e                	mv	s6,a1
    1462:	4b85                	li	s7,1
    1464:	9401a483          	lw	s1,-1728(gp) # b200 <__atexit>
    1468:	cc81                	beqz	s1,1480 <__call_exitprocs+0x3a>
    146a:	40c0                	lw	s0,4(s1)
    146c:	0884a983          	lw	s3,136(s1)
    1470:	fff40913          	addi	s2,s0,-1
    1474:	040a                	slli	s0,s0,0x2
    1476:	00898a33          	add	s4,s3,s0
    147a:	9426                	add	s0,s0,s1
    147c:	00095f63          	bgez	s2,149a <__call_exitprocs+0x54>
    1480:	50b2                	lw	ra,44(sp)
    1482:	5422                	lw	s0,40(sp)
    1484:	5492                	lw	s1,36(sp)
    1486:	5902                	lw	s2,32(sp)
    1488:	49f2                	lw	s3,28(sp)
    148a:	4a62                	lw	s4,24(sp)
    148c:	4ad2                	lw	s5,20(sp)
    148e:	4b42                	lw	s6,16(sp)
    1490:	4bb2                	lw	s7,12(sp)
    1492:	4c22                	lw	s8,8(sp)
    1494:	4c92                	lw	s9,4(sp)
    1496:	6145                	addi	sp,sp,48
    1498:	8082                	ret
    149a:	000b0c63          	beqz	s6,14b2 <__call_exitprocs+0x6c>
    149e:	00099663          	bnez	s3,14aa <__call_exitprocs+0x64>
    14a2:	197d                	addi	s2,s2,-1
    14a4:	1a71                	addi	s4,s4,-4
    14a6:	1471                	addi	s0,s0,-4
    14a8:	bfd1                	j	147c <__call_exitprocs+0x36>
    14aa:	07ca2783          	lw	a5,124(s4)
    14ae:	ff679ae3          	bne	a5,s6,14a2 <__call_exitprocs+0x5c>
    14b2:	40d8                	lw	a4,4(s1)
    14b4:	405c                	lw	a5,4(s0)
    14b6:	177d                	addi	a4,a4,-1
    14b8:	03271863          	bne	a4,s2,14e8 <__call_exitprocs+0xa2>
    14bc:	0124a223          	sw	s2,4(s1)
    14c0:	d3ed                	beqz	a5,14a2 <__call_exitprocs+0x5c>
    14c2:	0044ac03          	lw	s8,4(s1)
    14c6:	00098863          	beqz	s3,14d6 <__call_exitprocs+0x90>
    14ca:	1009a683          	lw	a3,256(s3)
    14ce:	012b9733          	sll	a4,s7,s2
    14d2:	8ef9                	and	a3,a3,a4
    14d4:	ee89                	bnez	a3,14ee <__call_exitprocs+0xa8>
    14d6:	9782                	jalr	a5
    14d8:	40dc                	lw	a5,4(s1)
    14da:	f98795e3          	bne	a5,s8,1464 <__call_exitprocs+0x1e>
    14de:	9401a783          	lw	a5,-1728(gp) # b200 <__atexit>
    14e2:	fcf480e3          	beq	s1,a5,14a2 <__call_exitprocs+0x5c>
    14e6:	bfbd                	j	1464 <__call_exitprocs+0x1e>
    14e8:	00042223          	sw	zero,4(s0)
    14ec:	bfd1                	j	14c0 <__call_exitprocs+0x7a>
    14ee:	1049a683          	lw	a3,260(s3)
    14f2:	ffca2583          	lw	a1,-4(s4)
    14f6:	8f75                	and	a4,a4,a3
    14f8:	e701                	bnez	a4,1500 <__call_exitprocs+0xba>
    14fa:	8566                	mv	a0,s9
    14fc:	9782                	jalr	a5
    14fe:	bfe9                	j	14d8 <__call_exitprocs+0x92>
    1500:	852e                	mv	a0,a1
    1502:	9782                	jalr	a5
    1504:	bfd1                	j	14d8 <__call_exitprocs+0x92>

00001506 <_free_r>:
    1506:	cdd1                	beqz	a1,15a2 <_free_r+0x9c>
    1508:	ffc5a783          	lw	a5,-4(a1)
    150c:	1101                	addi	sp,sp,-32
    150e:	cc22                	sw	s0,24(sp)
    1510:	ce06                	sw	ra,28(sp)
    1512:	ffc58413          	addi	s0,a1,-4
    1516:	0007d363          	bgez	a5,151c <_free_r+0x16>
    151a:	943e                	add	s0,s0,a5
    151c:	c62a                	sw	a0,12(sp)
    151e:	22e5                	jal	1706 <__malloc_lock>
    1520:	9481a783          	lw	a5,-1720(gp) # b208 <__malloc_free_list>
    1524:	4532                	lw	a0,12(sp)
    1526:	eb89                	bnez	a5,1538 <_free_r+0x32>
    1528:	00042223          	sw	zero,4(s0)
    152c:	9481a423          	sw	s0,-1720(gp) # b208 <__malloc_free_list>
    1530:	4462                	lw	s0,24(sp)
    1532:	40f2                	lw	ra,28(sp)
    1534:	6105                	addi	sp,sp,32
    1536:	aac9                	j	1708 <__malloc_unlock>
    1538:	00f47d63          	bgeu	s0,a5,1552 <_free_r+0x4c>
    153c:	4010                	lw	a2,0(s0)
    153e:	00c406b3          	add	a3,s0,a2
    1542:	00d79663          	bne	a5,a3,154e <_free_r+0x48>
    1546:	4394                	lw	a3,0(a5)
    1548:	43dc                	lw	a5,4(a5)
    154a:	96b2                	add	a3,a3,a2
    154c:	c014                	sw	a3,0(s0)
    154e:	c05c                	sw	a5,4(s0)
    1550:	bff1                	j	152c <_free_r+0x26>
    1552:	873e                	mv	a4,a5
    1554:	43dc                	lw	a5,4(a5)
    1556:	c399                	beqz	a5,155c <_free_r+0x56>
    1558:	fef47de3          	bgeu	s0,a5,1552 <_free_r+0x4c>
    155c:	4314                	lw	a3,0(a4)
    155e:	00d70633          	add	a2,a4,a3
    1562:	00861f63          	bne	a2,s0,1580 <_free_r+0x7a>
    1566:	4010                	lw	a2,0(s0)
    1568:	96b2                	add	a3,a3,a2
    156a:	c314                	sw	a3,0(a4)
    156c:	00d70633          	add	a2,a4,a3
    1570:	fcc790e3          	bne	a5,a2,1530 <_free_r+0x2a>
    1574:	4390                	lw	a2,0(a5)
    1576:	43dc                	lw	a5,4(a5)
    1578:	96b2                	add	a3,a3,a2
    157a:	c314                	sw	a3,0(a4)
    157c:	c35c                	sw	a5,4(a4)
    157e:	bf4d                	j	1530 <_free_r+0x2a>
    1580:	00c47563          	bgeu	s0,a2,158a <_free_r+0x84>
    1584:	47b1                	li	a5,12
    1586:	c11c                	sw	a5,0(a0)
    1588:	b765                	j	1530 <_free_r+0x2a>
    158a:	4010                	lw	a2,0(s0)
    158c:	00c406b3          	add	a3,s0,a2
    1590:	00d79663          	bne	a5,a3,159c <_free_r+0x96>
    1594:	4394                	lw	a3,0(a5)
    1596:	43dc                	lw	a5,4(a5)
    1598:	96b2                	add	a3,a3,a2
    159a:	c014                	sw	a3,0(s0)
    159c:	c05c                	sw	a5,4(s0)
    159e:	c340                	sw	s0,4(a4)
    15a0:	bf41                	j	1530 <_free_r+0x2a>
    15a2:	8082                	ret

000015a4 <sbrk_aligned>:
    15a4:	1141                	addi	sp,sp,-16
    15a6:	c422                	sw	s0,8(sp)
    15a8:	9441a783          	lw	a5,-1724(gp) # b204 <__malloc_sbrk_start>
    15ac:	c226                	sw	s1,4(sp)
    15ae:	c04a                	sw	s2,0(sp)
    15b0:	c606                	sw	ra,12(sp)
    15b2:	892a                	mv	s2,a0
    15b4:	84ae                	mv	s1,a1
    15b6:	e789                	bnez	a5,15c0 <sbrk_aligned+0x1c>
    15b8:	4581                	li	a1,0
    15ba:	246d                	jal	1864 <_sbrk_r>
    15bc:	94a1a223          	sw	a0,-1724(gp) # b204 <__malloc_sbrk_start>
    15c0:	85a6                	mv	a1,s1
    15c2:	854a                	mv	a0,s2
    15c4:	2445                	jal	1864 <_sbrk_r>
    15c6:	54fd                	li	s1,-1
    15c8:	00951a63          	bne	a0,s1,15dc <sbrk_aligned+0x38>
    15cc:	547d                	li	s0,-1
    15ce:	40b2                	lw	ra,12(sp)
    15d0:	8522                	mv	a0,s0
    15d2:	4422                	lw	s0,8(sp)
    15d4:	4492                	lw	s1,4(sp)
    15d6:	4902                	lw	s2,0(sp)
    15d8:	0141                	addi	sp,sp,16
    15da:	8082                	ret
    15dc:	00350413          	addi	s0,a0,3
    15e0:	9871                	andi	s0,s0,-4
    15e2:	fe8506e3          	beq	a0,s0,15ce <sbrk_aligned+0x2a>
    15e6:	40a405b3          	sub	a1,s0,a0
    15ea:	854a                	mv	a0,s2
    15ec:	2ca5                	jal	1864 <_sbrk_r>
    15ee:	fe9510e3          	bne	a0,s1,15ce <sbrk_aligned+0x2a>
    15f2:	bfe9                	j	15cc <sbrk_aligned+0x28>

000015f4 <_malloc_r>:
    15f4:	1101                	addi	sp,sp,-32
    15f6:	ca26                	sw	s1,20(sp)
    15f8:	00358493          	addi	s1,a1,3
    15fc:	98f1                	andi	s1,s1,-4
    15fe:	ce06                	sw	ra,28(sp)
    1600:	cc22                	sw	s0,24(sp)
    1602:	c84a                	sw	s2,16(sp)
    1604:	c64e                	sw	s3,12(sp)
    1606:	c452                	sw	s4,8(sp)
    1608:	04a1                	addi	s1,s1,8
    160a:	47b1                	li	a5,12
    160c:	00f4f363          	bgeu	s1,a5,1612 <_malloc_r+0x1e>
    1610:	84be                	mv	s1,a5
    1612:	0004c463          	bltz	s1,161a <_malloc_r+0x26>
    1616:	00b4fd63          	bgeu	s1,a1,1630 <_malloc_r+0x3c>
    161a:	47b1                	li	a5,12
    161c:	c11c                	sw	a5,0(a0)
    161e:	4501                	li	a0,0
    1620:	40f2                	lw	ra,28(sp)
    1622:	4462                	lw	s0,24(sp)
    1624:	44d2                	lw	s1,20(sp)
    1626:	4942                	lw	s2,16(sp)
    1628:	49b2                	lw	s3,12(sp)
    162a:	4a22                	lw	s4,8(sp)
    162c:	6105                	addi	sp,sp,32
    162e:	8082                	ret
    1630:	892a                	mv	s2,a0
    1632:	28d1                	jal	1706 <__malloc_lock>
    1634:	9481a783          	lw	a5,-1720(gp) # b208 <__malloc_free_list>
    1638:	843e                	mv	s0,a5
    163a:	e439                	bnez	s0,1688 <_malloc_r+0x94>
    163c:	85a6                	mv	a1,s1
    163e:	854a                	mv	a0,s2
    1640:	3795                	jal	15a4 <sbrk_aligned>
    1642:	57fd                	li	a5,-1
    1644:	842a                	mv	s0,a0
    1646:	0af51e63          	bne	a0,a5,1702 <_malloc_r+0x10e>
    164a:	9481a403          	lw	s0,-1720(gp) # b208 <__malloc_free_list>
    164e:	87a2                	mv	a5,s0
    1650:	ebc9                	bnez	a5,16e2 <_malloc_r+0xee>
    1652:	c055                	beqz	s0,16f6 <_malloc_r+0x102>
    1654:	00042a03          	lw	s4,0(s0)
    1658:	4581                	li	a1,0
    165a:	854a                	mv	a0,s2
    165c:	9a22                	add	s4,s4,s0
    165e:	2419                	jal	1864 <_sbrk_r>
    1660:	08aa1b63          	bne	s4,a0,16f6 <_malloc_r+0x102>
    1664:	401c                	lw	a5,0(s0)
    1666:	854a                	mv	a0,s2
    1668:	8c9d                	sub	s1,s1,a5
    166a:	85a6                	mv	a1,s1
    166c:	3f25                	jal	15a4 <sbrk_aligned>
    166e:	57fd                	li	a5,-1
    1670:	08f50363          	beq	a0,a5,16f6 <_malloc_r+0x102>
    1674:	401c                	lw	a5,0(s0)
    1676:	97a6                	add	a5,a5,s1
    1678:	c01c                	sw	a5,0(s0)
    167a:	9481a783          	lw	a5,-1720(gp) # b208 <__malloc_free_list>
    167e:	43d8                	lw	a4,4(a5)
    1680:	e725                	bnez	a4,16e8 <_malloc_r+0xf4>
    1682:	9401a423          	sw	zero,-1720(gp) # b208 <__malloc_free_list>
    1686:	a015                	j	16aa <_malloc_r+0xb6>
    1688:	4014                	lw	a3,0(s0)
    168a:	8e85                	sub	a3,a3,s1
    168c:	0406c863          	bltz	a3,16dc <_malloc_r+0xe8>
    1690:	472d                	li	a4,11
    1692:	02d77d63          	bgeu	a4,a3,16cc <_malloc_r+0xd8>
    1696:	c004                	sw	s1,0(s0)
    1698:	00940733          	add	a4,s0,s1
    169c:	02879663          	bne	a5,s0,16c8 <_malloc_r+0xd4>
    16a0:	94e1a423          	sw	a4,-1720(gp) # b208 <__malloc_free_list>
    16a4:	405c                	lw	a5,4(s0)
    16a6:	c314                	sw	a3,0(a4)
    16a8:	c35c                	sw	a5,4(a4)
    16aa:	854a                	mv	a0,s2
    16ac:	28b1                	jal	1708 <__malloc_unlock>
    16ae:	00b40513          	addi	a0,s0,11
    16b2:	00440793          	addi	a5,s0,4
    16b6:	9961                	andi	a0,a0,-8
    16b8:	40f50733          	sub	a4,a0,a5
    16bc:	f6f502e3          	beq	a0,a5,1620 <_malloc_r+0x2c>
    16c0:	943a                	add	s0,s0,a4
    16c2:	8f89                	sub	a5,a5,a0
    16c4:	c01c                	sw	a5,0(s0)
    16c6:	bfa9                	j	1620 <_malloc_r+0x2c>
    16c8:	c3d8                	sw	a4,4(a5)
    16ca:	bfe9                	j	16a4 <_malloc_r+0xb0>
    16cc:	4058                	lw	a4,4(s0)
    16ce:	00879563          	bne	a5,s0,16d8 <_malloc_r+0xe4>
    16d2:	94e1a423          	sw	a4,-1720(gp) # b208 <__malloc_free_list>
    16d6:	bfd1                	j	16aa <_malloc_r+0xb6>
    16d8:	c3d8                	sw	a4,4(a5)
    16da:	bfc1                	j	16aa <_malloc_r+0xb6>
    16dc:	87a2                	mv	a5,s0
    16de:	4040                	lw	s0,4(s0)
    16e0:	bfa9                	j	163a <_malloc_r+0x46>
    16e2:	843e                	mv	s0,a5
    16e4:	43dc                	lw	a5,4(a5)
    16e6:	b7ad                	j	1650 <_malloc_r+0x5c>
    16e8:	873e                	mv	a4,a5
    16ea:	43dc                	lw	a5,4(a5)
    16ec:	fe879ee3          	bne	a5,s0,16e8 <_malloc_r+0xf4>
    16f0:	00072223          	sw	zero,4(a4)
    16f4:	bf5d                	j	16aa <_malloc_r+0xb6>
    16f6:	47b1                	li	a5,12
    16f8:	00f92023          	sw	a5,0(s2)
    16fc:	854a                	mv	a0,s2
    16fe:	2029                	jal	1708 <__malloc_unlock>
    1700:	bf39                	j	161e <_malloc_r+0x2a>
    1702:	c104                	sw	s1,0(a0)
    1704:	b75d                	j	16aa <_malloc_r+0xb6>

00001706 <__malloc_lock>:
    1706:	8082                	ret

00001708 <__malloc_unlock>:
    1708:	8082                	ret

0000170a <__sflush_r>:
    170a:	00c59783          	lh	a5,12(a1)
    170e:	1101                	addi	sp,sp,-32
    1710:	cc22                	sw	s0,24(sp)
    1712:	ca26                	sw	s1,20(sp)
    1714:	ce06                	sw	ra,28(sp)
    1716:	c84a                	sw	s2,16(sp)
    1718:	0087f713          	andi	a4,a5,8
    171c:	84aa                	mv	s1,a0
    171e:	842e                	mv	s0,a1
    1720:	e361                	bnez	a4,17e0 <__sflush_r+0xd6>
    1722:	41d8                	lw	a4,4(a1)
    1724:	00e04563          	bgtz	a4,172e <__sflush_r+0x24>
    1728:	41b8                	lw	a4,64(a1)
    172a:	0ae05963          	blez	a4,17dc <__sflush_r+0xd2>
    172e:	5458                	lw	a4,44(s0)
    1730:	c755                	beqz	a4,17dc <__sflush_r+0xd2>
    1732:	0004a903          	lw	s2,0(s1)
    1736:	01379693          	slli	a3,a5,0x13
    173a:	0004a023          	sw	zero,0(s1)
    173e:	0606dd63          	bgez	a3,17b8 <__sflush_r+0xae>
    1742:	4870                	lw	a2,84(s0)
    1744:	00c45783          	lhu	a5,12(s0)
    1748:	8b91                	andi	a5,a5,4
    174a:	c799                	beqz	a5,1758 <__sflush_r+0x4e>
    174c:	405c                	lw	a5,4(s0)
    174e:	8e1d                	sub	a2,a2,a5
    1750:	585c                	lw	a5,52(s0)
    1752:	c399                	beqz	a5,1758 <__sflush_r+0x4e>
    1754:	403c                	lw	a5,64(s0)
    1756:	8e1d                	sub	a2,a2,a5
    1758:	545c                	lw	a5,44(s0)
    175a:	500c                	lw	a1,32(s0)
    175c:	4681                	li	a3,0
    175e:	8526                	mv	a0,s1
    1760:	9782                	jalr	a5
    1762:	577d                	li	a4,-1
    1764:	00c41783          	lh	a5,12(s0)
    1768:	00e51d63          	bne	a0,a4,1782 <__sflush_r+0x78>
    176c:	4094                	lw	a3,0(s1)
    176e:	4775                	li	a4,29
    1770:	0ad76063          	bltu	a4,a3,1810 <__sflush_r+0x106>
    1774:	20400737          	lui	a4,0x20400
    1778:	0705                	addi	a4,a4,1 # 20400001 <_sp+0x203f3bb1>
    177a:	00d75733          	srl	a4,a4,a3
    177e:	8b05                	andi	a4,a4,1
    1780:	cb41                	beqz	a4,1810 <__sflush_r+0x106>
    1782:	4818                	lw	a4,16(s0)
    1784:	00042223          	sw	zero,4(s0)
    1788:	c018                	sw	a4,0(s0)
    178a:	01379713          	slli	a4,a5,0x13
    178e:	00075863          	bgez	a4,179e <__sflush_r+0x94>
    1792:	57fd                	li	a5,-1
    1794:	00f51463          	bne	a0,a5,179c <__sflush_r+0x92>
    1798:	409c                	lw	a5,0(s1)
    179a:	e391                	bnez	a5,179e <__sflush_r+0x94>
    179c:	c868                	sw	a0,84(s0)
    179e:	584c                	lw	a1,52(s0)
    17a0:	0124a023          	sw	s2,0(s1)
    17a4:	cd85                	beqz	a1,17dc <__sflush_r+0xd2>
    17a6:	04440793          	addi	a5,s0,68
    17aa:	00f58463          	beq	a1,a5,17b2 <__sflush_r+0xa8>
    17ae:	8526                	mv	a0,s1
    17b0:	3b99                	jal	1506 <_free_r>
    17b2:	02042a23          	sw	zero,52(s0)
    17b6:	a01d                	j	17dc <__sflush_r+0xd2>
    17b8:	500c                	lw	a1,32(s0)
    17ba:	4601                	li	a2,0
    17bc:	4685                	li	a3,1
    17be:	8526                	mv	a0,s1
    17c0:	9702                	jalr	a4
    17c2:	57fd                	li	a5,-1
    17c4:	862a                	mv	a2,a0
    17c6:	f6f51fe3          	bne	a0,a5,1744 <__sflush_r+0x3a>
    17ca:	409c                	lw	a5,0(s1)
    17cc:	dfa5                	beqz	a5,1744 <__sflush_r+0x3a>
    17ce:	fe378713          	addi	a4,a5,-29
    17d2:	c319                	beqz	a4,17d8 <__sflush_r+0xce>
    17d4:	17a9                	addi	a5,a5,-22
    17d6:	eb9d                	bnez	a5,180c <__sflush_r+0x102>
    17d8:	0124a023          	sw	s2,0(s1)
    17dc:	4501                	li	a0,0
    17de:	a835                	j	181a <__sflush_r+0x110>
    17e0:	4990                	lw	a2,16(a1)
    17e2:	de6d                	beqz	a2,17dc <__sflush_r+0xd2>
    17e4:	4194                	lw	a3,0(a1)
    17e6:	8b8d                	andi	a5,a5,3
    17e8:	c190                	sw	a2,0(a1)
    17ea:	40c68933          	sub	s2,a3,a2
    17ee:	4701                	li	a4,0
    17f0:	e391                	bnez	a5,17f4 <__sflush_r+0xea>
    17f2:	49d8                	lw	a4,20(a1)
    17f4:	c418                	sw	a4,8(s0)
    17f6:	ff2053e3          	blez	s2,17dc <__sflush_r+0xd2>
    17fa:	541c                	lw	a5,40(s0)
    17fc:	500c                	lw	a1,32(s0)
    17fe:	86ca                	mv	a3,s2
    1800:	8526                	mv	a0,s1
    1802:	c632                	sw	a2,12(sp)
    1804:	9782                	jalr	a5
    1806:	4632                	lw	a2,12(sp)
    1808:	00a04f63          	bgtz	a0,1826 <__sflush_r+0x11c>
    180c:	00c45783          	lhu	a5,12(s0)
    1810:	0407e793          	ori	a5,a5,64
    1814:	00f41623          	sh	a5,12(s0)
    1818:	557d                	li	a0,-1
    181a:	40f2                	lw	ra,28(sp)
    181c:	4462                	lw	s0,24(sp)
    181e:	44d2                	lw	s1,20(sp)
    1820:	4942                	lw	s2,16(sp)
    1822:	6105                	addi	sp,sp,32
    1824:	8082                	ret
    1826:	962a                	add	a2,a2,a0
    1828:	40a90933          	sub	s2,s2,a0
    182c:	b7e9                	j	17f6 <__sflush_r+0xec>

0000182e <_fflush_r>:
    182e:	499c                	lw	a5,16(a1)
    1830:	cb85                	beqz	a5,1860 <_fflush_r+0x32>
    1832:	1101                	addi	sp,sp,-32
    1834:	cc22                	sw	s0,24(sp)
    1836:	ce06                	sw	ra,28(sp)
    1838:	842a                	mv	s0,a0
    183a:	c511                	beqz	a0,1846 <_fflush_r+0x18>
    183c:	511c                	lw	a5,32(a0)
    183e:	e781                	bnez	a5,1846 <_fflush_r+0x18>
    1840:	c62e                	sw	a1,12(sp)
    1842:	3a3d                	jal	1180 <__sinit>
    1844:	45b2                	lw	a1,12(sp)
    1846:	00c59783          	lh	a5,12(a1)
    184a:	c791                	beqz	a5,1856 <_fflush_r+0x28>
    184c:	8522                	mv	a0,s0
    184e:	4462                	lw	s0,24(sp)
    1850:	40f2                	lw	ra,28(sp)
    1852:	6105                	addi	sp,sp,32
    1854:	bd5d                	j	170a <__sflush_r>
    1856:	40f2                	lw	ra,28(sp)
    1858:	4462                	lw	s0,24(sp)
    185a:	4501                	li	a0,0
    185c:	6105                	addi	sp,sp,32
    185e:	8082                	ret
    1860:	4501                	li	a0,0
    1862:	8082                	ret

00001864 <_sbrk_r>:
    1864:	1141                	addi	sp,sp,-16
    1866:	c422                	sw	s0,8(sp)
    1868:	c226                	sw	s1,4(sp)
    186a:	84aa                	mv	s1,a0
    186c:	852e                	mv	a0,a1
    186e:	c606                	sw	ra,12(sp)
    1870:	9201ae23          	sw	zero,-1732(gp) # b1fc <errno>
    1874:	e4aff0ef          	jal	ebe <_sbrk>
    1878:	57fd                	li	a5,-1
    187a:	00f51663          	bne	a0,a5,1886 <_sbrk_r+0x22>
    187e:	93c1a783          	lw	a5,-1732(gp) # b1fc <errno>
    1882:	c391                	beqz	a5,1886 <_sbrk_r+0x22>
    1884:	c09c                	sw	a5,0(s1)
    1886:	40b2                	lw	ra,12(sp)
    1888:	4422                	lw	s0,8(sp)
    188a:	4492                	lw	s1,4(sp)
    188c:	0141                	addi	sp,sp,16
    188e:	8082                	ret

00001890 <malloc>:
    1890:	85aa                	mv	a1,a0
    1892:	9341a503          	lw	a0,-1740(gp) # b1f4 <_impure_ptr>
    1896:	bbb9                	j	15f4 <_malloc_r>

00001898 <iprintf>:
    1898:	7139                	addi	sp,sp,-64
    189a:	da3e                	sw	a5,52(sp)
    189c:	9341a783          	lw	a5,-1740(gp) # b1f4 <_impure_ptr>
    18a0:	d432                	sw	a2,40(sp)
    18a2:	d636                	sw	a3,44(sp)
    18a4:	d22e                	sw	a1,36(sp)
    18a6:	d83a                	sw	a4,48(sp)
    18a8:	dc42                	sw	a6,56(sp)
    18aa:	de46                	sw	a7,60(sp)
    18ac:	478c                	lw	a1,8(a5)
    18ae:	1054                	addi	a3,sp,36
    18b0:	862a                	mv	a2,a0
    18b2:	853e                	mv	a0,a5
    18b4:	ce06                	sw	ra,28(sp)
    18b6:	c636                	sw	a3,12(sp)
    18b8:	2051                	jal	193c <_vfiprintf_r>
    18ba:	40f2                	lw	ra,28(sp)
    18bc:	6121                	addi	sp,sp,64
    18be:	8082                	ret

000018c0 <strlen>:
    18c0:	87aa                	mv	a5,a0
    18c2:	0007c703          	lbu	a4,0(a5)
    18c6:	0785                	addi	a5,a5,1
    18c8:	ff6d                	bnez	a4,18c2 <strlen+0x2>
    18ca:	40a78533          	sub	a0,a5,a0
    18ce:	157d                	addi	a0,a0,-1
    18d0:	8082                	ret

000018d2 <__sfputc_r>:
    18d2:	461c                	lw	a5,8(a2)
    18d4:	17fd                	addi	a5,a5,-1
    18d6:	c61c                	sw	a5,8(a2)
    18d8:	0007d963          	bgez	a5,18ea <__sfputc_r+0x18>
    18dc:	4e18                	lw	a4,24(a2)
    18de:	00e7c563          	blt	a5,a4,18e8 <__sfputc_r+0x16>
    18e2:	ff658793          	addi	a5,a1,-10
    18e6:	e391                	bnez	a5,18ea <__sfputc_r+0x18>
    18e8:	ad39                	j	1f06 <__swbuf_r>
    18ea:	421c                	lw	a5,0(a2)
    18ec:	852e                	mv	a0,a1
    18ee:	00178713          	addi	a4,a5,1
    18f2:	c218                	sw	a4,0(a2)
    18f4:	00b78023          	sb	a1,0(a5)
    18f8:	8082                	ret

000018fa <__sfputs_r>:
    18fa:	1101                	addi	sp,sp,-32
    18fc:	cc22                	sw	s0,24(sp)
    18fe:	ca26                	sw	s1,20(sp)
    1900:	c84a                	sw	s2,16(sp)
    1902:	c64e                	sw	s3,12(sp)
    1904:	c452                	sw	s4,8(sp)
    1906:	ce06                	sw	ra,28(sp)
    1908:	89aa                	mv	s3,a0
    190a:	8a2e                	mv	s4,a1
    190c:	8432                	mv	s0,a2
    190e:	00d604b3          	add	s1,a2,a3
    1912:	597d                	li	s2,-1
    1914:	00941463          	bne	s0,s1,191c <__sfputs_r+0x22>
    1918:	4501                	li	a0,0
    191a:	a809                	j	192c <__sfputs_r+0x32>
    191c:	00044583          	lbu	a1,0(s0)
    1920:	8652                	mv	a2,s4
    1922:	854e                	mv	a0,s3
    1924:	377d                	jal	18d2 <__sfputc_r>
    1926:	0405                	addi	s0,s0,1
    1928:	ff2516e3          	bne	a0,s2,1914 <__sfputs_r+0x1a>
    192c:	40f2                	lw	ra,28(sp)
    192e:	4462                	lw	s0,24(sp)
    1930:	44d2                	lw	s1,20(sp)
    1932:	4942                	lw	s2,16(sp)
    1934:	49b2                	lw	s3,12(sp)
    1936:	4a22                	lw	s4,8(sp)
    1938:	6105                	addi	sp,sp,32
    193a:	8082                	ret

0000193c <_vfiprintf_r>:
    193c:	7171                	addi	sp,sp,-176
    193e:	d522                	sw	s0,168(sp)
    1940:	d326                	sw	s1,164(sp)
    1942:	cf4e                	sw	s3,156(sp)
    1944:	cd52                	sw	s4,152(sp)
    1946:	d706                	sw	ra,172(sp)
    1948:	d14a                	sw	s2,160(sp)
    194a:	cb56                	sw	s5,148(sp)
    194c:	c95a                	sw	s6,144(sp)
    194e:	c75e                	sw	s7,140(sp)
    1950:	c562                	sw	s8,136(sp)
    1952:	c366                	sw	s9,132(sp)
    1954:	89aa                	mv	s3,a0
    1956:	84ae                	mv	s1,a1
    1958:	8432                	mv	s0,a2
    195a:	8a36                	mv	s4,a3
    195c:	c501                	beqz	a0,1964 <_vfiprintf_r+0x28>
    195e:	511c                	lw	a5,32(a0)
    1960:	e391                	bnez	a5,1964 <_vfiprintf_r+0x28>
    1962:	3839                	jal	1180 <__sinit>
    1964:	00c4d783          	lhu	a5,12(s1)
    1968:	8ba1                	andi	a5,a5,8
    196a:	c7f9                	beqz	a5,1a38 <_vfiprintf_r+0xfc>
    196c:	489c                	lw	a5,16(s1)
    196e:	c7e9                	beqz	a5,1a38 <_vfiprintf_r+0xfc>
    1970:	02000793          	li	a5,32
    1974:	02f10ca3          	sb	a5,57(sp)
    1978:	ce52                	sw	s4,28(sp)
    197a:	03000793          	li	a5,48
    197e:	6a29                	lui	s4,0xa
    1980:	6aa9                	lui	s5,0xa
    1982:	da02                	sw	zero,52(sp)
    1984:	02f10d23          	sb	a5,58(sp)
    1988:	5b7d                	li	s6,-1
    198a:	724a0a13          	addi	s4,s4,1828 # a724 <heap.cpp.7337fd52+0x59c>
    198e:	4b85                	li	s7,1
    1990:	72ca8a93          	addi	s5,s5,1836 # a72c <heap.cpp.7337fd52+0x5a4>
    1994:	8c22                	mv	s8,s0
    1996:	000c4783          	lbu	a5,0(s8)
    199a:	00f03cb3          	snez	s9,a5
    199e:	fdb78793          	addi	a5,a5,-37
    19a2:	00f037b3          	snez	a5,a5
    19a6:	00fcfcb3          	and	s9,s9,a5
    19aa:	0a0c9963          	bnez	s9,1a5c <_vfiprintf_r+0x120>
    19ae:	408c06b3          	sub	a3,s8,s0
    19b2:	008c0d63          	beq	s8,s0,19cc <_vfiprintf_r+0x90>
    19b6:	8622                	mv	a2,s0
    19b8:	85a6                	mv	a1,s1
    19ba:	854e                	mv	a0,s3
    19bc:	c636                	sw	a3,12(sp)
    19be:	3f35                	jal	18fa <__sfputs_r>
    19c0:	1b650963          	beq	a0,s6,1b72 <_vfiprintf_r+0x236>
    19c4:	57d2                	lw	a5,52(sp)
    19c6:	46b2                	lw	a3,12(sp)
    19c8:	97b6                	add	a5,a5,a3
    19ca:	da3e                	sw	a5,52(sp)
    19cc:	000c4783          	lbu	a5,0(s8)
    19d0:	1a078163          	beqz	a5,1b72 <_vfiprintf_r+0x236>
    19d4:	001c0413          	addi	s0,s8,1
    19d8:	d002                	sw	zero,32(sp)
    19da:	d602                	sw	zero,44(sp)
    19dc:	d25a                	sw	s6,36(sp)
    19de:	d402                	sw	zero,40(sp)
    19e0:	060101a3          	sb	zero,99(sp)
    19e4:	dc82                	sw	zero,120(sp)
    19e6:	00044583          	lbu	a1,0(s0)
    19ea:	4615                	li	a2,5
    19ec:	8552                	mv	a0,s4
    19ee:	25a5                	jal	2056 <memchr>
    19f0:	5782                	lw	a5,32(sp)
    19f2:	00140693          	addi	a3,s0,1
    19f6:	e52d                	bnez	a0,1a60 <_vfiprintf_r+0x124>
    19f8:	0107f713          	andi	a4,a5,16
    19fc:	c709                	beqz	a4,1a06 <_vfiprintf_r+0xca>
    19fe:	02000713          	li	a4,32
    1a02:	06e101a3          	sb	a4,99(sp)
    1a06:	0087f713          	andi	a4,a5,8
    1a0a:	c709                	beqz	a4,1a14 <_vfiprintf_r+0xd8>
    1a0c:	02b00713          	li	a4,43
    1a10:	06e101a3          	sb	a4,99(sp)
    1a14:	00044603          	lbu	a2,0(s0)
    1a18:	02a00713          	li	a4,42
    1a1c:	04e60a63          	beq	a2,a4,1a70 <_vfiprintf_r+0x134>
    1a20:	5732                	lw	a4,44(sp)
    1a22:	4781                	li	a5,0
    1a24:	4625                	li	a2,9
    1a26:	00044683          	lbu	a3,0(s0)
    1a2a:	fd068693          	addi	a3,a3,-48
    1a2e:	0ed67063          	bgeu	a2,a3,1b0e <_vfiprintf_r+0x1d2>
    1a32:	cba1                	beqz	a5,1a82 <_vfiprintf_r+0x146>
    1a34:	d63a                	sw	a4,44(sp)
    1a36:	a0b1                	j	1a82 <_vfiprintf_r+0x146>
    1a38:	85a6                	mv	a1,s1
    1a3a:	854e                	mv	a0,s3
    1a3c:	2ba9                	jal	1f96 <__swsetup_r>
    1a3e:	d90d                	beqz	a0,1970 <_vfiprintf_r+0x34>
    1a40:	557d                	li	a0,-1
    1a42:	50ba                	lw	ra,172(sp)
    1a44:	542a                	lw	s0,168(sp)
    1a46:	549a                	lw	s1,164(sp)
    1a48:	590a                	lw	s2,160(sp)
    1a4a:	49fa                	lw	s3,156(sp)
    1a4c:	4a6a                	lw	s4,152(sp)
    1a4e:	4ada                	lw	s5,148(sp)
    1a50:	4b4a                	lw	s6,144(sp)
    1a52:	4bba                	lw	s7,140(sp)
    1a54:	4c2a                	lw	s8,136(sp)
    1a56:	4c9a                	lw	s9,132(sp)
    1a58:	614d                	addi	sp,sp,176
    1a5a:	8082                	ret
    1a5c:	0c05                	addi	s8,s8,1
    1a5e:	bf25                	j	1996 <_vfiprintf_r+0x5a>
    1a60:	41450533          	sub	a0,a0,s4
    1a64:	00ab9533          	sll	a0,s7,a0
    1a68:	8d5d                	or	a0,a0,a5
    1a6a:	d02a                	sw	a0,32(sp)
    1a6c:	8436                	mv	s0,a3
    1a6e:	bfa5                	j	19e6 <_vfiprintf_r+0xaa>
    1a70:	4772                	lw	a4,28(sp)
    1a72:	00470613          	addi	a2,a4,4
    1a76:	4318                	lw	a4,0(a4)
    1a78:	ce32                	sw	a2,28(sp)
    1a7a:	08074363          	bltz	a4,1b00 <_vfiprintf_r+0x1c4>
    1a7e:	d63a                	sw	a4,44(sp)
    1a80:	8436                	mv	s0,a3
    1a82:	00044703          	lbu	a4,0(s0)
    1a86:	02e00793          	li	a5,46
    1a8a:	02f71263          	bne	a4,a5,1aae <_vfiprintf_r+0x172>
    1a8e:	00144703          	lbu	a4,1(s0)
    1a92:	02a00793          	li	a5,42
    1a96:	08f71563          	bne	a4,a5,1b20 <_vfiprintf_r+0x1e4>
    1a9a:	47f2                	lw	a5,28(sp)
    1a9c:	0409                	addi	s0,s0,2
    1a9e:	00478713          	addi	a4,a5,4
    1aa2:	439c                	lw	a5,0(a5)
    1aa4:	ce3a                	sw	a4,28(sp)
    1aa6:	0007d363          	bgez	a5,1aac <_vfiprintf_r+0x170>
    1aaa:	57fd                	li	a5,-1
    1aac:	d23e                	sw	a5,36(sp)
    1aae:	00044583          	lbu	a1,0(s0)
    1ab2:	460d                	li	a2,3
    1ab4:	8556                	mv	a0,s5
    1ab6:	2345                	jal	2056 <memchr>
    1ab8:	c919                	beqz	a0,1ace <_vfiprintf_r+0x192>
    1aba:	5782                	lw	a5,32(sp)
    1abc:	41550533          	sub	a0,a0,s5
    1ac0:	04000713          	li	a4,64
    1ac4:	00a71733          	sll	a4,a4,a0
    1ac8:	8fd9                	or	a5,a5,a4
    1aca:	0405                	addi	s0,s0,1
    1acc:	d03e                	sw	a5,32(sp)
    1ace:	00044583          	lbu	a1,0(s0)
    1ad2:	6529                	lui	a0,0xa
    1ad4:	4619                	li	a2,6
    1ad6:	73050513          	addi	a0,a0,1840 # a730 <heap.cpp.7337fd52+0x5a8>
    1ada:	02b10c23          	sb	a1,56(sp)
    1ade:	2ba5                	jal	2056 <memchr>
    1ae0:	c14d                	beqz	a0,1b82 <_vfiprintf_r+0x246>
    1ae2:	00000793          	li	a5,0
    1ae6:	eba5                	bnez	a5,1b56 <_vfiprintf_r+0x21a>
    1ae8:	5702                	lw	a4,32(sp)
    1aea:	47f2                	lw	a5,28(sp)
    1aec:	10077713          	andi	a4,a4,256
    1af0:	cf39                	beqz	a4,1b4e <_vfiprintf_r+0x212>
    1af2:	0791                	addi	a5,a5,4
    1af4:	ce3e                	sw	a5,28(sp)
    1af6:	57d2                	lw	a5,52(sp)
    1af8:	0405                	addi	s0,s0,1
    1afa:	97ca                	add	a5,a5,s2
    1afc:	da3e                	sw	a5,52(sp)
    1afe:	bd59                	j	1994 <_vfiprintf_r+0x58>
    1b00:	40e00733          	neg	a4,a4
    1b04:	0027e793          	ori	a5,a5,2
    1b08:	d63a                	sw	a4,44(sp)
    1b0a:	d03e                	sw	a5,32(sp)
    1b0c:	bf95                	j	1a80 <_vfiprintf_r+0x144>
    1b0e:	00271793          	slli	a5,a4,0x2
    1b12:	97ba                	add	a5,a5,a4
    1b14:	0786                	slli	a5,a5,0x1
    1b16:	00d78733          	add	a4,a5,a3
    1b1a:	0405                	addi	s0,s0,1
    1b1c:	4785                	li	a5,1
    1b1e:	b721                	j	1a26 <_vfiprintf_r+0xea>
    1b20:	0405                	addi	s0,s0,1
    1b22:	d202                	sw	zero,36(sp)
    1b24:	4701                	li	a4,0
    1b26:	4625                	li	a2,9
    1b28:	00044683          	lbu	a3,0(s0)
    1b2c:	fd068693          	addi	a3,a3,-48
    1b30:	00d67663          	bgeu	a2,a3,1b3c <_vfiprintf_r+0x200>
    1b34:	f60c8de3          	beqz	s9,1aae <_vfiprintf_r+0x172>
    1b38:	d23a                	sw	a4,36(sp)
    1b3a:	bf95                	j	1aae <_vfiprintf_r+0x172>
    1b3c:	00271793          	slli	a5,a4,0x2
    1b40:	97ba                	add	a5,a5,a4
    1b42:	0786                	slli	a5,a5,0x1
    1b44:	0405                	addi	s0,s0,1
    1b46:	00d78733          	add	a4,a5,a3
    1b4a:	4c85                	li	s9,1
    1b4c:	bff1                	j	1b28 <_vfiprintf_r+0x1ec>
    1b4e:	079d                	addi	a5,a5,7
    1b50:	9be1                	andi	a5,a5,-8
    1b52:	07a1                	addi	a5,a5,8
    1b54:	b745                	j	1af4 <_vfiprintf_r+0x1b8>
    1b56:	6689                	lui	a3,0x2
    1b58:	0878                	addi	a4,sp,28
    1b5a:	8fa68693          	addi	a3,a3,-1798 # 18fa <__sfputs_r>
    1b5e:	8626                	mv	a2,s1
    1b60:	100c                	addi	a1,sp,32
    1b62:	854e                	mv	a0,s3
    1b64:	00000097          	auipc	ra,0x0
    1b68:	000000e7          	jalr	zero # 0 <__vector_start>
    1b6c:	892a                	mv	s2,a0
    1b6e:	f96514e3          	bne	a0,s6,1af6 <_vfiprintf_r+0x1ba>
    1b72:	00c4d783          	lhu	a5,12(s1)
    1b76:	0407f793          	andi	a5,a5,64
    1b7a:	ec0793e3          	bnez	a5,1a40 <_vfiprintf_r+0x104>
    1b7e:	5552                	lw	a0,52(sp)
    1b80:	b5c9                	j	1a42 <_vfiprintf_r+0x106>
    1b82:	6689                	lui	a3,0x2
    1b84:	0878                	addi	a4,sp,28
    1b86:	8fa68693          	addi	a3,a3,-1798 # 18fa <__sfputs_r>
    1b8a:	8626                	mv	a2,s1
    1b8c:	100c                	addi	a1,sp,32
    1b8e:	854e                	mv	a0,s3
    1b90:	2a19                	jal	1ca6 <_printf_i>
    1b92:	bfe9                	j	1b6c <_vfiprintf_r+0x230>

00001b94 <_printf_common>:
    1b94:	7179                	addi	sp,sp,-48
    1b96:	ce4e                	sw	s3,28(sp)
    1b98:	499c                	lw	a5,16(a1)
    1b9a:	89ba                	mv	s3,a4
    1b9c:	4598                	lw	a4,8(a1)
    1b9e:	d422                	sw	s0,40(sp)
    1ba0:	d04a                	sw	s2,32(sp)
    1ba2:	c85a                	sw	s6,16(sp)
    1ba4:	c65e                	sw	s7,12(sp)
    1ba6:	d606                	sw	ra,44(sp)
    1ba8:	d226                	sw	s1,36(sp)
    1baa:	cc52                	sw	s4,24(sp)
    1bac:	ca56                	sw	s5,20(sp)
    1bae:	8b2a                	mv	s6,a0
    1bb0:	842e                	mv	s0,a1
    1bb2:	8932                	mv	s2,a2
    1bb4:	8bb6                	mv	s7,a3
    1bb6:	00e7d363          	bge	a5,a4,1bbc <_printf_common+0x28>
    1bba:	87ba                	mv	a5,a4
    1bbc:	00f92023          	sw	a5,0(s2)
    1bc0:	04344703          	lbu	a4,67(s0)
    1bc4:	c701                	beqz	a4,1bcc <_printf_common+0x38>
    1bc6:	0785                	addi	a5,a5,1
    1bc8:	00f92023          	sw	a5,0(s2)
    1bcc:	401c                	lw	a5,0(s0)
    1bce:	0207f793          	andi	a5,a5,32
    1bd2:	c791                	beqz	a5,1bde <_printf_common+0x4a>
    1bd4:	00092783          	lw	a5,0(s2)
    1bd8:	0789                	addi	a5,a5,2
    1bda:	00f92023          	sw	a5,0(s2)
    1bde:	4004                	lw	s1,0(s0)
    1be0:	8899                	andi	s1,s1,6
    1be2:	e891                	bnez	s1,1bf6 <_printf_common+0x62>
    1be4:	01940a13          	addi	s4,s0,25
    1be8:	5afd                	li	s5,-1
    1bea:	445c                	lw	a5,12(s0)
    1bec:	00092703          	lw	a4,0(s2)
    1bf0:	8f99                	sub	a5,a5,a4
    1bf2:	04f4cd63          	blt	s1,a5,1c4c <_printf_common+0xb8>
    1bf6:	401c                	lw	a5,0(s0)
    1bf8:	04344683          	lbu	a3,67(s0)
    1bfc:	0207f793          	andi	a5,a5,32
    1c00:	00d036b3          	snez	a3,a3
    1c04:	ebad                	bnez	a5,1c76 <_printf_common+0xe2>
    1c06:	04340613          	addi	a2,s0,67
    1c0a:	85de                	mv	a1,s7
    1c0c:	855a                	mv	a0,s6
    1c0e:	9982                	jalr	s3
    1c10:	57fd                	li	a5,-1
    1c12:	04f50463          	beq	a0,a5,1c5a <_printf_common+0xc6>
    1c16:	401c                	lw	a5,0(s0)
    1c18:	4711                	li	a4,4
    1c1a:	4481                	li	s1,0
    1c1c:	8b99                	andi	a5,a5,6
    1c1e:	00e79a63          	bne	a5,a4,1c32 <_printf_common+0x9e>
    1c22:	00092783          	lw	a5,0(s2)
    1c26:	4444                	lw	s1,12(s0)
    1c28:	8c9d                	sub	s1,s1,a5
    1c2a:	fff4c793          	not	a5,s1
    1c2e:	87fd                	srai	a5,a5,0x1f
    1c30:	8cfd                	and	s1,s1,a5
    1c32:	441c                	lw	a5,8(s0)
    1c34:	4818                	lw	a4,16(s0)
    1c36:	00f75463          	bge	a4,a5,1c3e <_printf_common+0xaa>
    1c3a:	8f99                	sub	a5,a5,a4
    1c3c:	94be                	add	s1,s1,a5
    1c3e:	4901                	li	s2,0
    1c40:	0469                	addi	s0,s0,26
    1c42:	5a7d                	li	s4,-1
    1c44:	05249863          	bne	s1,s2,1c94 <_printf_common+0x100>
    1c48:	4501                	li	a0,0
    1c4a:	a809                	j	1c5c <_printf_common+0xc8>
    1c4c:	4685                	li	a3,1
    1c4e:	8652                	mv	a2,s4
    1c50:	85de                	mv	a1,s7
    1c52:	855a                	mv	a0,s6
    1c54:	9982                	jalr	s3
    1c56:	01551e63          	bne	a0,s5,1c72 <_printf_common+0xde>
    1c5a:	557d                	li	a0,-1
    1c5c:	50b2                	lw	ra,44(sp)
    1c5e:	5422                	lw	s0,40(sp)
    1c60:	5492                	lw	s1,36(sp)
    1c62:	5902                	lw	s2,32(sp)
    1c64:	49f2                	lw	s3,28(sp)
    1c66:	4a62                	lw	s4,24(sp)
    1c68:	4ad2                	lw	s5,20(sp)
    1c6a:	4b42                	lw	s6,16(sp)
    1c6c:	4bb2                	lw	s7,12(sp)
    1c6e:	6145                	addi	sp,sp,48
    1c70:	8082                	ret
    1c72:	0485                	addi	s1,s1,1
    1c74:	bf9d                	j	1bea <_printf_common+0x56>
    1c76:	00d40733          	add	a4,s0,a3
    1c7a:	03000613          	li	a2,48
    1c7e:	04c701a3          	sb	a2,67(a4)
    1c82:	04544703          	lbu	a4,69(s0)
    1c86:	00168793          	addi	a5,a3,1
    1c8a:	97a2                	add	a5,a5,s0
    1c8c:	0689                	addi	a3,a3,2
    1c8e:	04e781a3          	sb	a4,67(a5)
    1c92:	bf95                	j	1c06 <_printf_common+0x72>
    1c94:	4685                	li	a3,1
    1c96:	8622                	mv	a2,s0
    1c98:	85de                	mv	a1,s7
    1c9a:	855a                	mv	a0,s6
    1c9c:	9982                	jalr	s3
    1c9e:	fb450ee3          	beq	a0,s4,1c5a <_printf_common+0xc6>
    1ca2:	0905                	addi	s2,s2,1
    1ca4:	b745                	j	1c44 <_printf_common+0xb0>

00001ca6 <_printf_i>:
    1ca6:	7139                	addi	sp,sp,-64
    1ca8:	dc22                	sw	s0,56(sp)
    1caa:	d452                	sw	s4,40(sp)
    1cac:	cc62                	sw	s8,24(sp)
    1cae:	ca66                	sw	s9,20(sp)
    1cb0:	de06                	sw	ra,60(sp)
    1cb2:	da26                	sw	s1,52(sp)
    1cb4:	d84a                	sw	s2,48(sp)
    1cb6:	d64e                	sw	s3,44(sp)
    1cb8:	d256                	sw	s5,36(sp)
    1cba:	d05a                	sw	s6,32(sp)
    1cbc:	ce5e                	sw	s7,28(sp)
    1cbe:	0185c783          	lbu	a5,24(a1)
    1cc2:	8a36                	mv	s4,a3
    1cc4:	07800693          	li	a3,120
    1cc8:	8c2a                	mv	s8,a0
    1cca:	842e                	mv	s0,a1
    1ccc:	8cb2                	mv	s9,a2
    1cce:	00f6ee63          	bltu	a3,a5,1cea <_printf_i+0x44>
    1cd2:	06200693          	li	a3,98
    1cd6:	04358a93          	addi	s5,a1,67
    1cda:	00f6eb63          	bltu	a3,a5,1cf0 <_printf_i+0x4a>
    1cde:	1a078c63          	beqz	a5,1e96 <_printf_i+0x1f0>
    1ce2:	05800693          	li	a3,88
    1ce6:	16d78c63          	beq	a5,a3,1e5e <_printf_i+0x1b8>
    1cea:	04240b93          	addi	s7,s0,66
    1cee:	a035                	j	1d1a <_printf_i+0x74>
    1cf0:	f9d78693          	addi	a3,a5,-99
    1cf4:	0ff6f693          	zext.b	a3,a3
    1cf8:	4655                	li	a2,21
    1cfa:	fed668e3          	bltu	a2,a3,1cea <_printf_i+0x44>
    1cfe:	6629                	lui	a2,0xa
    1d00:	068a                	slli	a3,a3,0x2
    1d02:	56460613          	addi	a2,a2,1380 # a564 <heap.cpp.7337fd52+0x3dc>
    1d06:	96b2                	add	a3,a3,a2
    1d08:	4294                	lw	a3,0(a3)
    1d0a:	8682                	jr	a3
    1d0c:	431c                	lw	a5,0(a4)
    1d0e:	04258b93          	addi	s7,a1,66
    1d12:	00478693          	addi	a3,a5,4
    1d16:	439c                	lw	a5,0(a5)
    1d18:	c314                	sw	a3,0(a4)
    1d1a:	04f40123          	sb	a5,66(s0)
    1d1e:	4785                	li	a5,1
    1d20:	aa71                	j	1ebc <_printf_i+0x216>
    1d22:	419c                	lw	a5,0(a1)
    1d24:	4310                	lw	a2,0(a4)
    1d26:	0807f593          	andi	a1,a5,128
    1d2a:	00460693          	addi	a3,a2,4
    1d2e:	c185                	beqz	a1,1d4e <_printf_i+0xa8>
    1d30:	4204                	lw	s1,0(a2)
    1d32:	c314                	sw	a3,0(a4)
    1d34:	6929                	lui	s2,0xa
    1d36:	0004d863          	bgez	s1,1d46 <_printf_i+0xa0>
    1d3a:	02d00793          	li	a5,45
    1d3e:	409004b3          	neg	s1,s1
    1d42:	04f401a3          	sb	a5,67(s0)
    1d46:	73890913          	addi	s2,s2,1848 # a738 <heap.cpp.7337fd52+0x5b0>
    1d4a:	49a9                	li	s3,10
    1d4c:	a061                	j	1dd4 <_printf_i+0x12e>
    1d4e:	4204                	lw	s1,0(a2)
    1d50:	0407f793          	andi	a5,a5,64
    1d54:	c314                	sw	a3,0(a4)
    1d56:	dff9                	beqz	a5,1d34 <_printf_i+0x8e>
    1d58:	04c2                	slli	s1,s1,0x10
    1d5a:	84c1                	srai	s1,s1,0x10
    1d5c:	bfe1                	j	1d34 <_printf_i+0x8e>
    1d5e:	4194                	lw	a3,0(a1)
    1d60:	431c                	lw	a5,0(a4)
    1d62:	0806f613          	andi	a2,a3,128
    1d66:	4384                	lw	s1,0(a5)
    1d68:	0791                	addi	a5,a5,4
    1d6a:	e611                	bnez	a2,1d76 <_printf_i+0xd0>
    1d6c:	0406f693          	andi	a3,a3,64
    1d70:	c299                	beqz	a3,1d76 <_printf_i+0xd0>
    1d72:	04c2                	slli	s1,s1,0x10
    1d74:	80c1                	srli	s1,s1,0x10
    1d76:	c31c                	sw	a5,0(a4)
    1d78:	01844703          	lbu	a4,24(s0)
    1d7c:	6929                	lui	s2,0xa
    1d7e:	06f00793          	li	a5,111
    1d82:	73890913          	addi	s2,s2,1848 # a738 <heap.cpp.7337fd52+0x5b0>
    1d86:	49a1                	li	s3,8
    1d88:	04f70463          	beq	a4,a5,1dd0 <_printf_i+0x12a>
    1d8c:	49a9                	li	s3,10
    1d8e:	a089                	j	1dd0 <_printf_i+0x12a>
    1d90:	419c                	lw	a5,0(a1)
    1d92:	0207e793          	ori	a5,a5,32
    1d96:	c19c                	sw	a5,0(a1)
    1d98:	6929                	lui	s2,0xa
    1d9a:	07800793          	li	a5,120
    1d9e:	74c90913          	addi	s2,s2,1868 # a74c <heap.cpp.7337fd52+0x5c4>
    1da2:	04f402a3          	sb	a5,69(s0)
    1da6:	401c                	lw	a5,0(s0)
    1da8:	4314                	lw	a3,0(a4)
    1daa:	0807f613          	andi	a2,a5,128
    1dae:	4284                	lw	s1,0(a3)
    1db0:	0691                	addi	a3,a3,4
    1db2:	e611                	bnez	a2,1dbe <_printf_i+0x118>
    1db4:	0407f613          	andi	a2,a5,64
    1db8:	c219                	beqz	a2,1dbe <_printf_i+0x118>
    1dba:	04c2                	slli	s1,s1,0x10
    1dbc:	80c1                	srli	s1,s1,0x10
    1dbe:	c314                	sw	a3,0(a4)
    1dc0:	0017f713          	andi	a4,a5,1
    1dc4:	c701                	beqz	a4,1dcc <_printf_i+0x126>
    1dc6:	0207e793          	ori	a5,a5,32
    1dca:	c01c                	sw	a5,0(s0)
    1dcc:	ccc9                	beqz	s1,1e66 <_printf_i+0x1c0>
    1dce:	49c1                	li	s3,16
    1dd0:	040401a3          	sb	zero,67(s0)
    1dd4:	405c                	lw	a5,4(s0)
    1dd6:	c41c                	sw	a5,8(s0)
    1dd8:	0007c863          	bltz	a5,1de8 <_printf_i+0x142>
    1ddc:	4018                	lw	a4,0(s0)
    1dde:	8fc5                	or	a5,a5,s1
    1de0:	8bd6                	mv	s7,s5
    1de2:	9b6d                	andi	a4,a4,-5
    1de4:	c018                	sw	a4,0(s0)
    1de6:	c395                	beqz	a5,1e0a <_printf_i+0x164>
    1de8:	8bd6                	mv	s7,s5
    1dea:	85ce                	mv	a1,s3
    1dec:	8526                	mv	a0,s1
    1dee:	26dd                	jal	21d4 <__umodsi3>
    1df0:	954a                	add	a0,a0,s2
    1df2:	00054783          	lbu	a5,0(a0)
    1df6:	85ce                	mv	a1,s3
    1df8:	8526                	mv	a0,s1
    1dfa:	fefb8fa3          	sb	a5,-1(s7)
    1dfe:	8b26                	mv	s6,s1
    1e00:	2665                	jal	21a8 <__hidden___udivsi3>
    1e02:	1bfd                	addi	s7,s7,-1
    1e04:	84aa                	mv	s1,a0
    1e06:	ff3b72e3          	bgeu	s6,s3,1dea <_printf_i+0x144>
    1e0a:	47a1                	li	a5,8
    1e0c:	00f99e63          	bne	s3,a5,1e28 <_printf_i+0x182>
    1e10:	401c                	lw	a5,0(s0)
    1e12:	8b85                	andi	a5,a5,1
    1e14:	cb91                	beqz	a5,1e28 <_printf_i+0x182>
    1e16:	4058                	lw	a4,4(s0)
    1e18:	481c                	lw	a5,16(s0)
    1e1a:	00e7c763          	blt	a5,a4,1e28 <_printf_i+0x182>
    1e1e:	03000793          	li	a5,48
    1e22:	fefb8fa3          	sb	a5,-1(s7)
    1e26:	1bfd                	addi	s7,s7,-1
    1e28:	417a8ab3          	sub	s5,s5,s7
    1e2c:	01542823          	sw	s5,16(s0)
    1e30:	8752                	mv	a4,s4
    1e32:	86e6                	mv	a3,s9
    1e34:	0070                	addi	a2,sp,12
    1e36:	85a2                	mv	a1,s0
    1e38:	8562                	mv	a0,s8
    1e3a:	3ba9                	jal	1b94 <_printf_common>
    1e3c:	597d                	li	s2,-1
    1e3e:	09251363          	bne	a0,s2,1ec4 <_printf_i+0x21e>
    1e42:	557d                	li	a0,-1
    1e44:	50f2                	lw	ra,60(sp)
    1e46:	5462                	lw	s0,56(sp)
    1e48:	54d2                	lw	s1,52(sp)
    1e4a:	5942                	lw	s2,48(sp)
    1e4c:	59b2                	lw	s3,44(sp)
    1e4e:	5a22                	lw	s4,40(sp)
    1e50:	5a92                	lw	s5,36(sp)
    1e52:	5b02                	lw	s6,32(sp)
    1e54:	4bf2                	lw	s7,28(sp)
    1e56:	4c62                	lw	s8,24(sp)
    1e58:	4cd2                	lw	s9,20(sp)
    1e5a:	6121                	addi	sp,sp,64
    1e5c:	8082                	ret
    1e5e:	6929                	lui	s2,0xa
    1e60:	73890913          	addi	s2,s2,1848 # a738 <heap.cpp.7337fd52+0x5b0>
    1e64:	bf3d                	j	1da2 <_printf_i+0xfc>
    1e66:	401c                	lw	a5,0(s0)
    1e68:	fdf7f793          	andi	a5,a5,-33
    1e6c:	c01c                	sw	a5,0(s0)
    1e6e:	b785                	j	1dce <_printf_i+0x128>
    1e70:	4194                	lw	a3,0(a1)
    1e72:	431c                	lw	a5,0(a4)
    1e74:	49d0                	lw	a2,20(a1)
    1e76:	0806f513          	andi	a0,a3,128
    1e7a:	00478593          	addi	a1,a5,4
    1e7e:	c509                	beqz	a0,1e88 <_printf_i+0x1e2>
    1e80:	c30c                	sw	a1,0(a4)
    1e82:	439c                	lw	a5,0(a5)
    1e84:	c390                	sw	a2,0(a5)
    1e86:	a801                	j	1e96 <_printf_i+0x1f0>
    1e88:	c30c                	sw	a1,0(a4)
    1e8a:	0406f693          	andi	a3,a3,64
    1e8e:	439c                	lw	a5,0(a5)
    1e90:	daf5                	beqz	a3,1e84 <_printf_i+0x1de>
    1e92:	00c79023          	sh	a2,0(a5)
    1e96:	00042823          	sw	zero,16(s0)
    1e9a:	8bd6                	mv	s7,s5
    1e9c:	bf51                	j	1e30 <_printf_i+0x18a>
    1e9e:	431c                	lw	a5,0(a4)
    1ea0:	41d0                	lw	a2,4(a1)
    1ea2:	4581                	li	a1,0
    1ea4:	00478693          	addi	a3,a5,4
    1ea8:	c314                	sw	a3,0(a4)
    1eaa:	0007ab83          	lw	s7,0(a5)
    1eae:	855e                	mv	a0,s7
    1eb0:	225d                	jal	2056 <memchr>
    1eb2:	c501                	beqz	a0,1eba <_printf_i+0x214>
    1eb4:	41750533          	sub	a0,a0,s7
    1eb8:	c048                	sw	a0,4(s0)
    1eba:	405c                	lw	a5,4(s0)
    1ebc:	c81c                	sw	a5,16(s0)
    1ebe:	040401a3          	sb	zero,67(s0)
    1ec2:	b7bd                	j	1e30 <_printf_i+0x18a>
    1ec4:	4814                	lw	a3,16(s0)
    1ec6:	865e                	mv	a2,s7
    1ec8:	85e6                	mv	a1,s9
    1eca:	8562                	mv	a0,s8
    1ecc:	9a02                	jalr	s4
    1ece:	f7250ae3          	beq	a0,s2,1e42 <_printf_i+0x19c>
    1ed2:	401c                	lw	a5,0(s0)
    1ed4:	8b89                	andi	a5,a5,2
    1ed6:	e795                	bnez	a5,1f02 <_printf_i+0x25c>
    1ed8:	47b2                	lw	a5,12(sp)
    1eda:	4448                	lw	a0,12(s0)
    1edc:	f6f554e3          	bge	a0,a5,1e44 <_printf_i+0x19e>
    1ee0:	853e                	mv	a0,a5
    1ee2:	b78d                	j	1e44 <_printf_i+0x19e>
    1ee4:	4685                	li	a3,1
    1ee6:	01940613          	addi	a2,s0,25
    1eea:	85e6                	mv	a1,s9
    1eec:	8562                	mv	a0,s8
    1eee:	9a02                	jalr	s4
    1ef0:	f52509e3          	beq	a0,s2,1e42 <_printf_i+0x19c>
    1ef4:	0485                	addi	s1,s1,1
    1ef6:	445c                	lw	a5,12(s0)
    1ef8:	4732                	lw	a4,12(sp)
    1efa:	8f99                	sub	a5,a5,a4
    1efc:	fef4c4e3          	blt	s1,a5,1ee4 <_printf_i+0x23e>
    1f00:	bfe1                	j	1ed8 <_printf_i+0x232>
    1f02:	4481                	li	s1,0
    1f04:	bfcd                	j	1ef6 <_printf_i+0x250>

00001f06 <__swbuf_r>:
    1f06:	1101                	addi	sp,sp,-32
    1f08:	cc22                	sw	s0,24(sp)
    1f0a:	ca26                	sw	s1,20(sp)
    1f0c:	c64e                	sw	s3,12(sp)
    1f0e:	ce06                	sw	ra,28(sp)
    1f10:	c84a                	sw	s2,16(sp)
    1f12:	84aa                	mv	s1,a0
    1f14:	89ae                	mv	s3,a1
    1f16:	8432                	mv	s0,a2
    1f18:	c509                	beqz	a0,1f22 <__swbuf_r+0x1c>
    1f1a:	511c                	lw	a5,32(a0)
    1f1c:	e399                	bnez	a5,1f22 <__swbuf_r+0x1c>
    1f1e:	a62ff0ef          	jal	1180 <__sinit>
    1f22:	4c1c                	lw	a5,24(s0)
    1f24:	c41c                	sw	a5,8(s0)
    1f26:	00c45783          	lhu	a5,12(s0)
    1f2a:	8ba1                	andi	a5,a5,8
    1f2c:	c399                	beqz	a5,1f32 <__swbuf_r+0x2c>
    1f2e:	481c                	lw	a5,16(s0)
    1f30:	ef91                	bnez	a5,1f4c <__swbuf_r+0x46>
    1f32:	85a2                	mv	a1,s0
    1f34:	8526                	mv	a0,s1
    1f36:	2085                	jal	1f96 <__swsetup_r>
    1f38:	c911                	beqz	a0,1f4c <__swbuf_r+0x46>
    1f3a:	597d                	li	s2,-1
    1f3c:	40f2                	lw	ra,28(sp)
    1f3e:	4462                	lw	s0,24(sp)
    1f40:	44d2                	lw	s1,20(sp)
    1f42:	49b2                	lw	s3,12(sp)
    1f44:	854a                	mv	a0,s2
    1f46:	4942                	lw	s2,16(sp)
    1f48:	6105                	addi	sp,sp,32
    1f4a:	8082                	ret
    1f4c:	481c                	lw	a5,16(s0)
    1f4e:	4008                	lw	a0,0(s0)
    1f50:	8d1d                	sub	a0,a0,a5
    1f52:	485c                	lw	a5,20(s0)
    1f54:	00f54663          	blt	a0,a5,1f60 <__swbuf_r+0x5a>
    1f58:	85a2                	mv	a1,s0
    1f5a:	8526                	mv	a0,s1
    1f5c:	38c9                	jal	182e <_fflush_r>
    1f5e:	fd71                	bnez	a0,1f3a <__swbuf_r+0x34>
    1f60:	441c                	lw	a5,8(s0)
    1f62:	0505                	addi	a0,a0,1
    1f64:	0ff9f913          	zext.b	s2,s3
    1f68:	17fd                	addi	a5,a5,-1
    1f6a:	c41c                	sw	a5,8(s0)
    1f6c:	401c                	lw	a5,0(s0)
    1f6e:	00178713          	addi	a4,a5,1
    1f72:	c018                	sw	a4,0(s0)
    1f74:	01378023          	sb	s3,0(a5)
    1f78:	485c                	lw	a5,20(s0)
    1f7a:	00a78963          	beq	a5,a0,1f8c <__swbuf_r+0x86>
    1f7e:	00c45783          	lhu	a5,12(s0)
    1f82:	8b85                	andi	a5,a5,1
    1f84:	dfc5                	beqz	a5,1f3c <__swbuf_r+0x36>
    1f86:	ff690793          	addi	a5,s2,-10
    1f8a:	fbcd                	bnez	a5,1f3c <__swbuf_r+0x36>
    1f8c:	85a2                	mv	a1,s0
    1f8e:	8526                	mv	a0,s1
    1f90:	3879                	jal	182e <_fflush_r>
    1f92:	d54d                	beqz	a0,1f3c <__swbuf_r+0x36>
    1f94:	b75d                	j	1f3a <__swbuf_r+0x34>

00001f96 <__swsetup_r>:
    1f96:	1141                	addi	sp,sp,-16
    1f98:	c226                	sw	s1,4(sp)
    1f9a:	84aa                	mv	s1,a0
    1f9c:	9341a503          	lw	a0,-1740(gp) # b1f4 <_impure_ptr>
    1fa0:	c422                	sw	s0,8(sp)
    1fa2:	c606                	sw	ra,12(sp)
    1fa4:	842e                	mv	s0,a1
    1fa6:	c509                	beqz	a0,1fb0 <__swsetup_r+0x1a>
    1fa8:	511c                	lw	a5,32(a0)
    1faa:	e399                	bnez	a5,1fb0 <__swsetup_r+0x1a>
    1fac:	9d4ff0ef          	jal	1180 <__sinit>
    1fb0:	00c41783          	lh	a5,12(s0)
    1fb4:	0087f713          	andi	a4,a5,8
    1fb8:	e731                	bnez	a4,2004 <__swsetup_r+0x6e>
    1fba:	0107f713          	andi	a4,a5,16
    1fbe:	eb09                	bnez	a4,1fd0 <__swsetup_r+0x3a>
    1fc0:	4725                	li	a4,9
    1fc2:	c098                	sw	a4,0(s1)
    1fc4:	0407e793          	ori	a5,a5,64
    1fc8:	00f41623          	sh	a5,12(s0)
    1fcc:	557d                	li	a0,-1
    1fce:	a885                	j	203e <__swsetup_r+0xa8>
    1fd0:	0047f713          	andi	a4,a5,4
    1fd4:	c705                	beqz	a4,1ffc <__swsetup_r+0x66>
    1fd6:	584c                	lw	a1,52(s0)
    1fd8:	c991                	beqz	a1,1fec <__swsetup_r+0x56>
    1fda:	04440793          	addi	a5,s0,68
    1fde:	00f58563          	beq	a1,a5,1fe8 <__swsetup_r+0x52>
    1fe2:	8526                	mv	a0,s1
    1fe4:	d22ff0ef          	jal	1506 <_free_r>
    1fe8:	02042a23          	sw	zero,52(s0)
    1fec:	00c45783          	lhu	a5,12(s0)
    1ff0:	4818                	lw	a4,16(s0)
    1ff2:	00042223          	sw	zero,4(s0)
    1ff6:	fdb7f793          	andi	a5,a5,-37
    1ffa:	c018                	sw	a4,0(s0)
    1ffc:	0087e793          	ori	a5,a5,8
    2000:	00f41623          	sh	a5,12(s0)
    2004:	481c                	lw	a5,16(s0)
    2006:	eb99                	bnez	a5,201c <__swsetup_r+0x86>
    2008:	445c                	lw	a5,12(s0)
    200a:	20000713          	li	a4,512
    200e:	2807f793          	andi	a5,a5,640
    2012:	00e78563          	beq	a5,a4,201c <__swsetup_r+0x86>
    2016:	85a2                	mv	a1,s0
    2018:	8526                	mv	a0,s1
    201a:	2075                	jal	20c6 <__smakebuf_r>
    201c:	00c41783          	lh	a5,12(s0)
    2020:	0017f713          	andi	a4,a5,1
    2024:	c315                	beqz	a4,2048 <__swsetup_r+0xb2>
    2026:	4858                	lw	a4,20(s0)
    2028:	00042423          	sw	zero,8(s0)
    202c:	40e00733          	neg	a4,a4
    2030:	cc18                	sw	a4,24(s0)
    2032:	4818                	lw	a4,16(s0)
    2034:	4501                	li	a0,0
    2036:	e701                	bnez	a4,203e <__swsetup_r+0xa8>
    2038:	0807f713          	andi	a4,a5,128
    203c:	f741                	bnez	a4,1fc4 <__swsetup_r+0x2e>
    203e:	40b2                	lw	ra,12(sp)
    2040:	4422                	lw	s0,8(sp)
    2042:	4492                	lw	s1,4(sp)
    2044:	0141                	addi	sp,sp,16
    2046:	8082                	ret
    2048:	0027f713          	andi	a4,a5,2
    204c:	4681                	li	a3,0
    204e:	e311                	bnez	a4,2052 <__swsetup_r+0xbc>
    2050:	4854                	lw	a3,20(s0)
    2052:	c414                	sw	a3,8(s0)
    2054:	bff9                	j	2032 <__swsetup_r+0x9c>

00002056 <memchr>:
    2056:	0ff5f593          	zext.b	a1,a1
    205a:	962a                	add	a2,a2,a0
    205c:	00c51463          	bne	a0,a2,2064 <memchr+0xe>
    2060:	4501                	li	a0,0
    2062:	8082                	ret
    2064:	00054783          	lbu	a5,0(a0)
    2068:	feb78de3          	beq	a5,a1,2062 <memchr+0xc>
    206c:	0505                	addi	a0,a0,1
    206e:	b7fd                	j	205c <memchr+0x6>

00002070 <__swhatbuf_r>:
    2070:	7119                	addi	sp,sp,-128
    2072:	dca2                	sw	s0,120(sp)
    2074:	842e                	mv	s0,a1
    2076:	00e59583          	lh	a1,14(a1)
    207a:	daa6                	sw	s1,116(sp)
    207c:	de86                	sw	ra,124(sp)
    207e:	84b2                	mv	s1,a2
    2080:	0205d163          	bgez	a1,20a2 <__swhatbuf_r+0x32>
    2084:	00c45783          	lhu	a5,12(s0)
    2088:	0807f793          	andi	a5,a5,128
    208c:	eb8d                	bnez	a5,20be <__swhatbuf_r+0x4e>
    208e:	40000713          	li	a4,1024
    2092:	50f6                	lw	ra,124(sp)
    2094:	5466                	lw	s0,120(sp)
    2096:	c29c                	sw	a5,0(a3)
    2098:	c098                	sw	a4,0(s1)
    209a:	4501                	li	a0,0
    209c:	54d6                	lw	s1,116(sp)
    209e:	6109                	addi	sp,sp,128
    20a0:	8082                	ret
    20a2:	0830                	addi	a2,sp,24
    20a4:	c636                	sw	a3,12(sp)
    20a6:	2045                	jal	2146 <_fstat_r>
    20a8:	46b2                	lw	a3,12(sp)
    20aa:	fc054de3          	bltz	a0,2084 <__swhatbuf_r+0x14>
    20ae:	47f2                	lw	a5,28(sp)
    20b0:	673d                	lui	a4,0xf
    20b2:	8ff9                	and	a5,a5,a4
    20b4:	7779                	lui	a4,0xffffe
    20b6:	97ba                	add	a5,a5,a4
    20b8:	0017b793          	seqz	a5,a5
    20bc:	bfc9                	j	208e <__swhatbuf_r+0x1e>
    20be:	4781                	li	a5,0
    20c0:	04000713          	li	a4,64
    20c4:	b7f9                	j	2092 <__swhatbuf_r+0x22>

000020c6 <__smakebuf_r>:
    20c6:	00c5d703          	lhu	a4,12(a1)
    20ca:	7179                	addi	sp,sp,-48
    20cc:	d422                	sw	s0,40(sp)
    20ce:	d606                	sw	ra,44(sp)
    20d0:	d226                	sw	s1,36(sp)
    20d2:	8b09                	andi	a4,a4,2
    20d4:	842e                	mv	s0,a1
    20d6:	cf01                	beqz	a4,20ee <__smakebuf_r+0x28>
    20d8:	04740793          	addi	a5,s0,71
    20dc:	c01c                	sw	a5,0(s0)
    20de:	c81c                	sw	a5,16(s0)
    20e0:	4785                	li	a5,1
    20e2:	c85c                	sw	a5,20(s0)
    20e4:	50b2                	lw	ra,44(sp)
    20e6:	5422                	lw	s0,40(sp)
    20e8:	5492                	lw	s1,36(sp)
    20ea:	6145                	addi	sp,sp,48
    20ec:	8082                	ret
    20ee:	0874                	addi	a3,sp,28
    20f0:	0830                	addi	a2,sp,24
    20f2:	84aa                	mv	s1,a0
    20f4:	3fb5                	jal	2070 <__swhatbuf_r>
    20f6:	45e2                	lw	a1,24(sp)
    20f8:	8526                	mv	a0,s1
    20fa:	c62e                	sw	a1,12(sp)
    20fc:	cf8ff0ef          	jal	15f4 <_malloc_r>
    2100:	00c41783          	lh	a5,12(s0)
    2104:	45b2                	lw	a1,12(sp)
    2106:	e911                	bnez	a0,211a <__smakebuf_r+0x54>
    2108:	2007f713          	andi	a4,a5,512
    210c:	ff61                	bnez	a4,20e4 <__smakebuf_r+0x1e>
    210e:	9bf1                	andi	a5,a5,-4
    2110:	0027e793          	ori	a5,a5,2
    2114:	00f41623          	sh	a5,12(s0)
    2118:	b7c1                	j	20d8 <__smakebuf_r+0x12>
    211a:	0807e793          	ori	a5,a5,128
    211e:	00f41623          	sh	a5,12(s0)
    2122:	47f2                	lw	a5,28(sp)
    2124:	c008                	sw	a0,0(s0)
    2126:	c808                	sw	a0,16(s0)
    2128:	c84c                	sw	a1,20(s0)
    212a:	dfcd                	beqz	a5,20e4 <__smakebuf_r+0x1e>
    212c:	00e41583          	lh	a1,14(s0)
    2130:	8526                	mv	a0,s1
    2132:	2089                	jal	2174 <_isatty_r>
    2134:	d945                	beqz	a0,20e4 <__smakebuf_r+0x1e>
    2136:	00c45783          	lhu	a5,12(s0)
    213a:	9bf1                	andi	a5,a5,-4
    213c:	0017e793          	ori	a5,a5,1
    2140:	00f41623          	sh	a5,12(s0)
    2144:	b745                	j	20e4 <__smakebuf_r+0x1e>

00002146 <_fstat_r>:
    2146:	1141                	addi	sp,sp,-16
    2148:	c422                	sw	s0,8(sp)
    214a:	c226                	sw	s1,4(sp)
    214c:	84aa                	mv	s1,a0
    214e:	852e                	mv	a0,a1
    2150:	85b2                	mv	a1,a2
    2152:	c606                	sw	ra,12(sp)
    2154:	9201ae23          	sw	zero,-1732(gp) # b1fc <errno>
    2158:	d3bfe0ef          	jal	e92 <_fstat>
    215c:	57fd                	li	a5,-1
    215e:	00f51663          	bne	a0,a5,216a <_fstat_r+0x24>
    2162:	93c1a783          	lw	a5,-1732(gp) # b1fc <errno>
    2166:	c391                	beqz	a5,216a <_fstat_r+0x24>
    2168:	c09c                	sw	a5,0(s1)
    216a:	40b2                	lw	ra,12(sp)
    216c:	4422                	lw	s0,8(sp)
    216e:	4492                	lw	s1,4(sp)
    2170:	0141                	addi	sp,sp,16
    2172:	8082                	ret

00002174 <_isatty_r>:
    2174:	1141                	addi	sp,sp,-16
    2176:	c422                	sw	s0,8(sp)
    2178:	c226                	sw	s1,4(sp)
    217a:	84aa                	mv	s1,a0
    217c:	852e                	mv	a0,a1
    217e:	c606                	sw	ra,12(sp)
    2180:	9201ae23          	sw	zero,-1732(gp) # b1fc <errno>
    2184:	d17fe0ef          	jal	e9a <_isatty>
    2188:	57fd                	li	a5,-1
    218a:	00f51663          	bne	a0,a5,2196 <_isatty_r+0x22>
    218e:	93c1a783          	lw	a5,-1732(gp) # b1fc <errno>
    2192:	c391                	beqz	a5,2196 <_isatty_r+0x22>
    2194:	c09c                	sw	a5,0(s1)
    2196:	40b2                	lw	ra,12(sp)
    2198:	4422                	lw	s0,8(sp)
    219a:	4492                	lw	s1,4(sp)
    219c:	0141                	addi	sp,sp,16
    219e:	8082                	ret

000021a0 <__divsi3>:
  li    t0, -1
  beq   a1, t0, .L20
#endif

FUNC_BEGIN (__divdi3)
  bltz  a0, .L10
    21a0:	02054e63          	bltz	a0,21dc <__umodsi3+0x8>
  bltz  a1, .L11
    21a4:	0405c363          	bltz	a1,21ea <__umodsi3+0x16>

000021a8 <__hidden___udivsi3>:
  /* Since the quotient is positive, fall into __udivdi3.  */

FUNC_BEGIN (__udivdi3)
  mv    a2, a1
    21a8:	862e                	mv	a2,a1
  mv    a1, a0
    21aa:	85aa                	mv	a1,a0
  li    a0, -1
    21ac:	557d                	li	a0,-1
  beqz  a2, .L5
    21ae:	c215                	beqz	a2,21d2 <__hidden___udivsi3+0x2a>
  li    a3, 1
    21b0:	4685                	li	a3,1
  bgeu  a2, a1, .L2
    21b2:	00b67863          	bgeu	a2,a1,21c2 <__hidden___udivsi3+0x1a>
.L1:
  blez  a2, .L2
    21b6:	00c05663          	blez	a2,21c2 <__hidden___udivsi3+0x1a>
  slli  a2, a2, 1
    21ba:	0606                	slli	a2,a2,0x1
  slli  a3, a3, 1
    21bc:	0686                	slli	a3,a3,0x1
  bgtu  a1, a2, .L1
    21be:	feb66ce3          	bltu	a2,a1,21b6 <__hidden___udivsi3+0xe>
.L2:
  li    a0, 0
    21c2:	4501                	li	a0,0
.L3:
  bltu  a1, a2, .L4
    21c4:	00c5e463          	bltu	a1,a2,21cc <__hidden___udivsi3+0x24>
  sub   a1, a1, a2
    21c8:	8d91                	sub	a1,a1,a2
  or    a0, a0, a3
    21ca:	8d55                	or	a0,a0,a3
.L4:
  srli  a3, a3, 1
    21cc:	8285                	srli	a3,a3,0x1
  srli  a2, a2, 1
    21ce:	8205                	srli	a2,a2,0x1
  bnez  a3, .L3
    21d0:	faf5                	bnez	a3,21c4 <__hidden___udivsi3+0x1c>
.L5:
  ret
    21d2:	8082                	ret

000021d4 <__umodsi3>:
FUNC_END (__udivdi3)
HIDDEN_DEF (__udivdi3)

FUNC_BEGIN (__umoddi3)
  /* Call __udivdi3(a0, a1), then return the remainder, which is in a1.  */
  move  t0, ra
    21d4:	8286                	mv	t0,ra
  jal   HIDDEN_JUMPTARGET(__udivdi3)
    21d6:	3fc9                	jal	21a8 <__hidden___udivsi3>
  move  a0, a1
    21d8:	852e                	mv	a0,a1
  jr    t0
    21da:	8282                	jr	t0
FUNC_END (__umoddi3)

  /* Handle negative arguments to __divdi3.  */
.L10:
  neg   a0, a0
    21dc:	40a00533          	neg	a0,a0
  /* Zero is handled as a negative so that the result will not be inverted.  */
  bgtz  a1, .L12     /* Compute __udivdi3(-a0, a1), then negate the result.  */
    21e0:	00b04763          	bgtz	a1,21ee <__umodsi3+0x1a>

  neg   a1, a1
    21e4:	40b005b3          	neg	a1,a1
  j     HIDDEN_JUMPTARGET(__udivdi3)     /* Compute __udivdi3(-a0, -a1).  */
    21e8:	b7c1                	j	21a8 <__hidden___udivsi3>
.L11:                /* Compute __udivdi3(a0, -a1), then negate the result.  */
  neg   a1, a1
    21ea:	40b005b3          	neg	a1,a1
.L12:
  move  t0, ra
    21ee:	8286                	mv	t0,ra
  jal   HIDDEN_JUMPTARGET(__udivdi3)
    21f0:	3f65                	jal	21a8 <__hidden___udivsi3>
  neg   a0, a0
    21f2:	40a00533          	neg	a0,a0
  jr    t0
    21f6:	8282                	jr	t0

000021f8 <__modsi3>:
FUNC_END (__divdi3)

FUNC_BEGIN (__moddi3)
  move   t0, ra
    21f8:	8286                	mv	t0,ra
  bltz   a1, .L31
    21fa:	0005c763          	bltz	a1,2208 <__modsi3+0x10>
  bltz   a0, .L32
    21fe:	00054963          	bltz	a0,2210 <__modsi3+0x18>
.L30:
  jal    HIDDEN_JUMPTARGET(__udivdi3)    /* The dividend is not negative.  */
    2202:	375d                	jal	21a8 <__hidden___udivsi3>
  move   a0, a1
    2204:	852e                	mv	a0,a1
  jr     t0
    2206:	8282                	jr	t0
.L31:
  neg    a1, a1
    2208:	40b005b3          	neg	a1,a1
  bgez   a0, .L30
    220c:	fe055be3          	bgez	a0,2202 <__modsi3+0xa>
.L32:
  neg    a0, a0
    2210:	40a00533          	neg	a0,a0
  jal    HIDDEN_JUMPTARGET(__udivdi3)    /* The dividend is hella negative.  */
    2214:	3f51                	jal	21a8 <__hidden___udivsi3>
  neg    a0, a1
    2216:	40b00533          	neg	a0,a1
  jr     t0
    221a:	8282                	jr	t0
    221c:	0001                	nop

0000221e <main>:
    in3 = in3_buf;
    in4 = in4_buf;
}

int main(void)
{
    221e:	715d                	addi	sp,sp,-80
    2220:	c686                	sw	ra,76(sp)
    2222:	c4a2                	sw	s0,72(sp)
    2224:	c2a6                	sw	s1,68(sp)
    2226:	c0ca                	sw	s2,64(sp)
    2228:	de4e                	sw	s3,60(sp)
    222a:	dc52                	sw	s4,56(sp)
    222c:	da56                	sw	s5,52(sp)
    222e:	d85a                	sw	s6,48(sp)
    2230:	d65e                	sw	s7,44(sp)
    2232:	d462                	sw	s8,40(sp)
    2234:	d266                	sw	s9,36(sp)
    2236:	d06a                	sw	s10,32(sp)
    2238:	ce6e                	sw	s11,28(sp)
    uint32_t * total_cycles = malloc(sizeof(uint32_t));
    223a:	4511                	li	a0,4
    223c:	e54ff0ef          	jal	1890 <malloc>
    2240:	8baa                	mv	s7,a0
    *total_cycles = 0;
    2242:	00052023          	sw	zero,0(a0)

    typeInf actionID = -1;
    2246:	57fd                	li	a5,-1
    2248:	c63e                	sw	a5,12(sp)

    for (int seed = 0; seed < 5; ++seed) // NB_SEED
    224a:	64a9                	lui	s1,0xa
    224c:	76048493          	addi	s1,s1,1888 # a760 <dataSourcesLE_0>
    2250:	19048b13          	addi	s6,s1,400
    2254:	32048a93          	addi	s5,s1,800
    2258:	4b048a13          	addi	s4,s1,1200
    225c:	64048993          	addi	s3,s1,1600
    2260:	7d048913          	addi	s2,s1,2000
    2264:	01448d93          	addi	s11,s1,20
    in1_buf[0] = dataSourcesLE_0[seed];
    2268:	b5018413          	addi	s0,gp,-1200 # b410 <in1_buf>
    in2 = in2_buf;
    226c:	00c40d13          	addi	s10,s0,12
    in3 = in3_buf;
    2270:	01840c93          	addi	s9,s0,24
    in4 = in4_buf;
    2274:	02440c13          	addi	s8,s0,36
    in1_buf[0] = dataSourcesLE_0[seed];
    2278:	409c                	lw	a5,0(s1)
    227a:	c01c                	sw	a5,0(s0)
    in1_buf[1] = dataSourcesLE_1[seed];
    227c:	000b2783          	lw	a5,0(s6)
    2280:	c05c                	sw	a5,4(s0)
    in1_buf[2] = dataSourcesLE_2[seed];
    2282:	000aa783          	lw	a5,0(s5)
    2286:	c41c                	sw	a5,8(s0)
    in2_buf[0] = dataSourcesLE_3[0];
    2288:	00042623          	sw	zero,12(s0)
    in2_buf[1] = dataSourcesLE_4[0];
    228c:	015a07b7          	lui	a5,0x15a0
    2290:	c81c                	sw	a5,16(s0)
    in2_buf[2] = dataSourcesLE_5[0];
    2292:	010b07b7          	lui	a5,0x10b0
    2296:	c85c                	sw	a5,20(s0)
    in3_buf[0] = dataSourcesLE_6[seed];
    2298:	000a2783          	lw	a5,0(s4)
    229c:	cc1c                	sw	a5,24(s0)
    in3_buf[1] = dataSourcesLE_7[seed];
    229e:	0009a783          	lw	a5,0(s3)
    22a2:	cc5c                	sw	a5,28(s0)
    in3_buf[2] = dataSourcesLE_8[seed];
    22a4:	00092783          	lw	a5,0(s2)
    22a8:	d01c                	sw	a5,32(s0)
    in4_buf[0] = dataSourcesLE_9[0];
    22aa:	080007b7          	lui	a5,0x8000
    22ae:	d05c                	sw	a5,36(s0)
    in4_buf[1] = dataSourcesLE_10[0];
    22b0:	d41c                	sw	a5,40(s0)
    in4_buf[2] = dataSourcesLE_11[0];
    22b2:	d45c                	sw	a5,44(s0)
    in4_buf[3] = dataSourcesLE_12[0];
    22b4:	d81c                	sw	a5,48(s0)
    in4_buf[4] = dataSourcesLE_13[0];
    22b6:	020007b7          	lui	a5,0x2000
    22ba:	d85c                	sw	a5,52(s0)
    in4_buf[5] = dataSourcesLE_14[0];
    22bc:	010007b7          	lui	a5,0x1000
    22c0:	dc1c                	sw	a5,56(s0)
    in1 = in1_buf;
    22c2:	9481ac23          	sw	s0,-1704(gp) # b218 <in1>
    in2 = in2_buf;
    22c6:	95a1aa23          	sw	s10,-1708(gp) # b214 <in2>
    in3 = in3_buf;
    22ca:	9591a823          	sw	s9,-1712(gp) # b210 <in3>
    in4 = in4_buf;
    22ce:	9581a623          	sw	s8,-1716(gp) # b20c <in4>
    {
        assign_LE_values(seed);

        inferenceTPG(&actionID, in1, in2, in3, in4, total_cycles);
    22d2:	87de                	mv	a5,s7
    22d4:	8762                	mv	a4,s8
    22d6:	86e6                	mv	a3,s9
    22d8:	866a                	mv	a2,s10
    22da:	85a2                	mv	a1,s0
    22dc:	0068                	addi	a0,sp,12
    22de:	cd0fe0ef          	jal	7ae <inferenceTPG>

        PRINTF("cycles_avg: %d, actionID; %d\n", *total_cycles, actionID);
    22e2:	4632                	lw	a2,12(sp)
    22e4:	000ba583          	lw	a1,0(s7)
    22e8:	6529                	lui	a0,0xa
    22ea:	5bc50513          	addi	a0,a0,1468 # a5bc <heap.cpp.7337fd52+0x434>
    22ee:	daaff0ef          	jal	1898 <iprintf>
    for (int seed = 0; seed < 5; ++seed) // NB_SEED
    22f2:	0491                	addi	s1,s1,4
    22f4:	0b11                	addi	s6,s6,4
    22f6:	0a91                	addi	s5,s5,4
    22f8:	0a11                	addi	s4,s4,4
    22fa:	0991                	addi	s3,s3,4
    22fc:	0911                	addi	s2,s2,4
    22fe:	f7b49de3          	bne	s1,s11,2278 <main+0x5a>
    }

    return 0;
}
    2302:	4501                	li	a0,0
    2304:	40b6                	lw	ra,76(sp)
    2306:	4426                	lw	s0,72(sp)
    2308:	4496                	lw	s1,68(sp)
    230a:	4906                	lw	s2,64(sp)
    230c:	59f2                	lw	s3,60(sp)
    230e:	5a62                	lw	s4,56(sp)
    2310:	5ad2                	lw	s5,52(sp)
    2312:	5b42                	lw	s6,48(sp)
    2314:	5bb2                	lw	s7,44(sp)
    2316:	5c22                	lw	s8,40(sp)
    2318:	5c92                	lw	s9,36(sp)
    231a:	5d02                	lw	s10,32(sp)
    231c:	4df2                	lw	s11,28(sp)
    231e:	6161                	addi	sp,sp,80
    2320:	8082                	ret
