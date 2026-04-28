
main.elf:     file format elf32-littleriscv


Disassembly of section .vectors:

00000000 <__vector_start>:

.section .vectors, "ax"
.option norvc
vector_table:
	//  0 : exception Handler and user software interrupt
	j handler_exception
   0:	02c0106f          	j	102c <handler_exception>
	//  1 : supervisor software interrupt
	j __no_irq_handler
   4:	53e0006f          	j	542 <__no_irq_handler>
	//  2 : unmapped
	j __no_irq_handler
   8:	53a0006f          	j	542 <__no_irq_handler>
	//  3 : machine software interrupt handler
	j handler_irq_software
   c:	0800106f          	j	108c <handler_irq_software>
	//  4 : user timer interrupt
	j __no_irq_handler
  10:	5320006f          	j	542 <__no_irq_handler>
	//  5 : supervisor timer interrupt
	j __no_irq_handler
  14:	52e0006f          	j	542 <__no_irq_handler>
	//  6 : unmapped
	j __no_irq_handler
  18:	52a0006f          	j	542 <__no_irq_handler>
	//  7 : machine timer interrupt handler
	j handler_irq_timer
  1c:	0940106f          	j	10b0 <handler_irq_timer>
	//  8 : user external interrupt
	j __no_irq_handler
  20:	5220006f          	j	542 <__no_irq_handler>
	//  9 : supervisor external interrupt
	j __no_irq_handler
  24:	51e0006f          	j	542 <__no_irq_handler>
	// 10 : unmapped
	j __no_irq_handler
  28:	51a0006f          	j	542 <__no_irq_handler>
	// 11 : machine external interrupt handler
	j handler_irq_external
  2c:	4110006f          	j	c3c <handler_irq_external>
	// 12 : unmapped
	j __no_irq_handler
  30:	5120006f          	j	542 <__no_irq_handler>
	// 13 : unmapped
	j __no_irq_handler
  34:	50e0006f          	j	542 <__no_irq_handler>
	// 14 : unmapped
	j __no_irq_handler
  38:	50a0006f          	j	542 <__no_irq_handler>
	// 15 : unmapped
	j __no_irq_handler
  3c:	5060006f          	j	542 <__no_irq_handler>
	// 16 : fast interrupt - timer_1
	j handler_irq_fast_timer_1
  40:	4490006f          	j	c88 <handler_irq_fast_timer_1>
	// 17 : fast interrupt - timer_2
	j handler_irq_fast_timer_2
  44:	4850006f          	j	cc8 <handler_irq_fast_timer_2>
	// 18 : fast interrupt - timer_3
	j handler_irq_fast_timer_3
  48:	4c10006f          	j	d08 <handler_irq_fast_timer_3>
	// 19 : fast interrupt - dma_done
	j handler_irq_fast_dma_done
  4c:	7590006f          	j	fa4 <handler_irq_fast_dma_done>
	// 20 : fast interrupt - spi
	j handler_irq_fast_spi
  50:	26d0006f          	j	abc <handler_irq_fast_spi>
	// 21 : fast interrupt - spi_flash
	j handler_irq_fast_spi_flash
  54:	32d0006f          	j	b80 <handler_irq_fast_spi_flash>
	// 22 : fast interrupt - gpio_0
	j handler_irq_fast_gpio_0
  58:	5310006f          	j	d88 <handler_irq_fast_gpio_0>
	// 23 : fast interrupt - gpio_1
	j handler_irq_fast_gpio_1
  5c:	56d0006f          	j	dc8 <handler_irq_fast_gpio_1>
	// 24 : fast interrupt - gpio_2
	j handler_irq_fast_gpio_2
  60:	5a90006f          	j	e08 <handler_irq_fast_gpio_2>
	// 25 : fast interrupt - gpio_3
	j handler_irq_fast_gpio_3
  64:	5e90006f          	j	e4c <handler_irq_fast_gpio_3>
	// 26 : fast interrupt - gpio_4
	j handler_irq_fast_gpio_4
  68:	6290006f          	j	e90 <handler_irq_fast_gpio_4>
	// 27 : fast interrupt - gpio_5
	j handler_irq_fast_gpio_5
  6c:	6690006f          	j	ed4 <handler_irq_fast_gpio_5>
	// 28 : fast interrupt - gpio_6
	j handler_irq_fast_gpio_6
  70:	6ad0006f          	j	f1c <handler_irq_fast_gpio_6>
	// 29 : fast interrupt - gpio_7
	j handler_irq_fast_gpio_7
  74:	6ed0006f          	j	f60 <handler_irq_fast_gpio_7>
	// 30 : fast interrupt - dma_window
	j handler_irq_fast_dma_window
  78:	7710006f          	j	fe8 <handler_irq_fast_dma_window>
	// 31 : fast interrupt - external peripheral
	j handler_irq_fast_external_peripheral
  7c:	4cd0006f          	j	d48 <handler_irq_fast_external_peripheral>

Disassembly of section .init:

00000180 <_start>:

_start:
/* initialize global pointer */
.option push
.option norelax
1: auipc gp, %pcrel_hi(__global_pointer$)
 180:	0000c197          	auipc	gp,0xc
   addi  gp, gp, %pcrel_lo(1b)
 184:	8a418193          	addi	gp,gp,-1884 # ba24 <__global_pointer$>
.option pop

/* initialize stack pointer */
   la sp, _sp
 188:	0000c117          	auipc	sp,0xc
 18c:	44810113          	addi	sp,sp,1096 # c5d0 <_sp>

/* set the frequency */
   li a0, SOC_CTRL_START_ADDRESS
 190:	20000537          	lui	a0,0x20000
   li a2, REFERENCE_CLOCK_Hz
 194:	05f5e637          	lui	a2,0x5f5e
 198:	10060613          	addi	a2,a2,256 # 5f5e100 <_sp+0x5f51b30>
   sw a2, SOC_CTRL_SYSTEM_FREQUENCY_HZ_REG_OFFSET(a0)
 19c:	cd50                	sw	a2,28(a0)

0000019e <_init_bss>:

#endif

/* clear the bss segment */
_init_bss:
    la     a0, __bss_start
 19e:	0000b517          	auipc	a0,0xb
 1a2:	1d250513          	addi	a0,a0,466 # b370 <__stdio_exit_handler>
    la     a2, __bss_end
 1a6:	0000b617          	auipc	a2,0xb
 1aa:	41e60613          	addi	a2,a2,1054 # b5c4 <__BSS_END__>
    sub    a2, a2, a0
 1ae:	8e09                	sub	a2,a2,a0
    li     a1, 0
 1b0:	4581                	li	a1,0
    call   memset
 1b2:	2ac010ef          	jal	145e <memset>
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
 1ca:	26650513          	addi	a0,a0,614 # 142c <__libc_fini_array>
    call atexit
 1ce:	76b000ef          	jal	1138 <atexit>
    call __libc_init_array
 1d2:	1f4010ef          	jal	13c6 <__libc_init_array>

/* call main */
    lw a0, 0(sp)                    /* a0 = argc */
 1d6:	4502                	lw	a0,0(sp)
    addi a1, sp, __SIZEOF_POINTER__ /* a1 = argv */
 1d8:	004c                	addi	a1,sp,4
    li a2, 0                        /* a2 = envp = NULL */
 1da:	4601                	li	a2,0
    call main
 1dc:	034000ef          	jal	210 <main>
    tail exit
 1e0:	00c0006f          	j	1ec <exit>

000001e4 <_init>:
.global _init
.type   _init, @function
.global _fini
.type   _fini, @function
_init:
    call init
 1e4:	6ef000ef          	jal	10d2 <init>

000001e8 <_fini>:
_fini:
 /* These don't have to do anything since we use init_array/fini_array. Prevent
    missing symbol error */
    ret
 1e8:	8082                	ret

Disassembly of section .text:

000001ec <exit>:
     1ec:	1161                	addi	sp,sp,-8
     1ee:	6785                	lui	a5,0x1
     1f0:	c022                	sw	s0,0(sp)
     1f2:	c206                	sw	ra,4(sp)
     1f4:	4e278793          	addi	a5,a5,1250 # 14e2 <__call_exitprocs>
     1f8:	842a                	mv	s0,a0
     1fa:	c781                	beqz	a5,202 <exit+0x16>
     1fc:	4581                	li	a1,0
     1fe:	2e4010ef          	jal	14e2 <__call_exitprocs>
     202:	94c1a783          	lw	a5,-1716(gp) # b370 <__stdio_exit_handler>
     206:	c391                	beqz	a5,20a <exit+0x1e>
     208:	9782                	jalr	a5
     20a:	8522                	mv	a0,s0
     20c:	6cf000ef          	jal	10da <_exit>

00000210 <main>:
    double delta2 = x - s->mean;
    s->M2 += delta * delta2;
}

int main(void)
{
     210:	ea810113          	addi	sp,sp,-344
     214:	05f10793          	addi	a5,sp,95
     218:	9be1                	andi	a5,a5,-8
     21a:	da3e                	sw	a5,52(sp)
     21c:	14112a23          	sw	ra,340(sp)
     220:	14812823          	sw	s0,336(sp)
     224:	14912623          	sw	s1,332(sp)
    /* Prepare CSR cycle counter */
    CSR_CLEAR_BITS(CSR_REG_MCOUNTINHIBIT, 0x1); // enable cycle counting
     228:	4785                	li	a5,1
     22a:	3207b073          	csrc	mcountinhibit,a5

    /* Arrays sized by NB_CLASSES (extern from LE_states.h) */
    Welford accumulators[NB_CLASSES];

    for (int c = 0; c < NB_CLASSES; ++c) {
        accumulators[c].count = 0;
     22e:	54d2                	lw	s1,52(sp)
        accumulators[c].M2 = 0.0;
    }

    /* Temporary variables */
    uint32_t total_cycles = 0;
    typeInf actionID = -1;
     230:	57fd                	li	a5,-1
     232:	cabe                	sw	a5,84(sp)
     234:	63ad                	lui	t2,0xb
        accumulators[c].count = 0;
     236:	0004a023          	sw	zero,0(s1)
        accumulators[c].mean = 0.0;
     23a:	0004a423          	sw	zero,8(s1)
     23e:	0004a623          	sw	zero,12(s1)
        accumulators[c].M2 = 0.0;
     242:	0004a823          	sw	zero,16(s1)
     246:	0004aa23          	sw	zero,20(s1)
        accumulators[c].count = 0;
     24a:	0004ac23          	sw	zero,24(s1)
        accumulators[c].mean = 0.0;
     24e:	0204a023          	sw	zero,32(s1)
     252:	0204a223          	sw	zero,36(s1)
        accumulators[c].M2 = 0.0;
     256:	0204a423          	sw	zero,40(s1)
     25a:	0204a623          	sw	zero,44(s1)
        accumulators[c].count = 0;
     25e:	0204a823          	sw	zero,48(s1)
        accumulators[c].mean = 0.0;
     262:	0204ac23          	sw	zero,56(s1)
     266:	0204ae23          	sw	zero,60(s1)
        accumulators[c].M2 = 0.0;
     26a:	0404a023          	sw	zero,64(s1)
     26e:	0404a223          	sw	zero,68(s1)
        accumulators[c].count = 0;
     272:	0404a423          	sw	zero,72(s1)
        accumulators[c].mean = 0.0;
     276:	0404a823          	sw	zero,80(s1)
     27a:	0404aa23          	sw	zero,84(s1)
        accumulators[c].M2 = 0.0;
     27e:	0404ac23          	sw	zero,88(s1)
     282:	0404ae23          	sw	zero,92(s1)
        accumulators[c].count = 0;
     286:	0604a023          	sw	zero,96(s1)
        accumulators[c].mean = 0.0;
     28a:	0604a423          	sw	zero,104(s1)
     28e:	0604a623          	sw	zero,108(s1)
        accumulators[c].M2 = 0.0;
     292:	0604a823          	sw	zero,112(s1)
     296:	0604aa23          	sw	zero,116(s1)
        accumulators[c].count = 0;
     29a:	0604ac23          	sw	zero,120(s1)
        accumulators[c].mean = 0.0;
     29e:	0804a023          	sw	zero,128(s1)
     2a2:	0804a223          	sw	zero,132(s1)
        accumulators[c].M2 = 0.0;
     2a6:	0804a423          	sw	zero,136(s1)
     2aa:	0804a623          	sw	zero,140(s1)
        accumulators[c].count = 0;
     2ae:	0804a823          	sw	zero,144(s1)
        accumulators[c].mean = 0.0;
     2b2:	b7c18793          	addi	a5,gp,-1156 # b5a0 <in3_buf>
     2b6:	62ad                	lui	t0,0xb
     2b8:	0804ac23          	sw	zero,152(s1)
     2bc:	0804ae23          	sw	zero,156(s1)
        accumulators[c].M2 = 0.0;
     2c0:	0a04a023          	sw	zero,160(s1)
     2c4:	0a04a223          	sw	zero,164(s1)
        accumulators[c].count = 0;
     2c8:	0a04a423          	sw	zero,168(s1)
        accumulators[c].mean = 0.0;
     2cc:	0a04a823          	sw	zero,176(s1)
     2d0:	0a04aa23          	sw	zero,180(s1)
        accumulators[c].M2 = 0.0;
     2d4:	0a04ac23          	sw	zero,184(s1)
     2d8:	0a04ae23          	sw	zero,188(s1)
        accumulators[c].count = 0;
     2dc:	0c04a023          	sw	zero,192(s1)
        accumulators[c].mean = 0.0;
     2e0:	0c04a423          	sw	zero,200(s1)
     2e4:	0c04a623          	sw	zero,204(s1)
        accumulators[c].M2 = 0.0;
     2e8:	0c04a823          	sw	zero,208(s1)
     2ec:	0c04aa23          	sw	zero,212(s1)
        accumulators[c].count = 0;
     2f0:	0c04ac23          	sw	zero,216(s1)
        accumulators[c].mean = 0.0;
     2f4:	0e04a023          	sw	zero,224(s1)
     2f8:	0e04a223          	sw	zero,228(s1)
        accumulators[c].M2 = 0.0;
     2fc:	0e04a423          	sw	zero,232(s1)
     300:	0e04a623          	sw	zero,236(s1)

    for (int seed = 0; seed < NB_SEED; ++seed)
     304:	b6418493          	addi	s1,gp,-1180 # b588 <in4_buf>
     308:	8c438413          	addi	s0,t2,-1852 # a8c4 <dataSourcesLE_0>
     30c:	632d                	lui	t1,0xb
     30e:	652d                	lui	a0,0xb
     310:	65ad                	lui	a1,0xb
     312:	662d                	lui	a2,0xb
     314:	c0a2                	sw	s0,64(sp)
     316:	c63e                	sw	a5,12(sp)
     318:	a5428413          	addi	s0,t0,-1452 # aa54 <dataSourcesLE_1>
     31c:	67ad                	lui	a5,0xb
     31e:	de22                	sw	s0,60(sp)
     320:	8c450513          	addi	a0,a0,-1852 # a8c4 <dataSourcesLE_0>
     324:	be430413          	addi	s0,t1,-1052 # abe4 <dataSourcesLE_2>
     328:	d7458593          	addi	a1,a1,-652 # ad74 <dataSourcesLE_7>
     32c:	f0460613          	addi	a2,a2,-252 # af04 <dataSourcesLE_8>
     330:	b9418693          	addi	a3,gp,-1132 # b5b8 <in1_buf>
     334:	b8818713          	addi	a4,gp,-1144 # b5ac <in2_buf>
     338:	09478793          	addi	a5,a5,148 # b094 <ids_graph_traversals>
     33c:	c4a2                	sw	s0,72(sp)
     33e:	c6aa                	sw	a0,76(sp)
     340:	c8ae                	sw	a1,80(sp)
     342:	dc32                	sw	a2,56(sp)
     344:	cc36                	sw	a3,24(sp)
     346:	ca3a                	sw	a4,20(sp)
     348:	c2be                	sw	a5,68(sp)
    typeInf actionID = -1;
     34a:	4381                	li	t2,0
    for (int seed = 0; seed < NB_SEED; ++seed)
     34c:	c002                	sw	zero,0(sp)
    in1_buf[0] = dataSourcesLE_0[seed];
     34e:	4786                	lw	a5,64(sp)
    in1 = in1_buf;
     350:	4462                	lw	s0,24(sp)
    in1_buf[0] = dataSourcesLE_0[seed];
     352:	007785b3          	add	a1,a5,t2
    in1_buf[1] = dataSourcesLE_1[seed];
     356:	57f2                	lw	a5,60(sp)
    in1 = in1_buf;
     358:	9681a623          	sw	s0,-1684(gp) # b390 <in1>
    in2 = in2_buf;
     35c:	4452                	lw	s0,20(sp)
    in1_buf[1] = dataSourcesLE_1[seed];
     35e:	00778633          	add	a2,a5,t2
    in1_buf[2] = dataSourcesLE_2[seed];
     362:	47a6                	lw	a5,72(sp)
    in2 = in2_buf;
     364:	9681a423          	sw	s0,-1688(gp) # b38c <in2>
    in1_buf[2] = dataSourcesLE_2[seed];
     368:	007786b3          	add	a3,a5,t2
    in3_buf[0] = dataSourcesLE_6[seed];
     36c:	47b6                	lw	a5,76(sp)
    in3 = in3_buf;
     36e:	4432                	lw	s0,12(sp)
    in1_buf[0] = dataSourcesLE_0[seed];
     370:	418c                	lw	a1,0(a1)
    in3_buf[0] = dataSourcesLE_6[seed];
     372:	00778733          	add	a4,a5,t2
    in3_buf[1] = dataSourcesLE_7[seed];
     376:	47c6                	lw	a5,80(sp)
    in3_buf[0] = dataSourcesLE_6[seed];
     378:	4318                	lw	a4,0(a4)
    in1_buf[1] = dataSourcesLE_1[seed];
     37a:	4210                	lw	a2,0(a2)
    in3_buf[1] = dataSourcesLE_7[seed];
     37c:	979e                	add	a5,a5,t2
     37e:	439c                	lw	a5,0(a5)
    in1_buf[2] = dataSourcesLE_2[seed];
     380:	4294                	lw	a3,0(a3)
    in3_buf[0] = dataSourcesLE_6[seed];
     382:	cc98                	sw	a4,24(s1)
    in3_buf[1] = dataSourcesLE_7[seed];
     384:	ccdc                	sw	a5,28(s1)
    in3_buf[2] = dataSourcesLE_8[seed];
     386:	57e2                	lw	a5,56(sp)
    in2_buf[1] = dataSourcesLE_4[0];
     388:	015a0737          	lui	a4,0x15a0
     38c:	d498                	sw	a4,40(s1)
    in3_buf[2] = dataSourcesLE_8[seed];
     38e:	979e                	add	a5,a5,t2
     390:	439c                	lw	a5,0(a5)
    in4_buf[4] = dataSourcesLE_13[0];
     392:	02000737          	lui	a4,0x2000
    in3_buf[2] = dataSourcesLE_8[seed];
     396:	d09c                	sw	a5,32(s1)
    in2_buf[2] = dataSourcesLE_5[0];
     398:	010b07b7          	lui	a5,0x10b0
    in3 = in3_buf;
     39c:	9681a223          	sw	s0,-1692(gp) # b388 <in3>
    in2_buf[2] = dataSourcesLE_5[0];
     3a0:	d4dc                	sw	a5,44(s1)
    in4_buf[4] = dataSourcesLE_13[0];
     3a2:	c898                	sw	a4,16(s1)
    in4_buf[0] = dataSourcesLE_9[0];
     3a4:	080007b7          	lui	a5,0x8000
    in4_buf[5] = dataSourcesLE_14[0];
     3a8:	01000737          	lui	a4,0x1000
    in4_buf[0] = dataSourcesLE_9[0];
     3ac:	c09c                	sw	a5,0(s1)
    in4_buf[1] = dataSourcesLE_10[0];
     3ae:	c0dc                	sw	a5,4(s1)
    in2_buf[0] = dataSourcesLE_3[0];
     3b0:	0204a223          	sw	zero,36(s1)
    in4 = in4_buf;
     3b4:	9691a023          	sw	s1,-1696(gp) # b384 <in4>
    in1_buf[0] = dataSourcesLE_0[seed];
     3b8:	d88c                	sw	a1,48(s1)
    in1_buf[1] = dataSourcesLE_1[seed];
     3ba:	d8d0                	sw	a2,52(s1)
    in1_buf[2] = dataSourcesLE_2[seed];
     3bc:	dc94                	sw	a3,56(s1)
    in4_buf[5] = dataSourcesLE_14[0];
     3be:	c8d8                	sw	a4,20(s1)
    in4_buf[2] = dataSourcesLE_11[0];
     3c0:	c49c                	sw	a5,8(s1)
    in4_buf[3] = dataSourcesLE_12[0];
     3c2:	c4dc                	sw	a5,12(s1)
    {
        assign_LE_values(seed);

        /* reset MCYCLE */
        CSR_WRITE(CSR_REG_MCYCLE, 0);
     3c4:	4781                	li	a5,0
     3c6:	b0079073          	csrw	mcycle,a5
     3ca:	4429                	li	s0,10
     3cc:	46b2                	lw	a3,12(sp)
     3ce:	4652                	lw	a2,20(sp)
     3d0:	45e2                	lw	a1,24(sp)
     3d2:	8726                	mv	a4,s1
     3d4:	c21e                	sw	t2,4(sp)
     3d6:	a809                	j	3e8 <main+0x1d8>

        /* run inference NB_ACTIONS_INF times */
        for (uint32_t j = 0; j < NB_ACTIONS_INF; ++j)
        {
            inferenceTPG(&actionID, in1, in2, in3, in4);
     3d8:	96c1a583          	lw	a1,-1684(gp) # b390 <in1>
     3dc:	9681a603          	lw	a2,-1688(gp) # b38c <in2>
     3e0:	9641a683          	lw	a3,-1692(gp) # b388 <in3>
     3e4:	9601a703          	lw	a4,-1696(gp) # b384 <in4>
     3e8:	08c8                	addi	a0,sp,84
        for (uint32_t j = 0; j < NB_ACTIONS_INF; ++j)
     3ea:	147d                	addi	s0,s0,-1
            inferenceTPG(&actionID, in1, in2, in3, in4);
     3ec:	236d                	jal	996 <inferenceTPG>
        for (uint32_t j = 0; j < NB_ACTIONS_INF; ++j)
     3ee:	f46d                	bnez	s0,3d8 <main+0x1c8>
        }

        /* read cycles (64-bit if available in CSR_READ) */
        CSR_READ(CSR_REG_MCYCLE, &total_cycles);
     3f0:	4392                	lw	t2,4(sp)
     3f2:	b0002573          	csrr	a0,mcycle
        // each graph traversal/class is done NB_ACTIONS_INF times 
        uint32_t cycles_avg = total_cycles / NB_ACTIONS_INF;

        //PRINTF("cycles_avg; %d\n", total_cycles);

        int cls = ids_graph_traversals[seed];
     3f6:	4796                	lw	a5,68(sp)
     3f8:	979e                	add	a5,a5,t2
     3fa:	4380                	lw	s0,0(a5)
        if (cls < 0 || cls >= NB_CLASSES) {
     3fc:	47a5                	li	a5,9
     3fe:	1287e963          	bltu	a5,s0,530 <main+0x320>
        uint32_t cycles_avg = total_cycles / NB_ACTIONS_INF;
     402:	45a9                	li	a1,10
     404:	d81e                	sw	t2,48(sp)
     406:	02b030ef          	jal	3c30 <__hidden___udivsi3>
            PRINTF("Seed %d has invalid class %d\n", seed, cls);
            continue;
        }

        welford_add(&accumulators[cls], cycles_avg);
     40a:	1e7030ef          	jal	3df0 <__floatunsidf>
    s->count++;
     40e:	57d2                	lw	a5,52(sp)
     410:	20842433          	sh1add	s0,s0,s0
        welford_add(&accumulators[cls], cycles_avg);
     414:	ce2a                	sw	a0,28(sp)
    s->count++;
     416:	20f46433          	sh3add	s0,s0,a5
     41a:	00042303          	lw	t1,0(s0)
    double delta = x - s->mean;
     41e:	4418                	lw	a4,8(s0)
     420:	445c                	lw	a5,12(s0)
    s->count++;
     422:	0305                	addi	t1,t1,1
     424:	00642023          	sw	t1,0(s0)
    double delta = x - s->mean;
     428:	863a                	mv	a2,a4
     42a:	86be                	mv	a3,a5
    s->count++;
     42c:	d21a                	sw	t1,36(sp)
    double delta = x - s->mean;
     42e:	d43a                	sw	a4,40(sp)
     430:	d63e                	sw	a5,44(sp)
        welford_add(&accumulators[cls], cycles_avg);
     432:	d02e                	sw	a1,32(sp)
    double delta = x - s->mean;
     434:	1f6030ef          	jal	362a <__subdf3>
     438:	c22a                	sw	a0,4(sp)
    s->mean += delta / s->count;
     43a:	5512                	lw	a0,36(sp)
    double delta = x - s->mean;
     43c:	c42e                	sw	a1,8(sp)
    s->mean += delta / s->count;
     43e:	1b3030ef          	jal	3df0 <__floatunsidf>
     442:	862a                	mv	a2,a0
     444:	86ae                	mv	a3,a1
     446:	4512                	lw	a0,4(sp)
     448:	45a2                	lw	a1,8(sp)
     44a:	652020ef          	jal	2a9c <__divdf3>
     44e:	5722                	lw	a4,40(sp)
     450:	57b2                	lw	a5,44(sp)
     452:	863a                	mv	a2,a4
     454:	86be                	mv	a3,a5
     456:	09e020ef          	jal	24f4 <__adddf3>
     45a:	872a                	mv	a4,a0
     45c:	87ae                	mv	a5,a1
    double delta2 = x - s->mean;
     45e:	4572                	lw	a0,28(sp)
     460:	5582                	lw	a1,32(sp)
     462:	863a                	mv	a2,a4
     464:	86be                	mv	a3,a5
    s->mean += delta / s->count;
     466:	c418                	sw	a4,8(s0)
     468:	c45c                	sw	a5,12(s0)
    double delta2 = x - s->mean;
     46a:	1c0030ef          	jal	362a <__subdf3>
    s->M2 += delta * delta2;
     46e:	4612                	lw	a2,4(sp)
     470:	46a2                	lw	a3,8(sp)
     472:	4bf020ef          	jal	3130 <__muldf3>
     476:	862a                	mv	a2,a0
     478:	86ae                	mv	a3,a1
     47a:	4808                	lw	a0,16(s0)
     47c:	484c                	lw	a1,20(s0)
     47e:	076020ef          	jal	24f4 <__adddf3>
     482:	53c2                	lw	t2,48(sp)
     484:	c808                	sw	a0,16(s0)
     486:	c84c                	sw	a1,20(s0)
    for (int seed = 0; seed < NB_SEED; ++seed)
     488:	4782                	lw	a5,0(sp)
     48a:	0391                	addi	t2,t2,4
     48c:	0785                	addi	a5,a5,1 # 8000001 <_sp+0x7ff3a31>
     48e:	c03e                	sw	a5,0(sp)
     490:	4702                	lw	a4,0(sp)
     492:	06400793          	li	a5,100
     496:	eaf71ce3          	bne	a4,a5,34e <main+0x13e>
    }

    /* Print per-class statistics */
    PRINTF("Class,Count,AvgCyclesPerClass,StddevCyclesPerClass\n");
     49a:	6529                	lui	a0,0xa
     49c:	6fc50513          	addi	a0,a0,1788 # a6fc <__clz_tab+0x120>
     4a0:	53a010ef          	jal	19da <puts>
    for (int c = 0; c < NB_CLASSES; ++c)
     4a4:	54d2                	lw	s1,52(sp)
     4a6:	4401                	li	s0,0
    {
        if (accumulators[c].count == 0) continue;
     4a8:	409c                	lw	a5,0(s1)
     4aa:	c002                	sw	zero,0(sp)
        double mean = accumulators[c].mean;
        double variance = (accumulators[c].count > 1) ? (accumulators[c].M2 / (accumulators[c].count)) : 0.0;
     4ac:	4705                	li	a4,1
     4ae:	853e                	mv	a0,a5
        if (accumulators[c].count == 0) continue;
     4b0:	c3ad                	beqz	a5,512 <main+0x302>
        double mean = accumulators[c].mean;
     4b2:	4490                	lw	a2,8(s1)
     4b4:	44d4                	lw	a3,12(s1)
     4b6:	c232                	sw	a2,4(sp)
     4b8:	c436                	sw	a3,8(sp)
        double variance = (accumulators[c].count > 1) ? (accumulators[c].M2 / (accumulators[c].count)) : 0.0;
     4ba:	02e78e63          	beq	a5,a4,4f6 <main+0x2e6>
     4be:	ca3e                	sw	a5,20(sp)
     4c0:	131030ef          	jal	3df0 <__floatunsidf>
     4c4:	862a                	mv	a2,a0
     4c6:	86ae                	mv	a3,a1
     4c8:	4888                	lw	a0,16(s1)
     4ca:	48cc                	lw	a1,20(s1)
     4cc:	5d0020ef          	jal	2a9c <__divdf3>
        double stddev = (variance > 0.0) ? sqrt(variance) : 0.0;
     4d0:	4601                	li	a2,0
     4d2:	4681                	li	a3,0
        double variance = (accumulators[c].count > 1) ? (accumulators[c].M2 / (accumulators[c].count)) : 0.0;
     4d4:	c82e                	sw	a1,16(sp)
     4d6:	c62a                	sw	a0,12(sp)
        double stddev = (variance > 0.0) ? sqrt(variance) : 0.0;
     4d8:	3ab020ef          	jal	3082 <__gedf2>
     4dc:	872a                	mv	a4,a0
     4de:	45c2                	lw	a1,16(sp)
     4e0:	4532                	lw	a0,12(sp)
     4e2:	47d2                	lw	a5,20(sp)
     4e4:	00e05963          	blez	a4,4f6 <main+0x2e6>
     4e8:	c63e                	sw	a5,12(sp)
     4ea:	5d9010ef          	jal	22c2 <sqrt>
        PRINTF("%d,%u,%d,%d\n", c, accumulators[c].count, (int) mean, (int) stddev);
     4ee:	0a1030ef          	jal	3d8e <__fixdfsi>
     4f2:	47b2                	lw	a5,12(sp)
     4f4:	c02a                	sw	a0,0(sp)
     4f6:	45a2                	lw	a1,8(sp)
     4f8:	4512                	lw	a0,4(sp)
     4fa:	c63e                	sw	a5,12(sp)
     4fc:	093030ef          	jal	3d8e <__fixdfsi>
     500:	4702                	lw	a4,0(sp)
     502:	4632                	lw	a2,12(sp)
     504:	86aa                	mv	a3,a0
     506:	6529                	lui	a0,0xa
     508:	85a2                	mv	a1,s0
     50a:	73050513          	addi	a0,a0,1840 # a730 <__clz_tab+0x154>
     50e:	40e010ef          	jal	191c <iprintf>
    for (int c = 0; c < NB_CLASSES; ++c)
     512:	0405                	addi	s0,s0,1
     514:	47a9                	li	a5,10
     516:	04e1                	addi	s1,s1,24
     518:	f8f418e3          	bne	s0,a5,4a8 <main+0x298>
    }

    return 0;
}
     51c:	15412083          	lw	ra,340(sp)
     520:	15012403          	lw	s0,336(sp)
     524:	14c12483          	lw	s1,332(sp)
     528:	4501                	li	a0,0
     52a:	15810113          	addi	sp,sp,344
     52e:	8082                	ret
            PRINTF("Seed %d has invalid class %d\n", seed, cls);
     530:	4582                	lw	a1,0(sp)
     532:	6529                	lui	a0,0xa
     534:	8622                	mv	a2,s0
     536:	6dc50513          	addi	a0,a0,1756 # a6dc <__clz_tab+0x100>
     53a:	3e2010ef          	jal	191c <iprintf>
            continue;
     53e:	4392                	lw	t2,4(sp)
     540:	b7a1                	j	488 <main+0x278>

00000542 <__no_irq_handler>:
	This will not print an error message in case of not finding
	the proper handler to manage an interrupt.
	la a0, no_exception_handler_msg
	jal ra, puts
	*/
	j __no_irq_handler
     542:	0000006f          	j	542 <__no_irq_handler>

00000546 <fic_irq_dma_window>:
/*                           EXPORTED FUNCTIONS                             */
/**                                                                        **/
/****************************************************************************/

void fic_irq_dma_window(void)
{
     546:	1151                	addi	sp,sp,-12
     548:	c406                	sw	ra,8(sp)
     54a:	c222                	sw	s0,4(sp)
     54c:	0060                	addi	s0,sp,12
     * Find out which channel raised the interrupt and call
     * either the weak implementation provided in this module,
     * or the non-weak implementation.
     */

    for (int i = 0; i < DMA_CH_NUM; i++)
     54e:	fe042a23          	sw	zero,-12(s0)
     552:	a815                	j	586 <fic_irq_dma_window+0x40>
    {
        if (dma_subsys_per[i].peri->WINDOW_IFR == 1)
     554:	97018693          	addi	a3,gp,-1680 # b394 <dma_subsys_per>
     558:	ff442703          	lw	a4,-12(s0)
     55c:	87ba                	mv	a5,a4
     55e:	0786                	slli	a5,a5,0x1
     560:	97ba                	add	a5,a5,a4
     562:	078a                	slli	a5,a5,0x2
     564:	97b6                	add	a5,a5,a3
     566:	479c                	lw	a5,8(a5)
     568:	57b8                	lw	a4,104(a5)
     56a:	4785                	li	a5,1
     56c:	00f71863          	bne	a4,a5,57c <fic_irq_dma_window+0x36>
        {
            dma_intr_handler_window_done(i);
     570:	ff442783          	lw	a5,-12(s0)
     574:	0ff7f793          	zext.b	a5,a5
     578:	853e                	mv	a0,a5
     57a:	2071                	jal	606 <dma_intr_handler_trans_done>
    for (int i = 0; i < DMA_CH_NUM; i++)
     57c:	ff442783          	lw	a5,-12(s0)
     580:	0785                	addi	a5,a5,1
     582:	fef42a23          	sw	a5,-12(s0)
     586:	ff442703          	lw	a4,-12(s0)
     58a:	478d                	li	a5,3
     58c:	fce7d4e3          	bge	a5,a4,554 <fic_irq_dma_window+0xe>
            #endif

            #endif
        }
    }
    return;
     590:	0001                	nop
}
     592:	40a2                	lw	ra,8(sp)
     594:	4412                	lw	s0,4(sp)
     596:	0131                	addi	sp,sp,12
     598:	8082                	ret

0000059a <fic_irq_dma_done>:

void fic_irq_dma_done(void)
{
     59a:	1151                	addi	sp,sp,-12
     59c:	c406                	sw	ra,8(sp)
     59e:	c222                	sw	s0,4(sp)
     5a0:	0060                	addi	s0,sp,12
     * Find out which channel raised the interrupt and call
     * either the weak implementation provided in this module,
     * or the non-weak implementation.
     */
    
    for (int i = 0; i < DMA_CH_NUM; i++)
     5a2:	fe042a23          	sw	zero,-12(s0)
     5a6:	a0b1                	j	5f2 <fic_irq_dma_done+0x58>
    {
        if (dma_subsys_per[i].peri->TRANSACTION_IFR == 1)
     5a8:	97018693          	addi	a3,gp,-1680 # b394 <dma_subsys_per>
     5ac:	ff442703          	lw	a4,-12(s0)
     5b0:	87ba                	mv	a5,a4
     5b2:	0786                	slli	a5,a5,0x1
     5b4:	97ba                	add	a5,a5,a4
     5b6:	078a                	slli	a5,a5,0x2
     5b8:	97b6                	add	a5,a5,a3
     5ba:	479c                	lw	a5,8(a5)
     5bc:	53f8                	lw	a4,100(a5)
     5be:	4785                	li	a5,1
     5c0:	02f71463          	bne	a4,a5,5e8 <fic_irq_dma_done+0x4e>
        {
            dma_subsys_per[i].intrFlag = 1;
     5c4:	97018693          	addi	a3,gp,-1680 # b394 <dma_subsys_per>
     5c8:	ff442703          	lw	a4,-12(s0)
     5cc:	87ba                	mv	a5,a4
     5ce:	0786                	slli	a5,a5,0x1
     5d0:	97ba                	add	a5,a5,a4
     5d2:	078a                	slli	a5,a5,0x2
     5d4:	97b6                	add	a5,a5,a3
     5d6:	4705                	li	a4,1
     5d8:	00e78223          	sb	a4,4(a5)
            dma_intr_handler_trans_done(i);
     5dc:	ff442783          	lw	a5,-12(s0)
     5e0:	0ff7f793          	zext.b	a5,a5
     5e4:	853e                	mv	a0,a5
     5e6:	2005                	jal	606 <dma_intr_handler_trans_done>
    for (int i = 0; i < DMA_CH_NUM; i++)
     5e8:	ff442783          	lw	a5,-12(s0)
     5ec:	0785                	addi	a5,a5,1
     5ee:	fef42a23          	sw	a5,-12(s0)
     5f2:	ff442703          	lw	a4,-12(s0)
     5f6:	478d                	li	a5,3
     5f8:	fae7d8e3          	bge	a5,a4,5a8 <fic_irq_dma_done+0xe>
            #endif

            #endif
        }
    }
    return;
     5fc:	0001                	nop
}
     5fe:	40a2                	lw	ra,8(sp)
     600:	4412                	lw	s0,4(sp)
     602:	0131                	addi	sp,sp,12
     604:	8082                	ret

00000606 <dma_intr_handler_trans_done>:
    dma_subsys_per[channel].peri->MODE = DMA_TRANS_MODE_SINGLE;
}


__attribute__((weak, optimize("O0"))) void dma_intr_handler_trans_done(uint8_t channel)
{
     606:	1151                	addi	sp,sp,-12
     608:	c406                	sw	ra,8(sp)
     60a:	c222                	sw	s0,4(sp)
     60c:	0060                	addi	s0,sp,12
     60e:	87aa                	mv	a5,a0
     610:	fef40ba3          	sb	a5,-9(s0)
     * This is a weak implementation.
     * Create your own function called
     * void dma_intr_handler_trans_done()
     * to override this one.
     */
}
     614:	0001                	nop
     616:	40a2                	lw	ra,8(sp)
     618:	4412                	lw	s0,4(sp)
     61a:	0131                	addi	sp,sp,12
     61c:	8082                	ret

0000061e <fic_irq_timer_1>:
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    return kFastIntrCtrlOk_e;
}

__attribute__((weak, optimize("O0"))) void fic_irq_timer_1(void)
{
     61e:	1161                	addi	sp,sp,-8
     620:	c206                	sw	ra,4(sp)
     622:	c022                	sw	s0,0(sp)
     624:	0020                	addi	s0,sp,8
    /* Users should implement their non-weak version */
}
     626:	0001                	nop
     628:	4092                	lw	ra,4(sp)
     62a:	4402                	lw	s0,0(sp)
     62c:	0121                	addi	sp,sp,8
     62e:	8082                	ret

00000630 <_write>:
    return -1;
}

int _write(int file, const void *ptr, int len)
{
    if (file != STDOUT_FILENO) {
     630:	4785                	li	a5,1
     632:	04f51c63          	bne	a0,a5,68a <_write+0x5a>
 * @param offset the offset to read at, in bytes.
 * @return the read value.
 */
MMIO_WARN_UNUSED_RESULT
static inline uint32_t mmio_region_read32(mmio_region_t base, ptrdiff_t offset) {
  return ((volatile uint32_t *)base.base)[offset / sizeof(uint32_t)];
     636:	200007b7          	lui	a5,0x20000
     63a:	4fdc                	lw	a5,28(a5)
system_error_t uart_init(const uart_t *uart) {
  if (uart == NULL) {
    return kErrorUartInvalidArgument;
  }

  if (uart->baudrate == 0 || uart->clk_freq_hz == 0) {
     63c:	c7b9                	beqz	a5,68a <_write+0x5a>
 * @param offset the offset to write at, in bytes.
 * @param value the value to write.
 */
static inline void mmio_region_write32(mmio_region_t base, ptrdiff_t offset,
                                uint32_t value) {
  ((volatile uint32_t *)base.base)[offset / sizeof(uint32_t)] = value;
     63e:	30080737          	lui	a4,0x30080
     642:	00072623          	sw	zero,12(a4) # 3008000c <_sp+0x30073a3c>
     646:	478d                	li	a5,3
     648:	cf5c                	sw	a5,28(a4)
     64a:	02072223          	sw	zero,36(a4)
     64e:	02072623          	sw	zero,44(a4)
     652:	00072223          	sw	zero,4(a4)
     656:	56fd                	li	a3,-1
     658:	0a7c07b7          	lui	a5,0xa7c0
     65c:	c314                	sw	a3,0(a4)
     65e:	078d                	addi	a5,a5,3 # a7c0003 <_sp+0xa7b3a33>
     660:	c75c                	sw	a5,12(a4)
     662:	00072223          	sw	zero,4(a4)
/**
 * Write `len` bytes to the UART TX FIFO.
 */
size_t uart_write(const uart_t *uart, const uint8_t *data, size_t len) {
  size_t total = len;
  while (len) {
     666:	c205                	beqz	a2,686 <_write+0x56>
     668:	00c58333          	add	t1,a1,a2
    uart_putchar(uart, *data);
     66c:	0005c683          	lbu	a3,0(a1)
  return ((volatile uint32_t *)base.base)[offset / sizeof(uint32_t)];
     670:	4b1c                	lw	a5,16(a4)
  while (uart_tx_full(uart)) {
     672:	8b85                	andi	a5,a5,1
     674:	fff5                	bnez	a5,670 <_write+0x40>
  ((volatile uint32_t *)base.base)[offset / sizeof(uint32_t)] = value;
     676:	cf14                	sw	a3,24(a4)
  return ((volatile uint32_t *)base.base)[offset / sizeof(uint32_t)];
     678:	4b1c                	lw	a5,16(a4)
 * @return Zero-extended `field` from `bitfield`.
 */
BITFIELD_WARN_UNUSED_RESULT
static inline uint32_t bitfield_field32_read(uint32_t bitfield,
                                      bitfield_field32_t field) {
  return (bitfield >> field.index) & field.mask;
     67a:	838d                	srli	a5,a5,0x3
  while (!uart_tx_idle(uart)) {
     67c:	8b85                	andi	a5,a5,1
     67e:	dfed                	beqz	a5,678 <_write+0x48>
    data++;
     680:	0585                	addi	a1,a1,1
  while (len) {
     682:	feb315e3          	bne	t1,a1,66c <_write+0x3c>
        errno = ENOSYS;
        return -1;
    }
    return uart_write(&uart,(uint8_t *)ptr,len);

}
     686:	8532                	mv	a0,a2
     688:	8082                	ret
        errno = ENOSYS;
     68a:	05800713          	li	a4,88
        return -1;
     68e:	567d                	li	a2,-1
        errno = ENOSYS;
     690:	94e1a823          	sw	a4,-1712(gp) # b374 <errno>
}
     694:	8532                	mv	a0,a2
     696:	8082                	ret

00000698 <spi_event_handler>:
    peri->txn       = (spi_transaction_t) {0};
    peri->callbacks = NULL_CALLBACKS;
}

void spi_event_handler(spi_peripheral_t* peri, spi_event_e events) 
{
     698:	1151                	addi	sp,sp,-12
     69a:	c406                	sw	ra,8(sp)
    // Ready means it is ready to accept new command segments. So we have two
    // possibilities if the device is ready:
    //  1) It is ready but not idle
    //  2) It is ready and idle
    if (events & SPI_EVENT_READY) 
     69c:	0105f693          	andi	a3,a1,16
{
     6a0:	872e                	mv	a4,a1
     6a2:	87aa                	mv	a5,a0
    if (events & SPI_EVENT_READY) 
     6a4:	ca99                	beqz	a3,6ba <spi_event_handler+0x22>
    {
        // If SPI is ready and there are still commands to execute, issue next command
        if (peri->txn.segments != NULL && peri->scnt < peri->txn.seglen) 
     6a6:	4950                	lw	a2,20(a0)
     6a8:	c611                	beqz	a2,6b4 <spi_event_handler+0x1c>
     6aa:	554c                	lw	a1,44(a0)
     6ac:	01854683          	lbu	a3,24(a0)
     6b0:	14d5e363          	bltu	a1,a3,7f6 <spi_event_handler+0x15e>
        {
            spi_issue_next_seg(peri);
        }
        // If no more commands and SPI is idle, it means the transaction is over
        else if (events & SPI_EVENT_IDLE) 
     6b4:	02077693          	andi	a3,a4,32
     6b8:	e6cd                	bnez	a3,762 <spi_event_handler+0xca>
            // Reset all transaction related variables
            spi_reset_transaction(peri);
            return;
        }
    }
    if (events & SPI_EVENT_TXWM)
     6ba:	00877693          	andi	a3,a4,8
     6be:	ca81                	beqz	a3,6ce <spi_event_handler+0x36>
    if (peri->txn.txbuffer != NULL && peri->txcnt < peri->txn.txlen) {
     6c0:	4fc8                	lw	a0,28(a5)
     6c2:	c511                	beqz	a0,6ce <spi_event_handler+0x36>
     6c4:	5b8c                	lw	a1,48(a5)
     6c6:	0207a283          	lw	t0,32(a5)
     6ca:	0055ee63          	bltu	a1,t0,6e6 <spi_event_handler+0x4e>
        {
            peri->callbacks.txwm_cb(peri->txn.txbuffer, peri->txcnt, 
                                    peri->txn.rxbuffer, peri->rxcnt);
        }
    }
    if (events & SPI_EVENT_RXWM)
     6ce:	8b11                	andi	a4,a4,4
     6d0:	cb01                	beqz	a4,6e0 <spi_event_handler+0x48>
    if (peri->txn.rxbuffer != NULL && peri->rxcnt < peri->txn.rxlen) {
     6d2:	53d0                	lw	a2,36(a5)
     6d4:	c611                	beqz	a2,6e0 <spi_event_handler+0x48>
     6d6:	5bd4                	lw	a3,52(a5)
     6d8:	578c                	lw	a1,40(a5)
     6da:	8736                	mv	a4,a3
     6dc:	04b6e863          	bltu	a3,a1,72c <spi_event_handler+0x94>
        {
            peri->callbacks.rxwm_cb(peri->txn.txbuffer, peri->txcnt, 
                                    peri->txn.rxbuffer, peri->rxcnt);
        }
    }
}
     6e0:	40a2                	lw	ra,8(sp)
     6e2:	0131                	addi	sp,sp,12
     6e4:	8082                	ret
            && !spi_write_word(peri->instance, peri->txn.txbuffer[peri->txcnt])
     6e6:	0007a303          	lw	t1,0(a5)
     6ea:	02030563          	beqz	t1,714 <spi_event_handler+0x7c>
     6ee:	20a5c633          	sh2add	a2,a1,a0

spi_return_flags_e spi_write_word(spi_host_t* spi, uint32_t wdata)
{
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
    // Check we're not overflowing
    if (spi_get_tx_queue_depth(spi) >= SPI_HOST_PARAM_TX_DEPTH) 
     6f2:	04700393          	li	t2,71
     6f6:	a809                	j	708 <spi_event_handler+0x70>
     6f8:	4214                	lw	a3,0(a2)
        ) peri->txcnt++; // Keep track of counter
     6fa:	0585                	addi	a1,a1,1
            && !spi_write_word(peri->instance, peri->txn.txbuffer[peri->txcnt])
     6fc:	0611                	addi	a2,a2,4
        return SPI_FLAG_TX_QUEUE_FULL;
    SPI_HW(spi)->TXDATA = wdata;
     6fe:	02d32623          	sw	a3,44(t1)
        ) peri->txcnt++; // Keep track of counter
     702:	db8c                	sw	a1,48(a5)
            && !spi_write_word(peri->instance, peri->txn.txbuffer[peri->txcnt])
     704:	00b28863          	beq	t0,a1,714 <spi_event_handler+0x7c>
 */
static inline __attribute__((always_inline)) 
const volatile spi_status_t spi_get_status(spi_host_t* spi)
{
    spi_status_t status;
    status.value = SPI_HW(spi)->STATUS; // Assuming SPI_HW(spi)->STATUS returns a uint32_t value representing the status
     708:	01432683          	lw	a3,20(t1)
    if (spi_get_tx_queue_depth(spi) >= SPI_HOST_PARAM_TX_DEPTH) 
     70c:	0ff6f693          	zext.b	a3,a3
     710:	fed3f4e3          	bgeu	t2,a3,6f8 <spi_event_handler+0x60>
        if (spi_fill_tx(peri) && peri->callbacks.txwm_cb != NULL)
     714:	03c7a303          	lw	t1,60(a5)
     718:	fa030be3          	beqz	t1,6ce <spi_event_handler+0x36>
            peri->callbacks.txwm_cb(peri->txn.txbuffer, peri->txcnt, 
     71c:	5bd4                	lw	a3,52(a5)
     71e:	53d0                	lw	a2,36(a5)
     720:	c23a                	sw	a4,4(sp)
     722:	c03e                	sw	a5,0(sp)
     724:	9302                	jalr	t1
     726:	4712                	lw	a4,4(sp)
     728:	4782                	lw	a5,0(sp)
     72a:	b755                	j	6ce <spi_event_handler+0x36>
            && !spi_read_word(peri->instance, &peri->txn.rxbuffer[peri->rxcnt])
     72c:	4388                	lw	a0,0(a5)
     72e:	ed01                	bnez	a0,746 <spi_event_handler+0xae>
     730:	a015                	j	754 <spi_event_handler+0xbc>
spi_return_flags_e spi_read_word(spi_host_t* spi, uint32_t* dst)
{
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
    // Check we're not underflowing
    if (spi_get_rx_queue_depth(spi) == 0) return SPI_FLAG_RX_QUEUE_EMPTY;
    *dst = SPI_HW(spi)->RXDATA;
     732:	5514                	lw	a3,40(a0)
     734:	c314                	sw	a3,0(a4)
        ) peri->rxcnt++; // Keep track of counter
     736:	5bd4                	lw	a3,52(a5)
            && !spi_read_word(peri->instance, &peri->txn.rxbuffer[peri->rxcnt])
     738:	578c                	lw	a1,40(a5)
        ) peri->rxcnt++; // Keep track of counter
     73a:	00168713          	addi	a4,a3,1
     73e:	dbd8                	sw	a4,52(a5)
     740:	86ba                	mv	a3,a4
            && !spi_read_word(peri->instance, &peri->txn.rxbuffer[peri->rxcnt])
     742:	00b77963          	bgeu	a4,a1,754 <spi_event_handler+0xbc>
     746:	494c                	lw	a1,20(a0)
     748:	20c74733          	sh2add	a4,a4,a2
    if (spi_get_rx_queue_depth(spi) == 0) return SPI_FLAG_RX_QUEUE_EMPTY;
     74c:	81a1                	srli	a1,a1,0x8
     74e:	0ff5f593          	zext.b	a1,a1
     752:	f1e5                	bnez	a1,732 <spi_event_handler+0x9a>
        if (spi_empty_rx(peri) && peri->callbacks.rxwm_cb != NULL)
     754:	43b8                	lw	a4,64(a5)
     756:	d749                	beqz	a4,6e0 <spi_event_handler+0x48>
}
     758:	40a2                	lw	ra,8(sp)
            peri->callbacks.rxwm_cb(peri->txn.txbuffer, peri->txcnt, 
     75a:	5b8c                	lw	a1,48(a5)
     75c:	4fc8                	lw	a0,28(a5)
}
     75e:	0131                	addi	sp,sp,12
            peri->callbacks.rxwm_cb(peri->txn.txbuffer, peri->txcnt, 
     760:	8702                	jr	a4
            spi_set_events_enabled(peri->instance, SPI_EVENT_ALL, false);
     762:	438c                	lw	a1,0(a5)
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
     764:	cded                	beqz	a1,85e <__heap_size+0x5e>
    else        SPI_HW(spi)->EVENT_ENABLE &= ~events;
     766:	5d98                	lw	a4,56(a1)
    if (peri->txn.rxbuffer != NULL && peri->rxcnt < peri->txn.rxlen) {
     768:	53d0                	lw	a2,36(a5)
     76a:	fc077713          	andi	a4,a4,-64
     76e:	dd98                	sw	a4,56(a1)
}

spi_return_flags_e spi_enable_evt_intr(spi_host_t* spi, bool enable)
{
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
    SPI_HW(spi)->INTR_ENABLE = bitfield_write(SPI_HW(spi)->INTR_ENABLE, BIT_MASK_1, 
     770:	41d8                	lw	a4,4(a1)
static inline uint32_t bitfield_write(uint32_t bitfield,
                                       uint32_t mask, 
                                       uint32_t index,
                                       uint32_t value) 
{
  bitfield &= ~(mask << index);
     772:	9b75                	andi	a4,a4,-3
     774:	c1d8                	sw	a4,4(a1)
     776:	ca1d                	beqz	a2,7ac <spi_event_handler+0x114>
     778:	5bd8                	lw	a4,52(a5)
     77a:	5794                	lw	a3,40(a5)
     77c:	02d77863          	bgeu	a4,a3,7ac <spi_event_handler+0x114>
     780:	49d4                	lw	a3,20(a1)
    if (spi_get_rx_queue_depth(spi) == 0) return SPI_FLAG_RX_QUEUE_EMPTY;
     782:	82a1                	srli	a3,a3,0x8
     784:	0ff6f693          	zext.b	a3,a3
     788:	c295                	beqz	a3,7ac <spi_event_handler+0x114>
            && !spi_read_word(peri->instance, &peri->txn.rxbuffer[peri->rxcnt])
     78a:	20c74733          	sh2add	a4,a4,a2
    *dst = SPI_HW(spi)->RXDATA;
     78e:	5594                	lw	a3,40(a1)
     790:	c314                	sw	a3,0(a4)
        ) peri->rxcnt++; // Keep track of counter
     792:	5bd8                	lw	a4,52(a5)
            && !spi_read_word(peri->instance, &peri->txn.rxbuffer[peri->rxcnt])
     794:	5794                	lw	a3,40(a5)
        ) peri->rxcnt++; // Keep track of counter
     796:	0705                	addi	a4,a4,1
     798:	dbd8                	sw	a4,52(a5)
            && !spi_read_word(peri->instance, &peri->txn.rxbuffer[peri->rxcnt])
     79a:	00d77963          	bgeu	a4,a3,7ac <spi_event_handler+0x114>
     79e:	49d4                	lw	a3,20(a1)
     7a0:	20c74733          	sh2add	a4,a4,a2
    if (spi_get_rx_queue_depth(spi) == 0) return SPI_FLAG_RX_QUEUE_EMPTY;
     7a4:	82a1                	srli	a3,a3,0x8
     7a6:	0ff6f693          	zext.b	a3,a3
     7aa:	f2f5                	bnez	a3,78e <spi_event_handler+0xf6>
            if (peri->callbacks.done_cb != NULL) 
     7ac:	5f98                	lw	a4,56(a5)
            peri->state = SPI_STATE_DONE;
     7ae:	4691                	li	a3,4
     7b0:	cb94                	sw	a3,16(a5)
            if (peri->callbacks.done_cb != NULL) 
     7b2:	c719                	beqz	a4,7c0 <spi_event_handler+0x128>
                peri->callbacks.done_cb(peri->txn.txbuffer, peri->txcnt, 
     7b4:	5bd4                	lw	a3,52(a5)
     7b6:	5b8c                	lw	a1,48(a5)
     7b8:	4fc8                	lw	a0,28(a5)
     7ba:	c03e                	sw	a5,0(sp)
     7bc:	9702                	jalr	a4
     7be:	4782                	lw	a5,0(sp)
    peri->scnt      = 0;
     7c0:	0207a623          	sw	zero,44(a5)
    peri->txcnt     = 0;
     7c4:	0207a823          	sw	zero,48(a5)
    peri->rxcnt     = 0;
     7c8:	0207aa23          	sw	zero,52(a5)
    peri->txn       = (spi_transaction_t) {0};
     7cc:	0007aa23          	sw	zero,20(a5)
     7d0:	0007ac23          	sw	zero,24(a5)
     7d4:	0007ae23          	sw	zero,28(a5)
     7d8:	0207a023          	sw	zero,32(a5)
     7dc:	0207a223          	sw	zero,36(a5)
     7e0:	0207a423          	sw	zero,40(a5)
    peri->callbacks = NULL_CALLBACKS;
     7e4:	0207ac23          	sw	zero,56(a5)
     7e8:	0207ae23          	sw	zero,60(a5)
     7ec:	0407a023          	sw	zero,64(a5)
     7f0:	0407a223          	sw	zero,68(a5)
            return;
     7f4:	b5f5                	j	6e0 <spi_event_handler+0x48>
    const spi_segment_t seg = peri->txn.segments[peri->scnt];
     7f6:	20c5c633          	sh2add	a2,a1,a2
     7fa:	4210                	lw	a2,0(a2)
    spi_set_command(peri->instance, cmd_reg);
     7fc:	4108                	lw	a0,0(a0)
    peri->scnt++;
     7fe:	0585                	addi	a1,a1,1
    const spi_segment_t seg = peri->txn.segments[peri->scnt];
     800:	01000337          	lui	t1,0x1000
     804:	01865293          	srli	t0,a2,0x18
     808:	137d                	addi	t1,t1,-1 # ffffff <_sp+0xff3a2f>
    peri->scnt++;
     80a:	d7cc                	sw	a1,44(a5)
    const spi_segment_t seg = peri->txn.segments[peri->scnt];
     80c:	00f2f293          	andi	t0,t0,15
     810:	00667633          	and	a2,a2,t1
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
     814:	ea0503e3          	beqz	a0,6ba <spi_event_handler+0x22>
        .csaat     = peri->txn.seglen == peri->scnt ? false : true,
     818:	8e8d                	sub	a3,a3,a1
  return (bitfield >> index) & mask;
     81a:	0022d593          	srli	a1,t0,0x2
                             SPI_HOST_COMMAND_LEN_OFFSET, command.len);
    cmd_reg = bitfield_write(cmd_reg, BIT_MASK_1, 
                             SPI_HOST_COMMAND_CSAAT_BIT, command.csaat);
    cmd_reg = bitfield_write(cmd_reg, SPI_HOST_COMMAND_SPEED_MASK, 
                             SPI_HOST_COMMAND_SPEED_OFFSET, command.speed);
    cmd_reg = bitfield_write(cmd_reg, SPI_HOST_COMMAND_DIRECTION_MASK, 
     81e:	0032f293          	andi	t0,t0,3
     822:	00d036b3          	snez	a3,a3
  bitfield |= (value & mask) << index;
     826:	05e6                	slli	a1,a1,0x19
     828:	02ee                	slli	t0,t0,0x1b
     82a:	0055e5b3          	or	a1,a1,t0
     82e:	06e2                	slli	a3,a3,0x18
        .len       = seg.len - 1, // -1 because of SPI Host IP specifications
     830:	167d                	addi	a2,a2,-1
    cmd_reg = bitfield_write(cmd_reg, SPI_HOST_COMMAND_LEN_MASK, 
     832:	00667633          	and	a2,a2,t1
     836:	8ecd                	or	a3,a3,a1
     838:	8ed1                	or	a3,a3,a2
  return (bitfield >> index) & mask;
     83a:	0196d613          	srli	a2,a3,0x19
     83e:	8a0d                	andi	a2,a2,3
    if (speed > SPI_SPEED_QUAD || direction > SPI_DIR_BIDIR || 
     840:	458d                	li	a1,3
     842:	00b60c63          	beq	a2,a1,85a <__heap_size+0x5a>
     846:	01b6d593          	srli	a1,a3,0x1b
       (direction == SPI_DIR_BIDIR && speed != SPI_SPEED_STANDARD))
     84a:	15f5                	addi	a1,a1,-3
    if (speed > SPI_SPEED_QUAD || direction > SPI_DIR_BIDIR || 
     84c:	e191                	bnez	a1,850 <__heap_size+0x50>
     84e:	e611                	bnez	a2,85a <__heap_size+0x5a>
    status.value = SPI_HW(spi)->STATUS; // Assuming SPI_HW(spi)->STATUS returns a uint32_t value representing the status
     850:	4950                	lw	a2,20(a0)
    return spi_get_status(spi).ready ? SPI_TRISTATE_TRUE : SPI_TRISTATE_FALSE;
     852:	e60654e3          	bgez	a2,6ba <spi_event_handler+0x22>
    SPI_HW(spi)->COMMAND = cmd_reg;
     856:	d154                	sw	a3,36(a0)
    return SPI_FLAG_OK;
     858:	b58d                	j	6ba <spi_event_handler+0x22>
    status.value = SPI_HW(spi)->STATUS; // Assuming SPI_HW(spi)->STATUS returns a uint32_t value representing the status
     85a:	4954                	lw	a3,20(a0)
     85c:	bdb9                	j	6ba <spi_event_handler+0x22>
    if (peri->txn.rxbuffer != NULL && peri->rxcnt < peri->txn.rxlen) {
     85e:	53d0                	lw	a2,36(a5)
     860:	b7b1                	j	7ac <spi_event_handler+0x114>

00000862 <spi_error_handler.isra.0>:

void spi_error_handler(spi_peripheral_t* peri, spi_error_e error) 
{
    // Disable event interrupts
    spi_set_events_enabled(peri->instance, SPI_EVENT_ALL, false);
     862:	4114                	lw	a3,0(a0)
void spi_error_handler(spi_peripheral_t* peri, spi_error_e error) 
     864:	1151                	addi	sp,sp,-12
     866:	c226                	sw	s1,4(sp)
     868:	c406                	sw	ra,8(sp)
     86a:	84aa                	mv	s1,a0
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
     86c:	ca81                	beqz	a3,87c <spi_error_handler.isra.0+0x1a>
    else        SPI_HW(spi)->EVENT_ENABLE &= ~events;
     86e:	5e9c                	lw	a5,56(a3)
     870:	fc07f793          	andi	a5,a5,-64
     874:	de9c                	sw	a5,56(a3)
    SPI_HW(spi)->INTR_ENABLE = bitfield_write(SPI_HW(spi)->INTR_ENABLE, BIT_MASK_1, 
     876:	42dc                	lw	a5,4(a3)
  bitfield &= ~(mask << index);
     878:	9bf5                	andi	a5,a5,-3
     87a:	c2dc                	sw	a5,4(a3)
    spi_enable_evt_intr   (peri->instance, false);
    // If there is a callback defined invoke it
    if (peri->callbacks.error_cb != NULL) 
     87c:	40fc                	lw	a5,68(s1)
     87e:	c799                	beqz	a5,88c <spi_error_handler.isra.0+0x2a>
    {
        peri->callbacks.error_cb(peri->txn.txbuffer, peri->txcnt, 
     880:	58d4                	lw	a3,52(s1)
     882:	50d0                	lw	a2,36(s1)
     884:	588c                	lw	a1,48(s1)
     886:	4cc8                	lw	a0,28(s1)
     888:	9782                	jalr	a5
    spi_sw_reset(peri->instance);
     88a:	4094                	lw	a3,0(s1)
    peri->scnt      = 0;
     88c:	0204a623          	sw	zero,44(s1)
    peri->txcnt     = 0;
     890:	0204a823          	sw	zero,48(s1)
    peri->rxcnt     = 0;
     894:	0204aa23          	sw	zero,52(s1)
    peri->txn       = (spi_transaction_t) {0};
     898:	0004aa23          	sw	zero,20(s1)
     89c:	0004ac23          	sw	zero,24(s1)
     8a0:	0004ae23          	sw	zero,28(s1)
     8a4:	0204a023          	sw	zero,32(s1)
     8a8:	0204a223          	sw	zero,36(s1)
     8ac:	0204a423          	sw	zero,40(s1)
    peri->callbacks = NULL_CALLBACKS;
     8b0:	0204ac23          	sw	zero,56(s1)
     8b4:	0204ae23          	sw	zero,60(s1)
     8b8:	0404a023          	sw	zero,64(s1)
     8bc:	0404a223          	sw	zero,68(s1)
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
     8c0:	c6c1                	beqz	a3,948 <spi_error_handler.isra.0+0xe6>
    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, BIT_MASK_1, 
     8c2:	4a9c                	lw	a5,16(a3)
  bitfield |= (value & mask) << index;
     8c4:	40000737          	lui	a4,0x40000
     8c8:	8fd9                	or	a5,a5,a4
     8ca:	ca9c                	sw	a5,16(a3)
     8cc:	4adc                	lw	a5,20(a3)
     8ce:	c03e                	sw	a5,0(sp)
    while (status.active || status.txqd || status.rxqd);
     8d0:	4782                	lw	a5,0(sp)
     8d2:	00179713          	slli	a4,a5,0x1
     8d6:	fe074de3          	bltz	a4,8d0 <spi_error_handler.isra.0+0x6e>
     8da:	00014783          	lbu	a5,0(sp)
     8de:	fbed                	bnez	a5,8d0 <spi_error_handler.isra.0+0x6e>
     8e0:	00114783          	lbu	a5,1(sp)
     8e4:	f7f5                	bnez	a5,8d0 <spi_error_handler.isra.0+0x6e>
    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, BIT_MASK_1, 
     8e6:	4a9c                	lw	a5,16(a3)
  bitfield &= ~(mask << index);
     8e8:	c0000737          	lui	a4,0xc0000
     8ec:	177d                	addi	a4,a4,-1 # bfffffff <_sp+0xbfff3a2f>
     8ee:	8ff9                	and	a5,a5,a4
     8f0:	ca9c                	sw	a5,16(a3)
    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, BIT_MASK_1, 
     8f2:	4a9c                	lw	a5,16(a3)
  bitfield |= (value & mask) << index;
     8f4:	80000637          	lui	a2,0x80000
     8f8:	20000737          	lui	a4,0x20000
     8fc:	8fd1                	or	a5,a5,a2
     8fe:	ca9c                	sw	a5,16(a3)
}

spi_return_flags_e spi_output_enable(spi_host_t* spi, bool enable)
{
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, BIT_MASK_1, 
     900:	4a9c                	lw	a5,16(a3)
    if (watermark > SPI_HOST_PARAM_TX_DEPTH) return SPI_FLAG_WATERMARK_EXCEEDS;
     902:	04800613          	li	a2,72
     906:	8fd9                	or	a5,a5,a4
    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, BIT_MASK_1, 
     908:	ca9c                	sw	a5,16(a3)
    if (enable) SPI_HW(spi)->ERROR_ENABLE |= errors;
     90a:	5a9c                	lw	a5,48(a3)
     90c:	01f7e793          	ori	a5,a5,31
     910:	da9c                	sw	a5,48(a3)
    SPI_HW(spi)->INTR_ENABLE = bitfield_write(SPI_HW(spi)->INTR_ENABLE, BIT_MASK_1, 
     912:	42dc                	lw	a5,4(a3)
     914:	0017e793          	ori	a5,a5,1
     918:	c2dc                	sw	a5,4(a3)
    spi_set_tx_watermark(peri->instance, peri->txwm);
     91a:	0044c783          	lbu	a5,4(s1)
    spi_set_rx_watermark(peri->instance, peri->rxwm);
     91e:	0054c703          	lbu	a4,5(s1)
    if (watermark > SPI_HOST_PARAM_TX_DEPTH) return SPI_FLAG_WATERMARK_EXCEEDS;
     922:	00f66a63          	bltu	a2,a5,936 <spi_error_handler.isra.0+0xd4>
    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, 
     926:	4a90                	lw	a2,16(a3)
  bitfield &= ~(mask << index);
     928:	75c1                	lui	a1,0xffff0
     92a:	0ff58593          	addi	a1,a1,255 # ffff00ff <_sp+0xfffe3b2f>
  bitfield |= (value & mask) << index;
     92e:	07a2                	slli	a5,a5,0x8
  bitfield &= ~(mask << index);
     930:	8e6d                	and	a2,a2,a1
  bitfield |= (value & mask) << index;
     932:	8fd1                	or	a5,a5,a2
     934:	ca9c                	sw	a5,16(a3)
    if (watermark > SPI_HOST_PARAM_RX_DEPTH) return SPI_FLAG_WATERMARK_EXCEEDS;
     936:	04000793          	li	a5,64
     93a:	00e7e763          	bltu	a5,a4,948 <spi_error_handler.isra.0+0xe6>
    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, 
     93e:	4a9c                	lw	a5,16(a3)
  bitfield &= ~(mask << index);
     940:	f007f793          	andi	a5,a5,-256
  bitfield |= (value & mask) << index;
     944:	8f5d                	or	a4,a4,a5
     946:	ca98                	sw	a4,16(a3)
                                 peri->txn.rxbuffer, peri->rxcnt);
    }
    spi_reset_peri(peri);
    // Set the state to error
    peri->state = SPI_STATE_ERROR;
}
     948:	40a2                	lw	ra,8(sp)
    peri->state = SPI_STATE_ERROR;
     94a:	47a1                	li	a5,8
    peri->last_id = 0;
     94c:	0004a423          	sw	zero,8(s1)
    peri->state = SPI_STATE_ERROR;
     950:	c89c                	sw	a5,16(s1)
}
     952:	4492                	lw	s1,4(sp)
     954:	0131                	addi	sp,sp,12
     956:	8082                	ret

00000958 <_writestr>:
{
    return _write(fd,buf,cnt);
}

void _writestr(const void *ptr)
{
     958:	1161                	addi	sp,sp,-8
     95a:	c206                	sw	ra,4(sp)
     95c:	c02a                	sw	a0,0(sp)
    _write(STDOUT_FILENO, ptr, strlen(ptr)+1);
     95e:	1d8010ef          	jal	1b36 <strlen>
     962:	4582                	lw	a1,0(sp)
}
     964:	4092                	lw	ra,4(sp)
    _write(STDOUT_FILENO, ptr, strlen(ptr)+1);
     966:	00150613          	addi	a2,a0,1
     96a:	4505                	li	a0,1
}
     96c:	0121                	addi	sp,sp,8
    _write(STDOUT_FILENO, ptr, strlen(ptr)+1);
     96e:	b1c9                	j	630 <_write>

00000970 <print_exc_msg>:
/**
 * Default Error Handling
 * @param msg error message supplied by caller
 * TODO - this will be soon by a real print formatting
 */
static void print_exc_msg(const char *msg) {
     970:	1141                	addi	sp,sp,-16
     972:	c606                	sw	ra,12(sp)
     974:	c426                	sw	s1,8(sp)
  _writestr(msg );
     976:	37cd                	jal	958 <_writestr>
  uint32_t mtval; 
  CSR_READ(CSR_REG_MTVAL, &mtval);
     978:	343024f3          	csrr	s1,mtval
  _writestr("MTVAL value is ");
     97c:	6529                	lui	a0,0xa
     97e:	74050513          	addi	a0,a0,1856 # a740 <__clz_tab+0x164>
     982:	3fd9                	jal	958 <_writestr>
  const char p[6] = {(mtval >> 24) & 0xFF, (mtval >> 16) & 0xFF, (mtval >> 8) & 0xFF, mtval & 0xFF, '\n', 0};
     984:	6984d493          	rev8	s1,s1
     988:	47a9                	li	a5,10
  _writestr(p);
     98a:	850a                	mv	a0,sp
  const char p[6] = {(mtval >> 24) & 0xFF, (mtval >> 16) & 0xFF, (mtval >> 8) & 0xFF, mtval & 0xFF, '\n', 0};
     98c:	c026                	sw	s1,0(sp)
     98e:	00f11223          	sh	a5,4(sp)
  _writestr(p);
     992:	37d9                	jal	958 <_writestr>
  while (1) {
     994:	a001                	j	994 <print_exc_msg+0x24>

00000996 <inferenceTPG>:
void inferenceTPG(fixedpt* actions,
                  const fixedpt * restrict in1,
                  const fixedpt * restrict in2,
                  const fixedpt * restrict in3,
                  const fixedpt * restrict in4)
{
     996:	469c                	lw	a5,8(a3)
     998:	6329                	lui	t1,0xa
     99a:	53030313          	addi	t1,t1,1328 # a530 <spi_sdk.c.ee43b428+0x8fb>
     99e:	fc810113          	addi	sp,sp,-56
     9a2:	42d8                	lw	a4,4(a3)
     9a4:	4214                	lw	a3,0(a2)
     9a6:	00179613          	slli	a2,a5,0x1
     9aa:	c632                	sw	a2,12(sp)
	const enum vertices next[6] = { A1, A2, A3, A4, A5, A6 };
     9ac:	00032603          	lw	a2,0(t1)
     9b0:	00c32383          	lw	t2,12(t1)
     9b4:	01032583          	lw	a1,16(t1)
     9b8:	c232                	sw	a2,4(sp)
     9ba:	00432603          	lw	a2,4(t1)
     9be:	c036                	sw	a3,0(sp)
{
     9c0:	da26                	sw	s1,52(sp)
	const enum vertices next[6] = { A1, A2, A3, A4, A5, A6 };
     9c2:	c432                	sw	a2,8(sp)
     9c4:	01432603          	lw	a2,20(t1)
     9c8:	00832303          	lw	t1,8(t1)
     9cc:	00f706b3          	add	a3,a4,a5
     9d0:	40f707b3          	sub	a5,a4,a5
     9d4:	4292                	lw	t0,4(sp)
		reg[1] = op0 + op1;
	}
	{
		fixedpt op0 = in2[0];
		fixedpt op1 = reg[1];
		reg[0] = op0 - op1;
     9d6:	44b2                	lw	s1,12(sp)
     9d8:	d21a                	sw	t1,36(sp)
     9da:	ce16                	sw	t0,28(sp)
     9dc:	42a2                	lw	t0,8(sp)
     9de:	d41e                	sw	t2,40(sp)
     9e0:	d62e                	sw	a1,44(sp)
     9e2:	d016                	sw	t0,32(sp)
     9e4:	4282                	lw	t0,0(sp)
     9e6:	d832                	sw	a2,48(sp)
inline __attribute__((always_inline)) fixedpt P2(const fixedpt * restrict in1, const fixedpt * restrict in2, const fixedpt * restrict in3, const fixedpt * restrict in4) {
	fixedpt reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		fixedpt op0 = in3[1];
		fixedpt op1 = in3[2];
		reg[0] = op0 - op1;
     9e8:	cc3e                	sw	a5,24(sp)
		reg[0] = op0 - op1;
     9ea:	409282b3          	sub	t0,t0,s1
     9ee:	ca16                	sw	t0,20(sp)
  
//   return result;
// }

static inline __attribute__((always_inline)) fixedpt f_log2(fixedpt n) {
    if (n <= 0) {
     9f0:	08e05a63          	blez	a4,a84 <inferenceTPG+0xee>
        return 0; // Handle error for non-positive input
    }
    return 31 - __builtin_clz(n);
     9f4:	44fd                	li	s1,31
     9f6:	60071293          	clz	t0,a4
     9fa:	405482b3          	sub	t0,s1,t0
		if (challengerScore >= bestScore) {
     9fe:	44d2                	lw	s1,20(sp)
     a00:	00d4dc63          	bge	s1,a3,a18 <inferenceTPG+0x82>
     a04:	08d7dc63          	bge	a5,a3,a9c <inferenceTPG+0x106>
     a08:	02d2d063          	bge	t0,a3,a28 <inferenceTPG+0x92>
     a0c:	82ba                	mv	t0,a4
     a0e:	06d75463          	bge	a4,a3,a76 <inferenceTPG+0xe0>
			bestProgram = i;
     a12:	4495                	li	s1,5
     a14:	c826                	sw	s1,16(sp)
     a16:	a839                	j	a34 <inferenceTPG+0x9e>
     a18:	4489                	li	s1,2
     a1a:	c826                	sw	s1,16(sp)
		if (challengerScore >= bestScore) {
     a1c:	44d2                	lw	s1,20(sp)
     a1e:	0697cb63          	blt	a5,s1,a94 <inferenceTPG+0xfe>
     a22:	44e2                	lw	s1,24(sp)
     a24:	0492cc63          	blt	t0,s1,a7c <inferenceTPG+0xe6>
			bestProgram = i;
     a28:	448d                	li	s1,3
     a2a:	c826                	sw	s1,16(sp)
		if (challengerScore >= bestScore) {
     a2c:	04575463          	bge	a4,t0,a74 <inferenceTPG+0xde>
     a30:	fe56d1e3          	bge	a3,t0,a12 <inferenceTPG+0x7c>
	return next[bestProgram(scores, 6)];
     a34:	44c2                	lw	s1,16(sp)
     a36:	2024c2b3          	sh2add	t0,s1,sp
     a3a:	01c2a283          	lw	t0,28(t0)
	enum vertices currentVertex = T0;

	while (1) {
		switch (currentVertex) {
			case T0:  currentVertex = T0_func(in1, in2, in3, in4); break;
     a3e:	f8028be3          	beqz	t0,9d4 <inferenceTPG+0x3e>
     a42:	4785                	li	a5,1
     a44:	8316                	mv	t1,t0
     a46:	02f28163          	beq	t0,a5,a68 <inferenceTPG+0xd2>
     a4a:	4789                	li	a5,2
     a4c:	00f28e63          	beq	t0,a5,a68 <inferenceTPG+0xd2>
     a50:	478d                	li	a5,3
     a52:	00f28b63          	beq	t0,a5,a68 <inferenceTPG+0xd2>
		switch (currentVertex) {
     a56:	4795                	li	a5,5
     a58:	00f28863          	beq	t0,a5,a68 <inferenceTPG+0xd2>
     a5c:	4799                	li	a5,6
     a5e:	4711                	li	a4,4
     a60:	00f30463          	beq	t1,a5,a68 <inferenceTPG+0xd2>
     a64:	fee31ee3          	bne	t1,a4,a60 <inferenceTPG+0xca>
			case A1: actions[0] = 1; return;
     a68:	00652023          	sw	t1,0(a0)
			case A4: actions[0] = 4; return;
			case A5: actions[0] = 5; return;
			case A6: actions[0] = 6; return;
		}
	}
     a6c:	54d2                	lw	s1,52(sp)
     a6e:	03810113          	addi	sp,sp,56
     a72:	8082                	ret
		if (challengerScore >= bestScore) {
     a74:	82ba                	mv	t0,a4
			bestProgram = i;
     a76:	4491                	li	s1,4
     a78:	c826                	sw	s1,16(sp)
     a7a:	bf5d                	j	a30 <inferenceTPG+0x9a>
		if (challengerScore >= bestScore) {
     a7c:	82a6                	mv	t0,s1
     a7e:	fa5749e3          	blt	a4,t0,a30 <inferenceTPG+0x9a>
     a82:	bfcd                	j	a74 <inferenceTPG+0xde>
     a84:	02d2d563          	bge	t0,a3,aae <inferenceTPG+0x118>
     a88:	00d7dd63          	bge	a5,a3,aa2 <inferenceTPG+0x10c>
     a8c:	f8d043e3          	bgtz	a3,a12 <inferenceTPG+0x7c>
inline __attribute__((always_inline)) fixedpt P4(const fixedpt * restrict in1, const fixedpt * restrict in2, const fixedpt * restrict in3, const fixedpt * restrict in4) {
	fixedpt reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		fixedpt op0 = reg[4];
		fixedpt op1 = in3[1];
		reg[0] = (op0 > op1) ? op0 : op1;
     a90:	4281                	li	t0,0
     a92:	b7d5                	j	a76 <inferenceTPG+0xe0>
     a94:	cc26                	sw	s1,24(sp)
     a96:	4485                	li	s1,1
     a98:	c826                	sw	s1,16(sp)
     a9a:	b761                	j	a22 <inferenceTPG+0x8c>
			bestProgram = i;
     a9c:	4489                	li	s1,2
     a9e:	c826                	sw	s1,16(sp)
     aa0:	b749                	j	a22 <inferenceTPG+0x8c>
		if (challengerScore >= bestScore) {
     aa2:	fef057e3          	blez	a5,a90 <inferenceTPG+0xfa>
			bestProgram = i;
     aa6:	4489                	li	s1,2
			bestScore = challengerScore;
     aa8:	82be                	mv	t0,a5
			bestProgram = i;
     aaa:	c826                	sw	s1,16(sp)
     aac:	b751                	j	a30 <inferenceTPG+0x9a>
		if (challengerScore >= bestScore) {
     aae:	fe57dae3          	bge	a5,t0,aa2 <inferenceTPG+0x10c>
     ab2:	fc505fe3          	blez	t0,a90 <inferenceTPG+0xfa>
     ab6:	4485                	li	s1,1
     ab8:	c826                	sw	s1,16(sp)
     aba:	bf9d                	j	a30 <inferenceTPG+0x9a>

00000abc <handler_irq_fast_spi>:
    // call the weak fic handler
    fic_irq_ext_peripheral();
}

void handler_irq_fast_spi(void)
{
     abc:	fd410113          	addi	sp,sp,-44
     ac0:	c43a                	sw	a4,8(sp)
     ac2:	c23e                	sw	a5,4(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     ac4:	4741                	li	a4,16
     ac6:	200607b7          	lui	a5,0x20060
{
     aca:	d406                	sw	ra,40(sp)
     acc:	d216                	sw	t0,36(sp)
     ace:	d01a                	sw	t1,32(sp)
     ad0:	ce1e                	sw	t2,28(sp)
     ad2:	cc2a                	sw	a0,24(sp)
     ad4:	ca2e                	sw	a1,20(sp)
     ad6:	c832                	sw	a2,16(sp)
     ad8:	c636                	sw	a3,12(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     ada:	c3d8                	sw	a4,4(a5)
    *errors = bitfield_read(SPI_HW(spi)->ERROR_STATUS, SPI_ERROR_ALL, SPI_ERRORS_INDEX);
     adc:	30010737          	lui	a4,0x30010
     ae0:	5b5c                	lw	a5,52(a4)
  return (bitfield >> index) & mask;
     ae2:	03f7f793          	andi	a5,a5,63
void fic_irq_spi(void)
{
    spi_error_e errors;
    // Get errors and check if error triggered the interrupt
    spi_get_errors(spi_host1, &errors);
    if (errors) {
     ae6:	c795                	beqz	a5,b12 <handler_irq_fast_spi+0x56>
/**
 * @brief Implementation of the weak function of the HAL
 */
void spi_intr_handler_error_host(spi_error_e errors) 
{
    if (SPI_NOT_BUSY(peripherals[SPI_IDX_HOST])) return;
     ae8:	67ad                	lui	a5,0xb
     aea:	22478793          	addi	a5,a5,548 # b224 <peripherals>
     aee:	4fb8                	lw	a4,88(a5)
     af0:	4789                	li	a5,2
     af2:	08f70163          	beq	a4,a5,b74 <handler_irq_fast_spi+0xb8>
    // The interrupt is cleared.
    clear_fast_interrupt(kSpi_fic_e);
    // call the weak fic handler
    fic_irq_spi();
}
     af6:	50a2                	lw	ra,40(sp)
     af8:	5292                	lw	t0,36(sp)
     afa:	5302                	lw	t1,32(sp)
     afc:	43f2                	lw	t2,28(sp)
     afe:	4562                	lw	a0,24(sp)
     b00:	45d2                	lw	a1,20(sp)
     b02:	4642                	lw	a2,16(sp)
     b04:	46b2                	lw	a3,12(sp)
     b06:	4722                	lw	a4,8(sp)
     b08:	4792                	lw	a5,4(sp)
     b0a:	02c10113          	addi	sp,sp,44
     b0e:	30200073          	mret

spi_return_flags_e spi_acknowledge_event(spi_host_t* spi) {
    // We do not need any NULL check since this function is made to be called
    // __ONLY__ from `handler_irq_spi`, `fic_irq_spi`, `fic_irq_spi_flash`.
    // Therefore we know that spi argument will not be NULL.
    SPI_HW(spi)->INTR_STATE = bitfield_write(SPI_HW(spi)->INTR_STATE, BIT_MASK_1, 
     b12:	431c                	lw	a5,0(a4)
    if (SPI_NOT_BUSY(peripherals[SPI_IDX_HOST])) return;
     b14:	62ad                	lui	t0,0xb
     b16:	22428293          	addi	t0,t0,548 # b224 <peripherals>
  bitfield |= (value & mask) << index;
     b1a:	0027e793          	ori	a5,a5,2
     b1e:	c31c                	sw	a5,0(a4)
     b20:	4b5c                	lw	a5,20(a4)
     b22:	4309                	li	t1,2
     b24:	c03e                	sw	a5,0(sp)
                             SPI_HOST_EVENT_ENABLE_RXFULL_BIT,  status.rxfull);
     b26:	4602                	lw	a2,0(sp)
                             SPI_HOST_EVENT_ENABLE_TXEMPTY_BIT, status.txempty);
     b28:	4682                	lw	a3,0(sp)
                             SPI_HOST_EVENT_ENABLE_RXWM_BIT,    status.rxwm);
     b2a:	4702                	lw	a4,0(sp)
                             SPI_HOST_EVENT_ENABLE_TXWM_BIT,    status.txwm);
     b2c:	4782                	lw	a5,0(sp)
                             SPI_HOST_EVENT_ENABLE_READY_BIT,   status.ready);
     b2e:	4582                	lw	a1,0(sp)
                             SPI_HOST_EVENT_ENABLE_IDLE_BIT,   ~status.active);
     b30:	4502                	lw	a0,0(sp)
     b32:	0582a283          	lw	t0,88(t0)
                             SPI_HOST_EVENT_ENABLE_RXFULL_BIT,  status.rxfull);
     b36:	8265                	srli	a2,a2,0x19
                             SPI_HOST_EVENT_ENABLE_TXEMPTY_BIT, status.txempty);
     b38:	82f1                	srli	a3,a3,0x1c
                             SPI_HOST_EVENT_ENABLE_RXWM_BIT,    status.rxwm);
     b3a:	8351                	srli	a4,a4,0x14
                             SPI_HOST_EVENT_ENABLE_TXWM_BIT,    status.txwm);
     b3c:	83e9                	srli	a5,a5,0x1a
                             SPI_HOST_EVENT_ENABLE_RXFULL_BIT,  status.rxfull);
     b3e:	8a05                	andi	a2,a2,1
                             SPI_HOST_EVENT_ENABLE_TXEMPTY_BIT, status.txempty);
     b40:	8a85                	andi	a3,a3,1
                             SPI_HOST_EVENT_ENABLE_RXWM_BIT,    status.rxwm);
     b42:	8b05                	andi	a4,a4,1
                             SPI_HOST_EVENT_ENABLE_TXWM_BIT,    status.txwm);
     b44:	8b85                	andi	a5,a5,1
                             SPI_HOST_EVENT_ENABLE_READY_BIT,   status.ready);
     b46:	81fd                	srli	a1,a1,0x1f
                             SPI_HOST_EVENT_ENABLE_IDLE_BIT,   ~status.active);
     b48:	8179                	srli	a0,a0,0x1e
     b4a:	fa6296e3          	bne	t0,t1,af6 <handler_irq_fast_spi+0x3a>
     b4e:	0686                	slli	a3,a3,0x1
  bitfield &= ~(mask << index);
     b50:	8ed1                	or	a3,a3,a2
  bitfield |= (value & mask) << index;
     b52:	070a                	slli	a4,a4,0x2
  bitfield &= ~(mask << index);
     b54:	8f55                	or	a4,a4,a3
  bitfield |= (value & mask) << index;
     b56:	078e                	slli	a5,a5,0x3
  bitfield &= ~(mask << index);
     b58:	8fd9                	or	a5,a5,a4
  bitfield |= (value & mask) << index;
     b5a:	4705                	li	a4,1
     b5c:	40a77533          	andn	a0,a4,a0
     b60:	0592                	slli	a1,a1,0x4
  bitfield &= ~(mask << index);
     b62:	8ddd                	or	a1,a1,a5
  bitfield |= (value & mask) << index;
     b64:	00551793          	slli	a5,a0,0x5
    spi_event_handler(&peripherals[SPI_IDX_HOST], events);
     b68:	652d                	lui	a0,0xb
     b6a:	8ddd                	or	a1,a1,a5
     b6c:	26c50513          	addi	a0,a0,620 # b26c <peripherals+0x48>
     b70:	3625                	jal	698 <spi_event_handler>
     b72:	b751                	j	af6 <handler_irq_fast_spi+0x3a>
    spi_error_handler(&peripherals[SPI_IDX_HOST], errors);
     b74:	652d                	lui	a0,0xb
     b76:	26c50513          	addi	a0,a0,620 # b26c <peripherals+0x48>
     b7a:	31e5                	jal	862 <spi_error_handler.isra.0>
     b7c:	bfad                	j	af6 <handler_irq_fast_spi+0x3a>
	...

00000b80 <handler_irq_fast_spi_flash>:

void handler_irq_fast_spi_flash(void)
{
     b80:	fd410113          	addi	sp,sp,-44
     b84:	c43a                	sw	a4,8(sp)
     b86:	c23e                	sw	a5,4(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     b88:	02000713          	li	a4,32
     b8c:	200607b7          	lui	a5,0x20060
{
     b90:	d406                	sw	ra,40(sp)
     b92:	d216                	sw	t0,36(sp)
     b94:	d01a                	sw	t1,32(sp)
     b96:	ce1e                	sw	t2,28(sp)
     b98:	cc2a                	sw	a0,24(sp)
     b9a:	ca2e                	sw	a1,20(sp)
     b9c:	c832                	sw	a2,16(sp)
     b9e:	c636                	sw	a3,12(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     ba0:	c3d8                	sw	a4,4(a5)
    *errors = bitfield_read(SPI_HW(spi)->ERROR_STATUS, SPI_ERROR_ALL, SPI_ERRORS_INDEX);
     ba2:	20020737          	lui	a4,0x20020
     ba6:	5b5c                	lw	a5,52(a4)
  return (bitfield >> index) & mask;
     ba8:	03f7f793          	andi	a5,a5,63
    if (errors) {
     bac:	c795                	beqz	a5,bd8 <handler_irq_fast_spi_flash+0x58>
    if (SPI_NOT_BUSY(peripherals[SPI_IDX_FLASH])) return;
     bae:	652d                	lui	a0,0xb
     bb0:	22450513          	addi	a0,a0,548 # b224 <peripherals>
     bb4:	4918                	lw	a4,16(a0)
     bb6:	4789                	li	a5,2
     bb8:	06f70f63          	beq	a4,a5,c36 <handler_irq_fast_spi_flash+0xb6>
    // The interrupt is cleared.
    clear_fast_interrupt(kSpiFlash_fic_e);
    // call the weak fic handler
    fic_irq_spi_flash();
}
     bbc:	50a2                	lw	ra,40(sp)
     bbe:	5292                	lw	t0,36(sp)
     bc0:	5302                	lw	t1,32(sp)
     bc2:	43f2                	lw	t2,28(sp)
     bc4:	4562                	lw	a0,24(sp)
     bc6:	45d2                	lw	a1,20(sp)
     bc8:	4642                	lw	a2,16(sp)
     bca:	46b2                	lw	a3,12(sp)
     bcc:	4722                	lw	a4,8(sp)
     bce:	4792                	lw	a5,4(sp)
     bd0:	02c10113          	addi	sp,sp,44
     bd4:	30200073          	mret
    SPI_HW(spi)->INTR_STATE = bitfield_write(SPI_HW(spi)->INTR_STATE, BIT_MASK_1, 
     bd8:	431c                	lw	a5,0(a4)
    if (SPI_NOT_BUSY(peripherals[SPI_IDX_FLASH])) return;
     bda:	652d                	lui	a0,0xb
     bdc:	22450513          	addi	a0,a0,548 # b224 <peripherals>
  bitfield |= (value & mask) << index;
     be0:	0027e793          	ori	a5,a5,2
     be4:	c31c                	sw	a5,0(a4)
     be6:	4b5c                	lw	a5,20(a4)
     be8:	4289                	li	t0,2
     bea:	c03e                	sw	a5,0(sp)
                             SPI_HOST_EVENT_ENABLE_RXFULL_BIT,  status.rxfull);
     bec:	4602                	lw	a2,0(sp)
                             SPI_HOST_EVENT_ENABLE_TXEMPTY_BIT, status.txempty);
     bee:	4682                	lw	a3,0(sp)
                             SPI_HOST_EVENT_ENABLE_RXWM_BIT,    status.rxwm);
     bf0:	4702                	lw	a4,0(sp)
                             SPI_HOST_EVENT_ENABLE_TXWM_BIT,    status.txwm);
     bf2:	4782                	lw	a5,0(sp)
                             SPI_HOST_EVENT_ENABLE_READY_BIT,   status.ready);
     bf4:	4582                	lw	a1,0(sp)
                             SPI_HOST_EVENT_ENABLE_IDLE_BIT,   ~status.active);
     bf6:	4302                	lw	t1,0(sp)
     bf8:	01052383          	lw	t2,16(a0)
                             SPI_HOST_EVENT_ENABLE_RXFULL_BIT,  status.rxfull);
     bfc:	8265                	srli	a2,a2,0x19
                             SPI_HOST_EVENT_ENABLE_TXEMPTY_BIT, status.txempty);
     bfe:	82f1                	srli	a3,a3,0x1c
                             SPI_HOST_EVENT_ENABLE_RXWM_BIT,    status.rxwm);
     c00:	8351                	srli	a4,a4,0x14
                             SPI_HOST_EVENT_ENABLE_TXWM_BIT,    status.txwm);
     c02:	83e9                	srli	a5,a5,0x1a
                             SPI_HOST_EVENT_ENABLE_RXFULL_BIT,  status.rxfull);
     c04:	8a05                	andi	a2,a2,1
                             SPI_HOST_EVENT_ENABLE_TXEMPTY_BIT, status.txempty);
     c06:	8a85                	andi	a3,a3,1
                             SPI_HOST_EVENT_ENABLE_RXWM_BIT,    status.rxwm);
     c08:	8b05                	andi	a4,a4,1
                             SPI_HOST_EVENT_ENABLE_TXWM_BIT,    status.txwm);
     c0a:	8b85                	andi	a5,a5,1
                             SPI_HOST_EVENT_ENABLE_READY_BIT,   status.ready);
     c0c:	81fd                	srli	a1,a1,0x1f
                             SPI_HOST_EVENT_ENABLE_IDLE_BIT,   ~status.active);
     c0e:	01e35313          	srli	t1,t1,0x1e
     c12:	fa5395e3          	bne	t2,t0,bbc <handler_irq_fast_spi_flash+0x3c>
     c16:	0686                	slli	a3,a3,0x1
  bitfield &= ~(mask << index);
     c18:	8ed1                	or	a3,a3,a2
  bitfield |= (value & mask) << index;
     c1a:	070a                	slli	a4,a4,0x2
  bitfield &= ~(mask << index);
     c1c:	8f55                	or	a4,a4,a3
  bitfield |= (value & mask) << index;
     c1e:	078e                	slli	a5,a5,0x3
  bitfield &= ~(mask << index);
     c20:	8fd9                	or	a5,a5,a4
  bitfield |= (value & mask) << index;
     c22:	4705                	li	a4,1
     c24:	40677333          	andn	t1,a4,t1
     c28:	0592                	slli	a1,a1,0x4
  bitfield &= ~(mask << index);
     c2a:	8ddd                	or	a1,a1,a5
  bitfield |= (value & mask) << index;
     c2c:	0316                	slli	t1,t1,0x5
    spi_event_handler(&peripherals[SPI_IDX_FLASH], events);
     c2e:	00b365b3          	or	a1,t1,a1
     c32:	349d                	jal	698 <spi_event_handler>
     c34:	b761                	j	bbc <handler_irq_fast_spi_flash+0x3c>
    spi_error_handler(&peripherals[SPI_IDX_FLASH], errors);
     c36:	3135                	jal	862 <spi_error_handler.isra.0>
     c38:	b751                	j	bbc <handler_irq_fast_spi_flash+0x3c>
	...

00000c3c <handler_irq_external>:
/*                           EXPORTED FUNCTIONS                             */
/**                                                                        **/
/****************************************************************************/

void handler_irq_external(void)
{
     c3c:	7179                	addi	sp,sp,-48
     c3e:	ce26                	sw	s1,28(sp)
  if (claim_data == NULL)
  {
    return kPlicBadArg;
  }

  *claim_data = rv_plic_peri->CC0;
     c40:	300004b7          	lui	s1,0x30000
{
     c44:	cc2a                	sw	a0,24(sp)
  *claim_data = rv_plic_peri->CC0;
     c46:	20c4a503          	lw	a0,524(s1) # 3000020c <_sp+0x2fff3c3c>
{
     c4a:	c23e                	sw	a5,4(sp)
     c4c:	d606                	sw	ra,44(sp)
     c4e:	d416                	sw	t0,40(sp)
     c50:	d21a                	sw	t1,36(sp)
     c52:	d01e                	sw	t2,32(sp)
     c54:	ca2e                	sw	a1,20(sp)
     c56:	c832                	sw	a2,16(sp)
     c58:	c636                	sw	a3,12(sp)
     c5a:	c43a                	sw	a4,8(sp)
    handlers[int_id](int_id);
     c5c:	c02a                	sw	a0,0(sp)
     c5e:	4781                	li	a5,0
     c60:	9782                	jalr	a5
    return kPlicBadArg;
  }

  // Write back the claimed IRQ ID to the target specific CC register,
  // to notify the PLIC of the IRQ completion.
  rv_plic_peri->CC0 = *complete_data;
     c62:	4502                	lw	a0,0(sp)
}
     c64:	50b2                	lw	ra,44(sp)
     c66:	52a2                	lw	t0,40(sp)
  rv_plic_peri->CC0 = *complete_data;
     c68:	20a4a623          	sw	a0,524(s1)
}
     c6c:	5312                	lw	t1,36(sp)
     c6e:	5382                	lw	t2,32(sp)
     c70:	44f2                	lw	s1,28(sp)
     c72:	4562                	lw	a0,24(sp)
     c74:	45d2                	lw	a1,20(sp)
     c76:	4642                	lw	a2,16(sp)
     c78:	46b2                	lw	a3,12(sp)
     c7a:	4722                	lw	a4,8(sp)
     c7c:	4792                	lw	a5,4(sp)
     c7e:	6145                	addi	sp,sp,48
     c80:	30200073          	mret
     c84:	0001                	nop
	...

00000c88 <handler_irq_fast_timer_1>:
{
     c88:	fd810113          	addi	sp,sp,-40
     c8c:	c23a                	sw	a4,4(sp)
     c8e:	c03e                	sw	a5,0(sp)
     c90:	d206                	sw	ra,36(sp)
     c92:	d016                	sw	t0,32(sp)
     c94:	ce1a                	sw	t1,28(sp)
     c96:	cc1e                	sw	t2,24(sp)
     c98:	ca2a                	sw	a0,20(sp)
     c9a:	c82e                	sw	a1,16(sp)
     c9c:	c632                	sw	a2,12(sp)
     c9e:	c436                	sw	a3,8(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     ca0:	200607b7          	lui	a5,0x20060
     ca4:	4705                	li	a4,1
     ca6:	c3d8                	sw	a4,4(a5)
    fic_irq_timer_1();
     ca8:	3a9d                	jal	61e <fic_irq_timer_1>
}
     caa:	5092                	lw	ra,36(sp)
     cac:	5282                	lw	t0,32(sp)
     cae:	4372                	lw	t1,28(sp)
     cb0:	43e2                	lw	t2,24(sp)
     cb2:	4552                	lw	a0,20(sp)
     cb4:	45c2                	lw	a1,16(sp)
     cb6:	4632                	lw	a2,12(sp)
     cb8:	46a2                	lw	a3,8(sp)
     cba:	4712                	lw	a4,4(sp)
     cbc:	4782                	lw	a5,0(sp)
     cbe:	02810113          	addi	sp,sp,40
     cc2:	30200073          	mret
     cc6:	0001                	nop

00000cc8 <handler_irq_fast_timer_2>:
{
     cc8:	fd810113          	addi	sp,sp,-40
     ccc:	c23a                	sw	a4,4(sp)
     cce:	c03e                	sw	a5,0(sp)
     cd0:	d206                	sw	ra,36(sp)
     cd2:	d016                	sw	t0,32(sp)
     cd4:	ce1a                	sw	t1,28(sp)
     cd6:	cc1e                	sw	t2,24(sp)
     cd8:	ca2a                	sw	a0,20(sp)
     cda:	c82e                	sw	a1,16(sp)
     cdc:	c632                	sw	a2,12(sp)
     cde:	c436                	sw	a3,8(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     ce0:	200607b7          	lui	a5,0x20060
     ce4:	4709                	li	a4,2
     ce6:	c3d8                	sw	a4,4(a5)
    fic_irq_timer_2();
     ce8:	3a1d                	jal	61e <fic_irq_timer_1>
}
     cea:	5092                	lw	ra,36(sp)
     cec:	5282                	lw	t0,32(sp)
     cee:	4372                	lw	t1,28(sp)
     cf0:	43e2                	lw	t2,24(sp)
     cf2:	4552                	lw	a0,20(sp)
     cf4:	45c2                	lw	a1,16(sp)
     cf6:	4632                	lw	a2,12(sp)
     cf8:	46a2                	lw	a3,8(sp)
     cfa:	4712                	lw	a4,4(sp)
     cfc:	4782                	lw	a5,0(sp)
     cfe:	02810113          	addi	sp,sp,40
     d02:	30200073          	mret
     d06:	0001                	nop

00000d08 <handler_irq_fast_timer_3>:
{
     d08:	fd810113          	addi	sp,sp,-40
     d0c:	c23a                	sw	a4,4(sp)
     d0e:	c03e                	sw	a5,0(sp)
     d10:	d206                	sw	ra,36(sp)
     d12:	d016                	sw	t0,32(sp)
     d14:	ce1a                	sw	t1,28(sp)
     d16:	cc1e                	sw	t2,24(sp)
     d18:	ca2a                	sw	a0,20(sp)
     d1a:	c82e                	sw	a1,16(sp)
     d1c:	c632                	sw	a2,12(sp)
     d1e:	c436                	sw	a3,8(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     d20:	200607b7          	lui	a5,0x20060
     d24:	4711                	li	a4,4
     d26:	c3d8                	sw	a4,4(a5)
    fic_irq_timer_3();
     d28:	38dd                	jal	61e <fic_irq_timer_1>
}
     d2a:	5092                	lw	ra,36(sp)
     d2c:	5282                	lw	t0,32(sp)
     d2e:	4372                	lw	t1,28(sp)
     d30:	43e2                	lw	t2,24(sp)
     d32:	4552                	lw	a0,20(sp)
     d34:	45c2                	lw	a1,16(sp)
     d36:	4632                	lw	a2,12(sp)
     d38:	46a2                	lw	a3,8(sp)
     d3a:	4712                	lw	a4,4(sp)
     d3c:	4782                	lw	a5,0(sp)
     d3e:	02810113          	addi	sp,sp,40
     d42:	30200073          	mret
     d46:	0001                	nop

00000d48 <handler_irq_fast_external_peripheral>:
{
     d48:	fd810113          	addi	sp,sp,-40
     d4c:	c23a                	sw	a4,4(sp)
     d4e:	c03e                	sw	a5,0(sp)
     d50:	d206                	sw	ra,36(sp)
     d52:	d016                	sw	t0,32(sp)
     d54:	ce1a                	sw	t1,28(sp)
     d56:	cc1e                	sw	t2,24(sp)
     d58:	ca2a                	sw	a0,20(sp)
     d5a:	c82e                	sw	a1,16(sp)
     d5c:	c632                	sw	a2,12(sp)
     d5e:	c436                	sw	a3,8(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     d60:	200607b7          	lui	a5,0x20060
     d64:	6721                	lui	a4,0x8
     d66:	c3d8                	sw	a4,4(a5)
    fic_irq_ext_peripheral();
     d68:	385d                	jal	61e <fic_irq_timer_1>
}
     d6a:	5092                	lw	ra,36(sp)
     d6c:	5282                	lw	t0,32(sp)
     d6e:	4372                	lw	t1,28(sp)
     d70:	43e2                	lw	t2,24(sp)
     d72:	4552                	lw	a0,20(sp)
     d74:	45c2                	lw	a1,16(sp)
     d76:	4632                	lw	a2,12(sp)
     d78:	46a2                	lw	a3,8(sp)
     d7a:	4712                	lw	a4,4(sp)
     d7c:	4782                	lw	a5,0(sp)
     d7e:	02810113          	addi	sp,sp,40
     d82:	30200073          	mret
     d86:	0001                	nop

00000d88 <handler_irq_fast_gpio_0>:

void handler_irq_fast_gpio_0(void)
{
     d88:	fd810113          	addi	sp,sp,-40
     d8c:	c23a                	sw	a4,4(sp)
     d8e:	c03e                	sw	a5,0(sp)
     d90:	d206                	sw	ra,36(sp)
     d92:	d016                	sw	t0,32(sp)
     d94:	ce1a                	sw	t1,28(sp)
     d96:	cc1e                	sw	t2,24(sp)
     d98:	ca2a                	sw	a0,20(sp)
     d9a:	c82e                	sw	a1,16(sp)
     d9c:	c632                	sw	a2,12(sp)
     d9e:	c436                	sw	a3,8(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     da0:	200607b7          	lui	a5,0x20060
     da4:	04000713          	li	a4,64
     da8:	c3d8                	sw	a4,4(a5)
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_0_fic_e);
    // call the weak fic handler
    fic_irq_gpio_0();
     daa:	3895                	jal	61e <fic_irq_timer_1>
}
     dac:	5092                	lw	ra,36(sp)
     dae:	5282                	lw	t0,32(sp)
     db0:	4372                	lw	t1,28(sp)
     db2:	43e2                	lw	t2,24(sp)
     db4:	4552                	lw	a0,20(sp)
     db6:	45c2                	lw	a1,16(sp)
     db8:	4632                	lw	a2,12(sp)
     dba:	46a2                	lw	a3,8(sp)
     dbc:	4712                	lw	a4,4(sp)
     dbe:	4782                	lw	a5,0(sp)
     dc0:	02810113          	addi	sp,sp,40
     dc4:	30200073          	mret

00000dc8 <handler_irq_fast_gpio_1>:

void handler_irq_fast_gpio_1(void)
{
     dc8:	fd810113          	addi	sp,sp,-40
     dcc:	c23a                	sw	a4,4(sp)
     dce:	c03e                	sw	a5,0(sp)
     dd0:	d206                	sw	ra,36(sp)
     dd2:	d016                	sw	t0,32(sp)
     dd4:	ce1a                	sw	t1,28(sp)
     dd6:	cc1e                	sw	t2,24(sp)
     dd8:	ca2a                	sw	a0,20(sp)
     dda:	c82e                	sw	a1,16(sp)
     ddc:	c632                	sw	a2,12(sp)
     dde:	c436                	sw	a3,8(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     de0:	200607b7          	lui	a5,0x20060
     de4:	08000713          	li	a4,128
     de8:	c3d8                	sw	a4,4(a5)
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_1_fic_e);
    // call the weak fic handler
    fic_irq_gpio_1();
     dea:	3815                	jal	61e <fic_irq_timer_1>
}
     dec:	5092                	lw	ra,36(sp)
     dee:	5282                	lw	t0,32(sp)
     df0:	4372                	lw	t1,28(sp)
     df2:	43e2                	lw	t2,24(sp)
     df4:	4552                	lw	a0,20(sp)
     df6:	45c2                	lw	a1,16(sp)
     df8:	4632                	lw	a2,12(sp)
     dfa:	46a2                	lw	a3,8(sp)
     dfc:	4712                	lw	a4,4(sp)
     dfe:	4782                	lw	a5,0(sp)
     e00:	02810113          	addi	sp,sp,40
     e04:	30200073          	mret

00000e08 <handler_irq_fast_gpio_2>:

void handler_irq_fast_gpio_2(void)
{
     e08:	fd810113          	addi	sp,sp,-40
     e0c:	c23a                	sw	a4,4(sp)
     e0e:	c03e                	sw	a5,0(sp)
     e10:	d206                	sw	ra,36(sp)
     e12:	d016                	sw	t0,32(sp)
     e14:	ce1a                	sw	t1,28(sp)
     e16:	cc1e                	sw	t2,24(sp)
     e18:	ca2a                	sw	a0,20(sp)
     e1a:	c82e                	sw	a1,16(sp)
     e1c:	c632                	sw	a2,12(sp)
     e1e:	c436                	sw	a3,8(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     e20:	200607b7          	lui	a5,0x20060
     e24:	10000713          	li	a4,256
     e28:	c3d8                	sw	a4,4(a5)
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_2_fic_e);
    // call the weak fic handler
    fic_irq_gpio_2();
     e2a:	ff4ff0ef          	jal	61e <fic_irq_timer_1>
}
     e2e:	5092                	lw	ra,36(sp)
     e30:	5282                	lw	t0,32(sp)
     e32:	4372                	lw	t1,28(sp)
     e34:	43e2                	lw	t2,24(sp)
     e36:	4552                	lw	a0,20(sp)
     e38:	45c2                	lw	a1,16(sp)
     e3a:	4632                	lw	a2,12(sp)
     e3c:	46a2                	lw	a3,8(sp)
     e3e:	4712                	lw	a4,4(sp)
     e40:	4782                	lw	a5,0(sp)
     e42:	02810113          	addi	sp,sp,40
     e46:	30200073          	mret
	...

00000e4c <handler_irq_fast_gpio_3>:

void handler_irq_fast_gpio_3(void)
{
     e4c:	fd810113          	addi	sp,sp,-40
     e50:	c23a                	sw	a4,4(sp)
     e52:	c03e                	sw	a5,0(sp)
     e54:	d206                	sw	ra,36(sp)
     e56:	d016                	sw	t0,32(sp)
     e58:	ce1a                	sw	t1,28(sp)
     e5a:	cc1e                	sw	t2,24(sp)
     e5c:	ca2a                	sw	a0,20(sp)
     e5e:	c82e                	sw	a1,16(sp)
     e60:	c632                	sw	a2,12(sp)
     e62:	c436                	sw	a3,8(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     e64:	200607b7          	lui	a5,0x20060
     e68:	20000713          	li	a4,512
     e6c:	c3d8                	sw	a4,4(a5)
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_3_fic_e);
    // call the weak fic handler
    fic_irq_gpio_3();
     e6e:	fb0ff0ef          	jal	61e <fic_irq_timer_1>
}
     e72:	5092                	lw	ra,36(sp)
     e74:	5282                	lw	t0,32(sp)
     e76:	4372                	lw	t1,28(sp)
     e78:	43e2                	lw	t2,24(sp)
     e7a:	4552                	lw	a0,20(sp)
     e7c:	45c2                	lw	a1,16(sp)
     e7e:	4632                	lw	a2,12(sp)
     e80:	46a2                	lw	a3,8(sp)
     e82:	4712                	lw	a4,4(sp)
     e84:	4782                	lw	a5,0(sp)
     e86:	02810113          	addi	sp,sp,40
     e8a:	30200073          	mret
	...

00000e90 <handler_irq_fast_gpio_4>:

void handler_irq_fast_gpio_4(void)
{
     e90:	fd810113          	addi	sp,sp,-40
     e94:	c23a                	sw	a4,4(sp)
     e96:	c03e                	sw	a5,0(sp)
     e98:	d206                	sw	ra,36(sp)
     e9a:	d016                	sw	t0,32(sp)
     e9c:	ce1a                	sw	t1,28(sp)
     e9e:	cc1e                	sw	t2,24(sp)
     ea0:	ca2a                	sw	a0,20(sp)
     ea2:	c82e                	sw	a1,16(sp)
     ea4:	c632                	sw	a2,12(sp)
     ea6:	c436                	sw	a3,8(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     ea8:	200607b7          	lui	a5,0x20060
     eac:	40000713          	li	a4,1024
     eb0:	c3d8                	sw	a4,4(a5)
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_4_fic_e);
    // call the weak fic handler
    fic_irq_gpio_4();
     eb2:	f6cff0ef          	jal	61e <fic_irq_timer_1>
}
     eb6:	5092                	lw	ra,36(sp)
     eb8:	5282                	lw	t0,32(sp)
     eba:	4372                	lw	t1,28(sp)
     ebc:	43e2                	lw	t2,24(sp)
     ebe:	4552                	lw	a0,20(sp)
     ec0:	45c2                	lw	a1,16(sp)
     ec2:	4632                	lw	a2,12(sp)
     ec4:	46a2                	lw	a3,8(sp)
     ec6:	4712                	lw	a4,4(sp)
     ec8:	4782                	lw	a5,0(sp)
     eca:	02810113          	addi	sp,sp,40
     ece:	30200073          	mret
	...

00000ed4 <handler_irq_fast_gpio_5>:

void handler_irq_fast_gpio_5(void)
{
     ed4:	fd810113          	addi	sp,sp,-40
     ed8:	c03e                	sw	a5,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     eda:	6785                	lui	a5,0x1
{
     edc:	c23a                	sw	a4,4(sp)
     ede:	d206                	sw	ra,36(sp)
     ee0:	d016                	sw	t0,32(sp)
     ee2:	ce1a                	sw	t1,28(sp)
     ee4:	cc1e                	sw	t2,24(sp)
     ee6:	ca2a                	sw	a0,20(sp)
     ee8:	c82e                	sw	a1,16(sp)
     eea:	c632                	sw	a2,12(sp)
     eec:	c436                	sw	a3,8(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     eee:	80078793          	addi	a5,a5,-2048 # 800 <__heap_size>
     ef2:	20060737          	lui	a4,0x20060
     ef6:	c35c                	sw	a5,4(a4)
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_5_fic_e);
    // call the weak fic handler
    fic_irq_gpio_5();
     ef8:	f26ff0ef          	jal	61e <fic_irq_timer_1>
}
     efc:	5092                	lw	ra,36(sp)
     efe:	5282                	lw	t0,32(sp)
     f00:	4372                	lw	t1,28(sp)
     f02:	43e2                	lw	t2,24(sp)
     f04:	4552                	lw	a0,20(sp)
     f06:	45c2                	lw	a1,16(sp)
     f08:	4632                	lw	a2,12(sp)
     f0a:	46a2                	lw	a3,8(sp)
     f0c:	4712                	lw	a4,4(sp)
     f0e:	4782                	lw	a5,0(sp)
     f10:	02810113          	addi	sp,sp,40
     f14:	30200073          	mret
     f18:	0001                	nop
	...

00000f1c <handler_irq_fast_gpio_6>:

void handler_irq_fast_gpio_6(void)
{
     f1c:	fd810113          	addi	sp,sp,-40
     f20:	c23a                	sw	a4,4(sp)
     f22:	c03e                	sw	a5,0(sp)
     f24:	d206                	sw	ra,36(sp)
     f26:	d016                	sw	t0,32(sp)
     f28:	ce1a                	sw	t1,28(sp)
     f2a:	cc1e                	sw	t2,24(sp)
     f2c:	ca2a                	sw	a0,20(sp)
     f2e:	c82e                	sw	a1,16(sp)
     f30:	c632                	sw	a2,12(sp)
     f32:	c436                	sw	a3,8(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     f34:	200607b7          	lui	a5,0x20060
     f38:	6705                	lui	a4,0x1
     f3a:	c3d8                	sw	a4,4(a5)
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_6_fic_e);
    // call the weak fic handler
    fic_irq_gpio_6();
     f3c:	ee2ff0ef          	jal	61e <fic_irq_timer_1>
}
     f40:	5092                	lw	ra,36(sp)
     f42:	5282                	lw	t0,32(sp)
     f44:	4372                	lw	t1,28(sp)
     f46:	43e2                	lw	t2,24(sp)
     f48:	4552                	lw	a0,20(sp)
     f4a:	45c2                	lw	a1,16(sp)
     f4c:	4632                	lw	a2,12(sp)
     f4e:	46a2                	lw	a3,8(sp)
     f50:	4712                	lw	a4,4(sp)
     f52:	4782                	lw	a5,0(sp)
     f54:	02810113          	addi	sp,sp,40
     f58:	30200073          	mret
     f5c:	0001                	nop
	...

00000f60 <handler_irq_fast_gpio_7>:

void handler_irq_fast_gpio_7(void)
{
     f60:	fd810113          	addi	sp,sp,-40
     f64:	c23a                	sw	a4,4(sp)
     f66:	c03e                	sw	a5,0(sp)
     f68:	d206                	sw	ra,36(sp)
     f6a:	d016                	sw	t0,32(sp)
     f6c:	ce1a                	sw	t1,28(sp)
     f6e:	cc1e                	sw	t2,24(sp)
     f70:	ca2a                	sw	a0,20(sp)
     f72:	c82e                	sw	a1,16(sp)
     f74:	c632                	sw	a2,12(sp)
     f76:	c436                	sw	a3,8(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     f78:	200607b7          	lui	a5,0x20060
     f7c:	6709                	lui	a4,0x2
     f7e:	c3d8                	sw	a4,4(a5)
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_7_fic_e);
    // call the weak fic handler
    fic_irq_gpio_7();
     f80:	e9eff0ef          	jal	61e <fic_irq_timer_1>
}
     f84:	5092                	lw	ra,36(sp)
     f86:	5282                	lw	t0,32(sp)
     f88:	4372                	lw	t1,28(sp)
     f8a:	43e2                	lw	t2,24(sp)
     f8c:	4552                	lw	a0,20(sp)
     f8e:	45c2                	lw	a1,16(sp)
     f90:	4632                	lw	a2,12(sp)
     f92:	46a2                	lw	a3,8(sp)
     f94:	4712                	lw	a4,4(sp)
     f96:	4782                	lw	a5,0(sp)
     f98:	02810113          	addi	sp,sp,40
     f9c:	30200073          	mret
     fa0:	0001                	nop
	...

00000fa4 <handler_irq_fast_dma_done>:
{
     fa4:	fd810113          	addi	sp,sp,-40
     fa8:	c23a                	sw	a4,4(sp)
     faa:	c03e                	sw	a5,0(sp)
     fac:	d206                	sw	ra,36(sp)
     fae:	d016                	sw	t0,32(sp)
     fb0:	ce1a                	sw	t1,28(sp)
     fb2:	cc1e                	sw	t2,24(sp)
     fb4:	ca2a                	sw	a0,20(sp)
     fb6:	c82e                	sw	a1,16(sp)
     fb8:	c632                	sw	a2,12(sp)
     fba:	c436                	sw	a3,8(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     fbc:	200607b7          	lui	a5,0x20060
     fc0:	4721                	li	a4,8
     fc2:	c3d8                	sw	a4,4(a5)
    fic_irq_dma_done();
     fc4:	dd6ff0ef          	jal	59a <fic_irq_dma_done>
}
     fc8:	5092                	lw	ra,36(sp)
     fca:	5282                	lw	t0,32(sp)
     fcc:	4372                	lw	t1,28(sp)
     fce:	43e2                	lw	t2,24(sp)
     fd0:	4552                	lw	a0,20(sp)
     fd2:	45c2                	lw	a1,16(sp)
     fd4:	4632                	lw	a2,12(sp)
     fd6:	46a2                	lw	a3,8(sp)
     fd8:	4712                	lw	a4,4(sp)
     fda:	4782                	lw	a5,0(sp)
     fdc:	02810113          	addi	sp,sp,40
     fe0:	30200073          	mret
     fe4:	0001                	nop
	...

00000fe8 <handler_irq_fast_dma_window>:
{
     fe8:	fd810113          	addi	sp,sp,-40
     fec:	c23a                	sw	a4,4(sp)
     fee:	c03e                	sw	a5,0(sp)
     ff0:	d206                	sw	ra,36(sp)
     ff2:	d016                	sw	t0,32(sp)
     ff4:	ce1a                	sw	t1,28(sp)
     ff6:	cc1e                	sw	t2,24(sp)
     ff8:	ca2a                	sw	a0,20(sp)
     ffa:	c82e                	sw	a1,16(sp)
     ffc:	c632                	sw	a2,12(sp)
     ffe:	c436                	sw	a3,8(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1000:	200607b7          	lui	a5,0x20060
    1004:	6711                	lui	a4,0x4
    1006:	c3d8                	sw	a4,4(a5)
    fic_irq_dma_window();
    1008:	d3eff0ef          	jal	546 <fic_irq_dma_window>
}
    100c:	5092                	lw	ra,36(sp)
    100e:	5282                	lw	t0,32(sp)
    1010:	4372                	lw	t1,28(sp)
    1012:	43e2                	lw	t2,24(sp)
    1014:	4552                	lw	a0,20(sp)
    1016:	45c2                	lw	a1,16(sp)
    1018:	4632                	lw	a2,12(sp)
    101a:	46a2                	lw	a3,8(sp)
    101c:	4712                	lw	a4,4(sp)
    101e:	4782                	lw	a5,0(sp)
    1020:	02810113          	addi	sp,sp,40
    1024:	30200073          	mret
    1028:	0001                	nop
	...

0000102c <handler_exception>:
  };
}

// Below functions are default weak exception handlers meant to be overriden
__attribute__((weak)) void handler_exception(void) {
    102c:	fd810113          	addi	sp,sp,-40
    1030:	d206                	sw	ra,36(sp)
    1032:	d016                	sw	t0,32(sp)
    1034:	ce1a                	sw	t1,28(sp)
    1036:	cc1e                	sw	t2,24(sp)
    1038:	ca2a                	sw	a0,20(sp)
    103a:	c82e                	sw	a1,16(sp)
    103c:	c632                	sw	a2,12(sp)
    103e:	c436                	sw	a3,8(sp)
    1040:	c23a                	sw	a4,4(sp)
    1042:	c03e                	sw	a5,0(sp)
  uint32_t mcause;
  exc_id_t exc_cause;

  CSR_READ(CSR_REG_MCAUSE, &mcause);
    1044:	342027f3          	csrr	a5,mcause
  exc_cause = (exc_id_t)(mcause & kIdMax);

  switch (exc_cause) {
    1048:	472d                	li	a4,11
  exc_cause = (exc_id_t)(mcause & kIdMax);
    104a:	8bfd                	andi	a5,a5,31
  switch (exc_cause) {
    104c:	00f76963          	bltu	a4,a5,105e <handler_exception+0x32>
    1050:	6729                	lui	a4,0xa
    1052:	50070713          	addi	a4,a4,1280 # a500 <spi_sdk.c.ee43b428+0x8cb>
    1056:	20e7c7b3          	sh2add	a5,a5,a4
    105a:	439c                	lw	a5,0(a5)
    105c:	8782                	jr	a5
      break;
    case kECall:
      handler_ecall();
      break;
    default:
      while (1) {
    105e:	a001                	j	105e <handler_exception+0x32>
__attribute__((weak)) void handler_bkpt(void) {
  print_exc_msg("Breakpoint triggerd, mtval shows the breakpoint address\n");
}

__attribute__((weak)) void handler_lsu_fault(void) {
  print_exc_msg("Load/Store fault, mtval shows the fault address\n");
    1060:	652d                	lui	a0,0xb
    1062:	80050513          	addi	a0,a0,-2048 # a800 <__clz_tab+0x224>
    1066:	3229                	jal	970 <print_exc_msg>
  print_exc_msg("Instruction access fault, mtval shows fault address\n");
    1068:	6529                	lui	a0,0xa
    106a:	75050513          	addi	a0,a0,1872 # a750 <__clz_tab+0x174>
    106e:	3209                	jal	970 <print_exc_msg>
  print_exc_msg( "Illegal Instruction fault, mtval shows instruction content\n");
    1070:	6529                	lui	a0,0xa
    1072:	78850513          	addi	a0,a0,1928 # a788 <__clz_tab+0x1ac>
    1076:	38ed                	jal	970 <print_exc_msg>
  print_exc_msg("Breakpoint triggerd, mtval shows the breakpoint address\n");
    1078:	6529                	lui	a0,0xa
    107a:	7c450513          	addi	a0,a0,1988 # a7c4 <__clz_tab+0x1e8>
    107e:	38cd                	jal	970 <print_exc_msg>
}

__attribute__((weak)) void handler_ecall(void) {
  _writestr("Environment call encountered\n");
    1080:	652d                	lui	a0,0xb
    1082:	83450513          	addi	a0,a0,-1996 # a834 <__clz_tab+0x258>
    1086:	38c9                	jal	958 <_writestr>
  while (1) {
    1088:	a001                	j	1088 <handler_exception+0x5c>
    108a:	0001                	nop

0000108c <handler_irq_software>:
__attribute__((weak)) void handler_irq_software(void) {
    108c:	fd810113          	addi	sp,sp,-40
    1090:	ca2a                	sw	a0,20(sp)
  _writestr("Software IRQ triggered!\n"); 
    1092:	652d                	lui	a0,0xb
    1094:	85450513          	addi	a0,a0,-1964 # a854 <__clz_tab+0x278>
__attribute__((weak)) void handler_irq_software(void) {
    1098:	d206                	sw	ra,36(sp)
    109a:	d016                	sw	t0,32(sp)
    109c:	ce1a                	sw	t1,28(sp)
    109e:	cc1e                	sw	t2,24(sp)
    10a0:	c82e                	sw	a1,16(sp)
    10a2:	c632                	sw	a2,12(sp)
    10a4:	c436                	sw	a3,8(sp)
    10a6:	c23a                	sw	a4,4(sp)
    10a8:	c03e                	sw	a5,0(sp)
  _writestr("Software IRQ triggered!\n"); 
    10aa:	307d                	jal	958 <_writestr>
  while (1) {
    10ac:	a001                	j	10ac <handler_irq_software+0x20>
	...

000010b0 <handler_irq_timer>:
__attribute__((weak)) void handler_irq_timer(void) {
    10b0:	fd810113          	addi	sp,sp,-40
    10b4:	ca2a                	sw	a0,20(sp)
  _writestr("Timer IRQ triggered!\n"); 
    10b6:	652d                	lui	a0,0xb
    10b8:	87050513          	addi	a0,a0,-1936 # a870 <__clz_tab+0x294>
__attribute__((weak)) void handler_irq_timer(void) {
    10bc:	d206                	sw	ra,36(sp)
    10be:	d016                	sw	t0,32(sp)
    10c0:	ce1a                	sw	t1,28(sp)
    10c2:	cc1e                	sw	t2,24(sp)
    10c4:	c82e                	sw	a1,16(sp)
    10c6:	c632                	sw	a2,12(sp)
    10c8:	c436                	sw	a3,8(sp)
    10ca:	c23a                	sw	a4,4(sp)
    10cc:	c03e                	sw	a5,0(sp)
  _writestr("Timer IRQ triggered!\n"); 
    10ce:	3069                	jal	958 <_writestr>
  while (1) {
    10d0:	a001                	j	10d0 <handler_irq_timer+0x20>

000010d2 <init>:
#endif

int init()
{
    return 0;
}
    10d2:	4501                	li	a0,0
    10d4:	8082                	ret

000010d6 <_close>:
}
    10d6:	557d                	li	a0,-1
    10d8:	8082                	ret

000010da <_exit>:
  ((volatile uint32_t *)base.base)[offset / sizeof(uint32_t)] = value;
    10da:	200007b7          	lui	a5,0x20000
    10de:	c3c8                	sw	a0,4(a5)
  ((volatile uint8_t *)base.base)[offset / sizeof(uint8_t)] = value;
    10e0:	4705                	li	a4,1
    10e2:	00e78023          	sb	a4,0(a5) # 20000000 <_sp+0x1fff3a30>
    asm volatile("wfi");
    10e6:	10500073          	wfi

000010ea <_fstat>:
    st->st_mode = S_IFCHR;
    10ea:	6789                	lui	a5,0x2
    10ec:	c1dc                	sw	a5,4(a1)
}
    10ee:	4501                	li	a0,0
    10f0:	8082                	ret

000010f2 <_isatty>:
    return (file == STDOUT_FILENO);
    10f2:	157d                	addi	a0,a0,-1
}
    10f4:	00153513          	seqz	a0,a0
    10f8:	8082                	ret

000010fa <_lseek>:
}
    10fa:	4501                	li	a0,0
    10fc:	8082                	ret

000010fe <_read>:
}
    10fe:	4501                	li	a0,0
    1100:	8082                	ret

00001102 <_write_r>:
    return _write(fd,buf,cnt);
    1102:	852e                	mv	a0,a1
    1104:	85b2                	mv	a1,a2
    1106:	8636                	mv	a2,a3
    1108:	d28ff06f          	j	630 <_write>

0000110c <_sbrk>:

void *_sbrk(ptrdiff_t incr)
{
    char *old_brk = brk;

    if (__heap_start == __heap_end) {
    110c:	66b1                	lui	a3,0xc
    110e:	ba018793          	addi	a5,gp,-1120 # b5c4 <__BSS_END__>
    1112:	dc468693          	addi	a3,a3,-572 # bdc4 <__heap_end>
{
    1116:	872a                	mv	a4,a0
    if (__heap_start == __heap_end) {
    1118:	00d78e63          	beq	a5,a3,1134 <_sbrk+0x28>
    char *old_brk = brk;
    111c:	9441a503          	lw	a0,-1724(gp) # b368 <brk>
        return NULL; 
    }

    if (brk + incr < __heap_end && brk + incr >= __heap_start) {
    1120:	972a                	add	a4,a4,a0
    1122:	00f76763          	bltu	a4,a5,1130 <_sbrk+0x24>
    1126:	00d77563          	bgeu	a4,a3,1130 <_sbrk+0x24>
        brk += incr;
    112a:	94e1a223          	sw	a4,-1724(gp) # b368 <brk>
    } else {
        return (void *)-1; 
    }
    return old_brk;
    112e:	8082                	ret
        return (void *)-1; 
    1130:	557d                	li	a0,-1
}
    1132:	8082                	ret
        return NULL; 
    1134:	4501                	li	a0,0
    1136:	8082                	ret

00001138 <atexit>:
    1138:	85aa                	mv	a1,a0
    113a:	4681                	li	a3,0
    113c:	4601                	li	a2,0
    113e:	4501                	li	a0,0
    1140:	a63d                	j	146e <__register_exitproc>

00001142 <std>:
    1142:	1161                	addi	sp,sp,-8
    1144:	c022                	sw	s0,0(sp)
    1146:	c206                	sw	ra,4(sp)
    1148:	842a                	mv	s0,a0
    114a:	00b51623          	sh	a1,12(a0)
    114e:	00c51723          	sh	a2,14(a0)
    1152:	00052023          	sw	zero,0(a0)
    1156:	00052223          	sw	zero,4(a0)
    115a:	00052423          	sw	zero,8(a0)
    115e:	06052223          	sw	zero,100(a0)
    1162:	00052823          	sw	zero,16(a0)
    1166:	00052a23          	sw	zero,20(a0)
    116a:	00052c23          	sw	zero,24(a0)
    116e:	4621                	li	a2,8
    1170:	4581                	li	a1,0
    1172:	05c50513          	addi	a0,a0,92
    1176:	24e5                	jal	145e <memset>
    1178:	6785                	lui	a5,0x1
    117a:	28a78793          	addi	a5,a5,650 # 128a <__sread>
    117e:	d05c                	sw	a5,36(s0)
    1180:	6785                	lui	a5,0x1
    1182:	2ba78793          	addi	a5,a5,698 # 12ba <__swrite>
    1186:	d41c                	sw	a5,40(s0)
    1188:	6785                	lui	a5,0x1
    118a:	30078793          	addi	a5,a5,768 # 1300 <__sseek>
    118e:	d45c                	sw	a5,44(s0)
    1190:	6785                	lui	a5,0x1
    1192:	33a78793          	addi	a5,a5,826 # 133a <__sclose>
    1196:	4092                	lw	ra,4(sp)
    1198:	d000                	sw	s0,32(s0)
    119a:	d81c                	sw	a5,48(s0)
    119c:	4402                	lw	s0,0(sp)
    119e:	0121                	addi	sp,sp,8
    11a0:	8082                	ret

000011a2 <stdio_exit_handler>:
    11a2:	6589                	lui	a1,0x2
    11a4:	8d818613          	addi	a2,gp,-1832 # b2fc <__sglue>
    11a8:	8bc58593          	addi	a1,a1,-1860 # 18bc <_fflush_r>
    11ac:	8e418513          	addi	a0,gp,-1820 # b308 <_impure_data>
    11b0:	a059                	j	1236 <_fwalk_sglue>

000011b2 <cleanup_stdio>:
    11b2:	414c                	lw	a1,4(a0)
    11b4:	1161                	addi	sp,sp,-8
    11b6:	c022                	sw	s0,0(sp)
    11b8:	c206                	sw	ra,4(sp)
    11ba:	9a018793          	addi	a5,gp,-1632 # b3c4 <__sf>
    11be:	842a                	mv	s0,a0
    11c0:	00f58363          	beq	a1,a5,11c6 <cleanup_stdio+0x14>
    11c4:	2de5                	jal	18bc <_fflush_r>
    11c6:	440c                	lw	a1,8(s0)
    11c8:	a0818793          	addi	a5,gp,-1528 # b42c <__sf+0x68>
    11cc:	00f58463          	beq	a1,a5,11d4 <cleanup_stdio+0x22>
    11d0:	8522                	mv	a0,s0
    11d2:	25ed                	jal	18bc <_fflush_r>
    11d4:	444c                	lw	a1,12(s0)
    11d6:	a7018793          	addi	a5,gp,-1424 # b494 <__sf+0xd0>
    11da:	00f58763          	beq	a1,a5,11e8 <cleanup_stdio+0x36>
    11de:	8522                	mv	a0,s0
    11e0:	4402                	lw	s0,0(sp)
    11e2:	4092                	lw	ra,4(sp)
    11e4:	0121                	addi	sp,sp,8
    11e6:	add9                	j	18bc <_fflush_r>
    11e8:	4092                	lw	ra,4(sp)
    11ea:	4402                	lw	s0,0(sp)
    11ec:	0121                	addi	sp,sp,8
    11ee:	8082                	ret

000011f0 <global_stdio_init.part.0>:
    11f0:	6785                	lui	a5,0x1
    11f2:	1171                	addi	sp,sp,-4
    11f4:	1a278793          	addi	a5,a5,418 # 11a2 <stdio_exit_handler>
    11f8:	4601                	li	a2,0
    11fa:	4591                	li	a1,4
    11fc:	9a018513          	addi	a0,gp,-1632 # b3c4 <__sf>
    1200:	c006                	sw	ra,0(sp)
    1202:	94f1a623          	sw	a5,-1716(gp) # b370 <__stdio_exit_handler>
    1206:	3f35                	jal	1142 <std>
    1208:	4605                	li	a2,1
    120a:	45a5                	li	a1,9
    120c:	a0818513          	addi	a0,gp,-1528 # b42c <__sf+0x68>
    1210:	3f0d                	jal	1142 <std>
    1212:	4082                	lw	ra,0(sp)
    1214:	4609                	li	a2,2
    1216:	45c9                	li	a1,18
    1218:	a7018513          	addi	a0,gp,-1424 # b494 <__sf+0xd0>
    121c:	0111                	addi	sp,sp,4
    121e:	b715                	j	1142 <std>

00001220 <__sinit>:
    1220:	511c                	lw	a5,32(a0)
    1222:	eb89                	bnez	a5,1234 <__sinit+0x14>
    1224:	6785                	lui	a5,0x1
    1226:	1b278793          	addi	a5,a5,434 # 11b2 <cleanup_stdio>
    122a:	d11c                	sw	a5,32(a0)
    122c:	94c1a783          	lw	a5,-1716(gp) # b370 <__stdio_exit_handler>
    1230:	e391                	bnez	a5,1234 <__sinit+0x14>
    1232:	bf7d                	j	11f0 <global_stdio_init.part.0>
    1234:	8082                	ret

00001236 <_fwalk_sglue>:
    1236:	1111                	addi	sp,sp,-28
    1238:	ca22                	sw	s0,20(sp)
    123a:	c826                	sw	s1,16(sp)
    123c:	cc06                	sw	ra,24(sp)
    123e:	c02a                	sw	a0,0(sp)
    1240:	c22e                	sw	a1,4(sp)
    1242:	8432                	mv	s0,a2
    1244:	4481                	li	s1,0
    1246:	440c                	lw	a1,8(s0)
    1248:	405c                	lw	a5,4(s0)
    124a:	17fd                	addi	a5,a5,-1
    124c:	0007da63          	bgez	a5,1260 <_fwalk_sglue+0x2a>
    1250:	4000                	lw	s0,0(s0)
    1252:	f875                	bnez	s0,1246 <_fwalk_sglue+0x10>
    1254:	40e2                	lw	ra,24(sp)
    1256:	4452                	lw	s0,20(sp)
    1258:	8526                	mv	a0,s1
    125a:	44c2                	lw	s1,16(sp)
    125c:	0171                	addi	sp,sp,28
    125e:	8082                	ret
    1260:	00c5d683          	lhu	a3,12(a1)
    1264:	4705                	li	a4,1
    1266:	00d77f63          	bgeu	a4,a3,1284 <_fwalk_sglue+0x4e>
    126a:	00e59683          	lh	a3,14(a1)
    126e:	577d                	li	a4,-1
    1270:	00e68a63          	beq	a3,a4,1284 <_fwalk_sglue+0x4e>
    1274:	c63e                	sw	a5,12(sp)
    1276:	4502                	lw	a0,0(sp)
    1278:	4792                	lw	a5,4(sp)
    127a:	c42e                	sw	a1,8(sp)
    127c:	9782                	jalr	a5
    127e:	47b2                	lw	a5,12(sp)
    1280:	45a2                	lw	a1,8(sp)
    1282:	8cc9                	or	s1,s1,a0
    1284:	06858593          	addi	a1,a1,104
    1288:	b7c9                	j	124a <_fwalk_sglue+0x14>

0000128a <__sread>:
    128a:	1161                	addi	sp,sp,-8
    128c:	c022                	sw	s0,0(sp)
    128e:	842e                	mv	s0,a1
    1290:	00e59583          	lh	a1,14(a1)
    1294:	c206                	sw	ra,4(sp)
    1296:	2209                	jal	1398 <_read_r>
    1298:	00054963          	bltz	a0,12aa <__sread+0x20>
    129c:	487c                	lw	a5,84(s0)
    129e:	97aa                	add	a5,a5,a0
    12a0:	c87c                	sw	a5,84(s0)
    12a2:	4092                	lw	ra,4(sp)
    12a4:	4402                	lw	s0,0(sp)
    12a6:	0121                	addi	sp,sp,8
    12a8:	8082                	ret
    12aa:	00c45783          	lhu	a5,12(s0)
    12ae:	777d                	lui	a4,0xfffff
    12b0:	177d                	addi	a4,a4,-1 # ffffefff <_sp+0xffff2a2f>
    12b2:	8ff9                	and	a5,a5,a4
    12b4:	00f41623          	sh	a5,12(s0)
    12b8:	b7ed                	j	12a2 <__sread+0x18>

000012ba <__swrite>:
    12ba:	00c5d783          	lhu	a5,12(a1)
    12be:	1131                	addi	sp,sp,-20
    12c0:	c622                	sw	s0,12(sp)
    12c2:	c426                	sw	s1,8(sp)
    12c4:	c806                	sw	ra,16(sp)
    12c6:	c032                	sw	a2,0(sp)
    12c8:	c236                	sw	a3,4(sp)
    12ca:	1007f793          	andi	a5,a5,256
    12ce:	84aa                	mv	s1,a0
    12d0:	842e                	mv	s0,a1
    12d2:	c791                	beqz	a5,12de <__swrite+0x24>
    12d4:	00e59583          	lh	a1,14(a1)
    12d8:	4689                	li	a3,2
    12da:	4601                	li	a2,0
    12dc:	2079                	jal	136a <_lseek_r>
    12de:	00c45783          	lhu	a5,12(s0)
    12e2:	777d                	lui	a4,0xfffff
    12e4:	177d                	addi	a4,a4,-1 # ffffefff <_sp+0xffff2a2f>
    12e6:	8ff9                	and	a5,a5,a4
    12e8:	00e41583          	lh	a1,14(s0)
    12ec:	00f41623          	sh	a5,12(s0)
    12f0:	4432                	lw	s0,12(sp)
    12f2:	4692                	lw	a3,4(sp)
    12f4:	4602                	lw	a2,0(sp)
    12f6:	40c2                	lw	ra,16(sp)
    12f8:	8526                	mv	a0,s1
    12fa:	44a2                	lw	s1,8(sp)
    12fc:	0151                	addi	sp,sp,20
    12fe:	b511                	j	1102 <_write_r>

00001300 <__sseek>:
    1300:	1161                	addi	sp,sp,-8
    1302:	c022                	sw	s0,0(sp)
    1304:	842e                	mv	s0,a1
    1306:	00e59583          	lh	a1,14(a1)
    130a:	c206                	sw	ra,4(sp)
    130c:	28b9                	jal	136a <_lseek_r>
    130e:	577d                	li	a4,-1
    1310:	00c41783          	lh	a5,12(s0)
    1314:	00e51d63          	bne	a0,a4,132e <__sseek+0x2e>
    1318:	80050713          	addi	a4,a0,-2048
    131c:	80070713          	addi	a4,a4,-2048
    1320:	8ff9                	and	a5,a5,a4
    1322:	00f41623          	sh	a5,12(s0)
    1326:	4092                	lw	ra,4(sp)
    1328:	4402                	lw	s0,0(sp)
    132a:	0121                	addi	sp,sp,8
    132c:	8082                	ret
    132e:	6705                	lui	a4,0x1
    1330:	8fd9                	or	a5,a5,a4
    1332:	00f41623          	sh	a5,12(s0)
    1336:	c868                	sw	a0,84(s0)
    1338:	b7fd                	j	1326 <__sseek+0x26>

0000133a <__sclose>:
    133a:	00e59583          	lh	a1,14(a1)
    133e:	a009                	j	1340 <_close_r>

00001340 <_close_r>:
    1340:	1151                	addi	sp,sp,-12
    1342:	c222                	sw	s0,4(sp)
    1344:	c026                	sw	s1,0(sp)
    1346:	84aa                	mv	s1,a0
    1348:	852e                	mv	a0,a1
    134a:	c406                	sw	ra,8(sp)
    134c:	9401a823          	sw	zero,-1712(gp) # b374 <errno>
    1350:	3359                	jal	10d6 <_close>
    1352:	57fd                	li	a5,-1
    1354:	00f51663          	bne	a0,a5,1360 <_close_r+0x20>
    1358:	9501a783          	lw	a5,-1712(gp) # b374 <errno>
    135c:	c391                	beqz	a5,1360 <_close_r+0x20>
    135e:	c09c                	sw	a5,0(s1)
    1360:	40a2                	lw	ra,8(sp)
    1362:	4412                	lw	s0,4(sp)
    1364:	4482                	lw	s1,0(sp)
    1366:	0131                	addi	sp,sp,12
    1368:	8082                	ret

0000136a <_lseek_r>:
    136a:	1151                	addi	sp,sp,-12
    136c:	c222                	sw	s0,4(sp)
    136e:	c026                	sw	s1,0(sp)
    1370:	84aa                	mv	s1,a0
    1372:	852e                	mv	a0,a1
    1374:	85b2                	mv	a1,a2
    1376:	8636                	mv	a2,a3
    1378:	c406                	sw	ra,8(sp)
    137a:	9401a823          	sw	zero,-1712(gp) # b374 <errno>
    137e:	3bb5                	jal	10fa <_lseek>
    1380:	57fd                	li	a5,-1
    1382:	00f51663          	bne	a0,a5,138e <_lseek_r+0x24>
    1386:	9501a783          	lw	a5,-1712(gp) # b374 <errno>
    138a:	c391                	beqz	a5,138e <_lseek_r+0x24>
    138c:	c09c                	sw	a5,0(s1)
    138e:	40a2                	lw	ra,8(sp)
    1390:	4412                	lw	s0,4(sp)
    1392:	4482                	lw	s1,0(sp)
    1394:	0131                	addi	sp,sp,12
    1396:	8082                	ret

00001398 <_read_r>:
    1398:	1151                	addi	sp,sp,-12
    139a:	c222                	sw	s0,4(sp)
    139c:	c026                	sw	s1,0(sp)
    139e:	84aa                	mv	s1,a0
    13a0:	852e                	mv	a0,a1
    13a2:	85b2                	mv	a1,a2
    13a4:	8636                	mv	a2,a3
    13a6:	c406                	sw	ra,8(sp)
    13a8:	9401a823          	sw	zero,-1712(gp) # b374 <errno>
    13ac:	3b89                	jal	10fe <_read>
    13ae:	57fd                	li	a5,-1
    13b0:	00f51663          	bne	a0,a5,13bc <_read_r+0x24>
    13b4:	9501a783          	lw	a5,-1712(gp) # b374 <errno>
    13b8:	c391                	beqz	a5,13bc <_read_r+0x24>
    13ba:	c09c                	sw	a5,0(s1)
    13bc:	40a2                	lw	ra,8(sp)
    13be:	4412                	lw	s0,4(sp)
    13c0:	4482                	lw	s1,0(sp)
    13c2:	0131                	addi	sp,sp,12
    13c4:	8082                	ret

000013c6 <__libc_init_array>:
    13c6:	1151                	addi	sp,sp,-12
    13c8:	c222                	sw	s0,4(sp)
    13ca:	67ad                	lui	a5,0xb
    13cc:	642d                	lui	s0,0xb
    13ce:	22478793          	addi	a5,a5,548 # b224 <peripherals>
    13d2:	22440413          	addi	s0,s0,548 # b224 <peripherals>
    13d6:	8c1d                	sub	s0,s0,a5
    13d8:	c026                	sw	s1,0(sp)
    13da:	c406                	sw	ra,8(sp)
    13dc:	8409                	srai	s0,s0,0x2
    13de:	4481                	li	s1,0
    13e0:	02849263          	bne	s1,s0,1404 <__libc_init_array+0x3e>
    13e4:	67ad                	lui	a5,0xb
    13e6:	642d                	lui	s0,0xb
    13e8:	22478793          	addi	a5,a5,548 # b224 <peripherals>
    13ec:	22440413          	addi	s0,s0,548 # b224 <peripherals>
    13f0:	8c1d                	sub	s0,s0,a5
    13f2:	8409                	srai	s0,s0,0x2
    13f4:	4481                	li	s1,0
    13f6:	02849163          	bne	s1,s0,1418 <__libc_init_array+0x52>
    13fa:	40a2                	lw	ra,8(sp)
    13fc:	4412                	lw	s0,4(sp)
    13fe:	4482                	lw	s1,0(sp)
    1400:	0131                	addi	sp,sp,12
    1402:	8082                	ret
    1404:	00249713          	slli	a4,s1,0x2
    1408:	973e                	add	a4,a4,a5
    140a:	4318                	lw	a4,0(a4)
    140c:	0485                	addi	s1,s1,1
    140e:	9702                	jalr	a4
    1410:	67ad                	lui	a5,0xb
    1412:	22478793          	addi	a5,a5,548 # b224 <peripherals>
    1416:	b7e9                	j	13e0 <__libc_init_array+0x1a>
    1418:	00249713          	slli	a4,s1,0x2
    141c:	973e                	add	a4,a4,a5
    141e:	4318                	lw	a4,0(a4)
    1420:	0485                	addi	s1,s1,1
    1422:	9702                	jalr	a4
    1424:	67ad                	lui	a5,0xb
    1426:	22478793          	addi	a5,a5,548 # b224 <peripherals>
    142a:	b7f1                	j	13f6 <__libc_init_array+0x30>

0000142c <__libc_fini_array>:
    142c:	1151                	addi	sp,sp,-12
    142e:	c222                	sw	s0,4(sp)
    1430:	c026                	sw	s1,0(sp)
    1432:	642d                	lui	s0,0xb
    1434:	64ad                	lui	s1,0xb
    1436:	22448493          	addi	s1,s1,548 # b224 <peripherals>
    143a:	22440413          	addi	s0,s0,548 # b224 <peripherals>
    143e:	8c05                	sub	s0,s0,s1
    1440:	c406                	sw	ra,8(sp)
    1442:	8409                	srai	s0,s0,0x2
    1444:	e411                	bnez	s0,1450 <__libc_fini_array+0x24>
    1446:	40a2                	lw	ra,8(sp)
    1448:	4412                	lw	s0,4(sp)
    144a:	4482                	lw	s1,0(sp)
    144c:	0131                	addi	sp,sp,12
    144e:	8082                	ret
    1450:	147d                	addi	s0,s0,-1
    1452:	00241793          	slli	a5,s0,0x2
    1456:	97a6                	add	a5,a5,s1
    1458:	439c                	lw	a5,0(a5)
    145a:	9782                	jalr	a5
    145c:	b7e5                	j	1444 <__libc_fini_array+0x18>

0000145e <memset>:
    145e:	832a                	mv	t1,a0
    1460:	c611                	beqz	a2,146c <memset+0xe>
    1462:	00b30023          	sb	a1,0(t1)
    1466:	167d                	addi	a2,a2,-1 # 7fffffff <_sp+0x7fff3a2f>
    1468:	0305                	addi	t1,t1,1
    146a:	fe65                	bnez	a2,1462 <memset+0x4>
    146c:	8082                	ret

0000146e <__register_exitproc>:
    146e:	9541a783          	lw	a5,-1708(gp) # b378 <__atexit>
    1472:	ef89                	bnez	a5,148c <__register_exitproc+0x1e>
    1474:	ad818793          	addi	a5,gp,-1320 # b4fc <__atexit0>
    1478:	94f1aa23          	sw	a5,-1708(gp) # b378 <__atexit>
    147c:	00000313          	li	t1,0
    1480:	00030663          	beqz	t1,148c <__register_exitproc+0x1e>
    1484:	00002703          	lw	a4,0(zero) # 0 <__vector_start>
    1488:	08e7a423          	sw	a4,136(a5)
    148c:	43d8                	lw	a4,4(a5)
    148e:	437d                	li	t1,31
    1490:	52fd                	li	t0,-1
    1492:	04e34663          	blt	t1,a4,14de <__register_exitproc+0x70>
    1496:	cd0d                	beqz	a0,14d0 <__register_exitproc+0x62>
    1498:	0887a303          	lw	t1,136(a5)
    149c:	04030163          	beqz	t1,14de <__register_exitproc+0x70>
    14a0:	00271293          	slli	t0,a4,0x2
    14a4:	929a                	add	t0,t0,t1
    14a6:	00c2a023          	sw	a2,0(t0)
    14aa:	10032383          	lw	t2,256(t1)
    14ae:	4605                	li	a2,1
    14b0:	00e61633          	sll	a2,a2,a4
    14b4:	00c3e3b3          	or	t2,t2,a2
    14b8:	10732023          	sw	t2,256(t1)
    14bc:	08d2a023          	sw	a3,128(t0)
    14c0:	4689                	li	a3,2
    14c2:	00d51763          	bne	a0,a3,14d0 <__register_exitproc+0x62>
    14c6:	10432683          	lw	a3,260(t1)
    14ca:	8ed1                	or	a3,a3,a2
    14cc:	10d32223          	sw	a3,260(t1)
    14d0:	00170693          	addi	a3,a4,1 # 1001 <handler_irq_fast_dma_window+0x19>
    14d4:	070a                	slli	a4,a4,0x2
    14d6:	c3d4                	sw	a3,4(a5)
    14d8:	97ba                	add	a5,a5,a4
    14da:	c78c                	sw	a1,8(a5)
    14dc:	4281                	li	t0,0
    14de:	8516                	mv	a0,t0
    14e0:	8082                	ret

000014e2 <__call_exitprocs>:
    14e2:	1101                	addi	sp,sp,-32
    14e4:	ce06                	sw	ra,28(sp)
    14e6:	cc22                	sw	s0,24(sp)
    14e8:	ca26                	sw	s1,20(sp)
    14ea:	c42a                	sw	a0,8(sp)
    14ec:	c02e                	sw	a1,0(sp)
    14ee:	9541a783          	lw	a5,-1708(gp) # b378 <__atexit>
    14f2:	cb91                	beqz	a5,1506 <__call_exitprocs+0x24>
    14f4:	43c0                	lw	s0,4(a5)
    14f6:	0887a683          	lw	a3,136(a5)
    14fa:	fff40493          	addi	s1,s0,-1
    14fe:	040a                	slli	s0,s0,0x2
    1500:	943e                	add	s0,s0,a5
    1502:	0004d763          	bgez	s1,1510 <__call_exitprocs+0x2e>
    1506:	40f2                	lw	ra,28(sp)
    1508:	4462                	lw	s0,24(sp)
    150a:	44d2                	lw	s1,20(sp)
    150c:	6105                	addi	sp,sp,32
    150e:	8082                	ret
    1510:	4702                	lw	a4,0(sp)
    1512:	cf09                	beqz	a4,152c <__call_exitprocs+0x4a>
    1514:	e681                	bnez	a3,151c <__call_exitprocs+0x3a>
    1516:	14fd                	addi	s1,s1,-1
    1518:	1471                	addi	s0,s0,-4
    151a:	b7e5                	j	1502 <__call_exitprocs+0x20>
    151c:	00249613          	slli	a2,s1,0x2
    1520:	9636                	add	a2,a2,a3
    1522:	08062603          	lw	a2,128(a2)
    1526:	4702                	lw	a4,0(sp)
    1528:	fee617e3          	bne	a2,a4,1516 <__call_exitprocs+0x34>
    152c:	43d0                	lw	a2,4(a5)
    152e:	00442303          	lw	t1,4(s0)
    1532:	167d                	addi	a2,a2,-1
    1534:	02961d63          	bne	a2,s1,156e <__call_exitprocs+0x8c>
    1538:	c3c4                	sw	s1,4(a5)
    153a:	fc030ee3          	beqz	t1,1516 <__call_exitprocs+0x34>
    153e:	43d8                	lw	a4,4(a5)
    1540:	c23a                	sw	a4,4(sp)
    1542:	ca81                	beqz	a3,1552 <__call_exitprocs+0x70>
    1544:	1006a583          	lw	a1,256(a3)
    1548:	4605                	li	a2,1
    154a:	00961633          	sll	a2,a2,s1
    154e:	8df1                	and	a1,a1,a2
    1550:	e195                	bnez	a1,1574 <__call_exitprocs+0x92>
    1552:	c836                	sw	a3,16(sp)
    1554:	c63e                	sw	a5,12(sp)
    1556:	9302                	jalr	t1
    1558:	47b2                	lw	a5,12(sp)
    155a:	46c2                	lw	a3,16(sp)
    155c:	43d0                	lw	a2,4(a5)
    155e:	4712                	lw	a4,4(sp)
    1560:	f8e617e3          	bne	a2,a4,14ee <__call_exitprocs+0xc>
    1564:	9541a603          	lw	a2,-1708(gp) # b378 <__atexit>
    1568:	fac787e3          	beq	a5,a2,1516 <__call_exitprocs+0x34>
    156c:	b749                	j	14ee <__call_exitprocs+0xc>
    156e:	00042223          	sw	zero,4(s0)
    1572:	b7e1                	j	153a <__call_exitprocs+0x58>
    1574:	1046a503          	lw	a0,260(a3)
    1578:	00249593          	slli	a1,s1,0x2
    157c:	95b6                	add	a1,a1,a3
    157e:	8e69                	and	a2,a2,a0
    1580:	c836                	sw	a3,16(sp)
    1582:	c63e                	sw	a5,12(sp)
    1584:	418c                	lw	a1,0(a1)
    1586:	e601                	bnez	a2,158e <__call_exitprocs+0xac>
    1588:	4522                	lw	a0,8(sp)
    158a:	9302                	jalr	t1
    158c:	b7f1                	j	1558 <__call_exitprocs+0x76>
    158e:	852e                	mv	a0,a1
    1590:	9302                	jalr	t1
    1592:	46c2                	lw	a3,16(sp)
    1594:	47b2                	lw	a5,12(sp)
    1596:	b7d9                	j	155c <__call_exitprocs+0x7a>

00001598 <_free_r>:
    1598:	cdd1                	beqz	a1,1634 <_free_r+0x9c>
    159a:	ffc5a783          	lw	a5,-4(a1)
    159e:	1151                	addi	sp,sp,-12
    15a0:	c222                	sw	s0,4(sp)
    15a2:	c406                	sw	ra,8(sp)
    15a4:	ffc58413          	addi	s0,a1,-4
    15a8:	0007d363          	bgez	a5,15ae <_free_r+0x16>
    15ac:	943e                	add	s0,s0,a5
    15ae:	c02a                	sw	a0,0(sp)
    15b0:	2af1                	jal	178c <__malloc_lock>
    15b2:	95c1a783          	lw	a5,-1700(gp) # b380 <__malloc_free_list>
    15b6:	4502                	lw	a0,0(sp)
    15b8:	eb89                	bnez	a5,15ca <_free_r+0x32>
    15ba:	00042223          	sw	zero,4(s0)
    15be:	9481ae23          	sw	s0,-1700(gp) # b380 <__malloc_free_list>
    15c2:	4412                	lw	s0,4(sp)
    15c4:	40a2                	lw	ra,8(sp)
    15c6:	0131                	addi	sp,sp,12
    15c8:	a2d9                	j	178e <__malloc_unlock>
    15ca:	00f47d63          	bgeu	s0,a5,15e4 <_free_r+0x4c>
    15ce:	4010                	lw	a2,0(s0)
    15d0:	00c406b3          	add	a3,s0,a2
    15d4:	00d79663          	bne	a5,a3,15e0 <_free_r+0x48>
    15d8:	4394                	lw	a3,0(a5)
    15da:	43dc                	lw	a5,4(a5)
    15dc:	96b2                	add	a3,a3,a2
    15de:	c014                	sw	a3,0(s0)
    15e0:	c05c                	sw	a5,4(s0)
    15e2:	bff1                	j	15be <_free_r+0x26>
    15e4:	873e                	mv	a4,a5
    15e6:	43dc                	lw	a5,4(a5)
    15e8:	c399                	beqz	a5,15ee <_free_r+0x56>
    15ea:	fef47de3          	bgeu	s0,a5,15e4 <_free_r+0x4c>
    15ee:	4314                	lw	a3,0(a4)
    15f0:	00d70633          	add	a2,a4,a3
    15f4:	00861f63          	bne	a2,s0,1612 <_free_r+0x7a>
    15f8:	4010                	lw	a2,0(s0)
    15fa:	96b2                	add	a3,a3,a2
    15fc:	c314                	sw	a3,0(a4)
    15fe:	00d70633          	add	a2,a4,a3
    1602:	fcc790e3          	bne	a5,a2,15c2 <_free_r+0x2a>
    1606:	4390                	lw	a2,0(a5)
    1608:	43dc                	lw	a5,4(a5)
    160a:	96b2                	add	a3,a3,a2
    160c:	c314                	sw	a3,0(a4)
    160e:	c35c                	sw	a5,4(a4)
    1610:	bf4d                	j	15c2 <_free_r+0x2a>
    1612:	00c47563          	bgeu	s0,a2,161c <_free_r+0x84>
    1616:	47b1                	li	a5,12
    1618:	c11c                	sw	a5,0(a0)
    161a:	b765                	j	15c2 <_free_r+0x2a>
    161c:	4010                	lw	a2,0(s0)
    161e:	00c406b3          	add	a3,s0,a2
    1622:	00d79663          	bne	a5,a3,162e <_free_r+0x96>
    1626:	4394                	lw	a3,0(a5)
    1628:	43dc                	lw	a5,4(a5)
    162a:	96b2                	add	a3,a3,a2
    162c:	c014                	sw	a3,0(s0)
    162e:	c05c                	sw	a5,4(s0)
    1630:	c340                	sw	s0,4(a4)
    1632:	bf41                	j	15c2 <_free_r+0x2a>
    1634:	8082                	ret

00001636 <sbrk_aligned>:
    1636:	1141                	addi	sp,sp,-16
    1638:	c226                	sw	s1,4(sp)
    163a:	9581a783          	lw	a5,-1704(gp) # b37c <__malloc_sbrk_start>
    163e:	c422                	sw	s0,8(sp)
    1640:	c606                	sw	ra,12(sp)
    1642:	c02a                	sw	a0,0(sp)
    1644:	842e                	mv	s0,a1
    1646:	e789                	bnez	a5,1650 <sbrk_aligned+0x1a>
    1648:	4581                	li	a1,0
    164a:	2465                	jal	18f2 <_sbrk_r>
    164c:	94a1ac23          	sw	a0,-1704(gp) # b37c <__malloc_sbrk_start>
    1650:	4502                	lw	a0,0(sp)
    1652:	85a2                	mv	a1,s0
    1654:	54fd                	li	s1,-1
    1656:	2c71                	jal	18f2 <_sbrk_r>
    1658:	00951963          	bne	a0,s1,166a <sbrk_aligned+0x34>
    165c:	547d                	li	s0,-1
    165e:	40b2                	lw	ra,12(sp)
    1660:	8522                	mv	a0,s0
    1662:	4422                	lw	s0,8(sp)
    1664:	4492                	lw	s1,4(sp)
    1666:	0141                	addi	sp,sp,16
    1668:	8082                	ret
    166a:	00350413          	addi	s0,a0,3
    166e:	9871                	andi	s0,s0,-4
    1670:	fe8507e3          	beq	a0,s0,165e <sbrk_aligned+0x28>
    1674:	40a405b3          	sub	a1,s0,a0
    1678:	4502                	lw	a0,0(sp)
    167a:	2ca5                	jal	18f2 <_sbrk_r>
    167c:	fe9511e3          	bne	a0,s1,165e <sbrk_aligned+0x28>
    1680:	bff1                	j	165c <sbrk_aligned+0x26>

00001682 <_malloc_r>:
    1682:	00358793          	addi	a5,a1,3
    1686:	1131                	addi	sp,sp,-20
    1688:	9bf1                	andi	a5,a5,-4
    168a:	c426                	sw	s1,8(sp)
    168c:	c806                	sw	ra,16(sp)
    168e:	c622                	sw	s0,12(sp)
    1690:	00878493          	addi	s1,a5,8
    1694:	4731                	li	a4,12
    1696:	00e4f363          	bgeu	s1,a4,169c <_malloc_r+0x1a>
    169a:	84ba                	mv	s1,a4
    169c:	0004c463          	bltz	s1,16a4 <_malloc_r+0x22>
    16a0:	00b4fa63          	bgeu	s1,a1,16b4 <_malloc_r+0x32>
    16a4:	47b1                	li	a5,12
    16a6:	c11c                	sw	a5,0(a0)
    16a8:	4501                	li	a0,0
    16aa:	40c2                	lw	ra,16(sp)
    16ac:	4432                	lw	s0,12(sp)
    16ae:	44a2                	lw	s1,8(sp)
    16b0:	0151                	addi	sp,sp,20
    16b2:	8082                	ret
    16b4:	c02a                	sw	a0,0(sp)
    16b6:	28d9                	jal	178c <__malloc_lock>
    16b8:	95c1a683          	lw	a3,-1700(gp) # b380 <__malloc_free_list>
    16bc:	8436                	mv	s0,a3
    16be:	e821                	bnez	s0,170e <_malloc_r+0x8c>
    16c0:	4502                	lw	a0,0(sp)
    16c2:	85a6                	mv	a1,s1
    16c4:	3f8d                	jal	1636 <sbrk_aligned>
    16c6:	56fd                	li	a3,-1
    16c8:	842a                	mv	s0,a0
    16ca:	0ad51f63          	bne	a0,a3,1788 <_malloc_r+0x106>
    16ce:	95c1a403          	lw	s0,-1700(gp) # b380 <__malloc_free_list>
    16d2:	86a2                	mv	a3,s0
    16d4:	ead1                	bnez	a3,1768 <_malloc_r+0xe6>
    16d6:	c05d                	beqz	s0,177c <_malloc_r+0xfa>
    16d8:	4014                	lw	a3,0(s0)
    16da:	4502                	lw	a0,0(sp)
    16dc:	4581                	li	a1,0
    16de:	96a2                	add	a3,a3,s0
    16e0:	c236                	sw	a3,4(sp)
    16e2:	2c01                	jal	18f2 <_sbrk_r>
    16e4:	4692                	lw	a3,4(sp)
    16e6:	08a69b63          	bne	a3,a0,177c <_malloc_r+0xfa>
    16ea:	400c                	lw	a1,0(s0)
    16ec:	4502                	lw	a0,0(sp)
    16ee:	8c8d                	sub	s1,s1,a1
    16f0:	85a6                	mv	a1,s1
    16f2:	3791                	jal	1636 <sbrk_aligned>
    16f4:	57fd                	li	a5,-1
    16f6:	08f50363          	beq	a0,a5,177c <_malloc_r+0xfa>
    16fa:	401c                	lw	a5,0(s0)
    16fc:	97a6                	add	a5,a5,s1
    16fe:	c01c                	sw	a5,0(s0)
    1700:	95c1a783          	lw	a5,-1700(gp) # b380 <__malloc_free_list>
    1704:	43d4                	lw	a3,4(a5)
    1706:	e6a5                	bnez	a3,176e <_malloc_r+0xec>
    1708:	9401ae23          	sw	zero,-1700(gp) # b380 <__malloc_free_list>
    170c:	a015                	j	1730 <_malloc_r+0xae>
    170e:	400c                	lw	a1,0(s0)
    1710:	8d85                	sub	a1,a1,s1
    1712:	0405c863          	bltz	a1,1762 <_malloc_r+0xe0>
    1716:	462d                	li	a2,11
    1718:	02b67d63          	bgeu	a2,a1,1752 <_malloc_r+0xd0>
    171c:	c004                	sw	s1,0(s0)
    171e:	00940633          	add	a2,s0,s1
    1722:	02869663          	bne	a3,s0,174e <_malloc_r+0xcc>
    1726:	94c1ae23          	sw	a2,-1700(gp) # b380 <__malloc_free_list>
    172a:	405c                	lw	a5,4(s0)
    172c:	c20c                	sw	a1,0(a2)
    172e:	c25c                	sw	a5,4(a2)
    1730:	4502                	lw	a0,0(sp)
    1732:	28b1                	jal	178e <__malloc_unlock>
    1734:	00b40513          	addi	a0,s0,11
    1738:	00440793          	addi	a5,s0,4
    173c:	9961                	andi	a0,a0,-8
    173e:	40f50733          	sub	a4,a0,a5
    1742:	f6f504e3          	beq	a0,a5,16aa <_malloc_r+0x28>
    1746:	943a                	add	s0,s0,a4
    1748:	8f89                	sub	a5,a5,a0
    174a:	c01c                	sw	a5,0(s0)
    174c:	bfb9                	j	16aa <_malloc_r+0x28>
    174e:	c2d0                	sw	a2,4(a3)
    1750:	bfe9                	j	172a <_malloc_r+0xa8>
    1752:	405c                	lw	a5,4(s0)
    1754:	00869563          	bne	a3,s0,175e <_malloc_r+0xdc>
    1758:	94f1ae23          	sw	a5,-1700(gp) # b380 <__malloc_free_list>
    175c:	bfd1                	j	1730 <_malloc_r+0xae>
    175e:	c2dc                	sw	a5,4(a3)
    1760:	bfc1                	j	1730 <_malloc_r+0xae>
    1762:	86a2                	mv	a3,s0
    1764:	4040                	lw	s0,4(s0)
    1766:	bfa1                	j	16be <_malloc_r+0x3c>
    1768:	8436                	mv	s0,a3
    176a:	42d4                	lw	a3,4(a3)
    176c:	b7a5                	j	16d4 <_malloc_r+0x52>
    176e:	873e                	mv	a4,a5
    1770:	43dc                	lw	a5,4(a5)
    1772:	fe879ee3          	bne	a5,s0,176e <_malloc_r+0xec>
    1776:	00072223          	sw	zero,4(a4)
    177a:	bf5d                	j	1730 <_malloc_r+0xae>
    177c:	4702                	lw	a4,0(sp)
    177e:	47b1                	li	a5,12
    1780:	c31c                	sw	a5,0(a4)
    1782:	853a                	mv	a0,a4
    1784:	2029                	jal	178e <__malloc_unlock>
    1786:	b70d                	j	16a8 <_malloc_r+0x26>
    1788:	c104                	sw	s1,0(a0)
    178a:	b75d                	j	1730 <_malloc_r+0xae>

0000178c <__malloc_lock>:
    178c:	8082                	ret

0000178e <__malloc_unlock>:
    178e:	8082                	ret

00001790 <__sflush_r>:
    1790:	00c59703          	lh	a4,12(a1)
    1794:	1131                	addi	sp,sp,-20
    1796:	c622                	sw	s0,12(sp)
    1798:	c806                	sw	ra,16(sp)
    179a:	c426                	sw	s1,8(sp)
    179c:	00877693          	andi	a3,a4,8
    17a0:	87aa                	mv	a5,a0
    17a2:	842e                	mv	s0,a1
    17a4:	e6f1                	bnez	a3,1870 <__sflush_r+0xe0>
    17a6:	41d4                	lw	a3,4(a1)
    17a8:	00d04563          	bgtz	a3,17b2 <__sflush_r+0x22>
    17ac:	41b4                	lw	a3,64(a1)
    17ae:	0ad05c63          	blez	a3,1866 <__sflush_r+0xd6>
    17b2:	02c42303          	lw	t1,44(s0)
    17b6:	0a030863          	beqz	t1,1866 <__sflush_r+0xd6>
    17ba:	4384                	lw	s1,0(a5)
    17bc:	01371693          	slli	a3,a4,0x13
    17c0:	0007a023          	sw	zero,0(a5)
    17c4:	0606de63          	bgez	a3,1840 <__sflush_r+0xb0>
    17c8:	4870                	lw	a2,84(s0)
    17ca:	00c45703          	lhu	a4,12(s0)
    17ce:	8b11                	andi	a4,a4,4
    17d0:	c719                	beqz	a4,17de <__sflush_r+0x4e>
    17d2:	4058                	lw	a4,4(s0)
    17d4:	8e19                	sub	a2,a2,a4
    17d6:	5858                	lw	a4,52(s0)
    17d8:	c319                	beqz	a4,17de <__sflush_r+0x4e>
    17da:	4038                	lw	a4,64(s0)
    17dc:	8e19                	sub	a2,a2,a4
    17de:	5458                	lw	a4,44(s0)
    17e0:	500c                	lw	a1,32(s0)
    17e2:	4681                	li	a3,0
    17e4:	853e                	mv	a0,a5
    17e6:	c03e                	sw	a5,0(sp)
    17e8:	9702                	jalr	a4
    17ea:	56fd                	li	a3,-1
    17ec:	00c41703          	lh	a4,12(s0)
    17f0:	4782                	lw	a5,0(sp)
    17f2:	00d51d63          	bne	a0,a3,180c <__sflush_r+0x7c>
    17f6:	4390                	lw	a2,0(a5)
    17f8:	46f5                	li	a3,29
    17fa:	06c6e863          	bltu	a3,a2,186a <__sflush_r+0xda>
    17fe:	204006b7          	lui	a3,0x20400
    1802:	0685                	addi	a3,a3,1 # 20400001 <_sp+0x203f3a31>
    1804:	00c6d6b3          	srl	a3,a3,a2
    1808:	8a85                	andi	a3,a3,1
    180a:	c2a5                	beqz	a3,186a <__sflush_r+0xda>
    180c:	4814                	lw	a3,16(s0)
    180e:	00042223          	sw	zero,4(s0)
    1812:	c014                	sw	a3,0(s0)
    1814:	01371693          	slli	a3,a4,0x13
    1818:	0006d863          	bgez	a3,1828 <__sflush_r+0x98>
    181c:	577d                	li	a4,-1
    181e:	00e51463          	bne	a0,a4,1826 <__sflush_r+0x96>
    1822:	4398                	lw	a4,0(a5)
    1824:	e311                	bnez	a4,1828 <__sflush_r+0x98>
    1826:	c868                	sw	a0,84(s0)
    1828:	584c                	lw	a1,52(s0)
    182a:	c384                	sw	s1,0(a5)
    182c:	cd8d                	beqz	a1,1866 <__sflush_r+0xd6>
    182e:	04440713          	addi	a4,s0,68
    1832:	00e58463          	beq	a1,a4,183a <__sflush_r+0xaa>
    1836:	853e                	mv	a0,a5
    1838:	3385                	jal	1598 <_free_r>
    183a:	02042a23          	sw	zero,52(s0)
    183e:	a025                	j	1866 <__sflush_r+0xd6>
    1840:	500c                	lw	a1,32(s0)
    1842:	4601                	li	a2,0
    1844:	853e                	mv	a0,a5
    1846:	4685                	li	a3,1
    1848:	c03e                	sw	a5,0(sp)
    184a:	9302                	jalr	t1
    184c:	577d                	li	a4,-1
    184e:	4782                	lw	a5,0(sp)
    1850:	862a                	mv	a2,a0
    1852:	f6e51ce3          	bne	a0,a4,17ca <__sflush_r+0x3a>
    1856:	4398                	lw	a4,0(a5)
    1858:	db2d                	beqz	a4,17ca <__sflush_r+0x3a>
    185a:	fe370693          	addi	a3,a4,-29
    185e:	c299                	beqz	a3,1864 <__sflush_r+0xd4>
    1860:	1729                	addi	a4,a4,-22
    1862:	ef15                	bnez	a4,189e <__sflush_r+0x10e>
    1864:	c384                	sw	s1,0(a5)
    1866:	4501                	li	a0,0
    1868:	a091                	j	18ac <__sflush_r+0x11c>
    186a:	04076793          	ori	a5,a4,64
    186e:	a825                	j	18a6 <__sflush_r+0x116>
    1870:	4990                	lw	a2,16(a1)
    1872:	da75                	beqz	a2,1866 <__sflush_r+0xd6>
    1874:	4184                	lw	s1,0(a1)
    1876:	8b0d                	andi	a4,a4,3
    1878:	c190                	sw	a2,0(a1)
    187a:	8c91                	sub	s1,s1,a2
    187c:	4681                	li	a3,0
    187e:	e311                	bnez	a4,1882 <__sflush_r+0xf2>
    1880:	49d4                	lw	a3,20(a1)
    1882:	c414                	sw	a3,8(s0)
    1884:	fe9051e3          	blez	s1,1866 <__sflush_r+0xd6>
    1888:	5418                	lw	a4,40(s0)
    188a:	500c                	lw	a1,32(s0)
    188c:	853e                	mv	a0,a5
    188e:	86a6                	mv	a3,s1
    1890:	c232                	sw	a2,4(sp)
    1892:	c03e                	sw	a5,0(sp)
    1894:	9702                	jalr	a4
    1896:	4782                	lw	a5,0(sp)
    1898:	4612                	lw	a2,4(sp)
    189a:	00a04e63          	bgtz	a0,18b6 <__sflush_r+0x126>
    189e:	00c45783          	lhu	a5,12(s0)
    18a2:	0407e793          	ori	a5,a5,64
    18a6:	00f41623          	sh	a5,12(s0)
    18aa:	557d                	li	a0,-1
    18ac:	40c2                	lw	ra,16(sp)
    18ae:	4432                	lw	s0,12(sp)
    18b0:	44a2                	lw	s1,8(sp)
    18b2:	0151                	addi	sp,sp,20
    18b4:	8082                	ret
    18b6:	962a                	add	a2,a2,a0
    18b8:	8c89                	sub	s1,s1,a0
    18ba:	b7e9                	j	1884 <__sflush_r+0xf4>

000018bc <_fflush_r>:
    18bc:	499c                	lw	a5,16(a1)
    18be:	cb85                	beqz	a5,18ee <_fflush_r+0x32>
    18c0:	1151                	addi	sp,sp,-12
    18c2:	c222                	sw	s0,4(sp)
    18c4:	c406                	sw	ra,8(sp)
    18c6:	842a                	mv	s0,a0
    18c8:	c511                	beqz	a0,18d4 <_fflush_r+0x18>
    18ca:	511c                	lw	a5,32(a0)
    18cc:	e781                	bnez	a5,18d4 <_fflush_r+0x18>
    18ce:	c02e                	sw	a1,0(sp)
    18d0:	3a81                	jal	1220 <__sinit>
    18d2:	4582                	lw	a1,0(sp)
    18d4:	00c59783          	lh	a5,12(a1)
    18d8:	c791                	beqz	a5,18e4 <_fflush_r+0x28>
    18da:	8522                	mv	a0,s0
    18dc:	4412                	lw	s0,4(sp)
    18de:	40a2                	lw	ra,8(sp)
    18e0:	0131                	addi	sp,sp,12
    18e2:	b57d                	j	1790 <__sflush_r>
    18e4:	40a2                	lw	ra,8(sp)
    18e6:	4412                	lw	s0,4(sp)
    18e8:	4501                	li	a0,0
    18ea:	0131                	addi	sp,sp,12
    18ec:	8082                	ret
    18ee:	4501                	li	a0,0
    18f0:	8082                	ret

000018f2 <_sbrk_r>:
    18f2:	1151                	addi	sp,sp,-12
    18f4:	c222                	sw	s0,4(sp)
    18f6:	c026                	sw	s1,0(sp)
    18f8:	84aa                	mv	s1,a0
    18fa:	852e                	mv	a0,a1
    18fc:	c406                	sw	ra,8(sp)
    18fe:	9401a823          	sw	zero,-1712(gp) # b374 <errno>
    1902:	3029                	jal	110c <_sbrk>
    1904:	57fd                	li	a5,-1
    1906:	00f51663          	bne	a0,a5,1912 <_sbrk_r+0x20>
    190a:	9501a783          	lw	a5,-1712(gp) # b374 <errno>
    190e:	c391                	beqz	a5,1912 <_sbrk_r+0x20>
    1910:	c09c                	sw	a5,0(s1)
    1912:	40a2                	lw	ra,8(sp)
    1914:	4412                	lw	s0,4(sp)
    1916:	4482                	lw	s1,0(sp)
    1918:	0131                	addi	sp,sp,12
    191a:	8082                	ret

0000191c <iprintf>:
    191c:	1111                	addi	sp,sp,-28
    191e:	cc3e                	sw	a5,24(sp)
    1920:	9481a783          	lw	a5,-1720(gp) # b36c <_impure_ptr>
    1924:	c632                	sw	a2,12(sp)
    1926:	c836                	sw	a3,16(sp)
    1928:	c42e                	sw	a1,8(sp)
    192a:	ca3a                	sw	a4,20(sp)
    192c:	478c                	lw	a1,8(a5)
    192e:	0034                	addi	a3,sp,8
    1930:	862a                	mv	a2,a0
    1932:	853e                	mv	a0,a5
    1934:	c206                	sw	ra,4(sp)
    1936:	c036                	sw	a3,0(sp)
    1938:	24bd                	jal	1ba6 <_vfiprintf_r>
    193a:	4092                	lw	ra,4(sp)
    193c:	0171                	addi	sp,sp,28
    193e:	8082                	ret

00001940 <_puts_r>:
    1940:	511c                	lw	a5,32(a0)
    1942:	1141                	addi	sp,sp,-16
    1944:	c422                	sw	s0,8(sp)
    1946:	c226                	sw	s1,4(sp)
    1948:	c606                	sw	ra,12(sp)
    194a:	4510                	lw	a2,8(a0)
    194c:	842a                	mv	s0,a0
    194e:	84ae                	mv	s1,a1
    1950:	e781                	bnez	a5,1958 <_puts_r+0x18>
    1952:	c032                	sw	a2,0(sp)
    1954:	30f1                	jal	1220 <__sinit>
    1956:	4602                	lw	a2,0(sp)
    1958:	00c65783          	lhu	a5,12(a2)
    195c:	8ba1                	andi	a5,a5,8
    195e:	c399                	beqz	a5,1964 <_puts_r+0x24>
    1960:	4a1c                	lw	a5,16(a2)
    1962:	ef85                	bnez	a5,199a <_puts_r+0x5a>
    1964:	85b2                	mv	a1,a2
    1966:	8522                	mv	a0,s0
    1968:	c032                	sw	a2,0(sp)
    196a:	2221                	jal	1a72 <__swsetup_r>
    196c:	4602                	lw	a2,0(sp)
    196e:	c515                	beqz	a0,199a <_puts_r+0x5a>
    1970:	557d                	li	a0,-1
    1972:	40b2                	lw	ra,12(sp)
    1974:	4422                	lw	s0,8(sp)
    1976:	4492                	lw	s1,4(sp)
    1978:	0141                	addi	sp,sp,16
    197a:	8082                	ret
    197c:	0007d863          	bgez	a5,198c <_puts_r+0x4c>
    1980:	4e18                	lw	a4,24(a2)
    1982:	02e7cc63          	blt	a5,a4,19ba <_puts_r+0x7a>
    1986:	ff658793          	addi	a5,a1,-10
    198a:	cb85                	beqz	a5,19ba <_puts_r+0x7a>
    198c:	421c                	lw	a5,0(a2)
    198e:	00178713          	addi	a4,a5,1
    1992:	c218                	sw	a4,0(a2)
    1994:	00b78023          	sb	a1,0(a5)
    1998:	0485                	addi	s1,s1,1
    199a:	461c                	lw	a5,8(a2)
    199c:	0004c583          	lbu	a1,0(s1)
    19a0:	17fd                	addi	a5,a5,-1
    19a2:	c61c                	sw	a5,8(a2)
    19a4:	fde1                	bnez	a1,197c <_puts_r+0x3c>
    19a6:	0207d263          	bgez	a5,19ca <_puts_r+0x8a>
    19aa:	45a9                	li	a1,10
    19ac:	8522                	mv	a0,s0
    19ae:	2815                	jal	19e2 <__swbuf_r>
    19b0:	57fd                	li	a5,-1
    19b2:	faf50fe3          	beq	a0,a5,1970 <_puts_r+0x30>
    19b6:	4529                	li	a0,10
    19b8:	bf6d                	j	1972 <_puts_r+0x32>
    19ba:	8522                	mv	a0,s0
    19bc:	c032                	sw	a2,0(sp)
    19be:	2015                	jal	19e2 <__swbuf_r>
    19c0:	57fd                	li	a5,-1
    19c2:	4602                	lw	a2,0(sp)
    19c4:	fcf51ae3          	bne	a0,a5,1998 <_puts_r+0x58>
    19c8:	b765                	j	1970 <_puts_r+0x30>
    19ca:	421c                	lw	a5,0(a2)
    19cc:	00178713          	addi	a4,a5,1
    19d0:	c218                	sw	a4,0(a2)
    19d2:	4729                	li	a4,10
    19d4:	00e78023          	sb	a4,0(a5)
    19d8:	bff9                	j	19b6 <_puts_r+0x76>

000019da <puts>:
    19da:	85aa                	mv	a1,a0
    19dc:	9481a503          	lw	a0,-1720(gp) # b36c <_impure_ptr>
    19e0:	b785                	j	1940 <_puts_r>

000019e2 <__swbuf_r>:
    19e2:	1141                	addi	sp,sp,-16
    19e4:	c422                	sw	s0,8(sp)
    19e6:	c226                	sw	s1,4(sp)
    19e8:	c606                	sw	ra,12(sp)
    19ea:	84ae                	mv	s1,a1
    19ec:	842a                	mv	s0,a0
    19ee:	85b2                	mv	a1,a2
    19f0:	c511                	beqz	a0,19fc <__swbuf_r+0x1a>
    19f2:	511c                	lw	a5,32(a0)
    19f4:	e781                	bnez	a5,19fc <__swbuf_r+0x1a>
    19f6:	c032                	sw	a2,0(sp)
    19f8:	3025                	jal	1220 <__sinit>
    19fa:	4582                	lw	a1,0(sp)
    19fc:	4d9c                	lw	a5,24(a1)
    19fe:	c59c                	sw	a5,8(a1)
    1a00:	00c5d783          	lhu	a5,12(a1)
    1a04:	8ba1                	andi	a5,a5,8
    1a06:	c399                	beqz	a5,1a0c <__swbuf_r+0x2a>
    1a08:	499c                	lw	a5,16(a1)
    1a0a:	ef89                	bnez	a5,1a24 <__swbuf_r+0x42>
    1a0c:	8522                	mv	a0,s0
    1a0e:	c02e                	sw	a1,0(sp)
    1a10:	208d                	jal	1a72 <__swsetup_r>
    1a12:	4582                	lw	a1,0(sp)
    1a14:	c901                	beqz	a0,1a24 <__swbuf_r+0x42>
    1a16:	57fd                	li	a5,-1
    1a18:	40b2                	lw	ra,12(sp)
    1a1a:	4422                	lw	s0,8(sp)
    1a1c:	4492                	lw	s1,4(sp)
    1a1e:	853e                	mv	a0,a5
    1a20:	0141                	addi	sp,sp,16
    1a22:	8082                	ret
    1a24:	499c                	lw	a5,16(a1)
    1a26:	4188                	lw	a0,0(a1)
    1a28:	8d1d                	sub	a0,a0,a5
    1a2a:	49dc                	lw	a5,20(a1)
    1a2c:	00f54763          	blt	a0,a5,1a3a <__swbuf_r+0x58>
    1a30:	8522                	mv	a0,s0
    1a32:	c02e                	sw	a1,0(sp)
    1a34:	3561                	jal	18bc <_fflush_r>
    1a36:	4582                	lw	a1,0(sp)
    1a38:	fd79                	bnez	a0,1a16 <__swbuf_r+0x34>
    1a3a:	4598                	lw	a4,8(a1)
    1a3c:	0505                	addi	a0,a0,1
    1a3e:	0ff4f793          	zext.b	a5,s1
    1a42:	177d                	addi	a4,a4,-1
    1a44:	c598                	sw	a4,8(a1)
    1a46:	4198                	lw	a4,0(a1)
    1a48:	00170693          	addi	a3,a4,1
    1a4c:	c194                	sw	a3,0(a1)
    1a4e:	00970023          	sb	s1,0(a4)
    1a52:	49d8                	lw	a4,20(a1)
    1a54:	00a70963          	beq	a4,a0,1a66 <__swbuf_r+0x84>
    1a58:	00c5d703          	lhu	a4,12(a1)
    1a5c:	8b05                	andi	a4,a4,1
    1a5e:	df4d                	beqz	a4,1a18 <__swbuf_r+0x36>
    1a60:	ff678713          	addi	a4,a5,-10
    1a64:	fb55                	bnez	a4,1a18 <__swbuf_r+0x36>
    1a66:	8522                	mv	a0,s0
    1a68:	c03e                	sw	a5,0(sp)
    1a6a:	3d89                	jal	18bc <_fflush_r>
    1a6c:	4782                	lw	a5,0(sp)
    1a6e:	d54d                	beqz	a0,1a18 <__swbuf_r+0x36>
    1a70:	b75d                	j	1a16 <__swbuf_r+0x34>

00001a72 <__swsetup_r>:
    1a72:	1151                	addi	sp,sp,-12
    1a74:	c026                	sw	s1,0(sp)
    1a76:	84aa                	mv	s1,a0
    1a78:	9481a503          	lw	a0,-1720(gp) # b36c <_impure_ptr>
    1a7c:	c222                	sw	s0,4(sp)
    1a7e:	c406                	sw	ra,8(sp)
    1a80:	842e                	mv	s0,a1
    1a82:	c509                	beqz	a0,1a8c <__swsetup_r+0x1a>
    1a84:	511c                	lw	a5,32(a0)
    1a86:	e399                	bnez	a5,1a8c <__swsetup_r+0x1a>
    1a88:	f98ff0ef          	jal	1220 <__sinit>
    1a8c:	00c41783          	lh	a5,12(s0)
    1a90:	0087f713          	andi	a4,a5,8
    1a94:	e729                	bnez	a4,1ade <__swsetup_r+0x6c>
    1a96:	0107f713          	andi	a4,a5,16
    1a9a:	eb09                	bnez	a4,1aac <__swsetup_r+0x3a>
    1a9c:	4725                	li	a4,9
    1a9e:	c098                	sw	a4,0(s1)
    1aa0:	0407e793          	ori	a5,a5,64
    1aa4:	00f41623          	sh	a5,12(s0)
    1aa8:	557d                	li	a0,-1
    1aaa:	a0bd                	j	1b18 <__swsetup_r+0xa6>
    1aac:	0047f713          	andi	a4,a5,4
    1ab0:	c31d                	beqz	a4,1ad6 <__swsetup_r+0x64>
    1ab2:	584c                	lw	a1,52(s0)
    1ab4:	c989                	beqz	a1,1ac6 <__swsetup_r+0x54>
    1ab6:	04440793          	addi	a5,s0,68
    1aba:	00f58463          	beq	a1,a5,1ac2 <__swsetup_r+0x50>
    1abe:	8526                	mv	a0,s1
    1ac0:	3ce1                	jal	1598 <_free_r>
    1ac2:	02042a23          	sw	zero,52(s0)
    1ac6:	00c45783          	lhu	a5,12(s0)
    1aca:	4818                	lw	a4,16(s0)
    1acc:	00042223          	sw	zero,4(s0)
    1ad0:	fdb7f793          	andi	a5,a5,-37
    1ad4:	c018                	sw	a4,0(s0)
    1ad6:	0087e793          	ori	a5,a5,8
    1ada:	00f41623          	sh	a5,12(s0)
    1ade:	481c                	lw	a5,16(s0)
    1ae0:	eb99                	bnez	a5,1af6 <__swsetup_r+0x84>
    1ae2:	445c                	lw	a5,12(s0)
    1ae4:	20000713          	li	a4,512
    1ae8:	2807f793          	andi	a5,a5,640
    1aec:	00e78563          	beq	a5,a4,1af6 <__swsetup_r+0x84>
    1af0:	85a2                	mv	a1,s0
    1af2:	8526                	mv	a0,s1
    1af4:	2de9                	jal	21ce <__smakebuf_r>
    1af6:	00c41783          	lh	a5,12(s0)
    1afa:	0017f713          	andi	a4,a5,1
    1afe:	c315                	beqz	a4,1b22 <__swsetup_r+0xb0>
    1b00:	4858                	lw	a4,20(s0)
    1b02:	00042423          	sw	zero,8(s0)
    1b06:	40e00733          	neg	a4,a4
    1b0a:	cc18                	sw	a4,24(s0)
    1b0c:	4818                	lw	a4,16(s0)
    1b0e:	4501                	li	a0,0
    1b10:	e701                	bnez	a4,1b18 <__swsetup_r+0xa6>
    1b12:	0807f713          	andi	a4,a5,128
    1b16:	f749                	bnez	a4,1aa0 <__swsetup_r+0x2e>
    1b18:	40a2                	lw	ra,8(sp)
    1b1a:	4412                	lw	s0,4(sp)
    1b1c:	4482                	lw	s1,0(sp)
    1b1e:	0131                	addi	sp,sp,12
    1b20:	8082                	ret
    1b22:	0027f713          	andi	a4,a5,2
    1b26:	4681                	li	a3,0
    1b28:	e311                	bnez	a4,1b2c <__swsetup_r+0xba>
    1b2a:	4854                	lw	a3,20(s0)
    1b2c:	c414                	sw	a3,8(s0)
    1b2e:	bff9                	j	1b0c <__swsetup_r+0x9a>

00001b30 <__errno>:
    1b30:	9481a503          	lw	a0,-1720(gp) # b36c <_impure_ptr>
    1b34:	8082                	ret

00001b36 <strlen>:
    1b36:	87aa                	mv	a5,a0
    1b38:	0007c703          	lbu	a4,0(a5)
    1b3c:	0785                	addi	a5,a5,1
    1b3e:	ff6d                	bnez	a4,1b38 <strlen+0x2>
    1b40:	40a78533          	sub	a0,a5,a0
    1b44:	157d                	addi	a0,a0,-1
    1b46:	8082                	ret

00001b48 <__sfputc_r>:
    1b48:	461c                	lw	a5,8(a2)
    1b4a:	17fd                	addi	a5,a5,-1
    1b4c:	c61c                	sw	a5,8(a2)
    1b4e:	0007d963          	bgez	a5,1b60 <__sfputc_r+0x18>
    1b52:	4e18                	lw	a4,24(a2)
    1b54:	00e7c563          	blt	a5,a4,1b5e <__sfputc_r+0x16>
    1b58:	ff658793          	addi	a5,a1,-10
    1b5c:	e391                	bnez	a5,1b60 <__sfputc_r+0x18>
    1b5e:	b551                	j	19e2 <__swbuf_r>
    1b60:	421c                	lw	a5,0(a2)
    1b62:	852e                	mv	a0,a1
    1b64:	00178713          	addi	a4,a5,1
    1b68:	c218                	sw	a4,0(a2)
    1b6a:	00b78023          	sb	a1,0(a5)
    1b6e:	8082                	ret

00001b70 <__sfputs_r>:
    1b70:	1131                	addi	sp,sp,-20
    1b72:	c622                	sw	s0,12(sp)
    1b74:	c426                	sw	s1,8(sp)
    1b76:	c806                	sw	ra,16(sp)
    1b78:	c02a                	sw	a0,0(sp)
    1b7a:	c22e                	sw	a1,4(sp)
    1b7c:	8432                	mv	s0,a2
    1b7e:	00d604b3          	add	s1,a2,a3
    1b82:	00941463          	bne	s0,s1,1b8a <__sfputs_r+0x1a>
    1b86:	4501                	li	a0,0
    1b88:	a811                	j	1b9c <__sfputs_r+0x2c>
    1b8a:	00044583          	lbu	a1,0(s0)
    1b8e:	4612                	lw	a2,4(sp)
    1b90:	4502                	lw	a0,0(sp)
    1b92:	0405                	addi	s0,s0,1
    1b94:	3f55                	jal	1b48 <__sfputc_r>
    1b96:	57fd                	li	a5,-1
    1b98:	fef515e3          	bne	a0,a5,1b82 <__sfputs_r+0x12>
    1b9c:	40c2                	lw	ra,16(sp)
    1b9e:	4432                	lw	s0,12(sp)
    1ba0:	44a2                	lw	s1,8(sp)
    1ba2:	0151                	addi	sp,sp,20
    1ba4:	8082                	ret

00001ba6 <_vfiprintf_r>:
    1ba6:	f7810113          	addi	sp,sp,-136
    1baa:	c122                	sw	s0,128(sp)
    1bac:	dea6                	sw	s1,124(sp)
    1bae:	01f10793          	addi	a5,sp,31
    1bb2:	c306                	sw	ra,132(sp)
    1bb4:	c22a                	sw	a0,4(sp)
    1bb6:	c02e                	sw	a1,0(sp)
    1bb8:	84b6                	mv	s1,a3
    1bba:	ff87f413          	andi	s0,a5,-8
    1bbe:	c519                	beqz	a0,1bcc <_vfiprintf_r+0x26>
    1bc0:	5118                	lw	a4,32(a0)
    1bc2:	e709                	bnez	a4,1bcc <_vfiprintf_r+0x26>
    1bc4:	c632                	sw	a2,12(sp)
    1bc6:	e5aff0ef          	jal	1220 <__sinit>
    1bca:	4632                	lw	a2,12(sp)
    1bcc:	4782                	lw	a5,0(sp)
    1bce:	00c7d703          	lhu	a4,12(a5)
    1bd2:	8b21                	andi	a4,a4,8
    1bd4:	cb79                	beqz	a4,1caa <_vfiprintf_r+0x104>
    1bd6:	4b98                	lw	a4,16(a5)
    1bd8:	cb69                	beqz	a4,1caa <_vfiprintf_r+0x104>
    1bda:	02000713          	li	a4,32
    1bde:	00e40ca3          	sb	a4,25(s0)
    1be2:	03000713          	li	a4,48
    1be6:	00042a23          	sw	zero,20(s0)
    1bea:	00e40d23          	sb	a4,26(s0)
    1bee:	ca26                	sw	s1,20(sp)
    1bf0:	84b2                	mv	s1,a2
    1bf2:	0004c683          	lbu	a3,0(s1)
    1bf6:	00d032b3          	snez	t0,a3
    1bfa:	fdb68693          	addi	a3,a3,-37
    1bfe:	00d036b3          	snez	a3,a3
    1c02:	00d2f2b3          	and	t0,t0,a3
    1c06:	0a029f63          	bnez	t0,1cc4 <_vfiprintf_r+0x11e>
    1c0a:	40c486b3          	sub	a3,s1,a2
    1c0e:	00c48f63          	beq	s1,a2,1c2c <_vfiprintf_r+0x86>
    1c12:	4582                	lw	a1,0(sp)
    1c14:	4512                	lw	a0,4(sp)
    1c16:	c816                	sw	t0,16(sp)
    1c18:	c636                	sw	a3,12(sp)
    1c1a:	3f99                	jal	1b70 <__sfputs_r>
    1c1c:	567d                	li	a2,-1
    1c1e:	1cc50863          	beq	a0,a2,1dee <_vfiprintf_r+0x248>
    1c22:	4850                	lw	a2,20(s0)
    1c24:	46b2                	lw	a3,12(sp)
    1c26:	42c2                	lw	t0,16(sp)
    1c28:	9636                	add	a2,a2,a3
    1c2a:	c850                	sw	a2,20(s0)
    1c2c:	0004c683          	lbu	a3,0(s1)
    1c30:	1a068f63          	beqz	a3,1dee <_vfiprintf_r+0x248>
    1c34:	577d                	li	a4,-1
    1c36:	0485                	addi	s1,s1,1
    1c38:	00042023          	sw	zero,0(s0)
    1c3c:	00042623          	sw	zero,12(s0)
    1c40:	c058                	sw	a4,4(s0)
    1c42:	00042423          	sw	zero,8(s0)
    1c46:	040401a3          	sb	zero,67(s0)
    1c4a:	04042c23          	sw	zero,88(s0)
    1c4e:	0004c583          	lbu	a1,0(s1)
    1c52:	66ad                	lui	a3,0xb
    1c54:	4615                	li	a2,5
    1c56:	88868513          	addi	a0,a3,-1912 # a888 <__clz_tab+0x2ac>
    1c5a:	c616                	sw	t0,12(sp)
    1c5c:	2bcd                	jal	224e <memchr>
    1c5e:	4018                	lw	a4,0(s0)
    1c60:	42b2                	lw	t0,12(sp)
    1c62:	00148613          	addi	a2,s1,1
    1c66:	66ad                	lui	a3,0xb
    1c68:	e125                	bnez	a0,1cc8 <_vfiprintf_r+0x122>
    1c6a:	01077693          	andi	a3,a4,16
    1c6e:	c689                	beqz	a3,1c78 <_vfiprintf_r+0xd2>
    1c70:	02000693          	li	a3,32
    1c74:	04d401a3          	sb	a3,67(s0)
    1c78:	00877693          	andi	a3,a4,8
    1c7c:	c689                	beqz	a3,1c86 <_vfiprintf_r+0xe0>
    1c7e:	02b00693          	li	a3,43
    1c82:	04d401a3          	sb	a3,67(s0)
    1c86:	0004c583          	lbu	a1,0(s1)
    1c8a:	02a00693          	li	a3,42
    1c8e:	04d58763          	beq	a1,a3,1cdc <_vfiprintf_r+0x136>
    1c92:	4454                	lw	a3,12(s0)
    1c94:	4701                	li	a4,0
    1c96:	45a5                	li	a1,9
    1c98:	0004c603          	lbu	a2,0(s1)
    1c9c:	fd060613          	addi	a2,a2,-48
    1ca0:	0ec5f663          	bgeu	a1,a2,1d8c <_vfiprintf_r+0x1e6>
    1ca4:	c729                	beqz	a4,1cee <_vfiprintf_r+0x148>
    1ca6:	c454                	sw	a3,12(s0)
    1ca8:	a099                	j	1cee <_vfiprintf_r+0x148>
    1caa:	4582                	lw	a1,0(sp)
    1cac:	4512                	lw	a0,4(sp)
    1cae:	c632                	sw	a2,12(sp)
    1cb0:	33c9                	jal	1a72 <__swsetup_r>
    1cb2:	4632                	lw	a2,12(sp)
    1cb4:	d11d                	beqz	a0,1bda <_vfiprintf_r+0x34>
    1cb6:	557d                	li	a0,-1
    1cb8:	409a                	lw	ra,132(sp)
    1cba:	440a                	lw	s0,128(sp)
    1cbc:	54f6                	lw	s1,124(sp)
    1cbe:	08810113          	addi	sp,sp,136
    1cc2:	8082                	ret
    1cc4:	0485                	addi	s1,s1,1
    1cc6:	b735                	j	1bf2 <_vfiprintf_r+0x4c>
    1cc8:	88868693          	addi	a3,a3,-1912 # a888 <__clz_tab+0x2ac>
    1ccc:	8d15                	sub	a0,a0,a3
    1cce:	4685                	li	a3,1
    1cd0:	00a696b3          	sll	a3,a3,a0
    1cd4:	8f55                	or	a4,a4,a3
    1cd6:	c018                	sw	a4,0(s0)
    1cd8:	84b2                	mv	s1,a2
    1cda:	bf95                	j	1c4e <_vfiprintf_r+0xa8>
    1cdc:	46d2                	lw	a3,20(sp)
    1cde:	00468593          	addi	a1,a3,4
    1ce2:	4294                	lw	a3,0(a3)
    1ce4:	ca2e                	sw	a1,20(sp)
    1ce6:	0806cc63          	bltz	a3,1d7e <_vfiprintf_r+0x1d8>
    1cea:	c454                	sw	a3,12(s0)
    1cec:	84b2                	mv	s1,a2
    1cee:	0004c683          	lbu	a3,0(s1)
    1cf2:	02e00713          	li	a4,46
    1cf6:	02e69263          	bne	a3,a4,1d1a <_vfiprintf_r+0x174>
    1cfa:	0014c683          	lbu	a3,1(s1)
    1cfe:	02a00713          	li	a4,42
    1d02:	08e69e63          	bne	a3,a4,1d9e <_vfiprintf_r+0x1f8>
    1d06:	4752                	lw	a4,20(sp)
    1d08:	0489                	addi	s1,s1,2
    1d0a:	00470693          	addi	a3,a4,4
    1d0e:	4318                	lw	a4,0(a4)
    1d10:	ca36                	sw	a3,20(sp)
    1d12:	00075363          	bgez	a4,1d18 <_vfiprintf_r+0x172>
    1d16:	577d                	li	a4,-1
    1d18:	c058                	sw	a4,4(s0)
    1d1a:	0004c583          	lbu	a1,0(s1)
    1d1e:	672d                	lui	a4,0xb
    1d20:	460d                	li	a2,3
    1d22:	89070513          	addi	a0,a4,-1904 # a890 <__clz_tab+0x2b4>
    1d26:	2325                	jal	224e <memchr>
    1d28:	cd09                	beqz	a0,1d42 <_vfiprintf_r+0x19c>
    1d2a:	672d                	lui	a4,0xb
    1d2c:	89070713          	addi	a4,a4,-1904 # a890 <__clz_tab+0x2b4>
    1d30:	8d19                	sub	a0,a0,a4
    1d32:	4018                	lw	a4,0(s0)
    1d34:	04000693          	li	a3,64
    1d38:	00a696b3          	sll	a3,a3,a0
    1d3c:	8f55                	or	a4,a4,a3
    1d3e:	0485                	addi	s1,s1,1
    1d40:	c018                	sw	a4,0(s0)
    1d42:	0004c583          	lbu	a1,0(s1)
    1d46:	652d                	lui	a0,0xb
    1d48:	4619                	li	a2,6
    1d4a:	89450513          	addi	a0,a0,-1900 # a894 <__clz_tab+0x2b8>
    1d4e:	00b40c23          	sb	a1,24(s0)
    1d52:	29f5                	jal	224e <memchr>
    1d54:	c555                	beqz	a0,1e00 <_vfiprintf_r+0x25a>
    1d56:	00000713          	li	a4,0
    1d5a:	eb35                	bnez	a4,1dce <_vfiprintf_r+0x228>
    1d5c:	4018                	lw	a4,0(s0)
    1d5e:	4652                	lw	a2,20(sp)
    1d60:	10077713          	andi	a4,a4,256
    1d64:	00860693          	addi	a3,a2,8
    1d68:	c319                	beqz	a4,1d6e <_vfiprintf_r+0x1c8>
    1d6a:	00460693          	addi	a3,a2,4
    1d6e:	ca36                	sw	a3,20(sp)
    1d70:	4858                	lw	a4,20(s0)
    1d72:	47a2                	lw	a5,8(sp)
    1d74:	00148613          	addi	a2,s1,1
    1d78:	973e                	add	a4,a4,a5
    1d7a:	c858                	sw	a4,20(s0)
    1d7c:	bd95                	j	1bf0 <_vfiprintf_r+0x4a>
    1d7e:	40d006b3          	neg	a3,a3
    1d82:	00276713          	ori	a4,a4,2
    1d86:	c454                	sw	a3,12(s0)
    1d88:	c018                	sw	a4,0(s0)
    1d8a:	b78d                	j	1cec <_vfiprintf_r+0x146>
    1d8c:	00269713          	slli	a4,a3,0x2
    1d90:	9736                	add	a4,a4,a3
    1d92:	0706                	slli	a4,a4,0x1
    1d94:	00c706b3          	add	a3,a4,a2
    1d98:	0485                	addi	s1,s1,1
    1d9a:	4705                	li	a4,1
    1d9c:	bdf5                	j	1c98 <_vfiprintf_r+0xf2>
    1d9e:	0485                	addi	s1,s1,1
    1da0:	00042223          	sw	zero,4(s0)
    1da4:	4681                	li	a3,0
    1da6:	45a5                	li	a1,9
    1da8:	0004c603          	lbu	a2,0(s1)
    1dac:	fd060613          	addi	a2,a2,-48
    1db0:	00c5f663          	bgeu	a1,a2,1dbc <_vfiprintf_r+0x216>
    1db4:	f60283e3          	beqz	t0,1d1a <_vfiprintf_r+0x174>
    1db8:	c054                	sw	a3,4(s0)
    1dba:	b785                	j	1d1a <_vfiprintf_r+0x174>
    1dbc:	00269713          	slli	a4,a3,0x2
    1dc0:	9736                	add	a4,a4,a3
    1dc2:	0706                	slli	a4,a4,0x1
    1dc4:	0485                	addi	s1,s1,1
    1dc6:	00c706b3          	add	a3,a4,a2
    1dca:	4285                	li	t0,1
    1dcc:	bff1                	j	1da8 <_vfiprintf_r+0x202>
    1dce:	4602                	lw	a2,0(sp)
    1dd0:	4512                	lw	a0,4(sp)
    1dd2:	6689                	lui	a3,0x2
    1dd4:	0858                	addi	a4,sp,20
    1dd6:	b7068693          	addi	a3,a3,-1168 # 1b70 <__sfputs_r>
    1dda:	85a2                	mv	a1,s0
    1ddc:	00000097          	auipc	ra,0x0
    1de0:	000000e7          	jalr	zero # 0 <__vector_start>
    1de4:	c42a                	sw	a0,8(sp)
    1de6:	47a2                	lw	a5,8(sp)
    1de8:	577d                	li	a4,-1
    1dea:	f8e793e3          	bne	a5,a4,1d70 <_vfiprintf_r+0x1ca>
    1dee:	4782                	lw	a5,0(sp)
    1df0:	00c7d703          	lhu	a4,12(a5)
    1df4:	04077713          	andi	a4,a4,64
    1df8:	ea071fe3          	bnez	a4,1cb6 <_vfiprintf_r+0x110>
    1dfc:	4848                	lw	a0,20(s0)
    1dfe:	bd6d                	j	1cb8 <_vfiprintf_r+0x112>
    1e00:	4602                	lw	a2,0(sp)
    1e02:	4512                	lw	a0,4(sp)
    1e04:	6689                	lui	a3,0x2
    1e06:	0858                	addi	a4,sp,20
    1e08:	b7068693          	addi	a3,a3,-1168 # 1b70 <__sfputs_r>
    1e0c:	85a2                	mv	a1,s0
    1e0e:	2201                	jal	1f0e <_printf_i>
    1e10:	bfd1                	j	1de4 <_vfiprintf_r+0x23e>

00001e12 <_printf_common>:
    1e12:	1101                	addi	sp,sp,-32
    1e14:	c43a                	sw	a4,8(sp)
    1e16:	499c                	lw	a5,16(a1)
    1e18:	4598                	lw	a4,8(a1)
    1e1a:	cc22                	sw	s0,24(sp)
    1e1c:	ca26                	sw	s1,20(sp)
    1e1e:	ce06                	sw	ra,28(sp)
    1e20:	c02a                	sw	a0,0(sp)
    1e22:	c236                	sw	a3,4(sp)
    1e24:	84ae                	mv	s1,a1
    1e26:	8432                	mv	s0,a2
    1e28:	00e7d363          	bge	a5,a4,1e2e <_printf_common+0x1c>
    1e2c:	87ba                	mv	a5,a4
    1e2e:	c01c                	sw	a5,0(s0)
    1e30:	0434c703          	lbu	a4,67(s1)
    1e34:	c319                	beqz	a4,1e3a <_printf_common+0x28>
    1e36:	0785                	addi	a5,a5,1
    1e38:	c01c                	sw	a5,0(s0)
    1e3a:	409c                	lw	a5,0(s1)
    1e3c:	0207f793          	andi	a5,a5,32
    1e40:	c781                	beqz	a5,1e48 <_printf_common+0x36>
    1e42:	401c                	lw	a5,0(s0)
    1e44:	0789                	addi	a5,a5,2
    1e46:	c01c                	sw	a5,0(s0)
    1e48:	409c                	lw	a5,0(s1)
    1e4a:	8b99                	andi	a5,a5,6
    1e4c:	cbb9                	beqz	a5,1ea2 <_printf_common+0x90>
    1e4e:	409c                	lw	a5,0(s1)
    1e50:	0434c683          	lbu	a3,67(s1)
    1e54:	0207f793          	andi	a5,a5,32
    1e58:	00d036b3          	snez	a3,a3
    1e5c:	ebb5                	bnez	a5,1ed0 <_printf_common+0xbe>
    1e5e:	47a2                	lw	a5,8(sp)
    1e60:	4592                	lw	a1,4(sp)
    1e62:	4502                	lw	a0,0(sp)
    1e64:	04348613          	addi	a2,s1,67
    1e68:	9782                	jalr	a5
    1e6a:	57fd                	li	a5,-1
    1e6c:	04f50c63          	beq	a0,a5,1ec4 <_printf_common+0xb2>
    1e70:	4098                	lw	a4,0(s1)
    1e72:	4691                	li	a3,4
    1e74:	4781                	li	a5,0
    1e76:	8b19                	andi	a4,a4,6
    1e78:	00d71963          	bne	a4,a3,1e8a <_printf_common+0x78>
    1e7c:	4018                	lw	a4,0(s0)
    1e7e:	44dc                	lw	a5,12(s1)
    1e80:	8f99                	sub	a5,a5,a4
    1e82:	fff7c713          	not	a4,a5
    1e86:	877d                	srai	a4,a4,0x1f
    1e88:	8ff9                	and	a5,a5,a4
    1e8a:	4498                	lw	a4,8(s1)
    1e8c:	4894                	lw	a3,16(s1)
    1e8e:	00e6d463          	bge	a3,a4,1e96 <_printf_common+0x84>
    1e92:	8f15                	sub	a4,a4,a3
    1e94:	97ba                	add	a5,a5,a4
    1e96:	4701                	li	a4,0
    1e98:	04e79b63          	bne	a5,a4,1eee <_printf_common+0xdc>
    1e9c:	4501                	li	a0,0
    1e9e:	a025                	j	1ec6 <_printf_common+0xb4>
    1ea0:	0785                	addi	a5,a5,1
    1ea2:	44d8                	lw	a4,12(s1)
    1ea4:	4014                	lw	a3,0(s0)
    1ea6:	8f15                	sub	a4,a4,a3
    1ea8:	fae7d3e3          	bge	a5,a4,1e4e <_printf_common+0x3c>
    1eac:	c63e                	sw	a5,12(sp)
    1eae:	4592                	lw	a1,4(sp)
    1eb0:	47a2                	lw	a5,8(sp)
    1eb2:	4502                	lw	a0,0(sp)
    1eb4:	4685                	li	a3,1
    1eb6:	01948613          	addi	a2,s1,25
    1eba:	9782                	jalr	a5
    1ebc:	577d                	li	a4,-1
    1ebe:	47b2                	lw	a5,12(sp)
    1ec0:	fee510e3          	bne	a0,a4,1ea0 <_printf_common+0x8e>
    1ec4:	557d                	li	a0,-1
    1ec6:	40f2                	lw	ra,28(sp)
    1ec8:	4462                	lw	s0,24(sp)
    1eca:	44d2                	lw	s1,20(sp)
    1ecc:	6105                	addi	sp,sp,32
    1ece:	8082                	ret
    1ed0:	00d48733          	add	a4,s1,a3
    1ed4:	03000613          	li	a2,48
    1ed8:	04c701a3          	sb	a2,67(a4)
    1edc:	0454c703          	lbu	a4,69(s1)
    1ee0:	00168793          	addi	a5,a3,1
    1ee4:	97a6                	add	a5,a5,s1
    1ee6:	0689                	addi	a3,a3,2
    1ee8:	04e781a3          	sb	a4,67(a5)
    1eec:	bf8d                	j	1e5e <_printf_common+0x4c>
    1eee:	c63e                	sw	a5,12(sp)
    1ef0:	4592                	lw	a1,4(sp)
    1ef2:	4502                	lw	a0,0(sp)
    1ef4:	47a2                	lw	a5,8(sp)
    1ef6:	4685                	li	a3,1
    1ef8:	01a48613          	addi	a2,s1,26
    1efc:	c83a                	sw	a4,16(sp)
    1efe:	9782                	jalr	a5
    1f00:	56fd                	li	a3,-1
    1f02:	fcd501e3          	beq	a0,a3,1ec4 <_printf_common+0xb2>
    1f06:	4742                	lw	a4,16(sp)
    1f08:	47b2                	lw	a5,12(sp)
    1f0a:	0705                	addi	a4,a4,1
    1f0c:	b771                	j	1e98 <_printf_common+0x86>

00001f0e <_printf_i>:
    1f0e:	fd410113          	addi	sp,sp,-44
    1f12:	d026                	sw	s1,32(sp)
    1f14:	d406                	sw	ra,40(sp)
    1f16:	d222                	sw	s0,36(sp)
    1f18:	0185c783          	lbu	a5,24(a1)
    1f1c:	c436                	sw	a3,8(sp)
    1f1e:	c02a                	sw	a0,0(sp)
    1f20:	c232                	sw	a2,4(sp)
    1f22:	07800693          	li	a3,120
    1f26:	84ae                	mv	s1,a1
    1f28:	00f6ee63          	bltu	a3,a5,1f44 <_printf_i+0x36>
    1f2c:	06200693          	li	a3,98
    1f30:	04358613          	addi	a2,a1,67
    1f34:	00f6eb63          	bltu	a3,a5,1f4a <_printf_i+0x3c>
    1f38:	1c078063          	beqz	a5,20f8 <_printf_i+0x1ea>
    1f3c:	05800693          	li	a3,88
    1f40:	16d78d63          	beq	a5,a3,20ba <_printf_i+0x1ac>
    1f44:	04248413          	addi	s0,s1,66
    1f48:	a035                	j	1f74 <_printf_i+0x66>
    1f4a:	f9d78693          	addi	a3,a5,-99
    1f4e:	0ff6f693          	zext.b	a3,a3
    1f52:	45d5                	li	a1,21
    1f54:	fed5e8e3          	bltu	a1,a3,1f44 <_printf_i+0x36>
    1f58:	65a9                	lui	a1,0xa
    1f5a:	068a                	slli	a3,a3,0x2
    1f5c:	54858593          	addi	a1,a1,1352 # a548 <spi_sdk.c.ee43b428+0x913>
    1f60:	96ae                	add	a3,a3,a1
    1f62:	4294                	lw	a3,0(a3)
    1f64:	8682                	jr	a3
    1f66:	431c                	lw	a5,0(a4)
    1f68:	04248413          	addi	s0,s1,66
    1f6c:	00478693          	addi	a3,a5,4
    1f70:	439c                	lw	a5,0(a5)
    1f72:	c314                	sw	a3,0(a4)
    1f74:	04f48123          	sb	a5,66(s1)
    1f78:	4785                	li	a5,1
    1f7a:	a245                	j	211a <_printf_i+0x20c>
    1f7c:	409c                	lw	a5,0(s1)
    1f7e:	4308                	lw	a0,0(a4)
    1f80:	0807f693          	andi	a3,a5,128
    1f84:	00450593          	addi	a1,a0,4
    1f88:	c285                	beqz	a3,1fa8 <_printf_i+0x9a>
    1f8a:	411c                	lw	a5,0(a0)
    1f8c:	c30c                	sw	a1,0(a4)
    1f8e:	66ad                	lui	a3,0xb
    1f90:	0007d863          	bgez	a5,1fa0 <_printf_i+0x92>
    1f94:	02d00713          	li	a4,45
    1f98:	40f007b3          	neg	a5,a5
    1f9c:	04e481a3          	sb	a4,67(s1)
    1fa0:	89c68693          	addi	a3,a3,-1892 # a89c <__clz_tab+0x2c0>
    1fa4:	45a9                	li	a1,10
    1fa6:	a091                	j	1fea <_printf_i+0xdc>
    1fa8:	0407f693          	andi	a3,a5,64
    1fac:	411c                	lw	a5,0(a0)
    1fae:	c30c                	sw	a1,0(a4)
    1fb0:	def9                	beqz	a3,1f8e <_printf_i+0x80>
    1fb2:	07c2                	slli	a5,a5,0x10
    1fb4:	87c1                	srai	a5,a5,0x10
    1fb6:	bfe1                	j	1f8e <_printf_i+0x80>
    1fb8:	408c                	lw	a1,0(s1)
    1fba:	4314                	lw	a3,0(a4)
    1fbc:	0805f513          	andi	a0,a1,128
    1fc0:	429c                	lw	a5,0(a3)
    1fc2:	0691                	addi	a3,a3,4
    1fc4:	e511                	bnez	a0,1fd0 <_printf_i+0xc2>
    1fc6:	0405f593          	andi	a1,a1,64
    1fca:	c199                	beqz	a1,1fd0 <_printf_i+0xc2>
    1fcc:	07c2                	slli	a5,a5,0x10
    1fce:	83c1                	srli	a5,a5,0x10
    1fd0:	c314                	sw	a3,0(a4)
    1fd2:	0184c583          	lbu	a1,24(s1)
    1fd6:	66ad                	lui	a3,0xb
    1fd8:	06f00713          	li	a4,111
    1fdc:	89c68693          	addi	a3,a3,-1892 # a89c <__clz_tab+0x2c0>
    1fe0:	0ee59663          	bne	a1,a4,20cc <_printf_i+0x1be>
    1fe4:	45a1                	li	a1,8
    1fe6:	040481a3          	sb	zero,67(s1)
    1fea:	40d8                	lw	a4,4(s1)
    1fec:	c498                	sw	a4,8(s1)
    1fee:	00074863          	bltz	a4,1ffe <_printf_i+0xf0>
    1ff2:	4088                	lw	a0,0(s1)
    1ff4:	8f5d                	or	a4,a4,a5
    1ff6:	8432                	mv	s0,a2
    1ff8:	996d                	andi	a0,a0,-5
    1ffa:	c088                	sw	a0,0(s1)
    1ffc:	cb1d                	beqz	a4,2032 <_printf_i+0x124>
    1ffe:	8432                	mv	s0,a2
    2000:	853e                	mv	a0,a5
    2002:	cc32                	sw	a2,24(sp)
    2004:	c63e                	sw	a5,12(sp)
    2006:	ca36                	sw	a3,20(sp)
    2008:	c82e                	sw	a1,16(sp)
    200a:	453010ef          	jal	3c5c <__umodsi3>
    200e:	46d2                	lw	a3,20(sp)
    2010:	45c2                	lw	a1,16(sp)
    2012:	147d                	addi	s0,s0,-1
    2014:	9536                	add	a0,a0,a3
    2016:	00054703          	lbu	a4,0(a0)
    201a:	4532                	lw	a0,12(sp)
    201c:	00e40023          	sb	a4,0(s0)
    2020:	411010ef          	jal	3c30 <__hidden___udivsi3>
    2024:	4732                	lw	a4,12(sp)
    2026:	45c2                	lw	a1,16(sp)
    2028:	46d2                	lw	a3,20(sp)
    202a:	4662                	lw	a2,24(sp)
    202c:	87aa                	mv	a5,a0
    202e:	fcb779e3          	bgeu	a4,a1,2000 <_printf_i+0xf2>
    2032:	47a1                	li	a5,8
    2034:	00f59e63          	bne	a1,a5,2050 <_printf_i+0x142>
    2038:	409c                	lw	a5,0(s1)
    203a:	8b85                	andi	a5,a5,1
    203c:	cb91                	beqz	a5,2050 <_printf_i+0x142>
    203e:	40d8                	lw	a4,4(s1)
    2040:	489c                	lw	a5,16(s1)
    2042:	00e7c763          	blt	a5,a4,2050 <_printf_i+0x142>
    2046:	03000793          	li	a5,48
    204a:	fef40fa3          	sb	a5,-1(s0)
    204e:	147d                	addi	s0,s0,-1
    2050:	8e01                	sub	a2,a2,s0
    2052:	c890                	sw	a2,16(s1)
    2054:	4722                	lw	a4,8(sp)
    2056:	4692                	lw	a3,4(sp)
    2058:	4502                	lw	a0,0(sp)
    205a:	0870                	addi	a2,sp,28
    205c:	85a6                	mv	a1,s1
    205e:	3b55                	jal	1e12 <_printf_common>
    2060:	57fd                	li	a5,-1
    2062:	0cf51063          	bne	a0,a5,2122 <_printf_i+0x214>
    2066:	557d                	li	a0,-1
    2068:	50a2                	lw	ra,40(sp)
    206a:	5412                	lw	s0,36(sp)
    206c:	5482                	lw	s1,32(sp)
    206e:	02c10113          	addi	sp,sp,44
    2072:	8082                	ret
    2074:	409c                	lw	a5,0(s1)
    2076:	0207e793          	ori	a5,a5,32
    207a:	c09c                	sw	a5,0(s1)
    207c:	66ad                	lui	a3,0xb
    207e:	07800793          	li	a5,120
    2082:	8b068693          	addi	a3,a3,-1872 # a8b0 <__clz_tab+0x2d4>
    2086:	04f482a3          	sb	a5,69(s1)
    208a:	408c                	lw	a1,0(s1)
    208c:	4308                	lw	a0,0(a4)
    208e:	0805f313          	andi	t1,a1,128
    2092:	411c                	lw	a5,0(a0)
    2094:	0511                	addi	a0,a0,4
    2096:	00031863          	bnez	t1,20a6 <_printf_i+0x198>
    209a:	0405f313          	andi	t1,a1,64
    209e:	00030463          	beqz	t1,20a6 <_printf_i+0x198>
    20a2:	07c2                	slli	a5,a5,0x10
    20a4:	83c1                	srli	a5,a5,0x10
    20a6:	c308                	sw	a0,0(a4)
    20a8:	0015f713          	andi	a4,a1,1
    20ac:	c701                	beqz	a4,20b4 <_printf_i+0x1a6>
    20ae:	0205e593          	ori	a1,a1,32
    20b2:	c08c                	sw	a1,0(s1)
    20b4:	c799                	beqz	a5,20c2 <_printf_i+0x1b4>
    20b6:	45c1                	li	a1,16
    20b8:	b73d                	j	1fe6 <_printf_i+0xd8>
    20ba:	66ad                	lui	a3,0xb
    20bc:	89c68693          	addi	a3,a3,-1892 # a89c <__clz_tab+0x2c0>
    20c0:	b7d9                	j	2086 <_printf_i+0x178>
    20c2:	4098                	lw	a4,0(s1)
    20c4:	fdf77713          	andi	a4,a4,-33
    20c8:	c098                	sw	a4,0(s1)
    20ca:	b7f5                	j	20b6 <_printf_i+0x1a8>
    20cc:	45a9                	li	a1,10
    20ce:	bf21                	j	1fe6 <_printf_i+0xd8>
    20d0:	4094                	lw	a3,0(s1)
    20d2:	431c                	lw	a5,0(a4)
    20d4:	48cc                	lw	a1,20(s1)
    20d6:	0806f313          	andi	t1,a3,128
    20da:	00478513          	addi	a0,a5,4
    20de:	00030663          	beqz	t1,20ea <_printf_i+0x1dc>
    20e2:	c308                	sw	a0,0(a4)
    20e4:	439c                	lw	a5,0(a5)
    20e6:	c38c                	sw	a1,0(a5)
    20e8:	a801                	j	20f8 <_printf_i+0x1ea>
    20ea:	c308                	sw	a0,0(a4)
    20ec:	0406f693          	andi	a3,a3,64
    20f0:	439c                	lw	a5,0(a5)
    20f2:	daf5                	beqz	a3,20e6 <_printf_i+0x1d8>
    20f4:	00b79023          	sh	a1,0(a5)
    20f8:	0004a823          	sw	zero,16(s1)
    20fc:	8432                	mv	s0,a2
    20fe:	bf99                	j	2054 <_printf_i+0x146>
    2100:	431c                	lw	a5,0(a4)
    2102:	40d0                	lw	a2,4(s1)
    2104:	4581                	li	a1,0
    2106:	00478693          	addi	a3,a5,4
    210a:	c314                	sw	a3,0(a4)
    210c:	4380                	lw	s0,0(a5)
    210e:	8522                	mv	a0,s0
    2110:	2a3d                	jal	224e <memchr>
    2112:	c119                	beqz	a0,2118 <_printf_i+0x20a>
    2114:	8d01                	sub	a0,a0,s0
    2116:	c0c8                	sw	a0,4(s1)
    2118:	40dc                	lw	a5,4(s1)
    211a:	c89c                	sw	a5,16(s1)
    211c:	040481a3          	sb	zero,67(s1)
    2120:	bf15                	j	2054 <_printf_i+0x146>
    2122:	47a2                	lw	a5,8(sp)
    2124:	4894                	lw	a3,16(s1)
    2126:	4592                	lw	a1,4(sp)
    2128:	4502                	lw	a0,0(sp)
    212a:	8622                	mv	a2,s0
    212c:	9782                	jalr	a5
    212e:	57fd                	li	a5,-1
    2130:	f2f50be3          	beq	a0,a5,2066 <_printf_i+0x158>
    2134:	409c                	lw	a5,0(s1)
    2136:	8b89                	andi	a5,a5,2
    2138:	eb95                	bnez	a5,216c <_printf_i+0x25e>
    213a:	47f2                	lw	a5,28(sp)
    213c:	44c8                	lw	a0,12(s1)
    213e:	f2f555e3          	bge	a0,a5,2068 <_printf_i+0x15a>
    2142:	853e                	mv	a0,a5
    2144:	b715                	j	2068 <_printf_i+0x15a>
    2146:	c63e                	sw	a5,12(sp)
    2148:	4592                	lw	a1,4(sp)
    214a:	4502                	lw	a0,0(sp)
    214c:	47a2                	lw	a5,8(sp)
    214e:	4685                	li	a3,1
    2150:	01948613          	addi	a2,s1,25
    2154:	9782                	jalr	a5
    2156:	577d                	li	a4,-1
    2158:	f0e507e3          	beq	a0,a4,2066 <_printf_i+0x158>
    215c:	47b2                	lw	a5,12(sp)
    215e:	0785                	addi	a5,a5,1
    2160:	44d8                	lw	a4,12(s1)
    2162:	46f2                	lw	a3,28(sp)
    2164:	8f15                	sub	a4,a4,a3
    2166:	fee7c0e3          	blt	a5,a4,2146 <_printf_i+0x238>
    216a:	bfc1                	j	213a <_printf_i+0x22c>
    216c:	4781                	li	a5,0
    216e:	bfcd                	j	2160 <_printf_i+0x252>

00002170 <__swhatbuf_r>:
    2170:	7159                	addi	sp,sp,-112
    2172:	d4a2                	sw	s0,104(sp)
    2174:	842e                	mv	s0,a1
    2176:	00e59583          	lh	a1,14(a1)
    217a:	d2a6                	sw	s1,100(sp)
    217c:	d686                	sw	ra,108(sp)
    217e:	84b2                	mv	s1,a2
    2180:	0205d163          	bgez	a1,21a2 <__swhatbuf_r+0x32>
    2184:	00c45783          	lhu	a5,12(s0)
    2188:	0807f793          	andi	a5,a5,128
    218c:	ef8d                	bnez	a5,21c6 <__swhatbuf_r+0x56>
    218e:	40000713          	li	a4,1024
    2192:	50b6                	lw	ra,108(sp)
    2194:	5426                	lw	s0,104(sp)
    2196:	c29c                	sw	a5,0(a3)
    2198:	c098                	sw	a4,0(s1)
    219a:	4501                	li	a0,0
    219c:	5496                	lw	s1,100(sp)
    219e:	6165                	addi	sp,sp,112
    21a0:	8082                	ret
    21a2:	00f10613          	addi	a2,sp,15
    21a6:	9a61                	andi	a2,a2,-8
    21a8:	c236                	sw	a3,4(sp)
    21aa:	c032                	sw	a2,0(sp)
    21ac:	2875                	jal	2268 <_fstat_r>
    21ae:	4692                	lw	a3,4(sp)
    21b0:	fc054ae3          	bltz	a0,2184 <__swhatbuf_r+0x14>
    21b4:	4602                	lw	a2,0(sp)
    21b6:	673d                	lui	a4,0xf
    21b8:	425c                	lw	a5,4(a2)
    21ba:	8ff9                	and	a5,a5,a4
    21bc:	7779                	lui	a4,0xffffe
    21be:	97ba                	add	a5,a5,a4
    21c0:	0017b793          	seqz	a5,a5
    21c4:	b7e9                	j	218e <__swhatbuf_r+0x1e>
    21c6:	4781                	li	a5,0
    21c8:	04000713          	li	a4,64
    21cc:	b7d9                	j	2192 <__swhatbuf_r+0x22>

000021ce <__smakebuf_r>:
    21ce:	00c5d783          	lhu	a5,12(a1)
    21d2:	1121                	addi	sp,sp,-24
    21d4:	c822                	sw	s0,16(sp)
    21d6:	ca06                	sw	ra,20(sp)
    21d8:	c626                	sw	s1,12(sp)
    21da:	8b89                	andi	a5,a5,2
    21dc:	842e                	mv	s0,a1
    21de:	cf81                	beqz	a5,21f6 <__smakebuf_r+0x28>
    21e0:	04740793          	addi	a5,s0,71
    21e4:	c01c                	sw	a5,0(s0)
    21e6:	c81c                	sw	a5,16(s0)
    21e8:	4785                	li	a5,1
    21ea:	c85c                	sw	a5,20(s0)
    21ec:	40d2                	lw	ra,20(sp)
    21ee:	4442                	lw	s0,16(sp)
    21f0:	44b2                	lw	s1,12(sp)
    21f2:	0161                	addi	sp,sp,24
    21f4:	8082                	ret
    21f6:	0034                	addi	a3,sp,8
    21f8:	0050                	addi	a2,sp,4
    21fa:	84aa                	mv	s1,a0
    21fc:	3f95                	jal	2170 <__swhatbuf_r>
    21fe:	4592                	lw	a1,4(sp)
    2200:	8526                	mv	a0,s1
    2202:	c02e                	sw	a1,0(sp)
    2204:	c7eff0ef          	jal	1682 <_malloc_r>
    2208:	00c41783          	lh	a5,12(s0)
    220c:	4582                	lw	a1,0(sp)
    220e:	e911                	bnez	a0,2222 <__smakebuf_r+0x54>
    2210:	2007f713          	andi	a4,a5,512
    2214:	ff61                	bnez	a4,21ec <__smakebuf_r+0x1e>
    2216:	9bf1                	andi	a5,a5,-4
    2218:	0027e793          	ori	a5,a5,2
    221c:	00f41623          	sh	a5,12(s0)
    2220:	b7c1                	j	21e0 <__smakebuf_r+0x12>
    2222:	0807e793          	ori	a5,a5,128
    2226:	00f41623          	sh	a5,12(s0)
    222a:	47a2                	lw	a5,8(sp)
    222c:	c008                	sw	a0,0(s0)
    222e:	c808                	sw	a0,16(s0)
    2230:	c84c                	sw	a1,20(s0)
    2232:	dfcd                	beqz	a5,21ec <__smakebuf_r+0x1e>
    2234:	00e41583          	lh	a1,14(s0)
    2238:	8526                	mv	a0,s1
    223a:	28b1                	jal	2296 <_isatty_r>
    223c:	d945                	beqz	a0,21ec <__smakebuf_r+0x1e>
    223e:	00c45783          	lhu	a5,12(s0)
    2242:	9bf1                	andi	a5,a5,-4
    2244:	0017e793          	ori	a5,a5,1
    2248:	00f41623          	sh	a5,12(s0)
    224c:	b745                	j	21ec <__smakebuf_r+0x1e>

0000224e <memchr>:
    224e:	0ff5f593          	zext.b	a1,a1
    2252:	962a                	add	a2,a2,a0
    2254:	00c51463          	bne	a0,a2,225c <memchr+0xe>
    2258:	4501                	li	a0,0
    225a:	8082                	ret
    225c:	00054783          	lbu	a5,0(a0)
    2260:	feb78de3          	beq	a5,a1,225a <memchr+0xc>
    2264:	0505                	addi	a0,a0,1
    2266:	b7fd                	j	2254 <memchr+0x6>

00002268 <_fstat_r>:
    2268:	1151                	addi	sp,sp,-12
    226a:	c222                	sw	s0,4(sp)
    226c:	c026                	sw	s1,0(sp)
    226e:	84aa                	mv	s1,a0
    2270:	852e                	mv	a0,a1
    2272:	85b2                	mv	a1,a2
    2274:	c406                	sw	ra,8(sp)
    2276:	9401a823          	sw	zero,-1712(gp) # b374 <errno>
    227a:	e71fe0ef          	jal	10ea <_fstat>
    227e:	57fd                	li	a5,-1
    2280:	00f51663          	bne	a0,a5,228c <_fstat_r+0x24>
    2284:	9501a783          	lw	a5,-1712(gp) # b374 <errno>
    2288:	c391                	beqz	a5,228c <_fstat_r+0x24>
    228a:	c09c                	sw	a5,0(s1)
    228c:	40a2                	lw	ra,8(sp)
    228e:	4412                	lw	s0,4(sp)
    2290:	4482                	lw	s1,0(sp)
    2292:	0131                	addi	sp,sp,12
    2294:	8082                	ret

00002296 <_isatty_r>:
    2296:	1151                	addi	sp,sp,-12
    2298:	c222                	sw	s0,4(sp)
    229a:	c026                	sw	s1,0(sp)
    229c:	84aa                	mv	s1,a0
    229e:	852e                	mv	a0,a1
    22a0:	c406                	sw	ra,8(sp)
    22a2:	9401a823          	sw	zero,-1712(gp) # b374 <errno>
    22a6:	e4dfe0ef          	jal	10f2 <_isatty>
    22aa:	57fd                	li	a5,-1
    22ac:	00f51663          	bne	a0,a5,22b8 <_isatty_r+0x22>
    22b0:	9501a783          	lw	a5,-1712(gp) # b374 <errno>
    22b4:	c391                	beqz	a5,22b8 <_isatty_r+0x22>
    22b6:	c09c                	sw	a5,0(s1)
    22b8:	40a2                	lw	ra,8(sp)
    22ba:	4412                	lw	s0,4(sp)
    22bc:	4482                	lw	s1,0(sp)
    22be:	0131                	addi	sp,sp,12
    22c0:	8082                	ret

000022c2 <sqrt>:
    22c2:	1131                	addi	sp,sp,-20
    22c4:	c622                	sw	s0,12(sp)
    22c6:	c426                	sw	s1,8(sp)
    22c8:	c806                	sw	ra,16(sp)
    22ca:	c02a                	sw	a0,0(sp)
    22cc:	c22e                	sw	a1,4(sp)
    22ce:	20a1                	jal	2316 <__ieee754_sqrt>
    22d0:	4602                	lw	a2,0(sp)
    22d2:	4692                	lw	a3,4(sp)
    22d4:	842a                	mv	s0,a0
    22d6:	84ae                	mv	s1,a1
    22d8:	8532                	mv	a0,a2
    22da:	85b6                	mv	a1,a3
    22dc:	105010ef          	jal	3be0 <__unorddf2>
    22e0:	e505                	bnez	a0,2308 <sqrt+0x46>
    22e2:	4502                	lw	a0,0(sp)
    22e4:	4592                	lw	a1,4(sp)
    22e6:	4601                	li	a2,0
    22e8:	4681                	li	a3,0
    22ea:	1f7010ef          	jal	3ce0 <__ledf2>
    22ee:	00055d63          	bgez	a0,2308 <sqrt+0x46>
    22f2:	383d                	jal	1b30 <__errno>
    22f4:	02100793          	li	a5,33
    22f8:	4601                	li	a2,0
    22fa:	4681                	li	a3,0
    22fc:	c11c                	sw	a5,0(a0)
    22fe:	85b6                	mv	a1,a3
    2300:	8532                	mv	a0,a2
    2302:	2f69                	jal	2a9c <__divdf3>
    2304:	842a                	mv	s0,a0
    2306:	84ae                	mv	s1,a1
    2308:	40c2                	lw	ra,16(sp)
    230a:	8522                	mv	a0,s0
    230c:	4432                	lw	s0,12(sp)
    230e:	85a6                	mv	a1,s1
    2310:	44a2                	lw	s1,8(sp)
    2312:	0151                	addi	sp,sp,20
    2314:	8082                	ret

00002316 <__ieee754_sqrt>:
    2316:	1121                	addi	sp,sp,-24
    2318:	7ff007b7          	lui	a5,0x7ff00
    231c:	c822                	sw	s0,16(sp)
    231e:	c626                	sw	s1,12(sp)
    2320:	ca06                	sw	ra,20(sp)
    2322:	00b7f733          	and	a4,a5,a1
    2326:	84aa                	mv	s1,a0
    2328:	842e                	mv	s0,a1
    232a:	02f71463          	bne	a4,a5,2352 <__ieee754_sqrt+0x3c>
    232e:	862a                	mv	a2,a0
    2330:	86ae                	mv	a3,a1
    2332:	5ff000ef          	jal	3130 <__muldf3>
    2336:	862a                	mv	a2,a0
    2338:	86ae                	mv	a3,a1
    233a:	8526                	mv	a0,s1
    233c:	85a2                	mv	a1,s0
    233e:	2a5d                	jal	24f4 <__adddf3>
    2340:	84aa                	mv	s1,a0
    2342:	842e                	mv	s0,a1
    2344:	40d2                	lw	ra,20(sp)
    2346:	85a2                	mv	a1,s0
    2348:	4442                	lw	s0,16(sp)
    234a:	8526                	mv	a0,s1
    234c:	44b2                	lw	s1,12(sp)
    234e:	0161                	addi	sp,sp,24
    2350:	8082                	ret
    2352:	872e                	mv	a4,a1
    2354:	87aa                	mv	a5,a0
    2356:	02b04163          	bgtz	a1,2378 <__ieee754_sqrt+0x62>
    235a:	00159693          	slli	a3,a1,0x1
    235e:	8285                	srli	a3,a3,0x1
    2360:	8ec9                	or	a3,a3,a0
    2362:	d2ed                	beqz	a3,2344 <__ieee754_sqrt+0x2e>
    2364:	4681                	li	a3,0
    2366:	c195                	beqz	a1,238a <__ieee754_sqrt+0x74>
    2368:	862a                	mv	a2,a0
    236a:	86ae                	mv	a3,a1
    236c:	2be010ef          	jal	362a <__subdf3>
    2370:	862a                	mv	a2,a0
    2372:	86ae                	mv	a3,a1
    2374:	2725                	jal	2a9c <__divdf3>
    2376:	b7e9                	j	2340 <__ieee754_sqrt+0x2a>
    2378:	4145d693          	srai	a3,a1,0x14
    237c:	ea95                	bnez	a3,23b0 <__ieee754_sqrt+0x9a>
    237e:	4601                	li	a2,0
    2380:	a809                	j	2392 <__ieee754_sqrt+0x7c>
    2382:	00b7d713          	srli	a4,a5,0xb
    2386:	16ad                	addi	a3,a3,-21
    2388:	07d6                	slli	a5,a5,0x15
    238a:	df65                	beqz	a4,2382 <__ieee754_sqrt+0x6c>
    238c:	bfcd                	j	237e <__ieee754_sqrt+0x68>
    238e:	0706                	slli	a4,a4,0x1
    2390:	0605                	addi	a2,a2,1
    2392:	00b71593          	slli	a1,a4,0xb
    2396:	fe05dce3          	bgez	a1,238e <__ieee754_sqrt+0x78>
    239a:	fff60593          	addi	a1,a2,-1
    239e:	8e8d                	sub	a3,a3,a1
    23a0:	02000593          	li	a1,32
    23a4:	8d91                	sub	a1,a1,a2
    23a6:	00b7d5b3          	srl	a1,a5,a1
    23aa:	8f4d                	or	a4,a4,a1
    23ac:	00c797b3          	sll	a5,a5,a2
    23b0:	c0168613          	addi	a2,a3,-1023
    23b4:	001006b7          	lui	a3,0x100
    23b8:	fff68593          	addi	a1,a3,-1 # fffff <_sp+0xf3a2f>
    23bc:	8f6d                	and	a4,a4,a1
    23be:	8ed9                	or	a3,a3,a4
    23c0:	00167713          	andi	a4,a2,1
    23c4:	c711                	beqz	a4,23d0 <__ieee754_sqrt+0xba>
    23c6:	01f7d713          	srli	a4,a5,0x1f
    23ca:	0686                	slli	a3,a3,0x1
    23cc:	96ba                	add	a3,a3,a4
    23ce:	0786                	slli	a5,a5,0x1
    23d0:	40165713          	srai	a4,a2,0x1
    23d4:	0686                	slli	a3,a3,0x1
    23d6:	c43a                	sw	a4,8(sp)
    23d8:	01f7d713          	srli	a4,a5,0x1f
    23dc:	9736                	add	a4,a4,a3
    23de:	0786                	slli	a5,a5,0x1
    23e0:	4659                	li	a2,22
    23e2:	4481                	li	s1,0
    23e4:	4681                	li	a3,0
    23e6:	002005b7          	lui	a1,0x200
    23ea:	00b68533          	add	a0,a3,a1
    23ee:	00a74663          	blt	a4,a0,23fa <__ieee754_sqrt+0xe4>
    23f2:	00b506b3          	add	a3,a0,a1
    23f6:	8f09                	sub	a4,a4,a0
    23f8:	94ae                	add	s1,s1,a1
    23fa:	01f7d513          	srli	a0,a5,0x1f
    23fe:	0706                	slli	a4,a4,0x1
    2400:	167d                	addi	a2,a2,-1
    2402:	972a                	add	a4,a4,a0
    2404:	0786                	slli	a5,a5,0x1
    2406:	8185                	srli	a1,a1,0x1
    2408:	f26d                	bnez	a2,23ea <__ieee754_sqrt+0xd4>
    240a:	4401                	li	s0,0
    240c:	02000293          	li	t0,32
    2410:	800005b7          	lui	a1,0x80000
    2414:	00c58333          	add	t1,a1,a2
    2418:	00e6c663          	blt	a3,a4,2424 <__ieee754_sqrt+0x10e>
    241c:	02d71463          	bne	a4,a3,2444 <__ieee754_sqrt+0x12e>
    2420:	0267e263          	bltu	a5,t1,2444 <__ieee754_sqrt+0x12e>
    2424:	00b30633          	add	a2,t1,a1
    2428:	fff64513          	not	a0,a2
    242c:	00657533          	and	a0,a0,t1
    2430:	8f15                	sub	a4,a4,a3
    2432:	0067b3b3          	sltu	t2,a5,t1
    2436:	817d                	srli	a0,a0,0x1f
    2438:	40770733          	sub	a4,a4,t2
    243c:	406787b3          	sub	a5,a5,t1
    2440:	942e                	add	s0,s0,a1
    2442:	96aa                	add	a3,a3,a0
    2444:	01f7d513          	srli	a0,a5,0x1f
    2448:	0706                	slli	a4,a4,0x1
    244a:	12fd                	addi	t0,t0,-1
    244c:	972a                	add	a4,a4,a0
    244e:	0786                	slli	a5,a5,0x1
    2450:	8185                	srli	a1,a1,0x1
    2452:	fc0291e3          	bnez	t0,2414 <__ieee754_sqrt+0xfe>
    2456:	8f5d                	or	a4,a4,a5
    2458:	c731                	beqz	a4,24a4 <__ieee754_sqrt+0x18e>
    245a:	93c1a503          	lw	a0,-1732(gp) # b360 <one>
    245e:	9401a583          	lw	a1,-1728(gp) # b364 <one+0x4>
    2462:	9341a603          	lw	a2,-1740(gp) # b358 <tiny>
    2466:	9381a683          	lw	a3,-1736(gp) # b35c <tiny+0x4>
    246a:	93c1a303          	lw	t1,-1732(gp) # b360 <one>
    246e:	9401a383          	lw	t2,-1728(gp) # b364 <one+0x4>
    2472:	c01a                	sw	t1,0(sp)
    2474:	c21e                	sw	t2,4(sp)
    2476:	1b4010ef          	jal	362a <__subdf3>
    247a:	862a                	mv	a2,a0
    247c:	86ae                	mv	a3,a1
    247e:	4502                	lw	a0,0(sp)
    2480:	4592                	lw	a1,4(sp)
    2482:	05f010ef          	jal	3ce0 <__ledf2>
    2486:	00a04f63          	bgtz	a0,24a4 <__ieee754_sqrt+0x18e>
    248a:	93c1a503          	lw	a0,-1732(gp) # b360 <one>
    248e:	9401a583          	lw	a1,-1728(gp) # b364 <one+0x4>
    2492:	9341a603          	lw	a2,-1740(gp) # b358 <tiny>
    2496:	9381a683          	lw	a3,-1736(gp) # b35c <tiny+0x4>
    249a:	577d                	li	a4,-1
    249c:	02e41563          	bne	s0,a4,24c6 <__ieee754_sqrt+0x1b0>
    24a0:	0485                	addi	s1,s1,1
    24a2:	4401                	li	s0,0
    24a4:	4014d693          	srai	a3,s1,0x1
    24a8:	3fe007b7          	lui	a5,0x3fe00
    24ac:	96be                	add	a3,a3,a5
    24ae:	47a2                	lw	a5,8(sp)
    24b0:	01f49713          	slli	a4,s1,0x1f
    24b4:	01479613          	slli	a2,a5,0x14
    24b8:	00145793          	srli	a5,s0,0x1
    24bc:	00f764b3          	or	s1,a4,a5
    24c0:	00d60433          	add	s0,a2,a3
    24c4:	b541                	j	2344 <__ieee754_sqrt+0x2e>
    24c6:	93c1a703          	lw	a4,-1732(gp) # b360 <one>
    24ca:	9401a783          	lw	a5,-1728(gp) # b364 <one+0x4>
    24ce:	c03a                	sw	a4,0(sp)
    24d0:	c23e                	sw	a5,4(sp)
    24d2:	200d                	jal	24f4 <__adddf3>
    24d4:	862a                	mv	a2,a0
    24d6:	86ae                	mv	a3,a1
    24d8:	4502                	lw	a0,0(sp)
    24da:	4592                	lw	a1,4(sp)
    24dc:	005010ef          	jal	3ce0 <__ledf2>
    24e0:	00055763          	bgez	a0,24ee <__ieee754_sqrt+0x1d8>
    24e4:	0409                	addi	s0,s0,2
    24e6:	00143793          	seqz	a5,s0
    24ea:	94be                	add	s1,s1,a5
    24ec:	bf65                	j	24a4 <__ieee754_sqrt+0x18e>
    24ee:	0405                	addi	s0,s0,1
    24f0:	9879                	andi	s0,s0,-2
    24f2:	bf4d                	j	24a4 <__ieee754_sqrt+0x18e>

000024f4 <__adddf3>:
  FP_DECL_D (B);
  FP_DECL_D (R);
  DFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_SEMIRAW_D (A, a);
    24f4:	00100737          	lui	a4,0x100
    24f8:	177d                	addi	a4,a4,-1 # fffff <_sp+0xf3a2f>
{
    24fa:	1131                	addi	sp,sp,-20
  FP_UNPACK_SEMIRAW_D (A, a);
    24fc:	00b777b3          	and	a5,a4,a1
  FP_UNPACK_SEMIRAW_D (B, b);
    2500:	0146d293          	srli	t0,a3,0x14
    2504:	8f75                	and	a4,a4,a3
{
    2506:	c622                	sw	s0,12(sp)
    2508:	c426                	sw	s1,8(sp)
  FP_UNPACK_SEMIRAW_D (A, a);
    250a:	0145d413          	srli	s0,a1,0x14
    250e:	01f5d493          	srli	s1,a1,0x1f
    2512:	078e                	slli	a5,a5,0x3
    2514:	01d55593          	srli	a1,a0,0x1d
    2518:	7ff47413          	andi	s0,s0,2047
    251c:	8fcd                	or	a5,a5,a1
  FP_UNPACK_SEMIRAW_D (B, b);
    251e:	7ff2f293          	andi	t0,t0,2047
    2522:	01d65593          	srli	a1,a2,0x1d
    2526:	070e                	slli	a4,a4,0x3
{
    2528:	c806                	sw	ra,16(sp)
  FP_UNPACK_SEMIRAW_D (B, b);
    252a:	82fd                	srli	a3,a3,0x1f
    252c:	8f4d                	or	a4,a4,a1
  FP_UNPACK_SEMIRAW_D (A, a);
    252e:	050e                	slli	a0,a0,0x3
  FP_UNPACK_SEMIRAW_D (B, b);
    2530:	060e                	slli	a2,a2,0x3
  FP_ADD_D (R, A, B);
    2532:	405405b3          	sub	a1,s0,t0
    2536:	7ff00313          	li	t1,2047
    253a:	24d49963          	bne	s1,a3,278c <__adddf3+0x298>
    253e:	0cb05b63          	blez	a1,2614 <__adddf3+0x120>
    2542:	02029463          	bnez	t0,256a <__adddf3+0x76>
    2546:	00c766b3          	or	a3,a4,a2
    254a:	ce91                	beqz	a3,2566 <__adddf3+0x72>
    254c:	fff40593          	addi	a1,s0,-1
    2550:	e989                	bnez	a1,2562 <__adddf3+0x6e>
    2552:	962a                	add	a2,a2,a0
    2554:	973e                	add	a4,a4,a5
    2556:	00a63533          	sltu	a0,a2,a0
    255a:	00a707b3          	add	a5,a4,a0
    255e:	4405                	li	s0,1
    2560:	a891                	j	25b4 <__adddf3+0xc0>
    2562:	00641963          	bne	s0,t1,2574 <__adddf3+0x80>
    2566:	862a                	mv	a2,a0
    2568:	a251                	j	26ec <__adddf3+0x1f8>
    256a:	fe640ee3          	beq	s0,t1,2566 <__adddf3+0x72>
    256e:	008006b7          	lui	a3,0x800
    2572:	8f55                	or	a4,a4,a3
    2574:	03800693          	li	a3,56
    2578:	08b6c963          	blt	a3,a1,260a <__adddf3+0x116>
    257c:	46fd                	li	a3,31
    257e:	02000293          	li	t0,32
    2582:	04b6cf63          	blt	a3,a1,25e0 <__adddf3+0xec>
    2586:	40b282b3          	sub	t0,t0,a1
    258a:	005716b3          	sll	a3,a4,t0
    258e:	00b65333          	srl	t1,a2,a1
    2592:	005612b3          	sll	t0,a2,t0
    2596:	0066e6b3          	or	a3,a3,t1
    259a:	005032b3          	snez	t0,t0
    259e:	0056e6b3          	or	a3,a3,t0
    25a2:	00b755b3          	srl	a1,a4,a1
    25a6:	00a68633          	add	a2,a3,a0
    25aa:	95be                	add	a1,a1,a5
    25ac:	00d636b3          	sltu	a3,a2,a3
    25b0:	00d587b3          	add	a5,a1,a3
    25b4:	00879713          	slli	a4,a5,0x8
    25b8:	18075e63          	bgez	a4,2754 <__adddf3+0x260>
    25bc:	0405                	addi	s0,s0,1
    25be:	7ff00713          	li	a4,2047
    25c2:	4ce40063          	beq	s0,a4,2a82 <__adddf3+0x58e>
    25c6:	ff800737          	lui	a4,0xff800
    25ca:	177d                	addi	a4,a4,-1 # ff7fffff <_sp+0xff7f3a2f>
    25cc:	8ff9                	and	a5,a5,a4
    25ce:	00165713          	srli	a4,a2,0x1
    25d2:	8a05                	andi	a2,a2,1
    25d4:	8f51                	or	a4,a4,a2
    25d6:	01f79613          	slli	a2,a5,0x1f
    25da:	8e59                	or	a2,a2,a4
    25dc:	8385                	srli	a5,a5,0x1
    25de:	aa9d                	j	2754 <__adddf3+0x260>
    25e0:	fe058693          	addi	a3,a1,-32 # 7fffffe0 <_sp+0x7fff3a10>
    25e4:	00d756b3          	srl	a3,a4,a3
    25e8:	4301                	li	t1,0
    25ea:	00558863          	beq	a1,t0,25fa <__adddf3+0x106>
    25ee:	04000313          	li	t1,64
    25f2:	40b30333          	sub	t1,t1,a1
    25f6:	00671333          	sll	t1,a4,t1
    25fa:	00c36333          	or	t1,t1,a2
    25fe:	00603333          	snez	t1,t1
    2602:	0066e6b3          	or	a3,a3,t1
    2606:	4581                	li	a1,0
    2608:	bf79                	j	25a6 <__adddf3+0xb2>
    260a:	00c766b3          	or	a3,a4,a2
    260e:	00d036b3          	snez	a3,a3
    2612:	bfd5                	j	2606 <__adddf3+0x112>
    2614:	cdd9                	beqz	a1,26b2 <__adddf3+0x1be>
    2616:	408286b3          	sub	a3,t0,s0
    261a:	ec01                	bnez	s0,2632 <__adddf3+0x13e>
    261c:	00a7e5b3          	or	a1,a5,a0
    2620:	c591                	beqz	a1,262c <__adddf3+0x138>
    2622:	fff68593          	addi	a1,a3,-1 # 7fffff <_sp+0x7f3a2f>
    2626:	d595                	beqz	a1,2552 <__adddf3+0x5e>
    2628:	00669b63          	bne	a3,t1,263e <__adddf3+0x14a>
    262c:	87ba                	mv	a5,a4
    262e:	8436                	mv	s0,a3
    2630:	a875                	j	26ec <__adddf3+0x1f8>
    2632:	44628c63          	beq	t0,t1,2a8a <__adddf3+0x596>
    2636:	008005b7          	lui	a1,0x800
    263a:	8fcd                	or	a5,a5,a1
    263c:	85b6                	mv	a1,a3
    263e:	03800693          	li	a3,56
    2642:	06b6c363          	blt	a3,a1,26a8 <__adddf3+0x1b4>
    2646:	46fd                	li	a3,31
    2648:	02000393          	li	t2,32
    264c:	02b6c963          	blt	a3,a1,267e <__adddf3+0x18a>
    2650:	40b383b3          	sub	t2,t2,a1
    2654:	007796b3          	sll	a3,a5,t2
    2658:	00b55333          	srl	t1,a0,a1
    265c:	007513b3          	sll	t2,a0,t2
    2660:	0066e6b3          	or	a3,a3,t1
    2664:	007033b3          	snez	t2,t2
    2668:	0076e6b3          	or	a3,a3,t2
    266c:	00b7d7b3          	srl	a5,a5,a1
    2670:	9636                	add	a2,a2,a3
    2672:	97ba                	add	a5,a5,a4
    2674:	00d636b3          	sltu	a3,a2,a3
    2678:	97b6                	add	a5,a5,a3
    267a:	8416                	mv	s0,t0
    267c:	bf25                	j	25b4 <__adddf3+0xc0>
    267e:	fe058693          	addi	a3,a1,-32 # 7fffe0 <_sp+0x7f3a10>
    2682:	00d7d6b3          	srl	a3,a5,a3
    2686:	4301                	li	t1,0
    2688:	00758863          	beq	a1,t2,2698 <__adddf3+0x1a4>
    268c:	04000313          	li	t1,64
    2690:	40b30333          	sub	t1,t1,a1
    2694:	00679333          	sll	t1,a5,t1
    2698:	00a36333          	or	t1,t1,a0
    269c:	00603333          	snez	t1,t1
    26a0:	0066e6b3          	or	a3,a3,t1
    26a4:	4781                	li	a5,0
    26a6:	b7e9                	j	2670 <__adddf3+0x17c>
    26a8:	00a7e6b3          	or	a3,a5,a0
    26ac:	00d036b3          	snez	a3,a3
    26b0:	bfd5                	j	26a4 <__adddf3+0x1b0>
    26b2:	00140693          	addi	a3,s0,1
    26b6:	7fe6f593          	andi	a1,a3,2046
    26ba:	edbd                	bnez	a1,2738 <__adddf3+0x244>
    26bc:	00a7e6b3          	or	a3,a5,a0
    26c0:	e42d                	bnez	s0,272a <__adddf3+0x236>
    26c2:	3a068863          	beqz	a3,2a72 <__adddf3+0x57e>
    26c6:	00c766b3          	or	a3,a4,a2
    26ca:	3a068663          	beqz	a3,2a76 <__adddf3+0x582>
    26ce:	962a                	add	a2,a2,a0
    26d0:	973e                	add	a4,a4,a5
    26d2:	00a63533          	sltu	a0,a2,a0
    26d6:	00a707b3          	add	a5,a4,a0
    26da:	00879713          	slli	a4,a5,0x8
    26de:	26075d63          	bgez	a4,2958 <__adddf3+0x464>
    26e2:	ff800737          	lui	a4,0xff800
    26e6:	177d                	addi	a4,a4,-1 # ff7fffff <_sp+0xff7f3a2f>
    26e8:	8ff9                	and	a5,a5,a4
    26ea:	4405                	li	s0,1
  FP_PACK_SEMIRAW_D (r, R);
    26ec:	01d79713          	slli	a4,a5,0x1d
    26f0:	820d                	srli	a2,a2,0x3
    26f2:	7ff00693          	li	a3,2047
    26f6:	8f51                	or	a4,a4,a2
    26f8:	838d                	srli	a5,a5,0x3
    26fa:	00d41963          	bne	s0,a3,270c <__adddf3+0x218>
    26fe:	8f5d                	or	a4,a4,a5
    2700:	4781                	li	a5,0
    2702:	c709                	beqz	a4,270c <__adddf3+0x218>
    2704:	000807b7          	lui	a5,0x80
    2708:	4701                	li	a4,0
    270a:	4481                	li	s1,0
    270c:	7ff47413          	andi	s0,s0,2047
    2710:	07b2                	slli	a5,a5,0xc
    2712:	0452                	slli	s0,s0,0x14
    2714:	83b1                	srli	a5,a5,0xc
    2716:	8c5d                	or	s0,s0,a5
    2718:	04fe                	slli	s1,s1,0x1f
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    271a:	009465b3          	or	a1,s0,s1
    271e:	40c2                	lw	ra,16(sp)
    2720:	4432                	lw	s0,12(sp)
    2722:	44a2                	lw	s1,8(sp)
    2724:	853a                	mv	a0,a4
    2726:	0151                	addi	sp,sp,20
    2728:	8082                	ret
  FP_ADD_D (R, A, B);
    272a:	34068863          	beqz	a3,2a7a <__adddf3+0x586>
    272e:	8f51                	or	a4,a4,a2
    2730:	24071663          	bnez	a4,297c <__adddf3+0x488>
    2734:	862a                	mv	a2,a0
    2736:	a699                	j	2a7c <__adddf3+0x588>
    2738:	34668463          	beq	a3,t1,2a80 <__adddf3+0x58c>
    273c:	962a                	add	a2,a2,a0
    273e:	973e                	add	a4,a4,a5
    2740:	00a63533          	sltu	a0,a2,a0
    2744:	972a                	add	a4,a4,a0
    2746:	01f71793          	slli	a5,a4,0x1f
    274a:	8205                	srli	a2,a2,0x1
    274c:	8e5d                	or	a2,a2,a5
    274e:	8436                	mv	s0,a3
    2750:	00175793          	srli	a5,a4,0x1
  FP_PACK_SEMIRAW_D (r, R);
    2754:	00767713          	andi	a4,a2,7
    2758:	cf01                	beqz	a4,2770 <__adddf3+0x27c>
    275a:	00f67713          	andi	a4,a2,15
    275e:	4691                	li	a3,4
    2760:	00d70863          	beq	a4,a3,2770 <__adddf3+0x27c>
    2764:	00d60733          	add	a4,a2,a3
    2768:	00c736b3          	sltu	a3,a4,a2
    276c:	97b6                	add	a5,a5,a3
    276e:	863a                	mv	a2,a4
    2770:	00879713          	slli	a4,a5,0x8
    2774:	f6075ce3          	bgez	a4,26ec <__adddf3+0x1f8>
    2778:	0405                	addi	s0,s0,1
    277a:	7ff00713          	li	a4,2047
    277e:	30e40263          	beq	s0,a4,2a82 <__adddf3+0x58e>
    2782:	ff800737          	lui	a4,0xff800
    2786:	177d                	addi	a4,a4,-1 # ff7fffff <_sp+0xff7f3a2f>
    2788:	8ff9                	and	a5,a5,a4
    278a:	b78d                	j	26ec <__adddf3+0x1f8>
  FP_ADD_D (R, A, B);
    278c:	0cb05263          	blez	a1,2850 <__adddf3+0x35c>
    2790:	08029063          	bnez	t0,2810 <__adddf3+0x31c>
    2794:	00c766b3          	or	a3,a4,a2
    2798:	dc0687e3          	beqz	a3,2566 <__adddf3+0x72>
    279c:	fff40593          	addi	a1,s0,-1
    27a0:	e999                	bnez	a1,27b6 <__adddf3+0x2c2>
    27a2:	40c50633          	sub	a2,a0,a2
    27a6:	40e78733          	sub	a4,a5,a4
    27aa:	00c53533          	sltu	a0,a0,a2
    27ae:	40a707b3          	sub	a5,a4,a0
    27b2:	4405                	li	s0,1
    27b4:	a0a1                	j	27fc <__adddf3+0x308>
    27b6:	da6408e3          	beq	s0,t1,2566 <__adddf3+0x72>
    27ba:	03800693          	li	a3,56
    27be:	08b6c463          	blt	a3,a1,2846 <__adddf3+0x352>
    27c2:	46fd                	li	a3,31
    27c4:	02000293          	li	t0,32
    27c8:	04b6ca63          	blt	a3,a1,281c <__adddf3+0x328>
    27cc:	40b282b3          	sub	t0,t0,a1
    27d0:	005716b3          	sll	a3,a4,t0
    27d4:	00b65333          	srl	t1,a2,a1
    27d8:	005612b3          	sll	t0,a2,t0
    27dc:	0066e6b3          	or	a3,a3,t1
    27e0:	005032b3          	snez	t0,t0
    27e4:	0056e6b3          	or	a3,a3,t0
    27e8:	00b755b3          	srl	a1,a4,a1
    27ec:	40d50633          	sub	a2,a0,a3
    27f0:	40b785b3          	sub	a1,a5,a1
    27f4:	00c53533          	sltu	a0,a0,a2
    27f8:	40a587b3          	sub	a5,a1,a0
    27fc:	00879713          	slli	a4,a5,0x8
    2800:	f4075ae3          	bgez	a4,2754 <__adddf3+0x260>
    2804:	008005b7          	lui	a1,0x800
    2808:	15fd                	addi	a1,a1,-1 # 7fffff <_sp+0x7f3a2f>
    280a:	8dfd                	and	a1,a1,a5
    280c:	8332                	mv	t1,a2
    280e:	a265                	j	29b6 <__adddf3+0x4c2>
    2810:	d4640be3          	beq	s0,t1,2566 <__adddf3+0x72>
    2814:	008006b7          	lui	a3,0x800
    2818:	8f55                	or	a4,a4,a3
    281a:	b745                	j	27ba <__adddf3+0x2c6>
    281c:	fe058693          	addi	a3,a1,-32
    2820:	00d756b3          	srl	a3,a4,a3
    2824:	4301                	li	t1,0
    2826:	00558863          	beq	a1,t0,2836 <__adddf3+0x342>
    282a:	04000313          	li	t1,64
    282e:	40b30333          	sub	t1,t1,a1
    2832:	00671333          	sll	t1,a4,t1
    2836:	00c36333          	or	t1,t1,a2
    283a:	00603333          	snez	t1,t1
    283e:	0066e6b3          	or	a3,a3,t1
    2842:	4581                	li	a1,0
    2844:	b765                	j	27ec <__adddf3+0x2f8>
    2846:	00c766b3          	or	a3,a4,a2
    284a:	00d036b3          	snez	a3,a3
    284e:	bfd5                	j	2842 <__adddf3+0x34e>
    2850:	cdcd                	beqz	a1,290a <__adddf3+0x416>
    2852:	408283b3          	sub	t2,t0,s0
    2856:	e41d                	bnez	s0,2884 <__adddf3+0x390>
    2858:	00a7e5b3          	or	a1,a5,a0
    285c:	c185                	beqz	a1,287c <__adddf3+0x388>
    285e:	fff38593          	addi	a1,t2,-1
    2862:	e999                	bnez	a1,2878 <__adddf3+0x384>
    2864:	40a60533          	sub	a0,a2,a0
    2868:	00a635b3          	sltu	a1,a2,a0
    286c:	8f1d                	sub	a4,a4,a5
    286e:	862a                	mv	a2,a0
    2870:	40b707b3          	sub	a5,a4,a1
    2874:	84b6                	mv	s1,a3
    2876:	bf35                	j	27b2 <__adddf3+0x2be>
    2878:	00639c63          	bne	t2,t1,2890 <__adddf3+0x39c>
    287c:	84b6                	mv	s1,a3
    287e:	87ba                	mv	a5,a4
    2880:	841e                	mv	s0,t2
    2882:	b5ad                	j	26ec <__adddf3+0x1f8>
    2884:	20628263          	beq	t0,t1,2a88 <__adddf3+0x594>
    2888:	008005b7          	lui	a1,0x800
    288c:	8fcd                	or	a5,a5,a1
    288e:	859e                	mv	a1,t2
    2890:	03800313          	li	t1,56
    2894:	06b34763          	blt	t1,a1,2902 <__adddf3+0x40e>
    2898:	437d                	li	t1,31
    289a:	02000413          	li	s0,32
    289e:	02b34d63          	blt	t1,a1,28d8 <__adddf3+0x3e4>
    28a2:	8c0d                	sub	s0,s0,a1
    28a4:	00b553b3          	srl	t2,a0,a1
    28a8:	00879333          	sll	t1,a5,s0
    28ac:	00851433          	sll	s0,a0,s0
    28b0:	00736333          	or	t1,t1,t2
    28b4:	00803433          	snez	s0,s0
    28b8:	00836533          	or	a0,t1,s0
    28bc:	00b7d5b3          	srl	a1,a5,a1
    28c0:	40a60533          	sub	a0,a2,a0
    28c4:	00a637b3          	sltu	a5,a2,a0
    28c8:	40b705b3          	sub	a1,a4,a1
    28cc:	862a                	mv	a2,a0
    28ce:	40f587b3          	sub	a5,a1,a5
    28d2:	8416                	mv	s0,t0
    28d4:	84b6                	mv	s1,a3
    28d6:	b71d                	j	27fc <__adddf3+0x308>
    28d8:	fe058313          	addi	t1,a1,-32 # 7fffe0 <_sp+0x7f3a10>
    28dc:	0067d333          	srl	t1,a5,t1
    28e0:	4381                	li	t2,0
    28e2:	00858863          	beq	a1,s0,28f2 <__adddf3+0x3fe>
    28e6:	04000393          	li	t2,64
    28ea:	40b383b3          	sub	t2,t2,a1
    28ee:	007793b3          	sll	t2,a5,t2
    28f2:	00a3e3b3          	or	t2,t2,a0
    28f6:	007033b3          	snez	t2,t2
    28fa:	00736533          	or	a0,t1,t2
    28fe:	4581                	li	a1,0
    2900:	b7c1                	j	28c0 <__adddf3+0x3cc>
    2902:	8d5d                	or	a0,a0,a5
    2904:	00a03533          	snez	a0,a0
    2908:	bfdd                	j	28fe <__adddf3+0x40a>
    290a:	00140593          	addi	a1,s0,1
    290e:	7fe5f593          	andi	a1,a1,2046
    2912:	edad                	bnez	a1,298c <__adddf3+0x498>
    2914:	00a7e2b3          	or	t0,a5,a0
    2918:	00c765b3          	or	a1,a4,a2
    291c:	e839                	bnez	s0,2972 <__adddf3+0x47e>
    291e:	00029663          	bnez	t0,292a <__adddf3+0x436>
    2922:	87ba                	mv	a5,a4
    2924:	e98d                	bnez	a1,2956 <__adddf3+0x462>
    2926:	4481                	li	s1,0
    2928:	aaa9                	j	2a82 <__adddf3+0x58e>
    292a:	14058663          	beqz	a1,2a76 <__adddf3+0x582>
    292e:	40c50333          	sub	t1,a0,a2
    2932:	006532b3          	sltu	t0,a0,t1
    2936:	40e785b3          	sub	a1,a5,a4
    293a:	405585b3          	sub	a1,a1,t0
    293e:	00859293          	slli	t0,a1,0x8
    2942:	0202d163          	bgez	t0,2964 <__adddf3+0x470>
    2946:	40a60533          	sub	a0,a2,a0
    294a:	00a635b3          	sltu	a1,a2,a0
    294e:	8f1d                	sub	a4,a4,a5
    2950:	862a                	mv	a2,a0
    2952:	40b707b3          	sub	a5,a4,a1
    2956:	84b6                	mv	s1,a3
  FP_PACK_SEMIRAW_D (r, R);
    2958:	00f66733          	or	a4,a2,a5
    295c:	12070d63          	beqz	a4,2a96 <__adddf3+0x5a2>
    2960:	4401                	li	s0,0
    2962:	bbcd                	j	2754 <__adddf3+0x260>
  FP_ADD_D (R, A, B);
    2964:	00b36633          	or	a2,t1,a1
    2968:	12060463          	beqz	a2,2a90 <__adddf3+0x59c>
    296c:	87ae                	mv	a5,a1
    296e:	861a                	mv	a2,t1
    2970:	b7e5                	j	2958 <__adddf3+0x464>
    2972:	00029a63          	bnez	t0,2986 <__adddf3+0x492>
    2976:	84b6                	mv	s1,a3
    2978:	10059163          	bnez	a1,2a7a <__adddf3+0x586>
    297c:	4481                	li	s1,0
    297e:	004007b7          	lui	a5,0x400
    2982:	4601                	li	a2,0
    2984:	a8e5                	j	2a7c <__adddf3+0x588>
    2986:	da0587e3          	beqz	a1,2734 <__adddf3+0x240>
    298a:	bfcd                	j	297c <__adddf3+0x488>
    298c:	40c502b3          	sub	t0,a0,a2
    2990:	005533b3          	sltu	t2,a0,t0
    2994:	40e785b3          	sub	a1,a5,a4
    2998:	407585b3          	sub	a1,a1,t2
    299c:	00859393          	slli	t2,a1,0x8
    29a0:	8316                	mv	t1,t0
    29a2:	0603d763          	bgez	t2,2a10 <__adddf3+0x51c>
    29a6:	40a60333          	sub	t1,a2,a0
    29aa:	40f705b3          	sub	a1,a4,a5
    29ae:	00663633          	sltu	a2,a2,t1
    29b2:	8d91                	sub	a1,a1,a2
    29b4:	84b6                	mv	s1,a3
    29b6:	c5a5                	beqz	a1,2a1e <__adddf3+0x52a>
    29b8:	852e                	mv	a0,a1
    29ba:	c21a                	sw	t1,4(sp)
    29bc:	c02e                	sw	a1,0(sp)
    29be:	2e8010ef          	jal	3ca6 <__clzsi2>
    29c2:	4582                	lw	a1,0(sp)
    29c4:	4312                	lw	t1,4(sp)
    29c6:	ff850713          	addi	a4,a0,-8
    29ca:	02000793          	li	a5,32
    29ce:	8f99                	sub	a5,a5,a4
    29d0:	00e595b3          	sll	a1,a1,a4
    29d4:	00f357b3          	srl	a5,t1,a5
    29d8:	8fcd                	or	a5,a5,a1
    29da:	00e31633          	sll	a2,t1,a4
    29de:	08874463          	blt	a4,s0,2a66 <__adddf3+0x572>
    29e2:	8f01                	sub	a4,a4,s0
    29e4:	00170513          	addi	a0,a4,1
    29e8:	46fd                	li	a3,31
    29ea:	02000593          	li	a1,32
    29ee:	04a6ca63          	blt	a3,a0,2a42 <__adddf3+0x54e>
    29f2:	8d89                	sub	a1,a1,a0
    29f4:	00b79733          	sll	a4,a5,a1
    29f8:	00a656b3          	srl	a3,a2,a0
    29fc:	00b615b3          	sll	a1,a2,a1
    2a00:	8f55                	or	a4,a4,a3
    2a02:	00b035b3          	snez	a1,a1
    2a06:	00b76633          	or	a2,a4,a1
    2a0a:	00a7d7b3          	srl	a5,a5,a0
    2a0e:	b7a9                	j	2958 <__adddf3+0x464>
    2a10:	00b2e633          	or	a2,t0,a1
    2a14:	f24d                	bnez	a2,29b6 <__adddf3+0x4c2>
    2a16:	4481                	li	s1,0
    2a18:	4781                	li	a5,0
    2a1a:	4401                	li	s0,0
    2a1c:	b9c1                	j	26ec <__adddf3+0x1f8>
    2a1e:	851a                	mv	a0,t1
    2a20:	c22e                	sw	a1,4(sp)
    2a22:	c01a                	sw	t1,0(sp)
    2a24:	282010ef          	jal	3ca6 <__clzsi2>
    2a28:	01850713          	addi	a4,a0,24
    2a2c:	47fd                	li	a5,31
    2a2e:	4302                	lw	t1,0(sp)
    2a30:	4581                	li	a1,0
    2a32:	f8e7dce3          	bge	a5,a4,29ca <__adddf3+0x4d6>
    2a36:	ff850793          	addi	a5,a0,-8
    2a3a:	00f317b3          	sll	a5,t1,a5
    2a3e:	4601                	li	a2,0
    2a40:	bf79                	j	29de <__adddf3+0x4ea>
    2a42:	1705                	addi	a4,a4,-31
    2a44:	00e7d733          	srl	a4,a5,a4
    2a48:	4681                	li	a3,0
    2a4a:	00b50763          	beq	a0,a1,2a58 <__adddf3+0x564>
    2a4e:	04000693          	li	a3,64
    2a52:	8e89                	sub	a3,a3,a0
    2a54:	00d796b3          	sll	a3,a5,a3
    2a58:	8ed1                	or	a3,a3,a2
    2a5a:	00d036b3          	snez	a3,a3
    2a5e:	00d76633          	or	a2,a4,a3
    2a62:	4781                	li	a5,0
    2a64:	bdd5                	j	2958 <__adddf3+0x464>
    2a66:	8c19                	sub	s0,s0,a4
    2a68:	ff800737          	lui	a4,0xff800
    2a6c:	177d                	addi	a4,a4,-1 # ff7fffff <_sp+0xff7f3a2f>
    2a6e:	8ff9                	and	a5,a5,a4
    2a70:	b1d5                	j	2754 <__adddf3+0x260>
    2a72:	87ba                	mv	a5,a4
    2a74:	b5d5                	j	2958 <__adddf3+0x464>
    2a76:	862a                	mv	a2,a0
    2a78:	b5c5                	j	2958 <__adddf3+0x464>
    2a7a:	87ba                	mv	a5,a4
    2a7c:	841a                	mv	s0,t1
    2a7e:	b1bd                	j	26ec <__adddf3+0x1f8>
    2a80:	8436                	mv	s0,a3
    2a82:	4781                	li	a5,0
    2a84:	4601                	li	a2,0
    2a86:	b19d                	j	26ec <__adddf3+0x1f8>
    2a88:	84b6                	mv	s1,a3
    2a8a:	87ba                	mv	a5,a4
    2a8c:	8416                	mv	s0,t0
    2a8e:	b9b9                	j	26ec <__adddf3+0x1f8>
    2a90:	4481                	li	s1,0
    2a92:	4781                	li	a5,0
    2a94:	b9a1                	j	26ec <__adddf3+0x1f8>
    2a96:	4781                	li	a5,0
    2a98:	4601                	li	a2,0
    2a9a:	b741                	j	2a1a <__adddf3+0x526>

00002a9c <__divdf3>:
#include "soft-fp.h"
#include "double.h"

DFtype
__divdf3 (DFtype a, DFtype b)
{
    2a9c:	fc810113          	addi	sp,sp,-56
  FP_DECL_D (B);
  FP_DECL_D (R);
  DFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_D (A, a);
    2aa0:	0145d713          	srli	a4,a1,0x14
    2aa4:	01f5d793          	srli	a5,a1,0x1f
{
    2aa8:	d626                	sw	s1,44(sp)
    2aaa:	c236                	sw	a3,4(sp)
    2aac:	da06                	sw	ra,52(sp)
  FP_UNPACK_D (A, a);
    2aae:	00c59693          	slli	a3,a1,0xc
{
    2ab2:	d822                	sw	s0,48(sp)
    2ab4:	c032                	sw	a2,0(sp)
  FP_UNPACK_D (A, a);
    2ab6:	7ff77713          	andi	a4,a4,2047
    2aba:	c83e                	sw	a5,16(sp)
    2abc:	00c6d493          	srli	s1,a3,0xc
    2ac0:	c749                	beqz	a4,2b4a <__divdf3+0xae>
    2ac2:	7ff00793          	li	a5,2047
    2ac6:	0cf70f63          	beq	a4,a5,2ba4 <__divdf3+0x108>
    2aca:	00349693          	slli	a3,s1,0x3
    2ace:	01d55793          	srli	a5,a0,0x1d
    2ad2:	8fd5                	or	a5,a5,a3
    2ad4:	008006b7          	lui	a3,0x800
    2ad8:	8fd5                	or	a5,a5,a3
    2ada:	00351413          	slli	s0,a0,0x3
    2ade:	c0170713          	addi	a4,a4,-1023
    2ae2:	4581                	li	a1,0
  FP_UNPACK_D (B, b);
    2ae4:	4692                	lw	a3,4(sp)
    2ae6:	06b2                	slli	a3,a3,0xc
    2ae8:	00c6d393          	srli	t2,a3,0xc
    2aec:	4692                	lw	a3,4(sp)
    2aee:	0146d513          	srli	a0,a3,0x14
    2af2:	7ff57513          	andi	a0,a0,2047
    2af6:	01f6d493          	srli	s1,a3,0x1f
    2afa:	c179                	beqz	a0,2bc0 <__divdf3+0x124>
    2afc:	7ff00693          	li	a3,2047
    2b00:	12d50f63          	beq	a0,a3,2c3e <__divdf3+0x1a2>
    2b04:	4682                	lw	a3,0(sp)
    2b06:	00339313          	slli	t1,t2,0x3
    2b0a:	c0150613          	addi	a2,a0,-1023
    2b0e:	82f5                	srli	a3,a3,0x1d
    2b10:	0066e6b3          	or	a3,a3,t1
    2b14:	00800337          	lui	t1,0x800
    2b18:	0066e3b3          	or	t2,a3,t1
    2b1c:	4682                	lw	a3,0(sp)
    2b1e:	068e                	slli	a3,a3,0x3
    2b20:	4501                	li	a0,0
  FP_DIV_D (R, A, B);
    2b22:	4342                	lw	t1,16(sp)
    2b24:	8f11                	sub	a4,a4,a2
    2b26:	c43a                	sw	a4,8(sp)
    2b28:	00259713          	slli	a4,a1,0x2
    2b2c:	00934333          	xor	t1,t1,s1
    2b30:	8f49                	or	a4,a4,a0
    2b32:	c61a                	sw	t1,12(sp)
    2b34:	177d                	addi	a4,a4,-1
    2b36:	4639                	li	a2,14
    2b38:	12e66363          	bltu	a2,a4,2c5e <__divdf3+0x1c2>
    2b3c:	6629                	lui	a2,0xa
    2b3e:	070a                	slli	a4,a4,0x2
    2b40:	5a060613          	addi	a2,a2,1440 # a5a0 <spi_sdk.c.ee43b428+0x96b>
    2b44:	9732                	add	a4,a4,a2
    2b46:	4318                	lw	a4,0(a4)
    2b48:	8702                	jr	a4
  FP_UNPACK_D (A, a);
    2b4a:	00a4e7b3          	or	a5,s1,a0
    2b4e:	c3ad                	beqz	a5,2bb0 <__divdf3+0x114>
    2b50:	c895                	beqz	s1,2b84 <__divdf3+0xe8>
    2b52:	c42a                	sw	a0,8(sp)
    2b54:	8526                	mv	a0,s1
    2b56:	150010ef          	jal	3ca6 <__clzsi2>
    2b5a:	4322                	lw	t1,8(sp)
    2b5c:	85aa                	mv	a1,a0
    2b5e:	ff550293          	addi	t0,a0,-11
    2b62:	47f5                	li	a5,29
    2b64:	ff858713          	addi	a4,a1,-8
    2b68:	405787b3          	sub	a5,a5,t0
    2b6c:	00e496b3          	sll	a3,s1,a4
    2b70:	00f357b3          	srl	a5,t1,a5
    2b74:	8fd5                	or	a5,a5,a3
    2b76:	00e314b3          	sll	s1,t1,a4
    2b7a:	c0d00713          	li	a4,-1011
    2b7e:	8f0d                	sub	a4,a4,a1
    2b80:	8426                	mv	s0,s1
    2b82:	b785                	j	2ae2 <__divdf3+0x46>
    2b84:	c42a                	sw	a0,8(sp)
    2b86:	120010ef          	jal	3ca6 <__clzsi2>
    2b8a:	01550293          	addi	t0,a0,21
    2b8e:	47f1                	li	a5,28
    2b90:	4322                	lw	t1,8(sp)
    2b92:	02050593          	addi	a1,a0,32
    2b96:	fc57d6e3          	bge	a5,t0,2b62 <__divdf3+0xc6>
    2b9a:	ff850793          	addi	a5,a0,-8
    2b9e:	00f317b3          	sll	a5,t1,a5
    2ba2:	bfe1                	j	2b7a <__divdf3+0xde>
    2ba4:	00a4e7b3          	or	a5,s1,a0
    2ba8:	eb81                	bnez	a5,2bb8 <__divdf3+0x11c>
    2baa:	4401                	li	s0,0
    2bac:	4589                	li	a1,2
    2bae:	bf1d                	j	2ae4 <__divdf3+0x48>
    2bb0:	4401                	li	s0,0
    2bb2:	4701                	li	a4,0
    2bb4:	4585                	li	a1,1
    2bb6:	b73d                	j	2ae4 <__divdf3+0x48>
    2bb8:	842a                	mv	s0,a0
    2bba:	87a6                	mv	a5,s1
    2bbc:	458d                	li	a1,3
    2bbe:	b71d                	j	2ae4 <__divdf3+0x48>
  FP_UNPACK_D (B, b);
    2bc0:	4682                	lw	a3,0(sp)
    2bc2:	00d3e6b3          	or	a3,t2,a3
    2bc6:	c6c1                	beqz	a3,2c4e <__divdf3+0x1b2>
    2bc8:	04038463          	beqz	t2,2c10 <__divdf3+0x174>
    2bcc:	851e                	mv	a0,t2
    2bce:	ca2e                	sw	a1,20(sp)
    2bd0:	c63a                	sw	a4,12(sp)
    2bd2:	c43e                	sw	a5,8(sp)
    2bd4:	c21e                	sw	t2,4(sp)
    2bd6:	0d0010ef          	jal	3ca6 <__clzsi2>
    2bda:	4392                	lw	t2,4(sp)
    2bdc:	47a2                	lw	a5,8(sp)
    2bde:	4732                	lw	a4,12(sp)
    2be0:	45d2                	lw	a1,20(sp)
    2be2:	832a                	mv	t1,a0
    2be4:	ff550293          	addi	t0,a0,-11
    2be8:	46f5                	li	a3,29
    2bea:	405686b3          	sub	a3,a3,t0
    2bee:	4282                	lw	t0,0(sp)
    2bf0:	ff830613          	addi	a2,t1,-8 # 7ffff8 <_sp+0x7f3a28>
    2bf4:	00c39533          	sll	a0,t2,a2
    2bf8:	00d2d6b3          	srl	a3,t0,a3
    2bfc:	8d55                	or	a0,a0,a3
    2bfe:	00c293b3          	sll	t2,t0,a2
    2c02:	c0d00613          	li	a2,-1011
    2c06:	869e                	mv	a3,t2
    2c08:	40660633          	sub	a2,a2,t1
    2c0c:	83aa                	mv	t2,a0
    2c0e:	bf09                	j	2b20 <__divdf3+0x84>
    2c10:	4502                	lw	a0,0(sp)
    2c12:	ca1e                	sw	t2,20(sp)
    2c14:	c62e                	sw	a1,12(sp)
    2c16:	c43a                	sw	a4,8(sp)
    2c18:	c23e                	sw	a5,4(sp)
    2c1a:	08c010ef          	jal	3ca6 <__clzsi2>
    2c1e:	01550293          	addi	t0,a0,21
    2c22:	46f1                	li	a3,28
    2c24:	4792                	lw	a5,4(sp)
    2c26:	4722                	lw	a4,8(sp)
    2c28:	45b2                	lw	a1,12(sp)
    2c2a:	02050313          	addi	t1,a0,32
    2c2e:	4381                	li	t2,0
    2c30:	fa56dce3          	bge	a3,t0,2be8 <__divdf3+0x14c>
    2c34:	4682                	lw	a3,0(sp)
    2c36:	1561                	addi	a0,a0,-8
    2c38:	00a69533          	sll	a0,a3,a0
    2c3c:	b7d9                	j	2c02 <__divdf3+0x166>
    2c3e:	4682                	lw	a3,0(sp)
    2c40:	00d3e6b3          	or	a3,t2,a3
    2c44:	ea89                	bnez	a3,2c56 <__divdf3+0x1ba>
    2c46:	862a                	mv	a2,a0
    2c48:	4381                	li	t2,0
    2c4a:	4509                	li	a0,2
    2c4c:	bdd9                	j	2b22 <__divdf3+0x86>
    2c4e:	4381                	li	t2,0
    2c50:	4601                	li	a2,0
    2c52:	4505                	li	a0,1
    2c54:	b5f9                	j	2b22 <__divdf3+0x86>
    2c56:	862a                	mv	a2,a0
    2c58:	4682                	lw	a3,0(sp)
    2c5a:	450d                	li	a0,3
    2c5c:	b5d9                	j	2b22 <__divdf3+0x86>
  FP_DIV_D (R, A, B);
    2c5e:	00f3e663          	bltu	t2,a5,2c6a <__divdf3+0x1ce>
    2c62:	30779f63          	bne	a5,t2,2f80 <__divdf3+0x4e4>
    2c66:	30d46d63          	bltu	s0,a3,2f80 <__divdf3+0x4e4>
    2c6a:	01f79593          	slli	a1,a5,0x1f
    2c6e:	00145613          	srli	a2,s0,0x1
    2c72:	01f41713          	slli	a4,s0,0x1f
    2c76:	8385                	srli	a5,a5,0x1
    2c78:	00c5e433          	or	s0,a1,a2
    2c7c:	00839613          	slli	a2,t2,0x8
    2c80:	d03a                	sw	a4,32(sp)
    2c82:	00869713          	slli	a4,a3,0x8
    2c86:	c03a                	sw	a4,0(sp)
    2c88:	01065713          	srli	a4,a2,0x10
    2c8c:	0186d593          	srli	a1,a3,0x18
    2c90:	c23a                	sw	a4,4(sp)
    2c92:	00c5e2b3          	or	t0,a1,a2
    2c96:	4592                	lw	a1,4(sp)
    2c98:	01029713          	slli	a4,t0,0x10
    2c9c:	8341                	srli	a4,a4,0x10
    2c9e:	853e                	mv	a0,a5
    2ca0:	ce16                	sw	t0,28(sp)
    2ca2:	ca3a                	sw	a4,20(sp)
    2ca4:	cc3e                	sw	a5,24(sp)
    2ca6:	78b000ef          	jal	3c30 <__hidden___udivsi3>
    2caa:	85aa                	mv	a1,a0
    2cac:	c82a                	sw	a0,16(sp)
    2cae:	4552                	lw	a0,20(sp)
    2cb0:	765000ef          	jal	3c14 <__mulsi3>
    2cb4:	4592                	lw	a1,4(sp)
    2cb6:	84aa                	mv	s1,a0
    2cb8:	4562                	lw	a0,24(sp)
    2cba:	7a3000ef          	jal	3c5c <__umodsi3>
    2cbe:	0542                	slli	a0,a0,0x10
    2cc0:	01045793          	srli	a5,s0,0x10
    2cc4:	8fc9                	or	a5,a5,a0
    2cc6:	46c2                	lw	a3,16(sp)
    2cc8:	42f2                	lw	t0,28(sp)
    2cca:	5702                	lw	a4,32(sp)
    2ccc:	0097f863          	bgeu	a5,s1,2cdc <__divdf3+0x240>
    2cd0:	9796                	add	a5,a5,t0
    2cd2:	0057e463          	bltu	a5,t0,2cda <__divdf3+0x23e>
    2cd6:	2a97ea63          	bltu	a5,s1,2f8a <__divdf3+0x4ee>
    2cda:	16fd                	addi	a3,a3,-1 # 7fffff <_sp+0x7f3a2f>
    2cdc:	4592                	lw	a1,4(sp)
    2cde:	8f85                	sub	a5,a5,s1
    2ce0:	853e                	mv	a0,a5
    2ce2:	d216                	sw	t0,36(sp)
    2ce4:	d036                	sw	a3,32(sp)
    2ce6:	ce3a                	sw	a4,28(sp)
    2ce8:	c83e                	sw	a5,16(sp)
    2cea:	747000ef          	jal	3c30 <__hidden___udivsi3>
    2cee:	85aa                	mv	a1,a0
    2cf0:	84aa                	mv	s1,a0
    2cf2:	4552                	lw	a0,20(sp)
    2cf4:	0442                	slli	s0,s0,0x10
    2cf6:	8041                	srli	s0,s0,0x10
    2cf8:	71d000ef          	jal	3c14 <__mulsi3>
    2cfc:	cc2a                	sw	a0,24(sp)
    2cfe:	4592                	lw	a1,4(sp)
    2d00:	4542                	lw	a0,16(sp)
    2d02:	75b000ef          	jal	3c5c <__umodsi3>
    2d06:	4662                	lw	a2,24(sp)
    2d08:	0542                	slli	a0,a0,0x10
    2d0a:	8c49                	or	s0,s0,a0
    2d0c:	4772                	lw	a4,28(sp)
    2d0e:	5682                	lw	a3,32(sp)
    2d10:	5292                	lw	t0,36(sp)
    2d12:	00c47863          	bgeu	s0,a2,2d22 <__divdf3+0x286>
    2d16:	9416                	add	s0,s0,t0
    2d18:	00c47463          	bgeu	s0,a2,2d20 <__divdf3+0x284>
    2d1c:	26547a63          	bgeu	s0,t0,2f90 <__divdf3+0x4f4>
    2d20:	14fd                	addi	s1,s1,-1
    2d22:	4782                	lw	a5,0(sp)
    2d24:	06c2                	slli	a3,a3,0x10
    2d26:	8cd5                	or	s1,s1,a3
    2d28:	83c1                	srli	a5,a5,0x10
    2d2a:	c83e                	sw	a5,16(sp)
    2d2c:	00015783          	lhu	a5,0(sp)
    2d30:	01049513          	slli	a0,s1,0x10
    2d34:	8c11                	sub	s0,s0,a2
    2d36:	8141                	srli	a0,a0,0x10
    2d38:	cc3e                	sw	a5,24(sp)
    2d3a:	85be                	mv	a1,a5
    2d3c:	6d9000ef          	jal	3c14 <__mulsi3>
    2d40:	87aa                	mv	a5,a0
    2d42:	01049513          	slli	a0,s1,0x10
    2d46:	45c2                	lw	a1,16(sp)
    2d48:	8141                	srli	a0,a0,0x10
    2d4a:	6cb000ef          	jal	3c14 <__mulsi3>
    2d4e:	832a                	mv	t1,a0
    2d50:	45e2                	lw	a1,24(sp)
    2d52:	0104d513          	srli	a0,s1,0x10
    2d56:	6bf000ef          	jal	3c14 <__mulsi3>
    2d5a:	83aa                	mv	t2,a0
    2d5c:	45c2                	lw	a1,16(sp)
    2d5e:	0104d513          	srli	a0,s1,0x10
    2d62:	6b3000ef          	jal	3c14 <__mulsi3>
    2d66:	0107d693          	srli	a3,a5,0x10
    2d6a:	931e                	add	t1,t1,t2
    2d6c:	969a                	add	a3,a3,t1
    2d6e:	0076f463          	bgeu	a3,t2,2d76 <__divdf3+0x2da>
    2d72:	6641                	lui	a2,0x10
    2d74:	9532                	add	a0,a0,a2
    2d76:	0106d613          	srli	a2,a3,0x10
    2d7a:	07c2                	slli	a5,a5,0x10
    2d7c:	06c2                	slli	a3,a3,0x10
    2d7e:	83c1                	srli	a5,a5,0x10
    2d80:	9532                	add	a0,a0,a2
    2d82:	97b6                	add	a5,a5,a3
    2d84:	00a46663          	bltu	s0,a0,2d90 <__divdf3+0x2f4>
    2d88:	20a41763          	bne	s0,a0,2f96 <__divdf3+0x4fa>
    2d8c:	20f77563          	bgeu	a4,a5,2f96 <__divdf3+0x4fa>
    2d90:	4682                	lw	a3,0(sp)
    2d92:	fff48393          	addi	t2,s1,-1
    2d96:	96ba                	add	a3,a3,a4
    2d98:	00e6b633          	sltu	a2,a3,a4
    2d9c:	005605b3          	add	a1,a2,t0
    2da0:	942e                	add	s0,s0,a1
    2da2:	8736                	mv	a4,a3
    2da4:	0082e563          	bltu	t0,s0,2dae <__divdf3+0x312>
    2da8:	e215                	bnez	a2,2dcc <__divdf3+0x330>
    2daa:	02829163          	bne	t0,s0,2dcc <__divdf3+0x330>
    2dae:	00a46663          	bltu	s0,a0,2dba <__divdf3+0x31e>
    2db2:	00851d63          	bne	a0,s0,2dcc <__divdf3+0x330>
    2db6:	00f6fb63          	bgeu	a3,a5,2dcc <__divdf3+0x330>
    2dba:	4702                	lw	a4,0(sp)
    2dbc:	ffe48393          	addi	t2,s1,-2
    2dc0:	9736                	add	a4,a4,a3
    2dc2:	4682                	lw	a3,0(sp)
    2dc4:	00d736b3          	sltu	a3,a4,a3
    2dc8:	9696                	add	a3,a3,t0
    2dca:	9436                	add	s0,s0,a3
    2dcc:	40f704b3          	sub	s1,a4,a5
    2dd0:	8c09                	sub	s0,s0,a0
    2dd2:	00973733          	sltu	a4,a4,s1
    2dd6:	8c19                	sub	s0,s0,a4
    2dd8:	56fd                	li	a3,-1
    2dda:	12828a63          	beq	t0,s0,2f0e <__divdf3+0x472>
    2dde:	4592                	lw	a1,4(sp)
    2de0:	8522                	mv	a0,s0
    2de2:	d21e                	sw	t2,36(sp)
    2de4:	d416                	sw	t0,40(sp)
    2de6:	64b000ef          	jal	3c30 <__hidden___udivsi3>
    2dea:	85aa                	mv	a1,a0
    2dec:	d02a                	sw	a0,32(sp)
    2dee:	4552                	lw	a0,20(sp)
    2df0:	625000ef          	jal	3c14 <__mulsi3>
    2df4:	4592                	lw	a1,4(sp)
    2df6:	ce2a                	sw	a0,28(sp)
    2df8:	8522                	mv	a0,s0
    2dfa:	663000ef          	jal	3c5c <__umodsi3>
    2dfe:	47f2                	lw	a5,28(sp)
    2e00:	0542                	slli	a0,a0,0x10
    2e02:	0104d413          	srli	s0,s1,0x10
    2e06:	8c49                	or	s0,s0,a0
    2e08:	5702                	lw	a4,32(sp)
    2e0a:	5392                	lw	t2,36(sp)
    2e0c:	52a2                	lw	t0,40(sp)
    2e0e:	00f47863          	bgeu	s0,a5,2e1e <__divdf3+0x382>
    2e12:	9416                	add	s0,s0,t0
    2e14:	00546463          	bltu	s0,t0,2e1c <__divdf3+0x380>
    2e18:	18f46163          	bltu	s0,a5,2f9a <__divdf3+0x4fe>
    2e1c:	177d                	addi	a4,a4,-1
    2e1e:	4592                	lw	a1,4(sp)
    2e20:	40f407b3          	sub	a5,s0,a5
    2e24:	853e                	mv	a0,a5
    2e26:	d416                	sw	t0,40(sp)
    2e28:	d23a                	sw	a4,36(sp)
    2e2a:	d01e                	sw	t2,32(sp)
    2e2c:	ce3e                	sw	a5,28(sp)
    2e2e:	603000ef          	jal	3c30 <__hidden___udivsi3>
    2e32:	85aa                	mv	a1,a0
    2e34:	842a                	mv	s0,a0
    2e36:	4552                	lw	a0,20(sp)
    2e38:	5dd000ef          	jal	3c14 <__mulsi3>
    2e3c:	ca2a                	sw	a0,20(sp)
    2e3e:	4592                	lw	a1,4(sp)
    2e40:	4572                	lw	a0,28(sp)
    2e42:	61b000ef          	jal	3c5c <__umodsi3>
    2e46:	01049793          	slli	a5,s1,0x10
    2e4a:	4652                	lw	a2,20(sp)
    2e4c:	0542                	slli	a0,a0,0x10
    2e4e:	83c1                	srli	a5,a5,0x10
    2e50:	8fc9                	or	a5,a5,a0
    2e52:	5382                	lw	t2,32(sp)
    2e54:	5712                	lw	a4,36(sp)
    2e56:	52a2                	lw	t0,40(sp)
    2e58:	00c7f863          	bgeu	a5,a2,2e68 <__divdf3+0x3cc>
    2e5c:	9796                	add	a5,a5,t0
    2e5e:	00c7f463          	bgeu	a5,a2,2e66 <__divdf3+0x3ca>
    2e62:	1257ff63          	bgeu	a5,t0,2fa0 <__divdf3+0x504>
    2e66:	147d                	addi	s0,s0,-1
    2e68:	0742                	slli	a4,a4,0x10
    2e6a:	8f41                	or	a4,a4,s0
    2e6c:	01071513          	slli	a0,a4,0x10
    2e70:	45e2                	lw	a1,24(sp)
    2e72:	8f91                	sub	a5,a5,a2
    2e74:	01075413          	srli	s0,a4,0x10
    2e78:	8141                	srli	a0,a0,0x10
    2e7a:	59b000ef          	jal	3c14 <__mulsi3>
    2e7e:	832a                	mv	t1,a0
    2e80:	01071513          	slli	a0,a4,0x10
    2e84:	45c2                	lw	a1,16(sp)
    2e86:	8141                	srli	a0,a0,0x10
    2e88:	58d000ef          	jal	3c14 <__mulsi3>
    2e8c:	c22a                	sw	a0,4(sp)
    2e8e:	45e2                	lw	a1,24(sp)
    2e90:	8522                	mv	a0,s0
    2e92:	583000ef          	jal	3c14 <__mulsi3>
    2e96:	84aa                	mv	s1,a0
    2e98:	45c2                	lw	a1,16(sp)
    2e9a:	8522                	mv	a0,s0
    2e9c:	579000ef          	jal	3c14 <__mulsi3>
    2ea0:	4612                	lw	a2,4(sp)
    2ea2:	01035693          	srli	a3,t1,0x10
    2ea6:	9626                	add	a2,a2,s1
    2ea8:	96b2                	add	a3,a3,a2
    2eaa:	0096f463          	bgeu	a3,s1,2eb2 <__divdf3+0x416>
    2eae:	6641                	lui	a2,0x10
    2eb0:	9532                	add	a0,a0,a2
    2eb2:	0106d613          	srli	a2,a3,0x10
    2eb6:	0342                	slli	t1,t1,0x10
    2eb8:	9532                	add	a0,a0,a2
    2eba:	06c2                	slli	a3,a3,0x10
    2ebc:	01035313          	srli	t1,t1,0x10
    2ec0:	00668633          	add	a2,a3,t1
    2ec4:	00a7e563          	bltu	a5,a0,2ece <__divdf3+0x432>
    2ec8:	04a79163          	bne	a5,a0,2f0a <__divdf3+0x46e>
    2ecc:	ce69                	beqz	a2,2fa6 <__divdf3+0x50a>
    2ece:	00f285b3          	add	a1,t0,a5
    2ed2:	fff70693          	addi	a3,a4,-1
    2ed6:	87ae                	mv	a5,a1
    2ed8:	0255e363          	bltu	a1,t0,2efe <__divdf3+0x462>
    2edc:	00a5e763          	bltu	a1,a0,2eea <__divdf3+0x44e>
    2ee0:	02a59463          	bne	a1,a0,2f08 <__divdf3+0x46c>
    2ee4:	4402                	lw	s0,0(sp)
    2ee6:	00c47c63          	bgeu	s0,a2,2efe <__divdf3+0x462>
    2eea:	4782                	lw	a5,0(sp)
    2eec:	ffe70693          	addi	a3,a4,-2
    2ef0:	00179713          	slli	a4,a5,0x1
    2ef4:	00f737b3          	sltu	a5,a4,a5
    2ef8:	9796                	add	a5,a5,t0
    2efa:	97ae                	add	a5,a5,a1
    2efc:	c03a                	sw	a4,0(sp)
    2efe:	4702                	lw	a4,0(sp)
    2f00:	00c71463          	bne	a4,a2,2f08 <__divdf3+0x46c>
    2f04:	00a78563          	beq	a5,a0,2f0e <__divdf3+0x472>
    2f08:	8736                	mv	a4,a3
    2f0a:	00176693          	ori	a3,a4,1
  FP_PACK_D (r, R);
    2f0e:	47a2                	lw	a5,8(sp)
    2f10:	3ff78713          	addi	a4,a5,1023 # 4003ff <_sp+0x3f3e2f>
    2f14:	0ae05f63          	blez	a4,2fd2 <__divdf3+0x536>
    2f18:	0076f793          	andi	a5,a3,7
    2f1c:	cf81                	beqz	a5,2f34 <__divdf3+0x498>
    2f1e:	00f6f793          	andi	a5,a3,15
    2f22:	4611                	li	a2,4
    2f24:	00c78863          	beq	a5,a2,2f34 <__divdf3+0x498>
    2f28:	00c687b3          	add	a5,a3,a2
    2f2c:	00d7b633          	sltu	a2,a5,a3
    2f30:	93b2                	add	t2,t2,a2
    2f32:	86be                	mv	a3,a5
    2f34:	00739793          	slli	a5,t2,0x7
    2f38:	0007da63          	bgez	a5,2f4c <__divdf3+0x4b0>
    2f3c:	ff0007b7          	lui	a5,0xff000
    2f40:	17fd                	addi	a5,a5,-1 # feffffff <_sp+0xfeff3a2f>
    2f42:	00f3f3b3          	and	t2,t2,a5
    2f46:	47a2                	lw	a5,8(sp)
    2f48:	40078713          	addi	a4,a5,1024
    2f4c:	7fe00793          	li	a5,2046
    2f50:	12e7c063          	blt	a5,a4,3070 <__divdf3+0x5d4>
    2f54:	0036d793          	srli	a5,a3,0x3
    2f58:	01d39693          	slli	a3,t2,0x1d
    2f5c:	8edd                	or	a3,a3,a5
    2f5e:	0033d793          	srli	a5,t2,0x3
    2f62:	07b2                	slli	a5,a5,0xc
    2f64:	83b1                	srli	a5,a5,0xc
    2f66:	0752                	slli	a4,a4,0x14
    2f68:	8f5d                	or	a4,a4,a5
    2f6a:	47b2                	lw	a5,12(sp)
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    2f6c:	50d2                	lw	ra,52(sp)
    2f6e:	5442                	lw	s0,48(sp)
  FP_PACK_D (r, R);
    2f70:	07fe                	slli	a5,a5,0x1f
}
    2f72:	54b2                	lw	s1,44(sp)
    2f74:	8536                	mv	a0,a3
    2f76:	00f765b3          	or	a1,a4,a5
    2f7a:	03810113          	addi	sp,sp,56
    2f7e:	8082                	ret
  FP_DIV_D (R, A, B);
    2f80:	4722                	lw	a4,8(sp)
    2f82:	177d                	addi	a4,a4,-1
    2f84:	c43a                	sw	a4,8(sp)
    2f86:	4701                	li	a4,0
    2f88:	b9d5                	j	2c7c <__divdf3+0x1e0>
    2f8a:	16f9                	addi	a3,a3,-2
    2f8c:	9796                	add	a5,a5,t0
    2f8e:	b3b9                	j	2cdc <__divdf3+0x240>
    2f90:	14f9                	addi	s1,s1,-2
    2f92:	9416                	add	s0,s0,t0
    2f94:	b379                	j	2d22 <__divdf3+0x286>
    2f96:	83a6                	mv	t2,s1
    2f98:	bd15                	j	2dcc <__divdf3+0x330>
    2f9a:	1779                	addi	a4,a4,-2
    2f9c:	9416                	add	s0,s0,t0
    2f9e:	b541                	j	2e1e <__divdf3+0x382>
    2fa0:	1479                	addi	s0,s0,-2
    2fa2:	9796                	add	a5,a5,t0
    2fa4:	b5d1                	j	2e68 <__divdf3+0x3cc>
    2fa6:	c002                	sw	zero,0(sp)
    2fa8:	86ba                	mv	a3,a4
    2faa:	bf91                	j	2efe <__divdf3+0x462>
  FP_UNPACK_D (B, b);
    2fac:	c626                	sw	s1,12(sp)
  FP_DIV_D (R, A, B);
    2fae:	85aa                	mv	a1,a0
  FP_PACK_D (r, R);
    2fb0:	4789                	li	a5,2
    2fb2:	0af58f63          	beq	a1,a5,3070 <__divdf3+0x5d4>
    2fb6:	478d                	li	a5,3
    2fb8:	0af58563          	beq	a1,a5,3062 <__divdf3+0x5c6>
    2fbc:	4785                	li	a5,1
    2fbe:	f4f598e3          	bne	a1,a5,2f0e <__divdf3+0x472>
    2fc2:	4781                	li	a5,0
    2fc4:	4681                	li	a3,0
    2fc6:	a0b5                	j	3032 <__divdf3+0x596>
  FP_UNPACK_D (A, a);
    2fc8:	4742                	lw	a4,16(sp)
  FP_DIV_D (R, A, B);
    2fca:	83be                	mv	t2,a5
    2fcc:	86a2                	mv	a3,s0
  FP_UNPACK_D (A, a);
    2fce:	c63a                	sw	a4,12(sp)
    2fd0:	b7c5                	j	2fb0 <__divdf3+0x514>
  FP_PACK_D (r, R);
    2fd2:	c335                	beqz	a4,3036 <__divdf3+0x59a>
    2fd4:	fc900793          	li	a5,-55
    2fd8:	fef745e3          	blt	a4,a5,2fc2 <__divdf3+0x526>
    2fdc:	5789                	li	a5,-30
    2fde:	04f74e63          	blt	a4,a5,303a <__divdf3+0x59e>
    2fe2:	4605                	li	a2,1
    2fe4:	8e19                	sub	a2,a2,a4
    2fe6:	47a2                	lw	a5,8(sp)
    2fe8:	00c6d733          	srl	a4,a3,a2
    2fec:	41e78793          	addi	a5,a5,1054
    2ff0:	00f696b3          	sll	a3,a3,a5
    2ff4:	00d036b3          	snez	a3,a3
    2ff8:	00f397b3          	sll	a5,t2,a5
    2ffc:	8edd                	or	a3,a3,a5
    2ffe:	8f55                	or	a4,a4,a3
    3000:	00c3d7b3          	srl	a5,t2,a2
    3004:	00777693          	andi	a3,a4,7
    3008:	ce81                	beqz	a3,3020 <__divdf3+0x584>
    300a:	00f77693          	andi	a3,a4,15
    300e:	4611                	li	a2,4
    3010:	00c68863          	beq	a3,a2,3020 <__divdf3+0x584>
    3014:	00c706b3          	add	a3,a4,a2
    3018:	00e6b633          	sltu	a2,a3,a4
    301c:	97b2                	add	a5,a5,a2
    301e:	8736                	mv	a4,a3
    3020:	00879693          	slli	a3,a5,0x8
    3024:	0406cb63          	bltz	a3,307a <__divdf3+0x5de>
    3028:	01d79693          	slli	a3,a5,0x1d
    302c:	830d                	srli	a4,a4,0x3
    302e:	8ed9                	or	a3,a3,a4
    3030:	838d                	srli	a5,a5,0x3
    3032:	4701                	li	a4,0
    3034:	b73d                	j	2f62 <__divdf3+0x4c6>
    3036:	4605                	li	a2,1
    3038:	b77d                	j	2fe6 <__divdf3+0x54a>
    303a:	5585                	li	a1,-31
    303c:	40e58633          	sub	a2,a1,a4
    3040:	00c3d633          	srl	a2,t2,a2
    3044:	4781                	li	a5,0
    3046:	00b70763          	beq	a4,a1,3054 <__divdf3+0x5b8>
    304a:	47a2                	lw	a5,8(sp)
    304c:	43e78793          	addi	a5,a5,1086
    3050:	00f397b3          	sll	a5,t2,a5
    3054:	8fd5                	or	a5,a5,a3
    3056:	00f037b3          	snez	a5,a5
    305a:	00f66733          	or	a4,a2,a5
    305e:	4781                	li	a5,0
    3060:	b755                	j	3004 <__divdf3+0x568>
    3062:	000807b7          	lui	a5,0x80
    3066:	4681                	li	a3,0
    3068:	7ff00713          	li	a4,2047
    306c:	c602                	sw	zero,12(sp)
    306e:	bdd5                	j	2f62 <__divdf3+0x4c6>
    3070:	4781                	li	a5,0
    3072:	4681                	li	a3,0
    3074:	7ff00713          	li	a4,2047
    3078:	b5ed                	j	2f62 <__divdf3+0x4c6>
    307a:	4781                	li	a5,0
    307c:	4681                	li	a3,0
    307e:	4705                	li	a4,1
    3080:	b5cd                	j	2f62 <__divdf3+0x4c6>

00003082 <__gedf2>:
#include "soft-fp.h"
#include "double.h"

CMPtype
__gedf2 (DFtype a, DFtype b)
{
    3082:	1161                	addi	sp,sp,-8
  FP_DECL_D (A);
  FP_DECL_D (B);
  CMPtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_D (A, a);
    3084:	0145d293          	srli	t0,a1,0x14
    3088:	001007b7          	lui	a5,0x100
    308c:	17fd                	addi	a5,a5,-1 # fffff <_sp+0xf3a2f>
{
    308e:	c222                	sw	s0,4(sp)
    3090:	c026                	sw	s1,0(sp)
  FP_UNPACK_RAW_D (B, b);
    3092:	0146d413          	srli	s0,a3,0x14
  FP_UNPACK_RAW_D (A, a);
    3096:	7ff2f293          	andi	t0,t0,2047
  FP_CMP_D (r, A, B, -2, 2);
    309a:	7ff00713          	li	a4,2047
  FP_UNPACK_RAW_D (A, a);
    309e:	00b7f3b3          	and	t2,a5,a1
{
    30a2:	832a                	mv	t1,a0
  FP_UNPACK_RAW_D (B, b);
    30a4:	8ff5                	and	a5,a5,a3
  FP_UNPACK_RAW_D (A, a);
    30a6:	81fd                	srli	a1,a1,0x1f
  FP_UNPACK_RAW_D (B, b);
    30a8:	7ff47413          	andi	s0,s0,2047
    30ac:	82fd                	srli	a3,a3,0x1f
  FP_CMP_D (r, A, B, -2, 2);
    30ae:	00e28c63          	beq	t0,a4,30c6 <__gedf2+0x44>
    30b2:	7ff00713          	li	a4,2047
  FP_UNPACK_RAW_D (B, b);
    30b6:	8522                	mv	a0,s0
  FP_CMP_D (r, A, B, -2, 2);
    30b8:	00e41f63          	bne	s0,a4,30d6 <__gedf2+0x54>
    30bc:	00c7e733          	or	a4,a5,a2
    30c0:	cb19                	beqz	a4,30d6 <__gedf2+0x54>
    30c2:	5579                	li	a0,-2
    30c4:	a029                	j	30ce <__gedf2+0x4c>
    30c6:	00a3e733          	or	a4,t2,a0
    30ca:	5579                	li	a0,-2
    30cc:	d37d                	beqz	a4,30b2 <__gedf2+0x30>
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    30ce:	4412                	lw	s0,4(sp)
    30d0:	4482                	lw	s1,0(sp)
    30d2:	0121                	addi	sp,sp,8
    30d4:	8082                	ret
  FP_CMP_D (r, A, B, -2, 2);
    30d6:	4701                	li	a4,0
    30d8:	00029663          	bnez	t0,30e4 <__gedf2+0x62>
    30dc:	0063e733          	or	a4,t2,t1
    30e0:	00173713          	seqz	a4,a4
    30e4:	ec19                	bnez	s0,3102 <__gedf2+0x80>
    30e6:	00c7e4b3          	or	s1,a5,a2
    30ea:	c711                	beqz	a4,30f6 <__gedf2+0x74>
    30ec:	d0ed                	beqz	s1,30ce <__gedf2+0x4c>
    30ee:	00169513          	slli	a0,a3,0x1
    30f2:	157d                	addi	a0,a0,-1
    30f4:	bfe9                	j	30ce <__gedf2+0x4c>
    30f6:	e499                	bnez	s1,3104 <__gedf2+0x82>
    30f8:	40b00533          	neg	a0,a1
    30fc:	00156513          	ori	a0,a0,1
    3100:	b7f9                	j	30ce <__gedf2+0x4c>
    3102:	f775                	bnez	a4,30ee <__gedf2+0x6c>
    3104:	feb69ae3          	bne	a3,a1,30f8 <__gedf2+0x76>
    3108:	40d00533          	neg	a0,a3
    310c:	fe5448e3          	blt	s0,t0,30fc <__gedf2+0x7a>
    3110:	fc82cfe3          	blt	t0,s0,30ee <__gedf2+0x6c>
    3114:	fe77e2e3          	bltu	a5,t2,30f8 <__gedf2+0x76>
    3118:	00667463          	bgeu	a2,t1,3120 <__gedf2+0x9e>
    311c:	fcf38ee3          	beq	t2,a5,30f8 <__gedf2+0x76>
    3120:	00c36563          	bltu	t1,a2,312a <__gedf2+0xa8>
    3124:	4501                	li	a0,0
    3126:	faf3f4e3          	bgeu	t2,a5,30ce <__gedf2+0x4c>
    312a:	00159513          	slli	a0,a1,0x1
    312e:	b7d1                	j	30f2 <__gedf2+0x70>

00003130 <__muldf3>:
#include "soft-fp.h"
#include "double.h"

DFtype
__muldf3 (DFtype a, DFtype b)
{
    3130:	fcc10113          	addi	sp,sp,-52
  FP_DECL_D (B);
  FP_DECL_D (R);
  DFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_D (A, a);
    3134:	00c59713          	slli	a4,a1,0xc
{
    3138:	d622                	sw	s0,44(sp)
    313a:	c036                	sw	a3,0(sp)
  FP_UNPACK_D (A, a);
    313c:	00c75413          	srli	s0,a4,0xc
    3140:	0145d693          	srli	a3,a1,0x14
    3144:	01f5d713          	srli	a4,a1,0x1f
{
    3148:	d426                	sw	s1,40(sp)
    314a:	d806                	sw	ra,48(sp)
  FP_UNPACK_D (A, a);
    314c:	7ff6f693          	andi	a3,a3,2047
    3150:	c23a                	sw	a4,4(sp)
{
    3152:	84b2                	mv	s1,a2
  FP_UNPACK_D (A, a);
    3154:	c2c5                	beqz	a3,31f4 <__muldf3+0xc4>
    3156:	7ff00713          	li	a4,2047
    315a:	0ee68b63          	beq	a3,a4,3250 <__muldf3+0x120>
    315e:	00341593          	slli	a1,s0,0x3
    3162:	01d55713          	srli	a4,a0,0x1d
    3166:	8f4d                	or	a4,a4,a1
    3168:	008005b7          	lui	a1,0x800
    316c:	00b76433          	or	s0,a4,a1
    3170:	c0168693          	addi	a3,a3,-1023
    3174:	00351713          	slli	a4,a0,0x3
    3178:	4301                	li	t1,0
  FP_UNPACK_D (B, b);
    317a:	4602                	lw	a2,0(sp)
    317c:	4782                	lw	a5,0(sp)
    317e:	01465513          	srli	a0,a2,0x14
    3182:	827d                	srli	a2,a2,0x1f
    3184:	07b2                	slli	a5,a5,0xc
    3186:	7ff57513          	andi	a0,a0,2047
    318a:	c432                	sw	a2,8(sp)
    318c:	83b1                	srli	a5,a5,0xc
    318e:	cd71                	beqz	a0,326a <__muldf3+0x13a>
    3190:	7ff00593          	li	a1,2047
    3194:	14b50763          	beq	a0,a1,32e2 <__muldf3+0x1b2>
    3198:	078e                	slli	a5,a5,0x3
    319a:	01d4d593          	srli	a1,s1,0x1d
    319e:	8ddd                	or	a1,a1,a5
    31a0:	008007b7          	lui	a5,0x800
    31a4:	8fcd                	or	a5,a5,a1
    31a6:	00349293          	slli	t0,s1,0x3
    31aa:	c0150513          	addi	a0,a0,-1023
    31ae:	4601                	li	a2,0
  FP_MUL_D (R, A, B);
    31b0:	96aa                	add	a3,a3,a0
    31b2:	cc36                	sw	a3,24(sp)
    31b4:	0685                	addi	a3,a3,1
    31b6:	c036                	sw	a3,0(sp)
    31b8:	00231693          	slli	a3,t1,0x2
    31bc:	8ed1                	or	a3,a3,a2
    31be:	45a9                	li	a1,10
    31c0:	14d5cd63          	blt	a1,a3,331a <__muldf3+0x1ea>
    31c4:	4592                	lw	a1,4(sp)
    31c6:	4522                	lw	a0,8(sp)
    31c8:	00a5c4b3          	xor	s1,a1,a0
    31cc:	4509                	li	a0,2
    31ce:	4585                	li	a1,1
    31d0:	12d54763          	blt	a0,a3,32fe <__muldf3+0x1ce>
    31d4:	16fd                	addi	a3,a3,-1
    31d6:	14d5ec63          	bltu	a1,a3,332e <__muldf3+0x1fe>
    31da:	8332                	mv	t1,a2
  FP_PACK_D (r, R);
    31dc:	4709                	li	a4,2
    31de:	42e30d63          	beq	t1,a4,3618 <__muldf3+0x4e8>
    31e2:	470d                	li	a4,3
    31e4:	42e30663          	beq	t1,a4,3610 <__muldf3+0x4e0>
    31e8:	4705                	li	a4,1
    31ea:	30e31963          	bne	t1,a4,34fc <__muldf3+0x3cc>
    31ee:	4781                	li	a5,0
    31f0:	4681                	li	a3,0
    31f2:	a6c5                	j	35d2 <__muldf3+0x4a2>
  FP_UNPACK_D (A, a);
    31f4:	00a46733          	or	a4,s0,a0
    31f8:	c335                	beqz	a4,325c <__muldf3+0x12c>
    31fa:	c81d                	beqz	s0,3230 <__muldf3+0x100>
    31fc:	c42a                	sw	a0,8(sp)
    31fe:	8522                	mv	a0,s0
    3200:	2a7000ef          	jal	3ca6 <__clzsi2>
    3204:	47a2                	lw	a5,8(sp)
    3206:	872a                	mv	a4,a0
    3208:	ff550313          	addi	t1,a0,-11
    320c:	45f5                	li	a1,29
    320e:	ff870693          	addi	a3,a4,-8
    3212:	406585b3          	sub	a1,a1,t1
    3216:	00d41533          	sll	a0,s0,a3
    321a:	00b7d5b3          	srl	a1,a5,a1
    321e:	8dc9                	or	a1,a1,a0
    3220:	00d79433          	sll	s0,a5,a3
    3224:	c0d00693          	li	a3,-1011
    3228:	8e99                	sub	a3,a3,a4
    322a:	8722                	mv	a4,s0
    322c:	842e                	mv	s0,a1
    322e:	b7a9                	j	3178 <__muldf3+0x48>
    3230:	c42a                	sw	a0,8(sp)
    3232:	275000ef          	jal	3ca6 <__clzsi2>
    3236:	01550313          	addi	t1,a0,21
    323a:	46f1                	li	a3,28
    323c:	47a2                	lw	a5,8(sp)
    323e:	02050713          	addi	a4,a0,32
    3242:	fc66d5e3          	bge	a3,t1,320c <__muldf3+0xdc>
    3246:	ff850593          	addi	a1,a0,-8
    324a:	00b795b3          	sll	a1,a5,a1
    324e:	bfd9                	j	3224 <__muldf3+0xf4>
    3250:	00a46733          	or	a4,s0,a0
    3254:	eb01                	bnez	a4,3264 <__muldf3+0x134>
    3256:	4401                	li	s0,0
    3258:	4309                	li	t1,2
    325a:	b705                	j	317a <__muldf3+0x4a>
    325c:	4401                	li	s0,0
    325e:	4681                	li	a3,0
    3260:	4305                	li	t1,1
    3262:	bf21                	j	317a <__muldf3+0x4a>
    3264:	872a                	mv	a4,a0
    3266:	430d                	li	t1,3
    3268:	bf09                	j	317a <__muldf3+0x4a>
  FP_UNPACK_D (B, b);
    326a:	0097e2b3          	or	t0,a5,s1
    326e:	08028163          	beqz	t0,32f0 <__muldf3+0x1c0>
    3272:	c3b1                	beqz	a5,32b6 <__muldf3+0x186>
    3274:	853e                	mv	a0,a5
    3276:	ca3a                	sw	a4,20(sp)
    3278:	c836                	sw	a3,16(sp)
    327a:	c61a                	sw	t1,12(sp)
    327c:	c03e                	sw	a5,0(sp)
    327e:	229000ef          	jal	3ca6 <__clzsi2>
    3282:	4782                	lw	a5,0(sp)
    3284:	4332                	lw	t1,12(sp)
    3286:	46c2                	lw	a3,16(sp)
    3288:	4752                	lw	a4,20(sp)
    328a:	82aa                	mv	t0,a0
    328c:	ff550393          	addi	t2,a0,-11
    3290:	45f5                	li	a1,29
    3292:	ff828513          	addi	a0,t0,-8
    3296:	407585b3          	sub	a1,a1,t2
    329a:	00a797b3          	sll	a5,a5,a0
    329e:	00b4d5b3          	srl	a1,s1,a1
    32a2:	8ddd                	or	a1,a1,a5
    32a4:	00a497b3          	sll	a5,s1,a0
    32a8:	c0d00513          	li	a0,-1011
    32ac:	40550533          	sub	a0,a0,t0
    32b0:	82be                	mv	t0,a5
    32b2:	87ae                	mv	a5,a1
    32b4:	bded                	j	31ae <__muldf3+0x7e>
    32b6:	8526                	mv	a0,s1
    32b8:	ca3e                	sw	a5,20(sp)
    32ba:	c83a                	sw	a4,16(sp)
    32bc:	c636                	sw	a3,12(sp)
    32be:	c01a                	sw	t1,0(sp)
    32c0:	1e7000ef          	jal	3ca6 <__clzsi2>
    32c4:	01550393          	addi	t2,a0,21
    32c8:	45f1                	li	a1,28
    32ca:	4302                	lw	t1,0(sp)
    32cc:	46b2                	lw	a3,12(sp)
    32ce:	4742                	lw	a4,16(sp)
    32d0:	02050293          	addi	t0,a0,32
    32d4:	4781                	li	a5,0
    32d6:	fa75dde3          	bge	a1,t2,3290 <__muldf3+0x160>
    32da:	1561                	addi	a0,a0,-8
    32dc:	00a495b3          	sll	a1,s1,a0
    32e0:	b7e1                	j	32a8 <__muldf3+0x178>
    32e2:	0097e2b3          	or	t0,a5,s1
    32e6:	00029963          	bnez	t0,32f8 <__muldf3+0x1c8>
    32ea:	4781                	li	a5,0
    32ec:	4609                	li	a2,2
    32ee:	b5c9                	j	31b0 <__muldf3+0x80>
    32f0:	4781                	li	a5,0
    32f2:	4501                	li	a0,0
    32f4:	4605                	li	a2,1
    32f6:	bd6d                	j	31b0 <__muldf3+0x80>
    32f8:	82a6                	mv	t0,s1
    32fa:	460d                	li	a2,3
    32fc:	bd55                	j	31b0 <__muldf3+0x80>
    32fe:	00d595b3          	sll	a1,a1,a3
  FP_MUL_D (R, A, B);
    3302:	5305f693          	andi	a3,a1,1328
    3306:	e28d                	bnez	a3,3328 <__muldf3+0x1f8>
    3308:	2405f513          	andi	a0,a1,576
    330c:	2e051c63          	bnez	a0,3604 <__muldf3+0x4d4>
    3310:	0885f593          	andi	a1,a1,136
    3314:	cd89                	beqz	a1,332e <__muldf3+0x1fe>
  FP_UNPACK_D (B, b);
    3316:	44a2                	lw	s1,8(sp)
    3318:	b5c9                	j	31da <__muldf3+0xaa>
  FP_MUL_D (R, A, B);
    331a:	45bd                	li	a1,15
    331c:	2eb68a63          	beq	a3,a1,3610 <__muldf3+0x4e0>
    3320:	45ad                	li	a1,11
    3322:	feb68ae3          	beq	a3,a1,3316 <__muldf3+0x1e6>
  FP_UNPACK_D (A, a);
    3326:	4492                	lw	s1,4(sp)
  FP_MUL_D (R, A, B);
    3328:	87a2                	mv	a5,s0
    332a:	82ba                	mv	t0,a4
    332c:	bd45                	j	31dc <__muldf3+0xac>
    332e:	01075693          	srli	a3,a4,0x10
    3332:	c236                	sw	a3,4(sp)
    3334:	0102d693          	srli	a3,t0,0x10
    3338:	c436                	sw	a3,8(sp)
    333a:	0742                	slli	a4,a4,0x10
    333c:	01029693          	slli	a3,t0,0x10
    3340:	82c1                	srli	a3,a3,0x10
    3342:	8341                	srli	a4,a4,0x10
    3344:	853a                	mv	a0,a4
    3346:	c836                	sw	a3,16(sp)
    3348:	85b6                	mv	a1,a3
    334a:	0cb000ef          	jal	3c14 <__mulsi3>
    334e:	82aa                	mv	t0,a0
    3350:	45a2                	lw	a1,8(sp)
    3352:	853a                	mv	a0,a4
    3354:	0c1000ef          	jal	3c14 <__mulsi3>
    3358:	83aa                	mv	t2,a0
    335a:	45c2                	lw	a1,16(sp)
    335c:	4512                	lw	a0,4(sp)
    335e:	0b7000ef          	jal	3c14 <__mulsi3>
    3362:	832a                	mv	t1,a0
    3364:	45a2                	lw	a1,8(sp)
    3366:	4512                	lw	a0,4(sp)
    3368:	0ad000ef          	jal	3c14 <__mulsi3>
    336c:	0102d693          	srli	a3,t0,0x10
    3370:	939a                	add	t2,t2,t1
    3372:	ca2a                	sw	a0,20(sp)
    3374:	93b6                	add	t2,t2,a3
    3376:	0063f563          	bgeu	t2,t1,3380 <__muldf3+0x250>
    337a:	66c1                	lui	a3,0x10
    337c:	96aa                	add	a3,a3,a0
    337e:	ca36                	sw	a3,20(sp)
    3380:	02c2                	slli	t0,t0,0x10
    3382:	0103d313          	srli	t1,t2,0x10
    3386:	0102d293          	srli	t0,t0,0x10
    338a:	03c2                	slli	t2,t2,0x10
    338c:	005386b3          	add	a3,t2,t0
    3390:	01079393          	slli	t2,a5,0x10
    3394:	ce36                	sw	a3,28(sp)
    3396:	0103d393          	srli	t2,t2,0x10
    339a:	0107d693          	srli	a3,a5,0x10
    339e:	c636                	sw	a3,12(sp)
    33a0:	853a                	mv	a0,a4
    33a2:	859e                	mv	a1,t2
    33a4:	071000ef          	jal	3c14 <__mulsi3>
    33a8:	87aa                	mv	a5,a0
    33aa:	45b2                	lw	a1,12(sp)
    33ac:	853a                	mv	a0,a4
    33ae:	067000ef          	jal	3c14 <__mulsi3>
    33b2:	872a                	mv	a4,a0
    33b4:	859e                	mv	a1,t2
    33b6:	4512                	lw	a0,4(sp)
    33b8:	05d000ef          	jal	3c14 <__mulsi3>
    33bc:	82aa                	mv	t0,a0
    33be:	45b2                	lw	a1,12(sp)
    33c0:	4512                	lw	a0,4(sp)
    33c2:	053000ef          	jal	3c14 <__mulsi3>
    33c6:	0107d693          	srli	a3,a5,0x10
    33ca:	9716                	add	a4,a4,t0
    33cc:	9736                	add	a4,a4,a3
    33ce:	00577463          	bgeu	a4,t0,33d6 <__muldf3+0x2a6>
    33d2:	66c1                	lui	a3,0x10
    33d4:	9536                	add	a0,a0,a3
    33d6:	07c2                	slli	a5,a5,0x10
    33d8:	01075693          	srli	a3,a4,0x10
    33dc:	83c1                	srli	a5,a5,0x10
    33de:	0742                	slli	a4,a4,0x10
    33e0:	97ba                	add	a5,a5,a4
    33e2:	01041713          	slli	a4,s0,0x10
    33e6:	96aa                	add	a3,a3,a0
    33e8:	c23e                	sw	a5,4(sp)
    33ea:	8341                	srli	a4,a4,0x10
    33ec:	979a                	add	a5,a5,t1
    33ee:	d03e                	sw	a5,32(sp)
    33f0:	45c2                	lw	a1,16(sp)
    33f2:	d236                	sw	a3,36(sp)
    33f4:	01045793          	srli	a5,s0,0x10
    33f8:	853a                	mv	a0,a4
    33fa:	01b000ef          	jal	3c14 <__mulsi3>
    33fe:	832a                	mv	t1,a0
    3400:	45a2                	lw	a1,8(sp)
    3402:	853a                	mv	a0,a4
    3404:	011000ef          	jal	3c14 <__mulsi3>
    3408:	82aa                	mv	t0,a0
    340a:	45c2                	lw	a1,16(sp)
    340c:	853e                	mv	a0,a5
    340e:	007000ef          	jal	3c14 <__mulsi3>
    3412:	842a                	mv	s0,a0
    3414:	45a2                	lw	a1,8(sp)
    3416:	853e                	mv	a0,a5
    3418:	7fc000ef          	jal	3c14 <__mulsi3>
    341c:	01035693          	srli	a3,t1,0x10
    3420:	92a2                	add	t0,t0,s0
    3422:	92b6                	add	t0,t0,a3
    3424:	0082f463          	bgeu	t0,s0,342c <__muldf3+0x2fc>
    3428:	66c1                	lui	a3,0x10
    342a:	9536                	add	a0,a0,a3
    342c:	0342                	slli	t1,t1,0x10
    342e:	0102d693          	srli	a3,t0,0x10
    3432:	01035313          	srli	t1,t1,0x10
    3436:	02c2                	slli	t0,t0,0x10
    3438:	00a68433          	add	s0,a3,a0
    343c:	9316                	add	t1,t1,t0
    343e:	853a                	mv	a0,a4
    3440:	859e                	mv	a1,t2
    3442:	2fc9                	jal	3c14 <__mulsi3>
    3444:	82aa                	mv	t0,a0
    3446:	45b2                	lw	a1,12(sp)
    3448:	853a                	mv	a0,a4
    344a:	27e9                	jal	3c14 <__mulsi3>
    344c:	872a                	mv	a4,a0
    344e:	859e                	mv	a1,t2
    3450:	853e                	mv	a0,a5
    3452:	27c9                	jal	3c14 <__mulsi3>
    3454:	83aa                	mv	t2,a0
    3456:	45b2                	lw	a1,12(sp)
    3458:	853e                	mv	a0,a5
    345a:	2f6d                	jal	3c14 <__mulsi3>
    345c:	0102d693          	srli	a3,t0,0x10
    3460:	007707b3          	add	a5,a4,t2
    3464:	00f68733          	add	a4,a3,a5
    3468:	00777463          	bgeu	a4,t2,3470 <__muldf3+0x340>
    346c:	67c1                	lui	a5,0x10
    346e:	953e                	add	a0,a0,a5
    3470:	5682                	lw	a3,32(sp)
    3472:	47d2                	lw	a5,20(sp)
    3474:	02c2                	slli	t0,t0,0x10
    3476:	0102d293          	srli	t0,t0,0x10
    347a:	97b6                	add	a5,a5,a3
    347c:	01071693          	slli	a3,a4,0x10
    3480:	92b6                	add	t0,t0,a3
    3482:	4612                	lw	a2,4(sp)
    3484:	5692                	lw	a3,36(sp)
    3486:	933e                	add	t1,t1,a5
    3488:	00c7b633          	sltu	a2,a5,a2
    348c:	9696                	add	a3,a3,t0
    348e:	9636                	add	a2,a2,a3
    3490:	0056b2b3          	sltu	t0,a3,t0
    3494:	00d636b3          	sltu	a3,a2,a3
    3498:	008605b3          	add	a1,a2,s0
    349c:	00f337b3          	sltu	a5,t1,a5
    34a0:	00d2e6b3          	or	a3,t0,a3
    34a4:	8341                	srli	a4,a4,0x10
    34a6:	96ba                	add	a3,a3,a4
    34a8:	00f58733          	add	a4,a1,a5
    34ac:	00c5b633          	sltu	a2,a1,a2
    34b0:	00b735b3          	sltu	a1,a4,a1
    34b4:	8e4d                	or	a2,a2,a1
    34b6:	9636                	add	a2,a2,a3
    34b8:	46f2                	lw	a3,28(sp)
    34ba:	00931293          	slli	t0,t1,0x9
    34be:	962a                	add	a2,a2,a0
    34c0:	00d2e2b3          	or	t0,t0,a3
    34c4:	005032b3          	snez	t0,t0
    34c8:	01735313          	srli	t1,t1,0x17
    34cc:	0626                	slli	a2,a2,0x9
    34ce:	01775793          	srli	a5,a4,0x17
    34d2:	0062e2b3          	or	t0,t0,t1
    34d6:	0726                	slli	a4,a4,0x9
    34d8:	00e2e2b3          	or	t0,t0,a4
    34dc:	00761713          	slli	a4,a2,0x7
    34e0:	8fd1                	or	a5,a5,a2
    34e2:	08075563          	bgez	a4,356c <__muldf3+0x43c>
    34e6:	0012d713          	srli	a4,t0,0x1
    34ea:	0012f293          	andi	t0,t0,1
    34ee:	00576733          	or	a4,a4,t0
    34f2:	01f79293          	slli	t0,a5,0x1f
    34f6:	005762b3          	or	t0,a4,t0
    34fa:	8385                	srli	a5,a5,0x1
  FP_PACK_D (r, R);
    34fc:	4702                	lw	a4,0(sp)
    34fe:	3ff70713          	addi	a4,a4,1023
    3502:	06e05863          	blez	a4,3572 <__muldf3+0x442>
    3506:	0072f693          	andi	a3,t0,7
    350a:	ce81                	beqz	a3,3522 <__muldf3+0x3f2>
    350c:	00f2f693          	andi	a3,t0,15
    3510:	4611                	li	a2,4
    3512:	00c68863          	beq	a3,a2,3522 <__muldf3+0x3f2>
    3516:	00c286b3          	add	a3,t0,a2
    351a:	0056b633          	sltu	a2,a3,t0
    351e:	97b2                	add	a5,a5,a2
    3520:	82b6                	mv	t0,a3
    3522:	00779693          	slli	a3,a5,0x7
    3526:	0006d963          	bgez	a3,3538 <__muldf3+0x408>
    352a:	ff000737          	lui	a4,0xff000
    352e:	177d                	addi	a4,a4,-1 # feffffff <_sp+0xfeff3a2f>
    3530:	8ff9                	and	a5,a5,a4
    3532:	4702                	lw	a4,0(sp)
    3534:	40070713          	addi	a4,a4,1024
    3538:	7fe00693          	li	a3,2046
    353c:	0ce6ce63          	blt	a3,a4,3618 <__muldf3+0x4e8>
    3540:	01d79693          	slli	a3,a5,0x1d
    3544:	0032d293          	srli	t0,t0,0x3
    3548:	0056e6b3          	or	a3,a3,t0
    354c:	838d                	srli	a5,a5,0x3
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    354e:	50c2                	lw	ra,48(sp)
    3550:	5432                	lw	s0,44(sp)
  FP_PACK_D (r, R);
    3552:	07b2                	slli	a5,a5,0xc
    3554:	83b1                	srli	a5,a5,0xc
    3556:	0752                	slli	a4,a4,0x14
    3558:	8f5d                	or	a4,a4,a5
    355a:	01f49793          	slli	a5,s1,0x1f
}
    355e:	8536                	mv	a0,a3
    3560:	54a2                	lw	s1,40(sp)
    3562:	00f765b3          	or	a1,a4,a5
    3566:	03410113          	addi	sp,sp,52
    356a:	8082                	ret
  FP_MUL_D (R, A, B);
    356c:	4762                	lw	a4,24(sp)
    356e:	c03a                	sw	a4,0(sp)
    3570:	b771                	j	34fc <__muldf3+0x3cc>
  FP_PACK_D (r, R);
    3572:	c335                	beqz	a4,35d6 <__muldf3+0x4a6>
    3574:	fc900693          	li	a3,-55
    3578:	c6d74be3          	blt	a4,a3,31ee <__muldf3+0xbe>
    357c:	5689                	li	a3,-30
    357e:	04d74e63          	blt	a4,a3,35da <__muldf3+0x4aa>
    3582:	4605                	li	a2,1
    3584:	8e19                	sub	a2,a2,a4
    3586:	4702                	lw	a4,0(sp)
    3588:	00c2d5b3          	srl	a1,t0,a2
    358c:	41e70693          	addi	a3,a4,1054
    3590:	00d29733          	sll	a4,t0,a3
    3594:	00e03733          	snez	a4,a4
    3598:	00d796b3          	sll	a3,a5,a3
    359c:	8f55                	or	a4,a4,a3
    359e:	8f4d                	or	a4,a4,a1
    35a0:	00c7d7b3          	srl	a5,a5,a2
    35a4:	00777693          	andi	a3,a4,7
    35a8:	ce81                	beqz	a3,35c0 <__muldf3+0x490>
    35aa:	00f77693          	andi	a3,a4,15
    35ae:	4611                	li	a2,4
    35b0:	00c68863          	beq	a3,a2,35c0 <__muldf3+0x490>
    35b4:	00c706b3          	add	a3,a4,a2
    35b8:	00e6b633          	sltu	a2,a3,a4
    35bc:	97b2                	add	a5,a5,a2
    35be:	8736                	mv	a4,a3
    35c0:	00879693          	slli	a3,a5,0x8
    35c4:	0406cf63          	bltz	a3,3622 <__muldf3+0x4f2>
    35c8:	01d79693          	slli	a3,a5,0x1d
    35cc:	830d                	srli	a4,a4,0x3
    35ce:	8ed9                	or	a3,a3,a4
    35d0:	838d                	srli	a5,a5,0x3
    35d2:	4701                	li	a4,0
    35d4:	bfad                	j	354e <__muldf3+0x41e>
    35d6:	4605                	li	a2,1
    35d8:	b77d                	j	3586 <__muldf3+0x456>
    35da:	5585                	li	a1,-31
    35dc:	40e58633          	sub	a2,a1,a4
    35e0:	00c7d633          	srl	a2,a5,a2
    35e4:	4681                	li	a3,0
    35e6:	00b70763          	beq	a4,a1,35f4 <__muldf3+0x4c4>
    35ea:	4702                	lw	a4,0(sp)
    35ec:	43e70693          	addi	a3,a4,1086
    35f0:	00d796b3          	sll	a3,a5,a3
    35f4:	00d2e2b3          	or	t0,t0,a3
    35f8:	005032b3          	snez	t0,t0
    35fc:	00566733          	or	a4,a2,t0
    3600:	4781                	li	a5,0
    3602:	b74d                	j	35a4 <__muldf3+0x474>
    3604:	000807b7          	lui	a5,0x80
    3608:	7ff00713          	li	a4,2047
    360c:	4481                	li	s1,0
    360e:	b781                	j	354e <__muldf3+0x41e>
    3610:	000807b7          	lui	a5,0x80
    3614:	4681                	li	a3,0
    3616:	bfcd                	j	3608 <__muldf3+0x4d8>
    3618:	4781                	li	a5,0
    361a:	4681                	li	a3,0
    361c:	7ff00713          	li	a4,2047
    3620:	b73d                	j	354e <__muldf3+0x41e>
    3622:	4781                	li	a5,0
    3624:	4681                	li	a3,0
    3626:	4705                	li	a4,1
    3628:	b71d                	j	354e <__muldf3+0x41e>

0000362a <__subdf3>:
  FP_DECL_D (B);
  FP_DECL_D (R);
  DFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_SEMIRAW_D (A, a);
    362a:	00100737          	lui	a4,0x100
    362e:	177d                	addi	a4,a4,-1 # fffff <_sp+0xf3a2f>
{
    3630:	1131                	addi	sp,sp,-20
  FP_UNPACK_SEMIRAW_D (A, a);
    3632:	00b777b3          	and	a5,a4,a1
{
    3636:	c622                	sw	s0,12(sp)
  FP_UNPACK_SEMIRAW_D (B, b);
    3638:	8f75                	and	a4,a4,a3
  FP_UNPACK_SEMIRAW_D (A, a);
    363a:	0145d413          	srli	s0,a1,0x14
{
    363e:	c426                	sw	s1,8(sp)
  FP_UNPACK_SEMIRAW_D (A, a);
    3640:	078e                	slli	a5,a5,0x3
    3642:	01f5d493          	srli	s1,a1,0x1f
    3646:	01d55593          	srli	a1,a0,0x1d
  FP_UNPACK_SEMIRAW_D (B, b);
    364a:	0146d293          	srli	t0,a3,0x14
  FP_UNPACK_SEMIRAW_D (A, a);
    364e:	8fcd                	or	a5,a5,a1
  FP_UNPACK_SEMIRAW_D (B, b);
    3650:	070e                	slli	a4,a4,0x3
    3652:	01d65593          	srli	a1,a2,0x1d
    3656:	8f4d                	or	a4,a4,a1
{
    3658:	c806                	sw	ra,16(sp)
  FP_UNPACK_SEMIRAW_D (B, b);
    365a:	7ff2f293          	andi	t0,t0,2047
  FP_SUB_D (R, A, B);
    365e:	7ff00593          	li	a1,2047
  FP_UNPACK_SEMIRAW_D (A, a);
    3662:	7ff47413          	andi	s0,s0,2047
    3666:	050e                	slli	a0,a0,0x3
  FP_UNPACK_SEMIRAW_D (B, b);
    3668:	82fd                	srli	a3,a3,0x1f
    366a:	060e                	slli	a2,a2,0x3
  FP_SUB_D (R, A, B);
    366c:	00b29563          	bne	t0,a1,3676 <__subdf3+0x4c>
    3670:	00c765b3          	or	a1,a4,a2
    3674:	e199                	bnez	a1,367a <__subdf3+0x50>
    3676:	0016c693          	xori	a3,a3,1
    367a:	405405b3          	sub	a1,s0,t0
    367e:	7ff00313          	li	t1,2047
    3682:	24969963          	bne	a3,s1,38d4 <__subdf3+0x2aa>
    3686:	0cb05b63          	blez	a1,375c <__subdf3+0x132>
    368a:	02029463          	bnez	t0,36b2 <__subdf3+0x88>
    368e:	00c766b3          	or	a3,a4,a2
    3692:	ce91                	beqz	a3,36ae <__subdf3+0x84>
    3694:	fff40593          	addi	a1,s0,-1
    3698:	e989                	bnez	a1,36aa <__subdf3+0x80>
    369a:	962a                	add	a2,a2,a0
    369c:	973e                	add	a4,a4,a5
    369e:	00a63533          	sltu	a0,a2,a0
    36a2:	00a707b3          	add	a5,a4,a0
    36a6:	4405                	li	s0,1
    36a8:	a891                	j	36fc <__subdf3+0xd2>
    36aa:	00641963          	bne	s0,t1,36bc <__subdf3+0x92>
    36ae:	862a                	mv	a2,a0
    36b0:	a251                	j	3834 <__subdf3+0x20a>
    36b2:	fe640ee3          	beq	s0,t1,36ae <__subdf3+0x84>
    36b6:	008006b7          	lui	a3,0x800
    36ba:	8f55                	or	a4,a4,a3
    36bc:	03800693          	li	a3,56
    36c0:	08b6c963          	blt	a3,a1,3752 <__subdf3+0x128>
    36c4:	46fd                	li	a3,31
    36c6:	02000293          	li	t0,32
    36ca:	04b6cf63          	blt	a3,a1,3728 <__subdf3+0xfe>
    36ce:	40b282b3          	sub	t0,t0,a1
    36d2:	005716b3          	sll	a3,a4,t0
    36d6:	00b65333          	srl	t1,a2,a1
    36da:	005612b3          	sll	t0,a2,t0
    36de:	0066e6b3          	or	a3,a3,t1
    36e2:	005032b3          	snez	t0,t0
    36e6:	0056e6b3          	or	a3,a3,t0
    36ea:	00b755b3          	srl	a1,a4,a1
    36ee:	00a68633          	add	a2,a3,a0
    36f2:	95be                	add	a1,a1,a5
    36f4:	00d636b3          	sltu	a3,a2,a3
    36f8:	00d587b3          	add	a5,a1,a3
    36fc:	00879713          	slli	a4,a5,0x8
    3700:	18075e63          	bgez	a4,389c <__subdf3+0x272>
    3704:	0405                	addi	s0,s0,1
    3706:	7ff00713          	li	a4,2047
    370a:	4ae40e63          	beq	s0,a4,3bc6 <TPG.c.b6e160db+0x26>
    370e:	ff800737          	lui	a4,0xff800
    3712:	177d                	addi	a4,a4,-1 # ff7fffff <_sp+0xff7f3a2f>
    3714:	8ff9                	and	a5,a5,a4
    3716:	00165713          	srli	a4,a2,0x1
    371a:	8a05                	andi	a2,a2,1
    371c:	8f51                	or	a4,a4,a2
    371e:	01f79613          	slli	a2,a5,0x1f
    3722:	8e59                	or	a2,a2,a4
    3724:	8385                	srli	a5,a5,0x1
    3726:	aa9d                	j	389c <__subdf3+0x272>
    3728:	fe058693          	addi	a3,a1,-32 # 7fffe0 <_sp+0x7f3a10>
    372c:	00d756b3          	srl	a3,a4,a3
    3730:	4301                	li	t1,0
    3732:	00558863          	beq	a1,t0,3742 <__subdf3+0x118>
    3736:	04000313          	li	t1,64
    373a:	40b30333          	sub	t1,t1,a1
    373e:	00671333          	sll	t1,a4,t1
    3742:	00c36333          	or	t1,t1,a2
    3746:	00603333          	snez	t1,t1
    374a:	0066e6b3          	or	a3,a3,t1
    374e:	4581                	li	a1,0
    3750:	bf79                	j	36ee <__subdf3+0xc4>
    3752:	00c766b3          	or	a3,a4,a2
    3756:	00d036b3          	snez	a3,a3
    375a:	bfd5                	j	374e <__subdf3+0x124>
    375c:	cdd9                	beqz	a1,37fa <__subdf3+0x1d0>
    375e:	408286b3          	sub	a3,t0,s0
    3762:	ec01                	bnez	s0,377a <__subdf3+0x150>
    3764:	00a7e5b3          	or	a1,a5,a0
    3768:	c591                	beqz	a1,3774 <__subdf3+0x14a>
    376a:	fff68593          	addi	a1,a3,-1 # 7fffff <_sp+0x7f3a2f>
    376e:	d595                	beqz	a1,369a <__subdf3+0x70>
    3770:	00669b63          	bne	a3,t1,3786 <__subdf3+0x15c>
    3774:	87ba                	mv	a5,a4
    3776:	8436                	mv	s0,a3
    3778:	a875                	j	3834 <__subdf3+0x20a>
    377a:	44628a63          	beq	t0,t1,3bce <TPG.c.b6e160db+0x2e>
    377e:	008005b7          	lui	a1,0x800
    3782:	8fcd                	or	a5,a5,a1
    3784:	85b6                	mv	a1,a3
    3786:	03800693          	li	a3,56
    378a:	06b6c363          	blt	a3,a1,37f0 <__subdf3+0x1c6>
    378e:	46fd                	li	a3,31
    3790:	02000393          	li	t2,32
    3794:	02b6c963          	blt	a3,a1,37c6 <__subdf3+0x19c>
    3798:	40b383b3          	sub	t2,t2,a1
    379c:	007796b3          	sll	a3,a5,t2
    37a0:	00b55333          	srl	t1,a0,a1
    37a4:	007513b3          	sll	t2,a0,t2
    37a8:	0066e6b3          	or	a3,a3,t1
    37ac:	007033b3          	snez	t2,t2
    37b0:	0076e6b3          	or	a3,a3,t2
    37b4:	00b7d7b3          	srl	a5,a5,a1
    37b8:	9636                	add	a2,a2,a3
    37ba:	97ba                	add	a5,a5,a4
    37bc:	00d636b3          	sltu	a3,a2,a3
    37c0:	97b6                	add	a5,a5,a3
    37c2:	8416                	mv	s0,t0
    37c4:	bf25                	j	36fc <__subdf3+0xd2>
    37c6:	fe058693          	addi	a3,a1,-32 # 7fffe0 <_sp+0x7f3a10>
    37ca:	00d7d6b3          	srl	a3,a5,a3
    37ce:	4301                	li	t1,0
    37d0:	00758863          	beq	a1,t2,37e0 <__subdf3+0x1b6>
    37d4:	04000313          	li	t1,64
    37d8:	40b30333          	sub	t1,t1,a1
    37dc:	00679333          	sll	t1,a5,t1
    37e0:	00a36333          	or	t1,t1,a0
    37e4:	00603333          	snez	t1,t1
    37e8:	0066e6b3          	or	a3,a3,t1
    37ec:	4781                	li	a5,0
    37ee:	b7e9                	j	37b8 <__subdf3+0x18e>
    37f0:	00a7e6b3          	or	a3,a5,a0
    37f4:	00d036b3          	snez	a3,a3
    37f8:	bfd5                	j	37ec <__subdf3+0x1c2>
    37fa:	00140693          	addi	a3,s0,1
    37fe:	7fe6f593          	andi	a1,a3,2046
    3802:	edbd                	bnez	a1,3880 <__subdf3+0x256>
    3804:	00a7e6b3          	or	a3,a5,a0
    3808:	e42d                	bnez	s0,3872 <__subdf3+0x248>
    380a:	3a068663          	beqz	a3,3bb6 <TPG.c.b6e160db+0x16>
    380e:	00c766b3          	or	a3,a4,a2
    3812:	3a068463          	beqz	a3,3bba <TPG.c.b6e160db+0x1a>
    3816:	962a                	add	a2,a2,a0
    3818:	973e                	add	a4,a4,a5
    381a:	00a63533          	sltu	a0,a2,a0
    381e:	00a707b3          	add	a5,a4,a0
    3822:	00879713          	slli	a4,a5,0x8
    3826:	26075d63          	bgez	a4,3aa0 <__subdf3+0x476>
    382a:	ff800737          	lui	a4,0xff800
    382e:	177d                	addi	a4,a4,-1 # ff7fffff <_sp+0xff7f3a2f>
    3830:	8ff9                	and	a5,a5,a4
    3832:	4405                	li	s0,1
  FP_PACK_SEMIRAW_D (r, R);
    3834:	01d79713          	slli	a4,a5,0x1d
    3838:	820d                	srli	a2,a2,0x3
    383a:	7ff00693          	li	a3,2047
    383e:	8f51                	or	a4,a4,a2
    3840:	838d                	srli	a5,a5,0x3
    3842:	00d41963          	bne	s0,a3,3854 <__subdf3+0x22a>
    3846:	8f5d                	or	a4,a4,a5
    3848:	4781                	li	a5,0
    384a:	c709                	beqz	a4,3854 <__subdf3+0x22a>
    384c:	000807b7          	lui	a5,0x80
    3850:	4701                	li	a4,0
    3852:	4481                	li	s1,0
    3854:	7ff47413          	andi	s0,s0,2047
    3858:	07b2                	slli	a5,a5,0xc
    385a:	0452                	slli	s0,s0,0x14
    385c:	83b1                	srli	a5,a5,0xc
    385e:	8c5d                	or	s0,s0,a5
    3860:	04fe                	slli	s1,s1,0x1f
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    3862:	009465b3          	or	a1,s0,s1
    3866:	40c2                	lw	ra,16(sp)
    3868:	4432                	lw	s0,12(sp)
    386a:	44a2                	lw	s1,8(sp)
    386c:	853a                	mv	a0,a4
    386e:	0151                	addi	sp,sp,20
    3870:	8082                	ret
  FP_SUB_D (R, A, B);
    3872:	34068663          	beqz	a3,3bbe <TPG.c.b6e160db+0x1e>
    3876:	8f51                	or	a4,a4,a2
    3878:	24071663          	bnez	a4,3ac4 <__subdf3+0x49a>
    387c:	862a                	mv	a2,a0
    387e:	a689                	j	3bc0 <TPG.c.b6e160db+0x20>
    3880:	34668263          	beq	a3,t1,3bc4 <TPG.c.b6e160db+0x24>
    3884:	962a                	add	a2,a2,a0
    3886:	973e                	add	a4,a4,a5
    3888:	00a63533          	sltu	a0,a2,a0
    388c:	972a                	add	a4,a4,a0
    388e:	01f71793          	slli	a5,a4,0x1f
    3892:	8205                	srli	a2,a2,0x1
    3894:	8e5d                	or	a2,a2,a5
    3896:	8436                	mv	s0,a3
    3898:	00175793          	srli	a5,a4,0x1
  FP_PACK_SEMIRAW_D (r, R);
    389c:	00767713          	andi	a4,a2,7
    38a0:	cf01                	beqz	a4,38b8 <__subdf3+0x28e>
    38a2:	00f67713          	andi	a4,a2,15
    38a6:	4691                	li	a3,4
    38a8:	00d70863          	beq	a4,a3,38b8 <__subdf3+0x28e>
    38ac:	00d60733          	add	a4,a2,a3
    38b0:	00c736b3          	sltu	a3,a4,a2
    38b4:	97b6                	add	a5,a5,a3
    38b6:	863a                	mv	a2,a4
    38b8:	00879713          	slli	a4,a5,0x8
    38bc:	f6075ce3          	bgez	a4,3834 <__subdf3+0x20a>
    38c0:	0405                	addi	s0,s0,1
    38c2:	7ff00713          	li	a4,2047
    38c6:	30e40063          	beq	s0,a4,3bc6 <TPG.c.b6e160db+0x26>
    38ca:	ff800737          	lui	a4,0xff800
    38ce:	177d                	addi	a4,a4,-1 # ff7fffff <_sp+0xff7f3a2f>
    38d0:	8ff9                	and	a5,a5,a4
    38d2:	b78d                	j	3834 <__subdf3+0x20a>
  FP_SUB_D (R, A, B);
    38d4:	0cb05263          	blez	a1,3998 <__subdf3+0x36e>
    38d8:	08029063          	bnez	t0,3958 <__subdf3+0x32e>
    38dc:	00c766b3          	or	a3,a4,a2
    38e0:	dc0687e3          	beqz	a3,36ae <__subdf3+0x84>
    38e4:	fff40593          	addi	a1,s0,-1
    38e8:	e999                	bnez	a1,38fe <__subdf3+0x2d4>
    38ea:	40c50633          	sub	a2,a0,a2
    38ee:	40e78733          	sub	a4,a5,a4
    38f2:	00c53533          	sltu	a0,a0,a2
    38f6:	40a707b3          	sub	a5,a4,a0
    38fa:	4405                	li	s0,1
    38fc:	a0a1                	j	3944 <__subdf3+0x31a>
    38fe:	da6408e3          	beq	s0,t1,36ae <__subdf3+0x84>
    3902:	03800693          	li	a3,56
    3906:	08b6c463          	blt	a3,a1,398e <__subdf3+0x364>
    390a:	46fd                	li	a3,31
    390c:	02000293          	li	t0,32
    3910:	04b6ca63          	blt	a3,a1,3964 <__subdf3+0x33a>
    3914:	40b282b3          	sub	t0,t0,a1
    3918:	005716b3          	sll	a3,a4,t0
    391c:	00b65333          	srl	t1,a2,a1
    3920:	005612b3          	sll	t0,a2,t0
    3924:	0066e6b3          	or	a3,a3,t1
    3928:	005032b3          	snez	t0,t0
    392c:	0056e6b3          	or	a3,a3,t0
    3930:	00b755b3          	srl	a1,a4,a1
    3934:	40d50633          	sub	a2,a0,a3
    3938:	40b785b3          	sub	a1,a5,a1
    393c:	00c53533          	sltu	a0,a0,a2
    3940:	40a587b3          	sub	a5,a1,a0
    3944:	00879713          	slli	a4,a5,0x8
    3948:	f4075ae3          	bgez	a4,389c <__subdf3+0x272>
    394c:	008005b7          	lui	a1,0x800
    3950:	15fd                	addi	a1,a1,-1 # 7fffff <_sp+0x7f3a2f>
    3952:	8dfd                	and	a1,a1,a5
    3954:	8332                	mv	t1,a2
    3956:	a265                	j	3afe <__subdf3+0x4d4>
    3958:	d4640be3          	beq	s0,t1,36ae <__subdf3+0x84>
    395c:	008006b7          	lui	a3,0x800
    3960:	8f55                	or	a4,a4,a3
    3962:	b745                	j	3902 <__subdf3+0x2d8>
    3964:	fe058693          	addi	a3,a1,-32
    3968:	00d756b3          	srl	a3,a4,a3
    396c:	4301                	li	t1,0
    396e:	00558863          	beq	a1,t0,397e <__subdf3+0x354>
    3972:	04000313          	li	t1,64
    3976:	40b30333          	sub	t1,t1,a1
    397a:	00671333          	sll	t1,a4,t1
    397e:	00c36333          	or	t1,t1,a2
    3982:	00603333          	snez	t1,t1
    3986:	0066e6b3          	or	a3,a3,t1
    398a:	4581                	li	a1,0
    398c:	b765                	j	3934 <__subdf3+0x30a>
    398e:	00c766b3          	or	a3,a4,a2
    3992:	00d036b3          	snez	a3,a3
    3996:	bfd5                	j	398a <__subdf3+0x360>
    3998:	cdcd                	beqz	a1,3a52 <__subdf3+0x428>
    399a:	408283b3          	sub	t2,t0,s0
    399e:	e41d                	bnez	s0,39cc <__subdf3+0x3a2>
    39a0:	00a7e5b3          	or	a1,a5,a0
    39a4:	c185                	beqz	a1,39c4 <__subdf3+0x39a>
    39a6:	fff38593          	addi	a1,t2,-1
    39aa:	e999                	bnez	a1,39c0 <__subdf3+0x396>
    39ac:	40a60533          	sub	a0,a2,a0
    39b0:	00a635b3          	sltu	a1,a2,a0
    39b4:	8f1d                	sub	a4,a4,a5
    39b6:	862a                	mv	a2,a0
    39b8:	40b707b3          	sub	a5,a4,a1
    39bc:	84b6                	mv	s1,a3
    39be:	bf35                	j	38fa <__subdf3+0x2d0>
    39c0:	00639c63          	bne	t2,t1,39d8 <__subdf3+0x3ae>
    39c4:	84b6                	mv	s1,a3
    39c6:	87ba                	mv	a5,a4
    39c8:	841e                	mv	s0,t2
    39ca:	b5ad                	j	3834 <__subdf3+0x20a>
    39cc:	20628063          	beq	t0,t1,3bcc <TPG.c.b6e160db+0x2c>
    39d0:	008005b7          	lui	a1,0x800
    39d4:	8fcd                	or	a5,a5,a1
    39d6:	859e                	mv	a1,t2
    39d8:	03800313          	li	t1,56
    39dc:	06b34763          	blt	t1,a1,3a4a <__subdf3+0x420>
    39e0:	437d                	li	t1,31
    39e2:	02000413          	li	s0,32
    39e6:	02b34d63          	blt	t1,a1,3a20 <__subdf3+0x3f6>
    39ea:	8c0d                	sub	s0,s0,a1
    39ec:	00b553b3          	srl	t2,a0,a1
    39f0:	00879333          	sll	t1,a5,s0
    39f4:	00851433          	sll	s0,a0,s0
    39f8:	00736333          	or	t1,t1,t2
    39fc:	00803433          	snez	s0,s0
    3a00:	00836533          	or	a0,t1,s0
    3a04:	00b7d5b3          	srl	a1,a5,a1
    3a08:	40a60533          	sub	a0,a2,a0
    3a0c:	00a637b3          	sltu	a5,a2,a0
    3a10:	40b705b3          	sub	a1,a4,a1
    3a14:	862a                	mv	a2,a0
    3a16:	40f587b3          	sub	a5,a1,a5
    3a1a:	8416                	mv	s0,t0
    3a1c:	84b6                	mv	s1,a3
    3a1e:	b71d                	j	3944 <__subdf3+0x31a>
    3a20:	fe058313          	addi	t1,a1,-32 # 7fffe0 <_sp+0x7f3a10>
    3a24:	0067d333          	srl	t1,a5,t1
    3a28:	4381                	li	t2,0
    3a2a:	00858863          	beq	a1,s0,3a3a <__subdf3+0x410>
    3a2e:	04000393          	li	t2,64
    3a32:	40b383b3          	sub	t2,t2,a1
    3a36:	007793b3          	sll	t2,a5,t2
    3a3a:	00a3e3b3          	or	t2,t2,a0
    3a3e:	007033b3          	snez	t2,t2
    3a42:	00736533          	or	a0,t1,t2
    3a46:	4581                	li	a1,0
    3a48:	b7c1                	j	3a08 <__subdf3+0x3de>
    3a4a:	8d5d                	or	a0,a0,a5
    3a4c:	00a03533          	snez	a0,a0
    3a50:	bfdd                	j	3a46 <__subdf3+0x41c>
    3a52:	00140593          	addi	a1,s0,1
    3a56:	7fe5f593          	andi	a1,a1,2046
    3a5a:	edad                	bnez	a1,3ad4 <__subdf3+0x4aa>
    3a5c:	00c765b3          	or	a1,a4,a2
    3a60:	00a7e2b3          	or	t0,a5,a0
    3a64:	e839                	bnez	s0,3aba <__subdf3+0x490>
    3a66:	00029663          	bnez	t0,3a72 <__subdf3+0x448>
    3a6a:	87ba                	mv	a5,a4
    3a6c:	e98d                	bnez	a1,3a9e <__subdf3+0x474>
    3a6e:	4481                	li	s1,0
    3a70:	aa99                	j	3bc6 <TPG.c.b6e160db+0x26>
    3a72:	14058463          	beqz	a1,3bba <TPG.c.b6e160db+0x1a>
    3a76:	40c50333          	sub	t1,a0,a2
    3a7a:	006532b3          	sltu	t0,a0,t1
    3a7e:	40e785b3          	sub	a1,a5,a4
    3a82:	405585b3          	sub	a1,a1,t0
    3a86:	00859293          	slli	t0,a1,0x8
    3a8a:	0202d163          	bgez	t0,3aac <__subdf3+0x482>
    3a8e:	40a60533          	sub	a0,a2,a0
    3a92:	00a635b3          	sltu	a1,a2,a0
    3a96:	8f1d                	sub	a4,a4,a5
    3a98:	862a                	mv	a2,a0
    3a9a:	40b707b3          	sub	a5,a4,a1
    3a9e:	84b6                	mv	s1,a3
  FP_PACK_SEMIRAW_D (r, R);
    3aa0:	00f66733          	or	a4,a2,a5
    3aa4:	12070b63          	beqz	a4,3bda <TPG.c.b6e160db+0x3a>
    3aa8:	4401                	li	s0,0
    3aaa:	bbcd                	j	389c <__subdf3+0x272>
  FP_SUB_D (R, A, B);
    3aac:	00b36633          	or	a2,t1,a1
    3ab0:	12060263          	beqz	a2,3bd4 <TPG.c.b6e160db+0x34>
    3ab4:	87ae                	mv	a5,a1
    3ab6:	861a                	mv	a2,t1
    3ab8:	b7e5                	j	3aa0 <__subdf3+0x476>
    3aba:	00029a63          	bnez	t0,3ace <__subdf3+0x4a4>
    3abe:	84b6                	mv	s1,a3
    3ac0:	0e059f63          	bnez	a1,3bbe <TPG.c.b6e160db+0x1e>
    3ac4:	4481                	li	s1,0
    3ac6:	004007b7          	lui	a5,0x400
    3aca:	4601                	li	a2,0
    3acc:	a8d5                	j	3bc0 <TPG.c.b6e160db+0x20>
    3ace:	da0587e3          	beqz	a1,387c <__subdf3+0x252>
    3ad2:	bfcd                	j	3ac4 <__subdf3+0x49a>
    3ad4:	40c502b3          	sub	t0,a0,a2
    3ad8:	005533b3          	sltu	t2,a0,t0
    3adc:	40e785b3          	sub	a1,a5,a4
    3ae0:	407585b3          	sub	a1,a1,t2
    3ae4:	00859393          	slli	t2,a1,0x8
    3ae8:	8316                	mv	t1,t0
    3aea:	0603d663          	bgez	t2,3b56 <__subdf3+0x52c>
    3aee:	40a60333          	sub	t1,a2,a0
    3af2:	40f705b3          	sub	a1,a4,a5
    3af6:	00663633          	sltu	a2,a2,t1
    3afa:	8d91                	sub	a1,a1,a2
    3afc:	84b6                	mv	s1,a3
    3afe:	c1bd                	beqz	a1,3b64 <__subdf3+0x53a>
    3b00:	852e                	mv	a0,a1
    3b02:	c21a                	sw	t1,4(sp)
    3b04:	c02e                	sw	a1,0(sp)
    3b06:	2245                	jal	3ca6 <__clzsi2>
    3b08:	4582                	lw	a1,0(sp)
    3b0a:	4312                	lw	t1,4(sp)
    3b0c:	ff850713          	addi	a4,a0,-8
    3b10:	02000793          	li	a5,32
    3b14:	8f99                	sub	a5,a5,a4
    3b16:	00e595b3          	sll	a1,a1,a4
    3b1a:	00f357b3          	srl	a5,t1,a5
    3b1e:	8fcd                	or	a5,a5,a1
    3b20:	00e31633          	sll	a2,t1,a4
    3b24:	08874363          	blt	a4,s0,3baa <TPG.c.b6e160db+0xa>
    3b28:	8f01                	sub	a4,a4,s0
    3b2a:	00170513          	addi	a0,a4,1
    3b2e:	46fd                	li	a3,31
    3b30:	02000593          	li	a1,32
    3b34:	04a6c963          	blt	a3,a0,3b86 <__subdf3+0x55c>
    3b38:	8d89                	sub	a1,a1,a0
    3b3a:	00b79733          	sll	a4,a5,a1
    3b3e:	00a656b3          	srl	a3,a2,a0
    3b42:	00b615b3          	sll	a1,a2,a1
    3b46:	8f55                	or	a4,a4,a3
    3b48:	00b035b3          	snez	a1,a1
    3b4c:	00b76633          	or	a2,a4,a1
    3b50:	00a7d7b3          	srl	a5,a5,a0
    3b54:	b7b1                	j	3aa0 <__subdf3+0x476>
    3b56:	00b2e633          	or	a2,t0,a1
    3b5a:	f255                	bnez	a2,3afe <__subdf3+0x4d4>
    3b5c:	4481                	li	s1,0
    3b5e:	4781                	li	a5,0
    3b60:	4401                	li	s0,0
    3b62:	b9c9                	j	3834 <__subdf3+0x20a>
    3b64:	851a                	mv	a0,t1
    3b66:	c22e                	sw	a1,4(sp)
    3b68:	c01a                	sw	t1,0(sp)
    3b6a:	2a35                	jal	3ca6 <__clzsi2>
    3b6c:	01850713          	addi	a4,a0,24
    3b70:	47fd                	li	a5,31
    3b72:	4302                	lw	t1,0(sp)
    3b74:	4581                	li	a1,0
    3b76:	f8e7dde3          	bge	a5,a4,3b10 <__subdf3+0x4e6>
    3b7a:	ff850793          	addi	a5,a0,-8
    3b7e:	00f317b3          	sll	a5,t1,a5
    3b82:	4601                	li	a2,0
    3b84:	b745                	j	3b24 <__subdf3+0x4fa>
    3b86:	1705                	addi	a4,a4,-31
    3b88:	00e7d733          	srl	a4,a5,a4
    3b8c:	4681                	li	a3,0
    3b8e:	00b50763          	beq	a0,a1,3b9c <__subdf3+0x572>
    3b92:	04000693          	li	a3,64
    3b96:	8e89                	sub	a3,a3,a0
    3b98:	00d796b3          	sll	a3,a5,a3
    3b9c:	8ed1                	or	a3,a3,a2
    3b9e:	00d036b3          	snez	a3,a3
    3ba2:	00d76633          	or	a2,a4,a3
    3ba6:	4781                	li	a5,0
    3ba8:	bde5                	j	3aa0 <__subdf3+0x476>
    3baa:	8c19                	sub	s0,s0,a4
    3bac:	ff800737          	lui	a4,0xff800
    3bb0:	177d                	addi	a4,a4,-1 # ff7fffff <_sp+0xff7f3a2f>
    3bb2:	8ff9                	and	a5,a5,a4
    3bb4:	b1e5                	j	389c <__subdf3+0x272>
    3bb6:	87ba                	mv	a5,a4
    3bb8:	b5e5                	j	3aa0 <__subdf3+0x476>
    3bba:	862a                	mv	a2,a0
    3bbc:	b5d5                	j	3aa0 <__subdf3+0x476>
    3bbe:	87ba                	mv	a5,a4
    3bc0:	841a                	mv	s0,t1
    3bc2:	b98d                	j	3834 <__subdf3+0x20a>
    3bc4:	8436                	mv	s0,a3
    3bc6:	4781                	li	a5,0
    3bc8:	4601                	li	a2,0
    3bca:	b1ad                	j	3834 <__subdf3+0x20a>
    3bcc:	84b6                	mv	s1,a3
    3bce:	87ba                	mv	a5,a4
    3bd0:	8416                	mv	s0,t0
    3bd2:	b18d                	j	3834 <__subdf3+0x20a>
    3bd4:	4481                	li	s1,0
    3bd6:	4781                	li	a5,0
    3bd8:	b9b1                	j	3834 <__subdf3+0x20a>
    3bda:	4781                	li	a5,0
    3bdc:	4601                	li	a2,0
    3bde:	b749                	j	3b60 <__subdf3+0x536>

00003be0 <__unorddf2>:
  FP_DECL_D (A);
  FP_DECL_D (B);
  CMPtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_D (A, a);
    3be0:	001007b7          	lui	a5,0x100
    3be4:	17fd                	addi	a5,a5,-1 # fffff <_sp+0xf3a2f>
    3be6:	00b7f733          	and	a4,a5,a1
    3bea:	81d1                	srli	a1,a1,0x14
  FP_UNPACK_RAW_D (B, b);
    3bec:	8ff5                	and	a5,a5,a3
  FP_UNPACK_RAW_D (A, a);
    3bee:	7ff5f593          	andi	a1,a1,2047
  FP_UNPACK_RAW_D (B, b);
    3bf2:	82d1                	srli	a3,a3,0x14
  FP_CMP_UNORD_D (r, A, B, 1);
    3bf4:	7ff00313          	li	t1,2047
  FP_UNPACK_RAW_D (B, b);
    3bf8:	7ff6f693          	andi	a3,a3,2047
  FP_CMP_UNORD_D (r, A, B, 1);
    3bfc:	00659563          	bne	a1,t1,3c06 <__unorddf2+0x26>
    3c00:	8f49                	or	a4,a4,a0
    3c02:	4505                	li	a0,1
    3c04:	e719                	bnez	a4,3c12 <__unorddf2+0x32>
    3c06:	4501                	li	a0,0
    3c08:	00669563          	bne	a3,t1,3c12 <__unorddf2+0x32>
    3c0c:	8fd1                	or	a5,a5,a2
    3c0e:	00f03533          	snez	a0,a5
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    3c12:	8082                	ret

00003c14 <__mulsi3>:
/* Our RV64 64-bit routine is equivalent to our RV32 32-bit routine.  */
# define __muldi3 __mulsi3
#endif

FUNC_BEGIN (__muldi3)
  mv     a2, a0
    3c14:	862a                	mv	a2,a0
  li     a0, 0
    3c16:	4501                	li	a0,0
.L1:
  andi   a3, a1, 1
    3c18:	0015f693          	andi	a3,a1,1
  beqz   a3, .L2
    3c1c:	c291                	beqz	a3,3c20 <__mulsi3+0xc>
  add    a0, a0, a2
    3c1e:	9532                	add	a0,a0,a2
.L2:
  srli   a1, a1, 1
    3c20:	8185                	srli	a1,a1,0x1
  slli   a2, a2, 1
    3c22:	0606                	slli	a2,a2,0x1
  bnez   a1, .L1
    3c24:	f9f5                	bnez	a1,3c18 <__mulsi3+0x4>
  ret
    3c26:	8082                	ret

00003c28 <__divsi3>:
  li    t0, -1
  beq   a1, t0, .L20
#endif

FUNC_BEGIN (__divdi3)
  bltz  a0, .L10
    3c28:	02054e63          	bltz	a0,3c64 <__umodsi3+0x8>
  bltz  a1, .L11
    3c2c:	0405c363          	bltz	a1,3c72 <__umodsi3+0x16>

00003c30 <__hidden___udivsi3>:
  /* Since the quotient is positive, fall into __udivdi3.  */

FUNC_BEGIN (__udivdi3)
  mv    a2, a1
    3c30:	862e                	mv	a2,a1
  mv    a1, a0
    3c32:	85aa                	mv	a1,a0
  li    a0, -1
    3c34:	557d                	li	a0,-1
  beqz  a2, .L5
    3c36:	c215                	beqz	a2,3c5a <__hidden___udivsi3+0x2a>
  li    a3, 1
    3c38:	4685                	li	a3,1
  bgeu  a2, a1, .L2
    3c3a:	00b67863          	bgeu	a2,a1,3c4a <__hidden___udivsi3+0x1a>
.L1:
  blez  a2, .L2
    3c3e:	00c05663          	blez	a2,3c4a <__hidden___udivsi3+0x1a>
  slli  a2, a2, 1
    3c42:	0606                	slli	a2,a2,0x1
  slli  a3, a3, 1
    3c44:	0686                	slli	a3,a3,0x1
  bgtu  a1, a2, .L1
    3c46:	feb66ce3          	bltu	a2,a1,3c3e <__hidden___udivsi3+0xe>
.L2:
  li    a0, 0
    3c4a:	4501                	li	a0,0
.L3:
  bltu  a1, a2, .L4
    3c4c:	00c5e463          	bltu	a1,a2,3c54 <__hidden___udivsi3+0x24>
  sub   a1, a1, a2
    3c50:	8d91                	sub	a1,a1,a2
  or    a0, a0, a3
    3c52:	8d55                	or	a0,a0,a3
.L4:
  srli  a3, a3, 1
    3c54:	8285                	srli	a3,a3,0x1
  srli  a2, a2, 1
    3c56:	8205                	srli	a2,a2,0x1
  bnez  a3, .L3
    3c58:	faf5                	bnez	a3,3c4c <__hidden___udivsi3+0x1c>
.L5:
  ret
    3c5a:	8082                	ret

00003c5c <__umodsi3>:
FUNC_END (__udivdi3)
HIDDEN_DEF (__udivdi3)

FUNC_BEGIN (__umoddi3)
  /* Call __udivdi3(a0, a1), then return the remainder, which is in a1.  */
  move  t0, ra
    3c5c:	8286                	mv	t0,ra
  jal   HIDDEN_JUMPTARGET(__udivdi3)
    3c5e:	3fc9                	jal	3c30 <__hidden___udivsi3>
  move  a0, a1
    3c60:	852e                	mv	a0,a1
  jr    t0
    3c62:	8282                	jr	t0
FUNC_END (__umoddi3)

  /* Handle negative arguments to __divdi3.  */
.L10:
  neg   a0, a0
    3c64:	40a00533          	neg	a0,a0
  /* Zero is handled as a negative so that the result will not be inverted.  */
  bgtz  a1, .L12     /* Compute __udivdi3(-a0, a1), then negate the result.  */
    3c68:	00b04763          	bgtz	a1,3c76 <__umodsi3+0x1a>

  neg   a1, a1
    3c6c:	40b005b3          	neg	a1,a1
  j     HIDDEN_JUMPTARGET(__udivdi3)     /* Compute __udivdi3(-a0, -a1).  */
    3c70:	b7c1                	j	3c30 <__hidden___udivsi3>
.L11:                /* Compute __udivdi3(a0, -a1), then negate the result.  */
  neg   a1, a1
    3c72:	40b005b3          	neg	a1,a1
.L12:
  move  t0, ra
    3c76:	8286                	mv	t0,ra
  jal   HIDDEN_JUMPTARGET(__udivdi3)
    3c78:	3f65                	jal	3c30 <__hidden___udivsi3>
  neg   a0, a0
    3c7a:	40a00533          	neg	a0,a0
  jr    t0
    3c7e:	8282                	jr	t0

00003c80 <__modsi3>:
FUNC_END (__divdi3)

FUNC_BEGIN (__moddi3)
  move   t0, ra
    3c80:	8286                	mv	t0,ra
  bltz   a1, .L31
    3c82:	0005c763          	bltz	a1,3c90 <__modsi3+0x10>
  bltz   a0, .L32
    3c86:	00054963          	bltz	a0,3c98 <__modsi3+0x18>
.L30:
  jal    HIDDEN_JUMPTARGET(__udivdi3)    /* The dividend is not negative.  */
    3c8a:	375d                	jal	3c30 <__hidden___udivsi3>
  move   a0, a1
    3c8c:	852e                	mv	a0,a1
  jr     t0
    3c8e:	8282                	jr	t0
.L31:
  neg    a1, a1
    3c90:	40b005b3          	neg	a1,a1
  bgez   a0, .L30
    3c94:	fe055be3          	bgez	a0,3c8a <__modsi3+0xa>
.L32:
  neg    a0, a0
    3c98:	40a00533          	neg	a0,a0
  jal    HIDDEN_JUMPTARGET(__udivdi3)    /* The dividend is hella negative.  */
    3c9c:	3f51                	jal	3c30 <__hidden___udivsi3>
  neg    a0, a1
    3c9e:	40b00533          	neg	a0,a1
  jr     t0
    3ca2:	8282                	jr	t0
    3ca4:	0001                	nop

00003ca6 <__clzsi2>:
int
__clzSI2 (UWtype x)
{
  Wtype ret;

  count_leading_zeros (ret, x);
    3ca6:	67c1                	lui	a5,0x10
    3ca8:	02f57563          	bgeu	a0,a5,3cd2 <__clzsi2+0x2c>
    3cac:	10053793          	sltiu	a5,a0,256
    3cb0:	0017b793          	seqz	a5,a5
    3cb4:	078e                	slli	a5,a5,0x3
    3cb6:	6729                	lui	a4,0xa
    3cb8:	00f55533          	srl	a0,a0,a5
    3cbc:	5dc70713          	addi	a4,a4,1500 # a5dc <__clz_tab>
    3cc0:	972a                	add	a4,a4,a0
    3cc2:	00074503          	lbu	a0,0(a4)
    3cc6:	02000693          	li	a3,32
    3cca:	8e9d                	sub	a3,a3,a5

  return ret;
}
    3ccc:	40a68533          	sub	a0,a3,a0
    3cd0:	8082                	ret
  count_leading_zeros (ret, x);
    3cd2:	01000737          	lui	a4,0x1000
    3cd6:	47e1                	li	a5,24
    3cd8:	fce57fe3          	bgeu	a0,a4,3cb6 <__clzsi2+0x10>
    3cdc:	47c1                	li	a5,16
    3cde:	bfe1                	j	3cb6 <__clzsi2+0x10>

00003ce0 <__ledf2>:
#include "soft-fp.h"
#include "double.h"

CMPtype
__ledf2 (DFtype a, DFtype b)
{
    3ce0:	1161                	addi	sp,sp,-8
  FP_DECL_D (A);
  FP_DECL_D (B);
  CMPtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_D (A, a);
    3ce2:	0145d293          	srli	t0,a1,0x14
    3ce6:	001007b7          	lui	a5,0x100
    3cea:	17fd                	addi	a5,a5,-1 # fffff <_sp+0xf3a2f>
{
    3cec:	c222                	sw	s0,4(sp)
    3cee:	c026                	sw	s1,0(sp)
  FP_UNPACK_RAW_D (B, b);
    3cf0:	0146d413          	srli	s0,a3,0x14
  FP_UNPACK_RAW_D (A, a);
    3cf4:	7ff2f293          	andi	t0,t0,2047
  FP_CMP_D (r, A, B, 2, 2);
    3cf8:	7ff00713          	li	a4,2047
  FP_UNPACK_RAW_D (A, a);
    3cfc:	00b7f3b3          	and	t2,a5,a1
{
    3d00:	832a                	mv	t1,a0
  FP_UNPACK_RAW_D (B, b);
    3d02:	8ff5                	and	a5,a5,a3
  FP_UNPACK_RAW_D (A, a);
    3d04:	81fd                	srli	a1,a1,0x1f
  FP_UNPACK_RAW_D (B, b);
    3d06:	7ff47413          	andi	s0,s0,2047
    3d0a:	82fd                	srli	a3,a3,0x1f
  FP_CMP_D (r, A, B, 2, 2);
    3d0c:	00e28c63          	beq	t0,a4,3d24 <__ledf2+0x44>
    3d10:	7ff00713          	li	a4,2047
  FP_UNPACK_RAW_D (B, b);
    3d14:	8522                	mv	a0,s0
  FP_CMP_D (r, A, B, 2, 2);
    3d16:	00e41f63          	bne	s0,a4,3d34 <__ledf2+0x54>
    3d1a:	00c7e733          	or	a4,a5,a2
    3d1e:	cb19                	beqz	a4,3d34 <__ledf2+0x54>
    3d20:	4509                	li	a0,2
    3d22:	a029                	j	3d2c <__ledf2+0x4c>
    3d24:	00a3e733          	or	a4,t2,a0
    3d28:	4509                	li	a0,2
    3d2a:	d37d                	beqz	a4,3d10 <__ledf2+0x30>
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    3d2c:	4412                	lw	s0,4(sp)
    3d2e:	4482                	lw	s1,0(sp)
    3d30:	0121                	addi	sp,sp,8
    3d32:	8082                	ret
  FP_CMP_D (r, A, B, 2, 2);
    3d34:	4701                	li	a4,0
    3d36:	00029663          	bnez	t0,3d42 <__ledf2+0x62>
    3d3a:	0063e733          	or	a4,t2,t1
    3d3e:	00173713          	seqz	a4,a4
    3d42:	ec19                	bnez	s0,3d60 <__ledf2+0x80>
    3d44:	00c7e4b3          	or	s1,a5,a2
    3d48:	c711                	beqz	a4,3d54 <__ledf2+0x74>
    3d4a:	d0ed                	beqz	s1,3d2c <__ledf2+0x4c>
    3d4c:	00169513          	slli	a0,a3,0x1
    3d50:	157d                	addi	a0,a0,-1
    3d52:	bfe9                	j	3d2c <__ledf2+0x4c>
    3d54:	e499                	bnez	s1,3d62 <__ledf2+0x82>
    3d56:	40b00533          	neg	a0,a1
    3d5a:	00156513          	ori	a0,a0,1
    3d5e:	b7f9                	j	3d2c <__ledf2+0x4c>
    3d60:	f775                	bnez	a4,3d4c <__ledf2+0x6c>
    3d62:	feb69ae3          	bne	a3,a1,3d56 <__ledf2+0x76>
    3d66:	40d00533          	neg	a0,a3
    3d6a:	fe5448e3          	blt	s0,t0,3d5a <__ledf2+0x7a>
    3d6e:	fc82cfe3          	blt	t0,s0,3d4c <__ledf2+0x6c>
    3d72:	fe77e2e3          	bltu	a5,t2,3d56 <__ledf2+0x76>
    3d76:	00667463          	bgeu	a2,t1,3d7e <__ledf2+0x9e>
    3d7a:	fcf38ee3          	beq	t2,a5,3d56 <__ledf2+0x76>
    3d7e:	00c36563          	bltu	t1,a2,3d88 <__ledf2+0xa8>
    3d82:	4501                	li	a0,0
    3d84:	faf3f4e3          	bgeu	t2,a5,3d2c <__ledf2+0x4c>
    3d88:	00159513          	slli	a0,a1,0x1
    3d8c:	b7d1                	j	3d50 <__ledf2+0x70>

00003d8e <__fixdfsi>:
  FP_DECL_EX;
  FP_DECL_D (A);
  USItype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_D (A, a);
    3d8e:	0145d713          	srli	a4,a1,0x14
    3d92:	001006b7          	lui	a3,0x100
    3d96:	fff68793          	addi	a5,a3,-1 # fffff <_sp+0xf3a2f>
    3d9a:	7ff77713          	andi	a4,a4,2047
  FP_TO_INT_D (r, A, SI_BITS, 1);
    3d9e:	3fe00613          	li	a2,1022
  FP_UNPACK_RAW_D (A, a);
    3da2:	8fed                	and	a5,a5,a1
    3da4:	81fd                	srli	a1,a1,0x1f
  FP_TO_INT_D (r, A, SI_BITS, 1);
    3da6:	04e65363          	bge	a2,a4,3dec <__fixdfsi+0x5e>
    3daa:	41d00613          	li	a2,1053
    3dae:	00e65763          	bge	a2,a4,3dbc <__fixdfsi+0x2e>
    3db2:	80000537          	lui	a0,0x80000
    3db6:	157d                	addi	a0,a0,-1 # 7fffffff <_sp+0x7fff3a2f>
    3db8:	952e                	add	a0,a0,a1
    3dba:	8082                	ret
    3dbc:	8fd5                	or	a5,a5,a3
    3dbe:	41300693          	li	a3,1043
    3dc2:	02e6d163          	bge	a3,a4,3de4 <__fixdfsi+0x56>
    3dc6:	bed70693          	addi	a3,a4,-1043 # fffbed <_sp+0xff361d>
    3dca:	00d797b3          	sll	a5,a5,a3
    3dce:	43300693          	li	a3,1075
    3dd2:	40e68733          	sub	a4,a3,a4
    3dd6:	00e55533          	srl	a0,a0,a4
    3dda:	8d5d                	or	a0,a0,a5
    3ddc:	c989                	beqz	a1,3dee <__fixdfsi+0x60>
    3dde:	40a00533          	neg	a0,a0
    3de2:	8082                	ret
    3de4:	8e99                	sub	a3,a3,a4
    3de6:	00d7d533          	srl	a0,a5,a3
    3dea:	bfcd                	j	3ddc <__fixdfsi+0x4e>
    3dec:	4501                	li	a0,0
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    3dee:	8082                	ret

00003df0 <__floatunsidf>:
#include "soft-fp.h"
#include "double.h"

DFtype
__floatunsidf (USItype i)
{
    3df0:	1161                	addi	sp,sp,-8
    3df2:	c022                	sw	s0,0(sp)
    3df4:	c206                	sw	ra,4(sp)
    3df6:	842a                	mv	s0,a0
  FP_DECL_D (A);
  DFtype a;

  FP_FROM_INT_D (A, i, SI_BITS, USItype);
    3df8:	cd15                	beqz	a0,3e34 <__floatunsidf+0x44>
    3dfa:	3575                	jal	3ca6 <__clzsi2>
    3dfc:	41e00713          	li	a4,1054
    3e00:	47a9                	li	a5,10
    3e02:	8f09                	sub	a4,a4,a0
    3e04:	02a7c363          	blt	a5,a0,3e2a <__floatunsidf+0x3a>
    3e08:	47ad                	li	a5,11
    3e0a:	8f89                	sub	a5,a5,a0
    3e0c:	0555                	addi	a0,a0,21
    3e0e:	00f457b3          	srl	a5,s0,a5
    3e12:	00a41433          	sll	s0,s0,a0
  FP_PACK_RAW_D (a, A);

  return a;
}
    3e16:	4092                	lw	ra,4(sp)
    3e18:	8522                	mv	a0,s0
    3e1a:	4402                	lw	s0,0(sp)
  FP_PACK_RAW_D (a, A);
    3e1c:	07b2                	slli	a5,a5,0xc
    3e1e:	0752                	slli	a4,a4,0x14
    3e20:	83b1                	srli	a5,a5,0xc
}
    3e22:	00f765b3          	or	a1,a4,a5
    3e26:	0121                	addi	sp,sp,8
    3e28:	8082                	ret
  FP_FROM_INT_D (A, i, SI_BITS, USItype);
    3e2a:	1555                	addi	a0,a0,-11
    3e2c:	00a417b3          	sll	a5,s0,a0
    3e30:	4401                	li	s0,0
    3e32:	b7d5                	j	3e16 <__floatunsidf+0x26>
    3e34:	4781                	li	a5,0
    3e36:	4701                	li	a4,0
    3e38:	bff9                	j	3e16 <__floatunsidf+0x26>
