
main.elf:     file format elf32-littleriscv


Disassembly of section .vectors:

00000000 <__vector_start>:

.section .vectors, "ax"
.option norvc
vector_table:
	//  0 : exception Handler and user software interrupt
	j handler_exception
   0:	5810106f          	j	1d80 <handler_exception>
	//  1 : supervisor software interrupt
	j __no_irq_handler
   4:	20c0006f          	j	210 <__no_irq_handler>
	//  2 : unmapped
	j __no_irq_handler
   8:	2080006f          	j	210 <__no_irq_handler>
	//  3 : machine software interrupt handler
	j handler_irq_software
   c:	66d0106f          	j	1e78 <handler_irq_software>
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
  1c:	6910106f          	j	1eac <handler_irq_timer>
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
  2c:	7050006f          	j	f30 <handler_irq_external>
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
  40:	1710006f          	j	9b0 <handler_irq_fast_timer_1>
	// 17 : fast interrupt - timer_2
	j handler_irq_fast_timer_2
  44:	1c50006f          	j	a08 <handler_irq_fast_timer_2>
	// 18 : fast interrupt - timer_3
	j handler_irq_fast_timer_3
  48:	2190006f          	j	a60 <handler_irq_fast_timer_3>
	// 19 : fast interrupt - dma_done
	j handler_irq_fast_dma_done
  4c:	26d0006f          	j	ab8 <handler_irq_fast_dma_done>
	// 20 : fast interrupt - spi
	j handler_irq_fast_spi
  50:	3710006f          	j	bc0 <handler_irq_fast_spi>
	// 21 : fast interrupt - spi_flash
	j handler_irq_fast_spi_flash
  54:	3c50006f          	j	c18 <handler_irq_fast_spi_flash>
	// 22 : fast interrupt - gpio_0
	j handler_irq_fast_gpio_0
  58:	4190006f          	j	c70 <handler_irq_fast_gpio_0>
	// 23 : fast interrupt - gpio_1
	j handler_irq_fast_gpio_1
  5c:	46d0006f          	j	cc8 <handler_irq_fast_gpio_1>
	// 24 : fast interrupt - gpio_2
	j handler_irq_fast_gpio_2
  60:	4c10006f          	j	d20 <handler_irq_fast_gpio_2>
	// 25 : fast interrupt - gpio_3
	j handler_irq_fast_gpio_3
  64:	5150006f          	j	d78 <handler_irq_fast_gpio_3>
	// 26 : fast interrupt - gpio_4
	j handler_irq_fast_gpio_4
  68:	5690006f          	j	dd0 <handler_irq_fast_gpio_4>
	// 27 : fast interrupt - gpio_5
	j handler_irq_fast_gpio_5
  6c:	5bd0006f          	j	e28 <handler_irq_fast_gpio_5>
	// 28 : fast interrupt - gpio_6
	j handler_irq_fast_gpio_6
  70:	6110006f          	j	e80 <handler_irq_fast_gpio_6>
	// 29 : fast interrupt - gpio_7
	j handler_irq_fast_gpio_7
  74:	6650006f          	j	ed8 <handler_irq_fast_gpio_7>
	// 30 : fast interrupt - dma_window
	j handler_irq_fast_dma_window
  78:	2990006f          	j	b10 <handler_irq_fast_dma_window>
	// 31 : fast interrupt - external peripheral
	j handler_irq_fast_external_peripheral
  7c:	2ed0006f          	j	b68 <handler_irq_fast_external_peripheral>

Disassembly of section .init:

00000180 <_start>:

_start:
/* initialize global pointer */
.option push
.option norelax
1: auipc gp, %pcrel_hi(__global_pointer$)
 180:	0000c197          	auipc	gp,0xc
   addi  gp, gp, %pcrel_lo(1b)
 184:	a1418193          	addi	gp,gp,-1516 # bb94 <__global_pointer$>
.option pop

/* initialize stack pointer */
   la sp, _sp
 188:	0000c117          	auipc	sp,0xc
 18c:	69810113          	addi	sp,sp,1688 # c820 <_sp>

/* set the frequency */
   li a0, SOC_CTRL_START_ADDRESS
 190:	20000537          	lui	a0,0x20000
   li a2, REFERENCE_CLOCK_Hz
 194:	05f5e637          	lui	a2,0x5f5e
 198:	10060613          	addi	a2,a2,256 # 5f5e100 <syscalls_cpp.cpp.cfa7c3ef+0x5f4a5aa>
   sw a2, SOC_CTRL_SYSTEM_FREQUENCY_HZ_REG_OFFSET(a0)
 19c:	cd50                	sw	a2,28(a0)

0000019e <_init_bss>:

#endif

/* clear the bss segment */
_init_bss:
    la     a0, __bss_start
 19e:	0000b517          	auipc	a0,0xb
 1a2:	32e50513          	addi	a0,a0,814 # b4cc <__stdio_exit_handler>
    la     a2, __bss_end
 1a6:	0000b617          	auipc	a2,0xb
 1aa:	67a60613          	addi	a2,a2,1658 # b820 <__BSS_END__>
    sub    a2, a2, a0
 1ae:	8e09                	sub	a2,a2,a0
    li     a1, 0
 1b0:	4581                	li	a1,0
    call   memset
 1b2:	1ad020ef          	jal	2b5e <memset>
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
 1c6:	00003517          	auipc	a0,0x3
 1ca:	96650513          	addi	a0,a0,-1690 # 2b2c <__libc_fini_array>
    call atexit
 1ce:	65e020ef          	jal	282c <atexit>
    call __libc_init_array
 1d2:	105020ef          	jal	2ad6 <__libc_init_array>

/* call main */
    lw a0, 0(sp)                    /* a0 = argc */
 1d6:	4502                	lw	a0,0(sp)
    addi a1, sp, __SIZEOF_POINTER__ /* a1 = argv */
 1d8:	004c                	addi	a1,sp,4
    li a2, 0                        /* a2 = envp = NULL */
 1da:	4601                	li	a2,0
    call main
 1dc:	0f1030ef          	jal	3acc <main>
    tail exit
 1e0:	00c0006f          	j	1ec <exit>

000001e4 <_init>:
.global _init
.type   _init, @function
.global _fini
.type   _fini, @function
_init:
    call init
 1e4:	577010ef          	jal	1f5a <init>

000001e8 <_fini>:
_fini:
 /* These don't have to do anything since we use init_array/fini_array. Prevent
    missing symbol error */
    ret
 1e8:	8082                	ret

Disassembly of section .text:

000001ec <exit>:
     1ec:	1141                	addi	sp,sp,-16
     1ee:	678d                	lui	a5,0x3
     1f0:	c422                	sw	s0,8(sp)
     1f2:	c606                	sw	ra,12(sp)
     1f4:	be278793          	addi	a5,a5,-1054 # 2be2 <__call_exitprocs>
     1f8:	842a                	mv	s0,a0
     1fa:	c781                	beqz	a5,202 <exit+0x16>
     1fc:	4581                	li	a1,0
     1fe:	1e5020ef          	jal	2be2 <__call_exitprocs>
     202:	9381a783          	lw	a5,-1736(gp) # b4cc <__stdio_exit_handler>
     206:	c391                	beqz	a5,20a <exit+0x1e>
     208:	9782                	jalr	a5
     20a:	8522                	mv	a0,s0
     20c:	595010ef          	jal	1fa0 <_exit>

00000210 <__no_irq_handler>:
	This will not print an error message in case of not finding
	the proper handler to manage an interrupt.
	la a0, no_exception_handler_msg
	jal ra, puts
	*/
	j __no_irq_handler
     210:	0000006f          	j	210 <__no_irq_handler>

00000214 <bestProgram>:
/* Number of inference iterations to check for variations */
#ifndef NB_MEASURE
#define NB_MEASURE 10
#endif

int bestProgram(fixedpt *results, int nb) {
     214:	7179                	addi	sp,sp,-48
     216:	d606                	sw	ra,44(sp)
     218:	d422                	sw	s0,40(sp)
     21a:	1800                	addi	s0,sp,48
     21c:	fca42e23          	sw	a0,-36(s0)
     220:	fcb42c23          	sw	a1,-40(s0)
	int bestProgram = 0;
     224:	fe042623          	sw	zero,-20(s0)
	fixedpt bestScore = results[0];
     228:	fdc42783          	lw	a5,-36(s0)
     22c:	439c                	lw	a5,0(a5)
     22e:	fef42423          	sw	a5,-24(s0)
	for (int i = 1; i < nb; i++) {
     232:	4785                	li	a5,1
     234:	fef42223          	sw	a5,-28(s0)
     238:	a82d                	j	272 <bestProgram+0x5e>
		fixedpt challengerScore = results[i];
     23a:	fe442783          	lw	a5,-28(s0)
     23e:	078a                	slli	a5,a5,0x2
     240:	fdc42703          	lw	a4,-36(s0)
     244:	97ba                	add	a5,a5,a4
     246:	439c                	lw	a5,0(a5)
     248:	fef42023          	sw	a5,-32(s0)
		if (challengerScore >= bestScore) {
     24c:	fe042703          	lw	a4,-32(s0)
     250:	fe842783          	lw	a5,-24(s0)
     254:	00f74a63          	blt	a4,a5,268 <bestProgram+0x54>
			bestProgram = i;
     258:	fe442783          	lw	a5,-28(s0)
     25c:	fef42623          	sw	a5,-20(s0)
			bestScore = challengerScore;
     260:	fe042783          	lw	a5,-32(s0)
     264:	fef42423          	sw	a5,-24(s0)
	for (int i = 1; i < nb; i++) {
     268:	fe442783          	lw	a5,-28(s0)
     26c:	0785                	addi	a5,a5,1
     26e:	fef42223          	sw	a5,-28(s0)
     272:	fe442703          	lw	a4,-28(s0)
     276:	fd842783          	lw	a5,-40(s0)
     27a:	fcf740e3          	blt	a4,a5,23a <bestProgram+0x26>
		}
	}
	return bestProgram;
     27e:	fec42783          	lw	a5,-20(s0)
}
     282:	853e                	mv	a0,a5
     284:	50b2                	lw	ra,44(sp)
     286:	5422                	lw	s0,40(sp)
     288:	6145                	addi	sp,sp,48
     28a:	8082                	ret

0000028c <T0_func>:
enum vertices T0_func(const fixedpt * restrict in1,
                      const fixedpt * restrict in2,
                      const fixedpt * restrict in3,
                      const fixedpt * restrict in4,
					  uint32_t * total_cycles)
{
     28c:	712d                	addi	sp,sp,-288
     28e:	10112e23          	sw	ra,284(sp)
     292:	10812c23          	sw	s0,280(sp)
     296:	1200                	addi	s0,sp,288
     298:	eea42e23          	sw	a0,-260(s0)
     29c:	eeb42c23          	sw	a1,-264(s0)
     2a0:	eec42a23          	sw	a2,-268(s0)
     2a4:	eed42823          	sw	a3,-272(s0)
     2a8:	eee42623          	sw	a4,-276(s0)

	/* Prepare CSR cycle counter */
    CSR_CLEAR_BITS(CSR_REG_MCOUNTINHIBIT, 0x1); // enable cycle counting
     2ac:	4785                	li	a5,1
     2ae:	3207b073          	csrc	mcountinhibit,a5

	/* reset MCYCLE */
	CSR_WRITE(CSR_REG_MCYCLE, 0);
     2b2:	4781                	li	a5,0
     2b4:	b0079073          	csrw	mcycle,a5
	//  /* run code NB_MEASURE times */
	// for (uint32_t j = 0; j < NB_MEASURE; ++j)
	// {
	// }

	const enum vertices next[6] = { A1, A2, A3, A4, A5, A6 };
     2b8:	67a9                	lui	a5,0xa
     2ba:	50078793          	addi	a5,a5,1280 # a500 <dma.c.e6d7bed9+0x7f3>
     2be:	4388                	lw	a0,0(a5)
     2c0:	43cc                	lw	a1,4(a5)
     2c2:	4790                	lw	a2,8(a5)
     2c4:	47d4                	lw	a3,12(a5)
     2c6:	4b98                	lw	a4,16(a5)
     2c8:	f4a42023          	sw	a0,-192(s0)
     2cc:	f4b42223          	sw	a1,-188(s0)
     2d0:	f4c42423          	sw	a2,-184(s0)
     2d4:	f4d42623          	sw	a3,-180(s0)
     2d8:	f4e42823          	sw	a4,-176(s0)
     2dc:	4bdc                	lw	a5,20(a5)
     2de:	f4f42a23          	sw	a5,-172(s0)
     2e2:	ef442783          	lw	a5,-268(s0)
     2e6:	f6f42623          	sw	a5,-148(s0)
     2ea:	efc42783          	lw	a5,-260(s0)
     2ee:	f6f42423          	sw	a5,-152(s0)
     2f2:	ef842783          	lw	a5,-264(s0)
     2f6:	f6f42223          	sw	a5,-156(s0)
     2fa:	ef042783          	lw	a5,-272(s0)
     2fe:	f6f42023          	sw	a5,-160(s0)

#include "externHeader.h"


inline __attribute__((always_inline)) fixedpt P0(const fixedpt * restrict in1, const fixedpt * restrict in2, const fixedpt * restrict in3, const fixedpt * restrict in4) {
	fixedpt reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
     302:	f0042423          	sw	zero,-248(s0)
     306:	f0042623          	sw	zero,-244(s0)
     30a:	f0042823          	sw	zero,-240(s0)
     30e:	f0042a23          	sw	zero,-236(s0)
     312:	f0042c23          	sw	zero,-232(s0)
     316:	f0042e23          	sw	zero,-228(s0)
     31a:	f2042023          	sw	zero,-224(s0)
     31e:	f2042223          	sw	zero,-220(s0)
	{
		fixedpt op0 = in3[1];
     322:	f6c42783          	lw	a5,-148(s0)
     326:	0791                	addi	a5,a5,4
     328:	439c                	lw	a5,0(a5)
     32a:	f4f42e23          	sw	a5,-164(s0)
		fixedpt op1 = in3[2];
     32e:	f6c42783          	lw	a5,-148(s0)
     332:	07a1                	addi	a5,a5,8
     334:	439c                	lw	a5,0(a5)
     336:	f4f42c23          	sw	a5,-168(s0)
		reg[0] = op0 + op1;
     33a:	f5c42703          	lw	a4,-164(s0)
     33e:	f5842783          	lw	a5,-168(s0)
     342:	97ba                	add	a5,a5,a4
     344:	f0f42423          	sw	a5,-248(s0)
	}
	// replace by empty program that returns 0
	return reg[0];
     348:	f0842783          	lw	a5,-248(s0)
	fixedpt scores[6];
	scores[0] = P0(in1, in2, in3, in4);
     34c:	f2f42423          	sw	a5,-216(s0)
     350:	ef842783          	lw	a5,-264(s0)
     354:	f8f42623          	sw	a5,-116(s0)
     358:	ef442783          	lw	a5,-268(s0)
     35c:	f8f42423          	sw	a5,-120(s0)
     360:	efc42783          	lw	a5,-260(s0)
     364:	f8f42223          	sw	a5,-124(s0)
     368:	ef042783          	lw	a5,-272(s0)
     36c:	f8f42023          	sw	a5,-128(s0)
}

inline __attribute__((always_inline)) fixedpt P1(const fixedpt * restrict in1, const fixedpt * restrict in2, const fixedpt * restrict in3, const fixedpt * restrict in4) {
	fixedpt reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
     370:	f0042423          	sw	zero,-248(s0)
     374:	f0042623          	sw	zero,-244(s0)
     378:	f0042823          	sw	zero,-240(s0)
     37c:	f0042a23          	sw	zero,-236(s0)
     380:	f0042c23          	sw	zero,-232(s0)
     384:	f0042e23          	sw	zero,-228(s0)
     388:	f2042023          	sw	zero,-224(s0)
     38c:	f2042223          	sw	zero,-220(s0)
	{
		fixedpt op0 = in3[2];
     390:	f8842783          	lw	a5,-120(s0)
     394:	07a1                	addi	a5,a5,8
     396:	439c                	lw	a5,0(a5)
     398:	f6f42e23          	sw	a5,-132(s0)
		fixedpt op1 = in3[2];
     39c:	f8842783          	lw	a5,-120(s0)
     3a0:	07a1                	addi	a5,a5,8
     3a2:	439c                	lw	a5,0(a5)
     3a4:	f6f42c23          	sw	a5,-136(s0)
		reg[1] = op0 + op1;
     3a8:	f7c42703          	lw	a4,-132(s0)
     3ac:	f7842783          	lw	a5,-136(s0)
     3b0:	97ba                	add	a5,a5,a4
     3b2:	f0f42623          	sw	a5,-244(s0)
	}
	{
		fixedpt op0 = in2[0];
     3b6:	f8c42783          	lw	a5,-116(s0)
     3ba:	439c                	lw	a5,0(a5)
     3bc:	f6f42a23          	sw	a5,-140(s0)
		fixedpt op1 = reg[1];
     3c0:	f0c42783          	lw	a5,-244(s0)
     3c4:	f6f42823          	sw	a5,-144(s0)
		reg[0] = op0 - op1;
     3c8:	f7442703          	lw	a4,-140(s0)
     3cc:	f7042783          	lw	a5,-144(s0)
     3d0:	40f707b3          	sub	a5,a4,a5
     3d4:	f0f42423          	sw	a5,-248(s0)
	}
	return reg[0];
     3d8:	f0842783          	lw	a5,-248(s0)
	scores[1] = P1(in1, in2, in3, in4);
     3dc:	f2f42623          	sw	a5,-212(s0)
     3e0:	ef442783          	lw	a5,-268(s0)
     3e4:	faf42223          	sw	a5,-92(s0)
     3e8:	efc42783          	lw	a5,-260(s0)
     3ec:	faf42023          	sw	a5,-96(s0)
     3f0:	ef842783          	lw	a5,-264(s0)
     3f4:	f8f42e23          	sw	a5,-100(s0)
     3f8:	ef042783          	lw	a5,-272(s0)
     3fc:	f8f42c23          	sw	a5,-104(s0)
}

inline __attribute__((always_inline)) fixedpt P2(const fixedpt * restrict in1, const fixedpt * restrict in2, const fixedpt * restrict in3, const fixedpt * restrict in4) {
	fixedpt reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
     400:	f0042423          	sw	zero,-248(s0)
     404:	f0042623          	sw	zero,-244(s0)
     408:	f0042823          	sw	zero,-240(s0)
     40c:	f0042a23          	sw	zero,-236(s0)
     410:	f0042c23          	sw	zero,-232(s0)
     414:	f0042e23          	sw	zero,-228(s0)
     418:	f2042023          	sw	zero,-224(s0)
     41c:	f2042223          	sw	zero,-220(s0)
	{
		fixedpt op0 = in3[1];
     420:	fa442783          	lw	a5,-92(s0)
     424:	0791                	addi	a5,a5,4
     426:	439c                	lw	a5,0(a5)
     428:	f8f42a23          	sw	a5,-108(s0)
		fixedpt op1 = in3[2];
     42c:	fa442783          	lw	a5,-92(s0)
     430:	07a1                	addi	a5,a5,8
     432:	439c                	lw	a5,0(a5)
     434:	f8f42823          	sw	a5,-112(s0)
		reg[0] = op0 - op1;
     438:	f9442703          	lw	a4,-108(s0)
     43c:	f9042783          	lw	a5,-112(s0)
     440:	40f707b3          	sub	a5,a4,a5
     444:	f0f42423          	sw	a5,-248(s0)
	}
	return reg[0];
     448:	f0842783          	lw	a5,-248(s0)
	scores[2] = P2(in1, in2, in3, in4);
     44c:	f2f42823          	sw	a5,-208(s0)
     450:	ef442783          	lw	a5,-268(s0)
     454:	faf42e23          	sw	a5,-68(s0)
     458:	efc42783          	lw	a5,-260(s0)
     45c:	faf42c23          	sw	a5,-72(s0)
     460:	ef842783          	lw	a5,-264(s0)
     464:	faf42a23          	sw	a5,-76(s0)
     468:	ef042783          	lw	a5,-272(s0)
     46c:	faf42823          	sw	a5,-80(s0)
}

inline __attribute__((always_inline)) fixedpt P3(const fixedpt * restrict in1, const fixedpt * restrict in2, const fixedpt * restrict in3, const fixedpt * restrict in4) {
	fixedpt reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
     470:	f0042423          	sw	zero,-248(s0)
     474:	f0042623          	sw	zero,-244(s0)
     478:	f0042823          	sw	zero,-240(s0)
     47c:	f0042a23          	sw	zero,-236(s0)
     480:	f0042c23          	sw	zero,-232(s0)
     484:	f0042e23          	sw	zero,-228(s0)
     488:	f2042023          	sw	zero,-224(s0)
     48c:	f2042223          	sw	zero,-220(s0)
	{
		fixedpt op0 = in3[1];
     490:	fbc42783          	lw	a5,-68(s0)
     494:	0791                	addi	a5,a5,4
     496:	439c                	lw	a5,0(a5)
     498:	faf42623          	sw	a5,-84(s0)
     49c:	fac42783          	lw	a5,-84(s0)
     4a0:	faf42423          	sw	a5,-88(s0)
  
//   return result;
// }

static inline __attribute__((always_inline)) fixedpt f_log2(fixedpt n) {
    if (n <= 0) {
     4a4:	fa842783          	lw	a5,-88(s0)
     4a8:	00f04463          	bgtz	a5,4b0 <T0_func+0x224>
        return 0; // Handle error for non-positive input
     4ac:	4781                	li	a5,0
     4ae:	a801                	j	4be <T0_func+0x232>
    }
    return 31 - __builtin_clz(n);
     4b0:	fa842783          	lw	a5,-88(s0)
     4b4:	60079793          	clz	a5,a5
     4b8:	477d                	li	a4,31
     4ba:	40f707b3          	sub	a5,a4,a5
		reg[0] = f_log2(op0);
     4be:	f0f42423          	sw	a5,-248(s0)
	}
	return reg[0];
     4c2:	f0842783          	lw	a5,-248(s0)
	scores[3] = P3(in1, in2, in3, in4);
     4c6:	f2f42a23          	sw	a5,-204(s0)
     4ca:	ef442783          	lw	a5,-268(s0)
     4ce:	fcf42a23          	sw	a5,-44(s0)
     4d2:	efc42783          	lw	a5,-260(s0)
     4d6:	fcf42823          	sw	a5,-48(s0)
     4da:	ef842783          	lw	a5,-264(s0)
     4de:	fcf42623          	sw	a5,-52(s0)
     4e2:	ef042783          	lw	a5,-272(s0)
     4e6:	fcf42423          	sw	a5,-56(s0)
}


inline __attribute__((always_inline)) fixedpt P4(const fixedpt * restrict in1, const fixedpt * restrict in2, const fixedpt * restrict in3, const fixedpt * restrict in4) {
	fixedpt reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
     4ea:	f0042423          	sw	zero,-248(s0)
     4ee:	f0042623          	sw	zero,-244(s0)
     4f2:	f0042823          	sw	zero,-240(s0)
     4f6:	f0042a23          	sw	zero,-236(s0)
     4fa:	f0042c23          	sw	zero,-232(s0)
     4fe:	f0042e23          	sw	zero,-228(s0)
     502:	f2042023          	sw	zero,-224(s0)
     506:	f2042223          	sw	zero,-220(s0)
	{
		fixedpt op0 = reg[4];
     50a:	f1842783          	lw	a5,-232(s0)
     50e:	fcf42223          	sw	a5,-60(s0)
		fixedpt op1 = in3[1];
     512:	fd442783          	lw	a5,-44(s0)
     516:	0791                	addi	a5,a5,4
     518:	439c                	lw	a5,0(a5)
     51a:	fcf42023          	sw	a5,-64(s0)
		reg[0] = (op0 > op1) ? op0 : op1;
     51e:	fc442703          	lw	a4,-60(s0)
     522:	fc042783          	lw	a5,-64(s0)
     526:	0af767b3          	max	a5,a4,a5
     52a:	f0f42423          	sw	a5,-248(s0)
	}
	return reg[0];
     52e:	f0842783          	lw	a5,-248(s0)
	scores[4] = P4(in1, in2, in3, in4);
     532:	f2f42c23          	sw	a5,-200(s0)
     536:	ef442783          	lw	a5,-268(s0)
     53a:	fef42623          	sw	a5,-20(s0)
     53e:	efc42783          	lw	a5,-260(s0)
     542:	fef42423          	sw	a5,-24(s0)
     546:	ef842783          	lw	a5,-264(s0)
     54a:	fef42223          	sw	a5,-28(s0)
     54e:	ef042783          	lw	a5,-272(s0)
     552:	fef42023          	sw	a5,-32(s0)
}

inline __attribute__((always_inline)) fixedpt P5(const fixedpt * restrict in1, const fixedpt * restrict in2, const fixedpt * restrict in3, const fixedpt * restrict in4) {
	fixedpt reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
     556:	f0042423          	sw	zero,-248(s0)
     55a:	f0042623          	sw	zero,-244(s0)
     55e:	f0042823          	sw	zero,-240(s0)
     562:	f0042a23          	sw	zero,-236(s0)
     566:	f0042c23          	sw	zero,-232(s0)
     56a:	f0042e23          	sw	zero,-228(s0)
     56e:	f2042023          	sw	zero,-224(s0)
     572:	f2042223          	sw	zero,-220(s0)
	{
		fixedpt op0 = in3[2];
     576:	fec42783          	lw	a5,-20(s0)
     57a:	07a1                	addi	a5,a5,8
     57c:	439c                	lw	a5,0(a5)
     57e:	fcf42e23          	sw	a5,-36(s0)
		fixedpt op1 = in3[1];
     582:	fec42783          	lw	a5,-20(s0)
     586:	0791                	addi	a5,a5,4
     588:	439c                	lw	a5,0(a5)
     58a:	fcf42c23          	sw	a5,-40(s0)
		reg[0] = op0 + op1;
     58e:	fdc42703          	lw	a4,-36(s0)
     592:	fd842783          	lw	a5,-40(s0)
     596:	97ba                	add	a5,a5,a4
     598:	f0f42423          	sw	a5,-248(s0)
	}
	return reg[0];
     59c:	f0842783          	lw	a5,-248(s0)
	scores[5] = P5(in1, in2, in3, in4);
     5a0:	f2f42e23          	sw	a5,-196(s0)

	 /* read cycles (64-bit if available in CSR_READ) */
	CSR_READ(CSR_REG_MCYCLE, total_cycles);
     5a4:	b0002773          	csrr	a4,mcycle
     5a8:	eec42783          	lw	a5,-276(s0)
     5ac:	c398                	sw	a4,0(a5)

	// each graph traversal/class is done NB_MEASURES times 
	// uint32_t cycles_avg = total_cycles / NB_MEASURE;

	return next[bestProgram(scores, 6)];
     5ae:	f2840793          	addi	a5,s0,-216
     5b2:	4599                	li	a1,6
     5b4:	853e                	mv	a0,a5
     5b6:	39b9                	jal	214 <bestProgram>
     5b8:	872a                	mv	a4,a0
     5ba:	f4040793          	addi	a5,s0,-192
     5be:	070a                	slli	a4,a4,0x2
     5c0:	97ba                	add	a5,a5,a4
     5c2:	439c                	lw	a5,0(a5)
}
     5c4:	853e                	mv	a0,a5
     5c6:	11c12083          	lw	ra,284(sp)
     5ca:	11812403          	lw	s0,280(sp)
     5ce:	6115                	addi	sp,sp,288
     5d0:	8082                	ret

000005d2 <inferenceTPG>:
                  const fixedpt * restrict in1,
                  const fixedpt * restrict in2,
                  const fixedpt * restrict in3,
                  const fixedpt * restrict in4,
				  uint32_t * total_cycles)
{
     5d2:	7139                	addi	sp,sp,-64
     5d4:	de06                	sw	ra,60(sp)
     5d6:	dc22                	sw	s0,56(sp)
     5d8:	0080                	addi	s0,sp,64
     5da:	fca42e23          	sw	a0,-36(s0)
     5de:	fcb42c23          	sw	a1,-40(s0)
     5e2:	fcc42a23          	sw	a2,-44(s0)
     5e6:	fcd42823          	sw	a3,-48(s0)
     5ea:	fce42623          	sw	a4,-52(s0)
     5ee:	fcf42423          	sw	a5,-56(s0)
	enum vertices currentVertex = T0;
     5f2:	fe042623          	sw	zero,-20(s0)

	while (1) {
		switch (currentVertex) {
     5f6:	fec42703          	lw	a4,-20(s0)
     5fa:	4799                	li	a5,6
     5fc:	0af70f63          	beq	a4,a5,6ba <inferenceTPG+0xe8>
     600:	fec42703          	lw	a4,-20(s0)
     604:	4799                	li	a5,6
     606:	fee7e8e3          	bltu	a5,a4,5f6 <inferenceTPG+0x24>
     60a:	fec42703          	lw	a4,-20(s0)
     60e:	4795                	li	a5,5
     610:	0af70063          	beq	a4,a5,6b0 <inferenceTPG+0xde>
     614:	fec42703          	lw	a4,-20(s0)
     618:	4795                	li	a5,5
     61a:	fce7eee3          	bltu	a5,a4,5f6 <inferenceTPG+0x24>
     61e:	fec42703          	lw	a4,-20(s0)
     622:	4791                	li	a5,4
     624:	08f70163          	beq	a4,a5,6a6 <inferenceTPG+0xd4>
     628:	fec42703          	lw	a4,-20(s0)
     62c:	4791                	li	a5,4
     62e:	fce7e4e3          	bltu	a5,a4,5f6 <inferenceTPG+0x24>
     632:	fec42703          	lw	a4,-20(s0)
     636:	478d                	li	a5,3
     638:	06f70263          	beq	a4,a5,69c <inferenceTPG+0xca>
     63c:	fec42703          	lw	a4,-20(s0)
     640:	478d                	li	a5,3
     642:	fae7eae3          	bltu	a5,a4,5f6 <inferenceTPG+0x24>
     646:	fec42703          	lw	a4,-20(s0)
     64a:	4789                	li	a5,2
     64c:	04f70363          	beq	a4,a5,692 <inferenceTPG+0xc0>
     650:	fec42703          	lw	a4,-20(s0)
     654:	4789                	li	a5,2
     656:	fae7e0e3          	bltu	a5,a4,5f6 <inferenceTPG+0x24>
     65a:	fec42783          	lw	a5,-20(s0)
     65e:	c799                	beqz	a5,66c <inferenceTPG+0x9a>
     660:	fec42703          	lw	a4,-20(s0)
     664:	4785                	li	a5,1
     666:	02f70163          	beq	a4,a5,688 <inferenceTPG+0xb6>
     66a:	b771                	j	5f6 <inferenceTPG+0x24>
			case T0:  currentVertex = T0_func(in1, in2, in3, in4, total_cycles); break;
     66c:	fc842703          	lw	a4,-56(s0)
     670:	fcc42683          	lw	a3,-52(s0)
     674:	fd042603          	lw	a2,-48(s0)
     678:	fd442583          	lw	a1,-44(s0)
     67c:	fd842503          	lw	a0,-40(s0)
     680:	3131                	jal	28c <T0_func>
     682:	fea42623          	sw	a0,-20(s0)
     686:	a83d                	j	6c4 <inferenceTPG+0xf2>
			case A1: actions[0] = 1; return;
     688:	fdc42783          	lw	a5,-36(s0)
     68c:	4705                	li	a4,1
     68e:	c398                	sw	a4,0(a5)
     690:	a81d                	j	6c6 <inferenceTPG+0xf4>
			case A2: actions[0] = 2; return;
     692:	fdc42783          	lw	a5,-36(s0)
     696:	4709                	li	a4,2
     698:	c398                	sw	a4,0(a5)
     69a:	a035                	j	6c6 <inferenceTPG+0xf4>
			case A3: actions[0] = 3; return;	
     69c:	fdc42783          	lw	a5,-36(s0)
     6a0:	470d                	li	a4,3
     6a2:	c398                	sw	a4,0(a5)
     6a4:	a00d                	j	6c6 <inferenceTPG+0xf4>
			case A4: actions[0] = 4; return;
     6a6:	fdc42783          	lw	a5,-36(s0)
     6aa:	4711                	li	a4,4
     6ac:	c398                	sw	a4,0(a5)
     6ae:	a821                	j	6c6 <inferenceTPG+0xf4>
			case A5: actions[0] = 5; return;
     6b0:	fdc42783          	lw	a5,-36(s0)
     6b4:	4715                	li	a4,5
     6b6:	c398                	sw	a4,0(a5)
     6b8:	a039                	j	6c6 <inferenceTPG+0xf4>
			case A6: actions[0] = 6; return;
     6ba:	fdc42783          	lw	a5,-36(s0)
     6be:	4719                	li	a4,6
     6c0:	c398                	sw	a4,0(a5)
     6c2:	a011                	j	6c6 <inferenceTPG+0xf4>
		switch (currentVertex) {
     6c4:	bf0d                	j	5f6 <inferenceTPG+0x24>
		}
	}
     6c6:	50f2                	lw	ra,60(sp)
     6c8:	5462                	lw	s0,56(sp)
     6ca:	6121                	addi	sp,sp,64
     6cc:	8082                	ret

000006ce <fic_irq_dma_window>:
/*                           EXPORTED FUNCTIONS                             */
/**                                                                        **/
/****************************************************************************/

void fic_irq_dma_window(void)
{
     6ce:	1101                	addi	sp,sp,-32
     6d0:	ce06                	sw	ra,28(sp)
     6d2:	cc22                	sw	s0,24(sp)
     6d4:	1000                	addi	s0,sp,32
     * Find out which channel raised the interrupt and call
     * either the weak implementation provided in this module,
     * or the non-weak implementation.
     */

    for (int i = 0; i < DMA_CH_NUM; i++)
     6d6:	fe042623          	sw	zero,-20(s0)
     6da:	a815                	j	70e <fic_irq_dma_window+0x40>
    {
        if (dma_subsys_per[i].peri->WINDOW_IFR == 1)
     6dc:	95c18693          	addi	a3,gp,-1700 # b4f0 <dma_subsys_per>
     6e0:	fec42703          	lw	a4,-20(s0)
     6e4:	87ba                	mv	a5,a4
     6e6:	0786                	slli	a5,a5,0x1
     6e8:	97ba                	add	a5,a5,a4
     6ea:	078a                	slli	a5,a5,0x2
     6ec:	97b6                	add	a5,a5,a3
     6ee:	479c                	lw	a5,8(a5)
     6f0:	57b8                	lw	a4,104(a5)
     6f2:	4785                	li	a5,1
     6f4:	00f71863          	bne	a4,a5,704 <fic_irq_dma_window+0x36>
        {
            dma_intr_handler_window_done(i);
     6f8:	fec42783          	lw	a5,-20(s0)
     6fc:	0ff7f793          	zext.b	a5,a5
     700:	853e                	mv	a0,a5
     702:	2055                	jal	7a6 <dma_intr_handler_window_done>
    for (int i = 0; i < DMA_CH_NUM; i++)
     704:	fec42783          	lw	a5,-20(s0)
     708:	0785                	addi	a5,a5,1
     70a:	fef42623          	sw	a5,-20(s0)
     70e:	fec42703          	lw	a4,-20(s0)
     712:	478d                	li	a5,3
     714:	fce7d4e3          	bge	a5,a4,6dc <fic_irq_dma_window+0xe>
            #endif

            #endif
        }
    }
    return;
     718:	0001                	nop
}
     71a:	40f2                	lw	ra,28(sp)
     71c:	4462                	lw	s0,24(sp)
     71e:	6105                	addi	sp,sp,32
     720:	8082                	ret

00000722 <fic_irq_dma_done>:

void fic_irq_dma_done(void)
{
     722:	1101                	addi	sp,sp,-32
     724:	ce06                	sw	ra,28(sp)
     726:	cc22                	sw	s0,24(sp)
     728:	1000                	addi	s0,sp,32
     * Find out which channel raised the interrupt and call
     * either the weak implementation provided in this module,
     * or the non-weak implementation.
     */
    
    for (int i = 0; i < DMA_CH_NUM; i++)
     72a:	fe042623          	sw	zero,-20(s0)
     72e:	a0b1                	j	77a <fic_irq_dma_done+0x58>
    {
        if (dma_subsys_per[i].peri->TRANSACTION_IFR == 1)
     730:	95c18693          	addi	a3,gp,-1700 # b4f0 <dma_subsys_per>
     734:	fec42703          	lw	a4,-20(s0)
     738:	87ba                	mv	a5,a4
     73a:	0786                	slli	a5,a5,0x1
     73c:	97ba                	add	a5,a5,a4
     73e:	078a                	slli	a5,a5,0x2
     740:	97b6                	add	a5,a5,a3
     742:	479c                	lw	a5,8(a5)
     744:	53f8                	lw	a4,100(a5)
     746:	4785                	li	a5,1
     748:	02f71463          	bne	a4,a5,770 <fic_irq_dma_done+0x4e>
        {
            dma_subsys_per[i].intrFlag = 1;
     74c:	95c18693          	addi	a3,gp,-1700 # b4f0 <dma_subsys_per>
     750:	fec42703          	lw	a4,-20(s0)
     754:	87ba                	mv	a5,a4
     756:	0786                	slli	a5,a5,0x1
     758:	97ba                	add	a5,a5,a4
     75a:	078a                	slli	a5,a5,0x2
     75c:	97b6                	add	a5,a5,a3
     75e:	4705                	li	a4,1
     760:	00e78223          	sb	a4,4(a5)
            dma_intr_handler_trans_done(i);
     764:	fec42783          	lw	a5,-20(s0)
     768:	0ff7f793          	zext.b	a5,a5
     76c:	853e                	mv	a0,a5
     76e:	2005                	jal	78e <dma_intr_handler_trans_done>
    for (int i = 0; i < DMA_CH_NUM; i++)
     770:	fec42783          	lw	a5,-20(s0)
     774:	0785                	addi	a5,a5,1
     776:	fef42623          	sw	a5,-20(s0)
     77a:	fec42703          	lw	a4,-20(s0)
     77e:	478d                	li	a5,3
     780:	fae7d8e3          	bge	a5,a4,730 <fic_irq_dma_done+0xe>
            #endif

            #endif
        }
    }
    return;
     784:	0001                	nop
}
     786:	40f2                	lw	ra,28(sp)
     788:	4462                	lw	s0,24(sp)
     78a:	6105                	addi	sp,sp,32
     78c:	8082                	ret

0000078e <dma_intr_handler_trans_done>:
    dma_subsys_per[channel].peri->MODE = DMA_TRANS_MODE_SINGLE;
}


__attribute__((weak, optimize("O0"))) void dma_intr_handler_trans_done(uint8_t channel)
{
     78e:	1101                	addi	sp,sp,-32
     790:	ce06                	sw	ra,28(sp)
     792:	cc22                	sw	s0,24(sp)
     794:	1000                	addi	s0,sp,32
     796:	87aa                	mv	a5,a0
     798:	fef407a3          	sb	a5,-17(s0)
     * This is a weak implementation.
     * Create your own function called
     * void dma_intr_handler_trans_done()
     * to override this one.
     */
}
     79c:	0001                	nop
     79e:	40f2                	lw	ra,28(sp)
     7a0:	4462                	lw	s0,24(sp)
     7a2:	6105                	addi	sp,sp,32
     7a4:	8082                	ret

000007a6 <dma_intr_handler_window_done>:

__attribute__((weak, optimize("O0"))) void dma_intr_handler_window_done(uint8_t channel)
{
     7a6:	1101                	addi	sp,sp,-32
     7a8:	ce06                	sw	ra,28(sp)
     7aa:	cc22                	sw	s0,24(sp)
     7ac:	1000                	addi	s0,sp,32
     7ae:	87aa                	mv	a5,a0
     7b0:	fef407a3          	sb	a5,-17(s0)
     * This is a weak implementation.
     * Create your own function called
     * void dma_intr_handler_window_done()
     * to override this one.
     */
}
     7b4:	0001                	nop
     7b6:	40f2                	lw	ra,28(sp)
     7b8:	4462                	lw	s0,24(sp)
     7ba:	6105                	addi	sp,sp,32
     7bc:	8082                	ret

000007be <bitfield_field32_write.lto_priv.0>:
 * @return `bitfield` with `field` set to `value`.
 */
BITFIELD_WARN_UNUSED_RESULT
static inline uint32_t bitfield_field32_write(uint32_t bitfield,
                                       bitfield_field32_t field,
                                       uint32_t value) {
     7be:	1101                	addi	sp,sp,-32
     7c0:	ce06                	sw	ra,28(sp)
     7c2:	cc22                	sw	s0,24(sp)
     7c4:	1000                	addi	s0,sp,32
     7c6:	fea42623          	sw	a0,-20(s0)
     7ca:	feb42223          	sw	a1,-28(s0)
     7ce:	fec42423          	sw	a2,-24(s0)
     7d2:	fed42023          	sw	a3,-32(s0)
  bitfield &= ~(field.mask << field.index);
     7d6:	fe442703          	lw	a4,-28(s0)
     7da:	fe842783          	lw	a5,-24(s0)
     7de:	00f717b3          	sll	a5,a4,a5
     7e2:	fff7c793          	not	a5,a5
     7e6:	fec42703          	lw	a4,-20(s0)
     7ea:	8ff9                	and	a5,a5,a4
     7ec:	fef42623          	sw	a5,-20(s0)
  bitfield |= (value & field.mask) << field.index;
     7f0:	fe442703          	lw	a4,-28(s0)
     7f4:	fe042783          	lw	a5,-32(s0)
     7f8:	8f7d                	and	a4,a4,a5
     7fa:	fe842783          	lw	a5,-24(s0)
     7fe:	00f717b3          	sll	a5,a4,a5
     802:	fec42703          	lw	a4,-20(s0)
     806:	8fd9                	or	a5,a5,a4
     808:	fef42623          	sw	a5,-20(s0)
  return bitfield;
     80c:	fec42783          	lw	a5,-20(s0)
}
     810:	853e                	mv	a0,a5
     812:	40f2                	lw	ra,28(sp)
     814:	4462                	lw	s0,24(sp)
     816:	6105                	addi	sp,sp,32
     818:	8082                	ret

0000081a <bitfield_bit32_to_field32.lto_priv.0>:
 * @param bit_index The corresponding single bit to turn into a field.
 * @return A 1-bit field that corresponds to `bit_index`.
 */
BITFIELD_WARN_UNUSED_RESULT
static inline bitfield_field32_t bitfield_bit32_to_field32(
    bitfield_bit32_index_t bit_index) {
     81a:	7179                	addi	sp,sp,-48
     81c:	d606                	sw	ra,44(sp)
     81e:	d422                	sw	s0,40(sp)
     820:	1800                	addi	s0,sp,48
     822:	fca42e23          	sw	a0,-36(s0)
  return (bitfield_field32_t){
     826:	4785                	li	a5,1
     828:	fef42423          	sw	a5,-24(s0)
     82c:	fdc42783          	lw	a5,-36(s0)
     830:	fef42623          	sw	a5,-20(s0)
     834:	fe842703          	lw	a4,-24(s0)
     838:	fec42783          	lw	a5,-20(s0)
     83c:	863a                	mv	a2,a4
     83e:	86be                	mv	a3,a5
     840:	8732                	mv	a4,a2
     842:	87b6                	mv	a5,a3
      .mask = 0x1, .index = bit_index,
  };
}
     844:	853a                	mv	a0,a4
     846:	85be                	mv	a1,a5
     848:	50b2                	lw	ra,44(sp)
     84a:	5422                	lw	s0,40(sp)
     84c:	6145                	addi	sp,sp,48
     84e:	8082                	ret

00000850 <bitfield_bit32_write.lto_priv.0>:
 * @return `bitfield` with the `bit_index`th bit set to `value`.
 */
BITFIELD_WARN_UNUSED_RESULT
static inline uint32_t bitfield_bit32_write(uint32_t bitfield,
                                     bitfield_bit32_index_t bit_index,
                                     bool value) {
     850:	7179                	addi	sp,sp,-48
     852:	d606                	sw	ra,44(sp)
     854:	d422                	sw	s0,40(sp)
     856:	1800                	addi	s0,sp,48
     858:	fca42e23          	sw	a0,-36(s0)
     85c:	fcb42c23          	sw	a1,-40(s0)
     860:	87b2                	mv	a5,a2
     862:	fcf40ba3          	sb	a5,-41(s0)
  return bitfield_field32_write(bitfield, bitfield_bit32_to_field32(bit_index),
     866:	fd842503          	lw	a0,-40(s0)
     86a:	3f45                	jal	81a <bitfield_bit32_to_field32.lto_priv.0>
     86c:	872a                	mv	a4,a0
     86e:	87ae                	mv	a5,a1
     870:	fee42423          	sw	a4,-24(s0)
     874:	fef42623          	sw	a5,-20(s0)
     878:	fd744783          	lbu	a5,-41(s0)
     87c:	c399                	beqz	a5,882 <bitfield_bit32_write.lto_priv.0+0x32>
     87e:	4785                	li	a5,1
     880:	a011                	j	884 <bitfield_bit32_write.lto_priv.0+0x34>
     882:	4781                	li	a5,0
     884:	86be                	mv	a3,a5
     886:	fe842583          	lw	a1,-24(s0)
     88a:	fec42603          	lw	a2,-20(s0)
     88e:	fdc42503          	lw	a0,-36(s0)
     892:	3735                	jal	7be <bitfield_field32_write.lto_priv.0>
     894:	87aa                	mv	a5,a0
                                value ? 0x1u : 0x0u);
}
     896:	853e                	mv	a0,a5
     898:	50b2                	lw	ra,44(sp)
     89a:	5422                	lw	s0,40(sp)
     89c:	6145                	addi	sp,sp,48
     89e:	8082                	ret

000008a0 <clear_fast_interrupt>:
}


fast_intr_ctrl_result_t clear_fast_interrupt(fast_intr_ctrl_fast_interrupt_t\
 fast_interrupt)
{
     8a0:	7179                	addi	sp,sp,-48
     8a2:	d606                	sw	ra,44(sp)
     8a4:	d422                	sw	s0,40(sp)
     8a6:	1800                	addi	s0,sp,48
     8a8:	fca42e23          	sw	a0,-36(s0)
    /* masking a 32b go write in reg*/
    uint32_t reg = 0;
     8ac:	fe042623          	sw	zero,-20(s0)
    reg = bitfield_bit32_write(reg, fast_interrupt, true);
     8b0:	4605                	li	a2,1
     8b2:	fdc42583          	lw	a1,-36(s0)
     8b6:	fec42503          	lw	a0,-20(s0)
     8ba:	3f59                	jal	850 <bitfield_bit32_write.lto_priv.0>
     8bc:	fea42623          	sw	a0,-20(s0)
    /* write in reg through structure */
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     8c0:	200607b7          	lui	a5,0x20060
     8c4:	fec42703          	lw	a4,-20(s0)
     8c8:	c3d8                	sw	a4,4(a5)
    return kFastIntrCtrlOk_e;
     8ca:	4781                	li	a5,0
}
     8cc:	853e                	mv	a0,a5
     8ce:	50b2                	lw	ra,44(sp)
     8d0:	5422                	lw	s0,40(sp)
     8d2:	6145                	addi	sp,sp,48
     8d4:	8082                	ret

000008d6 <fic_irq_timer_1>:

__attribute__((weak, optimize("O0"))) void fic_irq_timer_1(void)
{
     8d6:	1141                	addi	sp,sp,-16
     8d8:	c606                	sw	ra,12(sp)
     8da:	c422                	sw	s0,8(sp)
     8dc:	0800                	addi	s0,sp,16
    /* Users should implement their non-weak version */
}
     8de:	0001                	nop
     8e0:	40b2                	lw	ra,12(sp)
     8e2:	4422                	lw	s0,8(sp)
     8e4:	0141                	addi	sp,sp,16
     8e6:	8082                	ret

000008e8 <fic_irq_timer_2>:

__attribute__((weak, optimize("O0"))) void fic_irq_timer_2(void)
{
     8e8:	1141                	addi	sp,sp,-16
     8ea:	c606                	sw	ra,12(sp)
     8ec:	c422                	sw	s0,8(sp)
     8ee:	0800                	addi	s0,sp,16
    /* Users should implement their non-weak version */
}
     8f0:	0001                	nop
     8f2:	40b2                	lw	ra,12(sp)
     8f4:	4422                	lw	s0,8(sp)
     8f6:	0141                	addi	sp,sp,16
     8f8:	8082                	ret

000008fa <fic_irq_timer_3>:

__attribute__((weak, optimize("O0"))) void fic_irq_timer_3(void)
{
     8fa:	1141                	addi	sp,sp,-16
     8fc:	c606                	sw	ra,12(sp)
     8fe:	c422                	sw	s0,8(sp)
     900:	0800                	addi	s0,sp,16
    /* Users should implement their non-weak version */
}
     902:	0001                	nop
     904:	40b2                	lw	ra,12(sp)
     906:	4422                	lw	s0,8(sp)
     908:	0141                	addi	sp,sp,16
     90a:	8082                	ret

0000090c <fic_irq_ext_peripheral>:
{
    /* Users should implement their non-weak version */
}

__attribute__((weak, optimize("O0"))) void fic_irq_ext_peripheral(void)
{
     90c:	1141                	addi	sp,sp,-16
     90e:	c606                	sw	ra,12(sp)
     910:	c422                	sw	s0,8(sp)
     912:	0800                	addi	s0,sp,16
    /* Users should implement their non-weak version */
}
     914:	0001                	nop
     916:	40b2                	lw	ra,12(sp)
     918:	4422                	lw	s0,8(sp)
     91a:	0141                	addi	sp,sp,16
     91c:	8082                	ret

0000091e <fic_irq_gpio_0>:
{
    /* Users should implement their non-weak version */
}

__attribute__((weak, optimize("O0"))) void fic_irq_gpio_0(void)
{
     91e:	1141                	addi	sp,sp,-16
     920:	c606                	sw	ra,12(sp)
     922:	c422                	sw	s0,8(sp)
     924:	0800                	addi	s0,sp,16
    /* Users should implement their non-weak version */
}
     926:	0001                	nop
     928:	40b2                	lw	ra,12(sp)
     92a:	4422                	lw	s0,8(sp)
     92c:	0141                	addi	sp,sp,16
     92e:	8082                	ret

00000930 <fic_irq_gpio_1>:

__attribute__((weak, optimize("O0"))) void fic_irq_gpio_1(void)
{
     930:	1141                	addi	sp,sp,-16
     932:	c606                	sw	ra,12(sp)
     934:	c422                	sw	s0,8(sp)
     936:	0800                	addi	s0,sp,16
    /* Users should implement their non-weak version */
}
     938:	0001                	nop
     93a:	40b2                	lw	ra,12(sp)
     93c:	4422                	lw	s0,8(sp)
     93e:	0141                	addi	sp,sp,16
     940:	8082                	ret

00000942 <fic_irq_gpio_2>:

__attribute__((weak, optimize("O0"))) void fic_irq_gpio_2(void)
{
     942:	1141                	addi	sp,sp,-16
     944:	c606                	sw	ra,12(sp)
     946:	c422                	sw	s0,8(sp)
     948:	0800                	addi	s0,sp,16
    /* Users should implement their non-weak version */
}
     94a:	0001                	nop
     94c:	40b2                	lw	ra,12(sp)
     94e:	4422                	lw	s0,8(sp)
     950:	0141                	addi	sp,sp,16
     952:	8082                	ret

00000954 <fic_irq_gpio_3>:

__attribute__((weak, optimize("O0"))) void fic_irq_gpio_3(void)
{
     954:	1141                	addi	sp,sp,-16
     956:	c606                	sw	ra,12(sp)
     958:	c422                	sw	s0,8(sp)
     95a:	0800                	addi	s0,sp,16
    /* Users should implement their non-weak version */
}
     95c:	0001                	nop
     95e:	40b2                	lw	ra,12(sp)
     960:	4422                	lw	s0,8(sp)
     962:	0141                	addi	sp,sp,16
     964:	8082                	ret

00000966 <fic_irq_gpio_4>:

__attribute__((weak, optimize("O0"))) void fic_irq_gpio_4(void)
{
     966:	1141                	addi	sp,sp,-16
     968:	c606                	sw	ra,12(sp)
     96a:	c422                	sw	s0,8(sp)
     96c:	0800                	addi	s0,sp,16
    /* Users should implement their non-weak version */
}
     96e:	0001                	nop
     970:	40b2                	lw	ra,12(sp)
     972:	4422                	lw	s0,8(sp)
     974:	0141                	addi	sp,sp,16
     976:	8082                	ret

00000978 <fic_irq_gpio_5>:

__attribute__((weak, optimize("O0"))) void fic_irq_gpio_5(void)
{
     978:	1141                	addi	sp,sp,-16
     97a:	c606                	sw	ra,12(sp)
     97c:	c422                	sw	s0,8(sp)
     97e:	0800                	addi	s0,sp,16
    /* Users should implement their non-weak version */
}
     980:	0001                	nop
     982:	40b2                	lw	ra,12(sp)
     984:	4422                	lw	s0,8(sp)
     986:	0141                	addi	sp,sp,16
     988:	8082                	ret

0000098a <fic_irq_gpio_6>:

__attribute__((weak, optimize("O0"))) void fic_irq_gpio_6(void)
{
     98a:	1141                	addi	sp,sp,-16
     98c:	c606                	sw	ra,12(sp)
     98e:	c422                	sw	s0,8(sp)
     990:	0800                	addi	s0,sp,16
    /* Users should implement their non-weak version */
}
     992:	0001                	nop
     994:	40b2                	lw	ra,12(sp)
     996:	4422                	lw	s0,8(sp)
     998:	0141                	addi	sp,sp,16
     99a:	8082                	ret

0000099c <fic_irq_gpio_7>:

__attribute__((weak, optimize("O0"))) void fic_irq_gpio_7(void)
{
     99c:	1141                	addi	sp,sp,-16
     99e:	c606                	sw	ra,12(sp)
     9a0:	c422                	sw	s0,8(sp)
     9a2:	0800                	addi	s0,sp,16
    /* Users should implement their non-weak version */
}
     9a4:	0001                	nop
     9a6:	40b2                	lw	ra,12(sp)
     9a8:	4422                	lw	s0,8(sp)
     9aa:	0141                	addi	sp,sp,16
     9ac:	8082                	ret
	...

000009b0 <handler_irq_fast_timer_1>:
/*                            LOCAL FUNCTIONS                               */
/**                                                                        **/
/****************************************************************************/

void handler_irq_fast_timer_1(void)
{
     9b0:	715d                	addi	sp,sp,-80
     9b2:	c686                	sw	ra,76(sp)
     9b4:	c496                	sw	t0,72(sp)
     9b6:	c29a                	sw	t1,68(sp)
     9b8:	c09e                	sw	t2,64(sp)
     9ba:	de22                	sw	s0,60(sp)
     9bc:	dc2a                	sw	a0,56(sp)
     9be:	da2e                	sw	a1,52(sp)
     9c0:	d832                	sw	a2,48(sp)
     9c2:	d636                	sw	a3,44(sp)
     9c4:	d43a                	sw	a4,40(sp)
     9c6:	d23e                	sw	a5,36(sp)
     9c8:	d042                	sw	a6,32(sp)
     9ca:	ce46                	sw	a7,28(sp)
     9cc:	cc72                	sw	t3,24(sp)
     9ce:	ca76                	sw	t4,20(sp)
     9d0:	c87a                	sw	t5,16(sp)
     9d2:	c67e                	sw	t6,12(sp)
     9d4:	0880                	addi	s0,sp,80
    // The interrupt is cleared.
    clear_fast_interrupt(kTimer_1_fic_e);
     9d6:	4501                	li	a0,0
     9d8:	35e1                	jal	8a0 <clear_fast_interrupt>
    // call the weak fic handler
    fic_irq_timer_1();
     9da:	3df5                	jal	8d6 <fic_irq_timer_1>
}
     9dc:	0001                	nop
     9de:	40b6                	lw	ra,76(sp)
     9e0:	42a6                	lw	t0,72(sp)
     9e2:	4316                	lw	t1,68(sp)
     9e4:	4386                	lw	t2,64(sp)
     9e6:	5472                	lw	s0,60(sp)
     9e8:	5562                	lw	a0,56(sp)
     9ea:	55d2                	lw	a1,52(sp)
     9ec:	5642                	lw	a2,48(sp)
     9ee:	56b2                	lw	a3,44(sp)
     9f0:	5722                	lw	a4,40(sp)
     9f2:	5792                	lw	a5,36(sp)
     9f4:	5802                	lw	a6,32(sp)
     9f6:	48f2                	lw	a7,28(sp)
     9f8:	4e62                	lw	t3,24(sp)
     9fa:	4ed2                	lw	t4,20(sp)
     9fc:	4f42                	lw	t5,16(sp)
     9fe:	4fb2                	lw	t6,12(sp)
     a00:	6161                	addi	sp,sp,80
     a02:	30200073          	mret
	...

00000a08 <handler_irq_fast_timer_2>:

void handler_irq_fast_timer_2(void)
{
     a08:	715d                	addi	sp,sp,-80
     a0a:	c686                	sw	ra,76(sp)
     a0c:	c496                	sw	t0,72(sp)
     a0e:	c29a                	sw	t1,68(sp)
     a10:	c09e                	sw	t2,64(sp)
     a12:	de22                	sw	s0,60(sp)
     a14:	dc2a                	sw	a0,56(sp)
     a16:	da2e                	sw	a1,52(sp)
     a18:	d832                	sw	a2,48(sp)
     a1a:	d636                	sw	a3,44(sp)
     a1c:	d43a                	sw	a4,40(sp)
     a1e:	d23e                	sw	a5,36(sp)
     a20:	d042                	sw	a6,32(sp)
     a22:	ce46                	sw	a7,28(sp)
     a24:	cc72                	sw	t3,24(sp)
     a26:	ca76                	sw	t4,20(sp)
     a28:	c87a                	sw	t5,16(sp)
     a2a:	c67e                	sw	t6,12(sp)
     a2c:	0880                	addi	s0,sp,80
    // The interrupt is cleared.
    clear_fast_interrupt(kTimer_2_fic_e);
     a2e:	4505                	li	a0,1
     a30:	3d85                	jal	8a0 <clear_fast_interrupt>
    // call the weak fic handler
    fic_irq_timer_2();
     a32:	3d5d                	jal	8e8 <fic_irq_timer_2>
}
     a34:	0001                	nop
     a36:	40b6                	lw	ra,76(sp)
     a38:	42a6                	lw	t0,72(sp)
     a3a:	4316                	lw	t1,68(sp)
     a3c:	4386                	lw	t2,64(sp)
     a3e:	5472                	lw	s0,60(sp)
     a40:	5562                	lw	a0,56(sp)
     a42:	55d2                	lw	a1,52(sp)
     a44:	5642                	lw	a2,48(sp)
     a46:	56b2                	lw	a3,44(sp)
     a48:	5722                	lw	a4,40(sp)
     a4a:	5792                	lw	a5,36(sp)
     a4c:	5802                	lw	a6,32(sp)
     a4e:	48f2                	lw	a7,28(sp)
     a50:	4e62                	lw	t3,24(sp)
     a52:	4ed2                	lw	t4,20(sp)
     a54:	4f42                	lw	t5,16(sp)
     a56:	4fb2                	lw	t6,12(sp)
     a58:	6161                	addi	sp,sp,80
     a5a:	30200073          	mret
	...

00000a60 <handler_irq_fast_timer_3>:

void handler_irq_fast_timer_3(void)
{
     a60:	715d                	addi	sp,sp,-80
     a62:	c686                	sw	ra,76(sp)
     a64:	c496                	sw	t0,72(sp)
     a66:	c29a                	sw	t1,68(sp)
     a68:	c09e                	sw	t2,64(sp)
     a6a:	de22                	sw	s0,60(sp)
     a6c:	dc2a                	sw	a0,56(sp)
     a6e:	da2e                	sw	a1,52(sp)
     a70:	d832                	sw	a2,48(sp)
     a72:	d636                	sw	a3,44(sp)
     a74:	d43a                	sw	a4,40(sp)
     a76:	d23e                	sw	a5,36(sp)
     a78:	d042                	sw	a6,32(sp)
     a7a:	ce46                	sw	a7,28(sp)
     a7c:	cc72                	sw	t3,24(sp)
     a7e:	ca76                	sw	t4,20(sp)
     a80:	c87a                	sw	t5,16(sp)
     a82:	c67e                	sw	t6,12(sp)
     a84:	0880                	addi	s0,sp,80
    // The interrupt is cleared.
    clear_fast_interrupt(kTimer_3_fic_e);
     a86:	4509                	li	a0,2
     a88:	3d21                	jal	8a0 <clear_fast_interrupt>
    // call the weak fic handler
    fic_irq_timer_3();
     a8a:	3d85                	jal	8fa <fic_irq_timer_3>
}
     a8c:	0001                	nop
     a8e:	40b6                	lw	ra,76(sp)
     a90:	42a6                	lw	t0,72(sp)
     a92:	4316                	lw	t1,68(sp)
     a94:	4386                	lw	t2,64(sp)
     a96:	5472                	lw	s0,60(sp)
     a98:	5562                	lw	a0,56(sp)
     a9a:	55d2                	lw	a1,52(sp)
     a9c:	5642                	lw	a2,48(sp)
     a9e:	56b2                	lw	a3,44(sp)
     aa0:	5722                	lw	a4,40(sp)
     aa2:	5792                	lw	a5,36(sp)
     aa4:	5802                	lw	a6,32(sp)
     aa6:	48f2                	lw	a7,28(sp)
     aa8:	4e62                	lw	t3,24(sp)
     aaa:	4ed2                	lw	t4,20(sp)
     aac:	4f42                	lw	t5,16(sp)
     aae:	4fb2                	lw	t6,12(sp)
     ab0:	6161                	addi	sp,sp,80
     ab2:	30200073          	mret
	...

00000ab8 <handler_irq_fast_dma_done>:

void handler_irq_fast_dma_done(void)
{
     ab8:	715d                	addi	sp,sp,-80
     aba:	c686                	sw	ra,76(sp)
     abc:	c496                	sw	t0,72(sp)
     abe:	c29a                	sw	t1,68(sp)
     ac0:	c09e                	sw	t2,64(sp)
     ac2:	de22                	sw	s0,60(sp)
     ac4:	dc2a                	sw	a0,56(sp)
     ac6:	da2e                	sw	a1,52(sp)
     ac8:	d832                	sw	a2,48(sp)
     aca:	d636                	sw	a3,44(sp)
     acc:	d43a                	sw	a4,40(sp)
     ace:	d23e                	sw	a5,36(sp)
     ad0:	d042                	sw	a6,32(sp)
     ad2:	ce46                	sw	a7,28(sp)
     ad4:	cc72                	sw	t3,24(sp)
     ad6:	ca76                	sw	t4,20(sp)
     ad8:	c87a                	sw	t5,16(sp)
     ada:	c67e                	sw	t6,12(sp)
     adc:	0880                	addi	s0,sp,80
    // The interrupt is cleared.
    clear_fast_interrupt(kDma_done_fic_e);
     ade:	450d                	li	a0,3
     ae0:	33c1                	jal	8a0 <clear_fast_interrupt>
    // call the weak fic handler
    fic_irq_dma_done();
     ae2:	3181                	jal	722 <fic_irq_dma_done>
}
     ae4:	0001                	nop
     ae6:	40b6                	lw	ra,76(sp)
     ae8:	42a6                	lw	t0,72(sp)
     aea:	4316                	lw	t1,68(sp)
     aec:	4386                	lw	t2,64(sp)
     aee:	5472                	lw	s0,60(sp)
     af0:	5562                	lw	a0,56(sp)
     af2:	55d2                	lw	a1,52(sp)
     af4:	5642                	lw	a2,48(sp)
     af6:	56b2                	lw	a3,44(sp)
     af8:	5722                	lw	a4,40(sp)
     afa:	5792                	lw	a5,36(sp)
     afc:	5802                	lw	a6,32(sp)
     afe:	48f2                	lw	a7,28(sp)
     b00:	4e62                	lw	t3,24(sp)
     b02:	4ed2                	lw	t4,20(sp)
     b04:	4f42                	lw	t5,16(sp)
     b06:	4fb2                	lw	t6,12(sp)
     b08:	6161                	addi	sp,sp,80
     b0a:	30200073          	mret
	...

00000b10 <handler_irq_fast_dma_window>:

void handler_irq_fast_dma_window(void)
{
     b10:	715d                	addi	sp,sp,-80
     b12:	c686                	sw	ra,76(sp)
     b14:	c496                	sw	t0,72(sp)
     b16:	c29a                	sw	t1,68(sp)
     b18:	c09e                	sw	t2,64(sp)
     b1a:	de22                	sw	s0,60(sp)
     b1c:	dc2a                	sw	a0,56(sp)
     b1e:	da2e                	sw	a1,52(sp)
     b20:	d832                	sw	a2,48(sp)
     b22:	d636                	sw	a3,44(sp)
     b24:	d43a                	sw	a4,40(sp)
     b26:	d23e                	sw	a5,36(sp)
     b28:	d042                	sw	a6,32(sp)
     b2a:	ce46                	sw	a7,28(sp)
     b2c:	cc72                	sw	t3,24(sp)
     b2e:	ca76                	sw	t4,20(sp)
     b30:	c87a                	sw	t5,16(sp)
     b32:	c67e                	sw	t6,12(sp)
     b34:	0880                	addi	s0,sp,80
    // The interrupt is cleared.
    clear_fast_interrupt(kDma_window_fic_e);
     b36:	4539                	li	a0,14
     b38:	33a5                	jal	8a0 <clear_fast_interrupt>
    // call the weak fic handler
    fic_irq_dma_window();
     b3a:	3e51                	jal	6ce <fic_irq_dma_window>
}
     b3c:	0001                	nop
     b3e:	40b6                	lw	ra,76(sp)
     b40:	42a6                	lw	t0,72(sp)
     b42:	4316                	lw	t1,68(sp)
     b44:	4386                	lw	t2,64(sp)
     b46:	5472                	lw	s0,60(sp)
     b48:	5562                	lw	a0,56(sp)
     b4a:	55d2                	lw	a1,52(sp)
     b4c:	5642                	lw	a2,48(sp)
     b4e:	56b2                	lw	a3,44(sp)
     b50:	5722                	lw	a4,40(sp)
     b52:	5792                	lw	a5,36(sp)
     b54:	5802                	lw	a6,32(sp)
     b56:	48f2                	lw	a7,28(sp)
     b58:	4e62                	lw	t3,24(sp)
     b5a:	4ed2                	lw	t4,20(sp)
     b5c:	4f42                	lw	t5,16(sp)
     b5e:	4fb2                	lw	t6,12(sp)
     b60:	6161                	addi	sp,sp,80
     b62:	30200073          	mret
	...

00000b68 <handler_irq_fast_external_peripheral>:

void handler_irq_fast_external_peripheral(void)
{
     b68:	715d                	addi	sp,sp,-80
     b6a:	c686                	sw	ra,76(sp)
     b6c:	c496                	sw	t0,72(sp)
     b6e:	c29a                	sw	t1,68(sp)
     b70:	c09e                	sw	t2,64(sp)
     b72:	de22                	sw	s0,60(sp)
     b74:	dc2a                	sw	a0,56(sp)
     b76:	da2e                	sw	a1,52(sp)
     b78:	d832                	sw	a2,48(sp)
     b7a:	d636                	sw	a3,44(sp)
     b7c:	d43a                	sw	a4,40(sp)
     b7e:	d23e                	sw	a5,36(sp)
     b80:	d042                	sw	a6,32(sp)
     b82:	ce46                	sw	a7,28(sp)
     b84:	cc72                	sw	t3,24(sp)
     b86:	ca76                	sw	t4,20(sp)
     b88:	c87a                	sw	t5,16(sp)
     b8a:	c67e                	sw	t6,12(sp)
     b8c:	0880                	addi	s0,sp,80
    // The interrupt is cleared.
    clear_fast_interrupt(kExt_peri_fic_e);
     b8e:	453d                	li	a0,15
     b90:	3b01                	jal	8a0 <clear_fast_interrupt>
    // call the weak fic handler
    fic_irq_ext_peripheral();
     b92:	3bad                	jal	90c <fic_irq_ext_peripheral>
}
     b94:	0001                	nop
     b96:	40b6                	lw	ra,76(sp)
     b98:	42a6                	lw	t0,72(sp)
     b9a:	4316                	lw	t1,68(sp)
     b9c:	4386                	lw	t2,64(sp)
     b9e:	5472                	lw	s0,60(sp)
     ba0:	5562                	lw	a0,56(sp)
     ba2:	55d2                	lw	a1,52(sp)
     ba4:	5642                	lw	a2,48(sp)
     ba6:	56b2                	lw	a3,44(sp)
     ba8:	5722                	lw	a4,40(sp)
     baa:	5792                	lw	a5,36(sp)
     bac:	5802                	lw	a6,32(sp)
     bae:	48f2                	lw	a7,28(sp)
     bb0:	4e62                	lw	t3,24(sp)
     bb2:	4ed2                	lw	t4,20(sp)
     bb4:	4f42                	lw	t5,16(sp)
     bb6:	4fb2                	lw	t6,12(sp)
     bb8:	6161                	addi	sp,sp,80
     bba:	30200073          	mret
	...

00000bc0 <handler_irq_fast_spi>:

void handler_irq_fast_spi(void)
{
     bc0:	715d                	addi	sp,sp,-80
     bc2:	c686                	sw	ra,76(sp)
     bc4:	c496                	sw	t0,72(sp)
     bc6:	c29a                	sw	t1,68(sp)
     bc8:	c09e                	sw	t2,64(sp)
     bca:	de22                	sw	s0,60(sp)
     bcc:	dc2a                	sw	a0,56(sp)
     bce:	da2e                	sw	a1,52(sp)
     bd0:	d832                	sw	a2,48(sp)
     bd2:	d636                	sw	a3,44(sp)
     bd4:	d43a                	sw	a4,40(sp)
     bd6:	d23e                	sw	a5,36(sp)
     bd8:	d042                	sw	a6,32(sp)
     bda:	ce46                	sw	a7,28(sp)
     bdc:	cc72                	sw	t3,24(sp)
     bde:	ca76                	sw	t4,20(sp)
     be0:	c87a                	sw	t5,16(sp)
     be2:	c67e                	sw	t6,12(sp)
     be4:	0880                	addi	s0,sp,80
    // The interrupt is cleared.
    clear_fast_interrupt(kSpi_fic_e);
     be6:	4511                	li	a0,4
     be8:	3965                	jal	8a0 <clear_fast_interrupt>
    // call the weak fic handler
    fic_irq_spi();
     bea:	311000ef          	jal	16fa <fic_irq_spi>
}
     bee:	0001                	nop
     bf0:	40b6                	lw	ra,76(sp)
     bf2:	42a6                	lw	t0,72(sp)
     bf4:	4316                	lw	t1,68(sp)
     bf6:	4386                	lw	t2,64(sp)
     bf8:	5472                	lw	s0,60(sp)
     bfa:	5562                	lw	a0,56(sp)
     bfc:	55d2                	lw	a1,52(sp)
     bfe:	5642                	lw	a2,48(sp)
     c00:	56b2                	lw	a3,44(sp)
     c02:	5722                	lw	a4,40(sp)
     c04:	5792                	lw	a5,36(sp)
     c06:	5802                	lw	a6,32(sp)
     c08:	48f2                	lw	a7,28(sp)
     c0a:	4e62                	lw	t3,24(sp)
     c0c:	4ed2                	lw	t4,20(sp)
     c0e:	4f42                	lw	t5,16(sp)
     c10:	4fb2                	lw	t6,12(sp)
     c12:	6161                	addi	sp,sp,80
     c14:	30200073          	mret

00000c18 <handler_irq_fast_spi_flash>:

void handler_irq_fast_spi_flash(void)
{
     c18:	715d                	addi	sp,sp,-80
     c1a:	c686                	sw	ra,76(sp)
     c1c:	c496                	sw	t0,72(sp)
     c1e:	c29a                	sw	t1,68(sp)
     c20:	c09e                	sw	t2,64(sp)
     c22:	de22                	sw	s0,60(sp)
     c24:	dc2a                	sw	a0,56(sp)
     c26:	da2e                	sw	a1,52(sp)
     c28:	d832                	sw	a2,48(sp)
     c2a:	d636                	sw	a3,44(sp)
     c2c:	d43a                	sw	a4,40(sp)
     c2e:	d23e                	sw	a5,36(sp)
     c30:	d042                	sw	a6,32(sp)
     c32:	ce46                	sw	a7,28(sp)
     c34:	cc72                	sw	t3,24(sp)
     c36:	ca76                	sw	t4,20(sp)
     c38:	c87a                	sw	t5,16(sp)
     c3a:	c67e                	sw	t6,12(sp)
     c3c:	0880                	addi	s0,sp,80
    // The interrupt is cleared.
    clear_fast_interrupt(kSpiFlash_fic_e);
     c3e:	4515                	li	a0,5
     c40:	3185                	jal	8a0 <clear_fast_interrupt>
    // call the weak fic handler
    fic_irq_spi_flash();
     c42:	305000ef          	jal	1746 <fic_irq_spi_flash>
}
     c46:	0001                	nop
     c48:	40b6                	lw	ra,76(sp)
     c4a:	42a6                	lw	t0,72(sp)
     c4c:	4316                	lw	t1,68(sp)
     c4e:	4386                	lw	t2,64(sp)
     c50:	5472                	lw	s0,60(sp)
     c52:	5562                	lw	a0,56(sp)
     c54:	55d2                	lw	a1,52(sp)
     c56:	5642                	lw	a2,48(sp)
     c58:	56b2                	lw	a3,44(sp)
     c5a:	5722                	lw	a4,40(sp)
     c5c:	5792                	lw	a5,36(sp)
     c5e:	5802                	lw	a6,32(sp)
     c60:	48f2                	lw	a7,28(sp)
     c62:	4e62                	lw	t3,24(sp)
     c64:	4ed2                	lw	t4,20(sp)
     c66:	4f42                	lw	t5,16(sp)
     c68:	4fb2                	lw	t6,12(sp)
     c6a:	6161                	addi	sp,sp,80
     c6c:	30200073          	mret

00000c70 <handler_irq_fast_gpio_0>:

void handler_irq_fast_gpio_0(void)
{
     c70:	715d                	addi	sp,sp,-80
     c72:	c686                	sw	ra,76(sp)
     c74:	c496                	sw	t0,72(sp)
     c76:	c29a                	sw	t1,68(sp)
     c78:	c09e                	sw	t2,64(sp)
     c7a:	de22                	sw	s0,60(sp)
     c7c:	dc2a                	sw	a0,56(sp)
     c7e:	da2e                	sw	a1,52(sp)
     c80:	d832                	sw	a2,48(sp)
     c82:	d636                	sw	a3,44(sp)
     c84:	d43a                	sw	a4,40(sp)
     c86:	d23e                	sw	a5,36(sp)
     c88:	d042                	sw	a6,32(sp)
     c8a:	ce46                	sw	a7,28(sp)
     c8c:	cc72                	sw	t3,24(sp)
     c8e:	ca76                	sw	t4,20(sp)
     c90:	c87a                	sw	t5,16(sp)
     c92:	c67e                	sw	t6,12(sp)
     c94:	0880                	addi	s0,sp,80
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_0_fic_e);
     c96:	4519                	li	a0,6
     c98:	3121                	jal	8a0 <clear_fast_interrupt>
    // call the weak fic handler
    fic_irq_gpio_0();
     c9a:	3151                	jal	91e <fic_irq_gpio_0>
}
     c9c:	0001                	nop
     c9e:	40b6                	lw	ra,76(sp)
     ca0:	42a6                	lw	t0,72(sp)
     ca2:	4316                	lw	t1,68(sp)
     ca4:	4386                	lw	t2,64(sp)
     ca6:	5472                	lw	s0,60(sp)
     ca8:	5562                	lw	a0,56(sp)
     caa:	55d2                	lw	a1,52(sp)
     cac:	5642                	lw	a2,48(sp)
     cae:	56b2                	lw	a3,44(sp)
     cb0:	5722                	lw	a4,40(sp)
     cb2:	5792                	lw	a5,36(sp)
     cb4:	5802                	lw	a6,32(sp)
     cb6:	48f2                	lw	a7,28(sp)
     cb8:	4e62                	lw	t3,24(sp)
     cba:	4ed2                	lw	t4,20(sp)
     cbc:	4f42                	lw	t5,16(sp)
     cbe:	4fb2                	lw	t6,12(sp)
     cc0:	6161                	addi	sp,sp,80
     cc2:	30200073          	mret
	...

00000cc8 <handler_irq_fast_gpio_1>:

void handler_irq_fast_gpio_1(void)
{
     cc8:	715d                	addi	sp,sp,-80
     cca:	c686                	sw	ra,76(sp)
     ccc:	c496                	sw	t0,72(sp)
     cce:	c29a                	sw	t1,68(sp)
     cd0:	c09e                	sw	t2,64(sp)
     cd2:	de22                	sw	s0,60(sp)
     cd4:	dc2a                	sw	a0,56(sp)
     cd6:	da2e                	sw	a1,52(sp)
     cd8:	d832                	sw	a2,48(sp)
     cda:	d636                	sw	a3,44(sp)
     cdc:	d43a                	sw	a4,40(sp)
     cde:	d23e                	sw	a5,36(sp)
     ce0:	d042                	sw	a6,32(sp)
     ce2:	ce46                	sw	a7,28(sp)
     ce4:	cc72                	sw	t3,24(sp)
     ce6:	ca76                	sw	t4,20(sp)
     ce8:	c87a                	sw	t5,16(sp)
     cea:	c67e                	sw	t6,12(sp)
     cec:	0880                	addi	s0,sp,80
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_1_fic_e);
     cee:	451d                	li	a0,7
     cf0:	3e45                	jal	8a0 <clear_fast_interrupt>
    // call the weak fic handler
    fic_irq_gpio_1();
     cf2:	393d                	jal	930 <fic_irq_gpio_1>
}
     cf4:	0001                	nop
     cf6:	40b6                	lw	ra,76(sp)
     cf8:	42a6                	lw	t0,72(sp)
     cfa:	4316                	lw	t1,68(sp)
     cfc:	4386                	lw	t2,64(sp)
     cfe:	5472                	lw	s0,60(sp)
     d00:	5562                	lw	a0,56(sp)
     d02:	55d2                	lw	a1,52(sp)
     d04:	5642                	lw	a2,48(sp)
     d06:	56b2                	lw	a3,44(sp)
     d08:	5722                	lw	a4,40(sp)
     d0a:	5792                	lw	a5,36(sp)
     d0c:	5802                	lw	a6,32(sp)
     d0e:	48f2                	lw	a7,28(sp)
     d10:	4e62                	lw	t3,24(sp)
     d12:	4ed2                	lw	t4,20(sp)
     d14:	4f42                	lw	t5,16(sp)
     d16:	4fb2                	lw	t6,12(sp)
     d18:	6161                	addi	sp,sp,80
     d1a:	30200073          	mret
	...

00000d20 <handler_irq_fast_gpio_2>:

void handler_irq_fast_gpio_2(void)
{
     d20:	715d                	addi	sp,sp,-80
     d22:	c686                	sw	ra,76(sp)
     d24:	c496                	sw	t0,72(sp)
     d26:	c29a                	sw	t1,68(sp)
     d28:	c09e                	sw	t2,64(sp)
     d2a:	de22                	sw	s0,60(sp)
     d2c:	dc2a                	sw	a0,56(sp)
     d2e:	da2e                	sw	a1,52(sp)
     d30:	d832                	sw	a2,48(sp)
     d32:	d636                	sw	a3,44(sp)
     d34:	d43a                	sw	a4,40(sp)
     d36:	d23e                	sw	a5,36(sp)
     d38:	d042                	sw	a6,32(sp)
     d3a:	ce46                	sw	a7,28(sp)
     d3c:	cc72                	sw	t3,24(sp)
     d3e:	ca76                	sw	t4,20(sp)
     d40:	c87a                	sw	t5,16(sp)
     d42:	c67e                	sw	t6,12(sp)
     d44:	0880                	addi	s0,sp,80
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_2_fic_e);
     d46:	4521                	li	a0,8
     d48:	3ea1                	jal	8a0 <clear_fast_interrupt>
    // call the weak fic handler
    fic_irq_gpio_2();
     d4a:	3ee5                	jal	942 <fic_irq_gpio_2>
}
     d4c:	0001                	nop
     d4e:	40b6                	lw	ra,76(sp)
     d50:	42a6                	lw	t0,72(sp)
     d52:	4316                	lw	t1,68(sp)
     d54:	4386                	lw	t2,64(sp)
     d56:	5472                	lw	s0,60(sp)
     d58:	5562                	lw	a0,56(sp)
     d5a:	55d2                	lw	a1,52(sp)
     d5c:	5642                	lw	a2,48(sp)
     d5e:	56b2                	lw	a3,44(sp)
     d60:	5722                	lw	a4,40(sp)
     d62:	5792                	lw	a5,36(sp)
     d64:	5802                	lw	a6,32(sp)
     d66:	48f2                	lw	a7,28(sp)
     d68:	4e62                	lw	t3,24(sp)
     d6a:	4ed2                	lw	t4,20(sp)
     d6c:	4f42                	lw	t5,16(sp)
     d6e:	4fb2                	lw	t6,12(sp)
     d70:	6161                	addi	sp,sp,80
     d72:	30200073          	mret
	...

00000d78 <handler_irq_fast_gpio_3>:

void handler_irq_fast_gpio_3(void)
{
     d78:	715d                	addi	sp,sp,-80
     d7a:	c686                	sw	ra,76(sp)
     d7c:	c496                	sw	t0,72(sp)
     d7e:	c29a                	sw	t1,68(sp)
     d80:	c09e                	sw	t2,64(sp)
     d82:	de22                	sw	s0,60(sp)
     d84:	dc2a                	sw	a0,56(sp)
     d86:	da2e                	sw	a1,52(sp)
     d88:	d832                	sw	a2,48(sp)
     d8a:	d636                	sw	a3,44(sp)
     d8c:	d43a                	sw	a4,40(sp)
     d8e:	d23e                	sw	a5,36(sp)
     d90:	d042                	sw	a6,32(sp)
     d92:	ce46                	sw	a7,28(sp)
     d94:	cc72                	sw	t3,24(sp)
     d96:	ca76                	sw	t4,20(sp)
     d98:	c87a                	sw	t5,16(sp)
     d9a:	c67e                	sw	t6,12(sp)
     d9c:	0880                	addi	s0,sp,80
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_3_fic_e);
     d9e:	4525                	li	a0,9
     da0:	3601                	jal	8a0 <clear_fast_interrupt>
    // call the weak fic handler
    fic_irq_gpio_3();
     da2:	3e4d                	jal	954 <fic_irq_gpio_3>
}
     da4:	0001                	nop
     da6:	40b6                	lw	ra,76(sp)
     da8:	42a6                	lw	t0,72(sp)
     daa:	4316                	lw	t1,68(sp)
     dac:	4386                	lw	t2,64(sp)
     dae:	5472                	lw	s0,60(sp)
     db0:	5562                	lw	a0,56(sp)
     db2:	55d2                	lw	a1,52(sp)
     db4:	5642                	lw	a2,48(sp)
     db6:	56b2                	lw	a3,44(sp)
     db8:	5722                	lw	a4,40(sp)
     dba:	5792                	lw	a5,36(sp)
     dbc:	5802                	lw	a6,32(sp)
     dbe:	48f2                	lw	a7,28(sp)
     dc0:	4e62                	lw	t3,24(sp)
     dc2:	4ed2                	lw	t4,20(sp)
     dc4:	4f42                	lw	t5,16(sp)
     dc6:	4fb2                	lw	t6,12(sp)
     dc8:	6161                	addi	sp,sp,80
     dca:	30200073          	mret
	...

00000dd0 <handler_irq_fast_gpio_4>:

void handler_irq_fast_gpio_4(void)
{
     dd0:	715d                	addi	sp,sp,-80
     dd2:	c686                	sw	ra,76(sp)
     dd4:	c496                	sw	t0,72(sp)
     dd6:	c29a                	sw	t1,68(sp)
     dd8:	c09e                	sw	t2,64(sp)
     dda:	de22                	sw	s0,60(sp)
     ddc:	dc2a                	sw	a0,56(sp)
     dde:	da2e                	sw	a1,52(sp)
     de0:	d832                	sw	a2,48(sp)
     de2:	d636                	sw	a3,44(sp)
     de4:	d43a                	sw	a4,40(sp)
     de6:	d23e                	sw	a5,36(sp)
     de8:	d042                	sw	a6,32(sp)
     dea:	ce46                	sw	a7,28(sp)
     dec:	cc72                	sw	t3,24(sp)
     dee:	ca76                	sw	t4,20(sp)
     df0:	c87a                	sw	t5,16(sp)
     df2:	c67e                	sw	t6,12(sp)
     df4:	0880                	addi	s0,sp,80
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_4_fic_e);
     df6:	4529                	li	a0,10
     df8:	3465                	jal	8a0 <clear_fast_interrupt>
    // call the weak fic handler
    fic_irq_gpio_4();
     dfa:	36b5                	jal	966 <fic_irq_gpio_4>
}
     dfc:	0001                	nop
     dfe:	40b6                	lw	ra,76(sp)
     e00:	42a6                	lw	t0,72(sp)
     e02:	4316                	lw	t1,68(sp)
     e04:	4386                	lw	t2,64(sp)
     e06:	5472                	lw	s0,60(sp)
     e08:	5562                	lw	a0,56(sp)
     e0a:	55d2                	lw	a1,52(sp)
     e0c:	5642                	lw	a2,48(sp)
     e0e:	56b2                	lw	a3,44(sp)
     e10:	5722                	lw	a4,40(sp)
     e12:	5792                	lw	a5,36(sp)
     e14:	5802                	lw	a6,32(sp)
     e16:	48f2                	lw	a7,28(sp)
     e18:	4e62                	lw	t3,24(sp)
     e1a:	4ed2                	lw	t4,20(sp)
     e1c:	4f42                	lw	t5,16(sp)
     e1e:	4fb2                	lw	t6,12(sp)
     e20:	6161                	addi	sp,sp,80
     e22:	30200073          	mret
	...

00000e28 <handler_irq_fast_gpio_5>:

void handler_irq_fast_gpio_5(void)
{
     e28:	715d                	addi	sp,sp,-80
     e2a:	c686                	sw	ra,76(sp)
     e2c:	c496                	sw	t0,72(sp)
     e2e:	c29a                	sw	t1,68(sp)
     e30:	c09e                	sw	t2,64(sp)
     e32:	de22                	sw	s0,60(sp)
     e34:	dc2a                	sw	a0,56(sp)
     e36:	da2e                	sw	a1,52(sp)
     e38:	d832                	sw	a2,48(sp)
     e3a:	d636                	sw	a3,44(sp)
     e3c:	d43a                	sw	a4,40(sp)
     e3e:	d23e                	sw	a5,36(sp)
     e40:	d042                	sw	a6,32(sp)
     e42:	ce46                	sw	a7,28(sp)
     e44:	cc72                	sw	t3,24(sp)
     e46:	ca76                	sw	t4,20(sp)
     e48:	c87a                	sw	t5,16(sp)
     e4a:	c67e                	sw	t6,12(sp)
     e4c:	0880                	addi	s0,sp,80
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_5_fic_e);
     e4e:	452d                	li	a0,11
     e50:	3c81                	jal	8a0 <clear_fast_interrupt>
    // call the weak fic handler
    fic_irq_gpio_5();
     e52:	361d                	jal	978 <fic_irq_gpio_5>
}
     e54:	0001                	nop
     e56:	40b6                	lw	ra,76(sp)
     e58:	42a6                	lw	t0,72(sp)
     e5a:	4316                	lw	t1,68(sp)
     e5c:	4386                	lw	t2,64(sp)
     e5e:	5472                	lw	s0,60(sp)
     e60:	5562                	lw	a0,56(sp)
     e62:	55d2                	lw	a1,52(sp)
     e64:	5642                	lw	a2,48(sp)
     e66:	56b2                	lw	a3,44(sp)
     e68:	5722                	lw	a4,40(sp)
     e6a:	5792                	lw	a5,36(sp)
     e6c:	5802                	lw	a6,32(sp)
     e6e:	48f2                	lw	a7,28(sp)
     e70:	4e62                	lw	t3,24(sp)
     e72:	4ed2                	lw	t4,20(sp)
     e74:	4f42                	lw	t5,16(sp)
     e76:	4fb2                	lw	t6,12(sp)
     e78:	6161                	addi	sp,sp,80
     e7a:	30200073          	mret
	...

00000e80 <handler_irq_fast_gpio_6>:

void handler_irq_fast_gpio_6(void)
{
     e80:	715d                	addi	sp,sp,-80
     e82:	c686                	sw	ra,76(sp)
     e84:	c496                	sw	t0,72(sp)
     e86:	c29a                	sw	t1,68(sp)
     e88:	c09e                	sw	t2,64(sp)
     e8a:	de22                	sw	s0,60(sp)
     e8c:	dc2a                	sw	a0,56(sp)
     e8e:	da2e                	sw	a1,52(sp)
     e90:	d832                	sw	a2,48(sp)
     e92:	d636                	sw	a3,44(sp)
     e94:	d43a                	sw	a4,40(sp)
     e96:	d23e                	sw	a5,36(sp)
     e98:	d042                	sw	a6,32(sp)
     e9a:	ce46                	sw	a7,28(sp)
     e9c:	cc72                	sw	t3,24(sp)
     e9e:	ca76                	sw	t4,20(sp)
     ea0:	c87a                	sw	t5,16(sp)
     ea2:	c67e                	sw	t6,12(sp)
     ea4:	0880                	addi	s0,sp,80
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_6_fic_e);
     ea6:	4531                	li	a0,12
     ea8:	3ae5                	jal	8a0 <clear_fast_interrupt>
    // call the weak fic handler
    fic_irq_gpio_6();
     eaa:	34c5                	jal	98a <fic_irq_gpio_6>
}
     eac:	0001                	nop
     eae:	40b6                	lw	ra,76(sp)
     eb0:	42a6                	lw	t0,72(sp)
     eb2:	4316                	lw	t1,68(sp)
     eb4:	4386                	lw	t2,64(sp)
     eb6:	5472                	lw	s0,60(sp)
     eb8:	5562                	lw	a0,56(sp)
     eba:	55d2                	lw	a1,52(sp)
     ebc:	5642                	lw	a2,48(sp)
     ebe:	56b2                	lw	a3,44(sp)
     ec0:	5722                	lw	a4,40(sp)
     ec2:	5792                	lw	a5,36(sp)
     ec4:	5802                	lw	a6,32(sp)
     ec6:	48f2                	lw	a7,28(sp)
     ec8:	4e62                	lw	t3,24(sp)
     eca:	4ed2                	lw	t4,20(sp)
     ecc:	4f42                	lw	t5,16(sp)
     ece:	4fb2                	lw	t6,12(sp)
     ed0:	6161                	addi	sp,sp,80
     ed2:	30200073          	mret
	...

00000ed8 <handler_irq_fast_gpio_7>:

void handler_irq_fast_gpio_7(void)
{
     ed8:	715d                	addi	sp,sp,-80
     eda:	c686                	sw	ra,76(sp)
     edc:	c496                	sw	t0,72(sp)
     ede:	c29a                	sw	t1,68(sp)
     ee0:	c09e                	sw	t2,64(sp)
     ee2:	de22                	sw	s0,60(sp)
     ee4:	dc2a                	sw	a0,56(sp)
     ee6:	da2e                	sw	a1,52(sp)
     ee8:	d832                	sw	a2,48(sp)
     eea:	d636                	sw	a3,44(sp)
     eec:	d43a                	sw	a4,40(sp)
     eee:	d23e                	sw	a5,36(sp)
     ef0:	d042                	sw	a6,32(sp)
     ef2:	ce46                	sw	a7,28(sp)
     ef4:	cc72                	sw	t3,24(sp)
     ef6:	ca76                	sw	t4,20(sp)
     ef8:	c87a                	sw	t5,16(sp)
     efa:	c67e                	sw	t6,12(sp)
     efc:	0880                	addi	s0,sp,80
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_7_fic_e);
     efe:	4535                	li	a0,13
     f00:	3245                	jal	8a0 <clear_fast_interrupt>
    // call the weak fic handler
    fic_irq_gpio_7();
     f02:	3c69                	jal	99c <fic_irq_gpio_7>
}
     f04:	0001                	nop
     f06:	40b6                	lw	ra,76(sp)
     f08:	42a6                	lw	t0,72(sp)
     f0a:	4316                	lw	t1,68(sp)
     f0c:	4386                	lw	t2,64(sp)
     f0e:	5472                	lw	s0,60(sp)
     f10:	5562                	lw	a0,56(sp)
     f12:	55d2                	lw	a1,52(sp)
     f14:	5642                	lw	a2,48(sp)
     f16:	56b2                	lw	a3,44(sp)
     f18:	5722                	lw	a4,40(sp)
     f1a:	5792                	lw	a5,36(sp)
     f1c:	5802                	lw	a6,32(sp)
     f1e:	48f2                	lw	a7,28(sp)
     f20:	4e62                	lw	t3,24(sp)
     f22:	4ed2                	lw	t4,20(sp)
     f24:	4f42                	lw	t5,16(sp)
     f26:	4fb2                	lw	t6,12(sp)
     f28:	6161                	addi	sp,sp,80
     f2a:	30200073          	mret
	...

00000f30 <handler_irq_external>:
/*                           EXPORTED FUNCTIONS                             */
/**                                                                        **/
/****************************************************************************/

void handler_irq_external(void)
{
     f30:	711d                	addi	sp,sp,-96
     f32:	ce86                	sw	ra,92(sp)
     f34:	cc96                	sw	t0,88(sp)
     f36:	ca9a                	sw	t1,84(sp)
     f38:	c89e                	sw	t2,80(sp)
     f3a:	c6a2                	sw	s0,76(sp)
     f3c:	c4aa                	sw	a0,72(sp)
     f3e:	c2ae                	sw	a1,68(sp)
     f40:	c0b2                	sw	a2,64(sp)
     f42:	de36                	sw	a3,60(sp)
     f44:	dc3a                	sw	a4,56(sp)
     f46:	da3e                	sw	a5,52(sp)
     f48:	d842                	sw	a6,48(sp)
     f4a:	d646                	sw	a7,44(sp)
     f4c:	d472                	sw	t3,40(sp)
     f4e:	d276                	sw	t4,36(sp)
     f50:	d07a                	sw	t5,32(sp)
     f52:	ce7e                	sw	t6,28(sp)
     f54:	1080                	addi	s0,sp,96
  uint32_t int_id = NULL_INTR;
     f56:	fa042423          	sw	zero,-88(s0)
  plic_result_t res = plic_irq_claim(&int_id);
     f5a:	fa840793          	addi	a5,s0,-88
     f5e:	853e                	mv	a0,a5
     f60:	20b9                	jal	fae <plic_irq_claim>
     f62:	faa42623          	sw	a0,-84(s0)

    // Calls the proper handler
    handlers[int_id](int_id);
     f66:	fa842783          	lw	a5,-88(s0)
     f6a:	98c18713          	addi	a4,gp,-1652 # b520 <handlers>
     f6e:	078a                	slli	a5,a5,0x2
     f70:	97ba                	add	a5,a5,a4
     f72:	439c                	lw	a5,0(a5)
     f74:	fa842703          	lw	a4,-88(s0)
     f78:	853a                	mv	a0,a4
     f7a:	9782                	jalr	a5
    plic_irq_complete(&int_id);
     f7c:	fa840793          	addi	a5,s0,-88
     f80:	853e                	mv	a0,a5
     f82:	28b1                	jal	fde <plic_irq_complete>
}
     f84:	0001                	nop
     f86:	40f6                	lw	ra,92(sp)
     f88:	42e6                	lw	t0,88(sp)
     f8a:	4356                	lw	t1,84(sp)
     f8c:	43c6                	lw	t2,80(sp)
     f8e:	4436                	lw	s0,76(sp)
     f90:	4526                	lw	a0,72(sp)
     f92:	4596                	lw	a1,68(sp)
     f94:	4606                	lw	a2,64(sp)
     f96:	56f2                	lw	a3,60(sp)
     f98:	5762                	lw	a4,56(sp)
     f9a:	57d2                	lw	a5,52(sp)
     f9c:	5842                	lw	a6,48(sp)
     f9e:	58b2                	lw	a7,44(sp)
     fa0:	5e22                	lw	t3,40(sp)
     fa2:	5e92                	lw	t4,36(sp)
     fa4:	5f02                	lw	t5,32(sp)
     fa6:	4ff2                	lw	t6,28(sp)
     fa8:	6125                	addi	sp,sp,96
     faa:	30200073          	mret

00000fae <plic_irq_claim>:
  return kPlicOk;
}


plic_result_t plic_irq_claim( uint32_t *claim_data)
{
     fae:	1101                	addi	sp,sp,-32
     fb0:	ce06                	sw	ra,28(sp)
     fb2:	cc22                	sw	s0,24(sp)
     fb4:	1000                	addi	s0,sp,32
     fb6:	fea42623          	sw	a0,-20(s0)
  if (claim_data == NULL)
     fba:	fec42783          	lw	a5,-20(s0)
     fbe:	e399                	bnez	a5,fc4 <plic_irq_claim+0x16>
  {
    return kPlicBadArg;
     fc0:	4789                	li	a5,2
     fc2:	a809                	j	fd4 <plic_irq_claim+0x26>
  }

  *claim_data = rv_plic_peri->CC0;
     fc4:	300007b7          	lui	a5,0x30000
     fc8:	20c7a703          	lw	a4,524(a5) # 3000020c <syscalls_cpp.cpp.cfa7c3ef+0x2ffec6b6>
     fcc:	fec42783          	lw	a5,-20(s0)
     fd0:	c398                	sw	a4,0(a5)

  return kPlicOk;
     fd2:	4781                	li	a5,0
}
     fd4:	853e                	mv	a0,a5
     fd6:	40f2                	lw	ra,28(sp)
     fd8:	4462                	lw	s0,24(sp)
     fda:	6105                	addi	sp,sp,32
     fdc:	8082                	ret

00000fde <plic_irq_complete>:


plic_result_t plic_irq_complete(const uint32_t *complete_data)
{
     fde:	1101                	addi	sp,sp,-32
     fe0:	ce06                	sw	ra,28(sp)
     fe2:	cc22                	sw	s0,24(sp)
     fe4:	1000                	addi	s0,sp,32
     fe6:	fea42623          	sw	a0,-20(s0)
  if (complete_data == NULL)
     fea:	fec42783          	lw	a5,-20(s0)
     fee:	e399                	bnez	a5,ff4 <plic_irq_complete+0x16>
  {
    return kPlicBadArg;
     ff0:	4789                	li	a5,2
     ff2:	a809                	j	1004 <plic_irq_complete+0x26>
  }

  // Write back the claimed IRQ ID to the target specific CC register,
  // to notify the PLIC of the IRQ completion.
  rv_plic_peri->CC0 = *complete_data;
     ff4:	300007b7          	lui	a5,0x30000
     ff8:	fec42703          	lw	a4,-20(s0)
     ffc:	4318                	lw	a4,0(a4)
     ffe:	20e7a623          	sw	a4,524(a5) # 3000020c <syscalls_cpp.cpp.cfa7c3ef+0x2ffec6b6>

  return kPlicOk;
    1002:	4781                	li	a5,0
}
    1004:	853e                	mv	a0,a5
    1006:	40f2                	lw	ra,28(sp)
    1008:	4462                	lw	s0,24(sp)
    100a:	6105                	addi	sp,sp,32
    100c:	8082                	ret

0000100e <mmio_region_read32.lto_priv.5>:
 * @param base the region to read from.
 * @param offset the offset to read at, in bytes.
 * @return the read value.
 */
MMIO_WARN_UNUSED_RESULT
static inline uint32_t mmio_region_read32(mmio_region_t base, ptrdiff_t offset) {
    100e:	1101                	addi	sp,sp,-32
    1010:	ce06                	sw	ra,28(sp)
    1012:	cc22                	sw	s0,24(sp)
    1014:	1000                	addi	s0,sp,32
    1016:	fea42623          	sw	a0,-20(s0)
    101a:	feb42423          	sw	a1,-24(s0)
  return ((volatile uint32_t *)base.base)[offset / sizeof(uint32_t)];
    101e:	fec42703          	lw	a4,-20(s0)
    1022:	fe842783          	lw	a5,-24(s0)
    1026:	9bf1                	andi	a5,a5,-4
    1028:	97ba                	add	a5,a5,a4
    102a:	439c                	lw	a5,0(a5)
}
    102c:	853e                	mv	a0,a5
    102e:	40f2                	lw	ra,28(sp)
    1030:	4462                	lw	s0,24(sp)
    1032:	6105                	addi	sp,sp,32
    1034:	8082                	ret

00001036 <mmio_region_write8>:
 * @param base the region to write to.
 * @param offset the offset to write at, in bytes.
 * @param value the value to write.
 */
static inline void mmio_region_write8(mmio_region_t base, ptrdiff_t offset,
                               uint8_t value) {
    1036:	1101                	addi	sp,sp,-32
    1038:	ce06                	sw	ra,28(sp)
    103a:	cc22                	sw	s0,24(sp)
    103c:	1000                	addi	s0,sp,32
    103e:	fea42623          	sw	a0,-20(s0)
    1042:	feb42423          	sw	a1,-24(s0)
    1046:	87b2                	mv	a5,a2
    1048:	fef403a3          	sb	a5,-25(s0)
  ((volatile uint8_t *)base.base)[offset / sizeof(uint8_t)] = value;
    104c:	fec42703          	lw	a4,-20(s0)
    1050:	fe842783          	lw	a5,-24(s0)
    1054:	97ba                	add	a5,a5,a4
    1056:	fe744703          	lbu	a4,-25(s0)
    105a:	00e78023          	sb	a4,0(a5)
}
    105e:	0001                	nop
    1060:	40f2                	lw	ra,28(sp)
    1062:	4462                	lw	s0,24(sp)
    1064:	6105                	addi	sp,sp,32
    1066:	8082                	ret

00001068 <mmio_region_write32.lto_priv.5>:
 * @param base the region to write to.
 * @param offset the offset to write at, in bytes.
 * @param value the value to write.
 */
static inline void mmio_region_write32(mmio_region_t base, ptrdiff_t offset,
                                uint32_t value) {
    1068:	1101                	addi	sp,sp,-32
    106a:	ce06                	sw	ra,28(sp)
    106c:	cc22                	sw	s0,24(sp)
    106e:	1000                	addi	s0,sp,32
    1070:	fea42623          	sw	a0,-20(s0)
    1074:	feb42423          	sw	a1,-24(s0)
    1078:	fec42223          	sw	a2,-28(s0)
  ((volatile uint32_t *)base.base)[offset / sizeof(uint32_t)] = value;
    107c:	fec42703          	lw	a4,-20(s0)
    1080:	fe842783          	lw	a5,-24(s0)
    1084:	9bf1                	andi	a5,a5,-4
    1086:	97ba                	add	a5,a5,a4
    1088:	fe442703          	lw	a4,-28(s0)
    108c:	c398                	sw	a4,0(a5)
}
    108e:	0001                	nop
    1090:	40f2                	lw	ra,28(sp)
    1092:	4462                	lw	s0,24(sp)
    1094:	6105                	addi	sp,sp,32
    1096:	8082                	ret

00001098 <soc_ctrl_set_valid>:
#include "mmio.h"

#include "soc_ctrl.h"
#include "soc_ctrl_regs.h"  // Generated.

void soc_ctrl_set_valid(const soc_ctrl_t *soc_ctrl, uint8_t valid) {
    1098:	1101                	addi	sp,sp,-32
    109a:	ce06                	sw	ra,28(sp)
    109c:	cc22                	sw	s0,24(sp)
    109e:	1000                	addi	s0,sp,32
    10a0:	fea42623          	sw	a0,-20(s0)
    10a4:	87ae                	mv	a5,a1
    10a6:	fef405a3          	sb	a5,-21(s0)
  mmio_region_write8(soc_ctrl->base_addr, (ptrdiff_t)(SOC_CTRL_EXIT_VALID_REG_OFFSET), valid);
    10aa:	feb44703          	lbu	a4,-21(s0)
    10ae:	fec42783          	lw	a5,-20(s0)
    10b2:	863a                	mv	a2,a4
    10b4:	4581                	li	a1,0
    10b6:	4388                	lw	a0,0(a5)
    10b8:	3fbd                	jal	1036 <mmio_region_write8>
}
    10ba:	0001                	nop
    10bc:	40f2                	lw	ra,28(sp)
    10be:	4462                	lw	s0,24(sp)
    10c0:	6105                	addi	sp,sp,32
    10c2:	8082                	ret

000010c4 <soc_ctrl_set_exit_value>:

void soc_ctrl_set_exit_value(const soc_ctrl_t *soc_ctrl, uint32_t exit_value) {
    10c4:	1101                	addi	sp,sp,-32
    10c6:	ce06                	sw	ra,28(sp)
    10c8:	cc22                	sw	s0,24(sp)
    10ca:	1000                	addi	s0,sp,32
    10cc:	fea42623          	sw	a0,-20(s0)
    10d0:	feb42423          	sw	a1,-24(s0)
  mmio_region_write32(soc_ctrl->base_addr, (ptrdiff_t)(SOC_CTRL_EXIT_VALUE_REG_OFFSET), exit_value);
    10d4:	fec42783          	lw	a5,-20(s0)
    10d8:	fe842603          	lw	a2,-24(s0)
    10dc:	4591                	li	a1,4
    10de:	4388                	lw	a0,0(a5)
    10e0:	3761                	jal	1068 <mmio_region_write32.lto_priv.5>
}
    10e2:	0001                	nop
    10e4:	40f2                	lw	ra,28(sp)
    10e6:	4462                	lw	s0,24(sp)
    10e8:	6105                	addi	sp,sp,32
    10ea:	8082                	ret

000010ec <soc_ctrl_get_frequency>:

uint32_t soc_ctrl_get_frequency(const soc_ctrl_t *soc_ctrl) {
    10ec:	1101                	addi	sp,sp,-32
    10ee:	ce06                	sw	ra,28(sp)
    10f0:	cc22                	sw	s0,24(sp)
    10f2:	1000                	addi	s0,sp,32
    10f4:	fea42623          	sw	a0,-20(s0)
  return mmio_region_read32(soc_ctrl->base_addr, (ptrdiff_t)(SOC_CTRL_SYSTEM_FREQUENCY_HZ_REG_OFFSET));
    10f8:	fec42783          	lw	a5,-20(s0)
    10fc:	45f1                	li	a1,28
    10fe:	4388                	lw	a0,0(a5)
    1100:	3739                	jal	100e <mmio_region_read32.lto_priv.5>
    1102:	87aa                	mv	a5,a0
}
    1104:	853e                	mv	a0,a5
    1106:	40f2                	lw	ra,28(sp)
    1108:	4462                	lw	s0,24(sp)
    110a:	6105                	addi	sp,sp,32
    110c:	8082                	ret

0000110e <bitfield_read.lto_priv.2>:
 */
BITFIELD_WARN_UNUSED_RESULT
static inline uint32_t bitfield_read(uint32_t bitfield, 
                              uint32_t mask, 
                              uint32_t index) 
{
    110e:	1101                	addi	sp,sp,-32
    1110:	ce06                	sw	ra,28(sp)
    1112:	cc22                	sw	s0,24(sp)
    1114:	1000                	addi	s0,sp,32
    1116:	fea42623          	sw	a0,-20(s0)
    111a:	feb42423          	sw	a1,-24(s0)
    111e:	fec42223          	sw	a2,-28(s0)
  return (bitfield >> index) & mask;
    1122:	fe442783          	lw	a5,-28(s0)
    1126:	fec42703          	lw	a4,-20(s0)
    112a:	00f75733          	srl	a4,a4,a5
    112e:	fe842783          	lw	a5,-24(s0)
    1132:	8ff9                	and	a5,a5,a4
}
    1134:	853e                	mv	a0,a5
    1136:	40f2                	lw	ra,28(sp)
    1138:	4462                	lw	s0,24(sp)
    113a:	6105                	addi	sp,sp,32
    113c:	8082                	ret

0000113e <bitfield_write.lto_priv.3>:
BITFIELD_WARN_UNUSED_RESULT
static inline uint32_t bitfield_write(uint32_t bitfield,
                                       uint32_t mask, 
                                       uint32_t index,
                                       uint32_t value) 
{
    113e:	1101                	addi	sp,sp,-32
    1140:	ce06                	sw	ra,28(sp)
    1142:	cc22                	sw	s0,24(sp)
    1144:	1000                	addi	s0,sp,32
    1146:	fea42623          	sw	a0,-20(s0)
    114a:	feb42423          	sw	a1,-24(s0)
    114e:	fec42223          	sw	a2,-28(s0)
    1152:	fed42023          	sw	a3,-32(s0)
  bitfield &= ~(mask << index);
    1156:	fe442783          	lw	a5,-28(s0)
    115a:	fe842703          	lw	a4,-24(s0)
    115e:	00f717b3          	sll	a5,a4,a5
    1162:	fff7c793          	not	a5,a5
    1166:	fec42703          	lw	a4,-20(s0)
    116a:	8ff9                	and	a5,a5,a4
    116c:	fef42623          	sw	a5,-20(s0)
  bitfield |= (value & mask) << index;
    1170:	fe042703          	lw	a4,-32(s0)
    1174:	fe842783          	lw	a5,-24(s0)
    1178:	8f7d                	and	a4,a4,a5
    117a:	fe442783          	lw	a5,-28(s0)
    117e:	00f717b3          	sll	a5,a4,a5
    1182:	fec42703          	lw	a4,-20(s0)
    1186:	8fd9                	or	a5,a5,a4
    1188:	fef42623          	sw	a5,-20(s0)
  return bitfield;
    118c:	fec42783          	lw	a5,-20(s0)
}
    1190:	853e                	mv	a0,a5
    1192:	40f2                	lw	ra,28(sp)
    1194:	4462                	lw	s0,24(sp)
    1196:	6105                	addi	sp,sp,32
    1198:	8082                	ret

0000119a <spi_set_events_enabled>:
    *events = bitfield_read(SPI_HW(spi)->EVENT_ENABLE, SPI_EVENT_ALL, SPI_EVENTS_INDEX);
    return SPI_FLAG_OK;
}

spi_return_flags_e spi_set_events_enabled(spi_host_t* spi, spi_event_e events, bool enable) 
{
    119a:	1101                	addi	sp,sp,-32
    119c:	ce06                	sw	ra,28(sp)
    119e:	cc22                	sw	s0,24(sp)
    11a0:	1000                	addi	s0,sp,32
    11a2:	fea42623          	sw	a0,-20(s0)
    11a6:	feb42423          	sw	a1,-24(s0)
    11aa:	87b2                	mv	a5,a2
    11ac:	fef403a3          	sb	a5,-25(s0)
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
    11b0:	fec42783          	lw	a5,-20(s0)
    11b4:	e399                	bnez	a5,11ba <spi_set_events_enabled+0x20>
    11b6:	4785                	li	a5,1
    11b8:	a099                	j	11fe <spi_set_events_enabled+0x64>
    if (events > SPI_EVENT_ALL) return SPI_FLAG_EVENT_INVALID;
    11ba:	fe842703          	lw	a4,-24(s0)
    11be:	03f00793          	li	a5,63
    11c2:	00e7f563          	bgeu	a5,a4,11cc <spi_set_events_enabled+0x32>
    11c6:	10000793          	li	a5,256
    11ca:	a815                	j	11fe <spi_set_events_enabled+0x64>
    // Since spi_event_e is mapped to EVENT_ENABLE: | = set, & ~ = clear
    if (enable) SPI_HW(spi)->EVENT_ENABLE |= events;
    11cc:	fe744783          	lbu	a5,-25(s0)
    11d0:	cb99                	beqz	a5,11e6 <spi_set_events_enabled+0x4c>
    11d2:	fec42783          	lw	a5,-20(s0)
    11d6:	5f98                	lw	a4,56(a5)
    11d8:	fe842783          	lw	a5,-24(s0)
    11dc:	8f5d                	or	a4,a4,a5
    11de:	fec42783          	lw	a5,-20(s0)
    11e2:	df98                	sw	a4,56(a5)
    11e4:	a821                	j	11fc <spi_set_events_enabled+0x62>
    else        SPI_HW(spi)->EVENT_ENABLE &= ~events;
    11e6:	fec42783          	lw	a5,-20(s0)
    11ea:	5f98                	lw	a4,56(a5)
    11ec:	fe842783          	lw	a5,-24(s0)
    11f0:	fff7c793          	not	a5,a5
    11f4:	8f7d                	and	a4,a4,a5
    11f6:	fec42783          	lw	a5,-20(s0)
    11fa:	df98                	sw	a4,56(a5)

    return SPI_FLAG_OK;
    11fc:	4781                	li	a5,0
}
    11fe:	853e                	mv	a0,a5
    1200:	40f2                	lw	ra,28(sp)
    1202:	4462                	lw	s0,24(sp)
    1204:	6105                	addi	sp,sp,32
    1206:	8082                	ret

00001208 <spi_set_errors_enabled>:
    *errors = bitfield_read(SPI_HW(spi)->ERROR_ENABLE, SPI_ERROR_IRQALL, SPI_ERRORS_INDEX);
    return SPI_FLAG_OK;
}

spi_return_flags_e spi_set_errors_enabled(spi_host_t* spi, spi_error_e errors, bool enable)
{
    1208:	1101                	addi	sp,sp,-32
    120a:	ce06                	sw	ra,28(sp)
    120c:	cc22                	sw	s0,24(sp)
    120e:	1000                	addi	s0,sp,32
    1210:	fea42623          	sw	a0,-20(s0)
    1214:	feb42423          	sw	a1,-24(s0)
    1218:	87b2                	mv	a5,a2
    121a:	fef403a3          	sb	a5,-25(s0)
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
    121e:	fec42783          	lw	a5,-20(s0)
    1222:	e399                	bnez	a5,1228 <spi_set_errors_enabled+0x20>
    1224:	4785                	li	a5,1
    1226:	a091                	j	126a <spi_set_errors_enabled+0x62>
    if (errors > SPI_ERROR_IRQALL) return SPI_FLAG_ERROR_INVALID;
    1228:	fe842703          	lw	a4,-24(s0)
    122c:	47fd                	li	a5,31
    122e:	00e7f563          	bgeu	a5,a4,1238 <spi_set_errors_enabled+0x30>
    1232:	20000793          	li	a5,512
    1236:	a815                	j	126a <spi_set_errors_enabled+0x62>
    // Since spi_error_e is mapped to ERROR_ENABLE: | = set, & ~ = clear
    if (enable) SPI_HW(spi)->ERROR_ENABLE |= errors;
    1238:	fe744783          	lbu	a5,-25(s0)
    123c:	cb99                	beqz	a5,1252 <spi_set_errors_enabled+0x4a>
    123e:	fec42783          	lw	a5,-20(s0)
    1242:	5b98                	lw	a4,48(a5)
    1244:	fe842783          	lw	a5,-24(s0)
    1248:	8f5d                	or	a4,a4,a5
    124a:	fec42783          	lw	a5,-20(s0)
    124e:	db98                	sw	a4,48(a5)
    1250:	a821                	j	1268 <spi_set_errors_enabled+0x60>
    else        SPI_HW(spi)->ERROR_ENABLE &= ~errors;
    1252:	fec42783          	lw	a5,-20(s0)
    1256:	5b98                	lw	a4,48(a5)
    1258:	fe842783          	lw	a5,-24(s0)
    125c:	fff7c793          	not	a5,a5
    1260:	8f7d                	and	a4,a4,a5
    1262:	fec42783          	lw	a5,-20(s0)
    1266:	db98                	sw	a4,48(a5)

    return SPI_FLAG_OK;
    1268:	4781                	li	a5,0
}
    126a:	853e                	mv	a0,a5
    126c:	40f2                	lw	ra,28(sp)
    126e:	4462                	lw	s0,24(sp)
    1270:	6105                	addi	sp,sp,32
    1272:	8082                	ret

00001274 <spi_get_errors>:

spi_return_flags_e spi_get_errors(spi_host_t* spi, spi_error_e* errors)
{
    1274:	1101                	addi	sp,sp,-32
    1276:	ce06                	sw	ra,28(sp)
    1278:	cc22                	sw	s0,24(sp)
    127a:	1000                	addi	s0,sp,32
    127c:	fea42623          	sw	a0,-20(s0)
    1280:	feb42423          	sw	a1,-24(s0)
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
    1284:	fec42783          	lw	a5,-20(s0)
    1288:	e399                	bnez	a5,128e <spi_get_errors+0x1a>
    128a:	4785                	li	a5,1
    128c:	a831                	j	12a8 <spi_get_errors+0x34>
    *errors = bitfield_read(SPI_HW(spi)->ERROR_STATUS, SPI_ERROR_ALL, SPI_ERRORS_INDEX);
    128e:	fec42783          	lw	a5,-20(s0)
    1292:	5bdc                	lw	a5,52(a5)
    1294:	4601                	li	a2,0
    1296:	03f00593          	li	a1,63
    129a:	853e                	mv	a0,a5
    129c:	3d8d                	jal	110e <bitfield_read.lto_priv.2>
    129e:	872a                	mv	a4,a0
    12a0:	fe842783          	lw	a5,-24(s0)
    12a4:	c398                	sw	a4,0(a5)
    return SPI_FLAG_OK;
    12a6:	4781                	li	a5,0
}
    12a8:	853e                	mv	a0,a5
    12aa:	40f2                	lw	ra,28(sp)
    12ac:	4462                	lw	s0,24(sp)
    12ae:	6105                	addi	sp,sp,32
    12b0:	8082                	ret

000012b2 <spi_get_tx_queue_depth>:
                                             SPI_HOST_ALERT_TEST_FATAL_FAULT_BIT, true);
    return SPI_FLAG_OK;
}

volatile uint8_t spi_get_tx_queue_depth(spi_host_t* spi)
{
    12b2:	7179                	addi	sp,sp,-48
    12b4:	d606                	sw	ra,44(sp)
    12b6:	d422                	sw	s0,40(sp)
    12b8:	1800                	addi	s0,sp,48
    12ba:	fca42e23          	sw	a0,-36(s0)
    // Returning an impossible value (tx fifo is 76 words long...)
    SPI_NULL_CHECK(spi, UINT8_MAX)
    12be:	fdc42783          	lw	a5,-36(s0)
    12c2:	e781                	bnez	a5,12ca <spi_get_tx_queue_depth+0x18>
    12c4:	0ff00793          	li	a5,255
    12c8:	a831                	j	12e4 <spi_get_tx_queue_depth+0x32>
    12ca:	fdc42783          	lw	a5,-36(s0)
    12ce:	fef42623          	sw	a5,-20(s0)
 */
static inline __attribute__((always_inline)) 
const volatile spi_status_t spi_get_status(spi_host_t* spi)
{
    spi_status_t status;
    status.value = SPI_HW(spi)->STATUS; // Assuming SPI_HW(spi)->STATUS returns a uint32_t value representing the status
    12d2:	fec42783          	lw	a5,-20(s0)
    12d6:	4bdc                	lw	a5,20(a5)
    12d8:	fef42423          	sw	a5,-24(s0)
    return status;
    12dc:	fe842783          	lw	a5,-24(s0)
    return spi_get_status(spi).txqd;
    12e0:	0ff7f793          	zext.b	a5,a5
}
    12e4:	853e                	mv	a0,a5
    12e6:	50b2                	lw	ra,44(sp)
    12e8:	5422                	lw	s0,40(sp)
    12ea:	6145                	addi	sp,sp,48
    12ec:	8082                	ret

000012ee <spi_get_rx_queue_depth>:

volatile uint8_t spi_get_rx_queue_depth(spi_host_t* spi)
{
    12ee:	7179                	addi	sp,sp,-48
    12f0:	d606                	sw	ra,44(sp)
    12f2:	d422                	sw	s0,40(sp)
    12f4:	1800                	addi	s0,sp,48
    12f6:	fca42e23          	sw	a0,-36(s0)
    // Returning an impossible value (rx fifo is 64 words long...)
    SPI_NULL_CHECK(spi, UINT8_MAX)
    12fa:	fdc42783          	lw	a5,-36(s0)
    12fe:	e781                	bnez	a5,1306 <spi_get_rx_queue_depth+0x18>
    1300:	0ff00793          	li	a5,255
    1304:	a005                	j	1324 <spi_get_rx_queue_depth+0x36>
    1306:	fdc42783          	lw	a5,-36(s0)
    130a:	fef42623          	sw	a5,-20(s0)
    status.value = SPI_HW(spi)->STATUS; // Assuming SPI_HW(spi)->STATUS returns a uint32_t value representing the status
    130e:	fec42783          	lw	a5,-20(s0)
    1312:	4bdc                	lw	a5,20(a5)
    1314:	fef42423          	sw	a5,-24(s0)
    return status;
    1318:	fe842783          	lw	a5,-24(s0)
    return spi_get_status(spi).rxqd;
    131c:	83a1                	srli	a5,a5,0x8
    131e:	9bfd                	andi	a5,a5,-1
    1320:	0ff7f793          	zext.b	a5,a5
}
    1324:	853e                	mv	a0,a5
    1326:	50b2                	lw	ra,44(sp)
    1328:	5422                	lw	s0,40(sp)
    132a:	6145                	addi	sp,sp,48
    132c:	8082                	ret

0000132e <spi_sw_reset>:
    SPI_NULL_CHECK(spi, UINT32_MAX)
    return SPI_HW(spi)->CSID;
}

spi_return_flags_e spi_sw_reset(spi_host_t* spi)
{
    132e:	7179                	addi	sp,sp,-48
    1330:	d606                	sw	ra,44(sp)
    1332:	d422                	sw	s0,40(sp)
    1334:	1800                	addi	s0,sp,48
    1336:	fca42e23          	sw	a0,-36(s0)
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
    133a:	fdc42783          	lw	a5,-36(s0)
    133e:	e399                	bnez	a5,1344 <spi_sw_reset+0x16>
    1340:	4785                	li	a5,1
    1342:	a88d                	j	13b4 <spi_sw_reset+0x86>
    // Assert spi reset bit
    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, BIT_MASK_1, 
    1344:	fdc42783          	lw	a5,-36(s0)
    1348:	4b9c                	lw	a5,16(a5)
    134a:	4685                	li	a3,1
    134c:	4679                	li	a2,30
    134e:	4585                	li	a1,1
    1350:	853e                	mv	a0,a5
    1352:	33f5                	jal	113e <bitfield_write.lto_priv.3>
    1354:	872a                	mv	a4,a0
    1356:	fdc42783          	lw	a5,-36(s0)
    135a:	cb98                	sw	a4,16(a5)
    135c:	fdc42783          	lw	a5,-36(s0)
    1360:	fef42623          	sw	a5,-20(s0)
    status.value = SPI_HW(spi)->STATUS; // Assuming SPI_HW(spi)->STATUS returns a uint32_t value representing the status
    1364:	fec42783          	lw	a5,-20(s0)
    1368:	4bdc                	lw	a5,20(a5)
    136a:	fef42223          	sw	a5,-28(s0)
    return status;
    136e:	fe442783          	lw	a5,-28(s0)
    1372:	fef42423          	sw	a5,-24(s0)
                                          SPI_HOST_CONTROL_SW_RST_BIT, true);

    volatile spi_status_t status = spi_get_status(spi);
    // Wait for spi active and txqd & rxqd both go to 0
    while (status.active || status.txqd || status.rxqd);
    1376:	0001                	nop
    1378:	fe842783          	lw	a5,-24(s0)
    137c:	83f9                	srli	a5,a5,0x1e
    137e:	8b85                	andi	a5,a5,1
    1380:	0ff7f793          	zext.b	a5,a5
    1384:	fbf5                	bnez	a5,1378 <spi_sw_reset+0x4a>
    1386:	fe844783          	lbu	a5,-24(s0)
    138a:	0ff7f793          	zext.b	a5,a5
    138e:	f7ed                	bnez	a5,1378 <spi_sw_reset+0x4a>
    1390:	fe944783          	lbu	a5,-23(s0)
    1394:	0ff7f793          	zext.b	a5,a5
    1398:	f3e5                	bnez	a5,1378 <spi_sw_reset+0x4a>
    // Deassert spi reset bit
    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, BIT_MASK_1, 
    139a:	fdc42783          	lw	a5,-36(s0)
    139e:	4b9c                	lw	a5,16(a5)
    13a0:	4681                	li	a3,0
    13a2:	4679                	li	a2,30
    13a4:	4585                	li	a1,1
    13a6:	853e                	mv	a0,a5
    13a8:	3b59                	jal	113e <bitfield_write.lto_priv.3>
    13aa:	872a                	mv	a4,a0
    13ac:	fdc42783          	lw	a5,-36(s0)
    13b0:	cb98                	sw	a4,16(a5)
                                          SPI_HOST_CONTROL_SW_RST_BIT, false);
    return SPI_FLAG_OK;
    13b2:	4781                	li	a5,0
}
    13b4:	853e                	mv	a0,a5
    13b6:	50b2                	lw	ra,44(sp)
    13b8:	5422                	lw	s0,40(sp)
    13ba:	6145                	addi	sp,sp,48
    13bc:	8082                	ret

000013be <spi_set_enable>:

spi_return_flags_e spi_set_enable(spi_host_t* spi, bool enable)
{
    13be:	1101                	addi	sp,sp,-32
    13c0:	ce06                	sw	ra,28(sp)
    13c2:	cc22                	sw	s0,24(sp)
    13c4:	1000                	addi	s0,sp,32
    13c6:	fea42623          	sw	a0,-20(s0)
    13ca:	87ae                	mv	a5,a1
    13cc:	fef405a3          	sb	a5,-21(s0)
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
    13d0:	fec42783          	lw	a5,-20(s0)
    13d4:	e399                	bnez	a5,13da <spi_set_enable+0x1c>
    13d6:	4785                	li	a5,1
    13d8:	a005                	j	13f8 <spi_set_enable+0x3a>
    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, BIT_MASK_1, 
    13da:	fec42783          	lw	a5,-20(s0)
    13de:	4b9c                	lw	a5,16(a5)
    13e0:	feb44703          	lbu	a4,-21(s0)
    13e4:	86ba                	mv	a3,a4
    13e6:	467d                	li	a2,31
    13e8:	4585                	li	a1,1
    13ea:	853e                	mv	a0,a5
    13ec:	3b89                	jal	113e <bitfield_write.lto_priv.3>
    13ee:	872a                	mv	a4,a0
    13f0:	fec42783          	lw	a5,-20(s0)
    13f4:	cb98                	sw	a4,16(a5)
                                          SPI_HOST_CONTROL_SPIEN_BIT, enable);
    return SPI_FLAG_OK;
    13f6:	4781                	li	a5,0
}
    13f8:	853e                	mv	a0,a5
    13fa:	40f2                	lw	ra,28(sp)
    13fc:	4462                	lw	s0,24(sp)
    13fe:	6105                	addi	sp,sp,32
    1400:	8082                	ret

00001402 <spi_set_tx_watermark>:

spi_return_flags_e spi_set_tx_watermark(spi_host_t* spi, uint8_t watermark)
{
    1402:	1101                	addi	sp,sp,-32
    1404:	ce06                	sw	ra,28(sp)
    1406:	cc22                	sw	s0,24(sp)
    1408:	1000                	addi	s0,sp,32
    140a:	fea42623          	sw	a0,-20(s0)
    140e:	87ae                	mv	a5,a1
    1410:	fef405a3          	sb	a5,-21(s0)
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
    1414:	fec42783          	lw	a5,-20(s0)
    1418:	e399                	bnez	a5,141e <spi_set_tx_watermark+0x1c>
    141a:	4785                	li	a5,1
    141c:	a80d                	j	144e <spi_set_tx_watermark+0x4c>
    // Check that watermark is not bigger than the fifo size (makes no sense otherwise)
    if (watermark > SPI_HOST_PARAM_TX_DEPTH) return SPI_FLAG_WATERMARK_EXCEEDS;
    141e:	feb44703          	lbu	a4,-21(s0)
    1422:	04800793          	li	a5,72
    1426:	00e7f463          	bgeu	a5,a4,142e <spi_set_tx_watermark+0x2c>
    142a:	4789                	li	a5,2
    142c:	a00d                	j	144e <spi_set_tx_watermark+0x4c>

    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, 
    142e:	fec42783          	lw	a5,-20(s0)
    1432:	4b9c                	lw	a5,16(a5)
    1434:	feb44703          	lbu	a4,-21(s0)
    1438:	86ba                	mv	a3,a4
    143a:	4621                	li	a2,8
    143c:	0ff00593          	li	a1,255
    1440:	853e                	mv	a0,a5
    1442:	39f5                	jal	113e <bitfield_write.lto_priv.3>
    1444:	872a                	mv	a4,a0
    1446:	fec42783          	lw	a5,-20(s0)
    144a:	cb98                	sw	a4,16(a5)
                                          SPI_HOST_CONTROL_TX_WATERMARK_MASK, 
                                          SPI_HOST_CONTROL_TX_WATERMARK_OFFSET, 
                                          watermark);
    return SPI_FLAG_OK;
    144c:	4781                	li	a5,0
}
    144e:	853e                	mv	a0,a5
    1450:	40f2                	lw	ra,28(sp)
    1452:	4462                	lw	s0,24(sp)
    1454:	6105                	addi	sp,sp,32
    1456:	8082                	ret

00001458 <spi_set_rx_watermark>:

spi_return_flags_e spi_set_rx_watermark(spi_host_t* spi, uint8_t watermark)
{
    1458:	1101                	addi	sp,sp,-32
    145a:	ce06                	sw	ra,28(sp)
    145c:	cc22                	sw	s0,24(sp)
    145e:	1000                	addi	s0,sp,32
    1460:	fea42623          	sw	a0,-20(s0)
    1464:	87ae                	mv	a5,a1
    1466:	fef405a3          	sb	a5,-21(s0)
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
    146a:	fec42783          	lw	a5,-20(s0)
    146e:	e399                	bnez	a5,1474 <spi_set_rx_watermark+0x1c>
    1470:	4785                	li	a5,1
    1472:	a80d                	j	14a4 <spi_set_rx_watermark+0x4c>
    // Check that watermark is not bigger than the fifo size (makes no sense otherwise)
    if (watermark > SPI_HOST_PARAM_RX_DEPTH) return SPI_FLAG_WATERMARK_EXCEEDS;
    1474:	feb44703          	lbu	a4,-21(s0)
    1478:	04000793          	li	a5,64
    147c:	00e7f463          	bgeu	a5,a4,1484 <spi_set_rx_watermark+0x2c>
    1480:	4789                	li	a5,2
    1482:	a00d                	j	14a4 <spi_set_rx_watermark+0x4c>

    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, 
    1484:	fec42783          	lw	a5,-20(s0)
    1488:	4b9c                	lw	a5,16(a5)
    148a:	feb44703          	lbu	a4,-21(s0)
    148e:	86ba                	mv	a3,a4
    1490:	4601                	li	a2,0
    1492:	0ff00593          	li	a1,255
    1496:	853e                	mv	a0,a5
    1498:	315d                	jal	113e <bitfield_write.lto_priv.3>
    149a:	872a                	mv	a4,a0
    149c:	fec42783          	lw	a5,-20(s0)
    14a0:	cb98                	sw	a4,16(a5)
                                          SPI_HOST_CONTROL_RX_WATERMARK_MASK, 
                                          SPI_HOST_CONTROL_RX_WATERMARK_OFFSET, 
                                          watermark);
    return SPI_FLAG_OK;
    14a2:	4781                	li	a5,0
}
    14a4:	853e                	mv	a0,a5
    14a6:	40f2                	lw	ra,28(sp)
    14a8:	4462                	lw	s0,24(sp)
    14aa:	6105                	addi	sp,sp,32
    14ac:	8082                	ret

000014ae <spi_set_command>:
    SPI_HW(spi)->CSID = csid;
    return SPI_FLAG_OK;
}

spi_return_flags_e spi_set_command(spi_host_t* spi, const uint32_t cmd_reg)
{
    14ae:	7139                	addi	sp,sp,-64
    14b0:	de06                	sw	ra,60(sp)
    14b2:	dc22                	sw	s0,56(sp)
    14b4:	0080                	addi	s0,sp,64
    14b6:	fca42623          	sw	a0,-52(s0)
    14ba:	fcb42423          	sw	a1,-56(s0)
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
    14be:	fcc42783          	lw	a5,-52(s0)
    14c2:	e399                	bnez	a5,14c8 <spi_set_command+0x1a>
    14c4:	4785                	li	a5,1
    14c6:	a8d1                	j	159a <spi_set_command+0xec>

    spi_return_flags_e flags = SPI_FLAG_OK;
    14c8:	fe042623          	sw	zero,-20(s0)
    spi_speed_e speed   = bitfield_read(cmd_reg, SPI_HOST_COMMAND_SPEED_MASK, 
    14cc:	4665                	li	a2,25
    14ce:	458d                	li	a1,3
    14d0:	fc842503          	lw	a0,-56(s0)
    14d4:	392d                	jal	110e <bitfield_read.lto_priv.2>
    14d6:	fea42423          	sw	a0,-24(s0)
                                        SPI_HOST_COMMAND_SPEED_OFFSET);
    spi_dir_e direction = bitfield_read(cmd_reg, SPI_HOST_COMMAND_DIRECTION_MASK, 
    14da:	466d                	li	a2,27
    14dc:	458d                	li	a1,3
    14de:	fc842503          	lw	a0,-56(s0)
    14e2:	3135                	jal	110e <bitfield_read.lto_priv.2>
    14e4:	fea42223          	sw	a0,-28(s0)
                                        SPI_HOST_COMMAND_DIRECTION_OFFSET);

    // Incompatible speed and direction produces an error
    if (!spi_validate_cmd(direction, speed))     flags |= SPI_FLAG_SPEED_INVALID;
    14e8:	fe442783          	lw	a5,-28(s0)
    14ec:	0ff7f713          	zext.b	a4,a5
    14f0:	fe842783          	lw	a5,-24(s0)
    14f4:	0ff7f793          	zext.b	a5,a5
    14f8:	fee401a3          	sb	a4,-29(s0)
    14fc:	fef40123          	sb	a5,-30(s0)
    if (speed > SPI_SPEED_QUAD || direction > SPI_DIR_BIDIR || 
    1500:	fe244703          	lbu	a4,-30(s0)
    1504:	4789                	li	a5,2
    1506:	00e7ef63          	bltu	a5,a4,1524 <spi_set_command+0x76>
    150a:	fe344703          	lbu	a4,-29(s0)
    150e:	478d                	li	a5,3
    1510:	00e7ea63          	bltu	a5,a4,1524 <spi_set_command+0x76>
    1514:	fe344703          	lbu	a4,-29(s0)
    1518:	478d                	li	a5,3
    151a:	00f71763          	bne	a4,a5,1528 <spi_set_command+0x7a>
       (direction == SPI_DIR_BIDIR && speed != SPI_SPEED_STANDARD))
    151e:	fe244783          	lbu	a5,-30(s0)
    1522:	c399                	beqz	a5,1528 <spi_set_command+0x7a>
        return false;
    1524:	4781                	li	a5,0
    1526:	a011                	j	152a <spi_set_command+0x7c>
        return true;
    1528:	4785                	li	a5,1
    152a:	e799                	bnez	a5,1538 <spi_set_command+0x8a>
    152c:	fec42783          	lw	a5,-20(s0)
    1530:	0107e793          	ori	a5,a5,16
    1534:	fef42623          	sw	a5,-20(s0)
    1538:	fcc42783          	lw	a5,-52(s0)
    153c:	fcf42e23          	sw	a5,-36(s0)
 *         or SPI_TRISTATE_FALSE otherwise.
 */
static inline __attribute__((always_inline)) 
spi_tristate_e spi_get_ready(spi_host_t* spi)
{
    SPI_NULL_CHECK(spi, SPI_TRISTATE_ERROR)
    1540:	fdc42783          	lw	a5,-36(s0)
    1544:	e399                	bnez	a5,154a <spi_set_command+0x9c>
    1546:	4781                	li	a5,0
    1548:	a025                	j	1570 <spi_set_command+0xc2>
    154a:	fdc42783          	lw	a5,-36(s0)
    154e:	fcf42c23          	sw	a5,-40(s0)
    status.value = SPI_HW(spi)->STATUS; // Assuming SPI_HW(spi)->STATUS returns a uint32_t value representing the status
    1552:	fd842783          	lw	a5,-40(s0)
    1556:	4bdc                	lw	a5,20(a5)
    1558:	fcf42a23          	sw	a5,-44(s0)
    return status;
    155c:	fd442783          	lw	a5,-44(s0)
    return spi_get_status(spi).ready ? SPI_TRISTATE_TRUE : SPI_TRISTATE_FALSE;
    1560:	873e                	mv	a4,a5
    1562:	800007b7          	lui	a5,0x80000
    1566:	8ff9                	and	a5,a5,a4
    1568:	c399                	beqz	a5,156e <spi_set_command+0xc0>
    156a:	4785                	li	a5,1
    156c:	a011                	j	1570 <spi_set_command+0xc2>
    156e:	4789                	li	a5,2
    // Writing a command while not ready produces an error
    if (spi_get_ready(spi) != SPI_TRISTATE_TRUE) flags |= SPI_FLAG_NOT_READY;
    1570:	4705                	li	a4,1
    1572:	00e78863          	beq	a5,a4,1582 <spi_set_command+0xd4>
    1576:	fec42783          	lw	a5,-20(s0)
    157a:	0807e793          	ori	a5,a5,128
    157e:	fef42623          	sw	a5,-20(s0)
    if (flags) return flags;
    1582:	fec42783          	lw	a5,-20(s0)
    1586:	c781                	beqz	a5,158e <spi_set_command+0xe0>
    1588:	fec42783          	lw	a5,-20(s0)
    158c:	a039                	j	159a <spi_set_command+0xec>

    SPI_HW(spi)->COMMAND = cmd_reg;
    158e:	fcc42783          	lw	a5,-52(s0)
    1592:	fc842703          	lw	a4,-56(s0)
    1596:	d3d8                	sw	a4,36(a5)
    return SPI_FLAG_OK;
    1598:	4781                	li	a5,0
}
    159a:	853e                	mv	a0,a5
    159c:	50f2                	lw	ra,60(sp)
    159e:	5462                	lw	s0,56(sp)
    15a0:	6121                	addi	sp,sp,64
    15a2:	8082                	ret

000015a4 <spi_write_word>:

spi_return_flags_e spi_write_word(spi_host_t* spi, uint32_t wdata)
{
    15a4:	1101                	addi	sp,sp,-32
    15a6:	ce06                	sw	ra,28(sp)
    15a8:	cc22                	sw	s0,24(sp)
    15aa:	1000                	addi	s0,sp,32
    15ac:	fea42623          	sw	a0,-20(s0)
    15b0:	feb42423          	sw	a1,-24(s0)
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
    15b4:	fec42783          	lw	a5,-20(s0)
    15b8:	e399                	bnez	a5,15be <spi_write_word+0x1a>
    15ba:	4785                	li	a5,1
    15bc:	a01d                	j	15e2 <spi_write_word+0x3e>
    // Check we're not overflowing
    if (spi_get_tx_queue_depth(spi) >= SPI_HOST_PARAM_TX_DEPTH) 
    15be:	fec42503          	lw	a0,-20(s0)
    15c2:	39c5                	jal	12b2 <spi_get_tx_queue_depth>
    15c4:	87aa                	mv	a5,a0
    15c6:	873e                	mv	a4,a5
    15c8:	04700793          	li	a5,71
    15cc:	00e7f563          	bgeu	a5,a4,15d6 <spi_write_word+0x32>
        return SPI_FLAG_TX_QUEUE_FULL;
    15d0:	02000793          	li	a5,32
    15d4:	a039                	j	15e2 <spi_write_word+0x3e>
    SPI_HW(spi)->TXDATA = wdata;
    15d6:	fec42783          	lw	a5,-20(s0)
    15da:	fe842703          	lw	a4,-24(s0)
    15de:	d7d8                	sw	a4,44(a5)
    return SPI_FLAG_OK;
    15e0:	4781                	li	a5,0
}
    15e2:	853e                	mv	a0,a5
    15e4:	40f2                	lw	ra,28(sp)
    15e6:	4462                	lw	s0,24(sp)
    15e8:	6105                	addi	sp,sp,32
    15ea:	8082                	ret

000015ec <spi_read_word>:
    SPI_HW(spi)->TXDATA = bdata;
    return SPI_FLAG_OK;
}

spi_return_flags_e spi_read_word(spi_host_t* spi, uint32_t* dst)
{
    15ec:	1101                	addi	sp,sp,-32
    15ee:	ce06                	sw	ra,28(sp)
    15f0:	cc22                	sw	s0,24(sp)
    15f2:	1000                	addi	s0,sp,32
    15f4:	fea42623          	sw	a0,-20(s0)
    15f8:	feb42423          	sw	a1,-24(s0)
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
    15fc:	fec42783          	lw	a5,-20(s0)
    1600:	e399                	bnez	a5,1606 <spi_read_word+0x1a>
    1602:	4785                	li	a5,1
    1604:	a005                	j	1624 <spi_read_word+0x38>
    // Check we're not underflowing
    if (spi_get_rx_queue_depth(spi) == 0) return SPI_FLAG_RX_QUEUE_EMPTY;
    1606:	fec42503          	lw	a0,-20(s0)
    160a:	31d5                	jal	12ee <spi_get_rx_queue_depth>
    160c:	87aa                	mv	a5,a0
    160e:	e781                	bnez	a5,1616 <spi_read_word+0x2a>
    1610:	04000793          	li	a5,64
    1614:	a801                	j	1624 <spi_read_word+0x38>
    *dst = SPI_HW(spi)->RXDATA;
    1616:	fec42783          	lw	a5,-20(s0)
    161a:	5798                	lw	a4,40(a5)
    161c:	fe842783          	lw	a5,-24(s0)
    1620:	c398                	sw	a4,0(a5)
    return SPI_FLAG_OK;
    1622:	4781                	li	a5,0
}
    1624:	853e                	mv	a0,a5
    1626:	40f2                	lw	ra,28(sp)
    1628:	4462                	lw	s0,24(sp)
    162a:	6105                	addi	sp,sp,32
    162c:	8082                	ret

0000162e <spi_enable_evt_intr>:

spi_return_flags_e spi_enable_evt_intr(spi_host_t* spi, bool enable)
{
    162e:	1101                	addi	sp,sp,-32
    1630:	ce06                	sw	ra,28(sp)
    1632:	cc22                	sw	s0,24(sp)
    1634:	1000                	addi	s0,sp,32
    1636:	fea42623          	sw	a0,-20(s0)
    163a:	87ae                	mv	a5,a1
    163c:	fef405a3          	sb	a5,-21(s0)
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
    1640:	fec42783          	lw	a5,-20(s0)
    1644:	e399                	bnez	a5,164a <spi_enable_evt_intr+0x1c>
    1646:	4785                	li	a5,1
    1648:	a005                	j	1668 <spi_enable_evt_intr+0x3a>
    SPI_HW(spi)->INTR_ENABLE = bitfield_write(SPI_HW(spi)->INTR_ENABLE, BIT_MASK_1, 
    164a:	fec42783          	lw	a5,-20(s0)
    164e:	43dc                	lw	a5,4(a5)
    1650:	feb44703          	lbu	a4,-21(s0)
    1654:	86ba                	mv	a3,a4
    1656:	4605                	li	a2,1
    1658:	4585                	li	a1,1
    165a:	853e                	mv	a0,a5
    165c:	34cd                	jal	113e <bitfield_write.lto_priv.3>
    165e:	872a                	mv	a4,a0
    1660:	fec42783          	lw	a5,-20(s0)
    1664:	c3d8                	sw	a4,4(a5)
                                              SPI_HOST_INTR_ENABLE_SPI_EVENT_BIT, 
                                              enable);
    return SPI_FLAG_OK;
    1666:	4781                	li	a5,0
}
    1668:	853e                	mv	a0,a5
    166a:	40f2                	lw	ra,28(sp)
    166c:	4462                	lw	s0,24(sp)
    166e:	6105                	addi	sp,sp,32
    1670:	8082                	ret

00001672 <spi_enable_error_intr>:

spi_return_flags_e spi_enable_error_intr(spi_host_t* spi, bool enable)
{
    1672:	1101                	addi	sp,sp,-32
    1674:	ce06                	sw	ra,28(sp)
    1676:	cc22                	sw	s0,24(sp)
    1678:	1000                	addi	s0,sp,32
    167a:	fea42623          	sw	a0,-20(s0)
    167e:	87ae                	mv	a5,a1
    1680:	fef405a3          	sb	a5,-21(s0)
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
    1684:	fec42783          	lw	a5,-20(s0)
    1688:	e399                	bnez	a5,168e <spi_enable_error_intr+0x1c>
    168a:	4785                	li	a5,1
    168c:	a005                	j	16ac <spi_enable_error_intr+0x3a>
    SPI_HW(spi)->INTR_ENABLE = bitfield_write(SPI_HW(spi)->INTR_ENABLE, BIT_MASK_1, 
    168e:	fec42783          	lw	a5,-20(s0)
    1692:	43dc                	lw	a5,4(a5)
    1694:	feb44703          	lbu	a4,-21(s0)
    1698:	86ba                	mv	a3,a4
    169a:	4601                	li	a2,0
    169c:	4585                	li	a1,1
    169e:	853e                	mv	a0,a5
    16a0:	3c79                	jal	113e <bitfield_write.lto_priv.3>
    16a2:	872a                	mv	a4,a0
    16a4:	fec42783          	lw	a5,-20(s0)
    16a8:	c3d8                	sw	a4,4(a5)
                                              SPI_HOST_INTR_STATE_ERROR_BIT, 
                                              enable);
    return SPI_FLAG_OK;
    16aa:	4781                	li	a5,0
}
    16ac:	853e                	mv	a0,a5
    16ae:	40f2                	lw	ra,28(sp)
    16b0:	4462                	lw	s0,24(sp)
    16b2:	6105                	addi	sp,sp,32
    16b4:	8082                	ret

000016b6 <spi_output_enable>:

spi_return_flags_e spi_output_enable(spi_host_t* spi, bool enable)
{
    16b6:	1101                	addi	sp,sp,-32
    16b8:	ce06                	sw	ra,28(sp)
    16ba:	cc22                	sw	s0,24(sp)
    16bc:	1000                	addi	s0,sp,32
    16be:	fea42623          	sw	a0,-20(s0)
    16c2:	87ae                	mv	a5,a1
    16c4:	fef405a3          	sb	a5,-21(s0)
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
    16c8:	fec42783          	lw	a5,-20(s0)
    16cc:	e399                	bnez	a5,16d2 <spi_output_enable+0x1c>
    16ce:	4785                	li	a5,1
    16d0:	a005                	j	16f0 <spi_output_enable+0x3a>
    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, BIT_MASK_1, 
    16d2:	fec42783          	lw	a5,-20(s0)
    16d6:	4b9c                	lw	a5,16(a5)
    16d8:	feb44703          	lbu	a4,-21(s0)
    16dc:	86ba                	mv	a3,a4
    16de:	4675                	li	a2,29
    16e0:	4585                	li	a1,1
    16e2:	853e                	mv	a0,a5
    16e4:	3ca9                	jal	113e <bitfield_write.lto_priv.3>
    16e6:	872a                	mv	a4,a0
    16e8:	fec42783          	lw	a5,-20(s0)
    16ec:	cb98                	sw	a4,16(a5)
                                          SPI_HOST_CONTROL_OUTPUT_EN_BIT, enable);
    return SPI_FLAG_OK;
    16ee:	4781                	li	a5,0
}
    16f0:	853e                	mv	a0,a5
    16f2:	40f2                	lw	ra,28(sp)
    16f4:	4462                	lw	s0,24(sp)
    16f6:	6105                	addi	sp,sp,32
    16f8:	8082                	ret

000016fa <fic_irq_spi>:
    }
}

// FIC SPI Host 1 interrupt handler
void fic_irq_spi(void)
{
    16fa:	1101                	addi	sp,sp,-32
    16fc:	ce06                	sw	ra,28(sp)
    16fe:	cc22                	sw	s0,24(sp)
    1700:	1000                	addi	s0,sp,32
    spi_error_e errors;
    // Get errors and check if error triggered the interrupt
    spi_get_errors(spi_host1, &errors);
    1702:	fec40793          	addi	a5,s0,-20
    1706:	85be                	mv	a1,a5
    1708:	30010537          	lui	a0,0x30010
    170c:	36a5                	jal	1274 <spi_get_errors>
    if (errors) {
    170e:	fec42783          	lw	a5,-20(s0)
    1712:	c799                	beqz	a5,1720 <fic_irq_spi+0x26>
        // Call either weak error handler in this module, or user implementation
        spi_intr_handler_error_host(errors);
    1714:	fec42783          	lw	a5,-20(s0)
    1718:	853e                	mv	a0,a5
    171a:	0e0010ef          	jal	27fa <spi_intr_handler_error_host>
        spi_acknowledge_event(spi_host1);
        spi_get_events(spi_host1, &events);
        // Call either weak event handler in this module, or user implementation
        spi_intr_handler_event_host(events);
    }
}
    171e:	a839                	j	173c <fic_irq_spi+0x42>
        spi_acknowledge_event(spi_host1);
    1720:	30010537          	lui	a0,0x30010
    1724:	2abd                	jal	18a2 <spi_acknowledge_event>
        spi_get_events(spi_host1, &events);
    1726:	fe840793          	addi	a5,s0,-24
    172a:	85be                	mv	a1,a5
    172c:	30010537          	lui	a0,0x30010
    1730:	208d                	jal	1792 <spi_get_events>
        spi_intr_handler_event_host(events);
    1732:	fe842783          	lw	a5,-24(s0)
    1736:	853e                	mv	a0,a5
    1738:	090010ef          	jal	27c8 <spi_intr_handler_event_host>
}
    173c:	0001                	nop
    173e:	40f2                	lw	ra,28(sp)
    1740:	4462                	lw	s0,24(sp)
    1742:	6105                	addi	sp,sp,32
    1744:	8082                	ret

00001746 <fic_irq_spi_flash>:

// FIC SPI Flash interrupt handler
void fic_irq_spi_flash(void)
{
    1746:	1101                	addi	sp,sp,-32
    1748:	ce06                	sw	ra,28(sp)
    174a:	cc22                	sw	s0,24(sp)
    174c:	1000                	addi	s0,sp,32
    spi_error_e errors;
    // Get errors and check if error triggered the interrupt
    spi_get_errors(spi_flash, &errors);
    174e:	fec40793          	addi	a5,s0,-20
    1752:	85be                	mv	a1,a5
    1754:	20020537          	lui	a0,0x20020
    1758:	3e31                	jal	1274 <spi_get_errors>
    if (errors) {
    175a:	fec42783          	lw	a5,-20(s0)
    175e:	c799                	beqz	a5,176c <fic_irq_spi_flash+0x26>
        // Call either weak error handler in this module, or user implementation
        spi_intr_handler_error_flash(errors);
    1760:	fec42783          	lw	a5,-20(s0)
    1764:	853e                	mv	a0,a5
    1766:	030010ef          	jal	2796 <spi_intr_handler_error_flash>
        spi_acknowledge_event(spi_flash);
        spi_get_events(spi_flash, &events);
        // Call either weak event handler in this module, or user implementation
        spi_intr_handler_event_flash(events);
    }
}
    176a:	a839                	j	1788 <fic_irq_spi_flash+0x42>
        spi_acknowledge_event(spi_flash);
    176c:	20020537          	lui	a0,0x20020
    1770:	2a0d                	jal	18a2 <spi_acknowledge_event>
        spi_get_events(spi_flash, &events);
    1772:	fe840793          	addi	a5,s0,-24
    1776:	85be                	mv	a1,a5
    1778:	20020537          	lui	a0,0x20020
    177c:	2819                	jal	1792 <spi_get_events>
        spi_intr_handler_event_flash(events);
    177e:	fe842783          	lw	a5,-24(s0)
    1782:	853e                	mv	a0,a5
    1784:	7e1000ef          	jal	2764 <spi_intr_handler_event_flash>
}
    1788:	0001                	nop
    178a:	40f2                	lw	ra,28(sp)
    178c:	4462                	lw	s0,24(sp)
    178e:	6105                	addi	sp,sp,32
    1790:	8082                	ret

00001792 <spi_get_events>:
/**                                                                        **/
/*                            LOCAL FUNCTIONS                               */
/**                                                                        **/
/****************************************************************************/

spi_return_flags_e spi_get_events(spi_host_t* spi, spi_event_e* events) {
    1792:	7179                	addi	sp,sp,-48
    1794:	d606                	sw	ra,44(sp)
    1796:	d422                	sw	s0,40(sp)
    1798:	1800                	addi	s0,sp,48
    179a:	fca42e23          	sw	a0,-36(s0)
    179e:	fcb42c23          	sw	a1,-40(s0)
    17a2:	fdc42783          	lw	a5,-36(s0)
    17a6:	fef42623          	sw	a5,-20(s0)
    status.value = SPI_HW(spi)->STATUS; // Assuming SPI_HW(spi)->STATUS returns a uint32_t value representing the status
    17aa:	fec42783          	lw	a5,-20(s0)
    17ae:	4bdc                	lw	a5,20(a5)
    17b0:	fef42223          	sw	a5,-28(s0)
    return status;
    17b4:	fe442783          	lw	a5,-28(s0)
    17b8:	fef42423          	sw	a5,-24(s0)
    // variable to the event handlers.
    volatile spi_status_t status = spi_get_status(spi);
    // Also, we do not need any NULL check since this function is made to be called
    // __ONLY__ from `handler_irq_spi`, `fic_irq_spi`, `fic_irq_spi_flash`.
    // Therefore we know that spi argument will not be NULL.
    *events = bitfield_write(*events, BIT_MASK_1, 
    17bc:	fd842783          	lw	a5,-40(s0)
    17c0:	4398                	lw	a4,0(a5)
                             SPI_HOST_EVENT_ENABLE_RXFULL_BIT,  status.rxfull);
    17c2:	fe842783          	lw	a5,-24(s0)
    17c6:	83e5                	srli	a5,a5,0x19
    17c8:	8b85                	andi	a5,a5,1
    17ca:	0ff7f793          	zext.b	a5,a5
    *events = bitfield_write(*events, BIT_MASK_1, 
    17ce:	86be                	mv	a3,a5
    17d0:	4601                	li	a2,0
    17d2:	4585                	li	a1,1
    17d4:	853a                	mv	a0,a4
    17d6:	32a5                	jal	113e <bitfield_write.lto_priv.3>
    17d8:	872a                	mv	a4,a0
    17da:	fd842783          	lw	a5,-40(s0)
    17de:	c398                	sw	a4,0(a5)
    *events = bitfield_write(*events, BIT_MASK_1, 
    17e0:	fd842783          	lw	a5,-40(s0)
    17e4:	4398                	lw	a4,0(a5)
                             SPI_HOST_EVENT_ENABLE_TXEMPTY_BIT, status.txempty);
    17e6:	fe842783          	lw	a5,-24(s0)
    17ea:	83f1                	srli	a5,a5,0x1c
    17ec:	8b85                	andi	a5,a5,1
    17ee:	0ff7f793          	zext.b	a5,a5
    *events = bitfield_write(*events, BIT_MASK_1, 
    17f2:	86be                	mv	a3,a5
    17f4:	4605                	li	a2,1
    17f6:	4585                	li	a1,1
    17f8:	853a                	mv	a0,a4
    17fa:	3291                	jal	113e <bitfield_write.lto_priv.3>
    17fc:	872a                	mv	a4,a0
    17fe:	fd842783          	lw	a5,-40(s0)
    1802:	c398                	sw	a4,0(a5)
    *events = bitfield_write(*events, BIT_MASK_1, 
    1804:	fd842783          	lw	a5,-40(s0)
    1808:	4398                	lw	a4,0(a5)
                             SPI_HOST_EVENT_ENABLE_RXWM_BIT,    status.rxwm);
    180a:	fe842783          	lw	a5,-24(s0)
    180e:	83d1                	srli	a5,a5,0x14
    1810:	8b85                	andi	a5,a5,1
    1812:	0ff7f793          	zext.b	a5,a5
    *events = bitfield_write(*events, BIT_MASK_1, 
    1816:	86be                	mv	a3,a5
    1818:	4609                	li	a2,2
    181a:	4585                	li	a1,1
    181c:	853a                	mv	a0,a4
    181e:	3205                	jal	113e <bitfield_write.lto_priv.3>
    1820:	872a                	mv	a4,a0
    1822:	fd842783          	lw	a5,-40(s0)
    1826:	c398                	sw	a4,0(a5)
    *events = bitfield_write(*events, BIT_MASK_1, 
    1828:	fd842783          	lw	a5,-40(s0)
    182c:	4398                	lw	a4,0(a5)
                             SPI_HOST_EVENT_ENABLE_TXWM_BIT,    status.txwm);
    182e:	fe842783          	lw	a5,-24(s0)
    1832:	83e9                	srli	a5,a5,0x1a
    1834:	8b85                	andi	a5,a5,1
    1836:	0ff7f793          	zext.b	a5,a5
    *events = bitfield_write(*events, BIT_MASK_1, 
    183a:	86be                	mv	a3,a5
    183c:	460d                	li	a2,3
    183e:	4585                	li	a1,1
    1840:	853a                	mv	a0,a4
    1842:	38f5                	jal	113e <bitfield_write.lto_priv.3>
    1844:	872a                	mv	a4,a0
    1846:	fd842783          	lw	a5,-40(s0)
    184a:	c398                	sw	a4,0(a5)
    *events = bitfield_write(*events, BIT_MASK_1, 
    184c:	fd842783          	lw	a5,-40(s0)
    1850:	4398                	lw	a4,0(a5)
                             SPI_HOST_EVENT_ENABLE_READY_BIT,   status.ready);
    1852:	fe842783          	lw	a5,-24(s0)
    1856:	83fd                	srli	a5,a5,0x1f
    1858:	0ff7f793          	zext.b	a5,a5
    *events = bitfield_write(*events, BIT_MASK_1, 
    185c:	86be                	mv	a3,a5
    185e:	4611                	li	a2,4
    1860:	4585                	li	a1,1
    1862:	853a                	mv	a0,a4
    1864:	38e9                	jal	113e <bitfield_write.lto_priv.3>
    1866:	872a                	mv	a4,a0
    1868:	fd842783          	lw	a5,-40(s0)
    186c:	c398                	sw	a4,0(a5)
    *events = bitfield_write(*events, BIT_MASK_1, 
    186e:	fd842783          	lw	a5,-40(s0)
    1872:	4398                	lw	a4,0(a5)
                             SPI_HOST_EVENT_ENABLE_IDLE_BIT,   ~status.active);
    1874:	fe842783          	lw	a5,-24(s0)
    1878:	83f9                	srli	a5,a5,0x1e
    187a:	8b85                	andi	a5,a5,1
    187c:	0ff7f793          	zext.b	a5,a5
    1880:	fff7c793          	not	a5,a5
    *events = bitfield_write(*events, BIT_MASK_1, 
    1884:	86be                	mv	a3,a5
    1886:	4615                	li	a2,5
    1888:	4585                	li	a1,1
    188a:	853a                	mv	a0,a4
    188c:	384d                	jal	113e <bitfield_write.lto_priv.3>
    188e:	872a                	mv	a4,a0
    1890:	fd842783          	lw	a5,-40(s0)
    1894:	c398                	sw	a4,0(a5)
    return SPI_FLAG_OK;
    1896:	4781                	li	a5,0
}
    1898:	853e                	mv	a0,a5
    189a:	50b2                	lw	ra,44(sp)
    189c:	5422                	lw	s0,40(sp)
    189e:	6145                	addi	sp,sp,48
    18a0:	8082                	ret

000018a2 <spi_acknowledge_event>:

spi_return_flags_e spi_acknowledge_event(spi_host_t* spi) {
    18a2:	1101                	addi	sp,sp,-32
    18a4:	ce06                	sw	ra,28(sp)
    18a6:	cc22                	sw	s0,24(sp)
    18a8:	1000                	addi	s0,sp,32
    18aa:	fea42623          	sw	a0,-20(s0)
    // We do not need any NULL check since this function is made to be called
    // __ONLY__ from `handler_irq_spi`, `fic_irq_spi`, `fic_irq_spi_flash`.
    // Therefore we know that spi argument will not be NULL.
    SPI_HW(spi)->INTR_STATE = bitfield_write(SPI_HW(spi)->INTR_STATE, BIT_MASK_1, 
    18ae:	fec42783          	lw	a5,-20(s0)
    18b2:	439c                	lw	a5,0(a5)
    18b4:	4685                	li	a3,1
    18b6:	4605                	li	a2,1
    18b8:	4585                	li	a1,1
    18ba:	853e                	mv	a0,a5
    18bc:	3049                	jal	113e <bitfield_write.lto_priv.3>
    18be:	872a                	mv	a4,a0
    18c0:	fec42783          	lw	a5,-20(s0)
    18c4:	c398                	sw	a4,0(a5)
                                             SPI_HOST_INTR_STATE_SPI_EVENT_BIT, true);
    return SPI_FLAG_OK;
    18c6:	4781                	li	a5,0
}
    18c8:	853e                	mv	a0,a5
    18ca:	40f2                	lw	ra,28(sp)
    18cc:	4462                	lw	s0,24(sp)
    18ce:	6105                	addi	sp,sp,32
    18d0:	8082                	ret

000018d2 <bitfield_field32_read.lto_priv.3>:
                                      bitfield_field32_t field) {
    18d2:	1101                	addi	sp,sp,-32
    18d4:	ce06                	sw	ra,28(sp)
    18d6:	cc22                	sw	s0,24(sp)
    18d8:	1000                	addi	s0,sp,32
    18da:	fea42623          	sw	a0,-20(s0)
    18de:	feb42223          	sw	a1,-28(s0)
    18e2:	fec42423          	sw	a2,-24(s0)
  return (bitfield >> field.index) & field.mask;
    18e6:	fe842783          	lw	a5,-24(s0)
    18ea:	fec42703          	lw	a4,-20(s0)
    18ee:	00f75733          	srl	a4,a4,a5
    18f2:	fe442783          	lw	a5,-28(s0)
    18f6:	8ff9                	and	a5,a5,a4
}
    18f8:	853e                	mv	a0,a5
    18fa:	40f2                	lw	ra,28(sp)
    18fc:	4462                	lw	s0,24(sp)
    18fe:	6105                	addi	sp,sp,32
    1900:	8082                	ret

00001902 <bitfield_field32_write.lto_priv.5>:
                                       uint32_t value) {
    1902:	1101                	addi	sp,sp,-32
    1904:	ce06                	sw	ra,28(sp)
    1906:	cc22                	sw	s0,24(sp)
    1908:	1000                	addi	s0,sp,32
    190a:	fea42623          	sw	a0,-20(s0)
    190e:	feb42223          	sw	a1,-28(s0)
    1912:	fec42423          	sw	a2,-24(s0)
    1916:	fed42023          	sw	a3,-32(s0)
  bitfield &= ~(field.mask << field.index);
    191a:	fe442703          	lw	a4,-28(s0)
    191e:	fe842783          	lw	a5,-24(s0)
    1922:	00f717b3          	sll	a5,a4,a5
    1926:	fff7c793          	not	a5,a5
    192a:	fec42703          	lw	a4,-20(s0)
    192e:	8ff9                	and	a5,a5,a4
    1930:	fef42623          	sw	a5,-20(s0)
  bitfield |= (value & field.mask) << field.index;
    1934:	fe442703          	lw	a4,-28(s0)
    1938:	fe042783          	lw	a5,-32(s0)
    193c:	8f7d                	and	a4,a4,a5
    193e:	fe842783          	lw	a5,-24(s0)
    1942:	00f717b3          	sll	a5,a4,a5
    1946:	fec42703          	lw	a4,-20(s0)
    194a:	8fd9                	or	a5,a5,a4
    194c:	fef42623          	sw	a5,-20(s0)
  return bitfield;
    1950:	fec42783          	lw	a5,-20(s0)
}
    1954:	853e                	mv	a0,a5
    1956:	40f2                	lw	ra,28(sp)
    1958:	4462                	lw	s0,24(sp)
    195a:	6105                	addi	sp,sp,32
    195c:	8082                	ret

0000195e <bitfield_bit32_to_field32.lto_priv.5>:
    bitfield_bit32_index_t bit_index) {
    195e:	7179                	addi	sp,sp,-48
    1960:	d606                	sw	ra,44(sp)
    1962:	d422                	sw	s0,40(sp)
    1964:	1800                	addi	s0,sp,48
    1966:	fca42e23          	sw	a0,-36(s0)
  return (bitfield_field32_t){
    196a:	4785                	li	a5,1
    196c:	fef42423          	sw	a5,-24(s0)
    1970:	fdc42783          	lw	a5,-36(s0)
    1974:	fef42623          	sw	a5,-20(s0)
    1978:	fe842703          	lw	a4,-24(s0)
    197c:	fec42783          	lw	a5,-20(s0)
    1980:	863a                	mv	a2,a4
    1982:	86be                	mv	a3,a5
    1984:	8732                	mv	a4,a2
    1986:	87b6                	mv	a5,a3
}
    1988:	853a                	mv	a0,a4
    198a:	85be                	mv	a1,a5
    198c:	50b2                	lw	ra,44(sp)
    198e:	5422                	lw	s0,40(sp)
    1990:	6145                	addi	sp,sp,48
    1992:	8082                	ret

00001994 <bitfield_bit32_read.lto_priv.2>:
                                bitfield_bit32_index_t bit_index) {
    1994:	7179                	addi	sp,sp,-48
    1996:	d606                	sw	ra,44(sp)
    1998:	d422                	sw	s0,40(sp)
    199a:	1800                	addi	s0,sp,48
    199c:	fca42e23          	sw	a0,-36(s0)
    19a0:	fcb42c23          	sw	a1,-40(s0)
  return bitfield_field32_read(bitfield,
    19a4:	fd842503          	lw	a0,-40(s0)
    19a8:	3f5d                	jal	195e <bitfield_bit32_to_field32.lto_priv.5>
    19aa:	872a                	mv	a4,a0
    19ac:	87ae                	mv	a5,a1
    19ae:	fee42423          	sw	a4,-24(s0)
    19b2:	fef42623          	sw	a5,-20(s0)
    19b6:	fe842583          	lw	a1,-24(s0)
    19ba:	fec42603          	lw	a2,-20(s0)
    19be:	fdc42503          	lw	a0,-36(s0)
    19c2:	3f01                	jal	18d2 <bitfield_field32_read.lto_priv.3>
    19c4:	87aa                	mv	a5,a0
                               bitfield_bit32_to_field32(bit_index)) == 0x1u;
    19c6:	17fd                	addi	a5,a5,-1 # 7fffffff <syscalls_cpp.cpp.cfa7c3ef+0x7ffec4a9>
    19c8:	0017b793          	seqz	a5,a5
    19cc:	0ff7f793          	zext.b	a5,a5
}
    19d0:	853e                	mv	a0,a5
    19d2:	50b2                	lw	ra,44(sp)
    19d4:	5422                	lw	s0,40(sp)
    19d6:	6145                	addi	sp,sp,48
    19d8:	8082                	ret

000019da <bitfield_bit32_write.lto_priv.5>:
                                     bool value) {
    19da:	7179                	addi	sp,sp,-48
    19dc:	d606                	sw	ra,44(sp)
    19de:	d422                	sw	s0,40(sp)
    19e0:	1800                	addi	s0,sp,48
    19e2:	fca42e23          	sw	a0,-36(s0)
    19e6:	fcb42c23          	sw	a1,-40(s0)
    19ea:	87b2                	mv	a5,a2
    19ec:	fcf40ba3          	sb	a5,-41(s0)
  return bitfield_field32_write(bitfield, bitfield_bit32_to_field32(bit_index),
    19f0:	fd842503          	lw	a0,-40(s0)
    19f4:	37ad                	jal	195e <bitfield_bit32_to_field32.lto_priv.5>
    19f6:	872a                	mv	a4,a0
    19f8:	87ae                	mv	a5,a1
    19fa:	fee42423          	sw	a4,-24(s0)
    19fe:	fef42623          	sw	a5,-20(s0)
    1a02:	fd744783          	lbu	a5,-41(s0)
    1a06:	c399                	beqz	a5,1a0c <bitfield_bit32_write.lto_priv.5+0x32>
    1a08:	4785                	li	a5,1
    1a0a:	a011                	j	1a0e <bitfield_bit32_write.lto_priv.5+0x34>
    1a0c:	4781                	li	a5,0
    1a0e:	86be                	mv	a3,a5
    1a10:	fe842583          	lw	a1,-24(s0)
    1a14:	fec42603          	lw	a2,-20(s0)
    1a18:	fdc42503          	lw	a0,-36(s0)
    1a1c:	35dd                	jal	1902 <bitfield_field32_write.lto_priv.5>
    1a1e:	87aa                	mv	a5,a0
}
    1a20:	853e                	mv	a0,a5
    1a22:	50b2                	lw	ra,44(sp)
    1a24:	5422                	lw	s0,40(sp)
    1a26:	6145                	addi	sp,sp,48
    1a28:	8082                	ret

00001a2a <mmio_region_read32.lto_priv.6>:
static inline uint32_t mmio_region_read32(mmio_region_t base, ptrdiff_t offset) {
    1a2a:	1101                	addi	sp,sp,-32
    1a2c:	ce06                	sw	ra,28(sp)
    1a2e:	cc22                	sw	s0,24(sp)
    1a30:	1000                	addi	s0,sp,32
    1a32:	fea42623          	sw	a0,-20(s0)
    1a36:	feb42423          	sw	a1,-24(s0)
  return ((volatile uint32_t *)base.base)[offset / sizeof(uint32_t)];
    1a3a:	fec42703          	lw	a4,-20(s0)
    1a3e:	fe842783          	lw	a5,-24(s0)
    1a42:	9bf1                	andi	a5,a5,-4
    1a44:	97ba                	add	a5,a5,a4
    1a46:	439c                	lw	a5,0(a5)
}
    1a48:	853e                	mv	a0,a5
    1a4a:	40f2                	lw	ra,28(sp)
    1a4c:	4462                	lw	s0,24(sp)
    1a4e:	6105                	addi	sp,sp,32
    1a50:	8082                	ret

00001a52 <mmio_region_write32.lto_priv.6>:
                                uint32_t value) {
    1a52:	1101                	addi	sp,sp,-32
    1a54:	ce06                	sw	ra,28(sp)
    1a56:	cc22                	sw	s0,24(sp)
    1a58:	1000                	addi	s0,sp,32
    1a5a:	fea42623          	sw	a0,-20(s0)
    1a5e:	feb42423          	sw	a1,-24(s0)
    1a62:	fec42223          	sw	a2,-28(s0)
  ((volatile uint32_t *)base.base)[offset / sizeof(uint32_t)] = value;
    1a66:	fec42703          	lw	a4,-20(s0)
    1a6a:	fe842783          	lw	a5,-24(s0)
    1a6e:	9bf1                	andi	a5,a5,-4
    1a70:	97ba                	add	a5,a5,a4
    1a72:	fe442703          	lw	a4,-28(s0)
    1a76:	c398                	sw	a4,0(a5)
}
    1a78:	0001                	nop
    1a7a:	40f2                	lw	ra,28(sp)
    1a7c:	4462                	lw	s0,24(sp)
    1a7e:	6105                	addi	sp,sp,32
    1a80:	8082                	ret

00001a82 <uart_reset>:
static_assert((1UL << NCO_WIDTH) - 1 == UART_CTRL_NCO_MASK, "Bad value for NCO_WIDTH");
//#else
static_assert((1UL << NCO_WIDTH) - 1 == UART_CTRL_NCO_MASK, "Bad value for NCO_WIDTH");
//#endif

static void uart_reset(const uart_t *uart) {
    1a82:	7179                	addi	sp,sp,-48
    1a84:	d606                	sw	ra,44(sp)
    1a86:	d422                	sw	s0,40(sp)
    1a88:	1800                	addi	s0,sp,48
    1a8a:	fca42e23          	sw	a0,-36(s0)
  mmio_region_write32(uart->base_addr, UART_CTRL_REG_OFFSET, 0u);
    1a8e:	fdc42783          	lw	a5,-36(s0)
    1a92:	4601                	li	a2,0
    1a94:	45b1                	li	a1,12
    1a96:	4388                	lw	a0,0(a5)
    1a98:	3f6d                	jal	1a52 <mmio_region_write32.lto_priv.6>

  // Write to the relevant bits clears the FIFOs.
  uint32_t reg = 0;
    1a9a:	fe042623          	sw	zero,-20(s0)
  reg = bitfield_bit32_write(reg, UART_FIFO_CTRL_RXRST_BIT, true);
    1a9e:	4605                	li	a2,1
    1aa0:	4581                	li	a1,0
    1aa2:	fec42503          	lw	a0,-20(s0)
    1aa6:	3f15                	jal	19da <bitfield_bit32_write.lto_priv.5>
    1aa8:	fea42623          	sw	a0,-20(s0)
  reg = bitfield_bit32_write(reg, UART_FIFO_CTRL_TXRST_BIT, true);
    1aac:	4605                	li	a2,1
    1aae:	4585                	li	a1,1
    1ab0:	fec42503          	lw	a0,-20(s0)
    1ab4:	371d                	jal	19da <bitfield_bit32_write.lto_priv.5>
    1ab6:	fea42623          	sw	a0,-20(s0)
  mmio_region_write32(uart->base_addr, UART_FIFO_CTRL_REG_OFFSET, reg);
    1aba:	fdc42783          	lw	a5,-36(s0)
    1abe:	fec42603          	lw	a2,-20(s0)
    1ac2:	45f1                	li	a1,28
    1ac4:	4388                	lw	a0,0(a5)
    1ac6:	3771                	jal	1a52 <mmio_region_write32.lto_priv.6>

  mmio_region_write32(uart->base_addr, UART_OVRD_REG_OFFSET, 0u);
    1ac8:	fdc42783          	lw	a5,-36(s0)
    1acc:	4601                	li	a2,0
    1ace:	02400593          	li	a1,36
    1ad2:	4388                	lw	a0,0(a5)
    1ad4:	3fbd                	jal	1a52 <mmio_region_write32.lto_priv.6>
  mmio_region_write32(uart->base_addr, UART_TIMEOUT_CTRL_REG_OFFSET, 0u);
    1ad6:	fdc42783          	lw	a5,-36(s0)
    1ada:	4601                	li	a2,0
    1adc:	02c00593          	li	a1,44
    1ae0:	4388                	lw	a0,0(a5)
    1ae2:	3f85                	jal	1a52 <mmio_region_write32.lto_priv.6>
  mmio_region_write32(uart->base_addr, UART_INTR_ENABLE_REG_OFFSET, 0u);
    1ae4:	fdc42783          	lw	a5,-36(s0)
    1ae8:	4601                	li	a2,0
    1aea:	4591                	li	a1,4
    1aec:	4388                	lw	a0,0(a5)
    1aee:	3795                	jal	1a52 <mmio_region_write32.lto_priv.6>
  mmio_region_write32(uart->base_addr, UART_INTR_STATE_REG_OFFSET, UINT32_MAX);
    1af0:	fdc42783          	lw	a5,-36(s0)
    1af4:	567d                	li	a2,-1
    1af6:	4581                	li	a1,0
    1af8:	4388                	lw	a0,0(a5)
    1afa:	3fa1                	jal	1a52 <mmio_region_write32.lto_priv.6>
}
    1afc:	0001                	nop
    1afe:	50b2                	lw	ra,44(sp)
    1b00:	5422                	lw	s0,40(sp)
    1b02:	6145                	addi	sp,sp,48
    1b04:	8082                	ret

00001b06 <uart_init>:

system_error_t uart_init(const uart_t *uart) {
    1b06:	7179                	addi	sp,sp,-48
    1b08:	d606                	sw	ra,44(sp)
    1b0a:	d422                	sw	s0,40(sp)
    1b0c:	1800                	addi	s0,sp,48
    1b0e:	fca42e23          	sw	a0,-36(s0)
  if (uart == NULL) {
    1b12:	fdc42783          	lw	a5,-36(s0)
    1b16:	e791                	bnez	a5,1b22 <uart_init+0x1c>
    return kErrorUartInvalidArgument;
    1b18:	014157b7          	lui	a5,0x1415
    1b1c:	50378793          	addi	a5,a5,1283 # 1415503 <syscalls_cpp.cpp.cfa7c3ef+0x14019ad>
    1b20:	a0f9                	j	1bee <uart_init+0xe8>
  }

  if (uart->baudrate == 0 || uart->clk_freq_hz == 0) {
    1b22:	fdc42783          	lw	a5,-36(s0)
    1b26:	43dc                	lw	a5,4(a5)
    1b28:	c789                	beqz	a5,1b32 <uart_init+0x2c>
    1b2a:	fdc42783          	lw	a5,-36(s0)
    1b2e:	4b9c                	lw	a5,16(a5)
    1b30:	e791                	bnez	a5,1b3c <uart_init+0x36>
    return kErrorUartInvalidArgument;
    1b32:	014157b7          	lui	a5,0x1415
    1b36:	50378793          	addi	a5,a5,1283 # 1415503 <syscalls_cpp.cpp.cfa7c3ef+0x14019ad>
    1b3a:	a855                	j	1bee <uart_init+0xe8>
  }

  uint32_t nco_masked = uart->nco & UART_CTRL_NCO_MASK;
    1b3c:	fdc42783          	lw	a5,-36(s0)
    1b40:	4798                	lw	a4,8(a5)
    1b42:	47dc                	lw	a5,12(a5)
    1b44:	87ba                	mv	a5,a4
    1b46:	0807c7b3          	zext.h	a5,a5
    1b4a:	fef42623          	sw	a5,-20(s0)

  // Requested baudrate is too high for the given clock frequency.
  if (uart->nco != nco_masked) {
    1b4e:	fdc42783          	lw	a5,-36(s0)
    1b52:	4798                	lw	a4,8(a5)
    1b54:	47dc                	lw	a5,12(a5)
    1b56:	fec42583          	lw	a1,-20(s0)
    1b5a:	862e                	mv	a2,a1
    1b5c:	4681                	li	a3,0
    1b5e:	853a                	mv	a0,a4
    1b60:	85b2                	mv	a1,a2
    1b62:	00b51663          	bne	a0,a1,1b6e <uart_init+0x68>
    1b66:	873e                	mv	a4,a5
    1b68:	87b6                	mv	a5,a3
    1b6a:	00f70763          	beq	a4,a5,1b78 <uart_init+0x72>
    return kErrorUartBadBaudRate;
    1b6e:	024157b7          	lui	a5,0x2415
    1b72:	50378793          	addi	a5,a5,1283 # 2415503 <syscalls_cpp.cpp.cfa7c3ef+0x24019ad>
    1b76:	a8a5                	j	1bee <uart_init+0xe8>
  }

  // Must be called before the first write to any of the UART registers.
  uart_reset(uart);
    1b78:	fdc42503          	lw	a0,-36(s0)
    1b7c:	3719                	jal	1a82 <uart_reset>

  // Set baudrate, TX, no parity bits.
  uint32_t reg = 0;
    1b7e:	fe042423          	sw	zero,-24(s0)
  reg = bitfield_field32_write(reg, UART_CTRL_NCO_FIELD, nco_masked);
    1b82:	67c1                	lui	a5,0x10
    1b84:	17fd                	addi	a5,a5,-1 # ffff <syscalls.c.a8cea518+0x5d4>
    1b86:	fef42023          	sw	a5,-32(s0)
    1b8a:	47c1                	li	a5,16
    1b8c:	fef42223          	sw	a5,-28(s0)
    1b90:	fec42683          	lw	a3,-20(s0)
    1b94:	fe042583          	lw	a1,-32(s0)
    1b98:	fe442603          	lw	a2,-28(s0)
    1b9c:	fe842503          	lw	a0,-24(s0)
    1ba0:	338d                	jal	1902 <bitfield_field32_write.lto_priv.5>
    1ba2:	fea42423          	sw	a0,-24(s0)
  reg = bitfield_bit32_write(reg, UART_CTRL_TX_BIT, true);
    1ba6:	4605                	li	a2,1
    1ba8:	4581                	li	a1,0
    1baa:	fe842503          	lw	a0,-24(s0)
    1bae:	3535                	jal	19da <bitfield_bit32_write.lto_priv.5>
    1bb0:	fea42423          	sw	a0,-24(s0)
  reg = bitfield_bit32_write(reg, UART_CTRL_PARITY_EN_BIT, false);
    1bb4:	4601                	li	a2,0
    1bb6:	4599                	li	a1,6
    1bb8:	fe842503          	lw	a0,-24(s0)
    1bbc:	3d39                	jal	19da <bitfield_bit32_write.lto_priv.5>
    1bbe:	fea42423          	sw	a0,-24(s0)
  reg = bitfield_bit32_write(reg, UART_CTRL_RX_BIT, true);
    1bc2:	4605                	li	a2,1
    1bc4:	4585                	li	a1,1
    1bc6:	fe842503          	lw	a0,-24(s0)
    1bca:	3d01                	jal	19da <bitfield_bit32_write.lto_priv.5>
    1bcc:	fea42423          	sw	a0,-24(s0)
  mmio_region_write32(uart->base_addr, UART_CTRL_REG_OFFSET, reg);
    1bd0:	fdc42783          	lw	a5,-36(s0)
    1bd4:	fe842603          	lw	a2,-24(s0)
    1bd8:	45b1                	li	a1,12
    1bda:	4388                	lw	a0,0(a5)
    1bdc:	3d9d                	jal	1a52 <mmio_region_write32.lto_priv.6>

  // Disable interrupts.
  mmio_region_write32(uart->base_addr, UART_INTR_ENABLE_REG_OFFSET, 0u);
    1bde:	fdc42783          	lw	a5,-36(s0)
    1be2:	4601                	li	a2,0
    1be4:	4591                	li	a1,4
    1be6:	4388                	lw	a0,0(a5)
    1be8:	35ad                	jal	1a52 <mmio_region_write32.lto_priv.6>
  return kErrorOk;
    1bea:	73900793          	li	a5,1849
}
    1bee:	853e                	mv	a0,a5
    1bf0:	50b2                	lw	ra,44(sp)
    1bf2:	5422                	lw	s0,40(sp)
    1bf4:	6145                	addi	sp,sp,48
    1bf6:	8082                	ret

00001bf8 <uart_tx_full>:

static bool uart_tx_full(const uart_t *uart) {
    1bf8:	7179                	addi	sp,sp,-48
    1bfa:	d606                	sw	ra,44(sp)
    1bfc:	d422                	sw	s0,40(sp)
    1bfe:	1800                	addi	s0,sp,48
    1c00:	fca42e23          	sw	a0,-36(s0)
  uint32_t reg = mmio_region_read32(uart->base_addr, UART_STATUS_REG_OFFSET);
    1c04:	fdc42783          	lw	a5,-36(s0)
    1c08:	45c1                	li	a1,16
    1c0a:	4388                	lw	a0,0(a5)
    1c0c:	3d39                	jal	1a2a <mmio_region_read32.lto_priv.6>
    1c0e:	fea42623          	sw	a0,-20(s0)
  return bitfield_bit32_read(reg, UART_STATUS_TXFULL_BIT);
    1c12:	4581                	li	a1,0
    1c14:	fec42503          	lw	a0,-20(s0)
    1c18:	3bb5                	jal	1994 <bitfield_bit32_read.lto_priv.2>
    1c1a:	87aa                	mv	a5,a0
}
    1c1c:	853e                	mv	a0,a5
    1c1e:	50b2                	lw	ra,44(sp)
    1c20:	5422                	lw	s0,40(sp)
    1c22:	6145                	addi	sp,sp,48
    1c24:	8082                	ret

00001c26 <uart_tx_idle>:

static bool uart_tx_idle(const uart_t *uart) {
    1c26:	7179                	addi	sp,sp,-48
    1c28:	d606                	sw	ra,44(sp)
    1c2a:	d422                	sw	s0,40(sp)
    1c2c:	1800                	addi	s0,sp,48
    1c2e:	fca42e23          	sw	a0,-36(s0)
  uint32_t reg = mmio_region_read32(uart->base_addr, UART_STATUS_REG_OFFSET);
    1c32:	fdc42783          	lw	a5,-36(s0)
    1c36:	45c1                	li	a1,16
    1c38:	4388                	lw	a0,0(a5)
    1c3a:	3bc5                	jal	1a2a <mmio_region_read32.lto_priv.6>
    1c3c:	fea42623          	sw	a0,-20(s0)
  return bitfield_bit32_read(reg, UART_STATUS_TXIDLE_BIT);
    1c40:	458d                	li	a1,3
    1c42:	fec42503          	lw	a0,-20(s0)
    1c46:	33b9                	jal	1994 <bitfield_bit32_read.lto_priv.2>
    1c48:	87aa                	mv	a5,a0
}
    1c4a:	853e                	mv	a0,a5
    1c4c:	50b2                	lw	ra,44(sp)
    1c4e:	5422                	lw	s0,40(sp)
    1c50:	6145                	addi	sp,sp,48
    1c52:	8082                	ret

00001c54 <uart_putchar>:
static bool uart_rx_empty(const uart_t *uart) {
  uint32_t reg = mmio_region_read32(uart->base_addr, UART_STATUS_REG_OFFSET);
  return bitfield_bit32_read(reg, UART_STATUS_RXEMPTY_BIT);
}

void uart_putchar(const uart_t *uart, uint8_t byte) {
    1c54:	7179                	addi	sp,sp,-48
    1c56:	d606                	sw	ra,44(sp)
    1c58:	d422                	sw	s0,40(sp)
    1c5a:	1800                	addi	s0,sp,48
    1c5c:	fca42e23          	sw	a0,-36(s0)
    1c60:	87ae                	mv	a5,a1
    1c62:	fcf40da3          	sb	a5,-37(s0)
  // If the transmit FIFO is full, wait.
  while (uart_tx_full(uart)) {
    1c66:	0001                	nop
    1c68:	fdc42503          	lw	a0,-36(s0)
    1c6c:	3771                	jal	1bf8 <uart_tx_full>
    1c6e:	87aa                	mv	a5,a0
    1c70:	ffe5                	bnez	a5,1c68 <uart_putchar+0x14>
  }
  uint32_t reg = bitfield_field32_write(0, UART_WDATA_WDATA_FIELD, byte);
    1c72:	0ff00793          	li	a5,255
    1c76:	fef42223          	sw	a5,-28(s0)
    1c7a:	fe042423          	sw	zero,-24(s0)
    1c7e:	fdb44783          	lbu	a5,-37(s0)
    1c82:	86be                	mv	a3,a5
    1c84:	fe442583          	lw	a1,-28(s0)
    1c88:	fe842603          	lw	a2,-24(s0)
    1c8c:	4501                	li	a0,0
    1c8e:	3995                	jal	1902 <bitfield_field32_write.lto_priv.5>
    1c90:	fea42623          	sw	a0,-20(s0)
  mmio_region_write32(uart->base_addr, UART_WDATA_REG_OFFSET, reg);
    1c94:	fdc42783          	lw	a5,-36(s0)
    1c98:	fec42603          	lw	a2,-20(s0)
    1c9c:	45e1                	li	a1,24
    1c9e:	4388                	lw	a0,0(a5)
    1ca0:	3b4d                	jal	1a52 <mmio_region_write32.lto_priv.6>

  // If the transmitter is active, wait.
  while (!uart_tx_idle(uart)) {
    1ca2:	0001                	nop
    1ca4:	fdc42503          	lw	a0,-36(s0)
    1ca8:	3fbd                	jal	1c26 <uart_tx_idle>
    1caa:	87aa                	mv	a5,a0
    1cac:	dfe5                	beqz	a5,1ca4 <uart_putchar+0x50>
  }
}
    1cae:	0001                	nop
    1cb0:	0001                	nop
    1cb2:	50b2                	lw	ra,44(sp)
    1cb4:	5422                	lw	s0,40(sp)
    1cb6:	6145                	addi	sp,sp,48
    1cb8:	8082                	ret

00001cba <uart_write>:
}

/**
 * Write `len` bytes to the UART TX FIFO.
 */
size_t uart_write(const uart_t *uart, const uint8_t *data, size_t len) {
    1cba:	7179                	addi	sp,sp,-48
    1cbc:	d606                	sw	ra,44(sp)
    1cbe:	d422                	sw	s0,40(sp)
    1cc0:	1800                	addi	s0,sp,48
    1cc2:	fca42e23          	sw	a0,-36(s0)
    1cc6:	fcb42c23          	sw	a1,-40(s0)
    1cca:	fcc42a23          	sw	a2,-44(s0)
  size_t total = len;
    1cce:	fd442783          	lw	a5,-44(s0)
    1cd2:	fef42623          	sw	a5,-20(s0)
  while (len) {
    1cd6:	a01d                	j	1cfc <uart_write+0x42>
    uart_putchar(uart, *data);
    1cd8:	fd842783          	lw	a5,-40(s0)
    1cdc:	0007c783          	lbu	a5,0(a5)
    1ce0:	85be                	mv	a1,a5
    1ce2:	fdc42503          	lw	a0,-36(s0)
    1ce6:	37bd                	jal	1c54 <uart_putchar>
    data++;
    1ce8:	fd842783          	lw	a5,-40(s0)
    1cec:	0785                	addi	a5,a5,1
    1cee:	fcf42c23          	sw	a5,-40(s0)
    len--;
    1cf2:	fd442783          	lw	a5,-44(s0)
    1cf6:	17fd                	addi	a5,a5,-1
    1cf8:	fcf42a23          	sw	a5,-44(s0)
  while (len) {
    1cfc:	fd442783          	lw	a5,-44(s0)
    1d00:	ffe1                	bnez	a5,1cd8 <uart_write+0x1e>
  }
  return total;
    1d02:	fec42783          	lw	a5,-20(s0)
}
    1d06:	853e                	mv	a0,a5
    1d08:	50b2                	lw	ra,44(sp)
    1d0a:	5422                	lw	s0,40(sp)
    1d0c:	6145                	addi	sp,sp,48
    1d0e:	8082                	ret

00001d10 <print_exc_msg>:
/**
 * Default Error Handling
 * @param msg error message supplied by caller
 * TODO - this will be soon by a real print formatting
 */
static void print_exc_msg(const char *msg) {
    1d10:	7179                	addi	sp,sp,-48
    1d12:	d606                	sw	ra,44(sp)
    1d14:	d422                	sw	s0,40(sp)
    1d16:	1800                	addi	s0,sp,48
    1d18:	fca42e23          	sw	a0,-36(s0)
  _writestr(msg );
    1d1c:	fdc42503          	lw	a0,-36(s0)
    1d20:	2929                	jal	213a <_writestr>
  uint32_t mtval; 
  CSR_READ(CSR_REG_MTVAL, &mtval);
    1d22:	343027f3          	csrr	a5,mtval
    1d26:	fef42623          	sw	a5,-20(s0)
  _writestr("MTVAL value is ");
    1d2a:	67a9                	lui	a5,0xa
    1d2c:	51878513          	addi	a0,a5,1304 # a518 <dma.c.e6d7bed9+0x80b>
    1d30:	2129                	jal	213a <_writestr>
  const char p[6] = {(mtval >> 24) & 0xFF, (mtval >> 16) & 0xFF, (mtval >> 8) & 0xFF, mtval & 0xFF, '\n', 0};
    1d32:	fec42783          	lw	a5,-20(s0)
    1d36:	83e1                	srli	a5,a5,0x18
    1d38:	0ff7f793          	zext.b	a5,a5
    1d3c:	fef40223          	sb	a5,-28(s0)
    1d40:	fec42783          	lw	a5,-20(s0)
    1d44:	83c1                	srli	a5,a5,0x10
    1d46:	0ff7f793          	zext.b	a5,a5
    1d4a:	fef402a3          	sb	a5,-27(s0)
    1d4e:	fec42783          	lw	a5,-20(s0)
    1d52:	83a1                	srli	a5,a5,0x8
    1d54:	0ff7f793          	zext.b	a5,a5
    1d58:	fef40323          	sb	a5,-26(s0)
    1d5c:	fec42783          	lw	a5,-20(s0)
    1d60:	0ff7f793          	zext.b	a5,a5
    1d64:	fef403a3          	sb	a5,-25(s0)
    1d68:	47a9                	li	a5,10
    1d6a:	fef40423          	sb	a5,-24(s0)
    1d6e:	fe0404a3          	sb	zero,-23(s0)
  _writestr(p);
    1d72:	fe440793          	addi	a5,s0,-28
    1d76:	853e                	mv	a0,a5
    1d78:	26c9                	jal	213a <_writestr>
  while (1) {
    1d7a:	0001                	nop
    1d7c:	bffd                	j	1d7a <print_exc_msg+0x6a>
	...

00001d80 <handler_exception>:
  };
}

// Below functions are default weak exception handlers meant to be overriden
__attribute__((weak)) void handler_exception(void) {
    1d80:	711d                	addi	sp,sp,-96
    1d82:	ce86                	sw	ra,92(sp)
    1d84:	cc96                	sw	t0,88(sp)
    1d86:	ca9a                	sw	t1,84(sp)
    1d88:	c89e                	sw	t2,80(sp)
    1d8a:	c6a2                	sw	s0,76(sp)
    1d8c:	c4aa                	sw	a0,72(sp)
    1d8e:	c2ae                	sw	a1,68(sp)
    1d90:	c0b2                	sw	a2,64(sp)
    1d92:	de36                	sw	a3,60(sp)
    1d94:	dc3a                	sw	a4,56(sp)
    1d96:	da3e                	sw	a5,52(sp)
    1d98:	d842                	sw	a6,48(sp)
    1d9a:	d646                	sw	a7,44(sp)
    1d9c:	d472                	sw	t3,40(sp)
    1d9e:	d276                	sw	t4,36(sp)
    1da0:	d07a                	sw	t5,32(sp)
    1da2:	ce7e                	sw	t6,28(sp)
    1da4:	1080                	addi	s0,sp,96
  uint32_t mcause;
  exc_id_t exc_cause;

  CSR_READ(CSR_REG_MCAUSE, &mcause);
    1da6:	342027f3          	csrr	a5,mcause
    1daa:	faf42423          	sw	a5,-88(s0)
  exc_cause = (exc_id_t)(mcause & kIdMax);
    1dae:	fa842783          	lw	a5,-88(s0)
    1db2:	8bfd                	andi	a5,a5,31
    1db4:	faf42623          	sw	a5,-84(s0)

  switch (exc_cause) {
    1db8:	fac42703          	lw	a4,-84(s0)
    1dbc:	47ad                	li	a5,11
    1dbe:	08f70463          	beq	a4,a5,1e46 <handler_exception+0xc6>
    1dc2:	fac42703          	lw	a4,-84(s0)
    1dc6:	47ad                	li	a5,11
    1dc8:	08e7e263          	bltu	a5,a4,1e4c <handler_exception+0xcc>
    1dcc:	fac42703          	lw	a4,-84(s0)
    1dd0:	479d                	li	a5,7
    1dd2:	06f70863          	beq	a4,a5,1e42 <handler_exception+0xc2>
    1dd6:	fac42703          	lw	a4,-84(s0)
    1dda:	479d                	li	a5,7
    1ddc:	06e7e863          	bltu	a5,a4,1e4c <handler_exception+0xcc>
    1de0:	fac42703          	lw	a4,-84(s0)
    1de4:	4795                	li	a5,5
    1de6:	04f70c63          	beq	a4,a5,1e3e <handler_exception+0xbe>
    1dea:	fac42703          	lw	a4,-84(s0)
    1dee:	4795                	li	a5,5
    1df0:	04e7ee63          	bltu	a5,a4,1e4c <handler_exception+0xcc>
    1df4:	fac42703          	lw	a4,-84(s0)
    1df8:	478d                	li	a5,3
    1dfa:	04f70063          	beq	a4,a5,1e3a <handler_exception+0xba>
    1dfe:	fac42703          	lw	a4,-84(s0)
    1e02:	478d                	li	a5,3
    1e04:	04e7e463          	bltu	a5,a4,1e4c <handler_exception+0xcc>
    1e08:	fac42703          	lw	a4,-84(s0)
    1e0c:	4789                	li	a5,2
    1e0e:	02f70463          	beq	a4,a5,1e36 <handler_exception+0xb6>
    1e12:	fac42703          	lw	a4,-84(s0)
    1e16:	4789                	li	a5,2
    1e18:	02e7ea63          	bltu	a5,a4,1e4c <handler_exception+0xcc>
    1e1c:	fac42783          	lw	a5,-84(s0)
    1e20:	c799                	beqz	a5,1e2e <handler_exception+0xae>
    1e22:	fac42703          	lw	a4,-84(s0)
    1e26:	4785                	li	a5,1
    1e28:	00f70563          	beq	a4,a5,1e32 <handler_exception+0xb2>
    1e2c:	a005                	j	1e4c <handler_exception+0xcc>
    case kInstMisa:
      handler_instr_acc_fault();
    1e2e:	2845                	jal	1ede <handler_instr_acc_fault>
      break;
    1e30:	a839                	j	1e4e <handler_exception+0xce>
    case kInstAccFault:
      handler_instr_acc_fault();
    1e32:	2075                	jal	1ede <handler_instr_acc_fault>
      break;
    1e34:	a829                	j	1e4e <handler_exception+0xce>
    case kInstIllegalFault:
      handler_instr_ill_fault();
    1e36:	20c9                	jal	1ef8 <handler_instr_ill_fault>
      break;
    1e38:	a819                	j	1e4e <handler_exception+0xce>
    case kBkpt:
      handler_bkpt();
    1e3a:	28e1                	jal	1f12 <handler_bkpt>
      break;
    1e3c:	a809                	j	1e4e <handler_exception+0xce>
    case kLoadAccFault:
      handler_lsu_fault();
    1e3e:	20fd                	jal	1f2c <handler_lsu_fault>
      break;
    1e40:	a039                	j	1e4e <handler_exception+0xce>
    case kStrAccFault:
      handler_lsu_fault();
    1e42:	20ed                	jal	1f2c <handler_lsu_fault>
      break;
    1e44:	a029                	j	1e4e <handler_exception+0xce>
    case kECall:
      handler_ecall();
    1e46:	2201                	jal	1f46 <handler_ecall>
      break;
    1e48:	a019                	j	1e4e <handler_exception+0xce>
    1e4a:	a009                	j	1e4c <handler_exception+0xcc>
    default:
      while (1) {
    1e4c:	bffd                	j	1e4a <handler_exception+0xca>
      };
  }
}
    1e4e:	0001                	nop
    1e50:	40f6                	lw	ra,92(sp)
    1e52:	42e6                	lw	t0,88(sp)
    1e54:	4356                	lw	t1,84(sp)
    1e56:	43c6                	lw	t2,80(sp)
    1e58:	4436                	lw	s0,76(sp)
    1e5a:	4526                	lw	a0,72(sp)
    1e5c:	4596                	lw	a1,68(sp)
    1e5e:	4606                	lw	a2,64(sp)
    1e60:	56f2                	lw	a3,60(sp)
    1e62:	5762                	lw	a4,56(sp)
    1e64:	57d2                	lw	a5,52(sp)
    1e66:	5842                	lw	a6,48(sp)
    1e68:	58b2                	lw	a7,44(sp)
    1e6a:	5e22                	lw	t3,40(sp)
    1e6c:	5e92                	lw	t4,36(sp)
    1e6e:	5f02                	lw	t5,32(sp)
    1e70:	4ff2                	lw	t6,28(sp)
    1e72:	6125                	addi	sp,sp,96
    1e74:	30200073          	mret

00001e78 <handler_irq_software>:

__attribute__((weak)) void handler_irq_software(void) {
    1e78:	715d                	addi	sp,sp,-80
    1e7a:	c686                	sw	ra,76(sp)
    1e7c:	c496                	sw	t0,72(sp)
    1e7e:	c29a                	sw	t1,68(sp)
    1e80:	c09e                	sw	t2,64(sp)
    1e82:	de22                	sw	s0,60(sp)
    1e84:	dc2a                	sw	a0,56(sp)
    1e86:	da2e                	sw	a1,52(sp)
    1e88:	d832                	sw	a2,48(sp)
    1e8a:	d636                	sw	a3,44(sp)
    1e8c:	d43a                	sw	a4,40(sp)
    1e8e:	d23e                	sw	a5,36(sp)
    1e90:	d042                	sw	a6,32(sp)
    1e92:	ce46                	sw	a7,28(sp)
    1e94:	cc72                	sw	t3,24(sp)
    1e96:	ca76                	sw	t4,20(sp)
    1e98:	c87a                	sw	t5,16(sp)
    1e9a:	c67e                	sw	t6,12(sp)
    1e9c:	0880                	addi	s0,sp,80
  _writestr("Software IRQ triggered!\n"); 
    1e9e:	67a9                	lui	a5,0xa
    1ea0:	52878513          	addi	a0,a5,1320 # a528 <dma.c.e6d7bed9+0x81b>
    1ea4:	2c59                	jal	213a <_writestr>
  while (1) {
    1ea6:	0001                	nop
    1ea8:	bffd                	j	1ea6 <handler_irq_software+0x2e>
	...

00001eac <handler_irq_timer>:
  }
}

__attribute__((weak)) void handler_irq_timer(void) {
    1eac:	715d                	addi	sp,sp,-80
    1eae:	c686                	sw	ra,76(sp)
    1eb0:	c496                	sw	t0,72(sp)
    1eb2:	c29a                	sw	t1,68(sp)
    1eb4:	c09e                	sw	t2,64(sp)
    1eb6:	de22                	sw	s0,60(sp)
    1eb8:	dc2a                	sw	a0,56(sp)
    1eba:	da2e                	sw	a1,52(sp)
    1ebc:	d832                	sw	a2,48(sp)
    1ebe:	d636                	sw	a3,44(sp)
    1ec0:	d43a                	sw	a4,40(sp)
    1ec2:	d23e                	sw	a5,36(sp)
    1ec4:	d042                	sw	a6,32(sp)
    1ec6:	ce46                	sw	a7,28(sp)
    1ec8:	cc72                	sw	t3,24(sp)
    1eca:	ca76                	sw	t4,20(sp)
    1ecc:	c87a                	sw	t5,16(sp)
    1ece:	c67e                	sw	t6,12(sp)
    1ed0:	0880                	addi	s0,sp,80
  _writestr("Timer IRQ triggered!\n"); 
    1ed2:	67a9                	lui	a5,0xa
    1ed4:	54478513          	addi	a0,a5,1348 # a544 <dma.c.e6d7bed9+0x837>
    1ed8:	248d                	jal	213a <_writestr>
  while (1) {
    1eda:	0001                	nop
    1edc:	bffd                	j	1eda <handler_irq_timer+0x2e>

00001ede <handler_instr_acc_fault>:
  _writestr("External IRQ triggered!\n");
  while (1) {
  }
}

__attribute__((weak)) void handler_instr_acc_fault(void) {
    1ede:	1141                	addi	sp,sp,-16
    1ee0:	c606                	sw	ra,12(sp)
    1ee2:	c422                	sw	s0,8(sp)
    1ee4:	0800                	addi	s0,sp,16
  print_exc_msg("Instruction access fault, mtval shows fault address\n");
    1ee6:	67a9                	lui	a5,0xa
    1ee8:	55c78513          	addi	a0,a5,1372 # a55c <dma.c.e6d7bed9+0x84f>
    1eec:	3515                	jal	1d10 <print_exc_msg>
}
    1eee:	0001                	nop
    1ef0:	40b2                	lw	ra,12(sp)
    1ef2:	4422                	lw	s0,8(sp)
    1ef4:	0141                	addi	sp,sp,16
    1ef6:	8082                	ret

00001ef8 <handler_instr_ill_fault>:

__attribute__((weak)) void handler_instr_ill_fault(void) {
    1ef8:	1141                	addi	sp,sp,-16
    1efa:	c606                	sw	ra,12(sp)
    1efc:	c422                	sw	s0,8(sp)
    1efe:	0800                	addi	s0,sp,16
  print_exc_msg( "Illegal Instruction fault, mtval shows instruction content\n");
    1f00:	67a9                	lui	a5,0xa
    1f02:	59478513          	addi	a0,a5,1428 # a594 <dma.c.e6d7bed9+0x887>
    1f06:	3529                	jal	1d10 <print_exc_msg>
}
    1f08:	0001                	nop
    1f0a:	40b2                	lw	ra,12(sp)
    1f0c:	4422                	lw	s0,8(sp)
    1f0e:	0141                	addi	sp,sp,16
    1f10:	8082                	ret

00001f12 <handler_bkpt>:

__attribute__((weak)) void handler_bkpt(void) {
    1f12:	1141                	addi	sp,sp,-16
    1f14:	c606                	sw	ra,12(sp)
    1f16:	c422                	sw	s0,8(sp)
    1f18:	0800                	addi	s0,sp,16
  print_exc_msg("Breakpoint triggerd, mtval shows the breakpoint address\n");
    1f1a:	67a9                	lui	a5,0xa
    1f1c:	5d078513          	addi	a0,a5,1488 # a5d0 <dma.c.e6d7bed9+0x8c3>
    1f20:	3bc5                	jal	1d10 <print_exc_msg>
}
    1f22:	0001                	nop
    1f24:	40b2                	lw	ra,12(sp)
    1f26:	4422                	lw	s0,8(sp)
    1f28:	0141                	addi	sp,sp,16
    1f2a:	8082                	ret

00001f2c <handler_lsu_fault>:

__attribute__((weak)) void handler_lsu_fault(void) {
    1f2c:	1141                	addi	sp,sp,-16
    1f2e:	c606                	sw	ra,12(sp)
    1f30:	c422                	sw	s0,8(sp)
    1f32:	0800                	addi	s0,sp,16
  print_exc_msg("Load/Store fault, mtval shows the fault address\n");
    1f34:	67a9                	lui	a5,0xa
    1f36:	60c78513          	addi	a0,a5,1548 # a60c <dma.c.e6d7bed9+0x8ff>
    1f3a:	3bd9                	jal	1d10 <print_exc_msg>
}
    1f3c:	0001                	nop
    1f3e:	40b2                	lw	ra,12(sp)
    1f40:	4422                	lw	s0,8(sp)
    1f42:	0141                	addi	sp,sp,16
    1f44:	8082                	ret

00001f46 <handler_ecall>:

__attribute__((weak)) void handler_ecall(void) {
    1f46:	1141                	addi	sp,sp,-16
    1f48:	c606                	sw	ra,12(sp)
    1f4a:	c422                	sw	s0,8(sp)
    1f4c:	0800                	addi	s0,sp,16
  _writestr("Environment call encountered\n");
    1f4e:	67a9                	lui	a5,0xa
    1f50:	64078513          	addi	a0,a5,1600 # a640 <dma.c.e6d7bed9+0x933>
    1f54:	22dd                	jal	213a <_writestr>
  while (1) {
    1f56:	0001                	nop
    1f58:	bffd                	j	1f56 <handler_ecall+0x10>

00001f5a <init>:
#ifdef __cplusplus
extern "C" {
#endif

int init()
{
    1f5a:	1141                	addi	sp,sp,-16
    1f5c:	c606                	sw	ra,12(sp)
    1f5e:	c422                	sw	s0,8(sp)
    1f60:	0800                	addi	s0,sp,16
    return 0;
    1f62:	4781                	li	a5,0
}
    1f64:	853e                	mv	a0,a5
    1f66:	40b2                	lw	ra,12(sp)
    1f68:	4422                	lw	s0,8(sp)
    1f6a:	0141                	addi	sp,sp,16
    1f6c:	8082                	ret

00001f6e <mmio_region_from_addr.lto_priv.0>:
static inline mmio_region_t mmio_region_from_addr(uintptr_t address) {
    1f6e:	1101                	addi	sp,sp,-32
    1f70:	ce06                	sw	ra,28(sp)
    1f72:	cc22                	sw	s0,24(sp)
    1f74:	1000                	addi	s0,sp,32
    1f76:	fea42623          	sw	a0,-20(s0)
      .base = (volatile void *)address,
    1f7a:	fec42783          	lw	a5,-20(s0)
}
    1f7e:	853e                	mv	a0,a5
    1f80:	40f2                	lw	ra,28(sp)
    1f82:	4462                	lw	s0,24(sp)
    1f84:	6105                	addi	sp,sp,32
    1f86:	8082                	ret

00001f88 <_close>:
    errno = ENOSYS;
    return -1;
}

__attribute__((used)) int _close(int file)
{
    1f88:	1101                	addi	sp,sp,-32
    1f8a:	ce06                	sw	ra,28(sp)
    1f8c:	cc22                	sw	s0,24(sp)
    1f8e:	1000                	addi	s0,sp,32
    1f90:	fea42623          	sw	a0,-20(s0)
    return -1;
    1f94:	57fd                	li	a5,-1
}
    1f96:	853e                	mv	a0,a5
    1f98:	40f2                	lw	ra,28(sp)
    1f9a:	4462                	lw	s0,24(sp)
    1f9c:	6105                	addi	sp,sp,32
    1f9e:	8082                	ret

00001fa0 <_exit>:
    errno = ENOMEM;
    return -1;
}

void _exit(int exit_status)
{
    1fa0:	7179                	addi	sp,sp,-48
    1fa2:	d606                	sw	ra,44(sp)
    1fa4:	d422                	sw	s0,40(sp)
    1fa6:	1800                	addi	s0,sp,48
    1fa8:	fca42e23          	sw	a0,-36(s0)
    soc_ctrl_t soc_ctrl;
    soc_ctrl.base_addr = mmio_region_from_addr((uintptr_t)SOC_CTRL_START_ADDRESS);
    1fac:	20000537          	lui	a0,0x20000
    1fb0:	3f7d                	jal	1f6e <mmio_region_from_addr.lto_priv.0>
    1fb2:	fea42623          	sw	a0,-20(s0)
    soc_ctrl_set_exit_value(&soc_ctrl, exit_status);
    1fb6:	fdc42703          	lw	a4,-36(s0)
    1fba:	fec40793          	addi	a5,s0,-20
    1fbe:	85ba                	mv	a1,a4
    1fc0:	853e                	mv	a0,a5
    1fc2:	902ff0ef          	jal	10c4 <soc_ctrl_set_exit_value>
    soc_ctrl_set_valid(&soc_ctrl, (uint8_t)1);
    1fc6:	fec40793          	addi	a5,s0,-20
    1fca:	4585                	li	a1,1
    1fcc:	853e                	mv	a0,a5
    1fce:	8caff0ef          	jal	1098 <soc_ctrl_set_valid>

    asm volatile("wfi");
    1fd2:	10500073          	wfi
}
    1fd6:	9002                	ebreak

00001fd8 <_fstat>:
    errno = EAGAIN;
    return -1;
}

__attribute__((used)) int _fstat(int file, struct stat *st)
{
    1fd8:	1101                	addi	sp,sp,-32
    1fda:	ce06                	sw	ra,28(sp)
    1fdc:	cc22                	sw	s0,24(sp)
    1fde:	1000                	addi	s0,sp,32
    1fe0:	fea42623          	sw	a0,-20(s0)
    1fe4:	feb42423          	sw	a1,-24(s0)
    st->st_mode = S_IFCHR;
    1fe8:	fe842783          	lw	a5,-24(s0)
    1fec:	6709                	lui	a4,0x2
    1fee:	c3d8                	sw	a4,4(a5)
    return 0;
    1ff0:	4781                	li	a5,0
    // errno = -ENOSYS;
    // return -1;
}
    1ff2:	853e                	mv	a0,a5
    1ff4:	40f2                	lw	ra,28(sp)
    1ff6:	4462                	lw	s0,24(sp)
    1ff8:	6105                	addi	sp,sp,32
    1ffa:	8082                	ret

00001ffc <_isatty>:
    errno = -ENOSYS;
    return -1;
}

__attribute__((used)) int _isatty(int file)
{
    1ffc:	1101                	addi	sp,sp,-32
    1ffe:	ce06                	sw	ra,28(sp)
    2000:	cc22                	sw	s0,24(sp)
    2002:	1000                	addi	s0,sp,32
    2004:	fea42623          	sw	a0,-20(s0)
    return (file == STDOUT_FILENO);
    2008:	fec42783          	lw	a5,-20(s0)
    200c:	17fd                	addi	a5,a5,-1
    200e:	0017b793          	seqz	a5,a5
    2012:	0ff7f793          	zext.b	a5,a5
}
    2016:	853e                	mv	a0,a5
    2018:	40f2                	lw	ra,28(sp)
    201a:	4462                	lw	s0,24(sp)
    201c:	6105                	addi	sp,sp,32
    201e:	8082                	ret

00002020 <_lseek>:
    errno = EMLINK;
    return -1;
}

__attribute__((used)) off_t _lseek(int file, off_t ptr, int dir)
{
    2020:	1101                	addi	sp,sp,-32
    2022:	ce06                	sw	ra,28(sp)
    2024:	cc22                	sw	s0,24(sp)
    2026:	1000                	addi	s0,sp,32
    2028:	fea42623          	sw	a0,-20(s0)
    202c:	feb42423          	sw	a1,-24(s0)
    2030:	fec42223          	sw	a2,-28(s0)
    return 0;
    2034:	4781                	li	a5,0
}
    2036:	853e                	mv	a0,a5
    2038:	40f2                	lw	ra,28(sp)
    203a:	4462                	lw	s0,24(sp)
    203c:	6105                	addi	sp,sp,32
    203e:	8082                	ret

00002040 <_read>:
    errno = ENOSYS;
    return -1;
}

__attribute__((used)) int _read(int file, void *ptr, int len)
{
    2040:	1101                	addi	sp,sp,-32
    2042:	ce06                	sw	ra,28(sp)
    2044:	cc22                	sw	s0,24(sp)
    2046:	1000                	addi	s0,sp,32
    2048:	fea42623          	sw	a0,-20(s0)
    204c:	feb42423          	sw	a1,-24(s0)
    2050:	fec42223          	sw	a2,-28(s0)
    return 0;
    2054:	4781                	li	a5,0
}
    2056:	853e                	mv	a0,a5
    2058:	40f2                	lw	ra,28(sp)
    205a:	4462                	lw	s0,24(sp)
    205c:	6105                	addi	sp,sp,32
    205e:	8082                	ret

00002060 <_write>:
    errno = ECHILD;
    return -1;
}

int _write(int file, const void *ptr, int len)
{
    2060:	7139                	addi	sp,sp,-64
    2062:	de06                	sw	ra,60(sp)
    2064:	dc22                	sw	s0,56(sp)
    2066:	0080                	addi	s0,sp,64
    2068:	fca42623          	sw	a0,-52(s0)
    206c:	fcb42423          	sw	a1,-56(s0)
    2070:	fcc42223          	sw	a2,-60(s0)
    if (file != STDOUT_FILENO) {
    2074:	fcc42703          	lw	a4,-52(s0)
    2078:	4785                	li	a5,1
    207a:	00f70863          	beq	a4,a5,208a <_write+0x2a>
        errno = ENOSYS;
    207e:	05800713          	li	a4,88
    2082:	92e1ae23          	sw	a4,-1732(gp) # b4d0 <errno>
        return -1;
    2086:	57fd                	li	a5,-1
    2088:	a895                	j	20fc <_write+0x9c>
    }

    soc_ctrl_t soc_ctrl;
    soc_ctrl.base_addr = mmio_region_from_addr((uintptr_t)SOC_CTRL_START_ADDRESS);
    208a:	20000537          	lui	a0,0x20000
    208e:	35c5                	jal	1f6e <mmio_region_from_addr.lto_priv.0>
    2090:	fea42623          	sw	a0,-20(s0)

    uart_t uart;
    uart.base_addr   = mmio_region_from_addr((uintptr_t)UART_START_ADDRESS);
    2094:	30080537          	lui	a0,0x30080
    2098:	3dd9                	jal	1f6e <mmio_region_from_addr.lto_priv.0>
    209a:	fca42823          	sw	a0,-48(s0)
    uart.baudrate    = UART_BAUDRATE;
    209e:	0003f7b7          	lui	a5,0x3f
    20a2:	80078793          	addi	a5,a5,-2048 # 3e800 <syscalls_cpp.cpp.cfa7c3ef+0x2acaa>
    20a6:	fcf42a23          	sw	a5,-44(s0)
    uart.clk_freq_hz = soc_ctrl_get_frequency(&soc_ctrl);
    20aa:	fec40793          	addi	a5,s0,-20
    20ae:	853e                	mv	a0,a5
    20b0:	83cff0ef          	jal	10ec <soc_ctrl_get_frequency>
    20b4:	87aa                	mv	a5,a0
    20b6:	fef42023          	sw	a5,-32(s0)
    #ifdef UART_NCO
    uart.nco         = UART_NCO;
    20ba:	6705                	lui	a4,0x1
    20bc:	a7c70713          	addi	a4,a4,-1412 # a7c <handler_irq_fast_timer_3+0x1c>
    20c0:	4781                	li	a5,0
    20c2:	fce42c23          	sw	a4,-40(s0)
    20c6:	fcf42e23          	sw	a5,-36(s0)
    #else
    uart.nco         = ((uint64_t)uart.baudrate << (NCO_WIDTH + 4)) / uart.clk_freq_hz;
    #endif

    if (uart_init(&uart) != kErrorOk) {
    20ca:	fd040793          	addi	a5,s0,-48
    20ce:	853e                	mv	a0,a5
    20d0:	3c1d                	jal	1b06 <uart_init>
    20d2:	872a                	mv	a4,a0
    20d4:	73900793          	li	a5,1849
    20d8:	00f70863          	beq	a4,a5,20e8 <_write+0x88>
        errno = ENOSYS;
    20dc:	05800713          	li	a4,88
    20e0:	92e1ae23          	sw	a4,-1732(gp) # b4d0 <errno>
        return -1;
    20e4:	57fd                	li	a5,-1
    20e6:	a819                	j	20fc <_write+0x9c>
    }
    return uart_write(&uart,(uint8_t *)ptr,len);
    20e8:	fc442703          	lw	a4,-60(s0)
    20ec:	fd040793          	addi	a5,s0,-48
    20f0:	863a                	mv	a2,a4
    20f2:	fc842583          	lw	a1,-56(s0)
    20f6:	853e                	mv	a0,a5
    20f8:	36c9                	jal	1cba <uart_write>
    20fa:	87aa                	mv	a5,a0

}
    20fc:	853e                	mv	a0,a5
    20fe:	50f2                	lw	ra,60(sp)
    2100:	5462                	lw	s0,56(sp)
    2102:	6121                	addi	sp,sp,64
    2104:	8082                	ret

00002106 <_write_r>:


__attribute__((used)) _ssize_t _write_r(struct _reent *ptr, int fd, const void *buf, size_t cnt)
{
    2106:	1101                	addi	sp,sp,-32
    2108:	ce06                	sw	ra,28(sp)
    210a:	cc22                	sw	s0,24(sp)
    210c:	1000                	addi	s0,sp,32
    210e:	fea42623          	sw	a0,-20(s0)
    2112:	feb42423          	sw	a1,-24(s0)
    2116:	fec42223          	sw	a2,-28(s0)
    211a:	fed42023          	sw	a3,-32(s0)
    return _write(fd,buf,cnt);
    211e:	fe042783          	lw	a5,-32(s0)
    2122:	863e                	mv	a2,a5
    2124:	fe442583          	lw	a1,-28(s0)
    2128:	fe842503          	lw	a0,-24(s0)
    212c:	3f15                	jal	2060 <_write>
    212e:	87aa                	mv	a5,a0
}
    2130:	853e                	mv	a0,a5
    2132:	40f2                	lw	ra,28(sp)
    2134:	4462                	lw	s0,24(sp)
    2136:	6105                	addi	sp,sp,32
    2138:	8082                	ret

0000213a <_writestr>:

void _writestr(const void *ptr)
{
    213a:	1101                	addi	sp,sp,-32
    213c:	ce06                	sw	ra,28(sp)
    213e:	cc22                	sw	s0,24(sp)
    2140:	1000                	addi	s0,sp,32
    2142:	fea42623          	sw	a0,-20(s0)
    _write(STDOUT_FILENO, ptr, strlen(ptr)+1);
    2146:	fec42503          	lw	a0,-20(s0)
    214a:	713000ef          	jal	305c <strlen>
    214e:	87aa                	mv	a5,a0
    2150:	0785                	addi	a5,a5,1
    2152:	863e                	mv	a2,a5
    2154:	fec42583          	lw	a1,-20(s0)
    2158:	4505                	li	a0,1
    215a:	3719                	jal	2060 <_write>
}
    215c:	0001                	nop
    215e:	40f2                	lw	ra,28(sp)
    2160:	4462                	lw	s0,24(sp)
    2162:	6105                	addi	sp,sp,32
    2164:	8082                	ret

00002166 <_sbrk>:
        return -1; 
    }
}

void *_sbrk(ptrdiff_t incr)
{
    2166:	7179                	addi	sp,sp,-48
    2168:	d606                	sw	ra,44(sp)
    216a:	d422                	sw	s0,40(sp)
    216c:	1800                	addi	s0,sp,48
    216e:	fca42e23          	sw	a0,-36(s0)
    char *old_brk = brk;
    2172:	9301a783          	lw	a5,-1744(gp) # b4c4 <brk>
    2176:	fef42623          	sw	a5,-20(s0)

    if (__heap_start == __heap_end) {
    217a:	c8c18713          	addi	a4,gp,-884 # b820 <__BSS_END__>
    217e:	67b1                	lui	a5,0xc
    2180:	02078793          	addi	a5,a5,32 # c020 <__heap_end>
    2184:	00f71463          	bne	a4,a5,218c <_sbrk+0x26>
        return NULL; 
    2188:	4781                	li	a5,0
    218a:	a83d                	j	21c8 <_sbrk+0x62>
    }

    if (brk + incr < __heap_end && brk + incr >= __heap_start) {
    218c:	9301a703          	lw	a4,-1744(gp) # b4c4 <brk>
    2190:	fdc42783          	lw	a5,-36(s0)
    2194:	973e                	add	a4,a4,a5
    2196:	67b1                	lui	a5,0xc
    2198:	02078793          	addi	a5,a5,32 # c020 <__heap_end>
    219c:	02f77563          	bgeu	a4,a5,21c6 <_sbrk+0x60>
    21a0:	9301a703          	lw	a4,-1744(gp) # b4c4 <brk>
    21a4:	fdc42783          	lw	a5,-36(s0)
    21a8:	973e                	add	a4,a4,a5
    21aa:	c8c18793          	addi	a5,gp,-884 # b820 <__BSS_END__>
    21ae:	00f76c63          	bltu	a4,a5,21c6 <_sbrk+0x60>
        brk += incr;
    21b2:	9301a703          	lw	a4,-1744(gp) # b4c4 <brk>
    21b6:	fdc42783          	lw	a5,-36(s0)
    21ba:	973e                	add	a4,a4,a5
    21bc:	92e1a823          	sw	a4,-1744(gp) # b4c4 <brk>
    } else {
        return (void *)-1; 
    }
    return old_brk;
    21c0:	fec42783          	lw	a5,-20(s0)
    21c4:	a011                	j	21c8 <_sbrk+0x62>
        return (void *)-1; 
    21c6:	57fd                	li	a5,-1
}
    21c8:	853e                	mv	a0,a5
    21ca:	50b2                	lw	ra,44(sp)
    21cc:	5422                	lw	s0,40(sp)
    21ce:	6145                	addi	sp,sp,48
    21d0:	8082                	ret

000021d2 <bitfield_read.lto_priv.3>:
{
    21d2:	1101                	addi	sp,sp,-32
    21d4:	ce06                	sw	ra,28(sp)
    21d6:	cc22                	sw	s0,24(sp)
    21d8:	1000                	addi	s0,sp,32
    21da:	fea42623          	sw	a0,-20(s0)
    21de:	feb42423          	sw	a1,-24(s0)
    21e2:	fec42223          	sw	a2,-28(s0)
  return (bitfield >> index) & mask;
    21e6:	fe442783          	lw	a5,-28(s0)
    21ea:	fec42703          	lw	a4,-20(s0)
    21ee:	00f75733          	srl	a4,a4,a5
    21f2:	fe842783          	lw	a5,-24(s0)
    21f6:	8ff9                	and	a5,a5,a4
}
    21f8:	853e                	mv	a0,a5
    21fa:	40f2                	lw	ra,28(sp)
    21fc:	4462                	lw	s0,24(sp)
    21fe:	6105                	addi	sp,sp,32
    2200:	8082                	ret

00002202 <bitfield_write.lto_priv.4>:
{
    2202:	1101                	addi	sp,sp,-32
    2204:	ce06                	sw	ra,28(sp)
    2206:	cc22                	sw	s0,24(sp)
    2208:	1000                	addi	s0,sp,32
    220a:	fea42623          	sw	a0,-20(s0)
    220e:	feb42423          	sw	a1,-24(s0)
    2212:	fec42223          	sw	a2,-28(s0)
    2216:	fed42023          	sw	a3,-32(s0)
  bitfield &= ~(mask << index);
    221a:	fe442783          	lw	a5,-28(s0)
    221e:	fe842703          	lw	a4,-24(s0)
    2222:	00f717b3          	sll	a5,a4,a5
    2226:	fff7c793          	not	a5,a5
    222a:	fec42703          	lw	a4,-20(s0)
    222e:	8ff9                	and	a5,a5,a4
    2230:	fef42623          	sw	a5,-20(s0)
  bitfield |= (value & mask) << index;
    2234:	fe042703          	lw	a4,-32(s0)
    2238:	fe842783          	lw	a5,-24(s0)
    223c:	8f7d                	and	a4,a4,a5
    223e:	fe442783          	lw	a5,-28(s0)
    2242:	00f717b3          	sll	a5,a4,a5
    2246:	fec42703          	lw	a4,-20(s0)
    224a:	8fd9                	or	a5,a5,a4
    224c:	fef42623          	sw	a5,-20(s0)
  return bitfield;
    2250:	fec42783          	lw	a5,-20(s0)
}
    2254:	853e                	mv	a0,a5
    2256:	40f2                	lw	ra,28(sp)
    2258:	4462                	lw	s0,24(sp)
    225a:	6105                	addi	sp,sp,32
    225c:	8082                	ret

0000225e <spi_fill_tx>:

    return true;
}

bool spi_fill_tx(spi_peripheral_t* peri) 
{
    225e:	1101                	addi	sp,sp,-32
    2260:	ce06                	sw	ra,28(sp)
    2262:	cc22                	sw	s0,24(sp)
    2264:	1000                	addi	s0,sp,32
    2266:	fea42623          	sw	a0,-20(s0)
    // If we have a TX buffer and didn't exceed the count then fill the TX FIFO
    if (peri->txn.txbuffer != NULL && peri->txcnt < peri->txn.txlen) {
    226a:	fec42783          	lw	a5,-20(s0)
    226e:	4fdc                	lw	a5,28(a5)
    2270:	cfb1                	beqz	a5,22cc <spi_fill_tx+0x6e>
    2272:	fec42783          	lw	a5,-20(s0)
    2276:	5b98                	lw	a4,48(a5)
    2278:	fec42783          	lw	a5,-20(s0)
    227c:	539c                	lw	a5,32(a5)
    227e:	04f77763          	bgeu	a4,a5,22cc <spi_fill_tx+0x6e>
        // While there is still data to be fed and there wasn't an error from HAL
        // continue. HAL error in this case means that the fifo is full since
        // it's the only possibility.
        while (
    2282:	a809                	j	2294 <spi_fill_tx+0x36>
            peri->txcnt < peri->txn.txlen 
            && !spi_write_word(peri->instance, peri->txn.txbuffer[peri->txcnt])
        ) peri->txcnt++; // Keep track of counter
    2284:	fec42783          	lw	a5,-20(s0)
    2288:	5b9c                	lw	a5,48(a5)
    228a:	00178713          	addi	a4,a5,1
    228e:	fec42783          	lw	a5,-20(s0)
    2292:	db98                	sw	a4,48(a5)
            peri->txcnt < peri->txn.txlen 
    2294:	fec42783          	lw	a5,-20(s0)
    2298:	5b98                	lw	a4,48(a5)
    229a:	fec42783          	lw	a5,-20(s0)
    229e:	539c                	lw	a5,32(a5)
            && !spi_write_word(peri->instance, peri->txn.txbuffer[peri->txcnt])
    22a0:	02f77463          	bgeu	a4,a5,22c8 <spi_fill_tx+0x6a>
    22a4:	fec42783          	lw	a5,-20(s0)
    22a8:	4394                	lw	a3,0(a5)
    22aa:	fec42783          	lw	a5,-20(s0)
    22ae:	4fd8                	lw	a4,28(a5)
    22b0:	fec42783          	lw	a5,-20(s0)
    22b4:	5b9c                	lw	a5,48(a5)
    22b6:	078a                	slli	a5,a5,0x2
    22b8:	97ba                	add	a5,a5,a4
    22ba:	439c                	lw	a5,0(a5)
    22bc:	85be                	mv	a1,a5
    22be:	8536                	mv	a0,a3
    22c0:	ae4ff0ef          	jal	15a4 <spi_write_word>
    22c4:	87aa                	mv	a5,a0
    22c6:	dfdd                	beqz	a5,2284 <spi_fill_tx+0x26>
        return true;
    22c8:	4785                	li	a5,1
    22ca:	a011                	j	22ce <spi_fill_tx+0x70>
    }
    return false;
    22cc:	4781                	li	a5,0
}
    22ce:	853e                	mv	a0,a5
    22d0:	40f2                	lw	ra,28(sp)
    22d2:	4462                	lw	s0,24(sp)
    22d4:	6105                	addi	sp,sp,32
    22d6:	8082                	ret

000022d8 <spi_empty_rx>:

bool spi_empty_rx(spi_peripheral_t* peri) 
{
    22d8:	1101                	addi	sp,sp,-32
    22da:	ce06                	sw	ra,28(sp)
    22dc:	cc22                	sw	s0,24(sp)
    22de:	1000                	addi	s0,sp,32
    22e0:	fea42623          	sw	a0,-20(s0)
    // If we have a RX buffer and didn't exceed the count then read from RX FIFO
    if (peri->txn.rxbuffer != NULL && peri->rxcnt < peri->txn.rxlen) {
    22e4:	fec42783          	lw	a5,-20(s0)
    22e8:	53dc                	lw	a5,36(a5)
    22ea:	cfa9                	beqz	a5,2344 <spi_empty_rx+0x6c>
    22ec:	fec42783          	lw	a5,-20(s0)
    22f0:	5bd8                	lw	a4,52(a5)
    22f2:	fec42783          	lw	a5,-20(s0)
    22f6:	579c                	lw	a5,40(a5)
    22f8:	04f77663          	bgeu	a4,a5,2344 <spi_empty_rx+0x6c>
        // While there is still data to be read and there wasn't an error from HAL
        // continue. HAL error in this case means that the fifo is empty since
        // it's the only possibility.
        while (
    22fc:	a809                	j	230e <spi_empty_rx+0x36>
            peri->rxcnt < peri->txn.rxlen 
            && !spi_read_word(peri->instance, &peri->txn.rxbuffer[peri->rxcnt])
        ) peri->rxcnt++; // Keep track of counter
    22fe:	fec42783          	lw	a5,-20(s0)
    2302:	5bdc                	lw	a5,52(a5)
    2304:	00178713          	addi	a4,a5,1
    2308:	fec42783          	lw	a5,-20(s0)
    230c:	dbd8                	sw	a4,52(a5)
            peri->rxcnt < peri->txn.rxlen 
    230e:	fec42783          	lw	a5,-20(s0)
    2312:	5bd8                	lw	a4,52(a5)
    2314:	fec42783          	lw	a5,-20(s0)
    2318:	579c                	lw	a5,40(a5)
            && !spi_read_word(peri->instance, &peri->txn.rxbuffer[peri->rxcnt])
    231a:	02f77363          	bgeu	a4,a5,2340 <spi_empty_rx+0x68>
    231e:	fec42783          	lw	a5,-20(s0)
    2322:	4394                	lw	a3,0(a5)
    2324:	fec42783          	lw	a5,-20(s0)
    2328:	53d8                	lw	a4,36(a5)
    232a:	fec42783          	lw	a5,-20(s0)
    232e:	5bdc                	lw	a5,52(a5)
    2330:	078a                	slli	a5,a5,0x2
    2332:	97ba                	add	a5,a5,a4
    2334:	85be                	mv	a1,a5
    2336:	8536                	mv	a0,a3
    2338:	ab4ff0ef          	jal	15ec <spi_read_word>
    233c:	87aa                	mv	a5,a0
    233e:	d3e1                	beqz	a5,22fe <spi_empty_rx+0x26>
        return true;
    2340:	4785                	li	a5,1
    2342:	a011                	j	2346 <spi_empty_rx+0x6e>
    }
    return false;
    2344:	4781                	li	a5,0
}
    2346:	853e                	mv	a0,a5
    2348:	40f2                	lw	ra,28(sp)
    234a:	4462                	lw	s0,24(sp)
    234c:	6105                	addi	sp,sp,32
    234e:	8082                	ret

00002350 <spi_issue_next_seg>:
        
    } while (SPI_BUSY((*peri)));
}

void spi_issue_next_seg(spi_peripheral_t* peri) 
{
    2350:	7179                	addi	sp,sp,-48
    2352:	d606                	sw	ra,44(sp)
    2354:	d422                	sw	s0,40(sp)
    2356:	d226                	sw	s1,36(sp)
    2358:	1800                	addi	s0,sp,48
    235a:	fca42e23          	sw	a0,-36(s0)
    const spi_segment_t seg = peri->txn.segments[peri->scnt];
    235e:	fdc42783          	lw	a5,-36(s0)
    2362:	4bd8                	lw	a4,20(a5)
    2364:	fdc42783          	lw	a5,-36(s0)
    2368:	57dc                	lw	a5,44(a5)
    236a:	078a                	slli	a5,a5,0x2
    236c:	97ba                	add	a5,a5,a4
    236e:	439c                	lw	a5,0(a5)
    2370:	fef42223          	sw	a5,-28(s0)
    peri->scnt++;
    2374:	fdc42783          	lw	a5,-36(s0)
    2378:	57dc                	lw	a5,44(a5)
    237a:	00178713          	addi	a4,a5,1
    237e:	fdc42783          	lw	a5,-36(s0)
    2382:	d7d8                	sw	a4,44(a5)
    // Construct our word command to be passed to HAL
    uint32_t cmd_reg = spi_create_command((spi_command_t) {
        .len       = seg.len - 1, // -1 because of SPI Host IP specifications
    2384:	fe442703          	lw	a4,-28(s0)
    2388:	010007b7          	lui	a5,0x1000
    238c:	17fd                	addi	a5,a5,-1 # ffffff <syscalls_cpp.cpp.cfa7c3ef+0xfec4a9>
    238e:	8ff9                	and	a5,a5,a4
    2390:	fff78713          	addi	a4,a5,-1
    2394:	010007b7          	lui	a5,0x1000
    2398:	17fd                	addi	a5,a5,-1 # ffffff <syscalls_cpp.cpp.cfa7c3ef+0xfec4a9>
    239a:	8f7d                	and	a4,a4,a5
    uint32_t cmd_reg = spi_create_command((spi_command_t) {
    239c:	010007b7          	lui	a5,0x1000
    23a0:	17fd                	addi	a5,a5,-1 # ffffff <syscalls_cpp.cpp.cfa7c3ef+0xfec4a9>
    23a2:	8ff9                	and	a5,a5,a4
    23a4:	ff000737          	lui	a4,0xff000
    23a8:	8f65                	and	a4,a4,s1
    23aa:	8fd9                	or	a5,a5,a4
    23ac:	84be                	mv	s1,a5
        .csaat     = peri->txn.seglen == peri->scnt ? false : true,
    23ae:	fdc42783          	lw	a5,-36(s0)
    23b2:	0187c783          	lbu	a5,24(a5)
    23b6:	873e                	mv	a4,a5
    23b8:	fdc42783          	lw	a5,-36(s0)
    23bc:	57dc                	lw	a5,44(a5)
    23be:	40f707b3          	sub	a5,a4,a5
    23c2:	00f037b3          	snez	a5,a5
    23c6:	0ff7f793          	zext.b	a5,a5
    uint32_t cmd_reg = spi_create_command((spi_command_t) {
    23ca:	8b85                	andi	a5,a5,1
    23cc:	07e2                	slli	a5,a5,0x18
    23ce:	ff000737          	lui	a4,0xff000
    23d2:	177d                	addi	a4,a4,-1 # feffffff <syscalls_cpp.cpp.cfa7c3ef+0xfefec4a9>
    23d4:	8f65                	and	a4,a4,s1
    23d6:	8fd9                	or	a5,a5,a4
    23d8:	84be                	mv	s1,a5
        .speed     = bitfield_read(seg.mode, DIR_SPD_MASK, SPD_INDEX),
    23da:	fe442783          	lw	a5,-28(s0)
    23de:	83e1                	srli	a5,a5,0x18
    23e0:	8bbd                	andi	a5,a5,15
    23e2:	0ff7f793          	zext.b	a5,a5
    23e6:	4609                	li	a2,2
    23e8:	458d                	li	a1,3
    23ea:	853e                	mv	a0,a5
    23ec:	33dd                	jal	21d2 <bitfield_read.lto_priv.3>
    23ee:	87aa                	mv	a5,a0
    23f0:	8b8d                	andi	a5,a5,3
    23f2:	0ff7f793          	zext.b	a5,a5
    uint32_t cmd_reg = spi_create_command((spi_command_t) {
    23f6:	8b8d                	andi	a5,a5,3
    23f8:	07e6                	slli	a5,a5,0x19
    23fa:	fa000737          	lui	a4,0xfa000
    23fe:	177d                	addi	a4,a4,-1 # f9ffffff <syscalls_cpp.cpp.cfa7c3ef+0xf9fec4a9>
    2400:	8f65                	and	a4,a4,s1
    2402:	8fd9                	or	a5,a5,a4
    2404:	84be                	mv	s1,a5
        .direction = bitfield_read(seg.mode, DIR_SPD_MASK, DIR_INDEX),
    2406:	fe442783          	lw	a5,-28(s0)
    240a:	83e1                	srli	a5,a5,0x18
    240c:	8bbd                	andi	a5,a5,15
    240e:	0ff7f793          	zext.b	a5,a5
    2412:	4601                	li	a2,0
    2414:	458d                	li	a1,3
    2416:	853e                	mv	a0,a5
    2418:	3b6d                	jal	21d2 <bitfield_read.lto_priv.3>
    241a:	87aa                	mv	a5,a0
    241c:	8b8d                	andi	a5,a5,3
    241e:	0ff7f793          	zext.b	a5,a5
    uint32_t cmd_reg = spi_create_command((spi_command_t) {
    2422:	8b8d                	andi	a5,a5,3
    2424:	07ee                	slli	a5,a5,0x1b
    2426:	e8000737          	lui	a4,0xe8000
    242a:	177d                	addi	a4,a4,-1 # e7ffffff <syscalls_cpp.cpp.cfa7c3ef+0xe7fec4a9>
    242c:	8f65                	and	a4,a4,s1
    242e:	8fd9                	or	a5,a5,a4
    2430:	84be                	mv	s1,a5
 * @return uint32 representing the command.
 */
static inline __attribute__((always_inline)) __attribute__((const))
uint32_t spi_create_command(const spi_command_t command)
{
    uint32_t cmd_reg = 0;
    2432:	fe042423          	sw	zero,-24(s0)
    cmd_reg = bitfield_write(cmd_reg, SPI_HOST_COMMAND_LEN_MASK, 
                             SPI_HOST_COMMAND_LEN_OFFSET, command.len);
    2436:	010007b7          	lui	a5,0x1000
    243a:	17fd                	addi	a5,a5,-1 # ffffff <syscalls_cpp.cpp.cfa7c3ef+0xfec4a9>
    243c:	8fe5                	and	a5,a5,s1
    cmd_reg = bitfield_write(cmd_reg, SPI_HOST_COMMAND_LEN_MASK, 
    243e:	86be                	mv	a3,a5
    2440:	4601                	li	a2,0
    2442:	010007b7          	lui	a5,0x1000
    2446:	fff78593          	addi	a1,a5,-1 # ffffff <syscalls_cpp.cpp.cfa7c3ef+0xfec4a9>
    244a:	fe842503          	lw	a0,-24(s0)
    244e:	3b55                	jal	2202 <bitfield_write.lto_priv.4>
    2450:	fea42423          	sw	a0,-24(s0)
    cmd_reg = bitfield_write(cmd_reg, BIT_MASK_1, 
                             SPI_HOST_COMMAND_CSAAT_BIT, command.csaat);
    2454:	0184d793          	srli	a5,s1,0x18
    2458:	8b85                	andi	a5,a5,1
    245a:	0ff7f793          	zext.b	a5,a5
    cmd_reg = bitfield_write(cmd_reg, BIT_MASK_1, 
    245e:	86be                	mv	a3,a5
    2460:	4661                	li	a2,24
    2462:	4585                	li	a1,1
    2464:	fe842503          	lw	a0,-24(s0)
    2468:	3b69                	jal	2202 <bitfield_write.lto_priv.4>
    246a:	fea42423          	sw	a0,-24(s0)
    cmd_reg = bitfield_write(cmd_reg, SPI_HOST_COMMAND_SPEED_MASK, 
                             SPI_HOST_COMMAND_SPEED_OFFSET, command.speed);
    246e:	0194d793          	srli	a5,s1,0x19
    2472:	8b8d                	andi	a5,a5,3
    2474:	0ff7f793          	zext.b	a5,a5
    cmd_reg = bitfield_write(cmd_reg, SPI_HOST_COMMAND_SPEED_MASK, 
    2478:	86be                	mv	a3,a5
    247a:	4665                	li	a2,25
    247c:	458d                	li	a1,3
    247e:	fe842503          	lw	a0,-24(s0)
    2482:	3341                	jal	2202 <bitfield_write.lto_priv.4>
    2484:	fea42423          	sw	a0,-24(s0)
    cmd_reg = bitfield_write(cmd_reg, SPI_HOST_COMMAND_DIRECTION_MASK, 
                             SPI_HOST_COMMAND_DIRECTION_OFFSET, command.direction);
    2488:	01b4d793          	srli	a5,s1,0x1b
    248c:	8b8d                	andi	a5,a5,3
    248e:	0ff7f793          	zext.b	a5,a5
    cmd_reg = bitfield_write(cmd_reg, SPI_HOST_COMMAND_DIRECTION_MASK, 
    2492:	86be                	mv	a3,a5
    2494:	466d                	li	a2,27
    2496:	458d                	li	a1,3
    2498:	fe842503          	lw	a0,-24(s0)
    249c:	339d                	jal	2202 <bitfield_write.lto_priv.4>
    249e:	fea42423          	sw	a0,-24(s0)
    return cmd_reg;
    24a2:	fe842783          	lw	a5,-24(s0)
    24a6:	fef42623          	sw	a5,-20(s0)
    });
    // Since all checks were already made we do not need to check the result of function
    spi_set_command(peri->instance, cmd_reg);
    24aa:	fdc42783          	lw	a5,-36(s0)
    24ae:	439c                	lw	a5,0(a5)
    24b0:	fec42583          	lw	a1,-20(s0)
    24b4:	853e                	mv	a0,a5
    24b6:	ff9fe0ef          	jal	14ae <spi_set_command>
}
    24ba:	0001                	nop
    24bc:	50b2                	lw	ra,44(sp)
    24be:	5422                	lw	s0,40(sp)
    24c0:	5492                	lw	s1,36(sp)
    24c2:	6145                	addi	sp,sp,48
    24c4:	8082                	ret

000024c6 <spi_reset_peri>:

void spi_reset_peri(spi_peripheral_t* peri) 
{
    24c6:	1101                	addi	sp,sp,-32
    24c8:	ce06                	sw	ra,28(sp)
    24ca:	cc22                	sw	s0,24(sp)
    24cc:	1000                	addi	s0,sp,32
    24ce:	fea42623          	sw	a0,-20(s0)
    // Reset static peripheral variables
    spi_reset_transaction(peri);
    24d2:	fec42503          	lw	a0,-20(s0)
    24d6:	2079                	jal	2564 <spi_reset_transaction>
    // Reset the SPI peripheral (at hardware level)
    spi_sw_reset(peri->instance);
    24d8:	fec42783          	lw	a5,-20(s0)
    24dc:	439c                	lw	a5,0(a5)
    24de:	853e                	mv	a0,a5
    24e0:	e4ffe0ef          	jal	132e <spi_sw_reset>
    // Enable SPI peripheral. We do not check return value since we know here that
    // it will never return an error.
    spi_set_enable(peri->instance, true);
    24e4:	fec42783          	lw	a5,-20(s0)
    24e8:	439c                	lw	a5,0(a5)
    24ea:	4585                	li	a1,1
    24ec:	853e                	mv	a0,a5
    24ee:	ed1fe0ef          	jal	13be <spi_set_enable>
    spi_output_enable(peri->instance, true);
    24f2:	fec42783          	lw	a5,-20(s0)
    24f6:	439c                	lw	a5,0(a5)
    24f8:	4585                	li	a1,1
    24fa:	853e                	mv	a0,a5
    24fc:	9baff0ef          	jal	16b6 <spi_output_enable>
    // Enable all error interrupts so that the SPI peripheral doesn't get stuck if
    // there is an error. And we don't check return value since we know it's error free.
    spi_set_errors_enabled(peri->instance, SPI_ERROR_IRQALL, true);
    2500:	fec42783          	lw	a5,-20(s0)
    2504:	439c                	lw	a5,0(a5)
    2506:	4605                	li	a2,1
    2508:	45fd                	li	a1,31
    250a:	853e                	mv	a0,a5
    250c:	cfdfe0ef          	jal	1208 <spi_set_errors_enabled>
    spi_enable_error_intr(peri->instance, true);
    2510:	fec42783          	lw	a5,-20(s0)
    2514:	439c                	lw	a5,0(a5)
    2516:	4585                	li	a1,1
    2518:	853e                	mv	a0,a5
    251a:	958ff0ef          	jal	1672 <spi_enable_error_intr>
    // Set the watermarks for the specific peripheral.
    spi_set_tx_watermark(peri->instance, peri->txwm);
    251e:	fec42783          	lw	a5,-20(s0)
    2522:	4398                	lw	a4,0(a5)
    2524:	fec42783          	lw	a5,-20(s0)
    2528:	0047c783          	lbu	a5,4(a5)
    252c:	85be                	mv	a1,a5
    252e:	853a                	mv	a0,a4
    2530:	ed3fe0ef          	jal	1402 <spi_set_tx_watermark>
    spi_set_rx_watermark(peri->instance, peri->rxwm);
    2534:	fec42783          	lw	a5,-20(s0)
    2538:	4398                	lw	a4,0(a5)
    253a:	fec42783          	lw	a5,-20(s0)
    253e:	0057c783          	lbu	a5,5(a5)
    2542:	85be                	mv	a1,a5
    2544:	853a                	mv	a0,a4
    2546:	f13fe0ef          	jal	1458 <spi_set_rx_watermark>
    // Just reset the state.
    peri->state = SPI_STATE_INIT;
    254a:	fec42783          	lw	a5,-20(s0)
    254e:	4705                	li	a4,1
    2550:	cb98                	sw	a4,16(a5)
    // Force the next transaction to set the slave at hardware level
    peri->last_id = 0;
    2552:	fec42783          	lw	a5,-20(s0)
    2556:	0007a423          	sw	zero,8(a5)
}
    255a:	0001                	nop
    255c:	40f2                	lw	ra,28(sp)
    255e:	4462                	lw	s0,24(sp)
    2560:	6105                	addi	sp,sp,32
    2562:	8082                	ret

00002564 <spi_reset_transaction>:

void spi_reset_transaction(spi_peripheral_t* peri) 
{
    2564:	715d                	addi	sp,sp,-80
    2566:	c686                	sw	ra,76(sp)
    2568:	c4a2                	sw	s0,72(sp)
    256a:	0880                	addi	s0,sp,80
    256c:	faa42e23          	sw	a0,-68(s0)
    // Reset all variables relative to the transaction of the static peripheral
    // instance
    peri->scnt      = 0;
    2570:	fbc42783          	lw	a5,-68(s0)
    2574:	0207a623          	sw	zero,44(a5)
    peri->txcnt     = 0;
    2578:	fbc42783          	lw	a5,-68(s0)
    257c:	0207a823          	sw	zero,48(a5)
    peri->rxcnt     = 0;
    2580:	fbc42783          	lw	a5,-68(s0)
    2584:	0207aa23          	sw	zero,52(a5)
    peri->txn       = (spi_transaction_t) {0};
    2588:	fbc42783          	lw	a5,-68(s0)
    258c:	0007aa23          	sw	zero,20(a5)
    2590:	0007ac23          	sw	zero,24(a5)
    2594:	0007ae23          	sw	zero,28(a5)
    2598:	0207a023          	sw	zero,32(a5)
    259c:	0207a223          	sw	zero,36(a5)
    25a0:	0207a423          	sw	zero,40(a5)
    peri->callbacks = NULL_CALLBACKS;
    25a4:	fbc42783          	lw	a5,-68(s0)
    25a8:	0207ac23          	sw	zero,56(a5)
    25ac:	fbc42783          	lw	a5,-68(s0)
    25b0:	0207ae23          	sw	zero,60(a5)
    25b4:	fbc42783          	lw	a5,-68(s0)
    25b8:	0407a023          	sw	zero,64(a5)
    25bc:	fbc42783          	lw	a5,-68(s0)
    25c0:	0407a223          	sw	zero,68(a5)
}
    25c4:	0001                	nop
    25c6:	40b6                	lw	ra,76(sp)
    25c8:	4426                	lw	s0,72(sp)
    25ca:	6161                	addi	sp,sp,80
    25cc:	8082                	ret

000025ce <spi_event_handler>:

void spi_event_handler(spi_peripheral_t* peri, spi_event_e events) 
{
    25ce:	1101                	addi	sp,sp,-32
    25d0:	ce06                	sw	ra,28(sp)
    25d2:	cc22                	sw	s0,24(sp)
    25d4:	1000                	addi	s0,sp,32
    25d6:	fea42623          	sw	a0,-20(s0)
    25da:	feb42423          	sw	a1,-24(s0)
    // Ready means it is ready to accept new command segments. So we have two
    // possibilities if the device is ready:
    //  1) It is ready but not idle
    //  2) It is ready and idle
    if (events & SPI_EVENT_READY) 
    25de:	fe842783          	lw	a5,-24(s0)
    25e2:	8bc1                	andi	a5,a5,16
    25e4:	c7d9                	beqz	a5,2672 <spi_event_handler+0xa4>
    {
        // If SPI is ready and there are still commands to execute, issue next command
        if (peri->txn.segments != NULL && peri->scnt < peri->txn.seglen) 
    25e6:	fec42783          	lw	a5,-20(s0)
    25ea:	4bdc                	lw	a5,20(a5)
    25ec:	cf91                	beqz	a5,2608 <spi_event_handler+0x3a>
    25ee:	fec42783          	lw	a5,-20(s0)
    25f2:	57dc                	lw	a5,44(a5)
    25f4:	fec42703          	lw	a4,-20(s0)
    25f8:	01874703          	lbu	a4,24(a4)
    25fc:	00e7f663          	bgeu	a5,a4,2608 <spi_event_handler+0x3a>
        {
            spi_issue_next_seg(peri);
    2600:	fec42503          	lw	a0,-20(s0)
    2604:	33b1                	jal	2350 <spi_issue_next_seg>
    2606:	a0b5                	j	2672 <spi_event_handler+0xa4>
        }
        // If no more commands and SPI is idle, it means the transaction is over
        else if (events & SPI_EVENT_IDLE) 
    2608:	fe842783          	lw	a5,-24(s0)
    260c:	0207f793          	andi	a5,a5,32
    2610:	c3ad                	beqz	a5,2672 <spi_event_handler+0xa4>
        {
            // Disable all event interrupts
            spi_set_events_enabled(peri->instance, SPI_EVENT_ALL, false);
    2612:	fec42783          	lw	a5,-20(s0)
    2616:	439c                	lw	a5,0(a5)
    2618:	4601                	li	a2,0
    261a:	03f00593          	li	a1,63
    261e:	853e                	mv	a0,a5
    2620:	b7bfe0ef          	jal	119a <spi_set_events_enabled>
            spi_enable_evt_intr   (peri->instance, false);
    2624:	fec42783          	lw	a5,-20(s0)
    2628:	439c                	lw	a5,0(a5)
    262a:	4581                	li	a1,0
    262c:	853e                	mv	a0,a5
    262e:	800ff0ef          	jal	162e <spi_enable_evt_intr>
            // Read the last data from the RX fifo
            spi_empty_rx(peri);
    2632:	fec42503          	lw	a0,-20(s0)
    2636:	314d                	jal	22d8 <spi_empty_rx>
            // Set the state to Transaction is done (meaning successful)
            peri->state = SPI_STATE_DONE;
    2638:	fec42783          	lw	a5,-20(s0)
    263c:	4711                	li	a4,4
    263e:	cb98                	sw	a4,16(a5)
            // If there is a callback defined call it
            if (peri->callbacks.done_cb != NULL) 
    2640:	fec42783          	lw	a5,-20(s0)
    2644:	5f9c                	lw	a5,56(a5)
    2646:	c395                	beqz	a5,266a <spi_event_handler+0x9c>
            {
                peri->callbacks.done_cb(peri->txn.txbuffer, peri->txcnt, 
    2648:	fec42783          	lw	a5,-20(s0)
    264c:	5f9c                	lw	a5,56(a5)
    264e:	fec42703          	lw	a4,-20(s0)
    2652:	4f48                	lw	a0,28(a4)
    2654:	fec42703          	lw	a4,-20(s0)
    2658:	5b0c                	lw	a1,48(a4)
    265a:	fec42703          	lw	a4,-20(s0)
    265e:	5350                	lw	a2,36(a4)
    2660:	fec42703          	lw	a4,-20(s0)
    2664:	5b58                	lw	a4,52(a4)
    2666:	86ba                	mv	a3,a4
    2668:	9782                	jalr	a5
                                        peri->txn.rxbuffer, peri->rxcnt);
            }
            // Reset all transaction related variables
            spi_reset_transaction(peri);
    266a:	fec42503          	lw	a0,-20(s0)
    266e:	3ddd                	jal	2564 <spi_reset_transaction>
            return;
    2670:	a8ad                	j	26ea <spi_event_handler+0x11c>
        }
    }
    if (events & SPI_EVENT_TXWM)
    2672:	fe842783          	lw	a5,-24(s0)
    2676:	8ba1                	andi	a5,a5,8
    2678:	cb9d                	beqz	a5,26ae <spi_event_handler+0xe0>
    {
        // TX watermark reached. Refill TX fifo if more data
        // If there is a callback defined call it
        if (spi_fill_tx(peri) && peri->callbacks.txwm_cb != NULL)
    267a:	fec42503          	lw	a0,-20(s0)
    267e:	36c5                	jal	225e <spi_fill_tx>
    2680:	87aa                	mv	a5,a0
    2682:	c795                	beqz	a5,26ae <spi_event_handler+0xe0>
    2684:	fec42783          	lw	a5,-20(s0)
    2688:	5fdc                	lw	a5,60(a5)
    268a:	c395                	beqz	a5,26ae <spi_event_handler+0xe0>
        {
            peri->callbacks.txwm_cb(peri->txn.txbuffer, peri->txcnt, 
    268c:	fec42783          	lw	a5,-20(s0)
    2690:	5fdc                	lw	a5,60(a5)
    2692:	fec42703          	lw	a4,-20(s0)
    2696:	4f48                	lw	a0,28(a4)
    2698:	fec42703          	lw	a4,-20(s0)
    269c:	5b0c                	lw	a1,48(a4)
    269e:	fec42703          	lw	a4,-20(s0)
    26a2:	5350                	lw	a2,36(a4)
    26a4:	fec42703          	lw	a4,-20(s0)
    26a8:	5b58                	lw	a4,52(a4)
    26aa:	86ba                	mv	a3,a4
    26ac:	9782                	jalr	a5
                                    peri->txn.rxbuffer, peri->rxcnt);
        }
    }
    if (events & SPI_EVENT_RXWM)
    26ae:	fe842783          	lw	a5,-24(s0)
    26b2:	8b91                	andi	a5,a5,4
    26b4:	cb9d                	beqz	a5,26ea <spi_event_handler+0x11c>
    {
        // RX watermark reached. Empty RX fifo to get more data
        // If there is a callback defined call it
        if (spi_empty_rx(peri) && peri->callbacks.rxwm_cb != NULL)
    26b6:	fec42503          	lw	a0,-20(s0)
    26ba:	3939                	jal	22d8 <spi_empty_rx>
    26bc:	87aa                	mv	a5,a0
    26be:	c795                	beqz	a5,26ea <spi_event_handler+0x11c>
    26c0:	fec42783          	lw	a5,-20(s0)
    26c4:	43bc                	lw	a5,64(a5)
    26c6:	c395                	beqz	a5,26ea <spi_event_handler+0x11c>
        {
            peri->callbacks.rxwm_cb(peri->txn.txbuffer, peri->txcnt, 
    26c8:	fec42783          	lw	a5,-20(s0)
    26cc:	43bc                	lw	a5,64(a5)
    26ce:	fec42703          	lw	a4,-20(s0)
    26d2:	4f48                	lw	a0,28(a4)
    26d4:	fec42703          	lw	a4,-20(s0)
    26d8:	5b0c                	lw	a1,48(a4)
    26da:	fec42703          	lw	a4,-20(s0)
    26de:	5350                	lw	a2,36(a4)
    26e0:	fec42703          	lw	a4,-20(s0)
    26e4:	5b58                	lw	a4,52(a4)
    26e6:	86ba                	mv	a3,a4
    26e8:	9782                	jalr	a5
                                    peri->txn.rxbuffer, peri->rxcnt);
        }
    }
}
    26ea:	40f2                	lw	ra,28(sp)
    26ec:	4462                	lw	s0,24(sp)
    26ee:	6105                	addi	sp,sp,32
    26f0:	8082                	ret

000026f2 <spi_error_handler>:

void spi_error_handler(spi_peripheral_t* peri, spi_error_e error) 
{
    26f2:	1101                	addi	sp,sp,-32
    26f4:	ce06                	sw	ra,28(sp)
    26f6:	cc22                	sw	s0,24(sp)
    26f8:	1000                	addi	s0,sp,32
    26fa:	fea42623          	sw	a0,-20(s0)
    26fe:	feb42423          	sw	a1,-24(s0)
    // Disable event interrupts
    spi_set_events_enabled(peri->instance, SPI_EVENT_ALL, false);
    2702:	fec42783          	lw	a5,-20(s0)
    2706:	439c                	lw	a5,0(a5)
    2708:	4601                	li	a2,0
    270a:	03f00593          	li	a1,63
    270e:	853e                	mv	a0,a5
    2710:	a8bfe0ef          	jal	119a <spi_set_events_enabled>
    spi_enable_evt_intr   (peri->instance, false);
    2714:	fec42783          	lw	a5,-20(s0)
    2718:	439c                	lw	a5,0(a5)
    271a:	4581                	li	a1,0
    271c:	853e                	mv	a0,a5
    271e:	f11fe0ef          	jal	162e <spi_enable_evt_intr>
    // If there is a callback defined invoke it
    if (peri->callbacks.error_cb != NULL) 
    2722:	fec42783          	lw	a5,-20(s0)
    2726:	43fc                	lw	a5,68(a5)
    2728:	c395                	beqz	a5,274c <spi_error_handler+0x5a>
    {
        peri->callbacks.error_cb(peri->txn.txbuffer, peri->txcnt, 
    272a:	fec42783          	lw	a5,-20(s0)
    272e:	43fc                	lw	a5,68(a5)
    2730:	fec42703          	lw	a4,-20(s0)
    2734:	4f48                	lw	a0,28(a4)
    2736:	fec42703          	lw	a4,-20(s0)
    273a:	5b0c                	lw	a1,48(a4)
    273c:	fec42703          	lw	a4,-20(s0)
    2740:	5350                	lw	a2,36(a4)
    2742:	fec42703          	lw	a4,-20(s0)
    2746:	5b58                	lw	a4,52(a4)
    2748:	86ba                	mv	a3,a4
    274a:	9782                	jalr	a5
                                 peri->txn.rxbuffer, peri->rxcnt);
    }
    spi_reset_peri(peri);
    274c:	fec42503          	lw	a0,-20(s0)
    2750:	3b9d                	jal	24c6 <spi_reset_peri>
    // Set the state to error
    peri->state = SPI_STATE_ERROR;
    2752:	fec42783          	lw	a5,-20(s0)
    2756:	4721                	li	a4,8
    2758:	cb98                	sw	a4,16(a5)
}
    275a:	0001                	nop
    275c:	40f2                	lw	ra,28(sp)
    275e:	4462                	lw	s0,24(sp)
    2760:	6105                	addi	sp,sp,32
    2762:	8082                	ret

00002764 <spi_intr_handler_event_flash>:

/**
 * @brief Implementation of the weak function of the HAL
 */
void spi_intr_handler_event_flash(spi_event_e events) 
{
    2764:	1101                	addi	sp,sp,-32
    2766:	ce06                	sw	ra,28(sp)
    2768:	cc22                	sw	s0,24(sp)
    276a:	1000                	addi	s0,sp,32
    276c:	fea42623          	sw	a0,-20(s0)
    if (SPI_NOT_BUSY(peripherals[SPI_IDX_FLASH])) return;
    2770:	67ad                	lui	a5,0xb
    2772:	39478793          	addi	a5,a5,916 # b394 <peripherals>
    2776:	4b98                	lw	a4,16(a5)
    2778:	4789                	li	a5,2
    277a:	00f71963          	bne	a4,a5,278c <spi_intr_handler_event_flash+0x28>
    spi_event_handler(&peripherals[SPI_IDX_FLASH], events);
    277e:	fec42583          	lw	a1,-20(s0)
    2782:	67ad                	lui	a5,0xb
    2784:	39478513          	addi	a0,a5,916 # b394 <peripherals>
    2788:	3599                	jal	25ce <spi_event_handler>
    278a:	a011                	j	278e <spi_intr_handler_event_flash+0x2a>
    if (SPI_NOT_BUSY(peripherals[SPI_IDX_FLASH])) return;
    278c:	0001                	nop
}
    278e:	40f2                	lw	ra,28(sp)
    2790:	4462                	lw	s0,24(sp)
    2792:	6105                	addi	sp,sp,32
    2794:	8082                	ret

00002796 <spi_intr_handler_error_flash>:

/**
 * @brief Implementation of the weak function of the HAL
 */
void spi_intr_handler_error_flash(spi_error_e errors) 
{
    2796:	1101                	addi	sp,sp,-32
    2798:	ce06                	sw	ra,28(sp)
    279a:	cc22                	sw	s0,24(sp)
    279c:	1000                	addi	s0,sp,32
    279e:	fea42623          	sw	a0,-20(s0)
    if (SPI_NOT_BUSY(peripherals[SPI_IDX_FLASH])) return;
    27a2:	67ad                	lui	a5,0xb
    27a4:	39478793          	addi	a5,a5,916 # b394 <peripherals>
    27a8:	4b98                	lw	a4,16(a5)
    27aa:	4789                	li	a5,2
    27ac:	00f71963          	bne	a4,a5,27be <spi_intr_handler_error_flash+0x28>
    spi_error_handler(&peripherals[SPI_IDX_FLASH], errors);
    27b0:	fec42583          	lw	a1,-20(s0)
    27b4:	67ad                	lui	a5,0xb
    27b6:	39478513          	addi	a0,a5,916 # b394 <peripherals>
    27ba:	3f25                	jal	26f2 <spi_error_handler>
    27bc:	a011                	j	27c0 <spi_intr_handler_error_flash+0x2a>
    if (SPI_NOT_BUSY(peripherals[SPI_IDX_FLASH])) return;
    27be:	0001                	nop
}
    27c0:	40f2                	lw	ra,28(sp)
    27c2:	4462                	lw	s0,24(sp)
    27c4:	6105                	addi	sp,sp,32
    27c6:	8082                	ret

000027c8 <spi_intr_handler_event_host>:

/**
 * @brief Implementation of the weak function of the HAL
 */
void spi_intr_handler_event_host(spi_event_e events) 
{
    27c8:	1101                	addi	sp,sp,-32
    27ca:	ce06                	sw	ra,28(sp)
    27cc:	cc22                	sw	s0,24(sp)
    27ce:	1000                	addi	s0,sp,32
    27d0:	fea42623          	sw	a0,-20(s0)
    if (SPI_NOT_BUSY(peripherals[SPI_IDX_HOST])) return;
    27d4:	67ad                	lui	a5,0xb
    27d6:	39478793          	addi	a5,a5,916 # b394 <peripherals>
    27da:	4fb8                	lw	a4,88(a5)
    27dc:	4789                	li	a5,2
    27de:	00f71963          	bne	a4,a5,27f0 <spi_intr_handler_event_host+0x28>
    spi_event_handler(&peripherals[SPI_IDX_HOST], events);
    27e2:	fec42583          	lw	a1,-20(s0)
    27e6:	67ad                	lui	a5,0xb
    27e8:	3dc78513          	addi	a0,a5,988 # b3dc <peripherals+0x48>
    27ec:	33cd                	jal	25ce <spi_event_handler>
    27ee:	a011                	j	27f2 <spi_intr_handler_event_host+0x2a>
    if (SPI_NOT_BUSY(peripherals[SPI_IDX_HOST])) return;
    27f0:	0001                	nop
}
    27f2:	40f2                	lw	ra,28(sp)
    27f4:	4462                	lw	s0,24(sp)
    27f6:	6105                	addi	sp,sp,32
    27f8:	8082                	ret

000027fa <spi_intr_handler_error_host>:

/**
 * @brief Implementation of the weak function of the HAL
 */
void spi_intr_handler_error_host(spi_error_e errors) 
{
    27fa:	1101                	addi	sp,sp,-32
    27fc:	ce06                	sw	ra,28(sp)
    27fe:	cc22                	sw	s0,24(sp)
    2800:	1000                	addi	s0,sp,32
    2802:	fea42623          	sw	a0,-20(s0)
    if (SPI_NOT_BUSY(peripherals[SPI_IDX_HOST])) return;
    2806:	67ad                	lui	a5,0xb
    2808:	39478793          	addi	a5,a5,916 # b394 <peripherals>
    280c:	4fb8                	lw	a4,88(a5)
    280e:	4789                	li	a5,2
    2810:	00f71963          	bne	a4,a5,2822 <spi_intr_handler_error_host+0x28>
    spi_error_handler(&peripherals[SPI_IDX_HOST], errors);
    2814:	fec42583          	lw	a1,-20(s0)
    2818:	67ad                	lui	a5,0xb
    281a:	3dc78513          	addi	a0,a5,988 # b3dc <peripherals+0x48>
    281e:	3dd1                	jal	26f2 <spi_error_handler>
    2820:	a011                	j	2824 <spi_intr_handler_error_host+0x2a>
    if (SPI_NOT_BUSY(peripherals[SPI_IDX_HOST])) return;
    2822:	0001                	nop
}
    2824:	40f2                	lw	ra,28(sp)
    2826:	4462                	lw	s0,24(sp)
    2828:	6105                	addi	sp,sp,32
    282a:	8082                	ret

0000282c <atexit>:
    282c:	85aa                	mv	a1,a0
    282e:	4681                	li	a3,0
    2830:	4601                	li	a2,0
    2832:	4501                	li	a0,0
    2834:	ae2d                	j	2b6e <__register_exitproc>

00002836 <std>:
    2836:	1141                	addi	sp,sp,-16
    2838:	c422                	sw	s0,8(sp)
    283a:	c606                	sw	ra,12(sp)
    283c:	842a                	mv	s0,a0
    283e:	00b51623          	sh	a1,12(a0) # 3008000c <syscalls_cpp.cpp.cfa7c3ef+0x3006c4b6>
    2842:	00c51723          	sh	a2,14(a0)
    2846:	00052023          	sw	zero,0(a0)
    284a:	00052223          	sw	zero,4(a0)
    284e:	00052423          	sw	zero,8(a0)
    2852:	06052223          	sw	zero,100(a0)
    2856:	00052823          	sw	zero,16(a0)
    285a:	00052a23          	sw	zero,20(a0)
    285e:	00052c23          	sw	zero,24(a0)
    2862:	4621                	li	a2,8
    2864:	4581                	li	a1,0
    2866:	05c50513          	addi	a0,a0,92
    286a:	2cd5                	jal	2b5e <memset>
    286c:	678d                	lui	a5,0x3
    286e:	98a78793          	addi	a5,a5,-1654 # 298a <__sread>
    2872:	d05c                	sw	a5,36(s0)
    2874:	678d                	lui	a5,0x3
    2876:	9ba78793          	addi	a5,a5,-1606 # 29ba <__swrite>
    287a:	d41c                	sw	a5,40(s0)
    287c:	678d                	lui	a5,0x3
    287e:	a0a78793          	addi	a5,a5,-1526 # 2a0a <__sseek>
    2882:	d45c                	sw	a5,44(s0)
    2884:	678d                	lui	a5,0x3
    2886:	a4478793          	addi	a5,a5,-1468 # 2a44 <__sclose>
    288a:	40b2                	lw	ra,12(sp)
    288c:	d000                	sw	s0,32(s0)
    288e:	d81c                	sw	a5,48(s0)
    2890:	4422                	lw	s0,8(sp)
    2892:	0141                	addi	sp,sp,16
    2894:	8082                	ret

00002896 <stdio_exit_handler>:
    2896:	658d                	lui	a1,0x3
    2898:	8d818613          	addi	a2,gp,-1832 # b46c <__sglue>
    289c:	fca58593          	addi	a1,a1,-54 # 2fca <_fflush_r>
    28a0:	8e418513          	addi	a0,gp,-1820 # b478 <_impure_data>
    28a4:	a059                	j	292a <_fwalk_sglue>

000028a6 <cleanup_stdio>:
    28a6:	414c                	lw	a1,4(a0)
    28a8:	1141                	addi	sp,sp,-16
    28aa:	c422                	sw	s0,8(sp)
    28ac:	c606                	sw	ra,12(sp)
    28ae:	a8c18793          	addi	a5,gp,-1396 # b620 <__sf>
    28b2:	842a                	mv	s0,a0
    28b4:	00f58363          	beq	a1,a5,28ba <cleanup_stdio+0x14>
    28b8:	2f09                	jal	2fca <_fflush_r>
    28ba:	440c                	lw	a1,8(s0)
    28bc:	af418793          	addi	a5,gp,-1292 # b688 <__sf+0x68>
    28c0:	00f58463          	beq	a1,a5,28c8 <cleanup_stdio+0x22>
    28c4:	8522                	mv	a0,s0
    28c6:	2711                	jal	2fca <_fflush_r>
    28c8:	444c                	lw	a1,12(s0)
    28ca:	b5c18793          	addi	a5,gp,-1188 # b6f0 <__sf+0xd0>
    28ce:	00f58763          	beq	a1,a5,28dc <cleanup_stdio+0x36>
    28d2:	8522                	mv	a0,s0
    28d4:	4422                	lw	s0,8(sp)
    28d6:	40b2                	lw	ra,12(sp)
    28d8:	0141                	addi	sp,sp,16
    28da:	adc5                	j	2fca <_fflush_r>
    28dc:	40b2                	lw	ra,12(sp)
    28de:	4422                	lw	s0,8(sp)
    28e0:	0141                	addi	sp,sp,16
    28e2:	8082                	ret

000028e4 <global_stdio_init.part.0>:
    28e4:	678d                	lui	a5,0x3
    28e6:	1141                	addi	sp,sp,-16
    28e8:	89678793          	addi	a5,a5,-1898 # 2896 <stdio_exit_handler>
    28ec:	4601                	li	a2,0
    28ee:	4591                	li	a1,4
    28f0:	a8c18513          	addi	a0,gp,-1396 # b620 <__sf>
    28f4:	c606                	sw	ra,12(sp)
    28f6:	92f1ac23          	sw	a5,-1736(gp) # b4cc <__stdio_exit_handler>
    28fa:	3f35                	jal	2836 <std>
    28fc:	4605                	li	a2,1
    28fe:	45a5                	li	a1,9
    2900:	af418513          	addi	a0,gp,-1292 # b688 <__sf+0x68>
    2904:	3f0d                	jal	2836 <std>
    2906:	40b2                	lw	ra,12(sp)
    2908:	4609                	li	a2,2
    290a:	45c9                	li	a1,18
    290c:	b5c18513          	addi	a0,gp,-1188 # b6f0 <__sf+0xd0>
    2910:	0141                	addi	sp,sp,16
    2912:	b715                	j	2836 <std>

00002914 <__sinit>:
    2914:	511c                	lw	a5,32(a0)
    2916:	eb89                	bnez	a5,2928 <__sinit+0x14>
    2918:	678d                	lui	a5,0x3
    291a:	8a678793          	addi	a5,a5,-1882 # 28a6 <cleanup_stdio>
    291e:	d11c                	sw	a5,32(a0)
    2920:	9381a783          	lw	a5,-1736(gp) # b4cc <__stdio_exit_handler>
    2924:	e391                	bnez	a5,2928 <__sinit+0x14>
    2926:	bf7d                	j	28e4 <global_stdio_init.part.0>
    2928:	8082                	ret

0000292a <_fwalk_sglue>:
    292a:	7179                	addi	sp,sp,-48
    292c:	d422                	sw	s0,40(sp)
    292e:	d04a                	sw	s2,32(sp)
    2930:	ce4e                	sw	s3,28(sp)
    2932:	cc52                	sw	s4,24(sp)
    2934:	ca56                	sw	s5,20(sp)
    2936:	d606                	sw	ra,44(sp)
    2938:	d226                	sw	s1,36(sp)
    293a:	8a2a                	mv	s4,a0
    293c:	8aae                	mv	s5,a1
    293e:	4401                	li	s0,0
    2940:	4905                	li	s2,1
    2942:	59fd                	li	s3,-1
    2944:	460c                	lw	a1,8(a2)
    2946:	4244                	lw	s1,4(a2)
    2948:	14fd                	addi	s1,s1,-1
    294a:	0004de63          	bgez	s1,2966 <_fwalk_sglue+0x3c>
    294e:	4210                	lw	a2,0(a2)
    2950:	fa75                	bnez	a2,2944 <_fwalk_sglue+0x1a>
    2952:	50b2                	lw	ra,44(sp)
    2954:	8522                	mv	a0,s0
    2956:	5422                	lw	s0,40(sp)
    2958:	5492                	lw	s1,36(sp)
    295a:	5902                	lw	s2,32(sp)
    295c:	49f2                	lw	s3,28(sp)
    295e:	4a62                	lw	s4,24(sp)
    2960:	4ad2                	lw	s5,20(sp)
    2962:	6145                	addi	sp,sp,48
    2964:	8082                	ret
    2966:	00c5d783          	lhu	a5,12(a1)
    296a:	00f97d63          	bgeu	s2,a5,2984 <_fwalk_sglue+0x5a>
    296e:	00e59783          	lh	a5,14(a1)
    2972:	01378963          	beq	a5,s3,2984 <_fwalk_sglue+0x5a>
    2976:	8552                	mv	a0,s4
    2978:	c632                	sw	a2,12(sp)
    297a:	c42e                	sw	a1,8(sp)
    297c:	9a82                	jalr	s5
    297e:	4632                	lw	a2,12(sp)
    2980:	45a2                	lw	a1,8(sp)
    2982:	8c49                	or	s0,s0,a0
    2984:	06858593          	addi	a1,a1,104
    2988:	b7c1                	j	2948 <_fwalk_sglue+0x1e>

0000298a <__sread>:
    298a:	1141                	addi	sp,sp,-16
    298c:	c422                	sw	s0,8(sp)
    298e:	842e                	mv	s0,a1
    2990:	00e59583          	lh	a1,14(a1)
    2994:	c606                	sw	ra,12(sp)
    2996:	2a01                	jal	2aa6 <_read_r>
    2998:	00054963          	bltz	a0,29aa <__sread+0x20>
    299c:	487c                	lw	a5,84(s0)
    299e:	97aa                	add	a5,a5,a0
    29a0:	c87c                	sw	a5,84(s0)
    29a2:	40b2                	lw	ra,12(sp)
    29a4:	4422                	lw	s0,8(sp)
    29a6:	0141                	addi	sp,sp,16
    29a8:	8082                	ret
    29aa:	00c45783          	lhu	a5,12(s0)
    29ae:	777d                	lui	a4,0xfffff
    29b0:	177d                	addi	a4,a4,-1 # ffffefff <syscalls_cpp.cpp.cfa7c3ef+0xfffeb4a9>
    29b2:	8ff9                	and	a5,a5,a4
    29b4:	00f41623          	sh	a5,12(s0)
    29b8:	b7ed                	j	29a2 <__sread+0x18>

000029ba <__swrite>:
    29ba:	00c5d783          	lhu	a5,12(a1)
    29be:	1101                	addi	sp,sp,-32
    29c0:	cc22                	sw	s0,24(sp)
    29c2:	ca26                	sw	s1,20(sp)
    29c4:	c84a                	sw	s2,16(sp)
    29c6:	c64e                	sw	s3,12(sp)
    29c8:	ce06                	sw	ra,28(sp)
    29ca:	1007f793          	andi	a5,a5,256
    29ce:	84aa                	mv	s1,a0
    29d0:	842e                	mv	s0,a1
    29d2:	8932                	mv	s2,a2
    29d4:	89b6                	mv	s3,a3
    29d6:	c791                	beqz	a5,29e2 <__swrite+0x28>
    29d8:	00e59583          	lh	a1,14(a1)
    29dc:	4689                	li	a3,2
    29de:	4601                	li	a2,0
    29e0:	2859                	jal	2a76 <_lseek_r>
    29e2:	00c45783          	lhu	a5,12(s0)
    29e6:	777d                	lui	a4,0xfffff
    29e8:	177d                	addi	a4,a4,-1 # ffffefff <syscalls_cpp.cpp.cfa7c3ef+0xfffeb4a9>
    29ea:	8ff9                	and	a5,a5,a4
    29ec:	00e41583          	lh	a1,14(s0)
    29f0:	00f41623          	sh	a5,12(s0)
    29f4:	4462                	lw	s0,24(sp)
    29f6:	40f2                	lw	ra,28(sp)
    29f8:	86ce                	mv	a3,s3
    29fa:	864a                	mv	a2,s2
    29fc:	49b2                	lw	s3,12(sp)
    29fe:	4942                	lw	s2,16(sp)
    2a00:	8526                	mv	a0,s1
    2a02:	44d2                	lw	s1,20(sp)
    2a04:	6105                	addi	sp,sp,32
    2a06:	f00ff06f          	j	2106 <_write_r>

00002a0a <__sseek>:
    2a0a:	1141                	addi	sp,sp,-16
    2a0c:	c422                	sw	s0,8(sp)
    2a0e:	842e                	mv	s0,a1
    2a10:	00e59583          	lh	a1,14(a1)
    2a14:	c606                	sw	ra,12(sp)
    2a16:	2085                	jal	2a76 <_lseek_r>
    2a18:	577d                	li	a4,-1
    2a1a:	00c41783          	lh	a5,12(s0)
    2a1e:	00e51d63          	bne	a0,a4,2a38 <__sseek+0x2e>
    2a22:	80050713          	addi	a4,a0,-2048
    2a26:	80070713          	addi	a4,a4,-2048
    2a2a:	8ff9                	and	a5,a5,a4
    2a2c:	00f41623          	sh	a5,12(s0)
    2a30:	40b2                	lw	ra,12(sp)
    2a32:	4422                	lw	s0,8(sp)
    2a34:	0141                	addi	sp,sp,16
    2a36:	8082                	ret
    2a38:	6705                	lui	a4,0x1
    2a3a:	8fd9                	or	a5,a5,a4
    2a3c:	00f41623          	sh	a5,12(s0)
    2a40:	c868                	sw	a0,84(s0)
    2a42:	b7fd                	j	2a30 <__sseek+0x26>

00002a44 <__sclose>:
    2a44:	00e59583          	lh	a1,14(a1)
    2a48:	a009                	j	2a4a <_close_r>

00002a4a <_close_r>:
    2a4a:	1141                	addi	sp,sp,-16
    2a4c:	c422                	sw	s0,8(sp)
    2a4e:	c226                	sw	s1,4(sp)
    2a50:	84aa                	mv	s1,a0
    2a52:	852e                	mv	a0,a1
    2a54:	c606                	sw	ra,12(sp)
    2a56:	9201ae23          	sw	zero,-1732(gp) # b4d0 <errno>
    2a5a:	d2eff0ef          	jal	1f88 <_close>
    2a5e:	57fd                	li	a5,-1
    2a60:	00f51663          	bne	a0,a5,2a6c <_close_r+0x22>
    2a64:	93c1a783          	lw	a5,-1732(gp) # b4d0 <errno>
    2a68:	c391                	beqz	a5,2a6c <_close_r+0x22>
    2a6a:	c09c                	sw	a5,0(s1)
    2a6c:	40b2                	lw	ra,12(sp)
    2a6e:	4422                	lw	s0,8(sp)
    2a70:	4492                	lw	s1,4(sp)
    2a72:	0141                	addi	sp,sp,16
    2a74:	8082                	ret

00002a76 <_lseek_r>:
    2a76:	1141                	addi	sp,sp,-16
    2a78:	c422                	sw	s0,8(sp)
    2a7a:	c226                	sw	s1,4(sp)
    2a7c:	84aa                	mv	s1,a0
    2a7e:	852e                	mv	a0,a1
    2a80:	85b2                	mv	a1,a2
    2a82:	8636                	mv	a2,a3
    2a84:	c606                	sw	ra,12(sp)
    2a86:	9201ae23          	sw	zero,-1732(gp) # b4d0 <errno>
    2a8a:	d96ff0ef          	jal	2020 <_lseek>
    2a8e:	57fd                	li	a5,-1
    2a90:	00f51663          	bne	a0,a5,2a9c <_lseek_r+0x26>
    2a94:	93c1a783          	lw	a5,-1732(gp) # b4d0 <errno>
    2a98:	c391                	beqz	a5,2a9c <_lseek_r+0x26>
    2a9a:	c09c                	sw	a5,0(s1)
    2a9c:	40b2                	lw	ra,12(sp)
    2a9e:	4422                	lw	s0,8(sp)
    2aa0:	4492                	lw	s1,4(sp)
    2aa2:	0141                	addi	sp,sp,16
    2aa4:	8082                	ret

00002aa6 <_read_r>:
    2aa6:	1141                	addi	sp,sp,-16
    2aa8:	c422                	sw	s0,8(sp)
    2aaa:	c226                	sw	s1,4(sp)
    2aac:	84aa                	mv	s1,a0
    2aae:	852e                	mv	a0,a1
    2ab0:	85b2                	mv	a1,a2
    2ab2:	8636                	mv	a2,a3
    2ab4:	c606                	sw	ra,12(sp)
    2ab6:	9201ae23          	sw	zero,-1732(gp) # b4d0 <errno>
    2aba:	d86ff0ef          	jal	2040 <_read>
    2abe:	57fd                	li	a5,-1
    2ac0:	00f51663          	bne	a0,a5,2acc <_read_r+0x26>
    2ac4:	93c1a783          	lw	a5,-1732(gp) # b4d0 <errno>
    2ac8:	c391                	beqz	a5,2acc <_read_r+0x26>
    2aca:	c09c                	sw	a5,0(s1)
    2acc:	40b2                	lw	ra,12(sp)
    2ace:	4422                	lw	s0,8(sp)
    2ad0:	4492                	lw	s1,4(sp)
    2ad2:	0141                	addi	sp,sp,16
    2ad4:	8082                	ret

00002ad6 <__libc_init_array>:
    2ad6:	1141                	addi	sp,sp,-16
    2ad8:	c422                	sw	s0,8(sp)
    2ada:	c226                	sw	s1,4(sp)
    2adc:	642d                	lui	s0,0xb
    2ade:	64ad                	lui	s1,0xb
    2ae0:	39240413          	addi	s0,s0,914 # b392 <__fini_array_end>
    2ae4:	39248493          	addi	s1,s1,914 # b392 <__fini_array_end>
    2ae8:	8c81                	sub	s1,s1,s0
    2aea:	c04a                	sw	s2,0(sp)
    2aec:	c606                	sw	ra,12(sp)
    2aee:	8489                	srai	s1,s1,0x2
    2af0:	4901                	li	s2,0
    2af2:	02991363          	bne	s2,s1,2b18 <__libc_init_array+0x42>
    2af6:	642d                	lui	s0,0xb
    2af8:	64ad                	lui	s1,0xb
    2afa:	39240413          	addi	s0,s0,914 # b392 <__fini_array_end>
    2afe:	39248493          	addi	s1,s1,914 # b392 <__fini_array_end>
    2b02:	8c81                	sub	s1,s1,s0
    2b04:	8489                	srai	s1,s1,0x2
    2b06:	4901                	li	s2,0
    2b08:	00991d63          	bne	s2,s1,2b22 <__libc_init_array+0x4c>
    2b0c:	40b2                	lw	ra,12(sp)
    2b0e:	4422                	lw	s0,8(sp)
    2b10:	4492                	lw	s1,4(sp)
    2b12:	4902                	lw	s2,0(sp)
    2b14:	0141                	addi	sp,sp,16
    2b16:	8082                	ret
    2b18:	401c                	lw	a5,0(s0)
    2b1a:	0905                	addi	s2,s2,1
    2b1c:	0411                	addi	s0,s0,4
    2b1e:	9782                	jalr	a5
    2b20:	bfc9                	j	2af2 <__libc_init_array+0x1c>
    2b22:	401c                	lw	a5,0(s0)
    2b24:	0905                	addi	s2,s2,1
    2b26:	0411                	addi	s0,s0,4
    2b28:	9782                	jalr	a5
    2b2a:	bff9                	j	2b08 <__libc_init_array+0x32>

00002b2c <__libc_fini_array>:
    2b2c:	1141                	addi	sp,sp,-16
    2b2e:	c422                	sw	s0,8(sp)
    2b30:	c226                	sw	s1,4(sp)
    2b32:	642d                	lui	s0,0xb
    2b34:	64ad                	lui	s1,0xb
    2b36:	39248493          	addi	s1,s1,914 # b392 <__fini_array_end>
    2b3a:	39240413          	addi	s0,s0,914 # b392 <__fini_array_end>
    2b3e:	8c05                	sub	s0,s0,s1
    2b40:	c606                	sw	ra,12(sp)
    2b42:	8409                	srai	s0,s0,0x2
    2b44:	e411                	bnez	s0,2b50 <__libc_fini_array+0x24>
    2b46:	40b2                	lw	ra,12(sp)
    2b48:	4422                	lw	s0,8(sp)
    2b4a:	4492                	lw	s1,4(sp)
    2b4c:	0141                	addi	sp,sp,16
    2b4e:	8082                	ret
    2b50:	147d                	addi	s0,s0,-1
    2b52:	00241793          	slli	a5,s0,0x2
    2b56:	97a6                	add	a5,a5,s1
    2b58:	439c                	lw	a5,0(a5)
    2b5a:	9782                	jalr	a5
    2b5c:	b7e5                	j	2b44 <__libc_fini_array+0x18>

00002b5e <memset>:
    2b5e:	832a                	mv	t1,a0
    2b60:	c611                	beqz	a2,2b6c <memset+0xe>
    2b62:	00b30023          	sb	a1,0(t1)
    2b66:	167d                	addi	a2,a2,-1
    2b68:	0305                	addi	t1,t1,1
    2b6a:	fe65                	bnez	a2,2b62 <memset+0x4>
    2b6c:	8082                	ret

00002b6e <__register_exitproc>:
    2b6e:	9401a783          	lw	a5,-1728(gp) # b4d4 <__atexit>
    2b72:	8e2a                	mv	t3,a0
    2b74:	ef81                	bnez	a5,2b8c <__register_exitproc+0x1e>
    2b76:	bc418793          	addi	a5,gp,-1084 # b758 <__atexit0>
    2b7a:	94f1a023          	sw	a5,-1728(gp) # b4d4 <__atexit>
    2b7e:	00000513          	li	a0,0
    2b82:	c509                	beqz	a0,2b8c <__register_exitproc+0x1e>
    2b84:	00002703          	lw	a4,0(zero) # 0 <__vector_start>
    2b88:	08e7a423          	sw	a4,136(a5)
    2b8c:	43d8                	lw	a4,4(a5)
    2b8e:	487d                	li	a6,31
    2b90:	557d                	li	a0,-1
    2b92:	04e84763          	blt	a6,a4,2be0 <__register_exitproc+0x72>
    2b96:	020e0e63          	beqz	t3,2bd2 <__register_exitproc+0x64>
    2b9a:	0887a803          	lw	a6,136(a5)
    2b9e:	04080163          	beqz	a6,2be0 <__register_exitproc+0x72>
    2ba2:	00271893          	slli	a7,a4,0x2
    2ba6:	98c2                	add	a7,a7,a6
    2ba8:	00c8a023          	sw	a2,0(a7)
    2bac:	10082303          	lw	t1,256(a6)
    2bb0:	4605                	li	a2,1
    2bb2:	00e61633          	sll	a2,a2,a4
    2bb6:	00c36333          	or	t1,t1,a2
    2bba:	10682023          	sw	t1,256(a6)
    2bbe:	08d8a023          	sw	a3,128(a7)
    2bc2:	4689                	li	a3,2
    2bc4:	00de1763          	bne	t3,a3,2bd2 <__register_exitproc+0x64>
    2bc8:	10482683          	lw	a3,260(a6)
    2bcc:	8ed1                	or	a3,a3,a2
    2bce:	10d82223          	sw	a3,260(a6)
    2bd2:	00170693          	addi	a3,a4,1 # 1001 <plic_irq_complete+0x23>
    2bd6:	070a                	slli	a4,a4,0x2
    2bd8:	c3d4                	sw	a3,4(a5)
    2bda:	97ba                	add	a5,a5,a4
    2bdc:	c78c                	sw	a1,8(a5)
    2bde:	4501                	li	a0,0
    2be0:	8082                	ret

00002be2 <__call_exitprocs>:
    2be2:	7179                	addi	sp,sp,-48
    2be4:	ca56                	sw	s5,20(sp)
    2be6:	c85a                	sw	s6,16(sp)
    2be8:	c65e                	sw	s7,12(sp)
    2bea:	c266                	sw	s9,4(sp)
    2bec:	d606                	sw	ra,44(sp)
    2bee:	d422                	sw	s0,40(sp)
    2bf0:	d226                	sw	s1,36(sp)
    2bf2:	d04a                	sw	s2,32(sp)
    2bf4:	ce4e                	sw	s3,28(sp)
    2bf6:	cc52                	sw	s4,24(sp)
    2bf8:	c462                	sw	s8,8(sp)
    2bfa:	8caa                	mv	s9,a0
    2bfc:	8b2e                	mv	s6,a1
    2bfe:	4b85                	li	s7,1
    2c00:	9401a483          	lw	s1,-1728(gp) # b4d4 <__atexit>
    2c04:	cc81                	beqz	s1,2c1c <__call_exitprocs+0x3a>
    2c06:	40c0                	lw	s0,4(s1)
    2c08:	0884a983          	lw	s3,136(s1)
    2c0c:	fff40913          	addi	s2,s0,-1
    2c10:	040a                	slli	s0,s0,0x2
    2c12:	00898a33          	add	s4,s3,s0
    2c16:	9426                	add	s0,s0,s1
    2c18:	00095f63          	bgez	s2,2c36 <__call_exitprocs+0x54>
    2c1c:	50b2                	lw	ra,44(sp)
    2c1e:	5422                	lw	s0,40(sp)
    2c20:	5492                	lw	s1,36(sp)
    2c22:	5902                	lw	s2,32(sp)
    2c24:	49f2                	lw	s3,28(sp)
    2c26:	4a62                	lw	s4,24(sp)
    2c28:	4ad2                	lw	s5,20(sp)
    2c2a:	4b42                	lw	s6,16(sp)
    2c2c:	4bb2                	lw	s7,12(sp)
    2c2e:	4c22                	lw	s8,8(sp)
    2c30:	4c92                	lw	s9,4(sp)
    2c32:	6145                	addi	sp,sp,48
    2c34:	8082                	ret
    2c36:	000b0c63          	beqz	s6,2c4e <__call_exitprocs+0x6c>
    2c3a:	00099663          	bnez	s3,2c46 <__call_exitprocs+0x64>
    2c3e:	197d                	addi	s2,s2,-1
    2c40:	1a71                	addi	s4,s4,-4
    2c42:	1471                	addi	s0,s0,-4
    2c44:	bfd1                	j	2c18 <__call_exitprocs+0x36>
    2c46:	07ca2783          	lw	a5,124(s4)
    2c4a:	ff679ae3          	bne	a5,s6,2c3e <__call_exitprocs+0x5c>
    2c4e:	40d8                	lw	a4,4(s1)
    2c50:	405c                	lw	a5,4(s0)
    2c52:	177d                	addi	a4,a4,-1
    2c54:	03271863          	bne	a4,s2,2c84 <__call_exitprocs+0xa2>
    2c58:	0124a223          	sw	s2,4(s1)
    2c5c:	d3ed                	beqz	a5,2c3e <__call_exitprocs+0x5c>
    2c5e:	0044ac03          	lw	s8,4(s1)
    2c62:	00098863          	beqz	s3,2c72 <__call_exitprocs+0x90>
    2c66:	1009a683          	lw	a3,256(s3)
    2c6a:	012b9733          	sll	a4,s7,s2
    2c6e:	8ef9                	and	a3,a3,a4
    2c70:	ee89                	bnez	a3,2c8a <__call_exitprocs+0xa8>
    2c72:	9782                	jalr	a5
    2c74:	40dc                	lw	a5,4(s1)
    2c76:	f98795e3          	bne	a5,s8,2c00 <__call_exitprocs+0x1e>
    2c7a:	9401a783          	lw	a5,-1728(gp) # b4d4 <__atexit>
    2c7e:	fcf480e3          	beq	s1,a5,2c3e <__call_exitprocs+0x5c>
    2c82:	bfbd                	j	2c00 <__call_exitprocs+0x1e>
    2c84:	00042223          	sw	zero,4(s0)
    2c88:	bfd1                	j	2c5c <__call_exitprocs+0x7a>
    2c8a:	1049a683          	lw	a3,260(s3)
    2c8e:	ffca2583          	lw	a1,-4(s4)
    2c92:	8f75                	and	a4,a4,a3
    2c94:	e701                	bnez	a4,2c9c <__call_exitprocs+0xba>
    2c96:	8566                	mv	a0,s9
    2c98:	9782                	jalr	a5
    2c9a:	bfe9                	j	2c74 <__call_exitprocs+0x92>
    2c9c:	852e                	mv	a0,a1
    2c9e:	9782                	jalr	a5
    2ca0:	bfd1                	j	2c74 <__call_exitprocs+0x92>

00002ca2 <_free_r>:
    2ca2:	cdd1                	beqz	a1,2d3e <_free_r+0x9c>
    2ca4:	ffc5a783          	lw	a5,-4(a1)
    2ca8:	1101                	addi	sp,sp,-32
    2caa:	cc22                	sw	s0,24(sp)
    2cac:	ce06                	sw	ra,28(sp)
    2cae:	ffc58413          	addi	s0,a1,-4
    2cb2:	0007d363          	bgez	a5,2cb8 <_free_r+0x16>
    2cb6:	943e                	add	s0,s0,a5
    2cb8:	c62a                	sw	a0,12(sp)
    2cba:	22e5                	jal	2ea2 <__malloc_lock>
    2cbc:	9481a783          	lw	a5,-1720(gp) # b4dc <__malloc_free_list>
    2cc0:	4532                	lw	a0,12(sp)
    2cc2:	eb89                	bnez	a5,2cd4 <_free_r+0x32>
    2cc4:	00042223          	sw	zero,4(s0)
    2cc8:	9481a423          	sw	s0,-1720(gp) # b4dc <__malloc_free_list>
    2ccc:	4462                	lw	s0,24(sp)
    2cce:	40f2                	lw	ra,28(sp)
    2cd0:	6105                	addi	sp,sp,32
    2cd2:	aac9                	j	2ea4 <__malloc_unlock>
    2cd4:	00f47d63          	bgeu	s0,a5,2cee <_free_r+0x4c>
    2cd8:	4010                	lw	a2,0(s0)
    2cda:	00c406b3          	add	a3,s0,a2
    2cde:	00d79663          	bne	a5,a3,2cea <_free_r+0x48>
    2ce2:	4394                	lw	a3,0(a5)
    2ce4:	43dc                	lw	a5,4(a5)
    2ce6:	96b2                	add	a3,a3,a2
    2ce8:	c014                	sw	a3,0(s0)
    2cea:	c05c                	sw	a5,4(s0)
    2cec:	bff1                	j	2cc8 <_free_r+0x26>
    2cee:	873e                	mv	a4,a5
    2cf0:	43dc                	lw	a5,4(a5)
    2cf2:	c399                	beqz	a5,2cf8 <_free_r+0x56>
    2cf4:	fef47de3          	bgeu	s0,a5,2cee <_free_r+0x4c>
    2cf8:	4314                	lw	a3,0(a4)
    2cfa:	00d70633          	add	a2,a4,a3
    2cfe:	00861f63          	bne	a2,s0,2d1c <_free_r+0x7a>
    2d02:	4010                	lw	a2,0(s0)
    2d04:	96b2                	add	a3,a3,a2
    2d06:	c314                	sw	a3,0(a4)
    2d08:	00d70633          	add	a2,a4,a3
    2d0c:	fcc790e3          	bne	a5,a2,2ccc <_free_r+0x2a>
    2d10:	4390                	lw	a2,0(a5)
    2d12:	43dc                	lw	a5,4(a5)
    2d14:	96b2                	add	a3,a3,a2
    2d16:	c314                	sw	a3,0(a4)
    2d18:	c35c                	sw	a5,4(a4)
    2d1a:	bf4d                	j	2ccc <_free_r+0x2a>
    2d1c:	00c47563          	bgeu	s0,a2,2d26 <_free_r+0x84>
    2d20:	47b1                	li	a5,12
    2d22:	c11c                	sw	a5,0(a0)
    2d24:	b765                	j	2ccc <_free_r+0x2a>
    2d26:	4010                	lw	a2,0(s0)
    2d28:	00c406b3          	add	a3,s0,a2
    2d2c:	00d79663          	bne	a5,a3,2d38 <_free_r+0x96>
    2d30:	4394                	lw	a3,0(a5)
    2d32:	43dc                	lw	a5,4(a5)
    2d34:	96b2                	add	a3,a3,a2
    2d36:	c014                	sw	a3,0(s0)
    2d38:	c05c                	sw	a5,4(s0)
    2d3a:	c340                	sw	s0,4(a4)
    2d3c:	bf41                	j	2ccc <_free_r+0x2a>
    2d3e:	8082                	ret

00002d40 <sbrk_aligned>:
    2d40:	1141                	addi	sp,sp,-16
    2d42:	c422                	sw	s0,8(sp)
    2d44:	9441a783          	lw	a5,-1724(gp) # b4d8 <__malloc_sbrk_start>
    2d48:	c226                	sw	s1,4(sp)
    2d4a:	c04a                	sw	s2,0(sp)
    2d4c:	c606                	sw	ra,12(sp)
    2d4e:	892a                	mv	s2,a0
    2d50:	84ae                	mv	s1,a1
    2d52:	e789                	bnez	a5,2d5c <sbrk_aligned+0x1c>
    2d54:	4581                	li	a1,0
    2d56:	246d                	jal	3000 <_sbrk_r>
    2d58:	94a1a223          	sw	a0,-1724(gp) # b4d8 <__malloc_sbrk_start>
    2d5c:	85a6                	mv	a1,s1
    2d5e:	854a                	mv	a0,s2
    2d60:	2445                	jal	3000 <_sbrk_r>
    2d62:	54fd                	li	s1,-1
    2d64:	00951a63          	bne	a0,s1,2d78 <sbrk_aligned+0x38>
    2d68:	547d                	li	s0,-1
    2d6a:	40b2                	lw	ra,12(sp)
    2d6c:	8522                	mv	a0,s0
    2d6e:	4422                	lw	s0,8(sp)
    2d70:	4492                	lw	s1,4(sp)
    2d72:	4902                	lw	s2,0(sp)
    2d74:	0141                	addi	sp,sp,16
    2d76:	8082                	ret
    2d78:	00350413          	addi	s0,a0,3
    2d7c:	9871                	andi	s0,s0,-4
    2d7e:	fe8506e3          	beq	a0,s0,2d6a <sbrk_aligned+0x2a>
    2d82:	40a405b3          	sub	a1,s0,a0
    2d86:	854a                	mv	a0,s2
    2d88:	2ca5                	jal	3000 <_sbrk_r>
    2d8a:	fe9510e3          	bne	a0,s1,2d6a <sbrk_aligned+0x2a>
    2d8e:	bfe9                	j	2d68 <sbrk_aligned+0x28>

00002d90 <_malloc_r>:
    2d90:	1101                	addi	sp,sp,-32
    2d92:	ca26                	sw	s1,20(sp)
    2d94:	00358493          	addi	s1,a1,3
    2d98:	98f1                	andi	s1,s1,-4
    2d9a:	ce06                	sw	ra,28(sp)
    2d9c:	cc22                	sw	s0,24(sp)
    2d9e:	c84a                	sw	s2,16(sp)
    2da0:	c64e                	sw	s3,12(sp)
    2da2:	c452                	sw	s4,8(sp)
    2da4:	04a1                	addi	s1,s1,8
    2da6:	47b1                	li	a5,12
    2da8:	00f4f363          	bgeu	s1,a5,2dae <_malloc_r+0x1e>
    2dac:	84be                	mv	s1,a5
    2dae:	0004c463          	bltz	s1,2db6 <_malloc_r+0x26>
    2db2:	00b4fd63          	bgeu	s1,a1,2dcc <_malloc_r+0x3c>
    2db6:	47b1                	li	a5,12
    2db8:	c11c                	sw	a5,0(a0)
    2dba:	4501                	li	a0,0
    2dbc:	40f2                	lw	ra,28(sp)
    2dbe:	4462                	lw	s0,24(sp)
    2dc0:	44d2                	lw	s1,20(sp)
    2dc2:	4942                	lw	s2,16(sp)
    2dc4:	49b2                	lw	s3,12(sp)
    2dc6:	4a22                	lw	s4,8(sp)
    2dc8:	6105                	addi	sp,sp,32
    2dca:	8082                	ret
    2dcc:	892a                	mv	s2,a0
    2dce:	28d1                	jal	2ea2 <__malloc_lock>
    2dd0:	9481a783          	lw	a5,-1720(gp) # b4dc <__malloc_free_list>
    2dd4:	843e                	mv	s0,a5
    2dd6:	e439                	bnez	s0,2e24 <_malloc_r+0x94>
    2dd8:	85a6                	mv	a1,s1
    2dda:	854a                	mv	a0,s2
    2ddc:	3795                	jal	2d40 <sbrk_aligned>
    2dde:	57fd                	li	a5,-1
    2de0:	842a                	mv	s0,a0
    2de2:	0af51e63          	bne	a0,a5,2e9e <_malloc_r+0x10e>
    2de6:	9481a403          	lw	s0,-1720(gp) # b4dc <__malloc_free_list>
    2dea:	87a2                	mv	a5,s0
    2dec:	ebc9                	bnez	a5,2e7e <_malloc_r+0xee>
    2dee:	c055                	beqz	s0,2e92 <_malloc_r+0x102>
    2df0:	00042a03          	lw	s4,0(s0)
    2df4:	4581                	li	a1,0
    2df6:	854a                	mv	a0,s2
    2df8:	9a22                	add	s4,s4,s0
    2dfa:	2419                	jal	3000 <_sbrk_r>
    2dfc:	08aa1b63          	bne	s4,a0,2e92 <_malloc_r+0x102>
    2e00:	401c                	lw	a5,0(s0)
    2e02:	854a                	mv	a0,s2
    2e04:	8c9d                	sub	s1,s1,a5
    2e06:	85a6                	mv	a1,s1
    2e08:	3f25                	jal	2d40 <sbrk_aligned>
    2e0a:	57fd                	li	a5,-1
    2e0c:	08f50363          	beq	a0,a5,2e92 <_malloc_r+0x102>
    2e10:	401c                	lw	a5,0(s0)
    2e12:	97a6                	add	a5,a5,s1
    2e14:	c01c                	sw	a5,0(s0)
    2e16:	9481a783          	lw	a5,-1720(gp) # b4dc <__malloc_free_list>
    2e1a:	43d8                	lw	a4,4(a5)
    2e1c:	e725                	bnez	a4,2e84 <_malloc_r+0xf4>
    2e1e:	9401a423          	sw	zero,-1720(gp) # b4dc <__malloc_free_list>
    2e22:	a015                	j	2e46 <_malloc_r+0xb6>
    2e24:	4014                	lw	a3,0(s0)
    2e26:	8e85                	sub	a3,a3,s1
    2e28:	0406c863          	bltz	a3,2e78 <_malloc_r+0xe8>
    2e2c:	472d                	li	a4,11
    2e2e:	02d77d63          	bgeu	a4,a3,2e68 <_malloc_r+0xd8>
    2e32:	c004                	sw	s1,0(s0)
    2e34:	00940733          	add	a4,s0,s1
    2e38:	02879663          	bne	a5,s0,2e64 <_malloc_r+0xd4>
    2e3c:	94e1a423          	sw	a4,-1720(gp) # b4dc <__malloc_free_list>
    2e40:	405c                	lw	a5,4(s0)
    2e42:	c314                	sw	a3,0(a4)
    2e44:	c35c                	sw	a5,4(a4)
    2e46:	854a                	mv	a0,s2
    2e48:	28b1                	jal	2ea4 <__malloc_unlock>
    2e4a:	00b40513          	addi	a0,s0,11
    2e4e:	00440793          	addi	a5,s0,4
    2e52:	9961                	andi	a0,a0,-8
    2e54:	40f50733          	sub	a4,a0,a5
    2e58:	f6f502e3          	beq	a0,a5,2dbc <_malloc_r+0x2c>
    2e5c:	943a                	add	s0,s0,a4
    2e5e:	8f89                	sub	a5,a5,a0
    2e60:	c01c                	sw	a5,0(s0)
    2e62:	bfa9                	j	2dbc <_malloc_r+0x2c>
    2e64:	c3d8                	sw	a4,4(a5)
    2e66:	bfe9                	j	2e40 <_malloc_r+0xb0>
    2e68:	4058                	lw	a4,4(s0)
    2e6a:	00879563          	bne	a5,s0,2e74 <_malloc_r+0xe4>
    2e6e:	94e1a423          	sw	a4,-1720(gp) # b4dc <__malloc_free_list>
    2e72:	bfd1                	j	2e46 <_malloc_r+0xb6>
    2e74:	c3d8                	sw	a4,4(a5)
    2e76:	bfc1                	j	2e46 <_malloc_r+0xb6>
    2e78:	87a2                	mv	a5,s0
    2e7a:	4040                	lw	s0,4(s0)
    2e7c:	bfa9                	j	2dd6 <_malloc_r+0x46>
    2e7e:	843e                	mv	s0,a5
    2e80:	43dc                	lw	a5,4(a5)
    2e82:	b7ad                	j	2dec <_malloc_r+0x5c>
    2e84:	873e                	mv	a4,a5
    2e86:	43dc                	lw	a5,4(a5)
    2e88:	fe879ee3          	bne	a5,s0,2e84 <_malloc_r+0xf4>
    2e8c:	00072223          	sw	zero,4(a4)
    2e90:	bf5d                	j	2e46 <_malloc_r+0xb6>
    2e92:	47b1                	li	a5,12
    2e94:	00f92023          	sw	a5,0(s2)
    2e98:	854a                	mv	a0,s2
    2e9a:	2029                	jal	2ea4 <__malloc_unlock>
    2e9c:	bf39                	j	2dba <_malloc_r+0x2a>
    2e9e:	c104                	sw	s1,0(a0)
    2ea0:	b75d                	j	2e46 <_malloc_r+0xb6>

00002ea2 <__malloc_lock>:
    2ea2:	8082                	ret

00002ea4 <__malloc_unlock>:
    2ea4:	8082                	ret

00002ea6 <__sflush_r>:
    2ea6:	00c59783          	lh	a5,12(a1)
    2eaa:	1101                	addi	sp,sp,-32
    2eac:	cc22                	sw	s0,24(sp)
    2eae:	ca26                	sw	s1,20(sp)
    2eb0:	ce06                	sw	ra,28(sp)
    2eb2:	c84a                	sw	s2,16(sp)
    2eb4:	0087f713          	andi	a4,a5,8
    2eb8:	84aa                	mv	s1,a0
    2eba:	842e                	mv	s0,a1
    2ebc:	e361                	bnez	a4,2f7c <__sflush_r+0xd6>
    2ebe:	41d8                	lw	a4,4(a1)
    2ec0:	00e04563          	bgtz	a4,2eca <__sflush_r+0x24>
    2ec4:	41b8                	lw	a4,64(a1)
    2ec6:	0ae05963          	blez	a4,2f78 <__sflush_r+0xd2>
    2eca:	5458                	lw	a4,44(s0)
    2ecc:	c755                	beqz	a4,2f78 <__sflush_r+0xd2>
    2ece:	0004a903          	lw	s2,0(s1)
    2ed2:	01379693          	slli	a3,a5,0x13
    2ed6:	0004a023          	sw	zero,0(s1)
    2eda:	0606dd63          	bgez	a3,2f54 <__sflush_r+0xae>
    2ede:	4870                	lw	a2,84(s0)
    2ee0:	00c45783          	lhu	a5,12(s0)
    2ee4:	8b91                	andi	a5,a5,4
    2ee6:	c799                	beqz	a5,2ef4 <__sflush_r+0x4e>
    2ee8:	405c                	lw	a5,4(s0)
    2eea:	8e1d                	sub	a2,a2,a5
    2eec:	585c                	lw	a5,52(s0)
    2eee:	c399                	beqz	a5,2ef4 <__sflush_r+0x4e>
    2ef0:	403c                	lw	a5,64(s0)
    2ef2:	8e1d                	sub	a2,a2,a5
    2ef4:	545c                	lw	a5,44(s0)
    2ef6:	500c                	lw	a1,32(s0)
    2ef8:	4681                	li	a3,0
    2efa:	8526                	mv	a0,s1
    2efc:	9782                	jalr	a5
    2efe:	577d                	li	a4,-1
    2f00:	00c41783          	lh	a5,12(s0)
    2f04:	00e51d63          	bne	a0,a4,2f1e <__sflush_r+0x78>
    2f08:	4094                	lw	a3,0(s1)
    2f0a:	4775                	li	a4,29
    2f0c:	0ad76063          	bltu	a4,a3,2fac <__sflush_r+0x106>
    2f10:	20400737          	lui	a4,0x20400
    2f14:	0705                	addi	a4,a4,1 # 20400001 <syscalls_cpp.cpp.cfa7c3ef+0x203ec4ab>
    2f16:	00d75733          	srl	a4,a4,a3
    2f1a:	8b05                	andi	a4,a4,1
    2f1c:	cb41                	beqz	a4,2fac <__sflush_r+0x106>
    2f1e:	4818                	lw	a4,16(s0)
    2f20:	00042223          	sw	zero,4(s0)
    2f24:	c018                	sw	a4,0(s0)
    2f26:	01379713          	slli	a4,a5,0x13
    2f2a:	00075863          	bgez	a4,2f3a <__sflush_r+0x94>
    2f2e:	57fd                	li	a5,-1
    2f30:	00f51463          	bne	a0,a5,2f38 <__sflush_r+0x92>
    2f34:	409c                	lw	a5,0(s1)
    2f36:	e391                	bnez	a5,2f3a <__sflush_r+0x94>
    2f38:	c868                	sw	a0,84(s0)
    2f3a:	584c                	lw	a1,52(s0)
    2f3c:	0124a023          	sw	s2,0(s1)
    2f40:	cd85                	beqz	a1,2f78 <__sflush_r+0xd2>
    2f42:	04440793          	addi	a5,s0,68
    2f46:	00f58463          	beq	a1,a5,2f4e <__sflush_r+0xa8>
    2f4a:	8526                	mv	a0,s1
    2f4c:	3b99                	jal	2ca2 <_free_r>
    2f4e:	02042a23          	sw	zero,52(s0)
    2f52:	a01d                	j	2f78 <__sflush_r+0xd2>
    2f54:	500c                	lw	a1,32(s0)
    2f56:	4601                	li	a2,0
    2f58:	4685                	li	a3,1
    2f5a:	8526                	mv	a0,s1
    2f5c:	9702                	jalr	a4
    2f5e:	57fd                	li	a5,-1
    2f60:	862a                	mv	a2,a0
    2f62:	f6f51fe3          	bne	a0,a5,2ee0 <__sflush_r+0x3a>
    2f66:	409c                	lw	a5,0(s1)
    2f68:	dfa5                	beqz	a5,2ee0 <__sflush_r+0x3a>
    2f6a:	fe378713          	addi	a4,a5,-29
    2f6e:	c319                	beqz	a4,2f74 <__sflush_r+0xce>
    2f70:	17a9                	addi	a5,a5,-22
    2f72:	eb9d                	bnez	a5,2fa8 <__sflush_r+0x102>
    2f74:	0124a023          	sw	s2,0(s1)
    2f78:	4501                	li	a0,0
    2f7a:	a835                	j	2fb6 <__sflush_r+0x110>
    2f7c:	4990                	lw	a2,16(a1)
    2f7e:	de6d                	beqz	a2,2f78 <__sflush_r+0xd2>
    2f80:	4194                	lw	a3,0(a1)
    2f82:	8b8d                	andi	a5,a5,3
    2f84:	c190                	sw	a2,0(a1)
    2f86:	40c68933          	sub	s2,a3,a2
    2f8a:	4701                	li	a4,0
    2f8c:	e391                	bnez	a5,2f90 <__sflush_r+0xea>
    2f8e:	49d8                	lw	a4,20(a1)
    2f90:	c418                	sw	a4,8(s0)
    2f92:	ff2053e3          	blez	s2,2f78 <__sflush_r+0xd2>
    2f96:	541c                	lw	a5,40(s0)
    2f98:	500c                	lw	a1,32(s0)
    2f9a:	86ca                	mv	a3,s2
    2f9c:	8526                	mv	a0,s1
    2f9e:	c632                	sw	a2,12(sp)
    2fa0:	9782                	jalr	a5
    2fa2:	4632                	lw	a2,12(sp)
    2fa4:	00a04f63          	bgtz	a0,2fc2 <__sflush_r+0x11c>
    2fa8:	00c45783          	lhu	a5,12(s0)
    2fac:	0407e793          	ori	a5,a5,64
    2fb0:	00f41623          	sh	a5,12(s0)
    2fb4:	557d                	li	a0,-1
    2fb6:	40f2                	lw	ra,28(sp)
    2fb8:	4462                	lw	s0,24(sp)
    2fba:	44d2                	lw	s1,20(sp)
    2fbc:	4942                	lw	s2,16(sp)
    2fbe:	6105                	addi	sp,sp,32
    2fc0:	8082                	ret
    2fc2:	962a                	add	a2,a2,a0
    2fc4:	40a90933          	sub	s2,s2,a0
    2fc8:	b7e9                	j	2f92 <__sflush_r+0xec>

00002fca <_fflush_r>:
    2fca:	499c                	lw	a5,16(a1)
    2fcc:	cb85                	beqz	a5,2ffc <_fflush_r+0x32>
    2fce:	1101                	addi	sp,sp,-32
    2fd0:	cc22                	sw	s0,24(sp)
    2fd2:	ce06                	sw	ra,28(sp)
    2fd4:	842a                	mv	s0,a0
    2fd6:	c511                	beqz	a0,2fe2 <_fflush_r+0x18>
    2fd8:	511c                	lw	a5,32(a0)
    2fda:	e781                	bnez	a5,2fe2 <_fflush_r+0x18>
    2fdc:	c62e                	sw	a1,12(sp)
    2fde:	3a1d                	jal	2914 <__sinit>
    2fe0:	45b2                	lw	a1,12(sp)
    2fe2:	00c59783          	lh	a5,12(a1)
    2fe6:	c791                	beqz	a5,2ff2 <_fflush_r+0x28>
    2fe8:	8522                	mv	a0,s0
    2fea:	4462                	lw	s0,24(sp)
    2fec:	40f2                	lw	ra,28(sp)
    2fee:	6105                	addi	sp,sp,32
    2ff0:	bd5d                	j	2ea6 <__sflush_r>
    2ff2:	40f2                	lw	ra,28(sp)
    2ff4:	4462                	lw	s0,24(sp)
    2ff6:	4501                	li	a0,0
    2ff8:	6105                	addi	sp,sp,32
    2ffa:	8082                	ret
    2ffc:	4501                	li	a0,0
    2ffe:	8082                	ret

00003000 <_sbrk_r>:
    3000:	1141                	addi	sp,sp,-16
    3002:	c422                	sw	s0,8(sp)
    3004:	c226                	sw	s1,4(sp)
    3006:	84aa                	mv	s1,a0
    3008:	852e                	mv	a0,a1
    300a:	c606                	sw	ra,12(sp)
    300c:	9201ae23          	sw	zero,-1732(gp) # b4d0 <errno>
    3010:	956ff0ef          	jal	2166 <_sbrk>
    3014:	57fd                	li	a5,-1
    3016:	00f51663          	bne	a0,a5,3022 <_sbrk_r+0x22>
    301a:	93c1a783          	lw	a5,-1732(gp) # b4d0 <errno>
    301e:	c391                	beqz	a5,3022 <_sbrk_r+0x22>
    3020:	c09c                	sw	a5,0(s1)
    3022:	40b2                	lw	ra,12(sp)
    3024:	4422                	lw	s0,8(sp)
    3026:	4492                	lw	s1,4(sp)
    3028:	0141                	addi	sp,sp,16
    302a:	8082                	ret

0000302c <malloc>:
    302c:	85aa                	mv	a1,a0
    302e:	9341a503          	lw	a0,-1740(gp) # b4c8 <_impure_ptr>
    3032:	bbb9                	j	2d90 <_malloc_r>

00003034 <iprintf>:
    3034:	7139                	addi	sp,sp,-64
    3036:	da3e                	sw	a5,52(sp)
    3038:	9341a783          	lw	a5,-1740(gp) # b4c8 <_impure_ptr>
    303c:	d432                	sw	a2,40(sp)
    303e:	d636                	sw	a3,44(sp)
    3040:	d22e                	sw	a1,36(sp)
    3042:	d83a                	sw	a4,48(sp)
    3044:	dc42                	sw	a6,56(sp)
    3046:	de46                	sw	a7,60(sp)
    3048:	478c                	lw	a1,8(a5)
    304a:	1054                	addi	a3,sp,36
    304c:	862a                	mv	a2,a0
    304e:	853e                	mv	a0,a5
    3050:	ce06                	sw	ra,28(sp)
    3052:	c636                	sw	a3,12(sp)
    3054:	2051                	jal	30d8 <_vfiprintf_r>
    3056:	40f2                	lw	ra,28(sp)
    3058:	6121                	addi	sp,sp,64
    305a:	8082                	ret

0000305c <strlen>:
    305c:	87aa                	mv	a5,a0
    305e:	0007c703          	lbu	a4,0(a5)
    3062:	0785                	addi	a5,a5,1
    3064:	ff6d                	bnez	a4,305e <strlen+0x2>
    3066:	40a78533          	sub	a0,a5,a0
    306a:	157d                	addi	a0,a0,-1
    306c:	8082                	ret

0000306e <__sfputc_r>:
    306e:	461c                	lw	a5,8(a2)
    3070:	17fd                	addi	a5,a5,-1
    3072:	c61c                	sw	a5,8(a2)
    3074:	0007d963          	bgez	a5,3086 <__sfputc_r+0x18>
    3078:	4e18                	lw	a4,24(a2)
    307a:	00e7c563          	blt	a5,a4,3084 <__sfputc_r+0x16>
    307e:	ff658793          	addi	a5,a1,-10
    3082:	e391                	bnez	a5,3086 <__sfputc_r+0x18>
    3084:	ad39                	j	36a2 <__swbuf_r>
    3086:	421c                	lw	a5,0(a2)
    3088:	852e                	mv	a0,a1
    308a:	00178713          	addi	a4,a5,1
    308e:	c218                	sw	a4,0(a2)
    3090:	00b78023          	sb	a1,0(a5)
    3094:	8082                	ret

00003096 <__sfputs_r>:
    3096:	1101                	addi	sp,sp,-32
    3098:	cc22                	sw	s0,24(sp)
    309a:	ca26                	sw	s1,20(sp)
    309c:	c84a                	sw	s2,16(sp)
    309e:	c64e                	sw	s3,12(sp)
    30a0:	c452                	sw	s4,8(sp)
    30a2:	ce06                	sw	ra,28(sp)
    30a4:	89aa                	mv	s3,a0
    30a6:	8a2e                	mv	s4,a1
    30a8:	8432                	mv	s0,a2
    30aa:	00d604b3          	add	s1,a2,a3
    30ae:	597d                	li	s2,-1
    30b0:	00941463          	bne	s0,s1,30b8 <__sfputs_r+0x22>
    30b4:	4501                	li	a0,0
    30b6:	a809                	j	30c8 <__sfputs_r+0x32>
    30b8:	00044583          	lbu	a1,0(s0)
    30bc:	8652                	mv	a2,s4
    30be:	854e                	mv	a0,s3
    30c0:	377d                	jal	306e <__sfputc_r>
    30c2:	0405                	addi	s0,s0,1
    30c4:	ff2516e3          	bne	a0,s2,30b0 <__sfputs_r+0x1a>
    30c8:	40f2                	lw	ra,28(sp)
    30ca:	4462                	lw	s0,24(sp)
    30cc:	44d2                	lw	s1,20(sp)
    30ce:	4942                	lw	s2,16(sp)
    30d0:	49b2                	lw	s3,12(sp)
    30d2:	4a22                	lw	s4,8(sp)
    30d4:	6105                	addi	sp,sp,32
    30d6:	8082                	ret

000030d8 <_vfiprintf_r>:
    30d8:	7171                	addi	sp,sp,-176
    30da:	d522                	sw	s0,168(sp)
    30dc:	d326                	sw	s1,164(sp)
    30de:	cf4e                	sw	s3,156(sp)
    30e0:	cd52                	sw	s4,152(sp)
    30e2:	d706                	sw	ra,172(sp)
    30e4:	d14a                	sw	s2,160(sp)
    30e6:	cb56                	sw	s5,148(sp)
    30e8:	c95a                	sw	s6,144(sp)
    30ea:	c75e                	sw	s7,140(sp)
    30ec:	c562                	sw	s8,136(sp)
    30ee:	c366                	sw	s9,132(sp)
    30f0:	89aa                	mv	s3,a0
    30f2:	84ae                	mv	s1,a1
    30f4:	8432                	mv	s0,a2
    30f6:	8a36                	mv	s4,a3
    30f8:	c501                	beqz	a0,3100 <_vfiprintf_r+0x28>
    30fa:	511c                	lw	a5,32(a0)
    30fc:	e391                	bnez	a5,3100 <_vfiprintf_r+0x28>
    30fe:	3819                	jal	2914 <__sinit>
    3100:	00c4d783          	lhu	a5,12(s1)
    3104:	8ba1                	andi	a5,a5,8
    3106:	c7f9                	beqz	a5,31d4 <_vfiprintf_r+0xfc>
    3108:	489c                	lw	a5,16(s1)
    310a:	c7e9                	beqz	a5,31d4 <_vfiprintf_r+0xfc>
    310c:	02000793          	li	a5,32
    3110:	02f10ca3          	sb	a5,57(sp)
    3114:	ce52                	sw	s4,28(sp)
    3116:	03000793          	li	a5,48
    311a:	6a29                	lui	s4,0xa
    311c:	6aa9                	lui	s5,0xa
    311e:	da02                	sw	zero,52(sp)
    3120:	02f10d23          	sb	a5,58(sp)
    3124:	5b7d                	li	s6,-1
    3126:	660a0a13          	addi	s4,s4,1632 # a660 <dma.c.e6d7bed9+0x953>
    312a:	4b85                	li	s7,1
    312c:	668a8a93          	addi	s5,s5,1640 # a668 <dma.c.e6d7bed9+0x95b>
    3130:	8c22                	mv	s8,s0
    3132:	000c4783          	lbu	a5,0(s8)
    3136:	00f03cb3          	snez	s9,a5
    313a:	fdb78793          	addi	a5,a5,-37
    313e:	00f037b3          	snez	a5,a5
    3142:	00fcfcb3          	and	s9,s9,a5
    3146:	0a0c9963          	bnez	s9,31f8 <_vfiprintf_r+0x120>
    314a:	408c06b3          	sub	a3,s8,s0
    314e:	008c0d63          	beq	s8,s0,3168 <_vfiprintf_r+0x90>
    3152:	8622                	mv	a2,s0
    3154:	85a6                	mv	a1,s1
    3156:	854e                	mv	a0,s3
    3158:	c636                	sw	a3,12(sp)
    315a:	3f35                	jal	3096 <__sfputs_r>
    315c:	1b650963          	beq	a0,s6,330e <_vfiprintf_r+0x236>
    3160:	57d2                	lw	a5,52(sp)
    3162:	46b2                	lw	a3,12(sp)
    3164:	97b6                	add	a5,a5,a3
    3166:	da3e                	sw	a5,52(sp)
    3168:	000c4783          	lbu	a5,0(s8)
    316c:	1a078163          	beqz	a5,330e <_vfiprintf_r+0x236>
    3170:	001c0413          	addi	s0,s8,1
    3174:	d002                	sw	zero,32(sp)
    3176:	d602                	sw	zero,44(sp)
    3178:	d25a                	sw	s6,36(sp)
    317a:	d402                	sw	zero,40(sp)
    317c:	060101a3          	sb	zero,99(sp)
    3180:	dc82                	sw	zero,120(sp)
    3182:	00044583          	lbu	a1,0(s0)
    3186:	4615                	li	a2,5
    3188:	8552                	mv	a0,s4
    318a:	25a5                	jal	37f2 <memchr>
    318c:	5782                	lw	a5,32(sp)
    318e:	00140693          	addi	a3,s0,1
    3192:	e52d                	bnez	a0,31fc <_vfiprintf_r+0x124>
    3194:	0107f713          	andi	a4,a5,16
    3198:	c709                	beqz	a4,31a2 <_vfiprintf_r+0xca>
    319a:	02000713          	li	a4,32
    319e:	06e101a3          	sb	a4,99(sp)
    31a2:	0087f713          	andi	a4,a5,8
    31a6:	c709                	beqz	a4,31b0 <_vfiprintf_r+0xd8>
    31a8:	02b00713          	li	a4,43
    31ac:	06e101a3          	sb	a4,99(sp)
    31b0:	00044603          	lbu	a2,0(s0)
    31b4:	02a00713          	li	a4,42
    31b8:	04e60a63          	beq	a2,a4,320c <_vfiprintf_r+0x134>
    31bc:	5732                	lw	a4,44(sp)
    31be:	4781                	li	a5,0
    31c0:	4625                	li	a2,9
    31c2:	00044683          	lbu	a3,0(s0)
    31c6:	fd068693          	addi	a3,a3,-48
    31ca:	0ed67063          	bgeu	a2,a3,32aa <_vfiprintf_r+0x1d2>
    31ce:	cba1                	beqz	a5,321e <_vfiprintf_r+0x146>
    31d0:	d63a                	sw	a4,44(sp)
    31d2:	a0b1                	j	321e <_vfiprintf_r+0x146>
    31d4:	85a6                	mv	a1,s1
    31d6:	854e                	mv	a0,s3
    31d8:	2ba9                	jal	3732 <__swsetup_r>
    31da:	d90d                	beqz	a0,310c <_vfiprintf_r+0x34>
    31dc:	557d                	li	a0,-1
    31de:	50ba                	lw	ra,172(sp)
    31e0:	542a                	lw	s0,168(sp)
    31e2:	549a                	lw	s1,164(sp)
    31e4:	590a                	lw	s2,160(sp)
    31e6:	49fa                	lw	s3,156(sp)
    31e8:	4a6a                	lw	s4,152(sp)
    31ea:	4ada                	lw	s5,148(sp)
    31ec:	4b4a                	lw	s6,144(sp)
    31ee:	4bba                	lw	s7,140(sp)
    31f0:	4c2a                	lw	s8,136(sp)
    31f2:	4c9a                	lw	s9,132(sp)
    31f4:	614d                	addi	sp,sp,176
    31f6:	8082                	ret
    31f8:	0c05                	addi	s8,s8,1
    31fa:	bf25                	j	3132 <_vfiprintf_r+0x5a>
    31fc:	41450533          	sub	a0,a0,s4
    3200:	00ab9533          	sll	a0,s7,a0
    3204:	8d5d                	or	a0,a0,a5
    3206:	d02a                	sw	a0,32(sp)
    3208:	8436                	mv	s0,a3
    320a:	bfa5                	j	3182 <_vfiprintf_r+0xaa>
    320c:	4772                	lw	a4,28(sp)
    320e:	00470613          	addi	a2,a4,4
    3212:	4318                	lw	a4,0(a4)
    3214:	ce32                	sw	a2,28(sp)
    3216:	08074363          	bltz	a4,329c <_vfiprintf_r+0x1c4>
    321a:	d63a                	sw	a4,44(sp)
    321c:	8436                	mv	s0,a3
    321e:	00044703          	lbu	a4,0(s0)
    3222:	02e00793          	li	a5,46
    3226:	02f71263          	bne	a4,a5,324a <_vfiprintf_r+0x172>
    322a:	00144703          	lbu	a4,1(s0)
    322e:	02a00793          	li	a5,42
    3232:	08f71563          	bne	a4,a5,32bc <_vfiprintf_r+0x1e4>
    3236:	47f2                	lw	a5,28(sp)
    3238:	0409                	addi	s0,s0,2
    323a:	00478713          	addi	a4,a5,4
    323e:	439c                	lw	a5,0(a5)
    3240:	ce3a                	sw	a4,28(sp)
    3242:	0007d363          	bgez	a5,3248 <_vfiprintf_r+0x170>
    3246:	57fd                	li	a5,-1
    3248:	d23e                	sw	a5,36(sp)
    324a:	00044583          	lbu	a1,0(s0)
    324e:	460d                	li	a2,3
    3250:	8556                	mv	a0,s5
    3252:	2345                	jal	37f2 <memchr>
    3254:	c919                	beqz	a0,326a <_vfiprintf_r+0x192>
    3256:	5782                	lw	a5,32(sp)
    3258:	41550533          	sub	a0,a0,s5
    325c:	04000713          	li	a4,64
    3260:	00a71733          	sll	a4,a4,a0
    3264:	8fd9                	or	a5,a5,a4
    3266:	0405                	addi	s0,s0,1
    3268:	d03e                	sw	a5,32(sp)
    326a:	00044583          	lbu	a1,0(s0)
    326e:	6529                	lui	a0,0xa
    3270:	4619                	li	a2,6
    3272:	66c50513          	addi	a0,a0,1644 # a66c <dma.c.e6d7bed9+0x95f>
    3276:	02b10c23          	sb	a1,56(sp)
    327a:	2ba5                	jal	37f2 <memchr>
    327c:	c14d                	beqz	a0,331e <_vfiprintf_r+0x246>
    327e:	00000793          	li	a5,0
    3282:	eba5                	bnez	a5,32f2 <_vfiprintf_r+0x21a>
    3284:	5702                	lw	a4,32(sp)
    3286:	47f2                	lw	a5,28(sp)
    3288:	10077713          	andi	a4,a4,256
    328c:	cf39                	beqz	a4,32ea <_vfiprintf_r+0x212>
    328e:	0791                	addi	a5,a5,4
    3290:	ce3e                	sw	a5,28(sp)
    3292:	57d2                	lw	a5,52(sp)
    3294:	0405                	addi	s0,s0,1
    3296:	97ca                	add	a5,a5,s2
    3298:	da3e                	sw	a5,52(sp)
    329a:	bd59                	j	3130 <_vfiprintf_r+0x58>
    329c:	40e00733          	neg	a4,a4
    32a0:	0027e793          	ori	a5,a5,2
    32a4:	d63a                	sw	a4,44(sp)
    32a6:	d03e                	sw	a5,32(sp)
    32a8:	bf95                	j	321c <_vfiprintf_r+0x144>
    32aa:	00271793          	slli	a5,a4,0x2
    32ae:	97ba                	add	a5,a5,a4
    32b0:	0786                	slli	a5,a5,0x1
    32b2:	00d78733          	add	a4,a5,a3
    32b6:	0405                	addi	s0,s0,1
    32b8:	4785                	li	a5,1
    32ba:	b721                	j	31c2 <_vfiprintf_r+0xea>
    32bc:	0405                	addi	s0,s0,1
    32be:	d202                	sw	zero,36(sp)
    32c0:	4701                	li	a4,0
    32c2:	4625                	li	a2,9
    32c4:	00044683          	lbu	a3,0(s0)
    32c8:	fd068693          	addi	a3,a3,-48
    32cc:	00d67663          	bgeu	a2,a3,32d8 <_vfiprintf_r+0x200>
    32d0:	f60c8de3          	beqz	s9,324a <_vfiprintf_r+0x172>
    32d4:	d23a                	sw	a4,36(sp)
    32d6:	bf95                	j	324a <_vfiprintf_r+0x172>
    32d8:	00271793          	slli	a5,a4,0x2
    32dc:	97ba                	add	a5,a5,a4
    32de:	0786                	slli	a5,a5,0x1
    32e0:	0405                	addi	s0,s0,1
    32e2:	00d78733          	add	a4,a5,a3
    32e6:	4c85                	li	s9,1
    32e8:	bff1                	j	32c4 <_vfiprintf_r+0x1ec>
    32ea:	079d                	addi	a5,a5,7
    32ec:	9be1                	andi	a5,a5,-8
    32ee:	07a1                	addi	a5,a5,8
    32f0:	b745                	j	3290 <_vfiprintf_r+0x1b8>
    32f2:	668d                	lui	a3,0x3
    32f4:	0878                	addi	a4,sp,28
    32f6:	09668693          	addi	a3,a3,150 # 3096 <__sfputs_r>
    32fa:	8626                	mv	a2,s1
    32fc:	100c                	addi	a1,sp,32
    32fe:	854e                	mv	a0,s3
    3300:	00000097          	auipc	ra,0x0
    3304:	000000e7          	jalr	zero # 0 <__vector_start>
    3308:	892a                	mv	s2,a0
    330a:	f96514e3          	bne	a0,s6,3292 <_vfiprintf_r+0x1ba>
    330e:	00c4d783          	lhu	a5,12(s1)
    3312:	0407f793          	andi	a5,a5,64
    3316:	ec0793e3          	bnez	a5,31dc <_vfiprintf_r+0x104>
    331a:	5552                	lw	a0,52(sp)
    331c:	b5c9                	j	31de <_vfiprintf_r+0x106>
    331e:	668d                	lui	a3,0x3
    3320:	0878                	addi	a4,sp,28
    3322:	09668693          	addi	a3,a3,150 # 3096 <__sfputs_r>
    3326:	8626                	mv	a2,s1
    3328:	100c                	addi	a1,sp,32
    332a:	854e                	mv	a0,s3
    332c:	2a19                	jal	3442 <_printf_i>
    332e:	bfe9                	j	3308 <_vfiprintf_r+0x230>

00003330 <_printf_common>:
    3330:	7179                	addi	sp,sp,-48
    3332:	ce4e                	sw	s3,28(sp)
    3334:	499c                	lw	a5,16(a1)
    3336:	89ba                	mv	s3,a4
    3338:	4598                	lw	a4,8(a1)
    333a:	d422                	sw	s0,40(sp)
    333c:	d04a                	sw	s2,32(sp)
    333e:	c85a                	sw	s6,16(sp)
    3340:	c65e                	sw	s7,12(sp)
    3342:	d606                	sw	ra,44(sp)
    3344:	d226                	sw	s1,36(sp)
    3346:	cc52                	sw	s4,24(sp)
    3348:	ca56                	sw	s5,20(sp)
    334a:	8b2a                	mv	s6,a0
    334c:	842e                	mv	s0,a1
    334e:	8932                	mv	s2,a2
    3350:	8bb6                	mv	s7,a3
    3352:	00e7d363          	bge	a5,a4,3358 <_printf_common+0x28>
    3356:	87ba                	mv	a5,a4
    3358:	00f92023          	sw	a5,0(s2)
    335c:	04344703          	lbu	a4,67(s0)
    3360:	c701                	beqz	a4,3368 <_printf_common+0x38>
    3362:	0785                	addi	a5,a5,1
    3364:	00f92023          	sw	a5,0(s2)
    3368:	401c                	lw	a5,0(s0)
    336a:	0207f793          	andi	a5,a5,32
    336e:	c791                	beqz	a5,337a <_printf_common+0x4a>
    3370:	00092783          	lw	a5,0(s2)
    3374:	0789                	addi	a5,a5,2
    3376:	00f92023          	sw	a5,0(s2)
    337a:	4004                	lw	s1,0(s0)
    337c:	8899                	andi	s1,s1,6
    337e:	e891                	bnez	s1,3392 <_printf_common+0x62>
    3380:	01940a13          	addi	s4,s0,25
    3384:	5afd                	li	s5,-1
    3386:	445c                	lw	a5,12(s0)
    3388:	00092703          	lw	a4,0(s2)
    338c:	8f99                	sub	a5,a5,a4
    338e:	04f4cd63          	blt	s1,a5,33e8 <_printf_common+0xb8>
    3392:	401c                	lw	a5,0(s0)
    3394:	04344683          	lbu	a3,67(s0)
    3398:	0207f793          	andi	a5,a5,32
    339c:	00d036b3          	snez	a3,a3
    33a0:	ebad                	bnez	a5,3412 <_printf_common+0xe2>
    33a2:	04340613          	addi	a2,s0,67
    33a6:	85de                	mv	a1,s7
    33a8:	855a                	mv	a0,s6
    33aa:	9982                	jalr	s3
    33ac:	57fd                	li	a5,-1
    33ae:	04f50463          	beq	a0,a5,33f6 <_printf_common+0xc6>
    33b2:	401c                	lw	a5,0(s0)
    33b4:	4711                	li	a4,4
    33b6:	4481                	li	s1,0
    33b8:	8b99                	andi	a5,a5,6
    33ba:	00e79a63          	bne	a5,a4,33ce <_printf_common+0x9e>
    33be:	00092783          	lw	a5,0(s2)
    33c2:	4444                	lw	s1,12(s0)
    33c4:	8c9d                	sub	s1,s1,a5
    33c6:	fff4c793          	not	a5,s1
    33ca:	87fd                	srai	a5,a5,0x1f
    33cc:	8cfd                	and	s1,s1,a5
    33ce:	441c                	lw	a5,8(s0)
    33d0:	4818                	lw	a4,16(s0)
    33d2:	00f75463          	bge	a4,a5,33da <_printf_common+0xaa>
    33d6:	8f99                	sub	a5,a5,a4
    33d8:	94be                	add	s1,s1,a5
    33da:	4901                	li	s2,0
    33dc:	0469                	addi	s0,s0,26
    33de:	5a7d                	li	s4,-1
    33e0:	05249863          	bne	s1,s2,3430 <_printf_common+0x100>
    33e4:	4501                	li	a0,0
    33e6:	a809                	j	33f8 <_printf_common+0xc8>
    33e8:	4685                	li	a3,1
    33ea:	8652                	mv	a2,s4
    33ec:	85de                	mv	a1,s7
    33ee:	855a                	mv	a0,s6
    33f0:	9982                	jalr	s3
    33f2:	01551e63          	bne	a0,s5,340e <_printf_common+0xde>
    33f6:	557d                	li	a0,-1
    33f8:	50b2                	lw	ra,44(sp)
    33fa:	5422                	lw	s0,40(sp)
    33fc:	5492                	lw	s1,36(sp)
    33fe:	5902                	lw	s2,32(sp)
    3400:	49f2                	lw	s3,28(sp)
    3402:	4a62                	lw	s4,24(sp)
    3404:	4ad2                	lw	s5,20(sp)
    3406:	4b42                	lw	s6,16(sp)
    3408:	4bb2                	lw	s7,12(sp)
    340a:	6145                	addi	sp,sp,48
    340c:	8082                	ret
    340e:	0485                	addi	s1,s1,1
    3410:	bf9d                	j	3386 <_printf_common+0x56>
    3412:	00d40733          	add	a4,s0,a3
    3416:	03000613          	li	a2,48
    341a:	04c701a3          	sb	a2,67(a4)
    341e:	04544703          	lbu	a4,69(s0)
    3422:	00168793          	addi	a5,a3,1
    3426:	97a2                	add	a5,a5,s0
    3428:	0689                	addi	a3,a3,2
    342a:	04e781a3          	sb	a4,67(a5)
    342e:	bf95                	j	33a2 <_printf_common+0x72>
    3430:	4685                	li	a3,1
    3432:	8622                	mv	a2,s0
    3434:	85de                	mv	a1,s7
    3436:	855a                	mv	a0,s6
    3438:	9982                	jalr	s3
    343a:	fb450ee3          	beq	a0,s4,33f6 <_printf_common+0xc6>
    343e:	0905                	addi	s2,s2,1
    3440:	b745                	j	33e0 <_printf_common+0xb0>

00003442 <_printf_i>:
    3442:	7139                	addi	sp,sp,-64
    3444:	dc22                	sw	s0,56(sp)
    3446:	d452                	sw	s4,40(sp)
    3448:	cc62                	sw	s8,24(sp)
    344a:	ca66                	sw	s9,20(sp)
    344c:	de06                	sw	ra,60(sp)
    344e:	da26                	sw	s1,52(sp)
    3450:	d84a                	sw	s2,48(sp)
    3452:	d64e                	sw	s3,44(sp)
    3454:	d256                	sw	s5,36(sp)
    3456:	d05a                	sw	s6,32(sp)
    3458:	ce5e                	sw	s7,28(sp)
    345a:	0185c783          	lbu	a5,24(a1)
    345e:	8a36                	mv	s4,a3
    3460:	07800693          	li	a3,120
    3464:	8c2a                	mv	s8,a0
    3466:	842e                	mv	s0,a1
    3468:	8cb2                	mv	s9,a2
    346a:	00f6ee63          	bltu	a3,a5,3486 <_printf_i+0x44>
    346e:	06200693          	li	a3,98
    3472:	04358a93          	addi	s5,a1,67
    3476:	00f6eb63          	bltu	a3,a5,348c <_printf_i+0x4a>
    347a:	1a078c63          	beqz	a5,3632 <_printf_i+0x1f0>
    347e:	05800693          	li	a3,88
    3482:	16d78c63          	beq	a5,a3,35fa <_printf_i+0x1b8>
    3486:	04240b93          	addi	s7,s0,66
    348a:	a035                	j	34b6 <_printf_i+0x74>
    348c:	f9d78693          	addi	a3,a5,-99
    3490:	0ff6f693          	zext.b	a3,a3
    3494:	4655                	li	a2,21
    3496:	fed668e3          	bltu	a2,a3,3486 <_printf_i+0x44>
    349a:	6629                	lui	a2,0xa
    349c:	068a                	slli	a3,a3,0x2
    349e:	69c60613          	addi	a2,a2,1692 # a69c <dma.c.e6d7bed9+0x98f>
    34a2:	96b2                	add	a3,a3,a2
    34a4:	4294                	lw	a3,0(a3)
    34a6:	8682                	jr	a3
    34a8:	431c                	lw	a5,0(a4)
    34aa:	04258b93          	addi	s7,a1,66
    34ae:	00478693          	addi	a3,a5,4
    34b2:	439c                	lw	a5,0(a5)
    34b4:	c314                	sw	a3,0(a4)
    34b6:	04f40123          	sb	a5,66(s0)
    34ba:	4785                	li	a5,1
    34bc:	aa71                	j	3658 <_printf_i+0x216>
    34be:	419c                	lw	a5,0(a1)
    34c0:	4310                	lw	a2,0(a4)
    34c2:	0807f593          	andi	a1,a5,128
    34c6:	00460693          	addi	a3,a2,4
    34ca:	c185                	beqz	a1,34ea <_printf_i+0xa8>
    34cc:	4204                	lw	s1,0(a2)
    34ce:	c314                	sw	a3,0(a4)
    34d0:	6929                	lui	s2,0xa
    34d2:	0004d863          	bgez	s1,34e2 <_printf_i+0xa0>
    34d6:	02d00793          	li	a5,45
    34da:	409004b3          	neg	s1,s1
    34de:	04f401a3          	sb	a5,67(s0)
    34e2:	67490913          	addi	s2,s2,1652 # a674 <dma.c.e6d7bed9+0x967>
    34e6:	49a9                	li	s3,10
    34e8:	a061                	j	3570 <_printf_i+0x12e>
    34ea:	4204                	lw	s1,0(a2)
    34ec:	0407f793          	andi	a5,a5,64
    34f0:	c314                	sw	a3,0(a4)
    34f2:	dff9                	beqz	a5,34d0 <_printf_i+0x8e>
    34f4:	04c2                	slli	s1,s1,0x10
    34f6:	84c1                	srai	s1,s1,0x10
    34f8:	bfe1                	j	34d0 <_printf_i+0x8e>
    34fa:	4194                	lw	a3,0(a1)
    34fc:	431c                	lw	a5,0(a4)
    34fe:	0806f613          	andi	a2,a3,128
    3502:	4384                	lw	s1,0(a5)
    3504:	0791                	addi	a5,a5,4
    3506:	e611                	bnez	a2,3512 <_printf_i+0xd0>
    3508:	0406f693          	andi	a3,a3,64
    350c:	c299                	beqz	a3,3512 <_printf_i+0xd0>
    350e:	04c2                	slli	s1,s1,0x10
    3510:	80c1                	srli	s1,s1,0x10
    3512:	c31c                	sw	a5,0(a4)
    3514:	01844703          	lbu	a4,24(s0)
    3518:	6929                	lui	s2,0xa
    351a:	06f00793          	li	a5,111
    351e:	67490913          	addi	s2,s2,1652 # a674 <dma.c.e6d7bed9+0x967>
    3522:	49a1                	li	s3,8
    3524:	04f70463          	beq	a4,a5,356c <_printf_i+0x12a>
    3528:	49a9                	li	s3,10
    352a:	a089                	j	356c <_printf_i+0x12a>
    352c:	419c                	lw	a5,0(a1)
    352e:	0207e793          	ori	a5,a5,32
    3532:	c19c                	sw	a5,0(a1)
    3534:	6929                	lui	s2,0xa
    3536:	07800793          	li	a5,120
    353a:	68890913          	addi	s2,s2,1672 # a688 <dma.c.e6d7bed9+0x97b>
    353e:	04f402a3          	sb	a5,69(s0)
    3542:	401c                	lw	a5,0(s0)
    3544:	4314                	lw	a3,0(a4)
    3546:	0807f613          	andi	a2,a5,128
    354a:	4284                	lw	s1,0(a3)
    354c:	0691                	addi	a3,a3,4
    354e:	e611                	bnez	a2,355a <_printf_i+0x118>
    3550:	0407f613          	andi	a2,a5,64
    3554:	c219                	beqz	a2,355a <_printf_i+0x118>
    3556:	04c2                	slli	s1,s1,0x10
    3558:	80c1                	srli	s1,s1,0x10
    355a:	c314                	sw	a3,0(a4)
    355c:	0017f713          	andi	a4,a5,1
    3560:	c701                	beqz	a4,3568 <_printf_i+0x126>
    3562:	0207e793          	ori	a5,a5,32
    3566:	c01c                	sw	a5,0(s0)
    3568:	ccc9                	beqz	s1,3602 <_printf_i+0x1c0>
    356a:	49c1                	li	s3,16
    356c:	040401a3          	sb	zero,67(s0)
    3570:	405c                	lw	a5,4(s0)
    3572:	c41c                	sw	a5,8(s0)
    3574:	0007c863          	bltz	a5,3584 <_printf_i+0x142>
    3578:	4018                	lw	a4,0(s0)
    357a:	8fc5                	or	a5,a5,s1
    357c:	8bd6                	mv	s7,s5
    357e:	9b6d                	andi	a4,a4,-5
    3580:	c018                	sw	a4,0(s0)
    3582:	c395                	beqz	a5,35a6 <_printf_i+0x164>
    3584:	8bd6                	mv	s7,s5
    3586:	85ce                	mv	a1,s3
    3588:	8526                	mv	a0,s1
    358a:	26dd                	jal	3970 <__umodsi3>
    358c:	954a                	add	a0,a0,s2
    358e:	00054783          	lbu	a5,0(a0)
    3592:	85ce                	mv	a1,s3
    3594:	8526                	mv	a0,s1
    3596:	fefb8fa3          	sb	a5,-1(s7)
    359a:	8b26                	mv	s6,s1
    359c:	2665                	jal	3944 <__hidden___udivsi3>
    359e:	1bfd                	addi	s7,s7,-1
    35a0:	84aa                	mv	s1,a0
    35a2:	ff3b72e3          	bgeu	s6,s3,3586 <_printf_i+0x144>
    35a6:	47a1                	li	a5,8
    35a8:	00f99e63          	bne	s3,a5,35c4 <_printf_i+0x182>
    35ac:	401c                	lw	a5,0(s0)
    35ae:	8b85                	andi	a5,a5,1
    35b0:	cb91                	beqz	a5,35c4 <_printf_i+0x182>
    35b2:	4058                	lw	a4,4(s0)
    35b4:	481c                	lw	a5,16(s0)
    35b6:	00e7c763          	blt	a5,a4,35c4 <_printf_i+0x182>
    35ba:	03000793          	li	a5,48
    35be:	fefb8fa3          	sb	a5,-1(s7)
    35c2:	1bfd                	addi	s7,s7,-1
    35c4:	417a8ab3          	sub	s5,s5,s7
    35c8:	01542823          	sw	s5,16(s0)
    35cc:	8752                	mv	a4,s4
    35ce:	86e6                	mv	a3,s9
    35d0:	0070                	addi	a2,sp,12
    35d2:	85a2                	mv	a1,s0
    35d4:	8562                	mv	a0,s8
    35d6:	3ba9                	jal	3330 <_printf_common>
    35d8:	597d                	li	s2,-1
    35da:	09251363          	bne	a0,s2,3660 <_printf_i+0x21e>
    35de:	557d                	li	a0,-1
    35e0:	50f2                	lw	ra,60(sp)
    35e2:	5462                	lw	s0,56(sp)
    35e4:	54d2                	lw	s1,52(sp)
    35e6:	5942                	lw	s2,48(sp)
    35e8:	59b2                	lw	s3,44(sp)
    35ea:	5a22                	lw	s4,40(sp)
    35ec:	5a92                	lw	s5,36(sp)
    35ee:	5b02                	lw	s6,32(sp)
    35f0:	4bf2                	lw	s7,28(sp)
    35f2:	4c62                	lw	s8,24(sp)
    35f4:	4cd2                	lw	s9,20(sp)
    35f6:	6121                	addi	sp,sp,64
    35f8:	8082                	ret
    35fa:	6929                	lui	s2,0xa
    35fc:	67490913          	addi	s2,s2,1652 # a674 <dma.c.e6d7bed9+0x967>
    3600:	bf3d                	j	353e <_printf_i+0xfc>
    3602:	401c                	lw	a5,0(s0)
    3604:	fdf7f793          	andi	a5,a5,-33
    3608:	c01c                	sw	a5,0(s0)
    360a:	b785                	j	356a <_printf_i+0x128>
    360c:	4194                	lw	a3,0(a1)
    360e:	431c                	lw	a5,0(a4)
    3610:	49d0                	lw	a2,20(a1)
    3612:	0806f513          	andi	a0,a3,128
    3616:	00478593          	addi	a1,a5,4
    361a:	c509                	beqz	a0,3624 <_printf_i+0x1e2>
    361c:	c30c                	sw	a1,0(a4)
    361e:	439c                	lw	a5,0(a5)
    3620:	c390                	sw	a2,0(a5)
    3622:	a801                	j	3632 <_printf_i+0x1f0>
    3624:	c30c                	sw	a1,0(a4)
    3626:	0406f693          	andi	a3,a3,64
    362a:	439c                	lw	a5,0(a5)
    362c:	daf5                	beqz	a3,3620 <_printf_i+0x1de>
    362e:	00c79023          	sh	a2,0(a5)
    3632:	00042823          	sw	zero,16(s0)
    3636:	8bd6                	mv	s7,s5
    3638:	bf51                	j	35cc <_printf_i+0x18a>
    363a:	431c                	lw	a5,0(a4)
    363c:	41d0                	lw	a2,4(a1)
    363e:	4581                	li	a1,0
    3640:	00478693          	addi	a3,a5,4
    3644:	c314                	sw	a3,0(a4)
    3646:	0007ab83          	lw	s7,0(a5)
    364a:	855e                	mv	a0,s7
    364c:	225d                	jal	37f2 <memchr>
    364e:	c501                	beqz	a0,3656 <_printf_i+0x214>
    3650:	41750533          	sub	a0,a0,s7
    3654:	c048                	sw	a0,4(s0)
    3656:	405c                	lw	a5,4(s0)
    3658:	c81c                	sw	a5,16(s0)
    365a:	040401a3          	sb	zero,67(s0)
    365e:	b7bd                	j	35cc <_printf_i+0x18a>
    3660:	4814                	lw	a3,16(s0)
    3662:	865e                	mv	a2,s7
    3664:	85e6                	mv	a1,s9
    3666:	8562                	mv	a0,s8
    3668:	9a02                	jalr	s4
    366a:	f7250ae3          	beq	a0,s2,35de <_printf_i+0x19c>
    366e:	401c                	lw	a5,0(s0)
    3670:	8b89                	andi	a5,a5,2
    3672:	e795                	bnez	a5,369e <_printf_i+0x25c>
    3674:	47b2                	lw	a5,12(sp)
    3676:	4448                	lw	a0,12(s0)
    3678:	f6f554e3          	bge	a0,a5,35e0 <_printf_i+0x19e>
    367c:	853e                	mv	a0,a5
    367e:	b78d                	j	35e0 <_printf_i+0x19e>
    3680:	4685                	li	a3,1
    3682:	01940613          	addi	a2,s0,25
    3686:	85e6                	mv	a1,s9
    3688:	8562                	mv	a0,s8
    368a:	9a02                	jalr	s4
    368c:	f52509e3          	beq	a0,s2,35de <_printf_i+0x19c>
    3690:	0485                	addi	s1,s1,1
    3692:	445c                	lw	a5,12(s0)
    3694:	4732                	lw	a4,12(sp)
    3696:	8f99                	sub	a5,a5,a4
    3698:	fef4c4e3          	blt	s1,a5,3680 <_printf_i+0x23e>
    369c:	bfe1                	j	3674 <_printf_i+0x232>
    369e:	4481                	li	s1,0
    36a0:	bfcd                	j	3692 <_printf_i+0x250>

000036a2 <__swbuf_r>:
    36a2:	1101                	addi	sp,sp,-32
    36a4:	cc22                	sw	s0,24(sp)
    36a6:	ca26                	sw	s1,20(sp)
    36a8:	c64e                	sw	s3,12(sp)
    36aa:	ce06                	sw	ra,28(sp)
    36ac:	c84a                	sw	s2,16(sp)
    36ae:	84aa                	mv	s1,a0
    36b0:	89ae                	mv	s3,a1
    36b2:	8432                	mv	s0,a2
    36b4:	c509                	beqz	a0,36be <__swbuf_r+0x1c>
    36b6:	511c                	lw	a5,32(a0)
    36b8:	e399                	bnez	a5,36be <__swbuf_r+0x1c>
    36ba:	a5aff0ef          	jal	2914 <__sinit>
    36be:	4c1c                	lw	a5,24(s0)
    36c0:	c41c                	sw	a5,8(s0)
    36c2:	00c45783          	lhu	a5,12(s0)
    36c6:	8ba1                	andi	a5,a5,8
    36c8:	c399                	beqz	a5,36ce <__swbuf_r+0x2c>
    36ca:	481c                	lw	a5,16(s0)
    36cc:	ef91                	bnez	a5,36e8 <__swbuf_r+0x46>
    36ce:	85a2                	mv	a1,s0
    36d0:	8526                	mv	a0,s1
    36d2:	2085                	jal	3732 <__swsetup_r>
    36d4:	c911                	beqz	a0,36e8 <__swbuf_r+0x46>
    36d6:	597d                	li	s2,-1
    36d8:	40f2                	lw	ra,28(sp)
    36da:	4462                	lw	s0,24(sp)
    36dc:	44d2                	lw	s1,20(sp)
    36de:	49b2                	lw	s3,12(sp)
    36e0:	854a                	mv	a0,s2
    36e2:	4942                	lw	s2,16(sp)
    36e4:	6105                	addi	sp,sp,32
    36e6:	8082                	ret
    36e8:	481c                	lw	a5,16(s0)
    36ea:	4008                	lw	a0,0(s0)
    36ec:	8d1d                	sub	a0,a0,a5
    36ee:	485c                	lw	a5,20(s0)
    36f0:	00f54663          	blt	a0,a5,36fc <__swbuf_r+0x5a>
    36f4:	85a2                	mv	a1,s0
    36f6:	8526                	mv	a0,s1
    36f8:	38c9                	jal	2fca <_fflush_r>
    36fa:	fd71                	bnez	a0,36d6 <__swbuf_r+0x34>
    36fc:	441c                	lw	a5,8(s0)
    36fe:	0505                	addi	a0,a0,1
    3700:	0ff9f913          	zext.b	s2,s3
    3704:	17fd                	addi	a5,a5,-1
    3706:	c41c                	sw	a5,8(s0)
    3708:	401c                	lw	a5,0(s0)
    370a:	00178713          	addi	a4,a5,1
    370e:	c018                	sw	a4,0(s0)
    3710:	01378023          	sb	s3,0(a5)
    3714:	485c                	lw	a5,20(s0)
    3716:	00a78963          	beq	a5,a0,3728 <__swbuf_r+0x86>
    371a:	00c45783          	lhu	a5,12(s0)
    371e:	8b85                	andi	a5,a5,1
    3720:	dfc5                	beqz	a5,36d8 <__swbuf_r+0x36>
    3722:	ff690793          	addi	a5,s2,-10
    3726:	fbcd                	bnez	a5,36d8 <__swbuf_r+0x36>
    3728:	85a2                	mv	a1,s0
    372a:	8526                	mv	a0,s1
    372c:	3879                	jal	2fca <_fflush_r>
    372e:	d54d                	beqz	a0,36d8 <__swbuf_r+0x36>
    3730:	b75d                	j	36d6 <__swbuf_r+0x34>

00003732 <__swsetup_r>:
    3732:	1141                	addi	sp,sp,-16
    3734:	c226                	sw	s1,4(sp)
    3736:	84aa                	mv	s1,a0
    3738:	9341a503          	lw	a0,-1740(gp) # b4c8 <_impure_ptr>
    373c:	c422                	sw	s0,8(sp)
    373e:	c606                	sw	ra,12(sp)
    3740:	842e                	mv	s0,a1
    3742:	c509                	beqz	a0,374c <__swsetup_r+0x1a>
    3744:	511c                	lw	a5,32(a0)
    3746:	e399                	bnez	a5,374c <__swsetup_r+0x1a>
    3748:	9ccff0ef          	jal	2914 <__sinit>
    374c:	00c41783          	lh	a5,12(s0)
    3750:	0087f713          	andi	a4,a5,8
    3754:	e731                	bnez	a4,37a0 <__swsetup_r+0x6e>
    3756:	0107f713          	andi	a4,a5,16
    375a:	eb09                	bnez	a4,376c <__swsetup_r+0x3a>
    375c:	4725                	li	a4,9
    375e:	c098                	sw	a4,0(s1)
    3760:	0407e793          	ori	a5,a5,64
    3764:	00f41623          	sh	a5,12(s0)
    3768:	557d                	li	a0,-1
    376a:	a885                	j	37da <__swsetup_r+0xa8>
    376c:	0047f713          	andi	a4,a5,4
    3770:	c705                	beqz	a4,3798 <__swsetup_r+0x66>
    3772:	584c                	lw	a1,52(s0)
    3774:	c991                	beqz	a1,3788 <__swsetup_r+0x56>
    3776:	04440793          	addi	a5,s0,68
    377a:	00f58563          	beq	a1,a5,3784 <__swsetup_r+0x52>
    377e:	8526                	mv	a0,s1
    3780:	d22ff0ef          	jal	2ca2 <_free_r>
    3784:	02042a23          	sw	zero,52(s0)
    3788:	00c45783          	lhu	a5,12(s0)
    378c:	4818                	lw	a4,16(s0)
    378e:	00042223          	sw	zero,4(s0)
    3792:	fdb7f793          	andi	a5,a5,-37
    3796:	c018                	sw	a4,0(s0)
    3798:	0087e793          	ori	a5,a5,8
    379c:	00f41623          	sh	a5,12(s0)
    37a0:	481c                	lw	a5,16(s0)
    37a2:	eb99                	bnez	a5,37b8 <__swsetup_r+0x86>
    37a4:	445c                	lw	a5,12(s0)
    37a6:	20000713          	li	a4,512
    37aa:	2807f793          	andi	a5,a5,640
    37ae:	00e78563          	beq	a5,a4,37b8 <__swsetup_r+0x86>
    37b2:	85a2                	mv	a1,s0
    37b4:	8526                	mv	a0,s1
    37b6:	2075                	jal	3862 <__smakebuf_r>
    37b8:	00c41783          	lh	a5,12(s0)
    37bc:	0017f713          	andi	a4,a5,1
    37c0:	c315                	beqz	a4,37e4 <__swsetup_r+0xb2>
    37c2:	4858                	lw	a4,20(s0)
    37c4:	00042423          	sw	zero,8(s0)
    37c8:	40e00733          	neg	a4,a4
    37cc:	cc18                	sw	a4,24(s0)
    37ce:	4818                	lw	a4,16(s0)
    37d0:	4501                	li	a0,0
    37d2:	e701                	bnez	a4,37da <__swsetup_r+0xa8>
    37d4:	0807f713          	andi	a4,a5,128
    37d8:	f741                	bnez	a4,3760 <__swsetup_r+0x2e>
    37da:	40b2                	lw	ra,12(sp)
    37dc:	4422                	lw	s0,8(sp)
    37de:	4492                	lw	s1,4(sp)
    37e0:	0141                	addi	sp,sp,16
    37e2:	8082                	ret
    37e4:	0027f713          	andi	a4,a5,2
    37e8:	4681                	li	a3,0
    37ea:	e311                	bnez	a4,37ee <__swsetup_r+0xbc>
    37ec:	4854                	lw	a3,20(s0)
    37ee:	c414                	sw	a3,8(s0)
    37f0:	bff9                	j	37ce <__swsetup_r+0x9c>

000037f2 <memchr>:
    37f2:	0ff5f593          	zext.b	a1,a1
    37f6:	962a                	add	a2,a2,a0
    37f8:	00c51463          	bne	a0,a2,3800 <memchr+0xe>
    37fc:	4501                	li	a0,0
    37fe:	8082                	ret
    3800:	00054783          	lbu	a5,0(a0)
    3804:	feb78de3          	beq	a5,a1,37fe <memchr+0xc>
    3808:	0505                	addi	a0,a0,1
    380a:	b7fd                	j	37f8 <memchr+0x6>

0000380c <__swhatbuf_r>:
    380c:	7119                	addi	sp,sp,-128
    380e:	dca2                	sw	s0,120(sp)
    3810:	842e                	mv	s0,a1
    3812:	00e59583          	lh	a1,14(a1)
    3816:	daa6                	sw	s1,116(sp)
    3818:	de86                	sw	ra,124(sp)
    381a:	84b2                	mv	s1,a2
    381c:	0205d163          	bgez	a1,383e <__swhatbuf_r+0x32>
    3820:	00c45783          	lhu	a5,12(s0)
    3824:	0807f793          	andi	a5,a5,128
    3828:	eb8d                	bnez	a5,385a <__swhatbuf_r+0x4e>
    382a:	40000713          	li	a4,1024
    382e:	50f6                	lw	ra,124(sp)
    3830:	5466                	lw	s0,120(sp)
    3832:	c29c                	sw	a5,0(a3)
    3834:	c098                	sw	a4,0(s1)
    3836:	4501                	li	a0,0
    3838:	54d6                	lw	s1,116(sp)
    383a:	6109                	addi	sp,sp,128
    383c:	8082                	ret
    383e:	0830                	addi	a2,sp,24
    3840:	c636                	sw	a3,12(sp)
    3842:	2045                	jal	38e2 <_fstat_r>
    3844:	46b2                	lw	a3,12(sp)
    3846:	fc054de3          	bltz	a0,3820 <__swhatbuf_r+0x14>
    384a:	47f2                	lw	a5,28(sp)
    384c:	673d                	lui	a4,0xf
    384e:	8ff9                	and	a5,a5,a4
    3850:	7779                	lui	a4,0xffffe
    3852:	97ba                	add	a5,a5,a4
    3854:	0017b793          	seqz	a5,a5
    3858:	bfc9                	j	382a <__swhatbuf_r+0x1e>
    385a:	4781                	li	a5,0
    385c:	04000713          	li	a4,64
    3860:	b7f9                	j	382e <__swhatbuf_r+0x22>

00003862 <__smakebuf_r>:
    3862:	00c5d703          	lhu	a4,12(a1)
    3866:	7179                	addi	sp,sp,-48
    3868:	d422                	sw	s0,40(sp)
    386a:	d606                	sw	ra,44(sp)
    386c:	d226                	sw	s1,36(sp)
    386e:	8b09                	andi	a4,a4,2
    3870:	842e                	mv	s0,a1
    3872:	cf01                	beqz	a4,388a <__smakebuf_r+0x28>
    3874:	04740793          	addi	a5,s0,71
    3878:	c01c                	sw	a5,0(s0)
    387a:	c81c                	sw	a5,16(s0)
    387c:	4785                	li	a5,1
    387e:	c85c                	sw	a5,20(s0)
    3880:	50b2                	lw	ra,44(sp)
    3882:	5422                	lw	s0,40(sp)
    3884:	5492                	lw	s1,36(sp)
    3886:	6145                	addi	sp,sp,48
    3888:	8082                	ret
    388a:	0874                	addi	a3,sp,28
    388c:	0830                	addi	a2,sp,24
    388e:	84aa                	mv	s1,a0
    3890:	3fb5                	jal	380c <__swhatbuf_r>
    3892:	45e2                	lw	a1,24(sp)
    3894:	8526                	mv	a0,s1
    3896:	c62e                	sw	a1,12(sp)
    3898:	cf8ff0ef          	jal	2d90 <_malloc_r>
    389c:	00c41783          	lh	a5,12(s0)
    38a0:	45b2                	lw	a1,12(sp)
    38a2:	e911                	bnez	a0,38b6 <__smakebuf_r+0x54>
    38a4:	2007f713          	andi	a4,a5,512
    38a8:	ff61                	bnez	a4,3880 <__smakebuf_r+0x1e>
    38aa:	9bf1                	andi	a5,a5,-4
    38ac:	0027e793          	ori	a5,a5,2
    38b0:	00f41623          	sh	a5,12(s0)
    38b4:	b7c1                	j	3874 <__smakebuf_r+0x12>
    38b6:	0807e793          	ori	a5,a5,128
    38ba:	00f41623          	sh	a5,12(s0)
    38be:	47f2                	lw	a5,28(sp)
    38c0:	c008                	sw	a0,0(s0)
    38c2:	c808                	sw	a0,16(s0)
    38c4:	c84c                	sw	a1,20(s0)
    38c6:	dfcd                	beqz	a5,3880 <__smakebuf_r+0x1e>
    38c8:	00e41583          	lh	a1,14(s0)
    38cc:	8526                	mv	a0,s1
    38ce:	2089                	jal	3910 <_isatty_r>
    38d0:	d945                	beqz	a0,3880 <__smakebuf_r+0x1e>
    38d2:	00c45783          	lhu	a5,12(s0)
    38d6:	9bf1                	andi	a5,a5,-4
    38d8:	0017e793          	ori	a5,a5,1
    38dc:	00f41623          	sh	a5,12(s0)
    38e0:	b745                	j	3880 <__smakebuf_r+0x1e>

000038e2 <_fstat_r>:
    38e2:	1141                	addi	sp,sp,-16
    38e4:	c422                	sw	s0,8(sp)
    38e6:	c226                	sw	s1,4(sp)
    38e8:	84aa                	mv	s1,a0
    38ea:	852e                	mv	a0,a1
    38ec:	85b2                	mv	a1,a2
    38ee:	c606                	sw	ra,12(sp)
    38f0:	9201ae23          	sw	zero,-1732(gp) # b4d0 <errno>
    38f4:	ee4fe0ef          	jal	1fd8 <_fstat>
    38f8:	57fd                	li	a5,-1
    38fa:	00f51663          	bne	a0,a5,3906 <_fstat_r+0x24>
    38fe:	93c1a783          	lw	a5,-1732(gp) # b4d0 <errno>
    3902:	c391                	beqz	a5,3906 <_fstat_r+0x24>
    3904:	c09c                	sw	a5,0(s1)
    3906:	40b2                	lw	ra,12(sp)
    3908:	4422                	lw	s0,8(sp)
    390a:	4492                	lw	s1,4(sp)
    390c:	0141                	addi	sp,sp,16
    390e:	8082                	ret

00003910 <_isatty_r>:
    3910:	1141                	addi	sp,sp,-16
    3912:	c422                	sw	s0,8(sp)
    3914:	c226                	sw	s1,4(sp)
    3916:	84aa                	mv	s1,a0
    3918:	852e                	mv	a0,a1
    391a:	c606                	sw	ra,12(sp)
    391c:	9201ae23          	sw	zero,-1732(gp) # b4d0 <errno>
    3920:	edcfe0ef          	jal	1ffc <_isatty>
    3924:	57fd                	li	a5,-1
    3926:	00f51663          	bne	a0,a5,3932 <_isatty_r+0x22>
    392a:	93c1a783          	lw	a5,-1732(gp) # b4d0 <errno>
    392e:	c391                	beqz	a5,3932 <_isatty_r+0x22>
    3930:	c09c                	sw	a5,0(s1)
    3932:	40b2                	lw	ra,12(sp)
    3934:	4422                	lw	s0,8(sp)
    3936:	4492                	lw	s1,4(sp)
    3938:	0141                	addi	sp,sp,16
    393a:	8082                	ret

0000393c <__divsi3>:
  li    t0, -1
  beq   a1, t0, .L20
#endif

FUNC_BEGIN (__divdi3)
  bltz  a0, .L10
    393c:	02054e63          	bltz	a0,3978 <__umodsi3+0x8>
  bltz  a1, .L11
    3940:	0405c363          	bltz	a1,3986 <__umodsi3+0x16>

00003944 <__hidden___udivsi3>:
  /* Since the quotient is positive, fall into __udivdi3.  */

FUNC_BEGIN (__udivdi3)
  mv    a2, a1
    3944:	862e                	mv	a2,a1
  mv    a1, a0
    3946:	85aa                	mv	a1,a0
  li    a0, -1
    3948:	557d                	li	a0,-1
  beqz  a2, .L5
    394a:	c215                	beqz	a2,396e <__hidden___udivsi3+0x2a>
  li    a3, 1
    394c:	4685                	li	a3,1
  bgeu  a2, a1, .L2
    394e:	00b67863          	bgeu	a2,a1,395e <__hidden___udivsi3+0x1a>
.L1:
  blez  a2, .L2
    3952:	00c05663          	blez	a2,395e <__hidden___udivsi3+0x1a>
  slli  a2, a2, 1
    3956:	0606                	slli	a2,a2,0x1
  slli  a3, a3, 1
    3958:	0686                	slli	a3,a3,0x1
  bgtu  a1, a2, .L1
    395a:	feb66ce3          	bltu	a2,a1,3952 <__hidden___udivsi3+0xe>
.L2:
  li    a0, 0
    395e:	4501                	li	a0,0
.L3:
  bltu  a1, a2, .L4
    3960:	00c5e463          	bltu	a1,a2,3968 <__hidden___udivsi3+0x24>
  sub   a1, a1, a2
    3964:	8d91                	sub	a1,a1,a2
  or    a0, a0, a3
    3966:	8d55                	or	a0,a0,a3
.L4:
  srli  a3, a3, 1
    3968:	8285                	srli	a3,a3,0x1
  srli  a2, a2, 1
    396a:	8205                	srli	a2,a2,0x1
  bnez  a3, .L3
    396c:	faf5                	bnez	a3,3960 <__hidden___udivsi3+0x1c>
.L5:
  ret
    396e:	8082                	ret

00003970 <__umodsi3>:
FUNC_END (__udivdi3)
HIDDEN_DEF (__udivdi3)

FUNC_BEGIN (__umoddi3)
  /* Call __udivdi3(a0, a1), then return the remainder, which is in a1.  */
  move  t0, ra
    3970:	8286                	mv	t0,ra
  jal   HIDDEN_JUMPTARGET(__udivdi3)
    3972:	3fc9                	jal	3944 <__hidden___udivsi3>
  move  a0, a1
    3974:	852e                	mv	a0,a1
  jr    t0
    3976:	8282                	jr	t0
FUNC_END (__umoddi3)

  /* Handle negative arguments to __divdi3.  */
.L10:
  neg   a0, a0
    3978:	40a00533          	neg	a0,a0
  /* Zero is handled as a negative so that the result will not be inverted.  */
  bgtz  a1, .L12     /* Compute __udivdi3(-a0, a1), then negate the result.  */
    397c:	00b04763          	bgtz	a1,398a <__umodsi3+0x1a>

  neg   a1, a1
    3980:	40b005b3          	neg	a1,a1
  j     HIDDEN_JUMPTARGET(__udivdi3)     /* Compute __udivdi3(-a0, -a1).  */
    3984:	b7c1                	j	3944 <__hidden___udivsi3>
.L11:                /* Compute __udivdi3(a0, -a1), then negate the result.  */
  neg   a1, a1
    3986:	40b005b3          	neg	a1,a1
.L12:
  move  t0, ra
    398a:	8286                	mv	t0,ra
  jal   HIDDEN_JUMPTARGET(__udivdi3)
    398c:	3f65                	jal	3944 <__hidden___udivsi3>
  neg   a0, a0
    398e:	40a00533          	neg	a0,a0
  jr    t0
    3992:	8282                	jr	t0

00003994 <__modsi3>:
FUNC_END (__divdi3)

FUNC_BEGIN (__moddi3)
  move   t0, ra
    3994:	8286                	mv	t0,ra
  bltz   a1, .L31
    3996:	0005c763          	bltz	a1,39a4 <__modsi3+0x10>
  bltz   a0, .L32
    399a:	00054963          	bltz	a0,39ac <__modsi3+0x18>
.L30:
  jal    HIDDEN_JUMPTARGET(__udivdi3)    /* The dividend is not negative.  */
    399e:	375d                	jal	3944 <__hidden___udivsi3>
  move   a0, a1
    39a0:	852e                	mv	a0,a1
  jr     t0
    39a2:	8282                	jr	t0
.L31:
  neg    a1, a1
    39a4:	40b005b3          	neg	a1,a1
  bgez   a0, .L30
    39a8:	fe055be3          	bgez	a0,399e <__modsi3+0xa>
.L32:
  neg    a0, a0
    39ac:	40a00533          	neg	a0,a0
  jal    HIDDEN_JUMPTARGET(__udivdi3)    /* The dividend is hella negative.  */
    39b0:	3f51                	jal	3944 <__hidden___udivsi3>
  neg    a0, a1
    39b2:	40b00533          	neg	a0,a1
  jr     t0
    39b6:	8282                	jr	t0
    39b8:	0001                	nop

000039ba <assign_LE_values>:
typeInf in3_buf[3];
typeInf in4_buf[6];

/* Assign input buffers for seed and point global in1..in4 pointers at them */
static void assign_LE_values(int seed)
{
    39ba:	1101                	addi	sp,sp,-32
    39bc:	ce06                	sw	ra,28(sp)
    39be:	cc22                	sw	s0,24(sp)
    39c0:	1000                	addi	s0,sp,32
    39c2:	fea42623          	sw	a0,-20(s0)
    in1_buf[0] = dataSourcesLE_0[seed];
    39c6:	67a9                	lui	a5,0xa
    39c8:	6f478713          	addi	a4,a5,1780 # a6f4 <dataSourcesLE_0>
    39cc:	fec42783          	lw	a5,-20(s0)
    39d0:	078a                	slli	a5,a5,0x2
    39d2:	97ba                	add	a5,a5,a4
    39d4:	4398                	lw	a4,0(a5)
    39d6:	c5018793          	addi	a5,gp,-944 # b7e4 <in1_buf>
    39da:	c398                	sw	a4,0(a5)
    in1_buf[1] = dataSourcesLE_1[seed];
    39dc:	67ad                	lui	a5,0xb
    39de:	88478713          	addi	a4,a5,-1916 # a884 <dataSourcesLE_1>
    39e2:	fec42783          	lw	a5,-20(s0)
    39e6:	078a                	slli	a5,a5,0x2
    39e8:	97ba                	add	a5,a5,a4
    39ea:	4398                	lw	a4,0(a5)
    39ec:	c5018793          	addi	a5,gp,-944 # b7e4 <in1_buf>
    39f0:	c3d8                	sw	a4,4(a5)
    in1_buf[2] = dataSourcesLE_2[seed];
    39f2:	67ad                	lui	a5,0xb
    39f4:	a1478713          	addi	a4,a5,-1516 # aa14 <dataSourcesLE_2>
    39f8:	fec42783          	lw	a5,-20(s0)
    39fc:	078a                	slli	a5,a5,0x2
    39fe:	97ba                	add	a5,a5,a4
    3a00:	4398                	lw	a4,0(a5)
    3a02:	c5018793          	addi	a5,gp,-944 # b7e4 <in1_buf>
    3a06:	c798                	sw	a4,8(a5)

    in2_buf[0] = dataSourcesLE_3[0];
    3a08:	4701                	li	a4,0
    3a0a:	c5c18793          	addi	a5,gp,-932 # b7f0 <in2_buf>
    3a0e:	c398                	sw	a4,0(a5)
    in2_buf[1] = dataSourcesLE_4[0];
    3a10:	015a0737          	lui	a4,0x15a0
    3a14:	c5c18793          	addi	a5,gp,-932 # b7f0 <in2_buf>
    3a18:	c3d8                	sw	a4,4(a5)
    in2_buf[2] = dataSourcesLE_5[0];
    3a1a:	010b0737          	lui	a4,0x10b0
    3a1e:	c5c18793          	addi	a5,gp,-932 # b7f0 <in2_buf>
    3a22:	c798                	sw	a4,8(a5)

    in3_buf[0] = dataSourcesLE_6[seed];
    3a24:	67ad                	lui	a5,0xb
    3a26:	ba478713          	addi	a4,a5,-1116 # aba4 <dataSourcesLE_6>
    3a2a:	fec42783          	lw	a5,-20(s0)
    3a2e:	078a                	slli	a5,a5,0x2
    3a30:	97ba                	add	a5,a5,a4
    3a32:	4398                	lw	a4,0(a5)
    3a34:	c6818793          	addi	a5,gp,-920 # b7fc <in3_buf>
    3a38:	c398                	sw	a4,0(a5)
    in3_buf[1] = dataSourcesLE_7[seed];
    3a3a:	67ad                	lui	a5,0xb
    3a3c:	d3478713          	addi	a4,a5,-716 # ad34 <dataSourcesLE_7>
    3a40:	fec42783          	lw	a5,-20(s0)
    3a44:	078a                	slli	a5,a5,0x2
    3a46:	97ba                	add	a5,a5,a4
    3a48:	4398                	lw	a4,0(a5)
    3a4a:	c6818793          	addi	a5,gp,-920 # b7fc <in3_buf>
    3a4e:	c3d8                	sw	a4,4(a5)
    in3_buf[2] = dataSourcesLE_8[seed];
    3a50:	67ad                	lui	a5,0xb
    3a52:	ec478713          	addi	a4,a5,-316 # aec4 <dataSourcesLE_8>
    3a56:	fec42783          	lw	a5,-20(s0)
    3a5a:	078a                	slli	a5,a5,0x2
    3a5c:	97ba                	add	a5,a5,a4
    3a5e:	4398                	lw	a4,0(a5)
    3a60:	c6818793          	addi	a5,gp,-920 # b7fc <in3_buf>
    3a64:	c798                	sw	a4,8(a5)

    in4_buf[0] = dataSourcesLE_9[0];
    3a66:	08000737          	lui	a4,0x8000
    3a6a:	c7418793          	addi	a5,gp,-908 # b808 <in4_buf>
    3a6e:	c398                	sw	a4,0(a5)
    in4_buf[1] = dataSourcesLE_10[0];
    3a70:	08000737          	lui	a4,0x8000
    3a74:	c7418793          	addi	a5,gp,-908 # b808 <in4_buf>
    3a78:	c3d8                	sw	a4,4(a5)
    in4_buf[2] = dataSourcesLE_11[0];
    3a7a:	08000737          	lui	a4,0x8000
    3a7e:	c7418793          	addi	a5,gp,-908 # b808 <in4_buf>
    3a82:	c798                	sw	a4,8(a5)
    in4_buf[3] = dataSourcesLE_12[0];
    3a84:	08000737          	lui	a4,0x8000
    3a88:	c7418793          	addi	a5,gp,-908 # b808 <in4_buf>
    3a8c:	c7d8                	sw	a4,12(a5)
    in4_buf[4] = dataSourcesLE_13[0];
    3a8e:	02000737          	lui	a4,0x2000
    3a92:	c7418793          	addi	a5,gp,-908 # b808 <in4_buf>
    3a96:	cb98                	sw	a4,16(a5)
    in4_buf[5] = dataSourcesLE_14[0];
    3a98:	01000737          	lui	a4,0x1000
    3a9c:	c7418793          	addi	a5,gp,-908 # b808 <in4_buf>
    3aa0:	cbd8                	sw	a4,20(a5)

    in1 = in1_buf;
    3aa2:	c5018713          	addi	a4,gp,-944 # b7e4 <in1_buf>
    3aa6:	94e1a623          	sw	a4,-1716(gp) # b4e0 <in1>
    in2 = in2_buf;
    3aaa:	c5c18713          	addi	a4,gp,-932 # b7f0 <in2_buf>
    3aae:	94e1a823          	sw	a4,-1712(gp) # b4e4 <in2>
    in3 = in3_buf;
    3ab2:	c6818713          	addi	a4,gp,-920 # b7fc <in3_buf>
    3ab6:	94e1aa23          	sw	a4,-1708(gp) # b4e8 <in3>
    in4 = in4_buf;
    3aba:	c7418713          	addi	a4,gp,-908 # b808 <in4_buf>
    3abe:	94e1ac23          	sw	a4,-1704(gp) # b4ec <in4>
}
    3ac2:	0001                	nop
    3ac4:	40f2                	lw	ra,28(sp)
    3ac6:	4462                	lw	s0,24(sp)
    3ac8:	6105                	addi	sp,sp,32
    3aca:	8082                	ret

00003acc <main>:

int main(void)
{
    3acc:	1101                	addi	sp,sp,-32
    3ace:	ce06                	sw	ra,28(sp)
    3ad0:	cc22                	sw	s0,24(sp)
    3ad2:	1000                	addi	s0,sp,32
    uint32_t * total_cycles = malloc(sizeof(uint32_t));
    3ad4:	4511                	li	a0,4
    3ad6:	d56ff0ef          	jal	302c <malloc>
    3ada:	87aa                	mv	a5,a0
    3adc:	fef42423          	sw	a5,-24(s0)
    *total_cycles = 0;
    3ae0:	fe842783          	lw	a5,-24(s0)
    3ae4:	0007a023          	sw	zero,0(a5)

    typeInf actionID = -1;
    3ae8:	57fd                	li	a5,-1
    3aea:	fef42223          	sw	a5,-28(s0)

    for (int seed = 0; seed < 5; ++seed) // NB_SEED
    3aee:	fe042623          	sw	zero,-20(s0)
    3af2:	a099                	j	3b38 <main+0x6c>
    {
        assign_LE_values(seed);
    3af4:	fec42503          	lw	a0,-20(s0)
    3af8:	35c9                	jal	39ba <assign_LE_values>

        inferenceTPG(&actionID, in1, in2, in3, in4, total_cycles);
    3afa:	94c1a583          	lw	a1,-1716(gp) # b4e0 <in1>
    3afe:	9501a603          	lw	a2,-1712(gp) # b4e4 <in2>
    3b02:	9541a683          	lw	a3,-1708(gp) # b4e8 <in3>
    3b06:	9581a703          	lw	a4,-1704(gp) # b4ec <in4>
    3b0a:	fe440513          	addi	a0,s0,-28
    3b0e:	fe842783          	lw	a5,-24(s0)
    3b12:	ac1fc0ef          	jal	5d2 <inferenceTPG>

        PRINTF("cycles_avg: %d, actionID; %d\n", *total_cycles, actionID);
    3b16:	fe842783          	lw	a5,-24(s0)
    3b1a:	439c                	lw	a5,0(a5)
    3b1c:	fe442703          	lw	a4,-28(s0)
    3b20:	863a                	mv	a2,a4
    3b22:	85be                	mv	a1,a5
    3b24:	67ad                	lui	a5,0xb
    3b26:	37478513          	addi	a0,a5,884 # b374 <ids_graph_traversals+0x190>
    3b2a:	d0aff0ef          	jal	3034 <iprintf>
    for (int seed = 0; seed < 5; ++seed) // NB_SEED
    3b2e:	fec42783          	lw	a5,-20(s0)
    3b32:	0785                	addi	a5,a5,1
    3b34:	fef42623          	sw	a5,-20(s0)
    3b38:	fec42703          	lw	a4,-20(s0)
    3b3c:	4791                	li	a5,4
    3b3e:	fae7dbe3          	bge	a5,a4,3af4 <main+0x28>
    }

    return 0;
    3b42:	4781                	li	a5,0
}
    3b44:	853e                	mv	a0,a5
    3b46:	40f2                	lw	ra,28(sp)
    3b48:	4462                	lw	s0,24(sp)
    3b4a:	6105                	addi	sp,sp,32
    3b4c:	8082                	ret
