
main.elf:     file format elf32-littleriscv


Disassembly of section .vectors:

00000000 <__vector_start>:

.section .vectors, "ax"
.option norvc
vector_table:
	//  0 : exception Handler and user software interrupt
	j handler_exception
   0:	1c00106f          	j	11c0 <handler_exception>
	//  1 : supervisor software interrupt
	j __no_irq_handler
   4:	50a0006f          	j	50e <__no_irq_handler>
	//  2 : unmapped
	j __no_irq_handler
   8:	5060006f          	j	50e <__no_irq_handler>
	//  3 : machine software interrupt handler
	j handler_irq_software
   c:	2280106f          	j	1234 <handler_irq_software>
	//  4 : user timer interrupt
	j __no_irq_handler
  10:	4fe0006f          	j	50e <__no_irq_handler>
	//  5 : supervisor timer interrupt
	j __no_irq_handler
  14:	4fa0006f          	j	50e <__no_irq_handler>
	//  6 : unmapped
	j __no_irq_handler
  18:	4f60006f          	j	50e <__no_irq_handler>
	//  7 : machine timer interrupt handler
	j handler_irq_timer
  1c:	2480106f          	j	1264 <handler_irq_timer>
	//  8 : user external interrupt
	j __no_irq_handler
  20:	4ee0006f          	j	50e <__no_irq_handler>
	//  9 : supervisor external interrupt
	j __no_irq_handler
  24:	4ea0006f          	j	50e <__no_irq_handler>
	// 10 : unmapped
	j __no_irq_handler
  28:	4e60006f          	j	50e <__no_irq_handler>
	// 11 : machine external interrupt handler
	j handler_irq_external
  2c:	4690006f          	j	c94 <handler_irq_external>
	// 12 : unmapped
	j __no_irq_handler
  30:	4de0006f          	j	50e <__no_irq_handler>
	// 13 : unmapped
	j __no_irq_handler
  34:	4da0006f          	j	50e <__no_irq_handler>
	// 14 : unmapped
	j __no_irq_handler
  38:	4d60006f          	j	50e <__no_irq_handler>
	// 15 : unmapped
	j __no_irq_handler
  3c:	4d20006f          	j	50e <__no_irq_handler>
	// 16 : fast interrupt - timer_1
	j handler_irq_fast_timer_1
  40:	4b90006f          	j	cf8 <handler_irq_fast_timer_1>
	// 17 : fast interrupt - timer_2
	j handler_irq_fast_timer_2
  44:	5090006f          	j	d4c <handler_irq_fast_timer_2>
	// 18 : fast interrupt - timer_3
	j handler_irq_fast_timer_3
  48:	5590006f          	j	da0 <handler_irq_fast_timer_3>
	// 19 : fast interrupt - dma_done
	j handler_irq_fast_dma_done
  4c:	0c40106f          	j	1110 <handler_irq_fast_dma_done>
	// 20 : fast interrupt - spi
	j handler_irq_fast_spi
  50:	29d0006f          	j	aec <handler_irq_fast_spi>
	// 21 : fast interrupt - spi_flash
	j handler_irq_fast_spi_flash
  54:	3710006f          	j	bc4 <handler_irq_fast_spi_flash>
	// 22 : fast interrupt - gpio_0
	j handler_irq_fast_gpio_0
  58:	5f50006f          	j	e4c <handler_irq_fast_gpio_0>
	// 23 : fast interrupt - gpio_1
	j handler_irq_fast_gpio_1
  5c:	6490006f          	j	ea4 <handler_irq_fast_gpio_1>
	// 24 : fast interrupt - gpio_2
	j handler_irq_fast_gpio_2
  60:	69d0006f          	j	efc <handler_irq_fast_gpio_2>
	// 25 : fast interrupt - gpio_3
	j handler_irq_fast_gpio_3
  64:	6f10006f          	j	f54 <handler_irq_fast_gpio_3>
	// 26 : fast interrupt - gpio_4
	j handler_irq_fast_gpio_4
  68:	7450006f          	j	fac <handler_irq_fast_gpio_4>
	// 27 : fast interrupt - gpio_5
	j handler_irq_fast_gpio_5
  6c:	7990006f          	j	1004 <handler_irq_fast_gpio_5>
	// 28 : fast interrupt - gpio_6
	j handler_irq_fast_gpio_6
  70:	7f10006f          	j	1060 <handler_irq_fast_gpio_6>
	// 29 : fast interrupt - gpio_7
	j handler_irq_fast_gpio_7
  74:	0440106f          	j	10b8 <handler_irq_fast_gpio_7>
	// 30 : fast interrupt - dma_window
	j handler_irq_fast_dma_window
  78:	0f00106f          	j	1168 <handler_irq_fast_dma_window>
	// 31 : fast interrupt - external peripheral
	j handler_irq_fast_external_peripheral
  7c:	5790006f          	j	df4 <handler_irq_fast_external_peripheral>

Disassembly of section .init:

00000180 <_start>:

_start:
/* initialize global pointer */
.option push
.option norelax
1: auipc gp, %pcrel_hi(__global_pointer$)
 180:	0000c197          	auipc	gp,0xc
   addi  gp, gp, %pcrel_lo(1b)
 184:	8c418193          	addi	gp,gp,-1852 # ba44 <__global_pointer$>
.option pop

/* initialize stack pointer */
   la sp, _sp
 188:	0000c117          	auipc	sp,0xc
 18c:	46810113          	addi	sp,sp,1128 # c5f0 <_sp>

/* set the frequency */
   li a0, SOC_CTRL_START_ADDRESS
 190:	20000537          	lui	a0,0x20000
   li a2, REFERENCE_CLOCK_Hz
 194:	05f5e637          	lui	a2,0x5f5e
 198:	10060613          	addi	a2,a2,256 # 5f5e100 <_sp+0x5f51b10>
   sw a2, SOC_CTRL_SYSTEM_FREQUENCY_HZ_REG_OFFSET(a0)
 19c:	cd50                	sw	a2,28(a0)

0000019e <_init_bss>:

#endif

/* clear the bss segment */
_init_bss:
    la     a0, __bss_start
 19e:	0000b517          	auipc	a0,0xb
 1a2:	1f250513          	addi	a0,a0,498 # b390 <__stdio_exit_handler>
    la     a2, __bss_end
 1a6:	0000b617          	auipc	a2,0xb
 1aa:	43e60613          	addi	a2,a2,1086 # b5e4 <__BSS_END__>
    sub    a2, a2, a0
 1ae:	8e09                	sub	a2,a2,a0
    li     a1, 0
 1b0:	4581                	li	a1,0
    call   memset
 1b2:	472010ef          	jal	1624 <memset>
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
 1ca:	42c50513          	addi	a0,a0,1068 # 15f2 <__libc_fini_array>
    call atexit
 1ce:	12c010ef          	jal	12fa <atexit>
    call __libc_init_array
 1d2:	3ca010ef          	jal	159c <__libc_init_array>

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
 1e4:	0b0010ef          	jal	1294 <init>

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
     1f4:	6a878793          	addi	a5,a5,1704 # 16a8 <__call_exitprocs>
     1f8:	842a                	mv	s0,a0
     1fa:	c781                	beqz	a5,202 <exit+0x16>
     1fc:	4581                	li	a1,0
     1fe:	4aa010ef          	jal	16a8 <__call_exitprocs>
     202:	94c1a783          	lw	a5,-1716(gp) # b390 <__stdio_exit_handler>
     206:	c391                	beqz	a5,20a <exit+0x1e>
     208:	9782                	jalr	a5
     20a:	8522                	mv	a0,s0
     20c:	090010ef          	jal	129c <_exit>

00000210 <main>:
     210:	7149                	addi	sp,sp,-368
     212:	16112623          	sw	ra,364(sp)
    double delta2 = x - s->mean;
    s->M2 += delta * delta2;
}

int main(void)
{
     216:	16812423          	sw	s0,360(sp)
     21a:	16912223          	sw	s1,356(sp)
     21e:	17212023          	sw	s2,352(sp)
     222:	15312e23          	sw	s3,348(sp)
     226:	15412c23          	sw	s4,344(sp)
     22a:	15512a23          	sw	s5,340(sp)
     22e:	15612823          	sw	s6,336(sp)
     232:	15712623          	sw	s7,332(sp)
     236:	15812423          	sw	s8,328(sp)
     23a:	15912223          	sw	s9,324(sp)
     23e:	15a12023          	sw	s10,320(sp)
     242:	13b12e23          	sw	s11,316(sp)
    /* Prepare CSR cycle counter */
    CSR_CLEAR_BITS(CSR_REG_MCOUNTINHIBIT, 0x1); // enable cycle counting
     246:	4785                	li	a5,1
     248:	3207b073          	csrc	mcountinhibit,a5
        accumulators[c].M2 = 0.0;
    }

    /* Temporary variables */
    uint32_t total_cycles = 0;
    typeInf actionID = -1;
     24c:	57fd                	li	a5,-1
     24e:	de3e                	sw	a5,60(sp)
        accumulators[c].count = 0;
     250:	c082                	sw	zero,64(sp)
        accumulators[c].mean = 0.0;
     252:	c482                	sw	zero,72(sp)
     254:	c682                	sw	zero,76(sp)
        accumulators[c].M2 = 0.0;
     256:	c882                	sw	zero,80(sp)
     258:	ca82                	sw	zero,84(sp)
        accumulators[c].count = 0;
     25a:	cc82                	sw	zero,88(sp)
        accumulators[c].mean = 0.0;
     25c:	d082                	sw	zero,96(sp)
     25e:	d282                	sw	zero,100(sp)
        accumulators[c].M2 = 0.0;
     260:	d482                	sw	zero,104(sp)
     262:	d682                	sw	zero,108(sp)
        accumulators[c].count = 0;
     264:	d882                	sw	zero,112(sp)
        accumulators[c].mean = 0.0;
     266:	dc82                	sw	zero,120(sp)
     268:	de82                	sw	zero,124(sp)
        accumulators[c].M2 = 0.0;
     26a:	c102                	sw	zero,128(sp)
     26c:	c302                	sw	zero,132(sp)
        accumulators[c].count = 0;
     26e:	c502                	sw	zero,136(sp)
        accumulators[c].mean = 0.0;
     270:	c902                	sw	zero,144(sp)
     272:	cb02                	sw	zero,148(sp)
        accumulators[c].M2 = 0.0;
     274:	cd02                	sw	zero,152(sp)
     276:	cf02                	sw	zero,156(sp)
        accumulators[c].count = 0;
     278:	d102                	sw	zero,160(sp)
        accumulators[c].mean = 0.0;
     27a:	d502                	sw	zero,168(sp)
     27c:	d702                	sw	zero,172(sp)
        accumulators[c].M2 = 0.0;
     27e:	d902                	sw	zero,176(sp)
     280:	db02                	sw	zero,180(sp)
        accumulators[c].count = 0;
     282:	dd02                	sw	zero,184(sp)
        accumulators[c].mean = 0.0;
     284:	c182                	sw	zero,192(sp)
     286:	c382                	sw	zero,196(sp)
        accumulators[c].M2 = 0.0;
     288:	c582                	sw	zero,200(sp)
     28a:	c782                	sw	zero,204(sp)
        accumulators[c].count = 0;
     28c:	c982                	sw	zero,208(sp)
        accumulators[c].mean = 0.0;
     28e:	b6418b93          	addi	s7,gp,-1180 # b5a8 <in1_buf>
     292:	b7018793          	addi	a5,gp,-1168 # b5b4 <in2_buf>
     296:	cd82                	sw	zero,216(sp)
     298:	c83e                	sw	a5,16(sp)
     29a:	b7c18793          	addi	a5,gp,-1156 # b5c0 <in3_buf>
     29e:	6e2d                	lui	t3,0xb
        /* read cycles (64-bit if available in CSR_READ) */
        CSR_READ(CSR_REG_MCYCLE, &total_cycles);

        int cls = ids_graph_traversals[seed];
        if (cls < 0 || cls >= NB_CLASSES) {
            PRINTF("Seed %d has invalid class %d\n", seed, cls);
     2a0:	6729                	lui	a4,0xa
     2a2:	ca3e                	sw	a5,20(sp)
     2a4:	b8818793          	addi	a5,gp,-1144 # b5cc <in4_buf>
     2a8:	8e4e0993          	addi	s3,t3,-1820 # a8e4 <dataSourcesLE_0>
     2ac:	6ead                	lui	t4,0xb
     2ae:	d43e                	sw	a5,40(sp)
     2b0:	6fc70793          	addi	a5,a4,1788 # a6fc <__clz_tab+0x100>
        accumulators[c].mean = 0.0;
     2b4:	cf82                	sw	zero,220(sp)
        accumulators[c].M2 = 0.0;
     2b6:	d182                	sw	zero,224(sp)
     2b8:	d382                	sw	zero,228(sp)
        accumulators[c].count = 0;
     2ba:	d582                	sw	zero,232(sp)
        accumulators[c].mean = 0.0;
     2bc:	d982                	sw	zero,240(sp)
     2be:	db82                	sw	zero,244(sp)
        accumulators[c].M2 = 0.0;
     2c0:	dd82                	sw	zero,248(sp)
     2c2:	df82                	sw	zero,252(sp)
        accumulators[c].count = 0;
     2c4:	10012023          	sw	zero,256(sp)
        accumulators[c].mean = 0.0;
     2c8:	10012423          	sw	zero,264(sp)
     2cc:	10012623          	sw	zero,268(sp)
        accumulators[c].M2 = 0.0;
     2d0:	10012823          	sw	zero,272(sp)
     2d4:	10012a23          	sw	zero,276(sp)
        accumulators[c].count = 0;
     2d8:	10012c23          	sw	zero,280(sp)
        accumulators[c].mean = 0.0;
     2dc:	12012023          	sw	zero,288(sp)
     2e0:	12012223          	sw	zero,292(sp)
        accumulators[c].M2 = 0.0;
     2e4:	12012423          	sw	zero,296(sp)
     2e8:	12012623          	sw	zero,300(sp)
    for (int seed = 0; seed < NB_SEED; ++seed)
     2ec:	32098d13          	addi	s10,s3,800
     2f0:	7d098493          	addi	s1,s3,2000
     2f4:	8e4e8d93          	addi	s11,t4,-1820 # a8e4 <dataSourcesLE_0>
            PRINTF("Seed %d has invalid class %d\n", seed, cls);
     2f8:	d63e                	sw	a5,44(sp)
    for (int seed = 0; seed < NB_SEED; ++seed)
     2fa:	4401                	li	s0,0
    in4_buf[0] = dataSourcesLE_9[0];
     2fc:	08000b37          	lui	s6,0x8000
    in4_buf[5] = dataSourcesLE_14[0];
     300:	64098a93          	addi	s5,s3,1600
     304:	8c4e                	mv	s8,s3
     306:	4b098a13          	addi	s4,s3,1200
     30a:	19098c93          	addi	s9,s3,400
     30e:	a055                	j	3b2 <main+0x1a2>
            continue;
        }

        welford_add(&accumulators[cls], total_cycles);
     310:	2ab030ef          	jal	3dba <__floatunsidf>
    s->count++;
     314:	1a1c                	addi	a5,sp,304
     316:	21292933          	sh1add	s2,s2,s2
     31a:	20f96933          	sh3add	s2,s2,a5
     31e:	f1092983          	lw	s3,-240(s2)
    double delta = x - s->mean;
     322:	f1892703          	lw	a4,-232(s2)
     326:	f1c92783          	lw	a5,-228(s2)
    s->count++;
     32a:	0985                	addi	s3,s3,1
    double delta = x - s->mean;
     32c:	863a                	mv	a2,a4
     32e:	86be                	mv	a3,a5
    s->count++;
     330:	f1392823          	sw	s3,-240(s2)
    double delta = x - s->mean;
     334:	d03a                	sw	a4,32(sp)
     336:	d23e                	sw	a5,36(sp)
        welford_add(&accumulators[cls], total_cycles);
     338:	cc2a                	sw	a0,24(sp)
     33a:	ce2e                	sw	a1,28(sp)
    double delta = x - s->mean;
     33c:	342030ef          	jal	367e <__subdf3>
     340:	c42a                	sw	a0,8(sp)
    s->mean += delta / s->count;
     342:	854e                	mv	a0,s3
    double delta = x - s->mean;
     344:	c62e                	sw	a1,12(sp)
    s->mean += delta / s->count;
     346:	275030ef          	jal	3dba <__floatunsidf>
     34a:	862a                	mv	a2,a0
     34c:	86ae                	mv	a3,a1
     34e:	4522                	lw	a0,8(sp)
     350:	45b2                	lw	a1,12(sp)
     352:	119020ef          	jal	2c6a <__divdf3>
     356:	5702                	lw	a4,32(sp)
     358:	5792                	lw	a5,36(sp)
     35a:	863a                	mv	a2,a4
     35c:	86be                	mv	a3,a5
     35e:	37e020ef          	jal	26dc <__adddf3>
     362:	832a                	mv	t1,a0
     364:	83ae                	mv	t2,a1
    double delta2 = x - s->mean;
     366:	4562                	lw	a0,24(sp)
     368:	45f2                	lw	a1,28(sp)
     36a:	861a                	mv	a2,t1
     36c:	869e                	mv	a3,t2
    s->mean += delta / s->count;
     36e:	f0692c23          	sw	t1,-232(s2)
     372:	f0792e23          	sw	t2,-228(s2)
    double delta2 = x - s->mean;
     376:	308030ef          	jal	367e <__subdf3>
    s->M2 += delta * delta2;
     37a:	4622                	lw	a2,8(sp)
     37c:	46b2                	lw	a3,12(sp)
     37e:	6b7020ef          	jal	3234 <__muldf3>
     382:	862a                	mv	a2,a0
     384:	86ae                	mv	a3,a1
     386:	f2092503          	lw	a0,-224(s2)
     38a:	f2492583          	lw	a1,-220(s2)
     38e:	34e020ef          	jal	26dc <__adddf3>
     392:	f2a92023          	sw	a0,-224(s2)
     396:	f2b92223          	sw	a1,-220(s2)
    for (int seed = 0; seed < NB_SEED; ++seed)
     39a:	0405                	addi	s0,s0,1
     39c:	06400713          	li	a4,100
     3a0:	0c11                	addi	s8,s8,4
     3a2:	0c91                	addi	s9,s9,4
     3a4:	0d11                	addi	s10,s10,4
     3a6:	0d91                	addi	s11,s11,4
     3a8:	0a11                	addi	s4,s4,4
     3aa:	0a91                	addi	s5,s5,4
     3ac:	0491                	addi	s1,s1,4
     3ae:	0ae40563          	beq	s0,a4,458 <main+0x248>
    in1_buf[2] = dataSourcesLE_2[seed];
     3b2:	000d2703          	lw	a4,0(s10)
    in2_buf[1] = dataSourcesLE_4[0];
     3b6:	015a07b7          	lui	a5,0x15a0
     3ba:	00fba823          	sw	a5,16(s7)
    in1_buf[2] = dataSourcesLE_2[seed];
     3be:	00eba423          	sw	a4,8(s7)
    in3_buf[2] = dataSourcesLE_8[seed];
     3c2:	000aa703          	lw	a4,0(s5)
    in2_buf[2] = dataSourcesLE_5[0];
     3c6:	010b07b7          	lui	a5,0x10b0
     3ca:	00fbaa23          	sw	a5,20(s7)
    in4_buf[4] = dataSourcesLE_13[0];
     3ce:	020007b7          	lui	a5,0x2000
    in3_buf[2] = dataSourcesLE_8[seed];
     3d2:	02eba023          	sw	a4,32(s7)
    in4_buf[4] = dataSourcesLE_13[0];
     3d6:	02fbaa23          	sw	a5,52(s7)
    in2 = in2_buf;
     3da:	4742                	lw	a4,16(sp)
    in4_buf[5] = dataSourcesLE_14[0];
     3dc:	010007b7          	lui	a5,0x1000
     3e0:	02fbac23          	sw	a5,56(s7)
    in1 = in1_buf;
     3e4:	9771a623          	sw	s7,-1684(gp) # b3b0 <in1>
    in1_buf[0] = dataSourcesLE_0[seed];
     3e8:	000c2603          	lw	a2,0(s8)
    in1_buf[1] = dataSourcesLE_1[seed];
     3ec:	000ca683          	lw	a3,0(s9)
    in2 = in2_buf;
     3f0:	96e1a423          	sw	a4,-1688(gp) # b3ac <in2>
    in3 = in3_buf;
     3f4:	4752                	lw	a4,20(sp)
    in1_buf[0] = dataSourcesLE_0[seed];
     3f6:	00cba023          	sw	a2,0(s7)
    in3 = in3_buf;
     3fa:	96e1a223          	sw	a4,-1692(gp) # b3a8 <in3>
    in3_buf[0] = dataSourcesLE_6[seed];
     3fe:	000da603          	lw	a2,0(s11)
    in4 = in4_buf;
     402:	5722                	lw	a4,40(sp)
    in1_buf[1] = dataSourcesLE_1[seed];
     404:	00dba223          	sw	a3,4(s7)
    in3_buf[1] = dataSourcesLE_7[seed];
     408:	000a2683          	lw	a3,0(s4)
    in4 = in4_buf;
     40c:	96e1a023          	sw	a4,-1696(gp) # b3a4 <in4>
    in3_buf[0] = dataSourcesLE_6[seed];
     410:	00cbac23          	sw	a2,24(s7)
    in3_buf[1] = dataSourcesLE_7[seed];
     414:	00dbae23          	sw	a3,28(s7)
    in2_buf[0] = dataSourcesLE_3[0];
     418:	000ba623          	sw	zero,12(s7)
    in4_buf[0] = dataSourcesLE_9[0];
     41c:	036ba223          	sw	s6,36(s7)
    in4_buf[1] = dataSourcesLE_10[0];
     420:	036ba423          	sw	s6,40(s7)
    in4_buf[2] = dataSourcesLE_11[0];
     424:	036ba623          	sw	s6,44(s7)
    in4_buf[3] = dataSourcesLE_12[0];
     428:	036ba823          	sw	s6,48(s7)
        CSR_WRITE(CSR_REG_MCYCLE, 0);
     42c:	4701                	li	a4,0
     42e:	b0071073          	csrw	mcycle,a4
        inferenceTPG(&actionID, in1, in2, in3, in4);
     432:	5722                	lw	a4,40(sp)
     434:	46d2                	lw	a3,20(sp)
     436:	4642                	lw	a2,16(sp)
     438:	85de                	mv	a1,s7
     43a:	1868                	addi	a0,sp,60
     43c:	2b05                	jal	96c <inferenceTPG>
        CSR_READ(CSR_REG_MCYCLE, &total_cycles);
     43e:	b0002573          	csrr	a0,mcycle
        int cls = ids_graph_traversals[seed];
     442:	0004a903          	lw	s2,0(s1)
        if (cls < 0 || cls >= NB_CLASSES) {
     446:	4725                	li	a4,9
     448:	ed2774e3          	bgeu	a4,s2,310 <main+0x100>
            PRINTF("Seed %d has invalid class %d\n", seed, cls);
     44c:	5532                	lw	a0,44(sp)
     44e:	864a                	mv	a2,s2
     450:	85a2                	mv	a1,s0
     452:	6a0010ef          	jal	1af2 <iprintf>
            continue;
     456:	b791                	j	39a <main+0x18a>
    }

    /* Print per-class statistics */
    PRINTF("Class,Count,AvgCyclesPerClass,StddevCyclesPerClass\n");
     458:	6529                	lui	a0,0xa
     45a:	71c50513          	addi	a0,a0,1820 # a71c <__clz_tab+0x120>
    {
        if (accumulators[c].count == 0) continue;
        double mean = accumulators[c].mean;
        double variance = (accumulators[c].count > 1) ? (accumulators[c].M2 / (accumulators[c].count - 1)) : 0.0;
        double stddev = (variance > 0.0) ? sqrt(variance) : 0.0;
        PRINTF("%d,%u,%d,%d\n", c, accumulators[c].count, (int) mean, (int) stddev);
     45e:	6ca9                	lui	s9,0xa
    PRINTF("Class,Count,AvgCyclesPerClass,StddevCyclesPerClass\n");
     460:	756010ef          	jal	1bb6 <puts>
    for (int c = 0; c < NB_CLASSES; ++c)
     464:	0084                	addi	s1,sp,64
        PRINTF("%d,%u,%d,%d\n", c, accumulators[c].count, (int) mean, (int) stddev);
     466:	750c8c93          	addi	s9,s9,1872 # a750 <__clz_tab+0x154>
    for (int c = 0; c < NB_CLASSES; ++c)
     46a:	4901                	li	s2,0
        double variance = (accumulators[c].count > 1) ? (accumulators[c].M2 / (accumulators[c].count - 1)) : 0.0;
     46c:	4d05                	li	s10,1
    for (int c = 0; c < NB_CLASSES; ++c)
     46e:	4c29                	li	s8,10
        if (accumulators[c].count == 0) continue;
     470:	4080                	lw	s0,0(s1)
     472:	4981                	li	s3,0
        double variance = (accumulators[c].count > 1) ? (accumulators[c].M2 / (accumulators[c].count - 1)) : 0.0;
     474:	fff40513          	addi	a0,s0,-1
        if (accumulators[c].count == 0) continue;
     478:	c831                	beqz	s0,4cc <main+0x2bc>
        double mean = accumulators[c].mean;
     47a:	0084aa03          	lw	s4,8(s1)
     47e:	00c4aa83          	lw	s5,12(s1)
        double variance = (accumulators[c].count > 1) ? (accumulators[c].M2 / (accumulators[c].count - 1)) : 0.0;
     482:	03a40a63          	beq	s0,s10,4b6 <main+0x2a6>
     486:	135030ef          	jal	3dba <__floatunsidf>
     48a:	862a                	mv	a2,a0
     48c:	86ae                	mv	a3,a1
     48e:	4888                	lw	a0,16(s1)
     490:	48cc                	lw	a1,20(s1)
     492:	7d8020ef          	jal	2c6a <__divdf3>
        double stddev = (variance > 0.0) ? sqrt(variance) : 0.0;
     496:	4601                	li	a2,0
     498:	4681                	li	a3,0
        double variance = (accumulators[c].count > 1) ? (accumulators[c].M2 / (accumulators[c].count - 1)) : 0.0;
     49a:	8b2a                	mv	s6,a0
     49c:	8bae                	mv	s7,a1
        double stddev = (variance > 0.0) ? sqrt(variance) : 0.0;
     49e:	4e1020ef          	jal	317e <__gedf2>
     4a2:	87aa                	mv	a5,a0
     4a4:	85de                	mv	a1,s7
     4a6:	855a                	mv	a0,s6
     4a8:	00f05763          	blez	a5,4b6 <main+0x2a6>
     4ac:	7e1010ef          	jal	248c <sqrt>
        PRINTF("%d,%u,%d,%d\n", c, accumulators[c].count, (int) mean, (int) stddev);
     4b0:	0a9030ef          	jal	3d58 <__fixdfsi>
     4b4:	89aa                	mv	s3,a0
     4b6:	85d6                	mv	a1,s5
     4b8:	8552                	mv	a0,s4
     4ba:	09f030ef          	jal	3d58 <__fixdfsi>
     4be:	86aa                	mv	a3,a0
     4c0:	874e                	mv	a4,s3
     4c2:	8622                	mv	a2,s0
     4c4:	85ca                	mv	a1,s2
     4c6:	8566                	mv	a0,s9
     4c8:	62a010ef          	jal	1af2 <iprintf>
    for (int c = 0; c < NB_CLASSES; ++c)
     4cc:	0905                	addi	s2,s2,1
     4ce:	04e1                	addi	s1,s1,24
     4d0:	fb8910e3          	bne	s2,s8,470 <main+0x260>
    }

    return 0;
}
     4d4:	16c12083          	lw	ra,364(sp)
     4d8:	16812403          	lw	s0,360(sp)
     4dc:	16412483          	lw	s1,356(sp)
     4e0:	16012903          	lw	s2,352(sp)
     4e4:	15c12983          	lw	s3,348(sp)
     4e8:	15812a03          	lw	s4,344(sp)
     4ec:	15412a83          	lw	s5,340(sp)
     4f0:	15012b03          	lw	s6,336(sp)
     4f4:	14c12b83          	lw	s7,332(sp)
     4f8:	14812c03          	lw	s8,328(sp)
     4fc:	14412c83          	lw	s9,324(sp)
     500:	14012d03          	lw	s10,320(sp)
     504:	13c12d83          	lw	s11,316(sp)
     508:	4501                	li	a0,0
     50a:	6175                	addi	sp,sp,368
     50c:	8082                	ret

0000050e <__no_irq_handler>:
	This will not print an error message in case of not finding
	the proper handler to manage an interrupt.
	la a0, no_exception_handler_msg
	jal ra, puts
	*/
	j __no_irq_handler
     50e:	0000006f          	j	50e <__no_irq_handler>

00000512 <fic_irq_dma_window>:
/*                           EXPORTED FUNCTIONS                             */
/**                                                                        **/
/****************************************************************************/

void fic_irq_dma_window(void)
{
     512:	1101                	addi	sp,sp,-32
     514:	ce06                	sw	ra,28(sp)
     516:	cc22                	sw	s0,24(sp)
     518:	1000                	addi	s0,sp,32
     * Find out which channel raised the interrupt and call
     * either the weak implementation provided in this module,
     * or the non-weak implementation.
     */

    for (int i = 0; i < DMA_CH_NUM; i++)
     51a:	fe042623          	sw	zero,-20(s0)
     51e:	a815                	j	552 <fic_irq_dma_window+0x40>
    {
        if (dma_subsys_per[i].peri->WINDOW_IFR == 1)
     520:	97018693          	addi	a3,gp,-1680 # b3b4 <dma_subsys_per>
     524:	fec42703          	lw	a4,-20(s0)
     528:	87ba                	mv	a5,a4
     52a:	0786                	slli	a5,a5,0x1
     52c:	97ba                	add	a5,a5,a4
     52e:	078a                	slli	a5,a5,0x2
     530:	97b6                	add	a5,a5,a3
     532:	479c                	lw	a5,8(a5)
     534:	57b8                	lw	a4,104(a5)
     536:	4785                	li	a5,1
     538:	00f71863          	bne	a4,a5,548 <fic_irq_dma_window+0x36>
        {
            dma_intr_handler_window_done(i);
     53c:	fec42783          	lw	a5,-20(s0)
     540:	0ff7f793          	zext.b	a5,a5
     544:	853e                	mv	a0,a5
     546:	2071                	jal	5d2 <dma_intr_handler_trans_done>
    for (int i = 0; i < DMA_CH_NUM; i++)
     548:	fec42783          	lw	a5,-20(s0)
     54c:	0785                	addi	a5,a5,1 # 1000001 <_sp+0xff3a11>
     54e:	fef42623          	sw	a5,-20(s0)
     552:	fec42703          	lw	a4,-20(s0)
     556:	478d                	li	a5,3
     558:	fce7d4e3          	bge	a5,a4,520 <fic_irq_dma_window+0xe>
            #endif

            #endif
        }
    }
    return;
     55c:	0001                	nop
}
     55e:	40f2                	lw	ra,28(sp)
     560:	4462                	lw	s0,24(sp)
     562:	6105                	addi	sp,sp,32
     564:	8082                	ret

00000566 <fic_irq_dma_done>:

void fic_irq_dma_done(void)
{
     566:	1101                	addi	sp,sp,-32
     568:	ce06                	sw	ra,28(sp)
     56a:	cc22                	sw	s0,24(sp)
     56c:	1000                	addi	s0,sp,32
     * Find out which channel raised the interrupt and call
     * either the weak implementation provided in this module,
     * or the non-weak implementation.
     */
    
    for (int i = 0; i < DMA_CH_NUM; i++)
     56e:	fe042623          	sw	zero,-20(s0)
     572:	a0b1                	j	5be <fic_irq_dma_done+0x58>
    {
        if (dma_subsys_per[i].peri->TRANSACTION_IFR == 1)
     574:	97018693          	addi	a3,gp,-1680 # b3b4 <dma_subsys_per>
     578:	fec42703          	lw	a4,-20(s0)
     57c:	87ba                	mv	a5,a4
     57e:	0786                	slli	a5,a5,0x1
     580:	97ba                	add	a5,a5,a4
     582:	078a                	slli	a5,a5,0x2
     584:	97b6                	add	a5,a5,a3
     586:	479c                	lw	a5,8(a5)
     588:	53f8                	lw	a4,100(a5)
     58a:	4785                	li	a5,1
     58c:	02f71463          	bne	a4,a5,5b4 <fic_irq_dma_done+0x4e>
        {
            dma_subsys_per[i].intrFlag = 1;
     590:	97018693          	addi	a3,gp,-1680 # b3b4 <dma_subsys_per>
     594:	fec42703          	lw	a4,-20(s0)
     598:	87ba                	mv	a5,a4
     59a:	0786                	slli	a5,a5,0x1
     59c:	97ba                	add	a5,a5,a4
     59e:	078a                	slli	a5,a5,0x2
     5a0:	97b6                	add	a5,a5,a3
     5a2:	4705                	li	a4,1
     5a4:	00e78223          	sb	a4,4(a5)
            dma_intr_handler_trans_done(i);
     5a8:	fec42783          	lw	a5,-20(s0)
     5ac:	0ff7f793          	zext.b	a5,a5
     5b0:	853e                	mv	a0,a5
     5b2:	2005                	jal	5d2 <dma_intr_handler_trans_done>
    for (int i = 0; i < DMA_CH_NUM; i++)
     5b4:	fec42783          	lw	a5,-20(s0)
     5b8:	0785                	addi	a5,a5,1
     5ba:	fef42623          	sw	a5,-20(s0)
     5be:	fec42703          	lw	a4,-20(s0)
     5c2:	478d                	li	a5,3
     5c4:	fae7d8e3          	bge	a5,a4,574 <fic_irq_dma_done+0xe>
            #endif

            #endif
        }
    }
    return;
     5c8:	0001                	nop
}
     5ca:	40f2                	lw	ra,28(sp)
     5cc:	4462                	lw	s0,24(sp)
     5ce:	6105                	addi	sp,sp,32
     5d0:	8082                	ret

000005d2 <dma_intr_handler_trans_done>:
    dma_subsys_per[channel].peri->MODE = DMA_TRANS_MODE_SINGLE;
}


__attribute__((weak, optimize("O0"))) void dma_intr_handler_trans_done(uint8_t channel)
{
     5d2:	1101                	addi	sp,sp,-32
     5d4:	ce06                	sw	ra,28(sp)
     5d6:	cc22                	sw	s0,24(sp)
     5d8:	1000                	addi	s0,sp,32
     5da:	87aa                	mv	a5,a0
     5dc:	fef407a3          	sb	a5,-17(s0)
     * This is a weak implementation.
     * Create your own function called
     * void dma_intr_handler_trans_done()
     * to override this one.
     */
}
     5e0:	0001                	nop
     5e2:	40f2                	lw	ra,28(sp)
     5e4:	4462                	lw	s0,24(sp)
     5e6:	6105                	addi	sp,sp,32
     5e8:	8082                	ret

000005ea <fic_irq_timer_1>:
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    return kFastIntrCtrlOk_e;
}

__attribute__((weak, optimize("O0"))) void fic_irq_timer_1(void)
{
     5ea:	1141                	addi	sp,sp,-16
     5ec:	c606                	sw	ra,12(sp)
     5ee:	c422                	sw	s0,8(sp)
     5f0:	0800                	addi	s0,sp,16
    /* Users should implement their non-weak version */
}
     5f2:	0001                	nop
     5f4:	40b2                	lw	ra,12(sp)
     5f6:	4422                	lw	s0,8(sp)
     5f8:	0141                	addi	sp,sp,16
     5fa:	8082                	ret

000005fc <_write>:
    return -1;
}

int _write(int file, const void *ptr, int len)
{
    if (file != STDOUT_FILENO) {
     5fc:	4785                	li	a5,1
     5fe:	04f51c63          	bne	a0,a5,656 <_write+0x5a>
 * @param offset the offset to read at, in bytes.
 * @return the read value.
 */
MMIO_WARN_UNUSED_RESULT
static inline uint32_t mmio_region_read32(mmio_region_t base, ptrdiff_t offset) {
  return ((volatile uint32_t *)base.base)[offset / sizeof(uint32_t)];
     602:	200007b7          	lui	a5,0x20000
     606:	4fdc                	lw	a5,28(a5)
system_error_t uart_init(const uart_t *uart) {
  if (uart == NULL) {
    return kErrorUartInvalidArgument;
  }

  if (uart->baudrate == 0 || uart->clk_freq_hz == 0) {
     608:	c7b9                	beqz	a5,656 <_write+0x5a>
 * @param offset the offset to write at, in bytes.
 * @param value the value to write.
 */
static inline void mmio_region_write32(mmio_region_t base, ptrdiff_t offset,
                                uint32_t value) {
  ((volatile uint32_t *)base.base)[offset / sizeof(uint32_t)] = value;
     60a:	30080737          	lui	a4,0x30080
     60e:	00072623          	sw	zero,12(a4) # 3008000c <_sp+0x30073a1c>
     612:	478d                	li	a5,3
     614:	cf5c                	sw	a5,28(a4)
     616:	02072223          	sw	zero,36(a4)
     61a:	02072623          	sw	zero,44(a4)
     61e:	00072223          	sw	zero,4(a4)
     622:	56fd                	li	a3,-1
     624:	0a7c07b7          	lui	a5,0xa7c0
     628:	c314                	sw	a3,0(a4)
     62a:	078d                	addi	a5,a5,3 # a7c0003 <_sp+0xa7b3a13>
     62c:	c75c                	sw	a5,12(a4)
     62e:	00072223          	sw	zero,4(a4)
/**
 * Write `len` bytes to the UART TX FIFO.
 */
size_t uart_write(const uart_t *uart, const uint8_t *data, size_t len) {
  size_t total = len;
  while (len) {
     632:	c205                	beqz	a2,652 <_write+0x56>
     634:	00c58833          	add	a6,a1,a2
    uart_putchar(uart, *data);
     638:	0005c683          	lbu	a3,0(a1)
  return ((volatile uint32_t *)base.base)[offset / sizeof(uint32_t)];
     63c:	4b1c                	lw	a5,16(a4)
  while (uart_tx_full(uart)) {
     63e:	8b85                	andi	a5,a5,1
     640:	fff5                	bnez	a5,63c <_write+0x40>
  ((volatile uint32_t *)base.base)[offset / sizeof(uint32_t)] = value;
     642:	cf14                	sw	a3,24(a4)
  return ((volatile uint32_t *)base.base)[offset / sizeof(uint32_t)];
     644:	4b1c                	lw	a5,16(a4)
 * @return Zero-extended `field` from `bitfield`.
 */
BITFIELD_WARN_UNUSED_RESULT
static inline uint32_t bitfield_field32_read(uint32_t bitfield,
                                      bitfield_field32_t field) {
  return (bitfield >> field.index) & field.mask;
     646:	838d                	srli	a5,a5,0x3
  while (!uart_tx_idle(uart)) {
     648:	8b85                	andi	a5,a5,1
     64a:	dfed                	beqz	a5,644 <_write+0x48>
    data++;
     64c:	0585                	addi	a1,a1,1
  while (len) {
     64e:	feb815e3          	bne	a6,a1,638 <_write+0x3c>
        errno = ENOSYS;
        return -1;
    }
    return uart_write(&uart,(uint8_t *)ptr,len);

}
     652:	8532                	mv	a0,a2
     654:	8082                	ret
        errno = ENOSYS;
     656:	05800713          	li	a4,88
        return -1;
     65a:	567d                	li	a2,-1
        errno = ENOSYS;
     65c:	94e1a823          	sw	a4,-1712(gp) # b394 <errno>
}
     660:	8532                	mv	a0,a2
     662:	8082                	ret

00000664 <spi_event_handler>:
    peri->txn       = (spi_transaction_t) {0};
    peri->callbacks = NULL_CALLBACKS;
}

void spi_event_handler(spi_peripheral_t* peri, spi_event_e events) 
{
     664:	1101                	addi	sp,sp,-32
     666:	ce06                	sw	ra,28(sp)
    // Ready means it is ready to accept new command segments. So we have two
    // possibilities if the device is ready:
    //  1) It is ready but not idle
    //  2) It is ready and idle
    if (events & SPI_EVENT_READY) 
     668:	0105f693          	andi	a3,a1,16
{
     66c:	872e                	mv	a4,a1
     66e:	87aa                	mv	a5,a0
    if (events & SPI_EVENT_READY) 
     670:	ca99                	beqz	a3,686 <spi_event_handler+0x22>
    {
        // If SPI is ready and there are still commands to execute, issue next command
        if (peri->txn.segments != NULL && peri->scnt < peri->txn.seglen) 
     672:	4950                	lw	a2,20(a0)
     674:	c611                	beqz	a2,680 <spi_event_handler+0x1c>
     676:	554c                	lw	a1,44(a0)
     678:	01854683          	lbu	a3,24(a0)
     67c:	14d5e463          	bltu	a1,a3,7c4 <spi_event_handler+0x160>
        {
            spi_issue_next_seg(peri);
        }
        // If no more commands and SPI is idle, it means the transaction is over
        else if (events & SPI_EVENT_IDLE) 
     680:	02077693          	andi	a3,a4,32
     684:	e6cd                	bnez	a3,72e <spi_event_handler+0xca>
            // Reset all transaction related variables
            spi_reset_transaction(peri);
            return;
        }
    }
    if (events & SPI_EVENT_TXWM)
     686:	00877693          	andi	a3,a4,8
     68a:	ca81                	beqz	a3,69a <spi_event_handler+0x36>
    if (peri->txn.txbuffer != NULL && peri->txcnt < peri->txn.txlen) {
     68c:	4fc8                	lw	a0,28(a5)
     68e:	c511                	beqz	a0,69a <spi_event_handler+0x36>
     690:	5b8c                	lw	a1,48(a5)
     692:	0207a883          	lw	a7,32(a5)
     696:	0115ee63          	bltu	a1,a7,6b2 <spi_event_handler+0x4e>
        {
            peri->callbacks.txwm_cb(peri->txn.txbuffer, peri->txcnt, 
                                    peri->txn.rxbuffer, peri->rxcnt);
        }
    }
    if (events & SPI_EVENT_RXWM)
     69a:	8b11                	andi	a4,a4,4
     69c:	cb01                	beqz	a4,6ac <spi_event_handler+0x48>
    if (peri->txn.rxbuffer != NULL && peri->rxcnt < peri->txn.rxlen) {
     69e:	53d0                	lw	a2,36(a5)
     6a0:	c611                	beqz	a2,6ac <spi_event_handler+0x48>
     6a2:	5bd4                	lw	a3,52(a5)
     6a4:	578c                	lw	a1,40(a5)
     6a6:	8736                	mv	a4,a3
     6a8:	04b6e863          	bltu	a3,a1,6f8 <spi_event_handler+0x94>
        {
            peri->callbacks.rxwm_cb(peri->txn.txbuffer, peri->txcnt, 
                                    peri->txn.rxbuffer, peri->rxcnt);
        }
    }
}
     6ac:	40f2                	lw	ra,28(sp)
     6ae:	6105                	addi	sp,sp,32
     6b0:	8082                	ret
            && !spi_write_word(peri->instance, peri->txn.txbuffer[peri->txcnt])
     6b2:	0007a803          	lw	a6,0(a5)
     6b6:	02080563          	beqz	a6,6e0 <spi_event_handler+0x7c>
     6ba:	20a5c633          	sh2add	a2,a1,a0

spi_return_flags_e spi_write_word(spi_host_t* spi, uint32_t wdata)
{
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
    // Check we're not overflowing
    if (spi_get_tx_queue_depth(spi) >= SPI_HOST_PARAM_TX_DEPTH) 
     6be:	04700313          	li	t1,71
     6c2:	a809                	j	6d4 <spi_event_handler+0x70>
     6c4:	4214                	lw	a3,0(a2)
        ) peri->txcnt++; // Keep track of counter
     6c6:	0585                	addi	a1,a1,1
            && !spi_write_word(peri->instance, peri->txn.txbuffer[peri->txcnt])
     6c8:	0611                	addi	a2,a2,4
        return SPI_FLAG_TX_QUEUE_FULL;
    SPI_HW(spi)->TXDATA = wdata;
     6ca:	02d82623          	sw	a3,44(a6)
        ) peri->txcnt++; // Keep track of counter
     6ce:	db8c                	sw	a1,48(a5)
            && !spi_write_word(peri->instance, peri->txn.txbuffer[peri->txcnt])
     6d0:	00b88863          	beq	a7,a1,6e0 <spi_event_handler+0x7c>
 */
static inline __attribute__((always_inline)) 
const volatile spi_status_t spi_get_status(spi_host_t* spi)
{
    spi_status_t status;
    status.value = SPI_HW(spi)->STATUS; // Assuming SPI_HW(spi)->STATUS returns a uint32_t value representing the status
     6d4:	01482683          	lw	a3,20(a6)
    if (spi_get_tx_queue_depth(spi) >= SPI_HOST_PARAM_TX_DEPTH) 
     6d8:	0ff6f693          	zext.b	a3,a3
     6dc:	fed374e3          	bgeu	t1,a3,6c4 <spi_event_handler+0x60>
        if (spi_fill_tx(peri) && peri->callbacks.txwm_cb != NULL)
     6e0:	03c7a803          	lw	a6,60(a5)
     6e4:	fa080be3          	beqz	a6,69a <spi_event_handler+0x36>
            peri->callbacks.txwm_cb(peri->txn.txbuffer, peri->txcnt, 
     6e8:	5bd4                	lw	a3,52(a5)
     6ea:	53d0                	lw	a2,36(a5)
     6ec:	c63a                	sw	a4,12(sp)
     6ee:	c43e                	sw	a5,8(sp)
     6f0:	9802                	jalr	a6
     6f2:	4732                	lw	a4,12(sp)
     6f4:	47a2                	lw	a5,8(sp)
     6f6:	b755                	j	69a <spi_event_handler+0x36>
            && !spi_read_word(peri->instance, &peri->txn.rxbuffer[peri->rxcnt])
     6f8:	4388                	lw	a0,0(a5)
     6fa:	ed01                	bnez	a0,712 <spi_event_handler+0xae>
     6fc:	a015                	j	720 <spi_event_handler+0xbc>
spi_return_flags_e spi_read_word(spi_host_t* spi, uint32_t* dst)
{
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
    // Check we're not underflowing
    if (spi_get_rx_queue_depth(spi) == 0) return SPI_FLAG_RX_QUEUE_EMPTY;
    *dst = SPI_HW(spi)->RXDATA;
     6fe:	5514                	lw	a3,40(a0)
     700:	c314                	sw	a3,0(a4)
        ) peri->rxcnt++; // Keep track of counter
     702:	5bd4                	lw	a3,52(a5)
            && !spi_read_word(peri->instance, &peri->txn.rxbuffer[peri->rxcnt])
     704:	578c                	lw	a1,40(a5)
        ) peri->rxcnt++; // Keep track of counter
     706:	00168713          	addi	a4,a3,1
     70a:	dbd8                	sw	a4,52(a5)
     70c:	86ba                	mv	a3,a4
            && !spi_read_word(peri->instance, &peri->txn.rxbuffer[peri->rxcnt])
     70e:	00b77963          	bgeu	a4,a1,720 <spi_event_handler+0xbc>
     712:	494c                	lw	a1,20(a0)
     714:	20c74733          	sh2add	a4,a4,a2
    if (spi_get_rx_queue_depth(spi) == 0) return SPI_FLAG_RX_QUEUE_EMPTY;
     718:	81a1                	srli	a1,a1,0x8
     71a:	0ff5f593          	zext.b	a1,a1
     71e:	f1e5                	bnez	a1,6fe <spi_event_handler+0x9a>
        if (spi_empty_rx(peri) && peri->callbacks.rxwm_cb != NULL)
     720:	43b8                	lw	a4,64(a5)
     722:	d749                	beqz	a4,6ac <spi_event_handler+0x48>
}
     724:	40f2                	lw	ra,28(sp)
            peri->callbacks.rxwm_cb(peri->txn.txbuffer, peri->txcnt, 
     726:	5b8c                	lw	a1,48(a5)
     728:	4fc8                	lw	a0,28(a5)
}
     72a:	6105                	addi	sp,sp,32
            peri->callbacks.rxwm_cb(peri->txn.txbuffer, peri->txcnt, 
     72c:	8702                	jr	a4
            spi_set_events_enabled(peri->instance, SPI_EVENT_ALL, false);
     72e:	438c                	lw	a1,0(a5)
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
     730:	10058263          	beqz	a1,834 <__heap_size+0x34>
    else        SPI_HW(spi)->EVENT_ENABLE &= ~events;
     734:	5d98                	lw	a4,56(a1)
    if (peri->txn.rxbuffer != NULL && peri->rxcnt < peri->txn.rxlen) {
     736:	53d0                	lw	a2,36(a5)
     738:	fc077713          	andi	a4,a4,-64
     73c:	dd98                	sw	a4,56(a1)
}

spi_return_flags_e spi_enable_evt_intr(spi_host_t* spi, bool enable)
{
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
    SPI_HW(spi)->INTR_ENABLE = bitfield_write(SPI_HW(spi)->INTR_ENABLE, BIT_MASK_1, 
     73e:	41d8                	lw	a4,4(a1)
static inline uint32_t bitfield_write(uint32_t bitfield,
                                       uint32_t mask, 
                                       uint32_t index,
                                       uint32_t value) 
{
  bitfield &= ~(mask << index);
     740:	9b75                	andi	a4,a4,-3
     742:	c1d8                	sw	a4,4(a1)
     744:	ca1d                	beqz	a2,77a <spi_event_handler+0x116>
     746:	5bd8                	lw	a4,52(a5)
     748:	5794                	lw	a3,40(a5)
     74a:	02d77863          	bgeu	a4,a3,77a <spi_event_handler+0x116>
     74e:	49d4                	lw	a3,20(a1)
    if (spi_get_rx_queue_depth(spi) == 0) return SPI_FLAG_RX_QUEUE_EMPTY;
     750:	82a1                	srli	a3,a3,0x8
     752:	0ff6f693          	zext.b	a3,a3
     756:	c295                	beqz	a3,77a <spi_event_handler+0x116>
            && !spi_read_word(peri->instance, &peri->txn.rxbuffer[peri->rxcnt])
     758:	20c74733          	sh2add	a4,a4,a2
    *dst = SPI_HW(spi)->RXDATA;
     75c:	5594                	lw	a3,40(a1)
     75e:	c314                	sw	a3,0(a4)
        ) peri->rxcnt++; // Keep track of counter
     760:	5bd8                	lw	a4,52(a5)
            && !spi_read_word(peri->instance, &peri->txn.rxbuffer[peri->rxcnt])
     762:	5794                	lw	a3,40(a5)
        ) peri->rxcnt++; // Keep track of counter
     764:	0705                	addi	a4,a4,1
     766:	dbd8                	sw	a4,52(a5)
            && !spi_read_word(peri->instance, &peri->txn.rxbuffer[peri->rxcnt])
     768:	00d77963          	bgeu	a4,a3,77a <spi_event_handler+0x116>
     76c:	49d4                	lw	a3,20(a1)
     76e:	20c74733          	sh2add	a4,a4,a2
    if (spi_get_rx_queue_depth(spi) == 0) return SPI_FLAG_RX_QUEUE_EMPTY;
     772:	82a1                	srli	a3,a3,0x8
     774:	0ff6f693          	zext.b	a3,a3
     778:	f2f5                	bnez	a3,75c <spi_event_handler+0xf8>
            if (peri->callbacks.done_cb != NULL) 
     77a:	5f98                	lw	a4,56(a5)
            peri->state = SPI_STATE_DONE;
     77c:	4691                	li	a3,4
     77e:	cb94                	sw	a3,16(a5)
            if (peri->callbacks.done_cb != NULL) 
     780:	c719                	beqz	a4,78e <spi_event_handler+0x12a>
                peri->callbacks.done_cb(peri->txn.txbuffer, peri->txcnt, 
     782:	5bd4                	lw	a3,52(a5)
     784:	5b8c                	lw	a1,48(a5)
     786:	4fc8                	lw	a0,28(a5)
     788:	c43e                	sw	a5,8(sp)
     78a:	9702                	jalr	a4
     78c:	47a2                	lw	a5,8(sp)
    peri->scnt      = 0;
     78e:	0207a623          	sw	zero,44(a5)
    peri->txcnt     = 0;
     792:	0207a823          	sw	zero,48(a5)
    peri->rxcnt     = 0;
     796:	0207aa23          	sw	zero,52(a5)
    peri->txn       = (spi_transaction_t) {0};
     79a:	0007aa23          	sw	zero,20(a5)
     79e:	0007ac23          	sw	zero,24(a5)
     7a2:	0007ae23          	sw	zero,28(a5)
     7a6:	0207a023          	sw	zero,32(a5)
     7aa:	0207a223          	sw	zero,36(a5)
     7ae:	0207a423          	sw	zero,40(a5)
    peri->callbacks = NULL_CALLBACKS;
     7b2:	0207ac23          	sw	zero,56(a5)
     7b6:	0207ae23          	sw	zero,60(a5)
     7ba:	0407a023          	sw	zero,64(a5)
     7be:	0407a223          	sw	zero,68(a5)
            return;
     7c2:	b5ed                	j	6ac <spi_event_handler+0x48>
    const spi_segment_t seg = peri->txn.segments[peri->scnt];
     7c4:	20c5c633          	sh2add	a2,a1,a2
     7c8:	4210                	lw	a2,0(a2)
    spi_set_command(peri->instance, cmd_reg);
     7ca:	00052303          	lw	t1,0(a0)
    peri->scnt++;
     7ce:	0585                	addi	a1,a1,1
    const spi_segment_t seg = peri->txn.segments[peri->scnt];
     7d0:	010008b7          	lui	a7,0x1000
    peri->scnt++;
     7d4:	d54c                	sw	a1,44(a0)
    const spi_segment_t seg = peri->txn.segments[peri->scnt];
     7d6:	01865813          	srli	a6,a2,0x18
     7da:	18fd                	addi	a7,a7,-1 # ffffff <_sp+0xff3a0f>
     7dc:	00f87813          	andi	a6,a6,15
     7e0:	01167533          	and	a0,a2,a7
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
     7e4:	ea0301e3          	beqz	t1,686 <spi_event_handler+0x22>
        .csaat     = peri->txn.seglen == peri->scnt ? false : true,
     7e8:	8e8d                	sub	a3,a3,a1
  return (bitfield >> index) & mask;
     7ea:	00285613          	srli	a2,a6,0x2
                             SPI_HOST_COMMAND_LEN_OFFSET, command.len);
    cmd_reg = bitfield_write(cmd_reg, BIT_MASK_1, 
                             SPI_HOST_COMMAND_CSAAT_BIT, command.csaat);
    cmd_reg = bitfield_write(cmd_reg, SPI_HOST_COMMAND_SPEED_MASK, 
                             SPI_HOST_COMMAND_SPEED_OFFSET, command.speed);
    cmd_reg = bitfield_write(cmd_reg, SPI_HOST_COMMAND_DIRECTION_MASK, 
     7ee:	00387813          	andi	a6,a6,3
     7f2:	00d036b3          	snez	a3,a3
  bitfield |= (value & mask) << index;
     7f6:	0666                	slli	a2,a2,0x19
     7f8:	086e                	slli	a6,a6,0x1b
     7fa:	01066633          	or	a2,a2,a6
     7fe:	06e2                	slli	a3,a3,0x18
        .len       = seg.len - 1, // -1 because of SPI Host IP specifications
     800:	157d                	addi	a0,a0,-1
     802:	8ed1                	or	a3,a3,a2
    cmd_reg = bitfield_write(cmd_reg, SPI_HOST_COMMAND_LEN_MASK, 
     804:	01157533          	and	a0,a0,a7
     808:	8ec9                	or	a3,a3,a0
  return (bitfield >> index) & mask;
     80a:	0196d613          	srli	a2,a3,0x19
     80e:	8a0d                	andi	a2,a2,3
    if (speed > SPI_SPEED_QUAD || direction > SPI_DIR_BIDIR || 
     810:	458d                	li	a1,3
     812:	00b60e63          	beq	a2,a1,82e <__heap_size+0x2e>
     816:	01b6d593          	srli	a1,a3,0x1b
       (direction == SPI_DIR_BIDIR && speed != SPI_SPEED_STANDARD))
     81a:	15f5                	addi	a1,a1,-3
    if (speed > SPI_SPEED_QUAD || direction > SPI_DIR_BIDIR || 
     81c:	e191                	bnez	a1,820 <__heap_size+0x20>
     81e:	ea01                	bnez	a2,82e <__heap_size+0x2e>
    status.value = SPI_HW(spi)->STATUS; // Assuming SPI_HW(spi)->STATUS returns a uint32_t value representing the status
     820:	01432603          	lw	a2,20(t1)
    return spi_get_status(spi).ready ? SPI_TRISTATE_TRUE : SPI_TRISTATE_FALSE;
     824:	e60651e3          	bgez	a2,686 <spi_event_handler+0x22>
    SPI_HW(spi)->COMMAND = cmd_reg;
     828:	02d32223          	sw	a3,36(t1)
    return SPI_FLAG_OK;
     82c:	bda9                	j	686 <spi_event_handler+0x22>
    status.value = SPI_HW(spi)->STATUS; // Assuming SPI_HW(spi)->STATUS returns a uint32_t value representing the status
     82e:	01432683          	lw	a3,20(t1)
     832:	bd91                	j	686 <spi_event_handler+0x22>
    if (peri->txn.rxbuffer != NULL && peri->rxcnt < peri->txn.rxlen) {
     834:	53d0                	lw	a2,36(a5)
     836:	b791                	j	77a <spi_event_handler+0x116>

00000838 <spi_error_handler.isra.0>:

void spi_error_handler(spi_peripheral_t* peri, spi_error_e error) 
{
    // Disable event interrupts
    spi_set_events_enabled(peri->instance, SPI_EVENT_ALL, false);
     838:	4114                	lw	a3,0(a0)
void spi_error_handler(spi_peripheral_t* peri, spi_error_e error) 
     83a:	1101                	addi	sp,sp,-32
     83c:	cc26                	sw	s1,24(sp)
     83e:	ce06                	sw	ra,28(sp)
     840:	84aa                	mv	s1,a0
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
     842:	ca81                	beqz	a3,852 <spi_error_handler.isra.0+0x1a>
    else        SPI_HW(spi)->EVENT_ENABLE &= ~events;
     844:	5e9c                	lw	a5,56(a3)
     846:	fc07f793          	andi	a5,a5,-64
     84a:	de9c                	sw	a5,56(a3)
    SPI_HW(spi)->INTR_ENABLE = bitfield_write(SPI_HW(spi)->INTR_ENABLE, BIT_MASK_1, 
     84c:	42dc                	lw	a5,4(a3)
  bitfield &= ~(mask << index);
     84e:	9bf5                	andi	a5,a5,-3
     850:	c2dc                	sw	a5,4(a3)
    spi_enable_evt_intr   (peri->instance, false);
    // If there is a callback defined invoke it
    if (peri->callbacks.error_cb != NULL) 
     852:	40fc                	lw	a5,68(s1)
     854:	c799                	beqz	a5,862 <spi_error_handler.isra.0+0x2a>
    {
        peri->callbacks.error_cb(peri->txn.txbuffer, peri->txcnt, 
     856:	58d4                	lw	a3,52(s1)
     858:	50d0                	lw	a2,36(s1)
     85a:	588c                	lw	a1,48(s1)
     85c:	4cc8                	lw	a0,28(s1)
     85e:	9782                	jalr	a5
    spi_sw_reset(peri->instance);
     860:	4094                	lw	a3,0(s1)
    peri->scnt      = 0;
     862:	0204a623          	sw	zero,44(s1)
    peri->txcnt     = 0;
     866:	0204a823          	sw	zero,48(s1)
    peri->rxcnt     = 0;
     86a:	0204aa23          	sw	zero,52(s1)
    peri->txn       = (spi_transaction_t) {0};
     86e:	0004aa23          	sw	zero,20(s1)
     872:	0004ac23          	sw	zero,24(s1)
     876:	0004ae23          	sw	zero,28(s1)
     87a:	0204a023          	sw	zero,32(s1)
     87e:	0204a223          	sw	zero,36(s1)
     882:	0204a423          	sw	zero,40(s1)
    peri->callbacks = NULL_CALLBACKS;
     886:	0204ac23          	sw	zero,56(s1)
     88a:	0204ae23          	sw	zero,60(s1)
     88e:	0404a023          	sw	zero,64(s1)
     892:	0404a223          	sw	zero,68(s1)
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
     896:	c6c1                	beqz	a3,91e <spi_error_handler.isra.0+0xe6>
    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, BIT_MASK_1, 
     898:	4a9c                	lw	a5,16(a3)
  bitfield |= (value & mask) << index;
     89a:	40000737          	lui	a4,0x40000
     89e:	8fd9                	or	a5,a5,a4
     8a0:	ca9c                	sw	a5,16(a3)
     8a2:	4adc                	lw	a5,20(a3)
     8a4:	c63e                	sw	a5,12(sp)
    while (status.active || status.txqd || status.rxqd);
     8a6:	47b2                	lw	a5,12(sp)
     8a8:	00179713          	slli	a4,a5,0x1
     8ac:	fe074de3          	bltz	a4,8a6 <spi_error_handler.isra.0+0x6e>
     8b0:	00c14783          	lbu	a5,12(sp)
     8b4:	fbed                	bnez	a5,8a6 <spi_error_handler.isra.0+0x6e>
     8b6:	00d14783          	lbu	a5,13(sp)
     8ba:	f7f5                	bnez	a5,8a6 <spi_error_handler.isra.0+0x6e>
    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, BIT_MASK_1, 
     8bc:	4a9c                	lw	a5,16(a3)
  bitfield &= ~(mask << index);
     8be:	c0000737          	lui	a4,0xc0000
     8c2:	177d                	addi	a4,a4,-1 # bfffffff <_sp+0xbfff3a0f>
     8c4:	8ff9                	and	a5,a5,a4
     8c6:	ca9c                	sw	a5,16(a3)
    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, BIT_MASK_1, 
     8c8:	4a9c                	lw	a5,16(a3)
  bitfield |= (value & mask) << index;
     8ca:	80000637          	lui	a2,0x80000
     8ce:	20000737          	lui	a4,0x20000
     8d2:	8fd1                	or	a5,a5,a2
     8d4:	ca9c                	sw	a5,16(a3)
}

spi_return_flags_e spi_output_enable(spi_host_t* spi, bool enable)
{
    SPI_NULL_CHECK(spi, SPI_FLAG_NULL_PTR)
    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, BIT_MASK_1, 
     8d6:	4a9c                	lw	a5,16(a3)
    if (watermark > SPI_HOST_PARAM_TX_DEPTH) return SPI_FLAG_WATERMARK_EXCEEDS;
     8d8:	04800613          	li	a2,72
     8dc:	8fd9                	or	a5,a5,a4
    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, BIT_MASK_1, 
     8de:	ca9c                	sw	a5,16(a3)
    if (enable) SPI_HW(spi)->ERROR_ENABLE |= errors;
     8e0:	5a9c                	lw	a5,48(a3)
     8e2:	01f7e793          	ori	a5,a5,31
     8e6:	da9c                	sw	a5,48(a3)
    SPI_HW(spi)->INTR_ENABLE = bitfield_write(SPI_HW(spi)->INTR_ENABLE, BIT_MASK_1, 
     8e8:	42dc                	lw	a5,4(a3)
     8ea:	0017e793          	ori	a5,a5,1
     8ee:	c2dc                	sw	a5,4(a3)
    spi_set_tx_watermark(peri->instance, peri->txwm);
     8f0:	0044c783          	lbu	a5,4(s1)
    spi_set_rx_watermark(peri->instance, peri->rxwm);
     8f4:	0054c703          	lbu	a4,5(s1)
    if (watermark > SPI_HOST_PARAM_TX_DEPTH) return SPI_FLAG_WATERMARK_EXCEEDS;
     8f8:	00f66a63          	bltu	a2,a5,90c <spi_error_handler.isra.0+0xd4>
    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, 
     8fc:	4a90                	lw	a2,16(a3)
  bitfield &= ~(mask << index);
     8fe:	75c1                	lui	a1,0xffff0
     900:	0ff58593          	addi	a1,a1,255 # ffff00ff <_sp+0xfffe3b0f>
  bitfield |= (value & mask) << index;
     904:	07a2                	slli	a5,a5,0x8
  bitfield &= ~(mask << index);
     906:	8e6d                	and	a2,a2,a1
  bitfield |= (value & mask) << index;
     908:	8fd1                	or	a5,a5,a2
     90a:	ca9c                	sw	a5,16(a3)
    if (watermark > SPI_HOST_PARAM_RX_DEPTH) return SPI_FLAG_WATERMARK_EXCEEDS;
     90c:	04000793          	li	a5,64
     910:	00e7e763          	bltu	a5,a4,91e <spi_error_handler.isra.0+0xe6>
    SPI_HW(spi)->CONTROL = bitfield_write(SPI_HW(spi)->CONTROL, 
     914:	4a9c                	lw	a5,16(a3)
  bitfield &= ~(mask << index);
     916:	f007f793          	andi	a5,a5,-256
  bitfield |= (value & mask) << index;
     91a:	8f5d                	or	a4,a4,a5
     91c:	ca98                	sw	a4,16(a3)
                                 peri->txn.rxbuffer, peri->rxcnt);
    }
    spi_reset_peri(peri);
    // Set the state to error
    peri->state = SPI_STATE_ERROR;
}
     91e:	40f2                	lw	ra,28(sp)
    peri->state = SPI_STATE_ERROR;
     920:	47a1                	li	a5,8
    peri->last_id = 0;
     922:	0004a423          	sw	zero,8(s1)
    peri->state = SPI_STATE_ERROR;
     926:	c89c                	sw	a5,16(s1)
}
     928:	44e2                	lw	s1,24(sp)
     92a:	6105                	addi	sp,sp,32
     92c:	8082                	ret

0000092e <_writestr>:
{
    return _write(fd,buf,cnt);
}

void _writestr(const void *ptr)
{
     92e:	1101                	addi	sp,sp,-32
     930:	ce06                	sw	ra,28(sp)
     932:	c62a                	sw	a0,12(sp)
    _write(STDOUT_FILENO, ptr, strlen(ptr)+1);
     934:	3dc010ef          	jal	1d10 <strlen>
     938:	45b2                	lw	a1,12(sp)
}
     93a:	40f2                	lw	ra,28(sp)
    _write(STDOUT_FILENO, ptr, strlen(ptr)+1);
     93c:	00150613          	addi	a2,a0,1
     940:	4505                	li	a0,1
}
     942:	6105                	addi	sp,sp,32
    _write(STDOUT_FILENO, ptr, strlen(ptr)+1);
     944:	b965                	j	5fc <_write>

00000946 <print_exc_msg>:
/**
 * Default Error Handling
 * @param msg error message supplied by caller
 * TODO - this will be soon by a real print formatting
 */
static void print_exc_msg(const char *msg) {
     946:	1101                	addi	sp,sp,-32
     948:	ce06                	sw	ra,28(sp)
     94a:	cc26                	sw	s1,24(sp)
  _writestr(msg );
     94c:	37cd                	jal	92e <_writestr>
  uint32_t mtval; 
  CSR_READ(CSR_REG_MTVAL, &mtval);
     94e:	343024f3          	csrr	s1,mtval
  _writestr("MTVAL value is ");
     952:	6529                	lui	a0,0xa
     954:	76050513          	addi	a0,a0,1888 # a760 <__clz_tab+0x164>
     958:	3fd9                	jal	92e <_writestr>
  const char p[6] = {(mtval >> 24) & 0xFF, (mtval >> 16) & 0xFF, (mtval >> 8) & 0xFF, mtval & 0xFF, '\n', 0};
     95a:	6984d493          	rev8	s1,s1
     95e:	47a9                	li	a5,10
  _writestr(p);
     960:	0028                	addi	a0,sp,8
  const char p[6] = {(mtval >> 24) & 0xFF, (mtval >> 16) & 0xFF, (mtval >> 8) & 0xFF, mtval & 0xFF, '\n', 0};
     962:	c426                	sw	s1,8(sp)
     964:	00f11623          	sh	a5,12(sp)
  _writestr(p);
     968:	37d9                	jal	92e <_writestr>
  while (1) {
     96a:	a001                	j	96a <print_exc_msg+0x24>

0000096c <inferenceTPG>:

    fixedpt  scores[6];
    uint32_t start, end;

    /* Initial dispatch — always start at T0 */
    goto *jump_table[0];   /* == &&L_T0 */
     96c:	6785                	lui	a5,0x1
     96e:	97478793          	addi	a5,a5,-1676 # 974 <inferenceTPG+0x8>
     972:	8782                	jr	a5

inline __attribute__((always_inline)) fixedpt P0(const fixedpt * restrict in1, const fixedpt * restrict in2, const fixedpt * restrict in3, const fixedpt * restrict in4) {
	fixedpt reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		fixedpt op0 = in3[1];
		fixedpt op1 = in3[2];
     974:	469c                	lw	a5,8(a3)
		fixedpt op0 = in3[1];
     976:	42cc                	lw	a1,4(a3)
		reg[1] = op0 + op1;
	}
	{
		fixedpt op0 = in2[0];
		fixedpt op1 = reg[1];
		reg[0] = op0 - op1;
     978:	00062803          	lw	a6,0(a2) # 80000000 <_sp+0x7fff3a10>
		reg[1] = op0 + op1;
     97c:	00179713          	slli	a4,a5,0x1
		reg[0] = op0 + op1;
     980:	00f588b3          	add	a7,a1,a5
		reg[0] = op0 - op1;
     984:	40e80833          	sub	a6,a6,a4
inline __attribute__((always_inline)) fixedpt P2(const fixedpt * restrict in1, const fixedpt * restrict in2, const fixedpt * restrict in3, const fixedpt * restrict in4) {
	fixedpt reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		fixedpt op0 = in3[1];
		fixedpt op1 = in3[2];
		reg[0] = op0 - op1;
     988:	40f58733          	sub	a4,a1,a5
  }
  return result;
}

static inline fixedpt f_log2(fixedpt n) {
    if (n <= 0) {
     98c:	10b05263          	blez	a1,a90 <inferenceTPG+0x124>
        return 0; // Handle error for non-positive input
    }
    return 31 - __builtin_clz(n);
     990:	60059593          	clz	a1,a1
     994:	47fd                	li	a5,31
     996:	40b785b3          	sub	a1,a5,a1
        if (results[i] >= top) { top = results[i]; best = i; }
     99a:	09185263          	bge	a6,a7,a1e <inferenceTPG+0xb2>
     99e:	09175263          	bge	a4,a7,a22 <inferenceTPG+0xb6>
     9a2:	0915d563          	bge	a1,a7,a2c <inferenceTPG+0xc0>
L_A1: actions[0] = 1; return;
L_A2: actions[0] = 2; return;
L_A3: actions[0] = 3; return;
L_A4: actions[0] = 4; return;
L_A5: actions[0] = 5; return;
L_A6: actions[0] = 6; return;
     9a6:	4799                	li	a5,6
L_A1: actions[0] = 1; return;
     9a8:	c11c                	sw	a5,0(a0)
     9aa:	8082                	ret
		fixedpt op1 = in3[2];
     9ac:	469c                	lw	a5,8(a3)
		fixedpt op0 = in3[1];
     9ae:	42d8                	lw	a4,4(a3)
		reg[0] = op0 - op1;
     9b0:	00062803          	lw	a6,0(a2)
		reg[1] = op0 + op1;
     9b4:	00179593          	slli	a1,a5,0x1
		reg[0] = op0 + op1;
     9b8:	00f708b3          	add	a7,a4,a5
		reg[0] = op0 - op1;
     9bc:	40b80833          	sub	a6,a6,a1
		reg[0] = op0 - op1;
     9c0:	40f707b3          	sub	a5,a4,a5
    if (n <= 0) {
     9c4:	08e05263          	blez	a4,a48 <inferenceTPG+0xdc>
    return 31 - __builtin_clz(n);
     9c8:	60071713          	clz	a4,a4
     9cc:	45fd                	li	a1,31
     9ce:	40e58733          	sub	a4,a1,a4
        if (results[i] >= top) { top = results[i]; best = i; }
     9d2:	07185363          	bge	a6,a7,a38 <inferenceTPG+0xcc>
     9d6:	0b17c063          	blt	a5,a7,a76 <inferenceTPG+0x10a>
     9da:	4589                	li	a1,2
     9dc:	08f74263          	blt	a4,a5,a60 <inferenceTPG+0xf4>
     9e0:	458d                	li	a1,3
     9e2:	fce8d2e3          	bge	a7,a4,9a6 <inferenceTPG+0x3a>
        goto *jump_table[next[bestProgram(scores, 6)]];
     9e6:	67a9                	lui	a5,0xa
     9e8:	53078793          	addi	a5,a5,1328 # a530 <next.0>
     9ec:	20f5c5b3          	sh2add	a1,a1,a5
     9f0:	419c                	lw	a5,0(a1)
     9f2:	6729                	lui	a4,0xa
     9f4:	54870713          	addi	a4,a4,1352 # a548 <jump_table.2>
     9f8:	20e7c7b3          	sh2add	a5,a5,a4
     9fc:	439c                	lw	a5,0(a5)
     9fe:	8782                	jr	a5
L_A1: actions[0] = 1; return;
     a00:	4785                	li	a5,1
     a02:	c11c                	sw	a5,0(a0)
     a04:	8082                	ret
L_A2: actions[0] = 2; return;
     a06:	4789                	li	a5,2
L_A1: actions[0] = 1; return;
     a08:	c11c                	sw	a5,0(a0)
     a0a:	8082                	ret
L_A3: actions[0] = 3; return;
     a0c:	478d                	li	a5,3
L_A1: actions[0] = 1; return;
     a0e:	c11c                	sw	a5,0(a0)
     a10:	8082                	ret
L_A4: actions[0] = 4; return;
     a12:	4791                	li	a5,4
L_A1: actions[0] = 1; return;
     a14:	c11c                	sw	a5,0(a0)
     a16:	8082                	ret
L_A5: actions[0] = 5; return;
     a18:	4795                	li	a5,5
L_A1: actions[0] = 1; return;
     a1a:	c11c                	sw	a5,0(a0)
     a1c:	8082                	ret
        if (results[i] >= top) { top = results[i]; best = i; }
     a1e:	07074063          	blt	a4,a6,a7e <inferenceTPG+0x112>
     a22:	6785                	lui	a5,0x1
     a24:	a0c78793          	addi	a5,a5,-1524 # a0c <inferenceTPG+0xa0>
     a28:	04e5c563          	blt	a1,a4,a72 <inferenceTPG+0x106>
     a2c:	6785                	lui	a5,0x1
     a2e:	a1278793          	addi	a5,a5,-1518 # a12 <inferenceTPG+0xa6>
     a32:	f6b8dae3          	bge	a7,a1,9a6 <inferenceTPG+0x3a>
     a36:	8782                	jr	a5
     a38:	4589                	li	a1,2
     a3a:	fb07d1e3          	bge	a5,a6,9dc <inferenceTPG+0x70>
     a3e:	87c2                	mv	a5,a6
     a40:	4585                	li	a1,1
     a42:	f8f75fe3          	bge	a4,a5,9e0 <inferenceTPG+0x74>
     a46:	a829                	j	a60 <inferenceTPG+0xf4>
	fixedpt reg[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	{
		fixedpt op0 = reg[4];
		fixedpt op1 = in3[1];
		//reg[0] = (op0 > op1) ? op0 : op1;
		reg[0] = reg[4] - in3[1]; 
     a48:	40e00733          	neg	a4,a4
     a4c:	07185b63          	bge	a6,a7,ac2 <inferenceTPG+0x156>
     a50:	0917c063          	blt	a5,a7,ad0 <inferenceTPG+0x164>
     a54:	4591                	li	a1,4
     a56:	f8f056e3          	blez	a5,9e2 <inferenceTPG+0x76>
     a5a:	4589                	li	a1,2
     a5c:	02f75863          	bge	a4,a5,a8c <inferenceTPG+0x120>
     a60:	873e                	mv	a4,a5
     a62:	b741                	j	9e2 <inferenceTPG+0x76>
     a64:	04e05b63          	blez	a4,aba <inferenceTPG+0x14e>
     a68:	6785                	lui	a5,0x1
     a6a:	a0c78793          	addi	a5,a5,-1524 # a0c <inferenceTPG+0xa0>
     a6e:	04e5d663          	bge	a1,a4,aba <inferenceTPG+0x14e>
     a72:	85ba                	mv	a1,a4
     a74:	bf7d                	j	a32 <inferenceTPG+0xc6>
     a76:	f31748e3          	blt	a4,a7,9a6 <inferenceTPG+0x3a>
     a7a:	458d                	li	a1,3
     a7c:	b79d                	j	9e2 <inferenceTPG+0x76>
     a7e:	6785                	lui	a5,0x1
     a80:	8742                	mv	a4,a6
     a82:	9ac78793          	addi	a5,a5,-1620 # 9ac <inferenceTPG+0x40>
     a86:	fae5d3e3          	bge	a1,a4,a2c <inferenceTPG+0xc0>
     a8a:	b7e5                	j	a72 <inferenceTPG+0x106>
     a8c:	4591                	li	a1,4
     a8e:	bf91                	j	9e2 <inferenceTPG+0x76>
     a90:	40b005b3          	neg	a1,a1
     a94:	01184d63          	blt	a6,a7,aae <inferenceTPG+0x142>
     a98:	fd0756e3          	bge	a4,a6,a64 <inferenceTPG+0xf8>
     a9c:	6785                	lui	a5,0x1
     a9e:	01005f63          	blez	a6,abc <inferenceTPG+0x150>
     aa2:	8742                	mv	a4,a6
     aa4:	9ac78793          	addi	a5,a5,-1620 # 9ac <inferenceTPG+0x40>
     aa8:	00e5d963          	bge	a1,a4,aba <inferenceTPG+0x14e>
     aac:	b7d9                	j	a72 <inferenceTPG+0x106>
     aae:	fb175be3          	bge	a4,a7,a64 <inferenceTPG+0xf8>
     ab2:	01105463          	blez	a7,aba <inferenceTPG+0x14e>
     ab6:	ef15c8e3          	blt	a1,a7,9a6 <inferenceTPG+0x3a>
     aba:	6785                	lui	a5,0x1
     abc:	9ac78793          	addi	a5,a5,-1620 # 9ac <inferenceTPG+0x40>
     ac0:	bf8d                	j	a32 <inferenceTPG+0xc6>
     ac2:	4591                	li	a1,4
     ac4:	0107cc63          	blt	a5,a6,adc <inferenceTPG+0x170>
     ac8:	f0f05de3          	blez	a5,9e2 <inferenceTPG+0x76>
     acc:	4589                	li	a1,2
     ace:	b779                	j	a5c <inferenceTPG+0xf0>
     ad0:	fb105ee3          	blez	a7,a8c <inferenceTPG+0x120>
     ad4:	4591                	li	a1,4
     ad6:	f11756e3          	bge	a4,a7,9e2 <inferenceTPG+0x76>
     ada:	b5f1                	j	9a6 <inferenceTPG+0x3a>
     adc:	f10053e3          	blez	a6,9e2 <inferenceTPG+0x76>
     ae0:	87c2                	mv	a5,a6
     ae2:	4585                	li	a1,1
     ae4:	faf754e3          	bge	a4,a5,a8c <inferenceTPG+0x120>
     ae8:	bfa5                	j	a60 <inferenceTPG+0xf4>
	...

00000aec <handler_irq_fast_spi>:
    // call the weak fic handler
    fic_irq_ext_peripheral();
}

void handler_irq_fast_spi(void)
{
     aec:	715d                	addi	sp,sp,-80
     aee:	d63a                	sw	a4,44(sp)
     af0:	d43e                	sw	a5,40(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     af2:	4741                	li	a4,16
     af4:	200607b7          	lui	a5,0x20060
{
     af8:	c686                	sw	ra,76(sp)
     afa:	c496                	sw	t0,72(sp)
     afc:	c29a                	sw	t1,68(sp)
     afe:	c09e                	sw	t2,64(sp)
     b00:	de2a                	sw	a0,60(sp)
     b02:	dc2e                	sw	a1,56(sp)
     b04:	da32                	sw	a2,52(sp)
     b06:	d836                	sw	a3,48(sp)
     b08:	d242                	sw	a6,36(sp)
     b0a:	d046                	sw	a7,32(sp)
     b0c:	ce72                	sw	t3,28(sp)
     b0e:	cc76                	sw	t4,24(sp)
     b10:	ca7a                	sw	t5,20(sp)
     b12:	c87e                	sw	t6,16(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     b14:	c3d8                	sw	a4,4(a5)
    *errors = bitfield_read(SPI_HW(spi)->ERROR_STATUS, SPI_ERROR_ALL, SPI_ERRORS_INDEX);
     b16:	30010737          	lui	a4,0x30010
     b1a:	5b5c                	lw	a5,52(a4)
  return (bitfield >> index) & mask;
     b1c:	03f7f793          	andi	a5,a5,63
void fic_irq_spi(void)
{
    spi_error_e errors;
    // Get errors and check if error triggered the interrupt
    spi_get_errors(spi_host1, &errors);
    if (errors) {
     b20:	cb9d                	beqz	a5,b56 <handler_irq_fast_spi+0x6a>
/**
 * @brief Implementation of the weak function of the HAL
 */
void spi_intr_handler_error_host(spi_error_e errors) 
{
    if (SPI_NOT_BUSY(peripherals[SPI_IDX_HOST])) return;
     b22:	67ad                	lui	a5,0xb
     b24:	24478793          	addi	a5,a5,580 # b244 <peripherals>
     b28:	4fb8                	lw	a4,88(a5)
     b2a:	4789                	li	a5,2
     b2c:	08f70663          	beq	a4,a5,bb8 <handler_irq_fast_spi+0xcc>
    // The interrupt is cleared.
    clear_fast_interrupt(kSpi_fic_e);
    // call the weak fic handler
    fic_irq_spi();
}
     b30:	40b6                	lw	ra,76(sp)
     b32:	42a6                	lw	t0,72(sp)
     b34:	4316                	lw	t1,68(sp)
     b36:	4386                	lw	t2,64(sp)
     b38:	5572                	lw	a0,60(sp)
     b3a:	55e2                	lw	a1,56(sp)
     b3c:	5652                	lw	a2,52(sp)
     b3e:	56c2                	lw	a3,48(sp)
     b40:	5732                	lw	a4,44(sp)
     b42:	57a2                	lw	a5,40(sp)
     b44:	5812                	lw	a6,36(sp)
     b46:	5882                	lw	a7,32(sp)
     b48:	4e72                	lw	t3,28(sp)
     b4a:	4ee2                	lw	t4,24(sp)
     b4c:	4f52                	lw	t5,20(sp)
     b4e:	4fc2                	lw	t6,16(sp)
     b50:	6161                	addi	sp,sp,80
     b52:	30200073          	mret

spi_return_flags_e spi_acknowledge_event(spi_host_t* spi) {
    // We do not need any NULL check since this function is made to be called
    // __ONLY__ from `handler_irq_spi`, `fic_irq_spi`, `fic_irq_spi_flash`.
    // Therefore we know that spi argument will not be NULL.
    SPI_HW(spi)->INTR_STATE = bitfield_write(SPI_HW(spi)->INTR_STATE, BIT_MASK_1, 
     b56:	431c                	lw	a5,0(a4)
    if (SPI_NOT_BUSY(peripherals[SPI_IDX_HOST])) return;
     b58:	682d                	lui	a6,0xb
     b5a:	24480813          	addi	a6,a6,580 # b244 <peripherals>
  bitfield |= (value & mask) << index;
     b5e:	0027e793          	ori	a5,a5,2
     b62:	c31c                	sw	a5,0(a4)
     b64:	4b5c                	lw	a5,20(a4)
     b66:	4889                	li	a7,2
     b68:	c63e                	sw	a5,12(sp)
                             SPI_HOST_EVENT_ENABLE_RXFULL_BIT,  status.rxfull);
     b6a:	4632                	lw	a2,12(sp)
                             SPI_HOST_EVENT_ENABLE_TXEMPTY_BIT, status.txempty);
     b6c:	46b2                	lw	a3,12(sp)
                             SPI_HOST_EVENT_ENABLE_RXWM_BIT,    status.rxwm);
     b6e:	4732                	lw	a4,12(sp)
                             SPI_HOST_EVENT_ENABLE_TXWM_BIT,    status.txwm);
     b70:	47b2                	lw	a5,12(sp)
                             SPI_HOST_EVENT_ENABLE_READY_BIT,   status.ready);
     b72:	45b2                	lw	a1,12(sp)
                             SPI_HOST_EVENT_ENABLE_IDLE_BIT,   ~status.active);
     b74:	4532                	lw	a0,12(sp)
     b76:	05882803          	lw	a6,88(a6)
                             SPI_HOST_EVENT_ENABLE_RXFULL_BIT,  status.rxfull);
     b7a:	8265                	srli	a2,a2,0x19
                             SPI_HOST_EVENT_ENABLE_TXEMPTY_BIT, status.txempty);
     b7c:	82f1                	srli	a3,a3,0x1c
                             SPI_HOST_EVENT_ENABLE_RXWM_BIT,    status.rxwm);
     b7e:	8351                	srli	a4,a4,0x14
                             SPI_HOST_EVENT_ENABLE_TXWM_BIT,    status.txwm);
     b80:	83e9                	srli	a5,a5,0x1a
                             SPI_HOST_EVENT_ENABLE_RXFULL_BIT,  status.rxfull);
     b82:	8a05                	andi	a2,a2,1
                             SPI_HOST_EVENT_ENABLE_TXEMPTY_BIT, status.txempty);
     b84:	8a85                	andi	a3,a3,1
                             SPI_HOST_EVENT_ENABLE_RXWM_BIT,    status.rxwm);
     b86:	8b05                	andi	a4,a4,1
                             SPI_HOST_EVENT_ENABLE_TXWM_BIT,    status.txwm);
     b88:	8b85                	andi	a5,a5,1
                             SPI_HOST_EVENT_ENABLE_READY_BIT,   status.ready);
     b8a:	81fd                	srli	a1,a1,0x1f
                             SPI_HOST_EVENT_ENABLE_IDLE_BIT,   ~status.active);
     b8c:	8179                	srli	a0,a0,0x1e
     b8e:	fb1811e3          	bne	a6,a7,b30 <handler_irq_fast_spi+0x44>
     b92:	0686                	slli	a3,a3,0x1
  bitfield &= ~(mask << index);
     b94:	8ed1                	or	a3,a3,a2
  bitfield |= (value & mask) << index;
     b96:	070a                	slli	a4,a4,0x2
  bitfield &= ~(mask << index);
     b98:	8f55                	or	a4,a4,a3
  bitfield |= (value & mask) << index;
     b9a:	078e                	slli	a5,a5,0x3
  bitfield &= ~(mask << index);
     b9c:	8fd9                	or	a5,a5,a4
  bitfield |= (value & mask) << index;
     b9e:	4705                	li	a4,1
     ba0:	40a77533          	andn	a0,a4,a0
     ba4:	0592                	slli	a1,a1,0x4
  bitfield &= ~(mask << index);
     ba6:	8ddd                	or	a1,a1,a5
  bitfield |= (value & mask) << index;
     ba8:	00551793          	slli	a5,a0,0x5
    spi_event_handler(&peripherals[SPI_IDX_HOST], events);
     bac:	652d                	lui	a0,0xb
     bae:	8ddd                	or	a1,a1,a5
     bb0:	28c50513          	addi	a0,a0,652 # b28c <peripherals+0x48>
     bb4:	3c45                	jal	664 <spi_event_handler>
     bb6:	bfad                	j	b30 <handler_irq_fast_spi+0x44>
    spi_error_handler(&peripherals[SPI_IDX_HOST], errors);
     bb8:	652d                	lui	a0,0xb
     bba:	28c50513          	addi	a0,a0,652 # b28c <peripherals+0x48>
     bbe:	39ad                	jal	838 <spi_error_handler.isra.0>
     bc0:	bf85                	j	b30 <handler_irq_fast_spi+0x44>
	...

00000bc4 <handler_irq_fast_spi_flash>:

void handler_irq_fast_spi_flash(void)
{
     bc4:	715d                	addi	sp,sp,-80
     bc6:	d63a                	sw	a4,44(sp)
     bc8:	d43e                	sw	a5,40(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     bca:	02000713          	li	a4,32
     bce:	200607b7          	lui	a5,0x20060
{
     bd2:	c686                	sw	ra,76(sp)
     bd4:	c496                	sw	t0,72(sp)
     bd6:	c29a                	sw	t1,68(sp)
     bd8:	c09e                	sw	t2,64(sp)
     bda:	de2a                	sw	a0,60(sp)
     bdc:	dc2e                	sw	a1,56(sp)
     bde:	da32                	sw	a2,52(sp)
     be0:	d836                	sw	a3,48(sp)
     be2:	d242                	sw	a6,36(sp)
     be4:	d046                	sw	a7,32(sp)
     be6:	ce72                	sw	t3,28(sp)
     be8:	cc76                	sw	t4,24(sp)
     bea:	ca7a                	sw	t5,20(sp)
     bec:	c87e                	sw	t6,16(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     bee:	c3d8                	sw	a4,4(a5)
    *errors = bitfield_read(SPI_HW(spi)->ERROR_STATUS, SPI_ERROR_ALL, SPI_ERRORS_INDEX);
     bf0:	20020737          	lui	a4,0x20020
     bf4:	5b5c                	lw	a5,52(a4)
  return (bitfield >> index) & mask;
     bf6:	03f7f793          	andi	a5,a5,63
    if (errors) {
     bfa:	cb9d                	beqz	a5,c30 <handler_irq_fast_spi_flash+0x6c>
    if (SPI_NOT_BUSY(peripherals[SPI_IDX_FLASH])) return;
     bfc:	652d                	lui	a0,0xb
     bfe:	24450513          	addi	a0,a0,580 # b244 <peripherals>
     c02:	4918                	lw	a4,16(a0)
     c04:	4789                	li	a5,2
     c06:	08f70463          	beq	a4,a5,c8e <handler_irq_fast_spi_flash+0xca>
    // The interrupt is cleared.
    clear_fast_interrupt(kSpiFlash_fic_e);
    // call the weak fic handler
    fic_irq_spi_flash();
}
     c0a:	40b6                	lw	ra,76(sp)
     c0c:	42a6                	lw	t0,72(sp)
     c0e:	4316                	lw	t1,68(sp)
     c10:	4386                	lw	t2,64(sp)
     c12:	5572                	lw	a0,60(sp)
     c14:	55e2                	lw	a1,56(sp)
     c16:	5652                	lw	a2,52(sp)
     c18:	56c2                	lw	a3,48(sp)
     c1a:	5732                	lw	a4,44(sp)
     c1c:	57a2                	lw	a5,40(sp)
     c1e:	5812                	lw	a6,36(sp)
     c20:	5882                	lw	a7,32(sp)
     c22:	4e72                	lw	t3,28(sp)
     c24:	4ee2                	lw	t4,24(sp)
     c26:	4f52                	lw	t5,20(sp)
     c28:	4fc2                	lw	t6,16(sp)
     c2a:	6161                	addi	sp,sp,80
     c2c:	30200073          	mret
    SPI_HW(spi)->INTR_STATE = bitfield_write(SPI_HW(spi)->INTR_STATE, BIT_MASK_1, 
     c30:	431c                	lw	a5,0(a4)
    if (SPI_NOT_BUSY(peripherals[SPI_IDX_FLASH])) return;
     c32:	652d                	lui	a0,0xb
     c34:	24450513          	addi	a0,a0,580 # b244 <peripherals>
  bitfield |= (value & mask) << index;
     c38:	0027e793          	ori	a5,a5,2
     c3c:	c31c                	sw	a5,0(a4)
     c3e:	4b5c                	lw	a5,20(a4)
     c40:	4889                	li	a7,2
     c42:	c63e                	sw	a5,12(sp)
                             SPI_HOST_EVENT_ENABLE_RXFULL_BIT,  status.rxfull);
     c44:	4632                	lw	a2,12(sp)
                             SPI_HOST_EVENT_ENABLE_TXEMPTY_BIT, status.txempty);
     c46:	46b2                	lw	a3,12(sp)
                             SPI_HOST_EVENT_ENABLE_RXWM_BIT,    status.rxwm);
     c48:	4732                	lw	a4,12(sp)
                             SPI_HOST_EVENT_ENABLE_TXWM_BIT,    status.txwm);
     c4a:	47b2                	lw	a5,12(sp)
                             SPI_HOST_EVENT_ENABLE_READY_BIT,   status.ready);
     c4c:	45b2                	lw	a1,12(sp)
                             SPI_HOST_EVENT_ENABLE_IDLE_BIT,   ~status.active);
     c4e:	4832                	lw	a6,12(sp)
     c50:	01052303          	lw	t1,16(a0)
                             SPI_HOST_EVENT_ENABLE_RXFULL_BIT,  status.rxfull);
     c54:	8265                	srli	a2,a2,0x19
                             SPI_HOST_EVENT_ENABLE_TXEMPTY_BIT, status.txempty);
     c56:	82f1                	srli	a3,a3,0x1c
                             SPI_HOST_EVENT_ENABLE_RXWM_BIT,    status.rxwm);
     c58:	8351                	srli	a4,a4,0x14
                             SPI_HOST_EVENT_ENABLE_TXWM_BIT,    status.txwm);
     c5a:	83e9                	srli	a5,a5,0x1a
                             SPI_HOST_EVENT_ENABLE_RXFULL_BIT,  status.rxfull);
     c5c:	8a05                	andi	a2,a2,1
                             SPI_HOST_EVENT_ENABLE_TXEMPTY_BIT, status.txempty);
     c5e:	8a85                	andi	a3,a3,1
                             SPI_HOST_EVENT_ENABLE_RXWM_BIT,    status.rxwm);
     c60:	8b05                	andi	a4,a4,1
                             SPI_HOST_EVENT_ENABLE_TXWM_BIT,    status.txwm);
     c62:	8b85                	andi	a5,a5,1
                             SPI_HOST_EVENT_ENABLE_READY_BIT,   status.ready);
     c64:	81fd                	srli	a1,a1,0x1f
                             SPI_HOST_EVENT_ENABLE_IDLE_BIT,   ~status.active);
     c66:	01e85813          	srli	a6,a6,0x1e
     c6a:	fb1310e3          	bne	t1,a7,c0a <handler_irq_fast_spi_flash+0x46>
     c6e:	0686                	slli	a3,a3,0x1
  bitfield &= ~(mask << index);
     c70:	8ed1                	or	a3,a3,a2
  bitfield |= (value & mask) << index;
     c72:	070a                	slli	a4,a4,0x2
  bitfield &= ~(mask << index);
     c74:	8f55                	or	a4,a4,a3
  bitfield |= (value & mask) << index;
     c76:	078e                	slli	a5,a5,0x3
  bitfield &= ~(mask << index);
     c78:	8fd9                	or	a5,a5,a4
  bitfield |= (value & mask) << index;
     c7a:	4705                	li	a4,1
     c7c:	41077833          	andn	a6,a4,a6
     c80:	0592                	slli	a1,a1,0x4
  bitfield &= ~(mask << index);
     c82:	8ddd                	or	a1,a1,a5
  bitfield |= (value & mask) << index;
     c84:	0816                	slli	a6,a6,0x5
    spi_event_handler(&peripherals[SPI_IDX_FLASH], events);
     c86:	00b865b3          	or	a1,a6,a1
     c8a:	3ae9                	jal	664 <spi_event_handler>
     c8c:	bfbd                	j	c0a <handler_irq_fast_spi_flash+0x46>
    spi_error_handler(&peripherals[SPI_IDX_FLASH], errors);
     c8e:	366d                	jal	838 <spi_error_handler.isra.0>
     c90:	bfad                	j	c0a <handler_irq_fast_spi_flash+0x46>
	...

00000c94 <handler_irq_external>:
/*                           EXPORTED FUNCTIONS                             */
/**                                                                        **/
/****************************************************************************/

void handler_irq_external(void)
{
     c94:	711d                	addi	sp,sp,-96
     c96:	c6a6                	sw	s1,76(sp)
  if (claim_data == NULL)
  {
    return kPlicBadArg;
  }

  *claim_data = rv_plic_peri->CC0;
     c98:	300004b7          	lui	s1,0x30000
{
     c9c:	c4aa                	sw	a0,72(sp)
  *claim_data = rv_plic_peri->CC0;
     c9e:	20c4a503          	lw	a0,524(s1) # 3000020c <_sp+0x2fff3c1c>
{
     ca2:	da3e                	sw	a5,52(sp)
     ca4:	ce86                	sw	ra,92(sp)
     ca6:	cc96                	sw	t0,88(sp)
     ca8:	ca9a                	sw	t1,84(sp)
     caa:	c89e                	sw	t2,80(sp)
     cac:	c2ae                	sw	a1,68(sp)
     cae:	c0b2                	sw	a2,64(sp)
     cb0:	de36                	sw	a3,60(sp)
     cb2:	dc3a                	sw	a4,56(sp)
     cb4:	d842                	sw	a6,48(sp)
     cb6:	d646                	sw	a7,44(sp)
     cb8:	d472                	sw	t3,40(sp)
     cba:	d276                	sw	t4,36(sp)
     cbc:	d07a                	sw	t5,32(sp)
     cbe:	ce7e                	sw	t6,28(sp)
    handlers[int_id](int_id);
     cc0:	c62a                	sw	a0,12(sp)
     cc2:	4781                	li	a5,0
     cc4:	9782                	jalr	a5
    return kPlicBadArg;
  }

  // Write back the claimed IRQ ID to the target specific CC register,
  // to notify the PLIC of the IRQ completion.
  rv_plic_peri->CC0 = *complete_data;
     cc6:	4532                	lw	a0,12(sp)
}
     cc8:	40f6                	lw	ra,92(sp)
     cca:	42e6                	lw	t0,88(sp)
  rv_plic_peri->CC0 = *complete_data;
     ccc:	20a4a623          	sw	a0,524(s1)
}
     cd0:	4356                	lw	t1,84(sp)
     cd2:	43c6                	lw	t2,80(sp)
     cd4:	44b6                	lw	s1,76(sp)
     cd6:	4526                	lw	a0,72(sp)
     cd8:	4596                	lw	a1,68(sp)
     cda:	4606                	lw	a2,64(sp)
     cdc:	56f2                	lw	a3,60(sp)
     cde:	5762                	lw	a4,56(sp)
     ce0:	57d2                	lw	a5,52(sp)
     ce2:	5842                	lw	a6,48(sp)
     ce4:	58b2                	lw	a7,44(sp)
     ce6:	5e22                	lw	t3,40(sp)
     ce8:	5e92                	lw	t4,36(sp)
     cea:	5f02                	lw	t5,32(sp)
     cec:	4ff2                	lw	t6,28(sp)
     cee:	6125                	addi	sp,sp,96
     cf0:	30200073          	mret
     cf4:	0001                	nop
	...

00000cf8 <handler_irq_fast_timer_1>:
{
     cf8:	7139                	addi	sp,sp,-64
     cfa:	ce3a                	sw	a4,28(sp)
     cfc:	cc3e                	sw	a5,24(sp)
     cfe:	de06                	sw	ra,60(sp)
     d00:	dc16                	sw	t0,56(sp)
     d02:	da1a                	sw	t1,52(sp)
     d04:	d81e                	sw	t2,48(sp)
     d06:	d62a                	sw	a0,44(sp)
     d08:	d42e                	sw	a1,40(sp)
     d0a:	d232                	sw	a2,36(sp)
     d0c:	d036                	sw	a3,32(sp)
     d0e:	ca42                	sw	a6,20(sp)
     d10:	c846                	sw	a7,16(sp)
     d12:	c672                	sw	t3,12(sp)
     d14:	c476                	sw	t4,8(sp)
     d16:	c27a                	sw	t5,4(sp)
     d18:	c07e                	sw	t6,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     d1a:	200607b7          	lui	a5,0x20060
     d1e:	4705                	li	a4,1
     d20:	c3d8                	sw	a4,4(a5)
    fic_irq_timer_1();
     d22:	30e1                	jal	5ea <fic_irq_timer_1>
}
     d24:	50f2                	lw	ra,60(sp)
     d26:	52e2                	lw	t0,56(sp)
     d28:	5352                	lw	t1,52(sp)
     d2a:	53c2                	lw	t2,48(sp)
     d2c:	5532                	lw	a0,44(sp)
     d2e:	55a2                	lw	a1,40(sp)
     d30:	5612                	lw	a2,36(sp)
     d32:	5682                	lw	a3,32(sp)
     d34:	4772                	lw	a4,28(sp)
     d36:	47e2                	lw	a5,24(sp)
     d38:	4852                	lw	a6,20(sp)
     d3a:	48c2                	lw	a7,16(sp)
     d3c:	4e32                	lw	t3,12(sp)
     d3e:	4ea2                	lw	t4,8(sp)
     d40:	4f12                	lw	t5,4(sp)
     d42:	4f82                	lw	t6,0(sp)
     d44:	6121                	addi	sp,sp,64
     d46:	30200073          	mret
     d4a:	0001                	nop

00000d4c <handler_irq_fast_timer_2>:
{
     d4c:	7139                	addi	sp,sp,-64
     d4e:	ce3a                	sw	a4,28(sp)
     d50:	cc3e                	sw	a5,24(sp)
     d52:	de06                	sw	ra,60(sp)
     d54:	dc16                	sw	t0,56(sp)
     d56:	da1a                	sw	t1,52(sp)
     d58:	d81e                	sw	t2,48(sp)
     d5a:	d62a                	sw	a0,44(sp)
     d5c:	d42e                	sw	a1,40(sp)
     d5e:	d232                	sw	a2,36(sp)
     d60:	d036                	sw	a3,32(sp)
     d62:	ca42                	sw	a6,20(sp)
     d64:	c846                	sw	a7,16(sp)
     d66:	c672                	sw	t3,12(sp)
     d68:	c476                	sw	t4,8(sp)
     d6a:	c27a                	sw	t5,4(sp)
     d6c:	c07e                	sw	t6,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     d6e:	200607b7          	lui	a5,0x20060
     d72:	4709                	li	a4,2
     d74:	c3d8                	sw	a4,4(a5)
    fic_irq_timer_2();
     d76:	3895                	jal	5ea <fic_irq_timer_1>
}
     d78:	50f2                	lw	ra,60(sp)
     d7a:	52e2                	lw	t0,56(sp)
     d7c:	5352                	lw	t1,52(sp)
     d7e:	53c2                	lw	t2,48(sp)
     d80:	5532                	lw	a0,44(sp)
     d82:	55a2                	lw	a1,40(sp)
     d84:	5612                	lw	a2,36(sp)
     d86:	5682                	lw	a3,32(sp)
     d88:	4772                	lw	a4,28(sp)
     d8a:	47e2                	lw	a5,24(sp)
     d8c:	4852                	lw	a6,20(sp)
     d8e:	48c2                	lw	a7,16(sp)
     d90:	4e32                	lw	t3,12(sp)
     d92:	4ea2                	lw	t4,8(sp)
     d94:	4f12                	lw	t5,4(sp)
     d96:	4f82                	lw	t6,0(sp)
     d98:	6121                	addi	sp,sp,64
     d9a:	30200073          	mret
     d9e:	0001                	nop

00000da0 <handler_irq_fast_timer_3>:
{
     da0:	7139                	addi	sp,sp,-64
     da2:	ce3a                	sw	a4,28(sp)
     da4:	cc3e                	sw	a5,24(sp)
     da6:	de06                	sw	ra,60(sp)
     da8:	dc16                	sw	t0,56(sp)
     daa:	da1a                	sw	t1,52(sp)
     dac:	d81e                	sw	t2,48(sp)
     dae:	d62a                	sw	a0,44(sp)
     db0:	d42e                	sw	a1,40(sp)
     db2:	d232                	sw	a2,36(sp)
     db4:	d036                	sw	a3,32(sp)
     db6:	ca42                	sw	a6,20(sp)
     db8:	c846                	sw	a7,16(sp)
     dba:	c672                	sw	t3,12(sp)
     dbc:	c476                	sw	t4,8(sp)
     dbe:	c27a                	sw	t5,4(sp)
     dc0:	c07e                	sw	t6,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     dc2:	200607b7          	lui	a5,0x20060
     dc6:	4711                	li	a4,4
     dc8:	c3d8                	sw	a4,4(a5)
    fic_irq_timer_3();
     dca:	3005                	jal	5ea <fic_irq_timer_1>
}
     dcc:	50f2                	lw	ra,60(sp)
     dce:	52e2                	lw	t0,56(sp)
     dd0:	5352                	lw	t1,52(sp)
     dd2:	53c2                	lw	t2,48(sp)
     dd4:	5532                	lw	a0,44(sp)
     dd6:	55a2                	lw	a1,40(sp)
     dd8:	5612                	lw	a2,36(sp)
     dda:	5682                	lw	a3,32(sp)
     ddc:	4772                	lw	a4,28(sp)
     dde:	47e2                	lw	a5,24(sp)
     de0:	4852                	lw	a6,20(sp)
     de2:	48c2                	lw	a7,16(sp)
     de4:	4e32                	lw	t3,12(sp)
     de6:	4ea2                	lw	t4,8(sp)
     de8:	4f12                	lw	t5,4(sp)
     dea:	4f82                	lw	t6,0(sp)
     dec:	6121                	addi	sp,sp,64
     dee:	30200073          	mret
     df2:	0001                	nop

00000df4 <handler_irq_fast_external_peripheral>:
{
     df4:	7139                	addi	sp,sp,-64
     df6:	ce3a                	sw	a4,28(sp)
     df8:	cc3e                	sw	a5,24(sp)
     dfa:	de06                	sw	ra,60(sp)
     dfc:	dc16                	sw	t0,56(sp)
     dfe:	da1a                	sw	t1,52(sp)
     e00:	d81e                	sw	t2,48(sp)
     e02:	d62a                	sw	a0,44(sp)
     e04:	d42e                	sw	a1,40(sp)
     e06:	d232                	sw	a2,36(sp)
     e08:	d036                	sw	a3,32(sp)
     e0a:	ca42                	sw	a6,20(sp)
     e0c:	c846                	sw	a7,16(sp)
     e0e:	c672                	sw	t3,12(sp)
     e10:	c476                	sw	t4,8(sp)
     e12:	c27a                	sw	t5,4(sp)
     e14:	c07e                	sw	t6,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     e16:	200607b7          	lui	a5,0x20060
     e1a:	6721                	lui	a4,0x8
     e1c:	c3d8                	sw	a4,4(a5)
    fic_irq_ext_peripheral();
     e1e:	fccff0ef          	jal	5ea <fic_irq_timer_1>
}
     e22:	50f2                	lw	ra,60(sp)
     e24:	52e2                	lw	t0,56(sp)
     e26:	5352                	lw	t1,52(sp)
     e28:	53c2                	lw	t2,48(sp)
     e2a:	5532                	lw	a0,44(sp)
     e2c:	55a2                	lw	a1,40(sp)
     e2e:	5612                	lw	a2,36(sp)
     e30:	5682                	lw	a3,32(sp)
     e32:	4772                	lw	a4,28(sp)
     e34:	47e2                	lw	a5,24(sp)
     e36:	4852                	lw	a6,20(sp)
     e38:	48c2                	lw	a7,16(sp)
     e3a:	4e32                	lw	t3,12(sp)
     e3c:	4ea2                	lw	t4,8(sp)
     e3e:	4f12                	lw	t5,4(sp)
     e40:	4f82                	lw	t6,0(sp)
     e42:	6121                	addi	sp,sp,64
     e44:	30200073          	mret
     e48:	0001                	nop
	...

00000e4c <handler_irq_fast_gpio_0>:

void handler_irq_fast_gpio_0(void)
{
     e4c:	7139                	addi	sp,sp,-64
     e4e:	ce3a                	sw	a4,28(sp)
     e50:	cc3e                	sw	a5,24(sp)
     e52:	de06                	sw	ra,60(sp)
     e54:	dc16                	sw	t0,56(sp)
     e56:	da1a                	sw	t1,52(sp)
     e58:	d81e                	sw	t2,48(sp)
     e5a:	d62a                	sw	a0,44(sp)
     e5c:	d42e                	sw	a1,40(sp)
     e5e:	d232                	sw	a2,36(sp)
     e60:	d036                	sw	a3,32(sp)
     e62:	ca42                	sw	a6,20(sp)
     e64:	c846                	sw	a7,16(sp)
     e66:	c672                	sw	t3,12(sp)
     e68:	c476                	sw	t4,8(sp)
     e6a:	c27a                	sw	t5,4(sp)
     e6c:	c07e                	sw	t6,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     e6e:	200607b7          	lui	a5,0x20060
     e72:	04000713          	li	a4,64
     e76:	c3d8                	sw	a4,4(a5)
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_0_fic_e);
    // call the weak fic handler
    fic_irq_gpio_0();
     e78:	f72ff0ef          	jal	5ea <fic_irq_timer_1>
}
     e7c:	50f2                	lw	ra,60(sp)
     e7e:	52e2                	lw	t0,56(sp)
     e80:	5352                	lw	t1,52(sp)
     e82:	53c2                	lw	t2,48(sp)
     e84:	5532                	lw	a0,44(sp)
     e86:	55a2                	lw	a1,40(sp)
     e88:	5612                	lw	a2,36(sp)
     e8a:	5682                	lw	a3,32(sp)
     e8c:	4772                	lw	a4,28(sp)
     e8e:	47e2                	lw	a5,24(sp)
     e90:	4852                	lw	a6,20(sp)
     e92:	48c2                	lw	a7,16(sp)
     e94:	4e32                	lw	t3,12(sp)
     e96:	4ea2                	lw	t4,8(sp)
     e98:	4f12                	lw	t5,4(sp)
     e9a:	4f82                	lw	t6,0(sp)
     e9c:	6121                	addi	sp,sp,64
     e9e:	30200073          	mret
	...

00000ea4 <handler_irq_fast_gpio_1>:

void handler_irq_fast_gpio_1(void)
{
     ea4:	7139                	addi	sp,sp,-64
     ea6:	ce3a                	sw	a4,28(sp)
     ea8:	cc3e                	sw	a5,24(sp)
     eaa:	de06                	sw	ra,60(sp)
     eac:	dc16                	sw	t0,56(sp)
     eae:	da1a                	sw	t1,52(sp)
     eb0:	d81e                	sw	t2,48(sp)
     eb2:	d62a                	sw	a0,44(sp)
     eb4:	d42e                	sw	a1,40(sp)
     eb6:	d232                	sw	a2,36(sp)
     eb8:	d036                	sw	a3,32(sp)
     eba:	ca42                	sw	a6,20(sp)
     ebc:	c846                	sw	a7,16(sp)
     ebe:	c672                	sw	t3,12(sp)
     ec0:	c476                	sw	t4,8(sp)
     ec2:	c27a                	sw	t5,4(sp)
     ec4:	c07e                	sw	t6,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     ec6:	200607b7          	lui	a5,0x20060
     eca:	08000713          	li	a4,128
     ece:	c3d8                	sw	a4,4(a5)
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_1_fic_e);
    // call the weak fic handler
    fic_irq_gpio_1();
     ed0:	f1aff0ef          	jal	5ea <fic_irq_timer_1>
}
     ed4:	50f2                	lw	ra,60(sp)
     ed6:	52e2                	lw	t0,56(sp)
     ed8:	5352                	lw	t1,52(sp)
     eda:	53c2                	lw	t2,48(sp)
     edc:	5532                	lw	a0,44(sp)
     ede:	55a2                	lw	a1,40(sp)
     ee0:	5612                	lw	a2,36(sp)
     ee2:	5682                	lw	a3,32(sp)
     ee4:	4772                	lw	a4,28(sp)
     ee6:	47e2                	lw	a5,24(sp)
     ee8:	4852                	lw	a6,20(sp)
     eea:	48c2                	lw	a7,16(sp)
     eec:	4e32                	lw	t3,12(sp)
     eee:	4ea2                	lw	t4,8(sp)
     ef0:	4f12                	lw	t5,4(sp)
     ef2:	4f82                	lw	t6,0(sp)
     ef4:	6121                	addi	sp,sp,64
     ef6:	30200073          	mret
	...

00000efc <handler_irq_fast_gpio_2>:

void handler_irq_fast_gpio_2(void)
{
     efc:	7139                	addi	sp,sp,-64
     efe:	ce3a                	sw	a4,28(sp)
     f00:	cc3e                	sw	a5,24(sp)
     f02:	de06                	sw	ra,60(sp)
     f04:	dc16                	sw	t0,56(sp)
     f06:	da1a                	sw	t1,52(sp)
     f08:	d81e                	sw	t2,48(sp)
     f0a:	d62a                	sw	a0,44(sp)
     f0c:	d42e                	sw	a1,40(sp)
     f0e:	d232                	sw	a2,36(sp)
     f10:	d036                	sw	a3,32(sp)
     f12:	ca42                	sw	a6,20(sp)
     f14:	c846                	sw	a7,16(sp)
     f16:	c672                	sw	t3,12(sp)
     f18:	c476                	sw	t4,8(sp)
     f1a:	c27a                	sw	t5,4(sp)
     f1c:	c07e                	sw	t6,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     f1e:	200607b7          	lui	a5,0x20060
     f22:	10000713          	li	a4,256
     f26:	c3d8                	sw	a4,4(a5)
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_2_fic_e);
    // call the weak fic handler
    fic_irq_gpio_2();
     f28:	ec2ff0ef          	jal	5ea <fic_irq_timer_1>
}
     f2c:	50f2                	lw	ra,60(sp)
     f2e:	52e2                	lw	t0,56(sp)
     f30:	5352                	lw	t1,52(sp)
     f32:	53c2                	lw	t2,48(sp)
     f34:	5532                	lw	a0,44(sp)
     f36:	55a2                	lw	a1,40(sp)
     f38:	5612                	lw	a2,36(sp)
     f3a:	5682                	lw	a3,32(sp)
     f3c:	4772                	lw	a4,28(sp)
     f3e:	47e2                	lw	a5,24(sp)
     f40:	4852                	lw	a6,20(sp)
     f42:	48c2                	lw	a7,16(sp)
     f44:	4e32                	lw	t3,12(sp)
     f46:	4ea2                	lw	t4,8(sp)
     f48:	4f12                	lw	t5,4(sp)
     f4a:	4f82                	lw	t6,0(sp)
     f4c:	6121                	addi	sp,sp,64
     f4e:	30200073          	mret
	...

00000f54 <handler_irq_fast_gpio_3>:

void handler_irq_fast_gpio_3(void)
{
     f54:	7139                	addi	sp,sp,-64
     f56:	ce3a                	sw	a4,28(sp)
     f58:	cc3e                	sw	a5,24(sp)
     f5a:	de06                	sw	ra,60(sp)
     f5c:	dc16                	sw	t0,56(sp)
     f5e:	da1a                	sw	t1,52(sp)
     f60:	d81e                	sw	t2,48(sp)
     f62:	d62a                	sw	a0,44(sp)
     f64:	d42e                	sw	a1,40(sp)
     f66:	d232                	sw	a2,36(sp)
     f68:	d036                	sw	a3,32(sp)
     f6a:	ca42                	sw	a6,20(sp)
     f6c:	c846                	sw	a7,16(sp)
     f6e:	c672                	sw	t3,12(sp)
     f70:	c476                	sw	t4,8(sp)
     f72:	c27a                	sw	t5,4(sp)
     f74:	c07e                	sw	t6,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     f76:	200607b7          	lui	a5,0x20060
     f7a:	20000713          	li	a4,512
     f7e:	c3d8                	sw	a4,4(a5)
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_3_fic_e);
    // call the weak fic handler
    fic_irq_gpio_3();
     f80:	e6aff0ef          	jal	5ea <fic_irq_timer_1>
}
     f84:	50f2                	lw	ra,60(sp)
     f86:	52e2                	lw	t0,56(sp)
     f88:	5352                	lw	t1,52(sp)
     f8a:	53c2                	lw	t2,48(sp)
     f8c:	5532                	lw	a0,44(sp)
     f8e:	55a2                	lw	a1,40(sp)
     f90:	5612                	lw	a2,36(sp)
     f92:	5682                	lw	a3,32(sp)
     f94:	4772                	lw	a4,28(sp)
     f96:	47e2                	lw	a5,24(sp)
     f98:	4852                	lw	a6,20(sp)
     f9a:	48c2                	lw	a7,16(sp)
     f9c:	4e32                	lw	t3,12(sp)
     f9e:	4ea2                	lw	t4,8(sp)
     fa0:	4f12                	lw	t5,4(sp)
     fa2:	4f82                	lw	t6,0(sp)
     fa4:	6121                	addi	sp,sp,64
     fa6:	30200073          	mret
	...

00000fac <handler_irq_fast_gpio_4>:

void handler_irq_fast_gpio_4(void)
{
     fac:	7139                	addi	sp,sp,-64
     fae:	ce3a                	sw	a4,28(sp)
     fb0:	cc3e                	sw	a5,24(sp)
     fb2:	de06                	sw	ra,60(sp)
     fb4:	dc16                	sw	t0,56(sp)
     fb6:	da1a                	sw	t1,52(sp)
     fb8:	d81e                	sw	t2,48(sp)
     fba:	d62a                	sw	a0,44(sp)
     fbc:	d42e                	sw	a1,40(sp)
     fbe:	d232                	sw	a2,36(sp)
     fc0:	d036                	sw	a3,32(sp)
     fc2:	ca42                	sw	a6,20(sp)
     fc4:	c846                	sw	a7,16(sp)
     fc6:	c672                	sw	t3,12(sp)
     fc8:	c476                	sw	t4,8(sp)
     fca:	c27a                	sw	t5,4(sp)
     fcc:	c07e                	sw	t6,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
     fce:	200607b7          	lui	a5,0x20060
     fd2:	40000713          	li	a4,1024
     fd6:	c3d8                	sw	a4,4(a5)
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_4_fic_e);
    // call the weak fic handler
    fic_irq_gpio_4();
     fd8:	e12ff0ef          	jal	5ea <fic_irq_timer_1>
}
     fdc:	50f2                	lw	ra,60(sp)
     fde:	52e2                	lw	t0,56(sp)
     fe0:	5352                	lw	t1,52(sp)
     fe2:	53c2                	lw	t2,48(sp)
     fe4:	5532                	lw	a0,44(sp)
     fe6:	55a2                	lw	a1,40(sp)
     fe8:	5612                	lw	a2,36(sp)
     fea:	5682                	lw	a3,32(sp)
     fec:	4772                	lw	a4,28(sp)
     fee:	47e2                	lw	a5,24(sp)
     ff0:	4852                	lw	a6,20(sp)
     ff2:	48c2                	lw	a7,16(sp)
     ff4:	4e32                	lw	t3,12(sp)
     ff6:	4ea2                	lw	t4,8(sp)
     ff8:	4f12                	lw	t5,4(sp)
     ffa:	4f82                	lw	t6,0(sp)
     ffc:	6121                	addi	sp,sp,64
     ffe:	30200073          	mret
	...

00001004 <handler_irq_fast_gpio_5>:

void handler_irq_fast_gpio_5(void)
{
    1004:	7139                	addi	sp,sp,-64
    1006:	cc3e                	sw	a5,24(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1008:	6785                	lui	a5,0x1
{
    100a:	ce3a                	sw	a4,28(sp)
    100c:	de06                	sw	ra,60(sp)
    100e:	dc16                	sw	t0,56(sp)
    1010:	da1a                	sw	t1,52(sp)
    1012:	d81e                	sw	t2,48(sp)
    1014:	d62a                	sw	a0,44(sp)
    1016:	d42e                	sw	a1,40(sp)
    1018:	d232                	sw	a2,36(sp)
    101a:	d036                	sw	a3,32(sp)
    101c:	ca42                	sw	a6,20(sp)
    101e:	c846                	sw	a7,16(sp)
    1020:	c672                	sw	t3,12(sp)
    1022:	c476                	sw	t4,8(sp)
    1024:	c27a                	sw	t5,4(sp)
    1026:	c07e                	sw	t6,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1028:	80078793          	addi	a5,a5,-2048 # 800 <__heap_size>
    102c:	20060737          	lui	a4,0x20060
    1030:	c35c                	sw	a5,4(a4)
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_5_fic_e);
    // call the weak fic handler
    fic_irq_gpio_5();
    1032:	db8ff0ef          	jal	5ea <fic_irq_timer_1>
}
    1036:	50f2                	lw	ra,60(sp)
    1038:	52e2                	lw	t0,56(sp)
    103a:	5352                	lw	t1,52(sp)
    103c:	53c2                	lw	t2,48(sp)
    103e:	5532                	lw	a0,44(sp)
    1040:	55a2                	lw	a1,40(sp)
    1042:	5612                	lw	a2,36(sp)
    1044:	5682                	lw	a3,32(sp)
    1046:	4772                	lw	a4,28(sp)
    1048:	47e2                	lw	a5,24(sp)
    104a:	4852                	lw	a6,20(sp)
    104c:	48c2                	lw	a7,16(sp)
    104e:	4e32                	lw	t3,12(sp)
    1050:	4ea2                	lw	t4,8(sp)
    1052:	4f12                	lw	t5,4(sp)
    1054:	4f82                	lw	t6,0(sp)
    1056:	6121                	addi	sp,sp,64
    1058:	30200073          	mret
    105c:	0001                	nop
	...

00001060 <handler_irq_fast_gpio_6>:

void handler_irq_fast_gpio_6(void)
{
    1060:	7139                	addi	sp,sp,-64
    1062:	ce3a                	sw	a4,28(sp)
    1064:	cc3e                	sw	a5,24(sp)
    1066:	de06                	sw	ra,60(sp)
    1068:	dc16                	sw	t0,56(sp)
    106a:	da1a                	sw	t1,52(sp)
    106c:	d81e                	sw	t2,48(sp)
    106e:	d62a                	sw	a0,44(sp)
    1070:	d42e                	sw	a1,40(sp)
    1072:	d232                	sw	a2,36(sp)
    1074:	d036                	sw	a3,32(sp)
    1076:	ca42                	sw	a6,20(sp)
    1078:	c846                	sw	a7,16(sp)
    107a:	c672                	sw	t3,12(sp)
    107c:	c476                	sw	t4,8(sp)
    107e:	c27a                	sw	t5,4(sp)
    1080:	c07e                	sw	t6,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1082:	200607b7          	lui	a5,0x20060
    1086:	6705                	lui	a4,0x1
    1088:	c3d8                	sw	a4,4(a5)
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_6_fic_e);
    // call the weak fic handler
    fic_irq_gpio_6();
    108a:	d60ff0ef          	jal	5ea <fic_irq_timer_1>
}
    108e:	50f2                	lw	ra,60(sp)
    1090:	52e2                	lw	t0,56(sp)
    1092:	5352                	lw	t1,52(sp)
    1094:	53c2                	lw	t2,48(sp)
    1096:	5532                	lw	a0,44(sp)
    1098:	55a2                	lw	a1,40(sp)
    109a:	5612                	lw	a2,36(sp)
    109c:	5682                	lw	a3,32(sp)
    109e:	4772                	lw	a4,28(sp)
    10a0:	47e2                	lw	a5,24(sp)
    10a2:	4852                	lw	a6,20(sp)
    10a4:	48c2                	lw	a7,16(sp)
    10a6:	4e32                	lw	t3,12(sp)
    10a8:	4ea2                	lw	t4,8(sp)
    10aa:	4f12                	lw	t5,4(sp)
    10ac:	4f82                	lw	t6,0(sp)
    10ae:	6121                	addi	sp,sp,64
    10b0:	30200073          	mret
    10b4:	0001                	nop
	...

000010b8 <handler_irq_fast_gpio_7>:

void handler_irq_fast_gpio_7(void)
{
    10b8:	7139                	addi	sp,sp,-64
    10ba:	ce3a                	sw	a4,28(sp)
    10bc:	cc3e                	sw	a5,24(sp)
    10be:	de06                	sw	ra,60(sp)
    10c0:	dc16                	sw	t0,56(sp)
    10c2:	da1a                	sw	t1,52(sp)
    10c4:	d81e                	sw	t2,48(sp)
    10c6:	d62a                	sw	a0,44(sp)
    10c8:	d42e                	sw	a1,40(sp)
    10ca:	d232                	sw	a2,36(sp)
    10cc:	d036                	sw	a3,32(sp)
    10ce:	ca42                	sw	a6,20(sp)
    10d0:	c846                	sw	a7,16(sp)
    10d2:	c672                	sw	t3,12(sp)
    10d4:	c476                	sw	t4,8(sp)
    10d6:	c27a                	sw	t5,4(sp)
    10d8:	c07e                	sw	t6,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    10da:	200607b7          	lui	a5,0x20060
    10de:	6709                	lui	a4,0x2
    10e0:	c3d8                	sw	a4,4(a5)
    // The interrupt is cleared.
    clear_fast_interrupt(kGpio_7_fic_e);
    // call the weak fic handler
    fic_irq_gpio_7();
    10e2:	d08ff0ef          	jal	5ea <fic_irq_timer_1>
}
    10e6:	50f2                	lw	ra,60(sp)
    10e8:	52e2                	lw	t0,56(sp)
    10ea:	5352                	lw	t1,52(sp)
    10ec:	53c2                	lw	t2,48(sp)
    10ee:	5532                	lw	a0,44(sp)
    10f0:	55a2                	lw	a1,40(sp)
    10f2:	5612                	lw	a2,36(sp)
    10f4:	5682                	lw	a3,32(sp)
    10f6:	4772                	lw	a4,28(sp)
    10f8:	47e2                	lw	a5,24(sp)
    10fa:	4852                	lw	a6,20(sp)
    10fc:	48c2                	lw	a7,16(sp)
    10fe:	4e32                	lw	t3,12(sp)
    1100:	4ea2                	lw	t4,8(sp)
    1102:	4f12                	lw	t5,4(sp)
    1104:	4f82                	lw	t6,0(sp)
    1106:	6121                	addi	sp,sp,64
    1108:	30200073          	mret
    110c:	0001                	nop
	...

00001110 <handler_irq_fast_dma_done>:
{
    1110:	7139                	addi	sp,sp,-64
    1112:	ce3a                	sw	a4,28(sp)
    1114:	cc3e                	sw	a5,24(sp)
    1116:	de06                	sw	ra,60(sp)
    1118:	dc16                	sw	t0,56(sp)
    111a:	da1a                	sw	t1,52(sp)
    111c:	d81e                	sw	t2,48(sp)
    111e:	d62a                	sw	a0,44(sp)
    1120:	d42e                	sw	a1,40(sp)
    1122:	d232                	sw	a2,36(sp)
    1124:	d036                	sw	a3,32(sp)
    1126:	ca42                	sw	a6,20(sp)
    1128:	c846                	sw	a7,16(sp)
    112a:	c672                	sw	t3,12(sp)
    112c:	c476                	sw	t4,8(sp)
    112e:	c27a                	sw	t5,4(sp)
    1130:	c07e                	sw	t6,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    1132:	200607b7          	lui	a5,0x20060
    1136:	4721                	li	a4,8
    1138:	c3d8                	sw	a4,4(a5)
    fic_irq_dma_done();
    113a:	c2cff0ef          	jal	566 <fic_irq_dma_done>
}
    113e:	50f2                	lw	ra,60(sp)
    1140:	52e2                	lw	t0,56(sp)
    1142:	5352                	lw	t1,52(sp)
    1144:	53c2                	lw	t2,48(sp)
    1146:	5532                	lw	a0,44(sp)
    1148:	55a2                	lw	a1,40(sp)
    114a:	5612                	lw	a2,36(sp)
    114c:	5682                	lw	a3,32(sp)
    114e:	4772                	lw	a4,28(sp)
    1150:	47e2                	lw	a5,24(sp)
    1152:	4852                	lw	a6,20(sp)
    1154:	48c2                	lw	a7,16(sp)
    1156:	4e32                	lw	t3,12(sp)
    1158:	4ea2                	lw	t4,8(sp)
    115a:	4f12                	lw	t5,4(sp)
    115c:	4f82                	lw	t6,0(sp)
    115e:	6121                	addi	sp,sp,64
    1160:	30200073          	mret
    1164:	0001                	nop
	...

00001168 <handler_irq_fast_dma_window>:
{
    1168:	7139                	addi	sp,sp,-64
    116a:	ce3a                	sw	a4,28(sp)
    116c:	cc3e                	sw	a5,24(sp)
    116e:	de06                	sw	ra,60(sp)
    1170:	dc16                	sw	t0,56(sp)
    1172:	da1a                	sw	t1,52(sp)
    1174:	d81e                	sw	t2,48(sp)
    1176:	d62a                	sw	a0,44(sp)
    1178:	d42e                	sw	a1,40(sp)
    117a:	d232                	sw	a2,36(sp)
    117c:	d036                	sw	a3,32(sp)
    117e:	ca42                	sw	a6,20(sp)
    1180:	c846                	sw	a7,16(sp)
    1182:	c672                	sw	t3,12(sp)
    1184:	c476                	sw	t4,8(sp)
    1186:	c27a                	sw	t5,4(sp)
    1188:	c07e                	sw	t6,0(sp)
    fast_intr_ctrl_peri->FAST_INTR_CLEAR = reg;
    118a:	200607b7          	lui	a5,0x20060
    118e:	6711                	lui	a4,0x4
    1190:	c3d8                	sw	a4,4(a5)
    fic_irq_dma_window();
    1192:	b80ff0ef          	jal	512 <fic_irq_dma_window>
}
    1196:	50f2                	lw	ra,60(sp)
    1198:	52e2                	lw	t0,56(sp)
    119a:	5352                	lw	t1,52(sp)
    119c:	53c2                	lw	t2,48(sp)
    119e:	5532                	lw	a0,44(sp)
    11a0:	55a2                	lw	a1,40(sp)
    11a2:	5612                	lw	a2,36(sp)
    11a4:	5682                	lw	a3,32(sp)
    11a6:	4772                	lw	a4,28(sp)
    11a8:	47e2                	lw	a5,24(sp)
    11aa:	4852                	lw	a6,20(sp)
    11ac:	48c2                	lw	a7,16(sp)
    11ae:	4e32                	lw	t3,12(sp)
    11b0:	4ea2                	lw	t4,8(sp)
    11b2:	4f12                	lw	t5,4(sp)
    11b4:	4f82                	lw	t6,0(sp)
    11b6:	6121                	addi	sp,sp,64
    11b8:	30200073          	mret
    11bc:	0001                	nop
	...

000011c0 <handler_exception>:
  };
}

// Below functions are default weak exception handlers meant to be overriden
__attribute__((weak)) void handler_exception(void) {
    11c0:	7139                	addi	sp,sp,-64
    11c2:	de06                	sw	ra,60(sp)
    11c4:	dc16                	sw	t0,56(sp)
    11c6:	da1a                	sw	t1,52(sp)
    11c8:	d81e                	sw	t2,48(sp)
    11ca:	d62a                	sw	a0,44(sp)
    11cc:	d42e                	sw	a1,40(sp)
    11ce:	d232                	sw	a2,36(sp)
    11d0:	d036                	sw	a3,32(sp)
    11d2:	ce3a                	sw	a4,28(sp)
    11d4:	cc3e                	sw	a5,24(sp)
    11d6:	ca42                	sw	a6,20(sp)
    11d8:	c846                	sw	a7,16(sp)
    11da:	c672                	sw	t3,12(sp)
    11dc:	c476                	sw	t4,8(sp)
    11de:	c27a                	sw	t5,4(sp)
    11e0:	c07e                	sw	t6,0(sp)
  uint32_t mcause;
  exc_id_t exc_cause;

  CSR_READ(CSR_REG_MCAUSE, &mcause);
    11e2:	342027f3          	csrr	a5,mcause
  exc_cause = (exc_id_t)(mcause & kIdMax);

  switch (exc_cause) {
    11e6:	472d                	li	a4,11
  exc_cause = (exc_id_t)(mcause & kIdMax);
    11e8:	8bfd                	andi	a5,a5,31
  switch (exc_cause) {
    11ea:	00f76963          	bltu	a4,a5,11fc <handler_exception+0x3c>
    11ee:	6729                	lui	a4,0xa
    11f0:	50070713          	addi	a4,a4,1280 # a500 <spi_sdk.c.ee43b428+0x4a0>
    11f4:	20e7c7b3          	sh2add	a5,a5,a4
    11f8:	439c                	lw	a5,0(a5)
    11fa:	8782                	jr	a5
      break;
    case kECall:
      handler_ecall();
      break;
    default:
      while (1) {
    11fc:	a001                	j	11fc <handler_exception+0x3c>
__attribute__((weak)) void handler_bkpt(void) {
  print_exc_msg("Breakpoint triggerd, mtval shows the breakpoint address\n");
}

__attribute__((weak)) void handler_lsu_fault(void) {
  print_exc_msg("Load/Store fault, mtval shows the fault address\n");
    11fe:	652d                	lui	a0,0xb
    1200:	82050513          	addi	a0,a0,-2016 # a820 <__clz_tab+0x224>
    1204:	f42ff0ef          	jal	946 <print_exc_msg>
  print_exc_msg("Instruction access fault, mtval shows fault address\n");
    1208:	6529                	lui	a0,0xa
    120a:	77050513          	addi	a0,a0,1904 # a770 <__clz_tab+0x174>
    120e:	f38ff0ef          	jal	946 <print_exc_msg>
  print_exc_msg( "Illegal Instruction fault, mtval shows instruction content\n");
    1212:	6529                	lui	a0,0xa
    1214:	7a850513          	addi	a0,a0,1960 # a7a8 <__clz_tab+0x1ac>
    1218:	f2eff0ef          	jal	946 <print_exc_msg>
  print_exc_msg("Breakpoint triggerd, mtval shows the breakpoint address\n");
    121c:	6529                	lui	a0,0xa
    121e:	7e450513          	addi	a0,a0,2020 # a7e4 <__clz_tab+0x1e8>
    1222:	f24ff0ef          	jal	946 <print_exc_msg>
}

__attribute__((weak)) void handler_ecall(void) {
  _writestr("Environment call encountered\n");
    1226:	652d                	lui	a0,0xb
    1228:	85450513          	addi	a0,a0,-1964 # a854 <__clz_tab+0x258>
    122c:	f02ff0ef          	jal	92e <_writestr>
  while (1) {
    1230:	a001                	j	1230 <handler_exception+0x70>
	...

00001234 <handler_irq_software>:
__attribute__((weak)) void handler_irq_software(void) {
    1234:	7139                	addi	sp,sp,-64
    1236:	d62a                	sw	a0,44(sp)
  _writestr("Software IRQ triggered!\n"); 
    1238:	652d                	lui	a0,0xb
    123a:	87450513          	addi	a0,a0,-1932 # a874 <__clz_tab+0x278>
__attribute__((weak)) void handler_irq_software(void) {
    123e:	de06                	sw	ra,60(sp)
    1240:	dc16                	sw	t0,56(sp)
    1242:	da1a                	sw	t1,52(sp)
    1244:	d81e                	sw	t2,48(sp)
    1246:	d42e                	sw	a1,40(sp)
    1248:	d232                	sw	a2,36(sp)
    124a:	d036                	sw	a3,32(sp)
    124c:	ce3a                	sw	a4,28(sp)
    124e:	cc3e                	sw	a5,24(sp)
    1250:	ca42                	sw	a6,20(sp)
    1252:	c846                	sw	a7,16(sp)
    1254:	c672                	sw	t3,12(sp)
    1256:	c476                	sw	t4,8(sp)
    1258:	c27a                	sw	t5,4(sp)
    125a:	c07e                	sw	t6,0(sp)
  _writestr("Software IRQ triggered!\n"); 
    125c:	ed2ff0ef          	jal	92e <_writestr>
  while (1) {
    1260:	a001                	j	1260 <handler_irq_software+0x2c>
    1262:	0001                	nop

00001264 <handler_irq_timer>:
__attribute__((weak)) void handler_irq_timer(void) {
    1264:	7139                	addi	sp,sp,-64
    1266:	d62a                	sw	a0,44(sp)
  _writestr("Timer IRQ triggered!\n"); 
    1268:	652d                	lui	a0,0xb
    126a:	89050513          	addi	a0,a0,-1904 # a890 <__clz_tab+0x294>
__attribute__((weak)) void handler_irq_timer(void) {
    126e:	de06                	sw	ra,60(sp)
    1270:	dc16                	sw	t0,56(sp)
    1272:	da1a                	sw	t1,52(sp)
    1274:	d81e                	sw	t2,48(sp)
    1276:	d42e                	sw	a1,40(sp)
    1278:	d232                	sw	a2,36(sp)
    127a:	d036                	sw	a3,32(sp)
    127c:	ce3a                	sw	a4,28(sp)
    127e:	cc3e                	sw	a5,24(sp)
    1280:	ca42                	sw	a6,20(sp)
    1282:	c846                	sw	a7,16(sp)
    1284:	c672                	sw	t3,12(sp)
    1286:	c476                	sw	t4,8(sp)
    1288:	c27a                	sw	t5,4(sp)
    128a:	c07e                	sw	t6,0(sp)
  _writestr("Timer IRQ triggered!\n"); 
    128c:	ea2ff0ef          	jal	92e <_writestr>
  while (1) {
    1290:	a001                	j	1290 <handler_irq_timer+0x2c>
    1292:	0001                	nop

00001294 <init>:
#endif

int init()
{
    return 0;
}
    1294:	4501                	li	a0,0
    1296:	8082                	ret

00001298 <_close>:
}
    1298:	557d                	li	a0,-1
    129a:	8082                	ret

0000129c <_exit>:
  ((volatile uint32_t *)base.base)[offset / sizeof(uint32_t)] = value;
    129c:	200007b7          	lui	a5,0x20000
    12a0:	c3c8                	sw	a0,4(a5)
  ((volatile uint8_t *)base.base)[offset / sizeof(uint8_t)] = value;
    12a2:	4705                	li	a4,1
    12a4:	00e78023          	sb	a4,0(a5) # 20000000 <_sp+0x1fff3a10>
    asm volatile("wfi");
    12a8:	10500073          	wfi

000012ac <_fstat>:
    st->st_mode = S_IFCHR;
    12ac:	6789                	lui	a5,0x2
    12ae:	c1dc                	sw	a5,4(a1)
}
    12b0:	4501                	li	a0,0
    12b2:	8082                	ret

000012b4 <_isatty>:
    return (file == STDOUT_FILENO);
    12b4:	157d                	addi	a0,a0,-1
}
    12b6:	00153513          	seqz	a0,a0
    12ba:	8082                	ret

000012bc <_lseek>:
}
    12bc:	4501                	li	a0,0
    12be:	8082                	ret

000012c0 <_read>:
}
    12c0:	4501                	li	a0,0
    12c2:	8082                	ret

000012c4 <_write_r>:
    return _write(fd,buf,cnt);
    12c4:	852e                	mv	a0,a1
    12c6:	85b2                	mv	a1,a2
    12c8:	8636                	mv	a2,a3
    12ca:	b32ff06f          	j	5fc <_write>

000012ce <_sbrk>:

void *_sbrk(ptrdiff_t incr)
{
    char *old_brk = brk;

    if (__heap_start == __heap_end) {
    12ce:	66b1                	lui	a3,0xc
    12d0:	ba018793          	addi	a5,gp,-1120 # b5e4 <__BSS_END__>
    12d4:	de468693          	addi	a3,a3,-540 # bde4 <__heap_end>
{
    12d8:	872a                	mv	a4,a0
    if (__heap_start == __heap_end) {
    12da:	00d78e63          	beq	a5,a3,12f6 <_sbrk+0x28>
    char *old_brk = brk;
    12de:	9441a503          	lw	a0,-1724(gp) # b388 <brk>
        return NULL; 
    }

    if (brk + incr < __heap_end && brk + incr >= __heap_start) {
    12e2:	972a                	add	a4,a4,a0
    12e4:	00f76763          	bltu	a4,a5,12f2 <_sbrk+0x24>
    12e8:	00d77563          	bgeu	a4,a3,12f2 <_sbrk+0x24>
        brk += incr;
    12ec:	94e1a223          	sw	a4,-1724(gp) # b388 <brk>
    } else {
        return (void *)-1; 
    }
    return old_brk;
    12f0:	8082                	ret
        return (void *)-1; 
    12f2:	557d                	li	a0,-1
}
    12f4:	8082                	ret
        return NULL; 
    12f6:	4501                	li	a0,0
    12f8:	8082                	ret

000012fa <atexit>:
    12fa:	85aa                	mv	a1,a0
    12fc:	4681                	li	a3,0
    12fe:	4601                	li	a2,0
    1300:	4501                	li	a0,0
    1302:	ae0d                	j	1634 <__register_exitproc>

00001304 <std>:
    1304:	1141                	addi	sp,sp,-16
    1306:	c422                	sw	s0,8(sp)
    1308:	c606                	sw	ra,12(sp)
    130a:	842a                	mv	s0,a0
    130c:	00b51623          	sh	a1,12(a0)
    1310:	00c51723          	sh	a2,14(a0)
    1314:	00052023          	sw	zero,0(a0)
    1318:	00052223          	sw	zero,4(a0)
    131c:	00052423          	sw	zero,8(a0)
    1320:	06052223          	sw	zero,100(a0)
    1324:	00052823          	sw	zero,16(a0)
    1328:	00052a23          	sw	zero,20(a0)
    132c:	00052c23          	sw	zero,24(a0)
    1330:	4621                	li	a2,8
    1332:	4581                	li	a1,0
    1334:	05c50513          	addi	a0,a0,92
    1338:	24f5                	jal	1624 <memset>
    133a:	6785                	lui	a5,0x1
    133c:	45878793          	addi	a5,a5,1112 # 1458 <__sread>
    1340:	d05c                	sw	a5,36(s0)
    1342:	6785                	lui	a5,0x1
    1344:	48878793          	addi	a5,a5,1160 # 1488 <__swrite>
    1348:	d41c                	sw	a5,40(s0)
    134a:	6785                	lui	a5,0x1
    134c:	4d678793          	addi	a5,a5,1238 # 14d6 <__sseek>
    1350:	d45c                	sw	a5,44(s0)
    1352:	6785                	lui	a5,0x1
    1354:	51078793          	addi	a5,a5,1296 # 1510 <__sclose>
    1358:	40b2                	lw	ra,12(sp)
    135a:	d000                	sw	s0,32(s0)
    135c:	d81c                	sw	a5,48(s0)
    135e:	4422                	lw	s0,8(sp)
    1360:	0141                	addi	sp,sp,16
    1362:	8082                	ret

00001364 <stdio_exit_handler>:
    1364:	6589                	lui	a1,0x2
    1366:	8d818613          	addi	a2,gp,-1832 # b31c <__sglue>
    136a:	a9058593          	addi	a1,a1,-1392 # 1a90 <_fflush_r>
    136e:	8e418513          	addi	a0,gp,-1820 # b328 <_impure_data>
    1372:	a059                	j	13f8 <_fwalk_sglue>

00001374 <cleanup_stdio>:
    1374:	414c                	lw	a1,4(a0)
    1376:	1141                	addi	sp,sp,-16
    1378:	c422                	sw	s0,8(sp)
    137a:	c606                	sw	ra,12(sp)
    137c:	9a018793          	addi	a5,gp,-1632 # b3e4 <__sf>
    1380:	842a                	mv	s0,a0
    1382:	00f58363          	beq	a1,a5,1388 <cleanup_stdio+0x14>
    1386:	2729                	jal	1a90 <_fflush_r>
    1388:	440c                	lw	a1,8(s0)
    138a:	a0818793          	addi	a5,gp,-1528 # b44c <__sf+0x68>
    138e:	00f58463          	beq	a1,a5,1396 <cleanup_stdio+0x22>
    1392:	8522                	mv	a0,s0
    1394:	2df5                	jal	1a90 <_fflush_r>
    1396:	444c                	lw	a1,12(s0)
    1398:	a7018793          	addi	a5,gp,-1424 # b4b4 <__sf+0xd0>
    139c:	00f58763          	beq	a1,a5,13aa <cleanup_stdio+0x36>
    13a0:	8522                	mv	a0,s0
    13a2:	4422                	lw	s0,8(sp)
    13a4:	40b2                	lw	ra,12(sp)
    13a6:	0141                	addi	sp,sp,16
    13a8:	a5e5                	j	1a90 <_fflush_r>
    13aa:	40b2                	lw	ra,12(sp)
    13ac:	4422                	lw	s0,8(sp)
    13ae:	0141                	addi	sp,sp,16
    13b0:	8082                	ret

000013b2 <global_stdio_init.part.0>:
    13b2:	6785                	lui	a5,0x1
    13b4:	1141                	addi	sp,sp,-16
    13b6:	36478793          	addi	a5,a5,868 # 1364 <stdio_exit_handler>
    13ba:	4601                	li	a2,0
    13bc:	4591                	li	a1,4
    13be:	9a018513          	addi	a0,gp,-1632 # b3e4 <__sf>
    13c2:	c606                	sw	ra,12(sp)
    13c4:	94f1a623          	sw	a5,-1716(gp) # b390 <__stdio_exit_handler>
    13c8:	3f35                	jal	1304 <std>
    13ca:	4605                	li	a2,1
    13cc:	45a5                	li	a1,9
    13ce:	a0818513          	addi	a0,gp,-1528 # b44c <__sf+0x68>
    13d2:	3f0d                	jal	1304 <std>
    13d4:	40b2                	lw	ra,12(sp)
    13d6:	4609                	li	a2,2
    13d8:	45c9                	li	a1,18
    13da:	a7018513          	addi	a0,gp,-1424 # b4b4 <__sf+0xd0>
    13de:	0141                	addi	sp,sp,16
    13e0:	b715                	j	1304 <std>

000013e2 <__sinit>:
    13e2:	511c                	lw	a5,32(a0)
    13e4:	eb89                	bnez	a5,13f6 <__sinit+0x14>
    13e6:	6785                	lui	a5,0x1
    13e8:	37478793          	addi	a5,a5,884 # 1374 <cleanup_stdio>
    13ec:	d11c                	sw	a5,32(a0)
    13ee:	94c1a783          	lw	a5,-1716(gp) # b390 <__stdio_exit_handler>
    13f2:	e391                	bnez	a5,13f6 <__sinit+0x14>
    13f4:	bf7d                	j	13b2 <global_stdio_init.part.0>
    13f6:	8082                	ret

000013f8 <_fwalk_sglue>:
    13f8:	7179                	addi	sp,sp,-48
    13fa:	d422                	sw	s0,40(sp)
    13fc:	d04a                	sw	s2,32(sp)
    13fe:	ce4e                	sw	s3,28(sp)
    1400:	cc52                	sw	s4,24(sp)
    1402:	ca56                	sw	s5,20(sp)
    1404:	d606                	sw	ra,44(sp)
    1406:	d226                	sw	s1,36(sp)
    1408:	8a2a                	mv	s4,a0
    140a:	8aae                	mv	s5,a1
    140c:	4401                	li	s0,0
    140e:	4905                	li	s2,1
    1410:	59fd                	li	s3,-1
    1412:	460c                	lw	a1,8(a2)
    1414:	4244                	lw	s1,4(a2)
    1416:	14fd                	addi	s1,s1,-1
    1418:	0004de63          	bgez	s1,1434 <_fwalk_sglue+0x3c>
    141c:	4210                	lw	a2,0(a2)
    141e:	fa75                	bnez	a2,1412 <_fwalk_sglue+0x1a>
    1420:	50b2                	lw	ra,44(sp)
    1422:	8522                	mv	a0,s0
    1424:	5422                	lw	s0,40(sp)
    1426:	5492                	lw	s1,36(sp)
    1428:	5902                	lw	s2,32(sp)
    142a:	49f2                	lw	s3,28(sp)
    142c:	4a62                	lw	s4,24(sp)
    142e:	4ad2                	lw	s5,20(sp)
    1430:	6145                	addi	sp,sp,48
    1432:	8082                	ret
    1434:	00c5d783          	lhu	a5,12(a1)
    1438:	00f97d63          	bgeu	s2,a5,1452 <_fwalk_sglue+0x5a>
    143c:	00e59783          	lh	a5,14(a1)
    1440:	01378963          	beq	a5,s3,1452 <_fwalk_sglue+0x5a>
    1444:	8552                	mv	a0,s4
    1446:	c632                	sw	a2,12(sp)
    1448:	c42e                	sw	a1,8(sp)
    144a:	9a82                	jalr	s5
    144c:	4632                	lw	a2,12(sp)
    144e:	45a2                	lw	a1,8(sp)
    1450:	8c49                	or	s0,s0,a0
    1452:	06858593          	addi	a1,a1,104
    1456:	b7c1                	j	1416 <_fwalk_sglue+0x1e>

00001458 <__sread>:
    1458:	1141                	addi	sp,sp,-16
    145a:	c422                	sw	s0,8(sp)
    145c:	842e                	mv	s0,a1
    145e:	00e59583          	lh	a1,14(a1)
    1462:	c606                	sw	ra,12(sp)
    1464:	2229                	jal	156e <_read_r>
    1466:	00054963          	bltz	a0,1478 <__sread+0x20>
    146a:	487c                	lw	a5,84(s0)
    146c:	97aa                	add	a5,a5,a0
    146e:	c87c                	sw	a5,84(s0)
    1470:	40b2                	lw	ra,12(sp)
    1472:	4422                	lw	s0,8(sp)
    1474:	0141                	addi	sp,sp,16
    1476:	8082                	ret
    1478:	00c45783          	lhu	a5,12(s0)
    147c:	777d                	lui	a4,0xfffff
    147e:	177d                	addi	a4,a4,-1 # ffffefff <_sp+0xffff2a0f>
    1480:	8ff9                	and	a5,a5,a4
    1482:	00f41623          	sh	a5,12(s0)
    1486:	b7ed                	j	1470 <__sread+0x18>

00001488 <__swrite>:
    1488:	00c5d783          	lhu	a5,12(a1)
    148c:	1101                	addi	sp,sp,-32
    148e:	cc22                	sw	s0,24(sp)
    1490:	ca26                	sw	s1,20(sp)
    1492:	c84a                	sw	s2,16(sp)
    1494:	c64e                	sw	s3,12(sp)
    1496:	ce06                	sw	ra,28(sp)
    1498:	1007f793          	andi	a5,a5,256
    149c:	84aa                	mv	s1,a0
    149e:	842e                	mv	s0,a1
    14a0:	8932                	mv	s2,a2
    14a2:	89b6                	mv	s3,a3
    14a4:	c791                	beqz	a5,14b0 <__swrite+0x28>
    14a6:	00e59583          	lh	a1,14(a1)
    14aa:	4689                	li	a3,2
    14ac:	4601                	li	a2,0
    14ae:	2849                	jal	1540 <_lseek_r>
    14b0:	00c45783          	lhu	a5,12(s0)
    14b4:	777d                	lui	a4,0xfffff
    14b6:	177d                	addi	a4,a4,-1 # ffffefff <_sp+0xffff2a0f>
    14b8:	8ff9                	and	a5,a5,a4
    14ba:	00e41583          	lh	a1,14(s0)
    14be:	00f41623          	sh	a5,12(s0)
    14c2:	4462                	lw	s0,24(sp)
    14c4:	40f2                	lw	ra,28(sp)
    14c6:	86ce                	mv	a3,s3
    14c8:	864a                	mv	a2,s2
    14ca:	49b2                	lw	s3,12(sp)
    14cc:	4942                	lw	s2,16(sp)
    14ce:	8526                	mv	a0,s1
    14d0:	44d2                	lw	s1,20(sp)
    14d2:	6105                	addi	sp,sp,32
    14d4:	bbc5                	j	12c4 <_write_r>

000014d6 <__sseek>:
    14d6:	1141                	addi	sp,sp,-16
    14d8:	c422                	sw	s0,8(sp)
    14da:	842e                	mv	s0,a1
    14dc:	00e59583          	lh	a1,14(a1)
    14e0:	c606                	sw	ra,12(sp)
    14e2:	28b9                	jal	1540 <_lseek_r>
    14e4:	577d                	li	a4,-1
    14e6:	00c41783          	lh	a5,12(s0)
    14ea:	00e51d63          	bne	a0,a4,1504 <__sseek+0x2e>
    14ee:	80050713          	addi	a4,a0,-2048
    14f2:	80070713          	addi	a4,a4,-2048
    14f6:	8ff9                	and	a5,a5,a4
    14f8:	00f41623          	sh	a5,12(s0)
    14fc:	40b2                	lw	ra,12(sp)
    14fe:	4422                	lw	s0,8(sp)
    1500:	0141                	addi	sp,sp,16
    1502:	8082                	ret
    1504:	6705                	lui	a4,0x1
    1506:	8fd9                	or	a5,a5,a4
    1508:	00f41623          	sh	a5,12(s0)
    150c:	c868                	sw	a0,84(s0)
    150e:	b7fd                	j	14fc <__sseek+0x26>

00001510 <__sclose>:
    1510:	00e59583          	lh	a1,14(a1)
    1514:	a009                	j	1516 <_close_r>

00001516 <_close_r>:
    1516:	1141                	addi	sp,sp,-16
    1518:	c422                	sw	s0,8(sp)
    151a:	c226                	sw	s1,4(sp)
    151c:	84aa                	mv	s1,a0
    151e:	852e                	mv	a0,a1
    1520:	c606                	sw	ra,12(sp)
    1522:	9401a823          	sw	zero,-1712(gp) # b394 <errno>
    1526:	3b8d                	jal	1298 <_close>
    1528:	57fd                	li	a5,-1
    152a:	00f51663          	bne	a0,a5,1536 <_close_r+0x20>
    152e:	9501a783          	lw	a5,-1712(gp) # b394 <errno>
    1532:	c391                	beqz	a5,1536 <_close_r+0x20>
    1534:	c09c                	sw	a5,0(s1)
    1536:	40b2                	lw	ra,12(sp)
    1538:	4422                	lw	s0,8(sp)
    153a:	4492                	lw	s1,4(sp)
    153c:	0141                	addi	sp,sp,16
    153e:	8082                	ret

00001540 <_lseek_r>:
    1540:	1141                	addi	sp,sp,-16
    1542:	c422                	sw	s0,8(sp)
    1544:	c226                	sw	s1,4(sp)
    1546:	84aa                	mv	s1,a0
    1548:	852e                	mv	a0,a1
    154a:	85b2                	mv	a1,a2
    154c:	8636                	mv	a2,a3
    154e:	c606                	sw	ra,12(sp)
    1550:	9401a823          	sw	zero,-1712(gp) # b394 <errno>
    1554:	33a5                	jal	12bc <_lseek>
    1556:	57fd                	li	a5,-1
    1558:	00f51663          	bne	a0,a5,1564 <_lseek_r+0x24>
    155c:	9501a783          	lw	a5,-1712(gp) # b394 <errno>
    1560:	c391                	beqz	a5,1564 <_lseek_r+0x24>
    1562:	c09c                	sw	a5,0(s1)
    1564:	40b2                	lw	ra,12(sp)
    1566:	4422                	lw	s0,8(sp)
    1568:	4492                	lw	s1,4(sp)
    156a:	0141                	addi	sp,sp,16
    156c:	8082                	ret

0000156e <_read_r>:
    156e:	1141                	addi	sp,sp,-16
    1570:	c422                	sw	s0,8(sp)
    1572:	c226                	sw	s1,4(sp)
    1574:	84aa                	mv	s1,a0
    1576:	852e                	mv	a0,a1
    1578:	85b2                	mv	a1,a2
    157a:	8636                	mv	a2,a3
    157c:	c606                	sw	ra,12(sp)
    157e:	9401a823          	sw	zero,-1712(gp) # b394 <errno>
    1582:	3b3d                	jal	12c0 <_read>
    1584:	57fd                	li	a5,-1
    1586:	00f51663          	bne	a0,a5,1592 <_read_r+0x24>
    158a:	9501a783          	lw	a5,-1712(gp) # b394 <errno>
    158e:	c391                	beqz	a5,1592 <_read_r+0x24>
    1590:	c09c                	sw	a5,0(s1)
    1592:	40b2                	lw	ra,12(sp)
    1594:	4422                	lw	s0,8(sp)
    1596:	4492                	lw	s1,4(sp)
    1598:	0141                	addi	sp,sp,16
    159a:	8082                	ret

0000159c <__libc_init_array>:
    159c:	1141                	addi	sp,sp,-16
    159e:	c422                	sw	s0,8(sp)
    15a0:	c226                	sw	s1,4(sp)
    15a2:	642d                	lui	s0,0xb
    15a4:	64ad                	lui	s1,0xb
    15a6:	24440413          	addi	s0,s0,580 # b244 <peripherals>
    15aa:	24448493          	addi	s1,s1,580 # b244 <peripherals>
    15ae:	8c81                	sub	s1,s1,s0
    15b0:	c04a                	sw	s2,0(sp)
    15b2:	c606                	sw	ra,12(sp)
    15b4:	8489                	srai	s1,s1,0x2
    15b6:	4901                	li	s2,0
    15b8:	02991363          	bne	s2,s1,15de <__libc_init_array+0x42>
    15bc:	642d                	lui	s0,0xb
    15be:	64ad                	lui	s1,0xb
    15c0:	24440413          	addi	s0,s0,580 # b244 <peripherals>
    15c4:	24448493          	addi	s1,s1,580 # b244 <peripherals>
    15c8:	8c81                	sub	s1,s1,s0
    15ca:	8489                	srai	s1,s1,0x2
    15cc:	4901                	li	s2,0
    15ce:	00991d63          	bne	s2,s1,15e8 <__libc_init_array+0x4c>
    15d2:	40b2                	lw	ra,12(sp)
    15d4:	4422                	lw	s0,8(sp)
    15d6:	4492                	lw	s1,4(sp)
    15d8:	4902                	lw	s2,0(sp)
    15da:	0141                	addi	sp,sp,16
    15dc:	8082                	ret
    15de:	401c                	lw	a5,0(s0)
    15e0:	0905                	addi	s2,s2,1
    15e2:	0411                	addi	s0,s0,4
    15e4:	9782                	jalr	a5
    15e6:	bfc9                	j	15b8 <__libc_init_array+0x1c>
    15e8:	401c                	lw	a5,0(s0)
    15ea:	0905                	addi	s2,s2,1
    15ec:	0411                	addi	s0,s0,4
    15ee:	9782                	jalr	a5
    15f0:	bff9                	j	15ce <__libc_init_array+0x32>

000015f2 <__libc_fini_array>:
    15f2:	1141                	addi	sp,sp,-16
    15f4:	c422                	sw	s0,8(sp)
    15f6:	c226                	sw	s1,4(sp)
    15f8:	642d                	lui	s0,0xb
    15fa:	64ad                	lui	s1,0xb
    15fc:	24448493          	addi	s1,s1,580 # b244 <peripherals>
    1600:	24440413          	addi	s0,s0,580 # b244 <peripherals>
    1604:	8c05                	sub	s0,s0,s1
    1606:	c606                	sw	ra,12(sp)
    1608:	8409                	srai	s0,s0,0x2
    160a:	e411                	bnez	s0,1616 <__libc_fini_array+0x24>
    160c:	40b2                	lw	ra,12(sp)
    160e:	4422                	lw	s0,8(sp)
    1610:	4492                	lw	s1,4(sp)
    1612:	0141                	addi	sp,sp,16
    1614:	8082                	ret
    1616:	147d                	addi	s0,s0,-1
    1618:	00241793          	slli	a5,s0,0x2
    161c:	97a6                	add	a5,a5,s1
    161e:	439c                	lw	a5,0(a5)
    1620:	9782                	jalr	a5
    1622:	b7e5                	j	160a <__libc_fini_array+0x18>

00001624 <memset>:
    1624:	832a                	mv	t1,a0
    1626:	c611                	beqz	a2,1632 <memset+0xe>
    1628:	00b30023          	sb	a1,0(t1)
    162c:	167d                	addi	a2,a2,-1
    162e:	0305                	addi	t1,t1,1
    1630:	fe65                	bnez	a2,1628 <memset+0x4>
    1632:	8082                	ret

00001634 <__register_exitproc>:
    1634:	9541a783          	lw	a5,-1708(gp) # b398 <__atexit>
    1638:	8e2a                	mv	t3,a0
    163a:	ef81                	bnez	a5,1652 <__register_exitproc+0x1e>
    163c:	ad818793          	addi	a5,gp,-1320 # b51c <__atexit0>
    1640:	94f1aa23          	sw	a5,-1708(gp) # b398 <__atexit>
    1644:	00000513          	li	a0,0
    1648:	c509                	beqz	a0,1652 <__register_exitproc+0x1e>
    164a:	00002703          	lw	a4,0(zero) # 0 <__vector_start>
    164e:	08e7a423          	sw	a4,136(a5)
    1652:	43d8                	lw	a4,4(a5)
    1654:	487d                	li	a6,31
    1656:	557d                	li	a0,-1
    1658:	04e84763          	blt	a6,a4,16a6 <__register_exitproc+0x72>
    165c:	020e0e63          	beqz	t3,1698 <__register_exitproc+0x64>
    1660:	0887a803          	lw	a6,136(a5)
    1664:	04080163          	beqz	a6,16a6 <__register_exitproc+0x72>
    1668:	00271893          	slli	a7,a4,0x2
    166c:	98c2                	add	a7,a7,a6
    166e:	00c8a023          	sw	a2,0(a7)
    1672:	10082303          	lw	t1,256(a6)
    1676:	4605                	li	a2,1
    1678:	00e61633          	sll	a2,a2,a4
    167c:	00c36333          	or	t1,t1,a2
    1680:	10682023          	sw	t1,256(a6)
    1684:	08d8a023          	sw	a3,128(a7)
    1688:	4689                	li	a3,2
    168a:	00de1763          	bne	t3,a3,1698 <__register_exitproc+0x64>
    168e:	10482683          	lw	a3,260(a6)
    1692:	8ed1                	or	a3,a3,a2
    1694:	10d82223          	sw	a3,260(a6)
    1698:	00170693          	addi	a3,a4,1 # 1001 <handler_irq_fast_gpio_4+0x55>
    169c:	070a                	slli	a4,a4,0x2
    169e:	c3d4                	sw	a3,4(a5)
    16a0:	97ba                	add	a5,a5,a4
    16a2:	c78c                	sw	a1,8(a5)
    16a4:	4501                	li	a0,0
    16a6:	8082                	ret

000016a8 <__call_exitprocs>:
    16a8:	7179                	addi	sp,sp,-48
    16aa:	ca56                	sw	s5,20(sp)
    16ac:	c85a                	sw	s6,16(sp)
    16ae:	c65e                	sw	s7,12(sp)
    16b0:	c266                	sw	s9,4(sp)
    16b2:	d606                	sw	ra,44(sp)
    16b4:	d422                	sw	s0,40(sp)
    16b6:	d226                	sw	s1,36(sp)
    16b8:	d04a                	sw	s2,32(sp)
    16ba:	ce4e                	sw	s3,28(sp)
    16bc:	cc52                	sw	s4,24(sp)
    16be:	c462                	sw	s8,8(sp)
    16c0:	8caa                	mv	s9,a0
    16c2:	8b2e                	mv	s6,a1
    16c4:	4b85                	li	s7,1
    16c6:	9541a483          	lw	s1,-1708(gp) # b398 <__atexit>
    16ca:	cc81                	beqz	s1,16e2 <__call_exitprocs+0x3a>
    16cc:	40c0                	lw	s0,4(s1)
    16ce:	0884a983          	lw	s3,136(s1)
    16d2:	fff40913          	addi	s2,s0,-1
    16d6:	040a                	slli	s0,s0,0x2
    16d8:	00898a33          	add	s4,s3,s0
    16dc:	9426                	add	s0,s0,s1
    16de:	00095f63          	bgez	s2,16fc <__call_exitprocs+0x54>
    16e2:	50b2                	lw	ra,44(sp)
    16e4:	5422                	lw	s0,40(sp)
    16e6:	5492                	lw	s1,36(sp)
    16e8:	5902                	lw	s2,32(sp)
    16ea:	49f2                	lw	s3,28(sp)
    16ec:	4a62                	lw	s4,24(sp)
    16ee:	4ad2                	lw	s5,20(sp)
    16f0:	4b42                	lw	s6,16(sp)
    16f2:	4bb2                	lw	s7,12(sp)
    16f4:	4c22                	lw	s8,8(sp)
    16f6:	4c92                	lw	s9,4(sp)
    16f8:	6145                	addi	sp,sp,48
    16fa:	8082                	ret
    16fc:	000b0c63          	beqz	s6,1714 <__call_exitprocs+0x6c>
    1700:	00099663          	bnez	s3,170c <__call_exitprocs+0x64>
    1704:	197d                	addi	s2,s2,-1
    1706:	1a71                	addi	s4,s4,-4
    1708:	1471                	addi	s0,s0,-4
    170a:	bfd1                	j	16de <__call_exitprocs+0x36>
    170c:	07ca2783          	lw	a5,124(s4)
    1710:	ff679ae3          	bne	a5,s6,1704 <__call_exitprocs+0x5c>
    1714:	40d8                	lw	a4,4(s1)
    1716:	405c                	lw	a5,4(s0)
    1718:	177d                	addi	a4,a4,-1
    171a:	03271863          	bne	a4,s2,174a <__call_exitprocs+0xa2>
    171e:	0124a223          	sw	s2,4(s1)
    1722:	d3ed                	beqz	a5,1704 <__call_exitprocs+0x5c>
    1724:	0044ac03          	lw	s8,4(s1)
    1728:	00098863          	beqz	s3,1738 <__call_exitprocs+0x90>
    172c:	1009a683          	lw	a3,256(s3)
    1730:	012b9733          	sll	a4,s7,s2
    1734:	8ef9                	and	a3,a3,a4
    1736:	ee89                	bnez	a3,1750 <__call_exitprocs+0xa8>
    1738:	9782                	jalr	a5
    173a:	40dc                	lw	a5,4(s1)
    173c:	f98795e3          	bne	a5,s8,16c6 <__call_exitprocs+0x1e>
    1740:	9541a783          	lw	a5,-1708(gp) # b398 <__atexit>
    1744:	fcf480e3          	beq	s1,a5,1704 <__call_exitprocs+0x5c>
    1748:	bfbd                	j	16c6 <__call_exitprocs+0x1e>
    174a:	00042223          	sw	zero,4(s0)
    174e:	bfd1                	j	1722 <__call_exitprocs+0x7a>
    1750:	1049a683          	lw	a3,260(s3)
    1754:	ffca2583          	lw	a1,-4(s4)
    1758:	8f75                	and	a4,a4,a3
    175a:	e701                	bnez	a4,1762 <__call_exitprocs+0xba>
    175c:	8566                	mv	a0,s9
    175e:	9782                	jalr	a5
    1760:	bfe9                	j	173a <__call_exitprocs+0x92>
    1762:	852e                	mv	a0,a1
    1764:	9782                	jalr	a5
    1766:	bfd1                	j	173a <__call_exitprocs+0x92>

00001768 <_free_r>:
    1768:	cdd1                	beqz	a1,1804 <_free_r+0x9c>
    176a:	ffc5a783          	lw	a5,-4(a1)
    176e:	1101                	addi	sp,sp,-32
    1770:	cc22                	sw	s0,24(sp)
    1772:	ce06                	sw	ra,28(sp)
    1774:	ffc58413          	addi	s0,a1,-4
    1778:	0007d363          	bgez	a5,177e <_free_r+0x16>
    177c:	943e                	add	s0,s0,a5
    177e:	c62a                	sw	a0,12(sp)
    1780:	22e5                	jal	1968 <__malloc_lock>
    1782:	95c1a783          	lw	a5,-1700(gp) # b3a0 <__malloc_free_list>
    1786:	4532                	lw	a0,12(sp)
    1788:	eb89                	bnez	a5,179a <_free_r+0x32>
    178a:	00042223          	sw	zero,4(s0)
    178e:	9481ae23          	sw	s0,-1700(gp) # b3a0 <__malloc_free_list>
    1792:	4462                	lw	s0,24(sp)
    1794:	40f2                	lw	ra,28(sp)
    1796:	6105                	addi	sp,sp,32
    1798:	aac9                	j	196a <__malloc_unlock>
    179a:	00f47d63          	bgeu	s0,a5,17b4 <_free_r+0x4c>
    179e:	4010                	lw	a2,0(s0)
    17a0:	00c406b3          	add	a3,s0,a2
    17a4:	00d79663          	bne	a5,a3,17b0 <_free_r+0x48>
    17a8:	4394                	lw	a3,0(a5)
    17aa:	43dc                	lw	a5,4(a5)
    17ac:	96b2                	add	a3,a3,a2
    17ae:	c014                	sw	a3,0(s0)
    17b0:	c05c                	sw	a5,4(s0)
    17b2:	bff1                	j	178e <_free_r+0x26>
    17b4:	873e                	mv	a4,a5
    17b6:	43dc                	lw	a5,4(a5)
    17b8:	c399                	beqz	a5,17be <_free_r+0x56>
    17ba:	fef47de3          	bgeu	s0,a5,17b4 <_free_r+0x4c>
    17be:	4314                	lw	a3,0(a4)
    17c0:	00d70633          	add	a2,a4,a3
    17c4:	00861f63          	bne	a2,s0,17e2 <_free_r+0x7a>
    17c8:	4010                	lw	a2,0(s0)
    17ca:	96b2                	add	a3,a3,a2
    17cc:	c314                	sw	a3,0(a4)
    17ce:	00d70633          	add	a2,a4,a3
    17d2:	fcc790e3          	bne	a5,a2,1792 <_free_r+0x2a>
    17d6:	4390                	lw	a2,0(a5)
    17d8:	43dc                	lw	a5,4(a5)
    17da:	96b2                	add	a3,a3,a2
    17dc:	c314                	sw	a3,0(a4)
    17de:	c35c                	sw	a5,4(a4)
    17e0:	bf4d                	j	1792 <_free_r+0x2a>
    17e2:	00c47563          	bgeu	s0,a2,17ec <_free_r+0x84>
    17e6:	47b1                	li	a5,12
    17e8:	c11c                	sw	a5,0(a0)
    17ea:	b765                	j	1792 <_free_r+0x2a>
    17ec:	4010                	lw	a2,0(s0)
    17ee:	00c406b3          	add	a3,s0,a2
    17f2:	00d79663          	bne	a5,a3,17fe <_free_r+0x96>
    17f6:	4394                	lw	a3,0(a5)
    17f8:	43dc                	lw	a5,4(a5)
    17fa:	96b2                	add	a3,a3,a2
    17fc:	c014                	sw	a3,0(s0)
    17fe:	c05c                	sw	a5,4(s0)
    1800:	c340                	sw	s0,4(a4)
    1802:	bf41                	j	1792 <_free_r+0x2a>
    1804:	8082                	ret

00001806 <sbrk_aligned>:
    1806:	1141                	addi	sp,sp,-16
    1808:	c422                	sw	s0,8(sp)
    180a:	9581a783          	lw	a5,-1704(gp) # b39c <__malloc_sbrk_start>
    180e:	c226                	sw	s1,4(sp)
    1810:	c04a                	sw	s2,0(sp)
    1812:	c606                	sw	ra,12(sp)
    1814:	892a                	mv	s2,a0
    1816:	84ae                	mv	s1,a1
    1818:	e789                	bnez	a5,1822 <sbrk_aligned+0x1c>
    181a:	4581                	li	a1,0
    181c:	246d                	jal	1ac6 <_sbrk_r>
    181e:	94a1ac23          	sw	a0,-1704(gp) # b39c <__malloc_sbrk_start>
    1822:	85a6                	mv	a1,s1
    1824:	854a                	mv	a0,s2
    1826:	2445                	jal	1ac6 <_sbrk_r>
    1828:	54fd                	li	s1,-1
    182a:	00951a63          	bne	a0,s1,183e <sbrk_aligned+0x38>
    182e:	547d                	li	s0,-1
    1830:	40b2                	lw	ra,12(sp)
    1832:	8522                	mv	a0,s0
    1834:	4422                	lw	s0,8(sp)
    1836:	4492                	lw	s1,4(sp)
    1838:	4902                	lw	s2,0(sp)
    183a:	0141                	addi	sp,sp,16
    183c:	8082                	ret
    183e:	00350413          	addi	s0,a0,3
    1842:	9871                	andi	s0,s0,-4
    1844:	fe8506e3          	beq	a0,s0,1830 <sbrk_aligned+0x2a>
    1848:	40a405b3          	sub	a1,s0,a0
    184c:	854a                	mv	a0,s2
    184e:	2ca5                	jal	1ac6 <_sbrk_r>
    1850:	fe9510e3          	bne	a0,s1,1830 <sbrk_aligned+0x2a>
    1854:	bfe9                	j	182e <sbrk_aligned+0x28>

00001856 <_malloc_r>:
    1856:	1101                	addi	sp,sp,-32
    1858:	ca26                	sw	s1,20(sp)
    185a:	00358493          	addi	s1,a1,3
    185e:	98f1                	andi	s1,s1,-4
    1860:	ce06                	sw	ra,28(sp)
    1862:	cc22                	sw	s0,24(sp)
    1864:	c84a                	sw	s2,16(sp)
    1866:	c64e                	sw	s3,12(sp)
    1868:	c452                	sw	s4,8(sp)
    186a:	04a1                	addi	s1,s1,8
    186c:	47b1                	li	a5,12
    186e:	00f4f363          	bgeu	s1,a5,1874 <_malloc_r+0x1e>
    1872:	84be                	mv	s1,a5
    1874:	0004c463          	bltz	s1,187c <_malloc_r+0x26>
    1878:	00b4fd63          	bgeu	s1,a1,1892 <_malloc_r+0x3c>
    187c:	47b1                	li	a5,12
    187e:	c11c                	sw	a5,0(a0)
    1880:	4501                	li	a0,0
    1882:	40f2                	lw	ra,28(sp)
    1884:	4462                	lw	s0,24(sp)
    1886:	44d2                	lw	s1,20(sp)
    1888:	4942                	lw	s2,16(sp)
    188a:	49b2                	lw	s3,12(sp)
    188c:	4a22                	lw	s4,8(sp)
    188e:	6105                	addi	sp,sp,32
    1890:	8082                	ret
    1892:	892a                	mv	s2,a0
    1894:	28d1                	jal	1968 <__malloc_lock>
    1896:	95c1a783          	lw	a5,-1700(gp) # b3a0 <__malloc_free_list>
    189a:	843e                	mv	s0,a5
    189c:	e439                	bnez	s0,18ea <_malloc_r+0x94>
    189e:	85a6                	mv	a1,s1
    18a0:	854a                	mv	a0,s2
    18a2:	3795                	jal	1806 <sbrk_aligned>
    18a4:	57fd                	li	a5,-1
    18a6:	842a                	mv	s0,a0
    18a8:	0af51e63          	bne	a0,a5,1964 <_malloc_r+0x10e>
    18ac:	95c1a403          	lw	s0,-1700(gp) # b3a0 <__malloc_free_list>
    18b0:	87a2                	mv	a5,s0
    18b2:	ebc9                	bnez	a5,1944 <_malloc_r+0xee>
    18b4:	c055                	beqz	s0,1958 <_malloc_r+0x102>
    18b6:	00042a03          	lw	s4,0(s0)
    18ba:	4581                	li	a1,0
    18bc:	854a                	mv	a0,s2
    18be:	9a22                	add	s4,s4,s0
    18c0:	2419                	jal	1ac6 <_sbrk_r>
    18c2:	08aa1b63          	bne	s4,a0,1958 <_malloc_r+0x102>
    18c6:	401c                	lw	a5,0(s0)
    18c8:	854a                	mv	a0,s2
    18ca:	8c9d                	sub	s1,s1,a5
    18cc:	85a6                	mv	a1,s1
    18ce:	3f25                	jal	1806 <sbrk_aligned>
    18d0:	57fd                	li	a5,-1
    18d2:	08f50363          	beq	a0,a5,1958 <_malloc_r+0x102>
    18d6:	401c                	lw	a5,0(s0)
    18d8:	97a6                	add	a5,a5,s1
    18da:	c01c                	sw	a5,0(s0)
    18dc:	95c1a783          	lw	a5,-1700(gp) # b3a0 <__malloc_free_list>
    18e0:	43d8                	lw	a4,4(a5)
    18e2:	e725                	bnez	a4,194a <_malloc_r+0xf4>
    18e4:	9401ae23          	sw	zero,-1700(gp) # b3a0 <__malloc_free_list>
    18e8:	a015                	j	190c <_malloc_r+0xb6>
    18ea:	4014                	lw	a3,0(s0)
    18ec:	8e85                	sub	a3,a3,s1
    18ee:	0406c863          	bltz	a3,193e <_malloc_r+0xe8>
    18f2:	472d                	li	a4,11
    18f4:	02d77d63          	bgeu	a4,a3,192e <_malloc_r+0xd8>
    18f8:	c004                	sw	s1,0(s0)
    18fa:	00940733          	add	a4,s0,s1
    18fe:	02879663          	bne	a5,s0,192a <_malloc_r+0xd4>
    1902:	94e1ae23          	sw	a4,-1700(gp) # b3a0 <__malloc_free_list>
    1906:	405c                	lw	a5,4(s0)
    1908:	c314                	sw	a3,0(a4)
    190a:	c35c                	sw	a5,4(a4)
    190c:	854a                	mv	a0,s2
    190e:	28b1                	jal	196a <__malloc_unlock>
    1910:	00b40513          	addi	a0,s0,11
    1914:	00440793          	addi	a5,s0,4
    1918:	9961                	andi	a0,a0,-8
    191a:	40f50733          	sub	a4,a0,a5
    191e:	f6f502e3          	beq	a0,a5,1882 <_malloc_r+0x2c>
    1922:	943a                	add	s0,s0,a4
    1924:	8f89                	sub	a5,a5,a0
    1926:	c01c                	sw	a5,0(s0)
    1928:	bfa9                	j	1882 <_malloc_r+0x2c>
    192a:	c3d8                	sw	a4,4(a5)
    192c:	bfe9                	j	1906 <_malloc_r+0xb0>
    192e:	4058                	lw	a4,4(s0)
    1930:	00879563          	bne	a5,s0,193a <_malloc_r+0xe4>
    1934:	94e1ae23          	sw	a4,-1700(gp) # b3a0 <__malloc_free_list>
    1938:	bfd1                	j	190c <_malloc_r+0xb6>
    193a:	c3d8                	sw	a4,4(a5)
    193c:	bfc1                	j	190c <_malloc_r+0xb6>
    193e:	87a2                	mv	a5,s0
    1940:	4040                	lw	s0,4(s0)
    1942:	bfa9                	j	189c <_malloc_r+0x46>
    1944:	843e                	mv	s0,a5
    1946:	43dc                	lw	a5,4(a5)
    1948:	b7ad                	j	18b2 <_malloc_r+0x5c>
    194a:	873e                	mv	a4,a5
    194c:	43dc                	lw	a5,4(a5)
    194e:	fe879ee3          	bne	a5,s0,194a <_malloc_r+0xf4>
    1952:	00072223          	sw	zero,4(a4)
    1956:	bf5d                	j	190c <_malloc_r+0xb6>
    1958:	47b1                	li	a5,12
    195a:	00f92023          	sw	a5,0(s2)
    195e:	854a                	mv	a0,s2
    1960:	2029                	jal	196a <__malloc_unlock>
    1962:	bf39                	j	1880 <_malloc_r+0x2a>
    1964:	c104                	sw	s1,0(a0)
    1966:	b75d                	j	190c <_malloc_r+0xb6>

00001968 <__malloc_lock>:
    1968:	8082                	ret

0000196a <__malloc_unlock>:
    196a:	8082                	ret

0000196c <__sflush_r>:
    196c:	00c59783          	lh	a5,12(a1)
    1970:	1101                	addi	sp,sp,-32
    1972:	cc22                	sw	s0,24(sp)
    1974:	ca26                	sw	s1,20(sp)
    1976:	ce06                	sw	ra,28(sp)
    1978:	c84a                	sw	s2,16(sp)
    197a:	0087f713          	andi	a4,a5,8
    197e:	84aa                	mv	s1,a0
    1980:	842e                	mv	s0,a1
    1982:	e361                	bnez	a4,1a42 <__sflush_r+0xd6>
    1984:	41d8                	lw	a4,4(a1)
    1986:	00e04563          	bgtz	a4,1990 <__sflush_r+0x24>
    198a:	41b8                	lw	a4,64(a1)
    198c:	0ae05963          	blez	a4,1a3e <__sflush_r+0xd2>
    1990:	5458                	lw	a4,44(s0)
    1992:	c755                	beqz	a4,1a3e <__sflush_r+0xd2>
    1994:	0004a903          	lw	s2,0(s1)
    1998:	01379693          	slli	a3,a5,0x13
    199c:	0004a023          	sw	zero,0(s1)
    19a0:	0606dd63          	bgez	a3,1a1a <__sflush_r+0xae>
    19a4:	4870                	lw	a2,84(s0)
    19a6:	00c45783          	lhu	a5,12(s0)
    19aa:	8b91                	andi	a5,a5,4
    19ac:	c799                	beqz	a5,19ba <__sflush_r+0x4e>
    19ae:	405c                	lw	a5,4(s0)
    19b0:	8e1d                	sub	a2,a2,a5
    19b2:	585c                	lw	a5,52(s0)
    19b4:	c399                	beqz	a5,19ba <__sflush_r+0x4e>
    19b6:	403c                	lw	a5,64(s0)
    19b8:	8e1d                	sub	a2,a2,a5
    19ba:	545c                	lw	a5,44(s0)
    19bc:	500c                	lw	a1,32(s0)
    19be:	4681                	li	a3,0
    19c0:	8526                	mv	a0,s1
    19c2:	9782                	jalr	a5
    19c4:	577d                	li	a4,-1
    19c6:	00c41783          	lh	a5,12(s0)
    19ca:	00e51d63          	bne	a0,a4,19e4 <__sflush_r+0x78>
    19ce:	4094                	lw	a3,0(s1)
    19d0:	4775                	li	a4,29
    19d2:	0ad76063          	bltu	a4,a3,1a72 <__sflush_r+0x106>
    19d6:	20400737          	lui	a4,0x20400
    19da:	0705                	addi	a4,a4,1 # 20400001 <_sp+0x203f3a11>
    19dc:	00d75733          	srl	a4,a4,a3
    19e0:	8b05                	andi	a4,a4,1
    19e2:	cb41                	beqz	a4,1a72 <__sflush_r+0x106>
    19e4:	4818                	lw	a4,16(s0)
    19e6:	00042223          	sw	zero,4(s0)
    19ea:	c018                	sw	a4,0(s0)
    19ec:	01379713          	slli	a4,a5,0x13
    19f0:	00075863          	bgez	a4,1a00 <__sflush_r+0x94>
    19f4:	57fd                	li	a5,-1
    19f6:	00f51463          	bne	a0,a5,19fe <__sflush_r+0x92>
    19fa:	409c                	lw	a5,0(s1)
    19fc:	e391                	bnez	a5,1a00 <__sflush_r+0x94>
    19fe:	c868                	sw	a0,84(s0)
    1a00:	584c                	lw	a1,52(s0)
    1a02:	0124a023          	sw	s2,0(s1)
    1a06:	cd85                	beqz	a1,1a3e <__sflush_r+0xd2>
    1a08:	04440793          	addi	a5,s0,68
    1a0c:	00f58463          	beq	a1,a5,1a14 <__sflush_r+0xa8>
    1a10:	8526                	mv	a0,s1
    1a12:	3b99                	jal	1768 <_free_r>
    1a14:	02042a23          	sw	zero,52(s0)
    1a18:	a01d                	j	1a3e <__sflush_r+0xd2>
    1a1a:	500c                	lw	a1,32(s0)
    1a1c:	4601                	li	a2,0
    1a1e:	4685                	li	a3,1
    1a20:	8526                	mv	a0,s1
    1a22:	9702                	jalr	a4
    1a24:	57fd                	li	a5,-1
    1a26:	862a                	mv	a2,a0
    1a28:	f6f51fe3          	bne	a0,a5,19a6 <__sflush_r+0x3a>
    1a2c:	409c                	lw	a5,0(s1)
    1a2e:	dfa5                	beqz	a5,19a6 <__sflush_r+0x3a>
    1a30:	fe378713          	addi	a4,a5,-29
    1a34:	c319                	beqz	a4,1a3a <__sflush_r+0xce>
    1a36:	17a9                	addi	a5,a5,-22
    1a38:	eb9d                	bnez	a5,1a6e <__sflush_r+0x102>
    1a3a:	0124a023          	sw	s2,0(s1)
    1a3e:	4501                	li	a0,0
    1a40:	a835                	j	1a7c <__sflush_r+0x110>
    1a42:	4990                	lw	a2,16(a1)
    1a44:	de6d                	beqz	a2,1a3e <__sflush_r+0xd2>
    1a46:	4194                	lw	a3,0(a1)
    1a48:	8b8d                	andi	a5,a5,3
    1a4a:	c190                	sw	a2,0(a1)
    1a4c:	40c68933          	sub	s2,a3,a2
    1a50:	4701                	li	a4,0
    1a52:	e391                	bnez	a5,1a56 <__sflush_r+0xea>
    1a54:	49d8                	lw	a4,20(a1)
    1a56:	c418                	sw	a4,8(s0)
    1a58:	ff2053e3          	blez	s2,1a3e <__sflush_r+0xd2>
    1a5c:	541c                	lw	a5,40(s0)
    1a5e:	500c                	lw	a1,32(s0)
    1a60:	86ca                	mv	a3,s2
    1a62:	8526                	mv	a0,s1
    1a64:	c632                	sw	a2,12(sp)
    1a66:	9782                	jalr	a5
    1a68:	4632                	lw	a2,12(sp)
    1a6a:	00a04f63          	bgtz	a0,1a88 <__sflush_r+0x11c>
    1a6e:	00c45783          	lhu	a5,12(s0)
    1a72:	0407e793          	ori	a5,a5,64
    1a76:	00f41623          	sh	a5,12(s0)
    1a7a:	557d                	li	a0,-1
    1a7c:	40f2                	lw	ra,28(sp)
    1a7e:	4462                	lw	s0,24(sp)
    1a80:	44d2                	lw	s1,20(sp)
    1a82:	4942                	lw	s2,16(sp)
    1a84:	6105                	addi	sp,sp,32
    1a86:	8082                	ret
    1a88:	962a                	add	a2,a2,a0
    1a8a:	40a90933          	sub	s2,s2,a0
    1a8e:	b7e9                	j	1a58 <__sflush_r+0xec>

00001a90 <_fflush_r>:
    1a90:	499c                	lw	a5,16(a1)
    1a92:	cb85                	beqz	a5,1ac2 <_fflush_r+0x32>
    1a94:	1101                	addi	sp,sp,-32
    1a96:	cc22                	sw	s0,24(sp)
    1a98:	ce06                	sw	ra,28(sp)
    1a9a:	842a                	mv	s0,a0
    1a9c:	c511                	beqz	a0,1aa8 <_fflush_r+0x18>
    1a9e:	511c                	lw	a5,32(a0)
    1aa0:	e781                	bnez	a5,1aa8 <_fflush_r+0x18>
    1aa2:	c62e                	sw	a1,12(sp)
    1aa4:	3a3d                	jal	13e2 <__sinit>
    1aa6:	45b2                	lw	a1,12(sp)
    1aa8:	00c59783          	lh	a5,12(a1)
    1aac:	c791                	beqz	a5,1ab8 <_fflush_r+0x28>
    1aae:	8522                	mv	a0,s0
    1ab0:	4462                	lw	s0,24(sp)
    1ab2:	40f2                	lw	ra,28(sp)
    1ab4:	6105                	addi	sp,sp,32
    1ab6:	bd5d                	j	196c <__sflush_r>
    1ab8:	40f2                	lw	ra,28(sp)
    1aba:	4462                	lw	s0,24(sp)
    1abc:	4501                	li	a0,0
    1abe:	6105                	addi	sp,sp,32
    1ac0:	8082                	ret
    1ac2:	4501                	li	a0,0
    1ac4:	8082                	ret

00001ac6 <_sbrk_r>:
    1ac6:	1141                	addi	sp,sp,-16
    1ac8:	c422                	sw	s0,8(sp)
    1aca:	c226                	sw	s1,4(sp)
    1acc:	84aa                	mv	s1,a0
    1ace:	852e                	mv	a0,a1
    1ad0:	c606                	sw	ra,12(sp)
    1ad2:	9401a823          	sw	zero,-1712(gp) # b394 <errno>
    1ad6:	ff8ff0ef          	jal	12ce <_sbrk>
    1ada:	57fd                	li	a5,-1
    1adc:	00f51663          	bne	a0,a5,1ae8 <_sbrk_r+0x22>
    1ae0:	9501a783          	lw	a5,-1712(gp) # b394 <errno>
    1ae4:	c391                	beqz	a5,1ae8 <_sbrk_r+0x22>
    1ae6:	c09c                	sw	a5,0(s1)
    1ae8:	40b2                	lw	ra,12(sp)
    1aea:	4422                	lw	s0,8(sp)
    1aec:	4492                	lw	s1,4(sp)
    1aee:	0141                	addi	sp,sp,16
    1af0:	8082                	ret

00001af2 <iprintf>:
    1af2:	7139                	addi	sp,sp,-64
    1af4:	da3e                	sw	a5,52(sp)
    1af6:	9481a783          	lw	a5,-1720(gp) # b38c <_impure_ptr>
    1afa:	d432                	sw	a2,40(sp)
    1afc:	d636                	sw	a3,44(sp)
    1afe:	d22e                	sw	a1,36(sp)
    1b00:	d83a                	sw	a4,48(sp)
    1b02:	dc42                	sw	a6,56(sp)
    1b04:	de46                	sw	a7,60(sp)
    1b06:	478c                	lw	a1,8(a5)
    1b08:	1054                	addi	a3,sp,36
    1b0a:	862a                	mv	a2,a0
    1b0c:	853e                	mv	a0,a5
    1b0e:	ce06                	sw	ra,28(sp)
    1b10:	c636                	sw	a3,12(sp)
    1b12:	2cad                	jal	1d8c <_vfiprintf_r>
    1b14:	40f2                	lw	ra,28(sp)
    1b16:	6121                	addi	sp,sp,64
    1b18:	8082                	ret

00001b1a <_puts_r>:
    1b1a:	511c                	lw	a5,32(a0)
    1b1c:	1101                	addi	sp,sp,-32
    1b1e:	cc22                	sw	s0,24(sp)
    1b20:	ca26                	sw	s1,20(sp)
    1b22:	c84a                	sw	s2,16(sp)
    1b24:	ce06                	sw	ra,28(sp)
    1b26:	c64e                	sw	s3,12(sp)
    1b28:	4500                	lw	s0,8(a0)
    1b2a:	84aa                	mv	s1,a0
    1b2c:	892e                	mv	s2,a1
    1b2e:	e391                	bnez	a5,1b32 <_puts_r+0x18>
    1b30:	384d                	jal	13e2 <__sinit>
    1b32:	00c45783          	lhu	a5,12(s0)
    1b36:	8ba1                	andi	a5,a5,8
    1b38:	c399                	beqz	a5,1b3e <_puts_r+0x24>
    1b3a:	481c                	lw	a5,16(s0)
    1b3c:	e3bd                	bnez	a5,1ba2 <_puts_r+0x88>
    1b3e:	85a2                	mv	a1,s0
    1b40:	8526                	mv	a0,s1
    1b42:	2229                	jal	1c4c <__swsetup_r>
    1b44:	cd39                	beqz	a0,1ba2 <_puts_r+0x88>
    1b46:	557d                	li	a0,-1
    1b48:	40f2                	lw	ra,28(sp)
    1b4a:	4462                	lw	s0,24(sp)
    1b4c:	44d2                	lw	s1,20(sp)
    1b4e:	4942                	lw	s2,16(sp)
    1b50:	49b2                	lw	s3,12(sp)
    1b52:	6105                	addi	sp,sp,32
    1b54:	8082                	ret
    1b56:	0007d863          	bgez	a5,1b66 <_puts_r+0x4c>
    1b5a:	4c18                	lw	a4,24(s0)
    1b5c:	02e7cd63          	blt	a5,a4,1b96 <_puts_r+0x7c>
    1b60:	ff658793          	addi	a5,a1,-10
    1b64:	cb8d                	beqz	a5,1b96 <_puts_r+0x7c>
    1b66:	401c                	lw	a5,0(s0)
    1b68:	00178713          	addi	a4,a5,1
    1b6c:	c018                	sw	a4,0(s0)
    1b6e:	00b78023          	sb	a1,0(a5)
    1b72:	0905                	addi	s2,s2,1
    1b74:	441c                	lw	a5,8(s0)
    1b76:	00094583          	lbu	a1,0(s2)
    1b7a:	17fd                	addi	a5,a5,-1
    1b7c:	c41c                	sw	a5,8(s0)
    1b7e:	fde1                	bnez	a1,1b56 <_puts_r+0x3c>
    1b80:	0207d363          	bgez	a5,1ba6 <_puts_r+0x8c>
    1b84:	8622                	mv	a2,s0
    1b86:	45a9                	li	a1,10
    1b88:	8526                	mv	a0,s1
    1b8a:	2815                	jal	1bbe <__swbuf_r>
    1b8c:	57fd                	li	a5,-1
    1b8e:	faf50ce3          	beq	a0,a5,1b46 <_puts_r+0x2c>
    1b92:	4529                	li	a0,10
    1b94:	bf55                	j	1b48 <_puts_r+0x2e>
    1b96:	8622                	mv	a2,s0
    1b98:	8526                	mv	a0,s1
    1b9a:	2015                	jal	1bbe <__swbuf_r>
    1b9c:	fd351be3          	bne	a0,s3,1b72 <_puts_r+0x58>
    1ba0:	b75d                	j	1b46 <_puts_r+0x2c>
    1ba2:	59fd                	li	s3,-1
    1ba4:	bfc1                	j	1b74 <_puts_r+0x5a>
    1ba6:	401c                	lw	a5,0(s0)
    1ba8:	00178713          	addi	a4,a5,1
    1bac:	c018                	sw	a4,0(s0)
    1bae:	4729                	li	a4,10
    1bb0:	00e78023          	sb	a4,0(a5)
    1bb4:	bff9                	j	1b92 <_puts_r+0x78>

00001bb6 <puts>:
    1bb6:	85aa                	mv	a1,a0
    1bb8:	9481a503          	lw	a0,-1720(gp) # b38c <_impure_ptr>
    1bbc:	bfb9                	j	1b1a <_puts_r>

00001bbe <__swbuf_r>:
    1bbe:	1101                	addi	sp,sp,-32
    1bc0:	cc22                	sw	s0,24(sp)
    1bc2:	ca26                	sw	s1,20(sp)
    1bc4:	c64e                	sw	s3,12(sp)
    1bc6:	ce06                	sw	ra,28(sp)
    1bc8:	c84a                	sw	s2,16(sp)
    1bca:	84aa                	mv	s1,a0
    1bcc:	89ae                	mv	s3,a1
    1bce:	8432                	mv	s0,a2
    1bd0:	c501                	beqz	a0,1bd8 <__swbuf_r+0x1a>
    1bd2:	511c                	lw	a5,32(a0)
    1bd4:	e391                	bnez	a5,1bd8 <__swbuf_r+0x1a>
    1bd6:	3031                	jal	13e2 <__sinit>
    1bd8:	4c1c                	lw	a5,24(s0)
    1bda:	c41c                	sw	a5,8(s0)
    1bdc:	00c45783          	lhu	a5,12(s0)
    1be0:	8ba1                	andi	a5,a5,8
    1be2:	c399                	beqz	a5,1be8 <__swbuf_r+0x2a>
    1be4:	481c                	lw	a5,16(s0)
    1be6:	ef91                	bnez	a5,1c02 <__swbuf_r+0x44>
    1be8:	85a2                	mv	a1,s0
    1bea:	8526                	mv	a0,s1
    1bec:	2085                	jal	1c4c <__swsetup_r>
    1bee:	c911                	beqz	a0,1c02 <__swbuf_r+0x44>
    1bf0:	597d                	li	s2,-1
    1bf2:	40f2                	lw	ra,28(sp)
    1bf4:	4462                	lw	s0,24(sp)
    1bf6:	44d2                	lw	s1,20(sp)
    1bf8:	49b2                	lw	s3,12(sp)
    1bfa:	854a                	mv	a0,s2
    1bfc:	4942                	lw	s2,16(sp)
    1bfe:	6105                	addi	sp,sp,32
    1c00:	8082                	ret
    1c02:	481c                	lw	a5,16(s0)
    1c04:	4008                	lw	a0,0(s0)
    1c06:	8d1d                	sub	a0,a0,a5
    1c08:	485c                	lw	a5,20(s0)
    1c0a:	00f54663          	blt	a0,a5,1c16 <__swbuf_r+0x58>
    1c0e:	85a2                	mv	a1,s0
    1c10:	8526                	mv	a0,s1
    1c12:	3dbd                	jal	1a90 <_fflush_r>
    1c14:	fd71                	bnez	a0,1bf0 <__swbuf_r+0x32>
    1c16:	441c                	lw	a5,8(s0)
    1c18:	0505                	addi	a0,a0,1
    1c1a:	0ff9f913          	zext.b	s2,s3
    1c1e:	17fd                	addi	a5,a5,-1
    1c20:	c41c                	sw	a5,8(s0)
    1c22:	401c                	lw	a5,0(s0)
    1c24:	00178713          	addi	a4,a5,1
    1c28:	c018                	sw	a4,0(s0)
    1c2a:	01378023          	sb	s3,0(a5)
    1c2e:	485c                	lw	a5,20(s0)
    1c30:	00a78963          	beq	a5,a0,1c42 <__swbuf_r+0x84>
    1c34:	00c45783          	lhu	a5,12(s0)
    1c38:	8b85                	andi	a5,a5,1
    1c3a:	dfc5                	beqz	a5,1bf2 <__swbuf_r+0x34>
    1c3c:	ff690793          	addi	a5,s2,-10
    1c40:	fbcd                	bnez	a5,1bf2 <__swbuf_r+0x34>
    1c42:	85a2                	mv	a1,s0
    1c44:	8526                	mv	a0,s1
    1c46:	35a9                	jal	1a90 <_fflush_r>
    1c48:	d54d                	beqz	a0,1bf2 <__swbuf_r+0x34>
    1c4a:	b75d                	j	1bf0 <__swbuf_r+0x32>

00001c4c <__swsetup_r>:
    1c4c:	1141                	addi	sp,sp,-16
    1c4e:	c226                	sw	s1,4(sp)
    1c50:	84aa                	mv	s1,a0
    1c52:	9481a503          	lw	a0,-1720(gp) # b38c <_impure_ptr>
    1c56:	c422                	sw	s0,8(sp)
    1c58:	c606                	sw	ra,12(sp)
    1c5a:	842e                	mv	s0,a1
    1c5c:	c509                	beqz	a0,1c66 <__swsetup_r+0x1a>
    1c5e:	511c                	lw	a5,32(a0)
    1c60:	e399                	bnez	a5,1c66 <__swsetup_r+0x1a>
    1c62:	f80ff0ef          	jal	13e2 <__sinit>
    1c66:	00c41783          	lh	a5,12(s0)
    1c6a:	0087f713          	andi	a4,a5,8
    1c6e:	e729                	bnez	a4,1cb8 <__swsetup_r+0x6c>
    1c70:	0107f713          	andi	a4,a5,16
    1c74:	eb09                	bnez	a4,1c86 <__swsetup_r+0x3a>
    1c76:	4725                	li	a4,9
    1c78:	c098                	sw	a4,0(s1)
    1c7a:	0407e793          	ori	a5,a5,64
    1c7e:	00f41623          	sh	a5,12(s0)
    1c82:	557d                	li	a0,-1
    1c84:	a0bd                	j	1cf2 <__swsetup_r+0xa6>
    1c86:	0047f713          	andi	a4,a5,4
    1c8a:	c31d                	beqz	a4,1cb0 <__swsetup_r+0x64>
    1c8c:	584c                	lw	a1,52(s0)
    1c8e:	c989                	beqz	a1,1ca0 <__swsetup_r+0x54>
    1c90:	04440793          	addi	a5,s0,68
    1c94:	00f58463          	beq	a1,a5,1c9c <__swsetup_r+0x50>
    1c98:	8526                	mv	a0,s1
    1c9a:	34f9                	jal	1768 <_free_r>
    1c9c:	02042a23          	sw	zero,52(s0)
    1ca0:	00c45783          	lhu	a5,12(s0)
    1ca4:	4818                	lw	a4,16(s0)
    1ca6:	00042223          	sw	zero,4(s0)
    1caa:	fdb7f793          	andi	a5,a5,-37
    1cae:	c018                	sw	a4,0(s0)
    1cb0:	0087e793          	ori	a5,a5,8
    1cb4:	00f41623          	sh	a5,12(s0)
    1cb8:	481c                	lw	a5,16(s0)
    1cba:	eb99                	bnez	a5,1cd0 <__swsetup_r+0x84>
    1cbc:	445c                	lw	a5,12(s0)
    1cbe:	20000713          	li	a4,512
    1cc2:	2807f793          	andi	a5,a5,640
    1cc6:	00e78563          	beq	a5,a4,1cd0 <__swsetup_r+0x84>
    1cca:	85a2                	mv	a1,s0
    1ccc:	8526                	mv	a0,s1
    1cce:	25e9                	jal	2398 <__smakebuf_r>
    1cd0:	00c41783          	lh	a5,12(s0)
    1cd4:	0017f713          	andi	a4,a5,1
    1cd8:	c315                	beqz	a4,1cfc <__swsetup_r+0xb0>
    1cda:	4858                	lw	a4,20(s0)
    1cdc:	00042423          	sw	zero,8(s0)
    1ce0:	40e00733          	neg	a4,a4
    1ce4:	cc18                	sw	a4,24(s0)
    1ce6:	4818                	lw	a4,16(s0)
    1ce8:	4501                	li	a0,0
    1cea:	e701                	bnez	a4,1cf2 <__swsetup_r+0xa6>
    1cec:	0807f713          	andi	a4,a5,128
    1cf0:	f749                	bnez	a4,1c7a <__swsetup_r+0x2e>
    1cf2:	40b2                	lw	ra,12(sp)
    1cf4:	4422                	lw	s0,8(sp)
    1cf6:	4492                	lw	s1,4(sp)
    1cf8:	0141                	addi	sp,sp,16
    1cfa:	8082                	ret
    1cfc:	0027f713          	andi	a4,a5,2
    1d00:	4681                	li	a3,0
    1d02:	e311                	bnez	a4,1d06 <__swsetup_r+0xba>
    1d04:	4854                	lw	a3,20(s0)
    1d06:	c414                	sw	a3,8(s0)
    1d08:	bff9                	j	1ce6 <__swsetup_r+0x9a>

00001d0a <__errno>:
    1d0a:	9481a503          	lw	a0,-1720(gp) # b38c <_impure_ptr>
    1d0e:	8082                	ret

00001d10 <strlen>:
    1d10:	87aa                	mv	a5,a0
    1d12:	0007c703          	lbu	a4,0(a5)
    1d16:	0785                	addi	a5,a5,1
    1d18:	ff6d                	bnez	a4,1d12 <strlen+0x2>
    1d1a:	40a78533          	sub	a0,a5,a0
    1d1e:	157d                	addi	a0,a0,-1
    1d20:	8082                	ret

00001d22 <__sfputc_r>:
    1d22:	461c                	lw	a5,8(a2)
    1d24:	17fd                	addi	a5,a5,-1
    1d26:	c61c                	sw	a5,8(a2)
    1d28:	0007d963          	bgez	a5,1d3a <__sfputc_r+0x18>
    1d2c:	4e18                	lw	a4,24(a2)
    1d2e:	00e7c563          	blt	a5,a4,1d38 <__sfputc_r+0x16>
    1d32:	ff658793          	addi	a5,a1,-10
    1d36:	e391                	bnez	a5,1d3a <__sfputc_r+0x18>
    1d38:	b559                	j	1bbe <__swbuf_r>
    1d3a:	421c                	lw	a5,0(a2)
    1d3c:	852e                	mv	a0,a1
    1d3e:	00178713          	addi	a4,a5,1
    1d42:	c218                	sw	a4,0(a2)
    1d44:	00b78023          	sb	a1,0(a5)
    1d48:	8082                	ret

00001d4a <__sfputs_r>:
    1d4a:	1101                	addi	sp,sp,-32
    1d4c:	cc22                	sw	s0,24(sp)
    1d4e:	ca26                	sw	s1,20(sp)
    1d50:	c84a                	sw	s2,16(sp)
    1d52:	c64e                	sw	s3,12(sp)
    1d54:	c452                	sw	s4,8(sp)
    1d56:	ce06                	sw	ra,28(sp)
    1d58:	89aa                	mv	s3,a0
    1d5a:	8a2e                	mv	s4,a1
    1d5c:	8432                	mv	s0,a2
    1d5e:	00d604b3          	add	s1,a2,a3
    1d62:	597d                	li	s2,-1
    1d64:	00941463          	bne	s0,s1,1d6c <__sfputs_r+0x22>
    1d68:	4501                	li	a0,0
    1d6a:	a809                	j	1d7c <__sfputs_r+0x32>
    1d6c:	00044583          	lbu	a1,0(s0)
    1d70:	8652                	mv	a2,s4
    1d72:	854e                	mv	a0,s3
    1d74:	377d                	jal	1d22 <__sfputc_r>
    1d76:	0405                	addi	s0,s0,1
    1d78:	ff2516e3          	bne	a0,s2,1d64 <__sfputs_r+0x1a>
    1d7c:	40f2                	lw	ra,28(sp)
    1d7e:	4462                	lw	s0,24(sp)
    1d80:	44d2                	lw	s1,20(sp)
    1d82:	4942                	lw	s2,16(sp)
    1d84:	49b2                	lw	s3,12(sp)
    1d86:	4a22                	lw	s4,8(sp)
    1d88:	6105                	addi	sp,sp,32
    1d8a:	8082                	ret

00001d8c <_vfiprintf_r>:
    1d8c:	7171                	addi	sp,sp,-176
    1d8e:	d522                	sw	s0,168(sp)
    1d90:	d326                	sw	s1,164(sp)
    1d92:	cf4e                	sw	s3,156(sp)
    1d94:	cd52                	sw	s4,152(sp)
    1d96:	d706                	sw	ra,172(sp)
    1d98:	d14a                	sw	s2,160(sp)
    1d9a:	cb56                	sw	s5,148(sp)
    1d9c:	c95a                	sw	s6,144(sp)
    1d9e:	c75e                	sw	s7,140(sp)
    1da0:	c562                	sw	s8,136(sp)
    1da2:	c366                	sw	s9,132(sp)
    1da4:	89aa                	mv	s3,a0
    1da6:	84ae                	mv	s1,a1
    1da8:	8432                	mv	s0,a2
    1daa:	8a36                	mv	s4,a3
    1dac:	c509                	beqz	a0,1db6 <_vfiprintf_r+0x2a>
    1dae:	511c                	lw	a5,32(a0)
    1db0:	e399                	bnez	a5,1db6 <_vfiprintf_r+0x2a>
    1db2:	e30ff0ef          	jal	13e2 <__sinit>
    1db6:	00c4d783          	lhu	a5,12(s1)
    1dba:	8ba1                	andi	a5,a5,8
    1dbc:	c7e9                	beqz	a5,1e86 <_vfiprintf_r+0xfa>
    1dbe:	489c                	lw	a5,16(s1)
    1dc0:	c3f9                	beqz	a5,1e86 <_vfiprintf_r+0xfa>
    1dc2:	02000793          	li	a5,32
    1dc6:	02f10ca3          	sb	a5,57(sp)
    1dca:	ce52                	sw	s4,28(sp)
    1dcc:	03000793          	li	a5,48
    1dd0:	6a2d                	lui	s4,0xb
    1dd2:	da02                	sw	zero,52(sp)
    1dd4:	02f10d23          	sb	a5,58(sp)
    1dd8:	5afd                	li	s5,-1
    1dda:	8a8a0a13          	addi	s4,s4,-1880 # a8a8 <__clz_tab+0x2ac>
    1dde:	4b85                	li	s7,1
    1de0:	4b29                	li	s6,10
    1de2:	8c22                	mv	s8,s0
    1de4:	000c4783          	lbu	a5,0(s8)
    1de8:	00f03cb3          	snez	s9,a5
    1dec:	fdb78793          	addi	a5,a5,-37
    1df0:	00f037b3          	snez	a5,a5
    1df4:	00fcfcb3          	and	s9,s9,a5
    1df8:	0a0c9963          	bnez	s9,1eaa <_vfiprintf_r+0x11e>
    1dfc:	408c06b3          	sub	a3,s8,s0
    1e00:	008c0d63          	beq	s8,s0,1e1a <_vfiprintf_r+0x8e>
    1e04:	8622                	mv	a2,s0
    1e06:	85a6                	mv	a1,s1
    1e08:	854e                	mv	a0,s3
    1e0a:	c636                	sw	a3,12(sp)
    1e0c:	3f3d                	jal	1d4a <__sfputs_r>
    1e0e:	1b550663          	beq	a0,s5,1fba <_vfiprintf_r+0x22e>
    1e12:	57d2                	lw	a5,52(sp)
    1e14:	46b2                	lw	a3,12(sp)
    1e16:	97b6                	add	a5,a5,a3
    1e18:	da3e                	sw	a5,52(sp)
    1e1a:	000c4783          	lbu	a5,0(s8)
    1e1e:	18078e63          	beqz	a5,1fba <_vfiprintf_r+0x22e>
    1e22:	001c0413          	addi	s0,s8,1
    1e26:	d002                	sw	zero,32(sp)
    1e28:	d602                	sw	zero,44(sp)
    1e2a:	d256                	sw	s5,36(sp)
    1e2c:	d402                	sw	zero,40(sp)
    1e2e:	060101a3          	sb	zero,99(sp)
    1e32:	dc82                	sw	zero,120(sp)
    1e34:	00044583          	lbu	a1,0(s0)
    1e38:	4615                	li	a2,5
    1e3a:	8552                	mv	a0,s4
    1e3c:	2bf1                	jal	2418 <memchr>
    1e3e:	5782                	lw	a5,32(sp)
    1e40:	00140693          	addi	a3,s0,1
    1e44:	e52d                	bnez	a0,1eae <_vfiprintf_r+0x122>
    1e46:	0107f713          	andi	a4,a5,16
    1e4a:	c709                	beqz	a4,1e54 <_vfiprintf_r+0xc8>
    1e4c:	02000713          	li	a4,32
    1e50:	06e101a3          	sb	a4,99(sp)
    1e54:	0087f713          	andi	a4,a5,8
    1e58:	c709                	beqz	a4,1e62 <_vfiprintf_r+0xd6>
    1e5a:	02b00713          	li	a4,43
    1e5e:	06e101a3          	sb	a4,99(sp)
    1e62:	00044603          	lbu	a2,0(s0)
    1e66:	02a00713          	li	a4,42
    1e6a:	04e60a63          	beq	a2,a4,1ebe <_vfiprintf_r+0x132>
    1e6e:	57b2                	lw	a5,44(sp)
    1e70:	4681                	li	a3,0
    1e72:	4625                	li	a2,9
    1e74:	00044703          	lbu	a4,0(s0)
    1e78:	fd070713          	addi	a4,a4,-48
    1e7c:	08e67863          	bgeu	a2,a4,1f0c <_vfiprintf_r+0x180>
    1e80:	caa1                	beqz	a3,1ed0 <_vfiprintf_r+0x144>
    1e82:	d63e                	sw	a5,44(sp)
    1e84:	a0b1                	j	1ed0 <_vfiprintf_r+0x144>
    1e86:	85a6                	mv	a1,s1
    1e88:	854e                	mv	a0,s3
    1e8a:	33c9                	jal	1c4c <__swsetup_r>
    1e8c:	d91d                	beqz	a0,1dc2 <_vfiprintf_r+0x36>
    1e8e:	557d                	li	a0,-1
    1e90:	50ba                	lw	ra,172(sp)
    1e92:	542a                	lw	s0,168(sp)
    1e94:	549a                	lw	s1,164(sp)
    1e96:	590a                	lw	s2,160(sp)
    1e98:	49fa                	lw	s3,156(sp)
    1e9a:	4a6a                	lw	s4,152(sp)
    1e9c:	4ada                	lw	s5,148(sp)
    1e9e:	4b4a                	lw	s6,144(sp)
    1ea0:	4bba                	lw	s7,140(sp)
    1ea2:	4c2a                	lw	s8,136(sp)
    1ea4:	4c9a                	lw	s9,132(sp)
    1ea6:	614d                	addi	sp,sp,176
    1ea8:	8082                	ret
    1eaa:	0c05                	addi	s8,s8,1
    1eac:	bf25                	j	1de4 <_vfiprintf_r+0x58>
    1eae:	41450533          	sub	a0,a0,s4
    1eb2:	00ab9533          	sll	a0,s7,a0
    1eb6:	8d5d                	or	a0,a0,a5
    1eb8:	d02a                	sw	a0,32(sp)
    1eba:	8436                	mv	s0,a3
    1ebc:	bfa5                	j	1e34 <_vfiprintf_r+0xa8>
    1ebe:	4772                	lw	a4,28(sp)
    1ec0:	00470613          	addi	a2,a4,4
    1ec4:	4318                	lw	a4,0(a4)
    1ec6:	ce32                	sw	a2,28(sp)
    1ec8:	02074b63          	bltz	a4,1efe <_vfiprintf_r+0x172>
    1ecc:	d63a                	sw	a4,44(sp)
    1ece:	8436                	mv	s0,a3
    1ed0:	00044703          	lbu	a4,0(s0)
    1ed4:	02e00793          	li	a5,46
    1ed8:	04f71c63          	bne	a4,a5,1f30 <_vfiprintf_r+0x1a4>
    1edc:	00144703          	lbu	a4,1(s0)
    1ee0:	02a00793          	li	a5,42
    1ee4:	02f71a63          	bne	a4,a5,1f18 <_vfiprintf_r+0x18c>
    1ee8:	47f2                	lw	a5,28(sp)
    1eea:	0409                	addi	s0,s0,2
    1eec:	00478713          	addi	a4,a5,4
    1ef0:	439c                	lw	a5,0(a5)
    1ef2:	ce3a                	sw	a4,28(sp)
    1ef4:	0007d363          	bgez	a5,1efa <_vfiprintf_r+0x16e>
    1ef8:	57fd                	li	a5,-1
    1efa:	d23e                	sw	a5,36(sp)
    1efc:	a815                	j	1f30 <_vfiprintf_r+0x1a4>
    1efe:	40e00733          	neg	a4,a4
    1f02:	0027e793          	ori	a5,a5,2
    1f06:	d63a                	sw	a4,44(sp)
    1f08:	d03e                	sw	a5,32(sp)
    1f0a:	b7d1                	j	1ece <_vfiprintf_r+0x142>
    1f0c:	036787b3          	mul	a5,a5,s6
    1f10:	0405                	addi	s0,s0,1
    1f12:	4685                	li	a3,1
    1f14:	97ba                	add	a5,a5,a4
    1f16:	bfb9                	j	1e74 <_vfiprintf_r+0xe8>
    1f18:	0405                	addi	s0,s0,1
    1f1a:	d202                	sw	zero,36(sp)
    1f1c:	4781                	li	a5,0
    1f1e:	46a5                	li	a3,9
    1f20:	00044703          	lbu	a4,0(s0)
    1f24:	fd070713          	addi	a4,a4,-48
    1f28:	06e6f163          	bgeu	a3,a4,1f8a <_vfiprintf_r+0x1fe>
    1f2c:	fc0c97e3          	bnez	s9,1efa <_vfiprintf_r+0x16e>
    1f30:	00044583          	lbu	a1,0(s0)
    1f34:	6c2d                	lui	s8,0xb
    1f36:	460d                	li	a2,3
    1f38:	8b0c0513          	addi	a0,s8,-1872 # a8b0 <__clz_tab+0x2b4>
    1f3c:	29f1                	jal	2418 <memchr>
    1f3e:	cd09                	beqz	a0,1f58 <_vfiprintf_r+0x1cc>
    1f40:	5782                	lw	a5,32(sp)
    1f42:	8b0c0c13          	addi	s8,s8,-1872
    1f46:	41850533          	sub	a0,a0,s8
    1f4a:	04000713          	li	a4,64
    1f4e:	00a71733          	sll	a4,a4,a0
    1f52:	8fd9                	or	a5,a5,a4
    1f54:	0405                	addi	s0,s0,1
    1f56:	d03e                	sw	a5,32(sp)
    1f58:	00044583          	lbu	a1,0(s0)
    1f5c:	652d                	lui	a0,0xb
    1f5e:	4619                	li	a2,6
    1f60:	8b450513          	addi	a0,a0,-1868 # a8b4 <__clz_tab+0x2b8>
    1f64:	02b10c23          	sb	a1,56(sp)
    1f68:	2945                	jal	2418 <memchr>
    1f6a:	c125                	beqz	a0,1fca <_vfiprintf_r+0x23e>
    1f6c:	00000793          	li	a5,0
    1f70:	e79d                	bnez	a5,1f9e <_vfiprintf_r+0x212>
    1f72:	5702                	lw	a4,32(sp)
    1f74:	47f2                	lw	a5,28(sp)
    1f76:	10077713          	andi	a4,a4,256
    1f7a:	cf11                	beqz	a4,1f96 <_vfiprintf_r+0x20a>
    1f7c:	0791                	addi	a5,a5,4
    1f7e:	ce3e                	sw	a5,28(sp)
    1f80:	57d2                	lw	a5,52(sp)
    1f82:	0405                	addi	s0,s0,1
    1f84:	97ca                	add	a5,a5,s2
    1f86:	da3e                	sw	a5,52(sp)
    1f88:	bda9                	j	1de2 <_vfiprintf_r+0x56>
    1f8a:	036787b3          	mul	a5,a5,s6
    1f8e:	0405                	addi	s0,s0,1
    1f90:	4c85                	li	s9,1
    1f92:	97ba                	add	a5,a5,a4
    1f94:	b771                	j	1f20 <_vfiprintf_r+0x194>
    1f96:	079d                	addi	a5,a5,7
    1f98:	9be1                	andi	a5,a5,-8
    1f9a:	07a1                	addi	a5,a5,8
    1f9c:	b7cd                	j	1f7e <_vfiprintf_r+0x1f2>
    1f9e:	6689                	lui	a3,0x2
    1fa0:	0878                	addi	a4,sp,28
    1fa2:	d4a68693          	addi	a3,a3,-694 # 1d4a <__sfputs_r>
    1fa6:	8626                	mv	a2,s1
    1fa8:	100c                	addi	a1,sp,32
    1faa:	854e                	mv	a0,s3
    1fac:	00000097          	auipc	ra,0x0
    1fb0:	000000e7          	jalr	zero # 0 <__vector_start>
    1fb4:	892a                	mv	s2,a0
    1fb6:	fd5515e3          	bne	a0,s5,1f80 <_vfiprintf_r+0x1f4>
    1fba:	00c4d783          	lhu	a5,12(s1)
    1fbe:	0407f793          	andi	a5,a5,64
    1fc2:	ec0796e3          	bnez	a5,1e8e <_vfiprintf_r+0x102>
    1fc6:	5552                	lw	a0,52(sp)
    1fc8:	b5e1                	j	1e90 <_vfiprintf_r+0x104>
    1fca:	6689                	lui	a3,0x2
    1fcc:	0878                	addi	a4,sp,28
    1fce:	d4a68693          	addi	a3,a3,-694 # 1d4a <__sfputs_r>
    1fd2:	8626                	mv	a2,s1
    1fd4:	100c                	addi	a1,sp,32
    1fd6:	854e                	mv	a0,s3
    1fd8:	2a19                	jal	20ee <_printf_i>
    1fda:	bfe9                	j	1fb4 <_vfiprintf_r+0x228>

00001fdc <_printf_common>:
    1fdc:	7179                	addi	sp,sp,-48
    1fde:	ce4e                	sw	s3,28(sp)
    1fe0:	499c                	lw	a5,16(a1)
    1fe2:	89ba                	mv	s3,a4
    1fe4:	4598                	lw	a4,8(a1)
    1fe6:	d422                	sw	s0,40(sp)
    1fe8:	d04a                	sw	s2,32(sp)
    1fea:	c85a                	sw	s6,16(sp)
    1fec:	c65e                	sw	s7,12(sp)
    1fee:	d606                	sw	ra,44(sp)
    1ff0:	d226                	sw	s1,36(sp)
    1ff2:	cc52                	sw	s4,24(sp)
    1ff4:	ca56                	sw	s5,20(sp)
    1ff6:	8b2a                	mv	s6,a0
    1ff8:	842e                	mv	s0,a1
    1ffa:	8932                	mv	s2,a2
    1ffc:	8bb6                	mv	s7,a3
    1ffe:	00e7d363          	bge	a5,a4,2004 <_printf_common+0x28>
    2002:	87ba                	mv	a5,a4
    2004:	00f92023          	sw	a5,0(s2)
    2008:	04344703          	lbu	a4,67(s0)
    200c:	c701                	beqz	a4,2014 <_printf_common+0x38>
    200e:	0785                	addi	a5,a5,1
    2010:	00f92023          	sw	a5,0(s2)
    2014:	401c                	lw	a5,0(s0)
    2016:	0207f793          	andi	a5,a5,32
    201a:	c791                	beqz	a5,2026 <_printf_common+0x4a>
    201c:	00092783          	lw	a5,0(s2)
    2020:	0789                	addi	a5,a5,2
    2022:	00f92023          	sw	a5,0(s2)
    2026:	4004                	lw	s1,0(s0)
    2028:	8899                	andi	s1,s1,6
    202a:	e891                	bnez	s1,203e <_printf_common+0x62>
    202c:	01940a13          	addi	s4,s0,25
    2030:	5afd                	li	s5,-1
    2032:	445c                	lw	a5,12(s0)
    2034:	00092703          	lw	a4,0(s2)
    2038:	8f99                	sub	a5,a5,a4
    203a:	04f4cd63          	blt	s1,a5,2094 <_printf_common+0xb8>
    203e:	401c                	lw	a5,0(s0)
    2040:	04344683          	lbu	a3,67(s0)
    2044:	0207f793          	andi	a5,a5,32
    2048:	00d036b3          	snez	a3,a3
    204c:	ebad                	bnez	a5,20be <_printf_common+0xe2>
    204e:	04340613          	addi	a2,s0,67
    2052:	85de                	mv	a1,s7
    2054:	855a                	mv	a0,s6
    2056:	9982                	jalr	s3
    2058:	57fd                	li	a5,-1
    205a:	04f50463          	beq	a0,a5,20a2 <_printf_common+0xc6>
    205e:	401c                	lw	a5,0(s0)
    2060:	4711                	li	a4,4
    2062:	4481                	li	s1,0
    2064:	8b99                	andi	a5,a5,6
    2066:	00e79a63          	bne	a5,a4,207a <_printf_common+0x9e>
    206a:	00092783          	lw	a5,0(s2)
    206e:	4444                	lw	s1,12(s0)
    2070:	8c9d                	sub	s1,s1,a5
    2072:	fff4c793          	not	a5,s1
    2076:	87fd                	srai	a5,a5,0x1f
    2078:	8cfd                	and	s1,s1,a5
    207a:	441c                	lw	a5,8(s0)
    207c:	4818                	lw	a4,16(s0)
    207e:	00f75463          	bge	a4,a5,2086 <_printf_common+0xaa>
    2082:	8f99                	sub	a5,a5,a4
    2084:	94be                	add	s1,s1,a5
    2086:	4901                	li	s2,0
    2088:	0469                	addi	s0,s0,26
    208a:	5a7d                	li	s4,-1
    208c:	05249863          	bne	s1,s2,20dc <_printf_common+0x100>
    2090:	4501                	li	a0,0
    2092:	a809                	j	20a4 <_printf_common+0xc8>
    2094:	4685                	li	a3,1
    2096:	8652                	mv	a2,s4
    2098:	85de                	mv	a1,s7
    209a:	855a                	mv	a0,s6
    209c:	9982                	jalr	s3
    209e:	01551e63          	bne	a0,s5,20ba <_printf_common+0xde>
    20a2:	557d                	li	a0,-1
    20a4:	50b2                	lw	ra,44(sp)
    20a6:	5422                	lw	s0,40(sp)
    20a8:	5492                	lw	s1,36(sp)
    20aa:	5902                	lw	s2,32(sp)
    20ac:	49f2                	lw	s3,28(sp)
    20ae:	4a62                	lw	s4,24(sp)
    20b0:	4ad2                	lw	s5,20(sp)
    20b2:	4b42                	lw	s6,16(sp)
    20b4:	4bb2                	lw	s7,12(sp)
    20b6:	6145                	addi	sp,sp,48
    20b8:	8082                	ret
    20ba:	0485                	addi	s1,s1,1
    20bc:	bf9d                	j	2032 <_printf_common+0x56>
    20be:	00d40733          	add	a4,s0,a3
    20c2:	03000613          	li	a2,48
    20c6:	04c701a3          	sb	a2,67(a4)
    20ca:	04544703          	lbu	a4,69(s0)
    20ce:	00168793          	addi	a5,a3,1
    20d2:	97a2                	add	a5,a5,s0
    20d4:	0689                	addi	a3,a3,2
    20d6:	04e781a3          	sb	a4,67(a5)
    20da:	bf95                	j	204e <_printf_common+0x72>
    20dc:	4685                	li	a3,1
    20de:	8622                	mv	a2,s0
    20e0:	85de                	mv	a1,s7
    20e2:	855a                	mv	a0,s6
    20e4:	9982                	jalr	s3
    20e6:	fb450ee3          	beq	a0,s4,20a2 <_printf_common+0xc6>
    20ea:	0905                	addi	s2,s2,1
    20ec:	b745                	j	208c <_printf_common+0xb0>

000020ee <_printf_i>:
    20ee:	7139                	addi	sp,sp,-64
    20f0:	dc22                	sw	s0,56(sp)
    20f2:	da26                	sw	s1,52(sp)
    20f4:	d452                	sw	s4,40(sp)
    20f6:	d256                	sw	s5,36(sp)
    20f8:	de06                	sw	ra,60(sp)
    20fa:	d84a                	sw	s2,48(sp)
    20fc:	d64e                	sw	s3,44(sp)
    20fe:	0185c783          	lbu	a5,24(a1)
    2102:	84b6                	mv	s1,a3
    2104:	07800693          	li	a3,120
    2108:	8a2a                	mv	s4,a0
    210a:	842e                	mv	s0,a1
    210c:	8ab2                	mv	s5,a2
    210e:	00f6ee63          	bltu	a3,a5,212a <_printf_i+0x3c>
    2112:	06200693          	li	a3,98
    2116:	04358613          	addi	a2,a1,67
    211a:	00f6eb63          	bltu	a3,a5,2130 <_printf_i+0x42>
    211e:	1a078863          	beqz	a5,22ce <_printf_i+0x1e0>
    2122:	05800693          	li	a3,88
    2126:	16d78563          	beq	a5,a3,2290 <_printf_i+0x1a2>
    212a:	04240913          	addi	s2,s0,66
    212e:	a035                	j	215a <_printf_i+0x6c>
    2130:	f9d78693          	addi	a3,a5,-99
    2134:	0ff6f693          	zext.b	a3,a3
    2138:	45d5                	li	a1,21
    213a:	fed5e8e3          	bltu	a1,a3,212a <_printf_i+0x3c>
    213e:	65a9                	lui	a1,0xa
    2140:	068a                	slli	a3,a3,0x2
    2142:	56858593          	addi	a1,a1,1384 # a568 <jump_table.2+0x20>
    2146:	96ae                	add	a3,a3,a1
    2148:	4294                	lw	a3,0(a3)
    214a:	8682                	jr	a3
    214c:	431c                	lw	a5,0(a4)
    214e:	04240913          	addi	s2,s0,66
    2152:	00478693          	addi	a3,a5,4
    2156:	439c                	lw	a5,0(a5)
    2158:	c314                	sw	a3,0(a4)
    215a:	04f40123          	sb	a5,66(s0)
    215e:	4785                	li	a5,1
    2160:	aa51                	j	22f4 <_printf_i+0x206>
    2162:	401c                	lw	a5,0(s0)
    2164:	4308                	lw	a0,0(a4)
    2166:	0807f693          	andi	a3,a5,128
    216a:	00450593          	addi	a1,a0,4
    216e:	c285                	beqz	a3,218e <_printf_i+0xa0>
    2170:	411c                	lw	a5,0(a0)
    2172:	c30c                	sw	a1,0(a4)
    2174:	66ad                	lui	a3,0xb
    2176:	0007d863          	bgez	a5,2186 <_printf_i+0x98>
    217a:	02d00713          	li	a4,45
    217e:	40f007b3          	neg	a5,a5
    2182:	04e401a3          	sb	a4,67(s0)
    2186:	8bc68693          	addi	a3,a3,-1860 # a8bc <__clz_tab+0x2c0>
    218a:	4729                	li	a4,10
    218c:	a091                	j	21d0 <_printf_i+0xe2>
    218e:	0407f693          	andi	a3,a5,64
    2192:	411c                	lw	a5,0(a0)
    2194:	c30c                	sw	a1,0(a4)
    2196:	def9                	beqz	a3,2174 <_printf_i+0x86>
    2198:	07c2                	slli	a5,a5,0x10
    219a:	87c1                	srai	a5,a5,0x10
    219c:	bfe1                	j	2174 <_printf_i+0x86>
    219e:	400c                	lw	a1,0(s0)
    21a0:	4314                	lw	a3,0(a4)
    21a2:	0805f513          	andi	a0,a1,128
    21a6:	429c                	lw	a5,0(a3)
    21a8:	0691                	addi	a3,a3,4
    21aa:	e511                	bnez	a0,21b6 <_printf_i+0xc8>
    21ac:	0405f593          	andi	a1,a1,64
    21b0:	c199                	beqz	a1,21b6 <_printf_i+0xc8>
    21b2:	07c2                	slli	a5,a5,0x10
    21b4:	83c1                	srli	a5,a5,0x10
    21b6:	c314                	sw	a3,0(a4)
    21b8:	01844583          	lbu	a1,24(s0)
    21bc:	66ad                	lui	a3,0xb
    21be:	06f00713          	li	a4,111
    21c2:	8bc68693          	addi	a3,a3,-1860 # a8bc <__clz_tab+0x2c0>
    21c6:	0ce59e63          	bne	a1,a4,22a2 <_printf_i+0x1b4>
    21ca:	4721                	li	a4,8
    21cc:	040401a3          	sb	zero,67(s0)
    21d0:	404c                	lw	a1,4(s0)
    21d2:	c40c                	sw	a1,8(s0)
    21d4:	0005c863          	bltz	a1,21e4 <_printf_i+0xf6>
    21d8:	4008                	lw	a0,0(s0)
    21da:	8ddd                	or	a1,a1,a5
    21dc:	8932                	mv	s2,a2
    21de:	996d                	andi	a0,a0,-5
    21e0:	c008                	sw	a0,0(s0)
    21e2:	cd99                	beqz	a1,2200 <_printf_i+0x112>
    21e4:	8932                	mv	s2,a2
    21e6:	02e7f5b3          	remu	a1,a5,a4
    21ea:	197d                	addi	s2,s2,-1
    21ec:	95b6                	add	a1,a1,a3
    21ee:	0005c583          	lbu	a1,0(a1)
    21f2:	00b90023          	sb	a1,0(s2)
    21f6:	85be                	mv	a1,a5
    21f8:	02e7d7b3          	divu	a5,a5,a4
    21fc:	fee5f5e3          	bgeu	a1,a4,21e6 <_printf_i+0xf8>
    2200:	47a1                	li	a5,8
    2202:	00f71e63          	bne	a4,a5,221e <_printf_i+0x130>
    2206:	401c                	lw	a5,0(s0)
    2208:	8b85                	andi	a5,a5,1
    220a:	cb91                	beqz	a5,221e <_printf_i+0x130>
    220c:	4058                	lw	a4,4(s0)
    220e:	481c                	lw	a5,16(s0)
    2210:	00e7c763          	blt	a5,a4,221e <_printf_i+0x130>
    2214:	03000793          	li	a5,48
    2218:	fef90fa3          	sb	a5,-1(s2)
    221c:	197d                	addi	s2,s2,-1
    221e:	41260633          	sub	a2,a2,s2
    2222:	c810                	sw	a2,16(s0)
    2224:	8726                	mv	a4,s1
    2226:	86d6                	mv	a3,s5
    2228:	0870                	addi	a2,sp,28
    222a:	85a2                	mv	a1,s0
    222c:	8552                	mv	a0,s4
    222e:	337d                	jal	1fdc <_printf_common>
    2230:	59fd                	li	s3,-1
    2232:	0d351563          	bne	a0,s3,22fc <_printf_i+0x20e>
    2236:	557d                	li	a0,-1
    2238:	50f2                	lw	ra,60(sp)
    223a:	5462                	lw	s0,56(sp)
    223c:	54d2                	lw	s1,52(sp)
    223e:	5942                	lw	s2,48(sp)
    2240:	59b2                	lw	s3,44(sp)
    2242:	5a22                	lw	s4,40(sp)
    2244:	5a92                	lw	s5,36(sp)
    2246:	6121                	addi	sp,sp,64
    2248:	8082                	ret
    224a:	401c                	lw	a5,0(s0)
    224c:	0207e793          	ori	a5,a5,32
    2250:	c01c                	sw	a5,0(s0)
    2252:	66ad                	lui	a3,0xb
    2254:	07800793          	li	a5,120
    2258:	8d068693          	addi	a3,a3,-1840 # a8d0 <__clz_tab+0x2d4>
    225c:	04f402a3          	sb	a5,69(s0)
    2260:	400c                	lw	a1,0(s0)
    2262:	4308                	lw	a0,0(a4)
    2264:	0805f813          	andi	a6,a1,128
    2268:	411c                	lw	a5,0(a0)
    226a:	0511                	addi	a0,a0,4
    226c:	00081863          	bnez	a6,227c <_printf_i+0x18e>
    2270:	0405f813          	andi	a6,a1,64
    2274:	00080463          	beqz	a6,227c <_printf_i+0x18e>
    2278:	07c2                	slli	a5,a5,0x10
    227a:	83c1                	srli	a5,a5,0x10
    227c:	c308                	sw	a0,0(a4)
    227e:	0015f713          	andi	a4,a1,1
    2282:	c701                	beqz	a4,228a <_printf_i+0x19c>
    2284:	0205e593          	ori	a1,a1,32
    2288:	c00c                	sw	a1,0(s0)
    228a:	c799                	beqz	a5,2298 <_printf_i+0x1aa>
    228c:	4741                	li	a4,16
    228e:	bf3d                	j	21cc <_printf_i+0xde>
    2290:	66ad                	lui	a3,0xb
    2292:	8bc68693          	addi	a3,a3,-1860 # a8bc <__clz_tab+0x2c0>
    2296:	b7d9                	j	225c <_printf_i+0x16e>
    2298:	4018                	lw	a4,0(s0)
    229a:	fdf77713          	andi	a4,a4,-33
    229e:	c018                	sw	a4,0(s0)
    22a0:	b7f5                	j	228c <_printf_i+0x19e>
    22a2:	4729                	li	a4,10
    22a4:	b725                	j	21cc <_printf_i+0xde>
    22a6:	4014                	lw	a3,0(s0)
    22a8:	431c                	lw	a5,0(a4)
    22aa:	484c                	lw	a1,20(s0)
    22ac:	0806f813          	andi	a6,a3,128
    22b0:	00478513          	addi	a0,a5,4
    22b4:	00080663          	beqz	a6,22c0 <_printf_i+0x1d2>
    22b8:	c308                	sw	a0,0(a4)
    22ba:	439c                	lw	a5,0(a5)
    22bc:	c38c                	sw	a1,0(a5)
    22be:	a801                	j	22ce <_printf_i+0x1e0>
    22c0:	c308                	sw	a0,0(a4)
    22c2:	0406f693          	andi	a3,a3,64
    22c6:	439c                	lw	a5,0(a5)
    22c8:	daf5                	beqz	a3,22bc <_printf_i+0x1ce>
    22ca:	00b79023          	sh	a1,0(a5)
    22ce:	00042823          	sw	zero,16(s0)
    22d2:	8932                	mv	s2,a2
    22d4:	bf81                	j	2224 <_printf_i+0x136>
    22d6:	431c                	lw	a5,0(a4)
    22d8:	4050                	lw	a2,4(s0)
    22da:	4581                	li	a1,0
    22dc:	00478693          	addi	a3,a5,4
    22e0:	c314                	sw	a3,0(a4)
    22e2:	0007a903          	lw	s2,0(a5)
    22e6:	854a                	mv	a0,s2
    22e8:	2a05                	jal	2418 <memchr>
    22ea:	c501                	beqz	a0,22f2 <_printf_i+0x204>
    22ec:	41250533          	sub	a0,a0,s2
    22f0:	c048                	sw	a0,4(s0)
    22f2:	405c                	lw	a5,4(s0)
    22f4:	c81c                	sw	a5,16(s0)
    22f6:	040401a3          	sb	zero,67(s0)
    22fa:	b72d                	j	2224 <_printf_i+0x136>
    22fc:	4814                	lw	a3,16(s0)
    22fe:	864a                	mv	a2,s2
    2300:	85d6                	mv	a1,s5
    2302:	8552                	mv	a0,s4
    2304:	9482                	jalr	s1
    2306:	f33508e3          	beq	a0,s3,2236 <_printf_i+0x148>
    230a:	401c                	lw	a5,0(s0)
    230c:	8b89                	andi	a5,a5,2
    230e:	e795                	bnez	a5,233a <_printf_i+0x24c>
    2310:	47f2                	lw	a5,28(sp)
    2312:	4448                	lw	a0,12(s0)
    2314:	f2f552e3          	bge	a0,a5,2238 <_printf_i+0x14a>
    2318:	853e                	mv	a0,a5
    231a:	bf39                	j	2238 <_printf_i+0x14a>
    231c:	4685                	li	a3,1
    231e:	85d6                	mv	a1,s5
    2320:	8552                	mv	a0,s4
    2322:	c632                	sw	a2,12(sp)
    2324:	9482                	jalr	s1
    2326:	f13508e3          	beq	a0,s3,2236 <_printf_i+0x148>
    232a:	4632                	lw	a2,12(sp)
    232c:	0905                	addi	s2,s2,1
    232e:	445c                	lw	a5,12(s0)
    2330:	4772                	lw	a4,28(sp)
    2332:	8f99                	sub	a5,a5,a4
    2334:	fef944e3          	blt	s2,a5,231c <_printf_i+0x22e>
    2338:	bfe1                	j	2310 <_printf_i+0x222>
    233a:	4901                	li	s2,0
    233c:	01940613          	addi	a2,s0,25
    2340:	b7fd                	j	232e <_printf_i+0x240>

00002342 <__swhatbuf_r>:
    2342:	7119                	addi	sp,sp,-128
    2344:	dca2                	sw	s0,120(sp)
    2346:	842e                	mv	s0,a1
    2348:	00e59583          	lh	a1,14(a1)
    234c:	daa6                	sw	s1,116(sp)
    234e:	de86                	sw	ra,124(sp)
    2350:	84b2                	mv	s1,a2
    2352:	0205d163          	bgez	a1,2374 <__swhatbuf_r+0x32>
    2356:	00c45783          	lhu	a5,12(s0)
    235a:	0807f793          	andi	a5,a5,128
    235e:	eb8d                	bnez	a5,2390 <__swhatbuf_r+0x4e>
    2360:	40000713          	li	a4,1024
    2364:	50f6                	lw	ra,124(sp)
    2366:	5466                	lw	s0,120(sp)
    2368:	c29c                	sw	a5,0(a3)
    236a:	c098                	sw	a4,0(s1)
    236c:	4501                	li	a0,0
    236e:	54d6                	lw	s1,116(sp)
    2370:	6109                	addi	sp,sp,128
    2372:	8082                	ret
    2374:	0830                	addi	a2,sp,24
    2376:	c636                	sw	a3,12(sp)
    2378:	286d                	jal	2432 <_fstat_r>
    237a:	46b2                	lw	a3,12(sp)
    237c:	fc054de3          	bltz	a0,2356 <__swhatbuf_r+0x14>
    2380:	47f2                	lw	a5,28(sp)
    2382:	673d                	lui	a4,0xf
    2384:	8ff9                	and	a5,a5,a4
    2386:	7779                	lui	a4,0xffffe
    2388:	97ba                	add	a5,a5,a4
    238a:	0017b793          	seqz	a5,a5
    238e:	bfc9                	j	2360 <__swhatbuf_r+0x1e>
    2390:	4781                	li	a5,0
    2392:	04000713          	li	a4,64
    2396:	b7f9                	j	2364 <__swhatbuf_r+0x22>

00002398 <__smakebuf_r>:
    2398:	00c5d703          	lhu	a4,12(a1)
    239c:	7179                	addi	sp,sp,-48
    239e:	d422                	sw	s0,40(sp)
    23a0:	d606                	sw	ra,44(sp)
    23a2:	d226                	sw	s1,36(sp)
    23a4:	8b09                	andi	a4,a4,2
    23a6:	842e                	mv	s0,a1
    23a8:	cf01                	beqz	a4,23c0 <__smakebuf_r+0x28>
    23aa:	04740793          	addi	a5,s0,71
    23ae:	c01c                	sw	a5,0(s0)
    23b0:	c81c                	sw	a5,16(s0)
    23b2:	4785                	li	a5,1
    23b4:	c85c                	sw	a5,20(s0)
    23b6:	50b2                	lw	ra,44(sp)
    23b8:	5422                	lw	s0,40(sp)
    23ba:	5492                	lw	s1,36(sp)
    23bc:	6145                	addi	sp,sp,48
    23be:	8082                	ret
    23c0:	0874                	addi	a3,sp,28
    23c2:	0830                	addi	a2,sp,24
    23c4:	84aa                	mv	s1,a0
    23c6:	3fb5                	jal	2342 <__swhatbuf_r>
    23c8:	45e2                	lw	a1,24(sp)
    23ca:	8526                	mv	a0,s1
    23cc:	c62e                	sw	a1,12(sp)
    23ce:	c88ff0ef          	jal	1856 <_malloc_r>
    23d2:	00c41783          	lh	a5,12(s0)
    23d6:	45b2                	lw	a1,12(sp)
    23d8:	e911                	bnez	a0,23ec <__smakebuf_r+0x54>
    23da:	2007f713          	andi	a4,a5,512
    23de:	ff61                	bnez	a4,23b6 <__smakebuf_r+0x1e>
    23e0:	9bf1                	andi	a5,a5,-4
    23e2:	0027e793          	ori	a5,a5,2
    23e6:	00f41623          	sh	a5,12(s0)
    23ea:	b7c1                	j	23aa <__smakebuf_r+0x12>
    23ec:	0807e793          	ori	a5,a5,128
    23f0:	00f41623          	sh	a5,12(s0)
    23f4:	47f2                	lw	a5,28(sp)
    23f6:	c008                	sw	a0,0(s0)
    23f8:	c808                	sw	a0,16(s0)
    23fa:	c84c                	sw	a1,20(s0)
    23fc:	dfcd                	beqz	a5,23b6 <__smakebuf_r+0x1e>
    23fe:	00e41583          	lh	a1,14(s0)
    2402:	8526                	mv	a0,s1
    2404:	28b1                	jal	2460 <_isatty_r>
    2406:	d945                	beqz	a0,23b6 <__smakebuf_r+0x1e>
    2408:	00c45783          	lhu	a5,12(s0)
    240c:	9bf1                	andi	a5,a5,-4
    240e:	0017e793          	ori	a5,a5,1
    2412:	00f41623          	sh	a5,12(s0)
    2416:	b745                	j	23b6 <__smakebuf_r+0x1e>

00002418 <memchr>:
    2418:	0ff5f593          	zext.b	a1,a1
    241c:	962a                	add	a2,a2,a0
    241e:	00c51463          	bne	a0,a2,2426 <memchr+0xe>
    2422:	4501                	li	a0,0
    2424:	8082                	ret
    2426:	00054783          	lbu	a5,0(a0)
    242a:	feb78de3          	beq	a5,a1,2424 <memchr+0xc>
    242e:	0505                	addi	a0,a0,1
    2430:	b7fd                	j	241e <memchr+0x6>

00002432 <_fstat_r>:
    2432:	1141                	addi	sp,sp,-16
    2434:	c422                	sw	s0,8(sp)
    2436:	c226                	sw	s1,4(sp)
    2438:	84aa                	mv	s1,a0
    243a:	852e                	mv	a0,a1
    243c:	85b2                	mv	a1,a2
    243e:	c606                	sw	ra,12(sp)
    2440:	9401a823          	sw	zero,-1712(gp) # b394 <errno>
    2444:	e69fe0ef          	jal	12ac <_fstat>
    2448:	57fd                	li	a5,-1
    244a:	00f51663          	bne	a0,a5,2456 <_fstat_r+0x24>
    244e:	9501a783          	lw	a5,-1712(gp) # b394 <errno>
    2452:	c391                	beqz	a5,2456 <_fstat_r+0x24>
    2454:	c09c                	sw	a5,0(s1)
    2456:	40b2                	lw	ra,12(sp)
    2458:	4422                	lw	s0,8(sp)
    245a:	4492                	lw	s1,4(sp)
    245c:	0141                	addi	sp,sp,16
    245e:	8082                	ret

00002460 <_isatty_r>:
    2460:	1141                	addi	sp,sp,-16
    2462:	c422                	sw	s0,8(sp)
    2464:	c226                	sw	s1,4(sp)
    2466:	84aa                	mv	s1,a0
    2468:	852e                	mv	a0,a1
    246a:	c606                	sw	ra,12(sp)
    246c:	9401a823          	sw	zero,-1712(gp) # b394 <errno>
    2470:	e45fe0ef          	jal	12b4 <_isatty>
    2474:	57fd                	li	a5,-1
    2476:	00f51663          	bne	a0,a5,2482 <_isatty_r+0x22>
    247a:	9501a783          	lw	a5,-1712(gp) # b394 <errno>
    247e:	c391                	beqz	a5,2482 <_isatty_r+0x22>
    2480:	c09c                	sw	a5,0(s1)
    2482:	40b2                	lw	ra,12(sp)
    2484:	4422                	lw	s0,8(sp)
    2486:	4492                	lw	s1,4(sp)
    2488:	0141                	addi	sp,sp,16
    248a:	8082                	ret

0000248c <sqrt>:
    248c:	1101                	addi	sp,sp,-32
    248e:	cc22                	sw	s0,24(sp)
    2490:	ca26                	sw	s1,20(sp)
    2492:	c84a                	sw	s2,16(sp)
    2494:	c64e                	sw	s3,12(sp)
    2496:	892a                	mv	s2,a0
    2498:	89ae                	mv	s3,a1
    249a:	ce06                	sw	ra,28(sp)
    249c:	20b1                	jal	24e8 <__ieee754_sqrt>
    249e:	84aa                	mv	s1,a0
    24a0:	842e                	mv	s0,a1
    24a2:	864a                	mv	a2,s2
    24a4:	86ce                	mv	a3,s3
    24a6:	854a                	mv	a0,s2
    24a8:	85ce                	mv	a1,s3
    24aa:	78a010ef          	jal	3c34 <__unorddf2>
    24ae:	e505                	bnez	a0,24d6 <sqrt+0x4a>
    24b0:	4601                	li	a2,0
    24b2:	4681                	li	a3,0
    24b4:	854a                	mv	a0,s2
    24b6:	85ce                	mv	a1,s3
    24b8:	7ea010ef          	jal	3ca2 <__ledf2>
    24bc:	00055d63          	bgez	a0,24d6 <sqrt+0x4a>
    24c0:	30a9                	jal	1d0a <__errno>
    24c2:	02100793          	li	a5,33
    24c6:	4601                	li	a2,0
    24c8:	4681                	li	a3,0
    24ca:	c11c                	sw	a5,0(a0)
    24cc:	85b6                	mv	a1,a3
    24ce:	8532                	mv	a0,a2
    24d0:	2f69                	jal	2c6a <__divdf3>
    24d2:	84aa                	mv	s1,a0
    24d4:	842e                	mv	s0,a1
    24d6:	40f2                	lw	ra,28(sp)
    24d8:	85a2                	mv	a1,s0
    24da:	4462                	lw	s0,24(sp)
    24dc:	4942                	lw	s2,16(sp)
    24de:	49b2                	lw	s3,12(sp)
    24e0:	8526                	mv	a0,s1
    24e2:	44d2                	lw	s1,20(sp)
    24e4:	6105                	addi	sp,sp,32
    24e6:	8082                	ret

000024e8 <__ieee754_sqrt>:
    24e8:	1101                	addi	sp,sp,-32
    24ea:	7ff007b7          	lui	a5,0x7ff00
    24ee:	cc22                	sw	s0,24(sp)
    24f0:	ca26                	sw	s1,20(sp)
    24f2:	ce06                	sw	ra,28(sp)
    24f4:	c84a                	sw	s2,16(sp)
    24f6:	c64e                	sw	s3,12(sp)
    24f8:	c452                	sw	s4,8(sp)
    24fa:	c256                	sw	s5,4(sp)
    24fc:	c05a                	sw	s6,0(sp)
    24fe:	00b7f733          	and	a4,a5,a1
    2502:	84aa                	mv	s1,a0
    2504:	842e                	mv	s0,a1
    2506:	02f71963          	bne	a4,a5,2538 <__ieee754_sqrt+0x50>
    250a:	862a                	mv	a2,a0
    250c:	86ae                	mv	a3,a1
    250e:	527000ef          	jal	3234 <__muldf3>
    2512:	862a                	mv	a2,a0
    2514:	86ae                	mv	a3,a1
    2516:	8526                	mv	a0,s1
    2518:	85a2                	mv	a1,s0
    251a:	22c9                	jal	26dc <__adddf3>
    251c:	84aa                	mv	s1,a0
    251e:	842e                	mv	s0,a1
    2520:	40f2                	lw	ra,28(sp)
    2522:	85a2                	mv	a1,s0
    2524:	4462                	lw	s0,24(sp)
    2526:	4942                	lw	s2,16(sp)
    2528:	49b2                	lw	s3,12(sp)
    252a:	4a22                	lw	s4,8(sp)
    252c:	4a92                	lw	s5,4(sp)
    252e:	4b02                	lw	s6,0(sp)
    2530:	8526                	mv	a0,s1
    2532:	44d2                	lw	s1,20(sp)
    2534:	6105                	addi	sp,sp,32
    2536:	8082                	ret
    2538:	872e                	mv	a4,a1
    253a:	87aa                	mv	a5,a0
    253c:	02b04163          	bgtz	a1,255e <__ieee754_sqrt+0x76>
    2540:	00159693          	slli	a3,a1,0x1
    2544:	8285                	srli	a3,a3,0x1
    2546:	8ec9                	or	a3,a3,a0
    2548:	dee1                	beqz	a3,2520 <__ieee754_sqrt+0x38>
    254a:	4681                	li	a3,0
    254c:	c195                	beqz	a1,2570 <__ieee754_sqrt+0x88>
    254e:	862a                	mv	a2,a0
    2550:	86ae                	mv	a3,a1
    2552:	12c010ef          	jal	367e <__subdf3>
    2556:	862a                	mv	a2,a0
    2558:	86ae                	mv	a3,a1
    255a:	2f01                	jal	2c6a <__divdf3>
    255c:	b7c1                	j	251c <__ieee754_sqrt+0x34>
    255e:	4145d693          	srai	a3,a1,0x14
    2562:	ea95                	bnez	a3,2596 <__ieee754_sqrt+0xae>
    2564:	4601                	li	a2,0
    2566:	a809                	j	2578 <__ieee754_sqrt+0x90>
    2568:	00b7d713          	srli	a4,a5,0xb
    256c:	16ad                	addi	a3,a3,-21
    256e:	07d6                	slli	a5,a5,0x15
    2570:	df65                	beqz	a4,2568 <__ieee754_sqrt+0x80>
    2572:	bfcd                	j	2564 <__ieee754_sqrt+0x7c>
    2574:	0706                	slli	a4,a4,0x1
    2576:	0605                	addi	a2,a2,1
    2578:	00b71593          	slli	a1,a4,0xb
    257c:	fe05dce3          	bgez	a1,2574 <__ieee754_sqrt+0x8c>
    2580:	fff60593          	addi	a1,a2,-1
    2584:	8e8d                	sub	a3,a3,a1
    2586:	02000593          	li	a1,32
    258a:	8d91                	sub	a1,a1,a2
    258c:	00b7d5b3          	srl	a1,a5,a1
    2590:	8f4d                	or	a4,a4,a1
    2592:	00c797b3          	sll	a5,a5,a2
    2596:	c0168613          	addi	a2,a3,-1023
    259a:	001006b7          	lui	a3,0x100
    259e:	fff68593          	addi	a1,a3,-1 # fffff <_sp+0xf3a0f>
    25a2:	8f6d                	and	a4,a4,a1
    25a4:	8ed9                	or	a3,a3,a4
    25a6:	00167713          	andi	a4,a2,1
    25aa:	c711                	beqz	a4,25b6 <__ieee754_sqrt+0xce>
    25ac:	01f7d713          	srli	a4,a5,0x1f
    25b0:	0686                	slli	a3,a3,0x1
    25b2:	96ba                	add	a3,a3,a4
    25b4:	0786                	slli	a5,a5,0x1
    25b6:	01f7d713          	srli	a4,a5,0x1f
    25ba:	0686                	slli	a3,a3,0x1
    25bc:	40165413          	srai	s0,a2,0x1
    25c0:	9736                	add	a4,a4,a3
    25c2:	0786                	slli	a5,a5,0x1
    25c4:	46d9                	li	a3,22
    25c6:	4981                	li	s3,0
    25c8:	4601                	li	a2,0
    25ca:	002005b7          	lui	a1,0x200
    25ce:	00b60533          	add	a0,a2,a1
    25d2:	00a74663          	blt	a4,a0,25de <__ieee754_sqrt+0xf6>
    25d6:	00b50633          	add	a2,a0,a1
    25da:	8f09                	sub	a4,a4,a0
    25dc:	99ae                	add	s3,s3,a1
    25de:	01f7d513          	srli	a0,a5,0x1f
    25e2:	0706                	slli	a4,a4,0x1
    25e4:	16fd                	addi	a3,a3,-1
    25e6:	972a                	add	a4,a4,a0
    25e8:	0786                	slli	a5,a5,0x1
    25ea:	8185                	srli	a1,a1,0x1
    25ec:	f2ed                	bnez	a3,25ce <__ieee754_sqrt+0xe6>
    25ee:	4901                	li	s2,0
    25f0:	02000893          	li	a7,32
    25f4:	800005b7          	lui	a1,0x80000
    25f8:	00d58833          	add	a6,a1,a3
    25fc:	40c70333          	sub	t1,a4,a2
    2600:	00e64663          	blt	a2,a4,260c <__ieee754_sqrt+0x124>
    2604:	02031363          	bnez	t1,262a <__ieee754_sqrt+0x142>
    2608:	0307e163          	bltu	a5,a6,262a <__ieee754_sqrt+0x142>
    260c:	00b806b3          	add	a3,a6,a1
    2610:	fff6c513          	not	a0,a3
    2614:	01057533          	and	a0,a0,a6
    2618:	0107b733          	sltu	a4,a5,a6
    261c:	817d                	srli	a0,a0,0x1f
    261e:	40e30733          	sub	a4,t1,a4
    2622:	410787b3          	sub	a5,a5,a6
    2626:	992e                	add	s2,s2,a1
    2628:	962a                	add	a2,a2,a0
    262a:	01f7d513          	srli	a0,a5,0x1f
    262e:	0706                	slli	a4,a4,0x1
    2630:	18fd                	addi	a7,a7,-1
    2632:	972a                	add	a4,a4,a0
    2634:	0786                	slli	a5,a5,0x1
    2636:	8185                	srli	a1,a1,0x1
    2638:	fc0890e3          	bnez	a7,25f8 <__ieee754_sqrt+0x110>
    263c:	8f5d                	or	a4,a4,a5
    263e:	c731                	beqz	a4,268a <__ieee754_sqrt+0x1a2>
    2640:	93c1a503          	lw	a0,-1732(gp) # b380 <one>
    2644:	9401a583          	lw	a1,-1728(gp) # b384 <one+0x4>
    2648:	9341a603          	lw	a2,-1740(gp) # b378 <tiny>
    264c:	9381a683          	lw	a3,-1736(gp) # b37c <tiny+0x4>
    2650:	93c1a783          	lw	a5,-1732(gp) # b380 <one>
    2654:	9401a803          	lw	a6,-1728(gp) # b384 <one+0x4>
    2658:	8abe                	mv	s5,a5
    265a:	8b42                	mv	s6,a6
    265c:	022010ef          	jal	367e <__subdf3>
    2660:	862a                	mv	a2,a0
    2662:	86ae                	mv	a3,a1
    2664:	8556                	mv	a0,s5
    2666:	85da                	mv	a1,s6
    2668:	63a010ef          	jal	3ca2 <__ledf2>
    266c:	00a04f63          	bgtz	a0,268a <__ieee754_sqrt+0x1a2>
    2670:	93c1a503          	lw	a0,-1732(gp) # b380 <one>
    2674:	9401a583          	lw	a1,-1728(gp) # b384 <one+0x4>
    2678:	9341a603          	lw	a2,-1740(gp) # b378 <tiny>
    267c:	9381a683          	lw	a3,-1736(gp) # b37c <tiny+0x4>
    2680:	57fd                	li	a5,-1
    2682:	02f91463          	bne	s2,a5,26aa <__ieee754_sqrt+0x1c2>
    2686:	0985                	addi	s3,s3,1
    2688:	4901                	li	s2,0
    268a:	3fe007b7          	lui	a5,0x3fe00
    268e:	4019d593          	srai	a1,s3,0x1
    2692:	95be                	add	a1,a1,a5
    2694:	01441613          	slli	a2,s0,0x14
    2698:	01f99713          	slli	a4,s3,0x1f
    269c:	00195793          	srli	a5,s2,0x1
    26a0:	00f764b3          	or	s1,a4,a5
    26a4:	00b60433          	add	s0,a2,a1
    26a8:	bda5                	j	2520 <__ieee754_sqrt+0x38>
    26aa:	93c1aa03          	lw	s4,-1732(gp) # b380 <one>
    26ae:	9401aa83          	lw	s5,-1728(gp) # b384 <one+0x4>
    26b2:	202d                	jal	26dc <__adddf3>
    26b4:	862a                	mv	a2,a0
    26b6:	86ae                	mv	a3,a1
    26b8:	8552                	mv	a0,s4
    26ba:	85d6                	mv	a1,s5
    26bc:	5e6010ef          	jal	3ca2 <__ledf2>
    26c0:	00055963          	bgez	a0,26d2 <__ieee754_sqrt+0x1ea>
    26c4:	00290793          	addi	a5,s2,2
    26c8:	0017b713          	seqz	a4,a5
    26cc:	99ba                	add	s3,s3,a4
    26ce:	893e                	mv	s2,a5
    26d0:	bf6d                	j	268a <__ieee754_sqrt+0x1a2>
    26d2:	00190793          	addi	a5,s2,1
    26d6:	ffe7f913          	andi	s2,a5,-2
    26da:	bf45                	j	268a <__ieee754_sqrt+0x1a2>

000026dc <__adddf3>:
  FP_DECL_D (B);
  FP_DECL_D (R);
  DFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_SEMIRAW_D (A, a);
    26dc:	00100737          	lui	a4,0x100
{
    26e0:	1101                	addi	sp,sp,-32
  FP_UNPACK_SEMIRAW_D (A, a);
    26e2:	177d                	addi	a4,a4,-1 # fffff <_sp+0xf3a0f>
    26e4:	00b777b3          	and	a5,a4,a1
  FP_UNPACK_SEMIRAW_D (B, b);
    26e8:	0146d893          	srli	a7,a3,0x14
    26ec:	8f75                	and	a4,a4,a3
{
    26ee:	cc22                	sw	s0,24(sp)
  FP_UNPACK_SEMIRAW_D (A, a);
    26f0:	0145d413          	srli	s0,a1,0x14
  FP_UNPACK_SEMIRAW_D (B, b);
    26f4:	070e                	slli	a4,a4,0x3
    26f6:	01d65813          	srli	a6,a2,0x1d
{
    26fa:	c84a                	sw	s2,16(sp)
  FP_UNPACK_SEMIRAW_D (A, a);
    26fc:	7ff47413          	andi	s0,s0,2047
    2700:	01f5d913          	srli	s2,a1,0x1f
    2704:	078e                	slli	a5,a5,0x3
    2706:	01d55593          	srli	a1,a0,0x1d
  FP_UNPACK_SEMIRAW_D (B, b);
    270a:	7ff8f893          	andi	a7,a7,2047
{
    270e:	ce06                	sw	ra,28(sp)
    2710:	ca26                	sw	s1,20(sp)
    2712:	c64e                	sw	s3,12(sp)
  FP_UNPACK_SEMIRAW_D (B, b);
    2714:	82fd                	srli	a3,a3,0x1f
  FP_UNPACK_SEMIRAW_D (A, a);
    2716:	8fcd                	or	a5,a5,a1
  FP_UNPACK_SEMIRAW_D (B, b);
    2718:	00e86833          	or	a6,a6,a4
  FP_UNPACK_SEMIRAW_D (A, a);
    271c:	050e                	slli	a0,a0,0x3
  FP_UNPACK_SEMIRAW_D (B, b);
    271e:	060e                	slli	a2,a2,0x3
  FP_ADD_D (R, A, B);
    2720:	41140733          	sub	a4,s0,a7
    2724:	7ff00593          	li	a1,2047
    2728:	24d91563          	bne	s2,a3,2972 <__adddf3+0x296>
    272c:	0ce05763          	blez	a4,27fa <__adddf3+0x11e>
    2730:	02089363          	bnez	a7,2756 <__adddf3+0x7a>
    2734:	00c86733          	or	a4,a6,a2
    2738:	cf09                	beqz	a4,2752 <__adddf3+0x76>
    273a:	fff40713          	addi	a4,s0,-1
    273e:	eb01                	bnez	a4,274e <__adddf3+0x72>
    2740:	962a                	add	a2,a2,a0
    2742:	97c2                	add	a5,a5,a6
    2744:	00a63533          	sltu	a0,a2,a0
    2748:	97aa                	add	a5,a5,a0
    274a:	4405                	li	s0,1
    274c:	a891                	j	27a0 <__adddf3+0xc4>
    274e:	00b41a63          	bne	s0,a1,2762 <__adddf3+0x86>
    2752:	862a                	mv	a2,a0
    2754:	aa9d                	j	28ca <__adddf3+0x1ee>
    2756:	feb40ee3          	beq	s0,a1,2752 <__adddf3+0x76>
    275a:	008006b7          	lui	a3,0x800
    275e:	00d86833          	or	a6,a6,a3
    2762:	03800693          	li	a3,56
    2766:	08e6c563          	blt	a3,a4,27f0 <__adddf3+0x114>
    276a:	46fd                	li	a3,31
    276c:	02000893          	li	a7,32
    2770:	04e6ce63          	blt	a3,a4,27cc <__adddf3+0xf0>
    2774:	40e888b3          	sub	a7,a7,a4
    2778:	011816b3          	sll	a3,a6,a7
    277c:	00e655b3          	srl	a1,a2,a4
    2780:	011618b3          	sll	a7,a2,a7
    2784:	8ecd                	or	a3,a3,a1
    2786:	011038b3          	snez	a7,a7
    278a:	0116e6b3          	or	a3,a3,a7
    278e:	00e85733          	srl	a4,a6,a4
    2792:	00a68633          	add	a2,a3,a0
    2796:	973e                	add	a4,a4,a5
    2798:	00d636b3          	sltu	a3,a2,a3
    279c:	00d707b3          	add	a5,a4,a3
    27a0:	00879713          	slli	a4,a5,0x8
    27a4:	18075b63          	bgez	a4,293a <__adddf3+0x25e>
    27a8:	0405                	addi	s0,s0,1
    27aa:	7ff00713          	li	a4,2047
    27ae:	4ae40163          	beq	s0,a4,2c50 <__adddf3+0x574>
    27b2:	ff800737          	lui	a4,0xff800
    27b6:	177d                	addi	a4,a4,-1 # ff7fffff <_sp+0xff7f3a0f>
    27b8:	8ff9                	and	a5,a5,a4
    27ba:	00165713          	srli	a4,a2,0x1
    27be:	8a05                	andi	a2,a2,1
    27c0:	8f51                	or	a4,a4,a2
    27c2:	01f79613          	slli	a2,a5,0x1f
    27c6:	8e59                	or	a2,a2,a4
    27c8:	8385                	srli	a5,a5,0x1
    27ca:	aa85                	j	293a <__adddf3+0x25e>
    27cc:	fe070693          	addi	a3,a4,-32
    27d0:	00d856b3          	srl	a3,a6,a3
    27d4:	4581                	li	a1,0
    27d6:	01170763          	beq	a4,a7,27e4 <__adddf3+0x108>
    27da:	04000593          	li	a1,64
    27de:	8d99                	sub	a1,a1,a4
    27e0:	00b815b3          	sll	a1,a6,a1
    27e4:	8dd1                	or	a1,a1,a2
    27e6:	00b035b3          	snez	a1,a1
    27ea:	8ecd                	or	a3,a3,a1
    27ec:	4701                	li	a4,0
    27ee:	b755                	j	2792 <__adddf3+0xb6>
    27f0:	00c866b3          	or	a3,a6,a2
    27f4:	00d036b3          	snez	a3,a3
    27f8:	bfd5                	j	27ec <__adddf3+0x110>
    27fa:	cf41                	beqz	a4,2892 <__adddf3+0x1b6>
    27fc:	40888733          	sub	a4,a7,s0
    2800:	ec01                	bnez	s0,2818 <__adddf3+0x13c>
    2802:	00a7e6b3          	or	a3,a5,a0
    2806:	c691                	beqz	a3,2812 <__adddf3+0x136>
    2808:	fff70693          	addi	a3,a4,-1
    280c:	da95                	beqz	a3,2740 <__adddf3+0x64>
    280e:	00b71b63          	bne	a4,a1,2824 <__adddf3+0x148>
    2812:	87c2                	mv	a5,a6
    2814:	843a                	mv	s0,a4
    2816:	a855                	j	28ca <__adddf3+0x1ee>
    2818:	44b88063          	beq	a7,a1,2c58 <__adddf3+0x57c>
    281c:	008006b7          	lui	a3,0x800
    2820:	8fd5                	or	a5,a5,a3
    2822:	86ba                	mv	a3,a4
    2824:	03800713          	li	a4,56
    2828:	06d74063          	blt	a4,a3,2888 <__adddf3+0x1ac>
    282c:	477d                	li	a4,31
    282e:	02000313          	li	t1,32
    2832:	02d74963          	blt	a4,a3,2864 <__adddf3+0x188>
    2836:	40d30333          	sub	t1,t1,a3
    283a:	00679733          	sll	a4,a5,t1
    283e:	00d555b3          	srl	a1,a0,a3
    2842:	00651333          	sll	t1,a0,t1
    2846:	8f4d                	or	a4,a4,a1
    2848:	00603333          	snez	t1,t1
    284c:	00676733          	or	a4,a4,t1
    2850:	00d7d6b3          	srl	a3,a5,a3
    2854:	963a                	add	a2,a2,a4
    2856:	96c2                	add	a3,a3,a6
    2858:	00e63733          	sltu	a4,a2,a4
    285c:	00e687b3          	add	a5,a3,a4
    2860:	8446                	mv	s0,a7
    2862:	bf3d                	j	27a0 <__adddf3+0xc4>
    2864:	fe068713          	addi	a4,a3,-32 # 7fffe0 <_sp+0x7f39f0>
    2868:	00e7d733          	srl	a4,a5,a4
    286c:	4581                	li	a1,0
    286e:	00668763          	beq	a3,t1,287c <__adddf3+0x1a0>
    2872:	04000593          	li	a1,64
    2876:	8d95                	sub	a1,a1,a3
    2878:	00b795b3          	sll	a1,a5,a1
    287c:	8dc9                	or	a1,a1,a0
    287e:	00b035b3          	snez	a1,a1
    2882:	8f4d                	or	a4,a4,a1
    2884:	4681                	li	a3,0
    2886:	b7f9                	j	2854 <__adddf3+0x178>
    2888:	00a7e733          	or	a4,a5,a0
    288c:	00e03733          	snez	a4,a4
    2890:	bfd5                	j	2884 <__adddf3+0x1a8>
    2892:	00140713          	addi	a4,s0,1
    2896:	7fe77693          	andi	a3,a4,2046
    289a:	e2d9                	bnez	a3,2920 <__adddf3+0x244>
    289c:	00a7e733          	or	a4,a5,a0
    28a0:	e825                	bnez	s0,2910 <__adddf3+0x234>
    28a2:	38070f63          	beqz	a4,2c40 <__adddf3+0x564>
    28a6:	00c86733          	or	a4,a6,a2
    28aa:	38070d63          	beqz	a4,2c44 <__adddf3+0x568>
    28ae:	962a                	add	a2,a2,a0
    28b0:	97c2                	add	a5,a5,a6
    28b2:	00a63533          	sltu	a0,a2,a0
    28b6:	97aa                	add	a5,a5,a0
    28b8:	00879713          	slli	a4,a5,0x8
    28bc:	26075f63          	bgez	a4,2b3a <__adddf3+0x45e>
    28c0:	ff800737          	lui	a4,0xff800
    28c4:	177d                	addi	a4,a4,-1 # ff7fffff <_sp+0xff7f3a0f>
    28c6:	8ff9                	and	a5,a5,a4
    28c8:	4405                	li	s0,1
  FP_PACK_SEMIRAW_D (r, R);
    28ca:	01d79713          	slli	a4,a5,0x1d
    28ce:	820d                	srli	a2,a2,0x3
    28d0:	7ff00693          	li	a3,2047
    28d4:	8f51                	or	a4,a4,a2
    28d6:	838d                	srli	a5,a5,0x3
    28d8:	00d41963          	bne	s0,a3,28ea <__adddf3+0x20e>
    28dc:	8f5d                	or	a4,a4,a5
    28de:	4781                	li	a5,0
    28e0:	c709                	beqz	a4,28ea <__adddf3+0x20e>
    28e2:	000807b7          	lui	a5,0x80
    28e6:	4701                	li	a4,0
    28e8:	4901                	li	s2,0
    28ea:	7ff47413          	andi	s0,s0,2047
    28ee:	07b2                	slli	a5,a5,0xc
    28f0:	83b1                	srli	a5,a5,0xc
    28f2:	0452                	slli	s0,s0,0x14
    28f4:	01f91593          	slli	a1,s2,0x1f
    28f8:	8c5d                	or	s0,s0,a5
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    28fa:	40f2                	lw	ra,28(sp)
  FP_PACK_SEMIRAW_D (r, R);
    28fc:	00b467b3          	or	a5,s0,a1
}
    2900:	4462                	lw	s0,24(sp)
    2902:	44d2                	lw	s1,20(sp)
    2904:	4942                	lw	s2,16(sp)
    2906:	49b2                	lw	s3,12(sp)
    2908:	853a                	mv	a0,a4
    290a:	85be                	mv	a1,a5
    290c:	6105                	addi	sp,sp,32
    290e:	8082                	ret
  FP_ADD_D (R, A, B);
    2910:	32070c63          	beqz	a4,2c48 <__adddf3+0x56c>
    2914:	00c86833          	or	a6,a6,a2
    2918:	24081263          	bnez	a6,2b5c <__adddf3+0x480>
    291c:	862a                	mv	a2,a0
    291e:	a635                	j	2c4a <__adddf3+0x56e>
    2920:	32b70763          	beq	a4,a1,2c4e <__adddf3+0x572>
    2924:	962a                	add	a2,a2,a0
    2926:	00a63533          	sltu	a0,a2,a0
    292a:	97c2                	add	a5,a5,a6
    292c:	97aa                	add	a5,a5,a0
    292e:	01f79693          	slli	a3,a5,0x1f
    2932:	8205                	srli	a2,a2,0x1
    2934:	8e55                	or	a2,a2,a3
    2936:	8385                	srli	a5,a5,0x1
    2938:	843a                	mv	s0,a4
  FP_PACK_SEMIRAW_D (r, R);
    293a:	00767713          	andi	a4,a2,7
    293e:	cf01                	beqz	a4,2956 <__adddf3+0x27a>
    2940:	00f67713          	andi	a4,a2,15
    2944:	4691                	li	a3,4
    2946:	00d70863          	beq	a4,a3,2956 <__adddf3+0x27a>
    294a:	00d60733          	add	a4,a2,a3
    294e:	00c736b3          	sltu	a3,a4,a2
    2952:	97b6                	add	a5,a5,a3
    2954:	863a                	mv	a2,a4
    2956:	00879713          	slli	a4,a5,0x8
    295a:	f60758e3          	bgez	a4,28ca <__adddf3+0x1ee>
    295e:	0405                	addi	s0,s0,1
    2960:	7ff00713          	li	a4,2047
    2964:	2ee40663          	beq	s0,a4,2c50 <__adddf3+0x574>
    2968:	ff800737          	lui	a4,0xff800
    296c:	177d                	addi	a4,a4,-1 # ff7fffff <_sp+0xff7f3a0f>
    296e:	8ff9                	and	a5,a5,a4
    2970:	bfa9                	j	28ca <__adddf3+0x1ee>
  FP_ADD_D (R, A, B);
    2972:	0ae05e63          	blez	a4,2a2e <__adddf3+0x352>
    2976:	06089e63          	bnez	a7,29f2 <__adddf3+0x316>
    297a:	00c86733          	or	a4,a6,a2
    297e:	dc070ae3          	beqz	a4,2752 <__adddf3+0x76>
    2982:	fff40713          	addi	a4,s0,-1
    2986:	eb11                	bnez	a4,299a <__adddf3+0x2be>
    2988:	40c50633          	sub	a2,a0,a2
    298c:	410787b3          	sub	a5,a5,a6
    2990:	00c53533          	sltu	a0,a0,a2
    2994:	8f89                	sub	a5,a5,a0
    2996:	4405                	li	s0,1
    2998:	a099                	j	29de <__adddf3+0x302>
    299a:	dab40ce3          	beq	s0,a1,2752 <__adddf3+0x76>
    299e:	03800693          	li	a3,56
    29a2:	08e6c163          	blt	a3,a4,2a24 <__adddf3+0x348>
    29a6:	46fd                	li	a3,31
    29a8:	02000893          	li	a7,32
    29ac:	04e6ca63          	blt	a3,a4,2a00 <__adddf3+0x324>
    29b0:	40e888b3          	sub	a7,a7,a4
    29b4:	011816b3          	sll	a3,a6,a7
    29b8:	00e655b3          	srl	a1,a2,a4
    29bc:	011618b3          	sll	a7,a2,a7
    29c0:	8ecd                	or	a3,a3,a1
    29c2:	011038b3          	snez	a7,a7
    29c6:	0116e6b3          	or	a3,a3,a7
    29ca:	00e85733          	srl	a4,a6,a4
    29ce:	40d50633          	sub	a2,a0,a3
    29d2:	40e78733          	sub	a4,a5,a4
    29d6:	00c53533          	sltu	a0,a0,a2
    29da:	40a707b3          	sub	a5,a4,a0
    29de:	00879713          	slli	a4,a5,0x8
    29e2:	f4075ce3          	bgez	a4,293a <__adddf3+0x25e>
    29e6:	008004b7          	lui	s1,0x800
    29ea:	14fd                	addi	s1,s1,-1 # 7fffff <_sp+0x7f3a0f>
    29ec:	8cfd                	and	s1,s1,a5
    29ee:	89b2                	mv	s3,a2
    29f0:	a255                	j	2b94 <__adddf3+0x4b8>
    29f2:	d6b400e3          	beq	s0,a1,2752 <__adddf3+0x76>
    29f6:	008006b7          	lui	a3,0x800
    29fa:	00d86833          	or	a6,a6,a3
    29fe:	b745                	j	299e <__adddf3+0x2c2>
    2a00:	fe070693          	addi	a3,a4,-32
    2a04:	00d856b3          	srl	a3,a6,a3
    2a08:	4581                	li	a1,0
    2a0a:	01170763          	beq	a4,a7,2a18 <__adddf3+0x33c>
    2a0e:	04000593          	li	a1,64
    2a12:	8d99                	sub	a1,a1,a4
    2a14:	00b815b3          	sll	a1,a6,a1
    2a18:	8dd1                	or	a1,a1,a2
    2a1a:	00b035b3          	snez	a1,a1
    2a1e:	8ecd                	or	a3,a3,a1
    2a20:	4701                	li	a4,0
    2a22:	b775                	j	29ce <__adddf3+0x2f2>
    2a24:	00c866b3          	or	a3,a6,a2
    2a28:	00d036b3          	snez	a3,a3
    2a2c:	bfd5                	j	2a20 <__adddf3+0x344>
    2a2e:	cf5d                	beqz	a4,2aec <__adddf3+0x410>
    2a30:	40888333          	sub	t1,a7,s0
    2a34:	e41d                	bnez	s0,2a62 <__adddf3+0x386>
    2a36:	00a7e733          	or	a4,a5,a0
    2a3a:	c305                	beqz	a4,2a5a <__adddf3+0x37e>
    2a3c:	fff30713          	addi	a4,t1,-1
    2a40:	eb19                	bnez	a4,2a56 <__adddf3+0x37a>
    2a42:	40a60533          	sub	a0,a2,a0
    2a46:	00a63733          	sltu	a4,a2,a0
    2a4a:	40f807b3          	sub	a5,a6,a5
    2a4e:	862a                	mv	a2,a0
    2a50:	8f99                	sub	a5,a5,a4
    2a52:	8936                	mv	s2,a3
    2a54:	b789                	j	2996 <__adddf3+0x2ba>
    2a56:	00b31c63          	bne	t1,a1,2a6e <__adddf3+0x392>
    2a5a:	8936                	mv	s2,a3
    2a5c:	87c2                	mv	a5,a6
    2a5e:	841a                	mv	s0,t1
    2a60:	b5ad                	j	28ca <__adddf3+0x1ee>
    2a62:	1eb88a63          	beq	a7,a1,2c56 <__adddf3+0x57a>
    2a66:	00800737          	lui	a4,0x800
    2a6a:	8fd9                	or	a5,a5,a4
    2a6c:	871a                	mv	a4,t1
    2a6e:	03800593          	li	a1,56
    2a72:	06e5c863          	blt	a1,a4,2ae2 <__adddf3+0x406>
    2a76:	45fd                	li	a1,31
    2a78:	02000e13          	li	t3,32
    2a7c:	02e5ce63          	blt	a1,a4,2ab8 <__adddf3+0x3dc>
    2a80:	40ee0e33          	sub	t3,t3,a4
    2a84:	01c795b3          	sll	a1,a5,t3
    2a88:	00e55333          	srl	t1,a0,a4
    2a8c:	01c51e33          	sll	t3,a0,t3
    2a90:	0065e5b3          	or	a1,a1,t1
    2a94:	01c03e33          	snez	t3,t3
    2a98:	01c5e5b3          	or	a1,a1,t3
    2a9c:	00e7d733          	srl	a4,a5,a4
    2aa0:	40b605b3          	sub	a1,a2,a1
    2aa4:	00b637b3          	sltu	a5,a2,a1
    2aa8:	40e80733          	sub	a4,a6,a4
    2aac:	862e                	mv	a2,a1
    2aae:	40f707b3          	sub	a5,a4,a5
    2ab2:	8446                	mv	s0,a7
    2ab4:	8936                	mv	s2,a3
    2ab6:	b725                	j	29de <__adddf3+0x302>
    2ab8:	fe070593          	addi	a1,a4,-32 # 7fffe0 <_sp+0x7f39f0>
    2abc:	00b7d5b3          	srl	a1,a5,a1
    2ac0:	4301                	li	t1,0
    2ac2:	01c70863          	beq	a4,t3,2ad2 <__adddf3+0x3f6>
    2ac6:	04000313          	li	t1,64
    2aca:	40e30333          	sub	t1,t1,a4
    2ace:	00679333          	sll	t1,a5,t1
    2ad2:	00a36333          	or	t1,t1,a0
    2ad6:	00603333          	snez	t1,t1
    2ada:	0065e5b3          	or	a1,a1,t1
    2ade:	4701                	li	a4,0
    2ae0:	b7c1                	j	2aa0 <__adddf3+0x3c4>
    2ae2:	00a7e5b3          	or	a1,a5,a0
    2ae6:	00b035b3          	snez	a1,a1
    2aea:	bfd5                	j	2ade <__adddf3+0x402>
    2aec:	00140713          	addi	a4,s0,1
    2af0:	7fe77713          	andi	a4,a4,2046
    2af4:	ef25                	bnez	a4,2b6c <__adddf3+0x490>
    2af6:	00a7e8b3          	or	a7,a5,a0
    2afa:	00c86733          	or	a4,a6,a2
    2afe:	e839                	bnez	s0,2b54 <__adddf3+0x478>
    2b00:	00089663          	bnez	a7,2b0c <__adddf3+0x430>
    2b04:	87c2                	mv	a5,a6
    2b06:	eb0d                	bnez	a4,2b38 <__adddf3+0x45c>
    2b08:	4901                	li	s2,0
    2b0a:	a299                	j	2c50 <__adddf3+0x574>
    2b0c:	12070c63          	beqz	a4,2c44 <__adddf3+0x568>
    2b10:	40c505b3          	sub	a1,a0,a2
    2b14:	00b538b3          	sltu	a7,a0,a1
    2b18:	41078733          	sub	a4,a5,a6
    2b1c:	41170733          	sub	a4,a4,a7
    2b20:	00871893          	slli	a7,a4,0x8
    2b24:	0208d163          	bgez	a7,2b46 <__adddf3+0x46a>
    2b28:	40a60533          	sub	a0,a2,a0
    2b2c:	00a63733          	sltu	a4,a2,a0
    2b30:	40f807b3          	sub	a5,a6,a5
    2b34:	862a                	mv	a2,a0
    2b36:	8f99                	sub	a5,a5,a4
    2b38:	8936                	mv	s2,a3
  FP_PACK_SEMIRAW_D (r, R);
    2b3a:	00f66733          	or	a4,a2,a5
    2b3e:	12070363          	beqz	a4,2c64 <__adddf3+0x588>
    2b42:	4401                	li	s0,0
    2b44:	bbdd                	j	293a <__adddf3+0x25e>
  FP_ADD_D (R, A, B);
    2b46:	00e5e633          	or	a2,a1,a4
    2b4a:	10060a63          	beqz	a2,2c5e <__adddf3+0x582>
    2b4e:	87ba                	mv	a5,a4
    2b50:	862e                	mv	a2,a1
    2b52:	b7e5                	j	2b3a <__adddf3+0x45e>
    2b54:	00089963          	bnez	a7,2b66 <__adddf3+0x48a>
    2b58:	8936                	mv	s2,a3
    2b5a:	e77d                	bnez	a4,2c48 <__adddf3+0x56c>
    2b5c:	4901                	li	s2,0
    2b5e:	004007b7          	lui	a5,0x400
    2b62:	4601                	li	a2,0
    2b64:	a0dd                	j	2c4a <__adddf3+0x56e>
    2b66:	da070be3          	beqz	a4,291c <__adddf3+0x240>
    2b6a:	bfcd                	j	2b5c <__adddf3+0x480>
    2b6c:	40c50733          	sub	a4,a0,a2
    2b70:	00e535b3          	sltu	a1,a0,a4
    2b74:	410784b3          	sub	s1,a5,a6
    2b78:	8c8d                	sub	s1,s1,a1
    2b7a:	00849593          	slli	a1,s1,0x8
    2b7e:	89ba                	mv	s3,a4
    2b80:	0605d363          	bgez	a1,2be6 <__adddf3+0x50a>
    2b84:	40a609b3          	sub	s3,a2,a0
    2b88:	40f804b3          	sub	s1,a6,a5
    2b8c:	01363633          	sltu	a2,a2,s3
    2b90:	8c91                	sub	s1,s1,a2
    2b92:	8936                	mv	s2,a3
    2b94:	c0a5                	beqz	s1,2bf4 <__adddf3+0x518>
    2b96:	8526                	mv	a0,s1
    2b98:	0d0010ef          	jal	3c68 <__clzsi2>
    2b9c:	ff850713          	addi	a4,a0,-8
    2ba0:	02000793          	li	a5,32
    2ba4:	8f99                	sub	a5,a5,a4
    2ba6:	00e494b3          	sll	s1,s1,a4
    2baa:	00f9d7b3          	srl	a5,s3,a5
    2bae:	8fc5                	or	a5,a5,s1
    2bb0:	00e99633          	sll	a2,s3,a4
    2bb4:	08874063          	blt	a4,s0,2c34 <__adddf3+0x558>
    2bb8:	8f01                	sub	a4,a4,s0
    2bba:	00170513          	addi	a0,a4,1
    2bbe:	46fd                	li	a3,31
    2bc0:	02000593          	li	a1,32
    2bc4:	04a6c663          	blt	a3,a0,2c10 <__adddf3+0x534>
    2bc8:	8d89                	sub	a1,a1,a0
    2bca:	00b79733          	sll	a4,a5,a1
    2bce:	00a656b3          	srl	a3,a2,a0
    2bd2:	00b615b3          	sll	a1,a2,a1
    2bd6:	8f55                	or	a4,a4,a3
    2bd8:	00b035b3          	snez	a1,a1
    2bdc:	00b76633          	or	a2,a4,a1
    2be0:	00a7d7b3          	srl	a5,a5,a0
    2be4:	bf99                	j	2b3a <__adddf3+0x45e>
    2be6:	00976633          	or	a2,a4,s1
    2bea:	f64d                	bnez	a2,2b94 <__adddf3+0x4b8>
    2bec:	4901                	li	s2,0
    2bee:	4781                	li	a5,0
    2bf0:	4401                	li	s0,0
    2bf2:	b9e1                	j	28ca <__adddf3+0x1ee>
    2bf4:	854e                	mv	a0,s3
    2bf6:	072010ef          	jal	3c68 <__clzsi2>
    2bfa:	01850713          	addi	a4,a0,24
    2bfe:	47fd                	li	a5,31
    2c00:	fae7d0e3          	bge	a5,a4,2ba0 <__adddf3+0x4c4>
    2c04:	ff850793          	addi	a5,a0,-8
    2c08:	00f997b3          	sll	a5,s3,a5
    2c0c:	4601                	li	a2,0
    2c0e:	b75d                	j	2bb4 <__adddf3+0x4d8>
    2c10:	1705                	addi	a4,a4,-31
    2c12:	00e7d733          	srl	a4,a5,a4
    2c16:	4681                	li	a3,0
    2c18:	00b50763          	beq	a0,a1,2c26 <__adddf3+0x54a>
    2c1c:	04000693          	li	a3,64
    2c20:	8e89                	sub	a3,a3,a0
    2c22:	00d796b3          	sll	a3,a5,a3
    2c26:	8ed1                	or	a3,a3,a2
    2c28:	00d036b3          	snez	a3,a3
    2c2c:	00d76633          	or	a2,a4,a3
    2c30:	4781                	li	a5,0
    2c32:	b721                	j	2b3a <__adddf3+0x45e>
    2c34:	8c19                	sub	s0,s0,a4
    2c36:	ff800737          	lui	a4,0xff800
    2c3a:	177d                	addi	a4,a4,-1 # ff7fffff <_sp+0xff7f3a0f>
    2c3c:	8ff9                	and	a5,a5,a4
    2c3e:	b9f5                	j	293a <__adddf3+0x25e>
    2c40:	87c2                	mv	a5,a6
    2c42:	bde5                	j	2b3a <__adddf3+0x45e>
    2c44:	862a                	mv	a2,a0
    2c46:	bdd5                	j	2b3a <__adddf3+0x45e>
    2c48:	87c2                	mv	a5,a6
    2c4a:	842e                	mv	s0,a1
    2c4c:	b9bd                	j	28ca <__adddf3+0x1ee>
    2c4e:	843a                	mv	s0,a4
    2c50:	4781                	li	a5,0
    2c52:	4601                	li	a2,0
    2c54:	b99d                	j	28ca <__adddf3+0x1ee>
    2c56:	8936                	mv	s2,a3
    2c58:	87c2                	mv	a5,a6
    2c5a:	8446                	mv	s0,a7
    2c5c:	b1bd                	j	28ca <__adddf3+0x1ee>
    2c5e:	4901                	li	s2,0
    2c60:	4781                	li	a5,0
    2c62:	b1a5                	j	28ca <__adddf3+0x1ee>
    2c64:	4781                	li	a5,0
    2c66:	4601                	li	a2,0
    2c68:	b761                	j	2bf0 <__adddf3+0x514>

00002c6a <__divdf3>:
#include "soft-fp.h"
#include "double.h"

DFtype
__divdf3 (DFtype a, DFtype b)
{
    2c6a:	7179                	addi	sp,sp,-48
  FP_DECL_D (B);
  FP_DECL_D (R);
  DFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_D (A, a);
    2c6c:	0145d713          	srli	a4,a1,0x14
{
    2c70:	d422                	sw	s0,40(sp)
    2c72:	d04a                	sw	s2,32(sp)
    2c74:	ce4e                	sw	s3,28(sp)
    2c76:	ca56                	sw	s5,20(sp)
    2c78:	c65e                	sw	s7,12(sp)
  FP_UNPACK_D (A, a);
    2c7a:	00c59413          	slli	s0,a1,0xc
{
    2c7e:	d606                	sw	ra,44(sp)
    2c80:	d226                	sw	s1,36(sp)
    2c82:	cc52                	sw	s4,24(sp)
    2c84:	c85a                	sw	s6,16(sp)
  FP_UNPACK_D (A, a);
    2c86:	7ff77713          	andi	a4,a4,2047
{
    2c8a:	89aa                	mv	s3,a0
    2c8c:	8bb2                	mv	s7,a2
    2c8e:	8ab6                	mv	s5,a3
  FP_UNPACK_D (A, a);
    2c90:	8031                	srli	s0,s0,0xc
    2c92:	01f5d913          	srli	s2,a1,0x1f
    2c96:	cf3d                	beqz	a4,2d14 <__divdf3+0xaa>
    2c98:	7ff00793          	li	a5,2047
    2c9c:	0cf70763          	beq	a4,a5,2d6a <__divdf3+0x100>
    2ca0:	01d55a13          	srli	s4,a0,0x1d
    2ca4:	040e                	slli	s0,s0,0x3
    2ca6:	008a6a33          	or	s4,s4,s0
    2caa:	008007b7          	lui	a5,0x800
    2cae:	00fa6a33          	or	s4,s4,a5
    2cb2:	00351493          	slli	s1,a0,0x3
    2cb6:	c0170993          	addi	s3,a4,-1023
    2cba:	4b01                	li	s6,0
  FP_UNPACK_D (B, b);
    2cbc:	014ad793          	srli	a5,s5,0x14
    2cc0:	00ca9413          	slli	s0,s5,0xc
    2cc4:	7ff7f793          	andi	a5,a5,2047
    2cc8:	8031                	srli	s0,s0,0xc
    2cca:	01fada93          	srli	s5,s5,0x1f
    2cce:	cfdd                	beqz	a5,2d8c <__divdf3+0x122>
    2cd0:	7ff00693          	li	a3,2047
    2cd4:	10d78763          	beq	a5,a3,2de2 <__divdf3+0x178>
    2cd8:	040e                	slli	s0,s0,0x3
    2cda:	01dbd693          	srli	a3,s7,0x1d
    2cde:	8ec1                	or	a3,a3,s0
    2ce0:	00800437          	lui	s0,0x800
    2ce4:	8c55                	or	s0,s0,a3
    2ce6:	003b9f13          	slli	t5,s7,0x3
    2cea:	c0178793          	addi	a5,a5,-1023 # 7ffc01 <_sp+0x7f3611>
    2cee:	4681                	li	a3,0
  FP_DIV_D (R, A, B);
    2cf0:	40f98733          	sub	a4,s3,a5
    2cf4:	002b1793          	slli	a5,s6,0x2
    2cf8:	8fd5                	or	a5,a5,a3
    2cfa:	17fd                	addi	a5,a5,-1
    2cfc:	4639                	li	a2,14
    2cfe:	01594833          	xor	a6,s2,s5
    2d02:	0ef66e63          	bltu	a2,a5,2dfe <__divdf3+0x194>
    2d06:	6629                	lui	a2,0xa
    2d08:	078a                	slli	a5,a5,0x2
    2d0a:	5c060613          	addi	a2,a2,1472 # a5c0 <jump_table.2+0x78>
    2d0e:	97b2                	add	a5,a5,a2
    2d10:	439c                	lw	a5,0(a5)
    2d12:	8782                	jr	a5
  FP_UNPACK_D (A, a);
    2d14:	00a46a33          	or	s4,s0,a0
    2d18:	060a0163          	beqz	s4,2d7a <__divdf3+0x110>
    2d1c:	c815                	beqz	s0,2d50 <__divdf3+0xe6>
    2d1e:	8522                	mv	a0,s0
    2d20:	749000ef          	jal	3c68 <__clzsi2>
    2d24:	87aa                	mv	a5,a0
    2d26:	ff550713          	addi	a4,a0,-11
    2d2a:	4a75                	li	s4,29
    2d2c:	ff878693          	addi	a3,a5,-8
    2d30:	40ea0a33          	sub	s4,s4,a4
    2d34:	00d41433          	sll	s0,s0,a3
    2d38:	0149da33          	srl	s4,s3,s4
    2d3c:	008a6a33          	or	s4,s4,s0
    2d40:	00d99433          	sll	s0,s3,a3
    2d44:	c0d00713          	li	a4,-1011
    2d48:	40f709b3          	sub	s3,a4,a5
    2d4c:	84a2                	mv	s1,s0
    2d4e:	b7b5                	j	2cba <__divdf3+0x50>
    2d50:	719000ef          	jal	3c68 <__clzsi2>
    2d54:	01550713          	addi	a4,a0,21
    2d58:	46f1                	li	a3,28
    2d5a:	02050793          	addi	a5,a0,32
    2d5e:	fce6d6e3          	bge	a3,a4,2d2a <__divdf3+0xc0>
    2d62:	1561                	addi	a0,a0,-8
    2d64:	00a99a33          	sll	s4,s3,a0
    2d68:	bff1                	j	2d44 <__divdf3+0xda>
    2d6a:	00a46a33          	or	s4,s0,a0
    2d6e:	000a1a63          	bnez	s4,2d82 <__divdf3+0x118>
    2d72:	4481                	li	s1,0
    2d74:	89ba                	mv	s3,a4
    2d76:	4b09                	li	s6,2
    2d78:	b791                	j	2cbc <__divdf3+0x52>
    2d7a:	4481                	li	s1,0
    2d7c:	4981                	li	s3,0
    2d7e:	4b05                	li	s6,1
    2d80:	bf35                	j	2cbc <__divdf3+0x52>
    2d82:	84aa                	mv	s1,a0
    2d84:	8a22                	mv	s4,s0
    2d86:	89ba                	mv	s3,a4
    2d88:	4b0d                	li	s6,3
    2d8a:	bf0d                	j	2cbc <__divdf3+0x52>
  FP_UNPACK_D (B, b);
    2d8c:	01746f33          	or	t5,s0,s7
    2d90:	060f0063          	beqz	t5,2df0 <__divdf3+0x186>
    2d94:	c805                	beqz	s0,2dc4 <__divdf3+0x15a>
    2d96:	8522                	mv	a0,s0
    2d98:	6d1000ef          	jal	3c68 <__clzsi2>
    2d9c:	86aa                	mv	a3,a0
    2d9e:	ff550793          	addi	a5,a0,-11
    2da2:	45f5                	li	a1,29
    2da4:	ff868613          	addi	a2,a3,-8 # 7ffff8 <_sp+0x7f3a08>
    2da8:	8d9d                	sub	a1,a1,a5
    2daa:	00c41433          	sll	s0,s0,a2
    2dae:	00bbd5b3          	srl	a1,s7,a1
    2db2:	8dc1                	or	a1,a1,s0
    2db4:	00cb9433          	sll	s0,s7,a2
    2db8:	c0d00793          	li	a5,-1011
    2dbc:	8f22                	mv	t5,s0
    2dbe:	8f95                	sub	a5,a5,a3
    2dc0:	842e                	mv	s0,a1
    2dc2:	b735                	j	2cee <__divdf3+0x84>
    2dc4:	855e                	mv	a0,s7
    2dc6:	6a3000ef          	jal	3c68 <__clzsi2>
    2dca:	01550793          	addi	a5,a0,21
    2dce:	4671                	li	a2,28
    2dd0:	02050693          	addi	a3,a0,32
    2dd4:	fcf657e3          	bge	a2,a5,2da2 <__divdf3+0x138>
    2dd8:	ff850593          	addi	a1,a0,-8
    2ddc:	00bb95b3          	sll	a1,s7,a1
    2de0:	bfe1                	j	2db8 <__divdf3+0x14e>
    2de2:	01746f33          	or	t5,s0,s7
    2de6:	000f1963          	bnez	t5,2df8 <__divdf3+0x18e>
    2dea:	4401                	li	s0,0
    2dec:	4689                	li	a3,2
    2dee:	b709                	j	2cf0 <__divdf3+0x86>
    2df0:	4401                	li	s0,0
    2df2:	4781                	li	a5,0
    2df4:	4685                	li	a3,1
    2df6:	bded                	j	2cf0 <__divdf3+0x86>
    2df8:	8f5e                	mv	t5,s7
    2dfa:	468d                	li	a3,3
    2dfc:	bdd5                	j	2cf0 <__divdf3+0x86>
  FP_DIV_D (R, A, B);
    2dfe:	01446663          	bltu	s0,s4,2e0a <__divdf3+0x1a0>
    2e02:	268a1f63          	bne	s4,s0,3080 <__divdf3+0x416>
    2e06:	27e4ed63          	bltu	s1,t5,3080 <__divdf3+0x416>
    2e0a:	01fa1693          	slli	a3,s4,0x1f
    2e0e:	0014d793          	srli	a5,s1,0x1
    2e12:	01f49613          	slli	a2,s1,0x1f
    2e16:	001a5a13          	srli	s4,s4,0x1
    2e1a:	00f6e4b3          	or	s1,a3,a5
    2e1e:	00841893          	slli	a7,s0,0x8
    2e22:	018f5693          	srli	a3,t5,0x18
    2e26:	0116e6b3          	or	a3,a3,a7
    2e2a:	0108d893          	srli	a7,a7,0x10
    2e2e:	031a55b3          	divu	a1,s4,a7
    2e32:	01069e93          	slli	t4,a3,0x10
    2e36:	010ede93          	srli	t4,t4,0x10
    2e3a:	0104d793          	srli	a5,s1,0x10
    2e3e:	008f1513          	slli	a0,t5,0x8
    2e42:	031a7a33          	remu	s4,s4,a7
    2e46:	02be8333          	mul	t1,t4,a1
    2e4a:	0a42                	slli	s4,s4,0x10
    2e4c:	0147e7b3          	or	a5,a5,s4
    2e50:	0067f863          	bgeu	a5,t1,2e60 <__divdf3+0x1f6>
    2e54:	97b6                	add	a5,a5,a3
    2e56:	00d7e463          	bltu	a5,a3,2e5e <__divdf3+0x1f4>
    2e5a:	2267e663          	bltu	a5,t1,3086 <__divdf3+0x41c>
    2e5e:	15fd                	addi	a1,a1,-1 # 7fffffff <_sp+0x7fff3a0f>
    2e60:	406787b3          	sub	a5,a5,t1
    2e64:	0317d333          	divu	t1,a5,a7
    2e68:	04c2                	slli	s1,s1,0x10
    2e6a:	80c1                	srli	s1,s1,0x10
    2e6c:	0317f7b3          	remu	a5,a5,a7
    2e70:	026e8e33          	mul	t3,t4,t1
    2e74:	07c2                	slli	a5,a5,0x10
    2e76:	8cdd                	or	s1,s1,a5
    2e78:	01c4f863          	bgeu	s1,t3,2e88 <__divdf3+0x21e>
    2e7c:	94b6                	add	s1,s1,a3
    2e7e:	01c4f463          	bgeu	s1,t3,2e86 <__divdf3+0x21c>
    2e82:	20d4f563          	bgeu	s1,a3,308c <__divdf3+0x422>
    2e86:	137d                	addi	t1,t1,-1
    2e88:	05c2                	slli	a1,a1,0x10
    2e8a:	0065e5b3          	or	a1,a1,t1
    2e8e:	41c484b3          	sub	s1,s1,t3
    2e92:	01059793          	slli	a5,a1,0x10
    2e96:	01051e13          	slli	t3,a0,0x10
    2e9a:	0105df93          	srli	t6,a1,0x10
    2e9e:	01055313          	srli	t1,a0,0x10
    2ea2:	83c1                	srli	a5,a5,0x10
    2ea4:	010e5e13          	srli	t3,t3,0x10
    2ea8:	03c782b3          	mul	t0,a5,t3
    2eac:	03cf83b3          	mul	t2,t6,t3
    2eb0:	02f307b3          	mul	a5,t1,a5
    2eb4:	00778f33          	add	t5,a5,t2
    2eb8:	0102d793          	srli	a5,t0,0x10
    2ebc:	97fa                	add	a5,a5,t5
    2ebe:	026f8fb3          	mul	t6,t6,t1
    2ec2:	0077f463          	bgeu	a5,t2,2eca <__divdf3+0x260>
    2ec6:	6f41                	lui	t5,0x10
    2ec8:	9ffa                	add	t6,t6,t5
    2eca:	0107df13          	srli	t5,a5,0x10
    2ece:	02c2                	slli	t0,t0,0x10
    2ed0:	07c2                	slli	a5,a5,0x10
    2ed2:	0102d293          	srli	t0,t0,0x10
    2ed6:	9f7e                	add	t5,t5,t6
    2ed8:	9796                	add	a5,a5,t0
    2eda:	01e4e663          	bltu	s1,t5,2ee6 <__divdf3+0x27c>
    2ede:	1be49a63          	bne	s1,t5,3092 <__divdf3+0x428>
    2ee2:	1af67863          	bgeu	a2,a5,3092 <__divdf3+0x428>
    2ee6:	00a60fb3          	add	t6,a2,a0
    2eea:	00cfb2b3          	sltu	t0,t6,a2
    2eee:	00d283b3          	add	t2,t0,a3
    2ef2:	949e                	add	s1,s1,t2
    2ef4:	fff58413          	addi	s0,a1,-1
    2ef8:	867e                	mv	a2,t6
    2efa:	0096e663          	bltu	a3,s1,2f06 <__divdf3+0x29c>
    2efe:	02029263          	bnez	t0,2f22 <__divdf3+0x2b8>
    2f02:	02969063          	bne	a3,s1,2f22 <__divdf3+0x2b8>
    2f06:	01e4e663          	bltu	s1,t5,2f12 <__divdf3+0x2a8>
    2f0a:	009f1c63          	bne	t5,s1,2f22 <__divdf3+0x2b8>
    2f0e:	00fffa63          	bgeu	t6,a5,2f22 <__divdf3+0x2b8>
    2f12:	01f50633          	add	a2,a0,t6
    2f16:	ffe58413          	addi	s0,a1,-2
    2f1a:	00a635b3          	sltu	a1,a2,a0
    2f1e:	95b6                	add	a1,a1,a3
    2f20:	94ae                	add	s1,s1,a1
    2f22:	40f607b3          	sub	a5,a2,a5
    2f26:	41e484b3          	sub	s1,s1,t5
    2f2a:	00f63633          	sltu	a2,a2,a5
    2f2e:	8c91                	sub	s1,s1,a2
    2f30:	5f7d                	li	t5,-1
    2f32:	0c968d63          	beq	a3,s1,300c <__divdf3+0x3a2>
    2f36:	0314d5b3          	divu	a1,s1,a7
    2f3a:	0107d613          	srli	a2,a5,0x10
    2f3e:	0314f4b3          	remu	s1,s1,a7
    2f42:	02be8f33          	mul	t5,t4,a1
    2f46:	04c2                	slli	s1,s1,0x10
    2f48:	8e45                	or	a2,a2,s1
    2f4a:	01e67863          	bgeu	a2,t5,2f5a <__divdf3+0x2f0>
    2f4e:	9636                	add	a2,a2,a3
    2f50:	00d66463          	bltu	a2,a3,2f58 <__divdf3+0x2ee>
    2f54:	15e66163          	bltu	a2,t5,3096 <__divdf3+0x42c>
    2f58:	15fd                	addi	a1,a1,-1
    2f5a:	41e60633          	sub	a2,a2,t5
    2f5e:	03165f33          	divu	t5,a2,a7
    2f62:	07c2                	slli	a5,a5,0x10
    2f64:	83c1                	srli	a5,a5,0x10
    2f66:	03167633          	remu	a2,a2,a7
    2f6a:	03ee8eb3          	mul	t4,t4,t5
    2f6e:	0642                	slli	a2,a2,0x10
    2f70:	8fd1                	or	a5,a5,a2
    2f72:	01d7f863          	bgeu	a5,t4,2f82 <__divdf3+0x318>
    2f76:	97b6                	add	a5,a5,a3
    2f78:	01d7f463          	bgeu	a5,t4,2f80 <__divdf3+0x316>
    2f7c:	12d7f063          	bgeu	a5,a3,309c <__divdf3+0x432>
    2f80:	1f7d                	addi	t5,t5,-1 # ffff <_sp+0x3a0f>
    2f82:	01059613          	slli	a2,a1,0x10
    2f86:	01e66633          	or	a2,a2,t5
    2f8a:	01061593          	slli	a1,a2,0x10
    2f8e:	81c1                	srli	a1,a1,0x10
    2f90:	41d787b3          	sub	a5,a5,t4
    2f94:	01065e93          	srli	t4,a2,0x10
    2f98:	02be0f33          	mul	t5,t3,a1
    2f9c:	03ce8e33          	mul	t3,t4,t3
    2fa0:	03d30eb3          	mul	t4,t1,t4
    2fa4:	02b30333          	mul	t1,t1,a1
    2fa8:	010f5593          	srli	a1,t5,0x10
    2fac:	9372                	add	t1,t1,t3
    2fae:	959a                	add	a1,a1,t1
    2fb0:	01c5f463          	bgeu	a1,t3,2fb8 <__divdf3+0x34e>
    2fb4:	68c1                	lui	a7,0x10
    2fb6:	9ec6                	add	t4,t4,a7
    2fb8:	0105d893          	srli	a7,a1,0x10
    2fbc:	0f42                	slli	t5,t5,0x10
    2fbe:	05c2                	slli	a1,a1,0x10
    2fc0:	010f5f13          	srli	t5,t5,0x10
    2fc4:	98f6                	add	a7,a7,t4
    2fc6:	95fa                	add	a1,a1,t5
    2fc8:	0117e563          	bltu	a5,a7,2fd2 <__divdf3+0x368>
    2fcc:	03179e63          	bne	a5,a7,3008 <__divdf3+0x39e>
    2fd0:	c9e9                	beqz	a1,30a2 <__divdf3+0x438>
    2fd2:	00f68333          	add	t1,a3,a5
    2fd6:	fff60f13          	addi	t5,a2,-1
    2fda:	879a                	mv	a5,t1
    2fdc:	02d36163          	bltu	t1,a3,2ffe <__divdf3+0x394>
    2fe0:	01136663          	bltu	t1,a7,2fec <__divdf3+0x382>
    2fe4:	03131163          	bne	t1,a7,3006 <__divdf3+0x39c>
    2fe8:	00b57b63          	bgeu	a0,a1,2ffe <__divdf3+0x394>
    2fec:	ffe60f13          	addi	t5,a2,-2
    2ff0:	00151613          	slli	a2,a0,0x1
    2ff4:	00a637b3          	sltu	a5,a2,a0
    2ff8:	97b6                	add	a5,a5,a3
    2ffa:	979a                	add	a5,a5,t1
    2ffc:	8532                	mv	a0,a2
    2ffe:	00b51463          	bne	a0,a1,3006 <__divdf3+0x39c>
    3002:	01178563          	beq	a5,a7,300c <__divdf3+0x3a2>
    3006:	867a                	mv	a2,t5
    3008:	00166f13          	ori	t5,a2,1
  FP_PACK_D (r, R);
    300c:	3ff70793          	addi	a5,a4,1023
    3010:	0af05e63          	blez	a5,30cc <__divdf3+0x462>
    3014:	007f7693          	andi	a3,t5,7
    3018:	ce81                	beqz	a3,3030 <__divdf3+0x3c6>
    301a:	00ff7693          	andi	a3,t5,15
    301e:	4611                	li	a2,4
    3020:	00c68863          	beq	a3,a2,3030 <__divdf3+0x3c6>
    3024:	00cf06b3          	add	a3,t5,a2
    3028:	01e6b633          	sltu	a2,a3,t5
    302c:	9432                	add	s0,s0,a2
    302e:	8f36                	mv	t5,a3
    3030:	00741693          	slli	a3,s0,0x7
    3034:	0006d863          	bgez	a3,3044 <__divdf3+0x3da>
    3038:	ff0007b7          	lui	a5,0xff000
    303c:	17fd                	addi	a5,a5,-1 # feffffff <_sp+0xfeff3a0f>
    303e:	8c7d                	and	s0,s0,a5
    3040:	40070793          	addi	a5,a4,1024
    3044:	7fe00713          	li	a4,2046
    3048:	12f74263          	blt	a4,a5,316c <__divdf3+0x502>
    304c:	01d41713          	slli	a4,s0,0x1d
    3050:	003f5f13          	srli	t5,t5,0x3
    3054:	01e76733          	or	a4,a4,t5
    3058:	800d                	srli	s0,s0,0x3
    305a:	0432                	slli	s0,s0,0xc
    305c:	8031                	srli	s0,s0,0xc
    305e:	07d2                	slli	a5,a5,0x14
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    3060:	50b2                	lw	ra,44(sp)
  FP_PACK_D (r, R);
    3062:	8fc1                	or	a5,a5,s0
}
    3064:	5422                	lw	s0,40(sp)
  FP_PACK_D (r, R);
    3066:	087e                	slli	a6,a6,0x1f
}
    3068:	5492                	lw	s1,36(sp)
    306a:	5902                	lw	s2,32(sp)
    306c:	49f2                	lw	s3,28(sp)
    306e:	4a62                	lw	s4,24(sp)
    3070:	4ad2                	lw	s5,20(sp)
    3072:	4b42                	lw	s6,16(sp)
    3074:	4bb2                	lw	s7,12(sp)
    3076:	853a                	mv	a0,a4
    3078:	0107e5b3          	or	a1,a5,a6
    307c:	6145                	addi	sp,sp,48
    307e:	8082                	ret
  FP_DIV_D (R, A, B);
    3080:	177d                	addi	a4,a4,-1
    3082:	4601                	li	a2,0
    3084:	bb69                	j	2e1e <__divdf3+0x1b4>
    3086:	15f9                	addi	a1,a1,-2
    3088:	97b6                	add	a5,a5,a3
    308a:	bbd9                	j	2e60 <__divdf3+0x1f6>
    308c:	1379                	addi	t1,t1,-2
    308e:	94b6                	add	s1,s1,a3
    3090:	bbe5                	j	2e88 <__divdf3+0x21e>
    3092:	842e                	mv	s0,a1
    3094:	b579                	j	2f22 <__divdf3+0x2b8>
    3096:	15f9                	addi	a1,a1,-2
    3098:	9636                	add	a2,a2,a3
    309a:	b5c1                	j	2f5a <__divdf3+0x2f0>
    309c:	1f79                	addi	t5,t5,-2
    309e:	97b6                	add	a5,a5,a3
    30a0:	b5cd                	j	2f82 <__divdf3+0x318>
    30a2:	4501                	li	a0,0
    30a4:	8f32                	mv	t5,a2
    30a6:	bfa1                	j	2ffe <__divdf3+0x394>
  FP_UNPACK_D (B, b);
    30a8:	8856                	mv	a6,s5
  FP_DIV_D (R, A, B);
    30aa:	8b36                	mv	s6,a3
  FP_PACK_D (r, R);
    30ac:	4789                	li	a5,2
    30ae:	0afb0f63          	beq	s6,a5,316c <__divdf3+0x502>
    30b2:	478d                	li	a5,3
    30b4:	0afb0563          	beq	s6,a5,315e <__divdf3+0x4f4>
    30b8:	4785                	li	a5,1
    30ba:	f4fb19e3          	bne	s6,a5,300c <__divdf3+0x3a2>
    30be:	4401                	li	s0,0
    30c0:	4701                	li	a4,0
    30c2:	a0b5                	j	312e <__divdf3+0x4c4>
  FP_UNPACK_D (A, a);
    30c4:	884a                	mv	a6,s2
  FP_DIV_D (R, A, B);
    30c6:	8452                	mv	s0,s4
    30c8:	8f26                	mv	t5,s1
    30ca:	b7cd                	j	30ac <__divdf3+0x442>
  FP_PACK_D (r, R);
    30cc:	c3bd                	beqz	a5,3132 <__divdf3+0x4c8>
    30ce:	fc900693          	li	a3,-55
    30d2:	fed7c6e3          	blt	a5,a3,30be <__divdf3+0x454>
    30d6:	5689                	li	a3,-30
    30d8:	04d7cf63          	blt	a5,a3,3136 <__divdf3+0x4cc>
    30dc:	4685                	li	a3,1
    30de:	8e9d                	sub	a3,a3,a5
    30e0:	41e70713          	addi	a4,a4,1054
    30e4:	00df57b3          	srl	a5,t5,a3
    30e8:	00ef1f33          	sll	t5,t5,a4
    30ec:	01e03f33          	snez	t5,t5
    30f0:	00e41733          	sll	a4,s0,a4
    30f4:	00ef6f33          	or	t5,t5,a4
    30f8:	01e7e7b3          	or	a5,a5,t5
    30fc:	00d45433          	srl	s0,s0,a3
    3100:	0077f713          	andi	a4,a5,7
    3104:	cf01                	beqz	a4,311c <__divdf3+0x4b2>
    3106:	00f7f713          	andi	a4,a5,15
    310a:	4691                	li	a3,4
    310c:	00d70863          	beq	a4,a3,311c <__divdf3+0x4b2>
    3110:	00d78733          	add	a4,a5,a3
    3114:	00f736b3          	sltu	a3,a4,a5
    3118:	9436                	add	s0,s0,a3
    311a:	87ba                	mv	a5,a4
    311c:	00841713          	slli	a4,s0,0x8
    3120:	04074b63          	bltz	a4,3176 <__divdf3+0x50c>
    3124:	01d41713          	slli	a4,s0,0x1d
    3128:	838d                	srli	a5,a5,0x3
    312a:	8f5d                	or	a4,a4,a5
    312c:	800d                	srli	s0,s0,0x3
    312e:	4781                	li	a5,0
    3130:	b72d                	j	305a <__divdf3+0x3f0>
    3132:	4685                	li	a3,1
    3134:	b775                	j	30e0 <__divdf3+0x476>
    3136:	5585                	li	a1,-31
    3138:	40f586b3          	sub	a3,a1,a5
    313c:	00d456b3          	srl	a3,s0,a3
    3140:	4601                	li	a2,0
    3142:	00b78663          	beq	a5,a1,314e <__divdf3+0x4e4>
    3146:	43e70713          	addi	a4,a4,1086
    314a:	00e41633          	sll	a2,s0,a4
    314e:	01e66633          	or	a2,a2,t5
    3152:	00c03633          	snez	a2,a2
    3156:	00c6e7b3          	or	a5,a3,a2
    315a:	4401                	li	s0,0
    315c:	b755                	j	3100 <__divdf3+0x496>
    315e:	00080437          	lui	s0,0x80
    3162:	4701                	li	a4,0
    3164:	7ff00793          	li	a5,2047
    3168:	4801                	li	a6,0
    316a:	bdc5                	j	305a <__divdf3+0x3f0>
    316c:	4401                	li	s0,0
    316e:	4701                	li	a4,0
    3170:	7ff00793          	li	a5,2047
    3174:	b5dd                	j	305a <__divdf3+0x3f0>
    3176:	4401                	li	s0,0
    3178:	4701                	li	a4,0
    317a:	4785                	li	a5,1
    317c:	bdf9                	j	305a <__divdf3+0x3f0>

0000317e <__gedf2>:
  FP_DECL_D (A);
  FP_DECL_D (B);
  CMPtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_D (A, a);
    317e:	0145d893          	srli	a7,a1,0x14
    3182:	00100737          	lui	a4,0x100
    3186:	177d                	addi	a4,a4,-1 # fffff <_sp+0xf3a0f>
  FP_UNPACK_RAW_D (B, b);
    3188:	0146d813          	srli	a6,a3,0x14
  FP_UNPACK_RAW_D (A, a);
    318c:	7ff8f893          	andi	a7,a7,2047
  FP_CMP_D (r, A, B, -2, 2);
    3190:	7ff00793          	li	a5,2047
  FP_UNPACK_RAW_D (A, a);
    3194:	00b77333          	and	t1,a4,a1
  FP_UNPACK_RAW_D (B, b);
    3198:	7ff87813          	andi	a6,a6,2047
    319c:	8f75                	and	a4,a4,a3
  FP_UNPACK_RAW_D (A, a);
    319e:	81fd                	srli	a1,a1,0x1f
  FP_UNPACK_RAW_D (B, b);
    31a0:	82fd                	srli	a3,a3,0x1f
  FP_CMP_D (r, A, B, -2, 2);
    31a2:	00f88d63          	beq	a7,a5,31bc <__gedf2+0x3e>
    31a6:	7ff00e13          	li	t3,2047
  FP_UNPACK_RAW_D (B, b);
    31aa:	87c2                	mv	a5,a6
  FP_CMP_D (r, A, B, -2, 2);
    31ac:	01c81f63          	bne	a6,t3,31ca <__gedf2+0x4c>
    31b0:	00c76e33          	or	t3,a4,a2
    31b4:	000e0b63          	beqz	t3,31ca <__gedf2+0x4c>
    31b8:	57f9                	li	a5,-2
    31ba:	a031                	j	31c6 <__gedf2+0x48>
    31bc:	00a36e33          	or	t3,t1,a0
    31c0:	57f9                	li	a5,-2
    31c2:	fe0e02e3          	beqz	t3,31a6 <__gedf2+0x28>
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    31c6:	853e                	mv	a0,a5
    31c8:	8082                	ret
  FP_CMP_D (r, A, B, -2, 2);
    31ca:	4e01                	li	t3,0
    31cc:	00089663          	bnez	a7,31d8 <__gedf2+0x5a>
    31d0:	00a36e33          	or	t3,t1,a0
    31d4:	001e3e13          	seqz	t3,t3
    31d8:	04081363          	bnez	a6,321e <__gedf2+0xa0>
    31dc:	00c76eb3          	or	t4,a4,a2
    31e0:	000e0863          	beqz	t3,31f0 <__gedf2+0x72>
    31e4:	fe0e81e3          	beqz	t4,31c6 <__gedf2+0x48>
    31e8:	00169793          	slli	a5,a3,0x1
    31ec:	17fd                	addi	a5,a5,-1
    31ee:	bfe1                	j	31c6 <__gedf2+0x48>
    31f0:	020e9963          	bnez	t4,3222 <__gedf2+0xa4>
    31f4:	40b005b3          	neg	a1,a1
    31f8:	0015e793          	ori	a5,a1,1
    31fc:	b7e9                	j	31c6 <__gedf2+0x48>
    31fe:	ff08c5e3          	blt	a7,a6,31e8 <__gedf2+0x6a>
    3202:	fe6769e3          	bltu	a4,t1,31f4 <__gedf2+0x76>
    3206:	00a67463          	bgeu	a2,a0,320e <__gedf2+0x90>
    320a:	fee305e3          	beq	t1,a4,31f4 <__gedf2+0x76>
    320e:	00c56563          	bltu	a0,a2,3218 <__gedf2+0x9a>
    3212:	4781                	li	a5,0
    3214:	fae379e3          	bgeu	t1,a4,31c6 <__gedf2+0x48>
    3218:	00159793          	slli	a5,a1,0x1
    321c:	bfc1                	j	31ec <__gedf2+0x6e>
    321e:	fc0e15e3          	bnez	t3,31e8 <__gedf2+0x6a>
    3222:	fcb699e3          	bne	a3,a1,31f4 <__gedf2+0x76>
    3226:	fd185ce3          	bge	a6,a7,31fe <__gedf2+0x80>
    322a:	40d006b3          	neg	a3,a3
    322e:	0016e793          	ori	a5,a3,1
    3232:	bf51                	j	31c6 <__gedf2+0x48>

00003234 <__muldf3>:
#include "soft-fp.h"
#include "double.h"

DFtype
__muldf3 (DFtype a, DFtype b)
{
    3234:	7179                	addi	sp,sp,-48
    3236:	ce4e                	sw	s3,28(sp)
  FP_DECL_D (B);
  FP_DECL_D (R);
  DFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_D (A, a);
    3238:	0145d993          	srli	s3,a1,0x14
{
    323c:	d422                	sw	s0,40(sp)
    323e:	d226                	sw	s1,36(sp)
    3240:	cc52                	sw	s4,24(sp)
    3242:	ca56                	sw	s5,20(sp)
    3244:	c65e                	sw	s7,12(sp)
  FP_UNPACK_D (A, a);
    3246:	00c59493          	slli	s1,a1,0xc
{
    324a:	d606                	sw	ra,44(sp)
    324c:	d04a                	sw	s2,32(sp)
    324e:	c85a                	sw	s6,16(sp)
  FP_UNPACK_D (A, a);
    3250:	7ff9f993          	andi	s3,s3,2047
{
    3254:	842a                	mv	s0,a0
    3256:	8bb2                	mv	s7,a2
    3258:	8a36                	mv	s4,a3
  FP_UNPACK_D (A, a);
    325a:	80b1                	srli	s1,s1,0xc
    325c:	01f5da93          	srli	s5,a1,0x1f
    3260:	08098c63          	beqz	s3,32f8 <__muldf3+0xc4>
    3264:	7ff00793          	li	a5,2047
    3268:	0ef98363          	beq	s3,a5,334e <__muldf3+0x11a>
    326c:	048e                	slli	s1,s1,0x3
    326e:	01d55793          	srli	a5,a0,0x1d
    3272:	8fc5                	or	a5,a5,s1
    3274:	008004b7          	lui	s1,0x800
    3278:	8cdd                	or	s1,s1,a5
    327a:	00351913          	slli	s2,a0,0x3
    327e:	c0198993          	addi	s3,s3,-1023
    3282:	4b01                	li	s6,0
  FP_UNPACK_D (B, b);
    3284:	014a5713          	srli	a4,s4,0x14
    3288:	00ca1413          	slli	s0,s4,0xc
    328c:	7ff77713          	andi	a4,a4,2047
    3290:	8031                	srli	s0,s0,0xc
    3292:	01fa5a13          	srli	s4,s4,0x1f
    3296:	cb71                	beqz	a4,336a <__muldf3+0x136>
    3298:	7ff00793          	li	a5,2047
    329c:	12f70163          	beq	a4,a5,33be <__muldf3+0x18a>
    32a0:	040e                	slli	s0,s0,0x3
    32a2:	01dbd793          	srli	a5,s7,0x1d
    32a6:	8fc1                	or	a5,a5,s0
    32a8:	00800437          	lui	s0,0x800
    32ac:	8c5d                	or	s0,s0,a5
    32ae:	c0170713          	addi	a4,a4,-1023
    32b2:	003b9793          	slli	a5,s7,0x3
    32b6:	4801                	li	a6,0
  FP_MUL_D (R, A, B);
    32b8:	99ba                	add	s3,s3,a4
    32ba:	002b1713          	slli	a4,s6,0x2
    32be:	01076733          	or	a4,a4,a6
    32c2:	46a9                	li	a3,10
    32c4:	00198513          	addi	a0,s3,1
    32c8:	12e6c663          	blt	a3,a4,33f4 <__muldf3+0x1c0>
    32cc:	4609                	li	a2,2
    32ce:	014ac5b3          	xor	a1,s5,s4
    32d2:	4685                	li	a3,1
    32d4:	10e64263          	blt	a2,a4,33d8 <__muldf3+0x1a4>
    32d8:	177d                	addi	a4,a4,-1
    32da:	12e6e763          	bltu	a3,a4,3408 <__muldf3+0x1d4>
    32de:	8b42                	mv	s6,a6
  FP_PACK_D (r, R);
    32e0:	4709                	li	a4,2
    32e2:	38eb0563          	beq	s6,a4,366c <__muldf3+0x438>
    32e6:	470d                	li	a4,3
    32e8:	36eb0e63          	beq	s6,a4,3664 <__muldf3+0x430>
    32ec:	4705                	li	a4,1
    32ee:	26eb1463          	bne	s6,a4,3556 <__muldf3+0x322>
    32f2:	4401                	li	s0,0
    32f4:	4601                	li	a2,0
    32f6:	ae1d                	j	362c <__muldf3+0x3f8>
  FP_UNPACK_D (A, a);
    32f8:	00a4e933          	or	s2,s1,a0
    32fc:	06090063          	beqz	s2,335c <__muldf3+0x128>
    3300:	c88d                	beqz	s1,3332 <__muldf3+0xfe>
    3302:	8526                	mv	a0,s1
    3304:	165000ef          	jal	3c68 <__clzsi2>
    3308:	872a                	mv	a4,a0
    330a:	ff550693          	addi	a3,a0,-11
    330e:	47f5                	li	a5,29
    3310:	ff870613          	addi	a2,a4,-8
    3314:	8f95                	sub	a5,a5,a3
    3316:	00c494b3          	sll	s1,s1,a2
    331a:	00f457b3          	srl	a5,s0,a5
    331e:	8fc5                	or	a5,a5,s1
    3320:	00c414b3          	sll	s1,s0,a2
    3324:	c0d00993          	li	s3,-1011
    3328:	8926                	mv	s2,s1
    332a:	40e989b3          	sub	s3,s3,a4
    332e:	84be                	mv	s1,a5
    3330:	bf89                	j	3282 <__muldf3+0x4e>
    3332:	137000ef          	jal	3c68 <__clzsi2>
    3336:	01550693          	addi	a3,a0,21
    333a:	47f1                	li	a5,28
    333c:	02050713          	addi	a4,a0,32
    3340:	fcd7d7e3          	bge	a5,a3,330e <__muldf3+0xda>
    3344:	ff850793          	addi	a5,a0,-8
    3348:	00f417b3          	sll	a5,s0,a5
    334c:	bfe1                	j	3324 <__muldf3+0xf0>
    334e:	00a4e933          	or	s2,s1,a0
    3352:	00091963          	bnez	s2,3364 <__muldf3+0x130>
    3356:	4481                	li	s1,0
    3358:	4b09                	li	s6,2
    335a:	b72d                	j	3284 <__muldf3+0x50>
    335c:	4481                	li	s1,0
    335e:	4981                	li	s3,0
    3360:	4b05                	li	s6,1
    3362:	b70d                	j	3284 <__muldf3+0x50>
    3364:	892a                	mv	s2,a0
    3366:	4b0d                	li	s6,3
    3368:	bf31                	j	3284 <__muldf3+0x50>
  FP_UNPACK_D (B, b);
    336a:	017467b3          	or	a5,s0,s7
    336e:	cfb1                	beqz	a5,33ca <__muldf3+0x196>
    3370:	c805                	beqz	s0,33a0 <__muldf3+0x16c>
    3372:	8522                	mv	a0,s0
    3374:	0f5000ef          	jal	3c68 <__clzsi2>
    3378:	87aa                	mv	a5,a0
    337a:	ff550713          	addi	a4,a0,-11
    337e:	46f5                	li	a3,29
    3380:	ff878613          	addi	a2,a5,-8
    3384:	8e99                	sub	a3,a3,a4
    3386:	00c41433          	sll	s0,s0,a2
    338a:	00dbd6b3          	srl	a3,s7,a3
    338e:	8ec1                	or	a3,a3,s0
    3390:	00cb9433          	sll	s0,s7,a2
    3394:	c0d00713          	li	a4,-1011
    3398:	8f1d                	sub	a4,a4,a5
    339a:	87a2                	mv	a5,s0
    339c:	8436                	mv	s0,a3
    339e:	bf21                	j	32b6 <__muldf3+0x82>
    33a0:	855e                	mv	a0,s7
    33a2:	0c7000ef          	jal	3c68 <__clzsi2>
    33a6:	01550713          	addi	a4,a0,21
    33aa:	46f1                	li	a3,28
    33ac:	02050793          	addi	a5,a0,32
    33b0:	fce6d7e3          	bge	a3,a4,337e <__muldf3+0x14a>
    33b4:	ff850693          	addi	a3,a0,-8
    33b8:	00db96b3          	sll	a3,s7,a3
    33bc:	bfe1                	j	3394 <__muldf3+0x160>
    33be:	017467b3          	or	a5,s0,s7
    33c2:	eb81                	bnez	a5,33d2 <__muldf3+0x19e>
    33c4:	4401                	li	s0,0
    33c6:	4809                	li	a6,2
    33c8:	bdc5                	j	32b8 <__muldf3+0x84>
    33ca:	4401                	li	s0,0
    33cc:	4701                	li	a4,0
    33ce:	4805                	li	a6,1
    33d0:	b5e5                	j	32b8 <__muldf3+0x84>
    33d2:	87de                	mv	a5,s7
    33d4:	480d                	li	a6,3
    33d6:	b5cd                	j	32b8 <__muldf3+0x84>
    33d8:	00e69733          	sll	a4,a3,a4
  FP_MUL_D (R, A, B);
    33dc:	53077613          	andi	a2,a4,1328
    33e0:	e20d                	bnez	a2,3402 <__muldf3+0x1ce>
    33e2:	24077693          	andi	a3,a4,576
    33e6:	26069963          	bnez	a3,3658 <__muldf3+0x424>
    33ea:	08877713          	andi	a4,a4,136
    33ee:	cf09                	beqz	a4,3408 <__muldf3+0x1d4>
  FP_UNPACK_D (B, b);
    33f0:	85d2                	mv	a1,s4
    33f2:	b5f5                	j	32de <__muldf3+0xaa>
  FP_MUL_D (R, A, B);
    33f4:	46bd                	li	a3,15
    33f6:	26d70763          	beq	a4,a3,3664 <__muldf3+0x430>
    33fa:	46ad                	li	a3,11
  FP_UNPACK_D (A, a);
    33fc:	85d6                	mv	a1,s5
  FP_MUL_D (R, A, B);
    33fe:	fed709e3          	beq	a4,a3,33f0 <__muldf3+0x1bc>
    3402:	8426                	mv	s0,s1
    3404:	87ca                	mv	a5,s2
    3406:	bde9                	j	32e0 <__muldf3+0xac>
    3408:	01095893          	srli	a7,s2,0x10
    340c:	01079e13          	slli	t3,a5,0x10
    3410:	0942                	slli	s2,s2,0x10
    3412:	0107d613          	srli	a2,a5,0x10
    3416:	01095913          	srli	s2,s2,0x10
    341a:	010e5e13          	srli	t3,t3,0x10
    341e:	03c907b3          	mul	a5,s2,t3
    3422:	03c88333          	mul	t1,a7,t3
    3426:	0107d813          	srli	a6,a5,0x10
    342a:	03260733          	mul	a4,a2,s2
    342e:	971a                	add	a4,a4,t1
    3430:	983a                	add	a6,a6,a4
    3432:	02c886b3          	mul	a3,a7,a2
    3436:	00687463          	bgeu	a6,t1,343e <__muldf3+0x20a>
    343a:	6741                	lui	a4,0x10
    343c:	96ba                	add	a3,a3,a4
    343e:	01045713          	srli	a4,s0,0x10
    3442:	07c2                	slli	a5,a5,0x10
    3444:	0442                	slli	s0,s0,0x10
    3446:	83c1                	srli	a5,a5,0x10
    3448:	8041                	srli	s0,s0,0x10
    344a:	01085f93          	srli	t6,a6,0x10
    344e:	0842                	slli	a6,a6,0x10
    3450:	02890f33          	mul	t5,s2,s0
    3454:	983e                	add	a6,a6,a5
    3456:	03270933          	mul	s2,a4,s2
    345a:	010f5313          	srli	t1,t5,0x10
    345e:	028887b3          	mul	a5,a7,s0
    3462:	993e                	add	s2,s2,a5
    3464:	934a                	add	t1,t1,s2
    3466:	02e888b3          	mul	a7,a7,a4
    346a:	00f37463          	bgeu	t1,a5,3472 <__muldf3+0x23e>
    346e:	67c1                	lui	a5,0x10
    3470:	98be                	add	a7,a7,a5
    3472:	0f42                	slli	t5,t5,0x10
    3474:	010f5f13          	srli	t5,t5,0x10
    3478:	01031793          	slli	a5,t1,0x10
    347c:	97fa                	add	a5,a5,t5
    347e:	0104df13          	srli	t5,s1,0x10
    3482:	04c2                	slli	s1,s1,0x10
    3484:	80c1                	srli	s1,s1,0x10
    3486:	03c482b3          	mul	t0,s1,t3
    348a:	01035e93          	srli	t4,t1,0x10
    348e:	9ec6                	add	t4,t4,a7
    3490:	9fbe                	add	t6,t6,a5
    3492:	03cf0e33          	mul	t3,t5,t3
    3496:	0102d893          	srli	a7,t0,0x10
    349a:	03e603b3          	mul	t2,a2,t5
    349e:	02960633          	mul	a2,a2,s1
    34a2:	9672                	add	a2,a2,t3
    34a4:	98b2                	add	a7,a7,a2
    34a6:	01c8f463          	bgeu	a7,t3,34ae <__muldf3+0x27a>
    34aa:	6641                	lui	a2,0x10
    34ac:	93b2                	add	t2,t2,a2
    34ae:	02848633          	mul	a2,s1,s0
    34b2:	02c2                	slli	t0,t0,0x10
    34b4:	0108d313          	srli	t1,a7,0x10
    34b8:	0102d293          	srli	t0,t0,0x10
    34bc:	08c2                	slli	a7,a7,0x10
    34be:	931e                	add	t1,t1,t2
    34c0:	9896                	add	a7,a7,t0
    34c2:	028f0433          	mul	s0,t5,s0
    34c6:	01065e13          	srli	t3,a2,0x10
    34ca:	03e70f33          	mul	t5,a4,t5
    34ce:	02970733          	mul	a4,a4,s1
    34d2:	9722                	add	a4,a4,s0
    34d4:	9e3a                	add	t3,t3,a4
    34d6:	008e7463          	bgeu	t3,s0,34de <__muldf3+0x2aa>
    34da:	6741                	lui	a4,0x10
    34dc:	9f3a                	add	t5,t5,a4
    34de:	0642                	slli	a2,a2,0x10
    34e0:	010e1713          	slli	a4,t3,0x10
    34e4:	8241                	srli	a2,a2,0x10
    34e6:	96fe                	add	a3,a3,t6
    34e8:	9732                	add	a4,a4,a2
    34ea:	9eba                	add	t4,t4,a4
    34ec:	00f6b7b3          	sltu	a5,a3,a5
    34f0:	97f6                	add	a5,a5,t4
    34f2:	98b6                	add	a7,a7,a3
    34f4:	933e                	add	t1,t1,a5
    34f6:	00d8b6b3          	sltu	a3,a7,a3
    34fa:	00eeb633          	sltu	a2,t4,a4
    34fe:	969a                	add	a3,a3,t1
    3500:	01d7beb3          	sltu	t4,a5,t4
    3504:	00f33733          	sltu	a4,t1,a5
    3508:	01d66633          	or	a2,a2,t4
    350c:	0066b333          	sltu	t1,a3,t1
    3510:	010e5e13          	srli	t3,t3,0x10
    3514:	00989793          	slli	a5,a7,0x9
    3518:	9672                	add	a2,a2,t3
    351a:	00676733          	or	a4,a4,t1
    351e:	9732                	add	a4,a4,a2
    3520:	0107e7b3          	or	a5,a5,a6
    3524:	977a                	add	a4,a4,t5
    3526:	00f037b3          	snez	a5,a5
    352a:	0178d893          	srli	a7,a7,0x17
    352e:	0726                	slli	a4,a4,0x9
    3530:	0176d413          	srli	s0,a3,0x17
    3534:	0117e7b3          	or	a5,a5,a7
    3538:	06a6                	slli	a3,a3,0x9
    353a:	8fd5                	or	a5,a5,a3
    353c:	00771693          	slli	a3,a4,0x7
    3540:	8c59                	or	s0,s0,a4
    3542:	0806d363          	bgez	a3,35c8 <__muldf3+0x394>
    3546:	0017d713          	srli	a4,a5,0x1
    354a:	8b85                	andi	a5,a5,1
    354c:	8f5d                	or	a4,a4,a5
    354e:	01f41793          	slli	a5,s0,0x1f
    3552:	8fd9                	or	a5,a5,a4
    3554:	8005                	srli	s0,s0,0x1
  FP_PACK_D (r, R);
    3556:	3ff50713          	addi	a4,a0,1023
    355a:	06e05963          	blez	a4,35cc <__muldf3+0x398>
    355e:	0077f693          	andi	a3,a5,7
    3562:	ce81                	beqz	a3,357a <__muldf3+0x346>
    3564:	00f7f693          	andi	a3,a5,15
    3568:	4611                	li	a2,4
    356a:	00c68863          	beq	a3,a2,357a <__muldf3+0x346>
    356e:	00c786b3          	add	a3,a5,a2
    3572:	00f6b633          	sltu	a2,a3,a5
    3576:	9432                	add	s0,s0,a2
    3578:	87b6                	mv	a5,a3
    357a:	00741693          	slli	a3,s0,0x7
    357e:	0006d863          	bgez	a3,358e <__muldf3+0x35a>
    3582:	ff000737          	lui	a4,0xff000
    3586:	177d                	addi	a4,a4,-1 # feffffff <_sp+0xfeff3a0f>
    3588:	8c79                	and	s0,s0,a4
    358a:	40050713          	addi	a4,a0,1024
    358e:	7fe00693          	li	a3,2046
    3592:	0ce6cd63          	blt	a3,a4,366c <__muldf3+0x438>
    3596:	01d41613          	slli	a2,s0,0x1d
    359a:	838d                	srli	a5,a5,0x3
    359c:	8e5d                	or	a2,a2,a5
    359e:	800d                	srli	s0,s0,0x3
    35a0:	0432                	slli	s0,s0,0xc
    35a2:	8031                	srli	s0,s0,0xc
    35a4:	0752                	slli	a4,a4,0x14
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    35a6:	50b2                	lw	ra,44(sp)
  FP_PACK_D (r, R);
    35a8:	8f41                	or	a4,a4,s0
}
    35aa:	5422                	lw	s0,40(sp)
  FP_PACK_D (r, R);
    35ac:	05fe                	slli	a1,a1,0x1f
    35ae:	00b767b3          	or	a5,a4,a1
}
    35b2:	5492                	lw	s1,36(sp)
    35b4:	5902                	lw	s2,32(sp)
    35b6:	49f2                	lw	s3,28(sp)
    35b8:	4a62                	lw	s4,24(sp)
    35ba:	4ad2                	lw	s5,20(sp)
    35bc:	4b42                	lw	s6,16(sp)
    35be:	4bb2                	lw	s7,12(sp)
    35c0:	8532                	mv	a0,a2
    35c2:	85be                	mv	a1,a5
    35c4:	6145                	addi	sp,sp,48
    35c6:	8082                	ret
  FP_MUL_D (R, A, B);
    35c8:	854e                	mv	a0,s3
    35ca:	b771                	j	3556 <__muldf3+0x322>
  FP_PACK_D (r, R);
    35cc:	c335                	beqz	a4,3630 <__muldf3+0x3fc>
    35ce:	fc900693          	li	a3,-55
    35d2:	d2d740e3          	blt	a4,a3,32f2 <__muldf3+0xbe>
    35d6:	5689                	li	a3,-30
    35d8:	04d74e63          	blt	a4,a3,3634 <__muldf3+0x400>
    35dc:	4685                	li	a3,1
    35de:	40e68733          	sub	a4,a3,a4
    35e2:	41e50513          	addi	a0,a0,1054
    35e6:	00e7d6b3          	srl	a3,a5,a4
    35ea:	00a797b3          	sll	a5,a5,a0
    35ee:	00f037b3          	snez	a5,a5
    35f2:	00a41533          	sll	a0,s0,a0
    35f6:	8fc9                	or	a5,a5,a0
    35f8:	8fd5                	or	a5,a5,a3
    35fa:	00e45433          	srl	s0,s0,a4
    35fe:	0077f713          	andi	a4,a5,7
    3602:	cf01                	beqz	a4,361a <__muldf3+0x3e6>
    3604:	00f7f713          	andi	a4,a5,15
    3608:	4691                	li	a3,4
    360a:	00d70863          	beq	a4,a3,361a <__muldf3+0x3e6>
    360e:	00d78733          	add	a4,a5,a3
    3612:	00f736b3          	sltu	a3,a4,a5
    3616:	9436                	add	s0,s0,a3
    3618:	87ba                	mv	a5,a4
    361a:	00841713          	slli	a4,s0,0x8
    361e:	04074c63          	bltz	a4,3676 <__muldf3+0x442>
    3622:	01d41613          	slli	a2,s0,0x1d
    3626:	838d                	srli	a5,a5,0x3
    3628:	8e5d                	or	a2,a2,a5
    362a:	800d                	srli	s0,s0,0x3
    362c:	4701                	li	a4,0
    362e:	bf8d                	j	35a0 <__muldf3+0x36c>
    3630:	4705                	li	a4,1
    3632:	bf45                	j	35e2 <__muldf3+0x3ae>
    3634:	5805                	li	a6,-31
    3636:	40e806b3          	sub	a3,a6,a4
    363a:	00d456b3          	srl	a3,s0,a3
    363e:	4601                	li	a2,0
    3640:	01070663          	beq	a4,a6,364c <__muldf3+0x418>
    3644:	43e50513          	addi	a0,a0,1086
    3648:	00a41633          	sll	a2,s0,a0
    364c:	8fd1                	or	a5,a5,a2
    364e:	00f037b3          	snez	a5,a5
    3652:	8fd5                	or	a5,a5,a3
    3654:	4401                	li	s0,0
    3656:	b765                	j	35fe <__muldf3+0x3ca>
    3658:	00080437          	lui	s0,0x80
    365c:	7ff00713          	li	a4,2047
    3660:	4581                	li	a1,0
    3662:	bf3d                	j	35a0 <__muldf3+0x36c>
    3664:	00080437          	lui	s0,0x80
    3668:	4601                	li	a2,0
    366a:	bfcd                	j	365c <__muldf3+0x428>
    366c:	4401                	li	s0,0
    366e:	4601                	li	a2,0
    3670:	7ff00713          	li	a4,2047
    3674:	b735                	j	35a0 <__muldf3+0x36c>
    3676:	4401                	li	s0,0
    3678:	4601                	li	a2,0
    367a:	4705                	li	a4,1
    367c:	b715                	j	35a0 <__muldf3+0x36c>

0000367e <__subdf3>:
  FP_DECL_D (B);
  FP_DECL_D (R);
  DFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_SEMIRAW_D (A, a);
    367e:	00100837          	lui	a6,0x100
    3682:	187d                	addi	a6,a6,-1 # fffff <_sp+0xf3a0f>
{
    3684:	1101                	addi	sp,sp,-32
  FP_UNPACK_SEMIRAW_D (A, a);
    3686:	00b877b3          	and	a5,a6,a1
    368a:	0145d713          	srli	a4,a1,0x14
  FP_UNPACK_SEMIRAW_D (B, b);
    368e:	00d87833          	and	a6,a6,a3
    3692:	0146d893          	srli	a7,a3,0x14
{
    3696:	ca26                	sw	s1,20(sp)
  FP_UNPACK_SEMIRAW_D (A, a);
    3698:	078e                	slli	a5,a5,0x3
    369a:	7ff77493          	andi	s1,a4,2047
    369e:	01d55713          	srli	a4,a0,0x1d
{
    36a2:	c84a                	sw	s2,16(sp)
  FP_UNPACK_SEMIRAW_D (A, a);
    36a4:	8fd9                	or	a5,a5,a4
    36a6:	01f5d913          	srli	s2,a1,0x1f
  FP_UNPACK_SEMIRAW_D (B, b);
    36aa:	01d65713          	srli	a4,a2,0x1d
    36ae:	080e                	slli	a6,a6,0x3
{
    36b0:	ce06                	sw	ra,28(sp)
    36b2:	cc22                	sw	s0,24(sp)
    36b4:	c64e                	sw	s3,12(sp)
  FP_UNPACK_SEMIRAW_D (B, b);
    36b6:	7ff8f893          	andi	a7,a7,2047
  FP_SUB_D (R, A, B);
    36ba:	7ff00593          	li	a1,2047
  FP_UNPACK_SEMIRAW_D (A, a);
    36be:	050e                	slli	a0,a0,0x3
  FP_UNPACK_SEMIRAW_D (B, b);
    36c0:	82fd                	srli	a3,a3,0x1f
    36c2:	01076733          	or	a4,a4,a6
    36c6:	060e                	slli	a2,a2,0x3
  FP_SUB_D (R, A, B);
    36c8:	00b89563          	bne	a7,a1,36d2 <__subdf3+0x54>
    36cc:	00c765b3          	or	a1,a4,a2
    36d0:	e199                	bnez	a1,36d6 <__subdf3+0x58>
    36d2:	0016c693          	xori	a3,a3,1
    36d6:	41148833          	sub	a6,s1,a7
    36da:	7ff00593          	li	a1,2047
    36de:	25269a63          	bne	a3,s2,3932 <__subdf3+0x2b4>
    36e2:	0d005863          	blez	a6,37b2 <__subdf3+0x134>
    36e6:	02089463          	bnez	a7,370e <__subdf3+0x90>
    36ea:	00c766b3          	or	a3,a4,a2
    36ee:	ce91                	beqz	a3,370a <__subdf3+0x8c>
    36f0:	fff48813          	addi	a6,s1,-1 # 7fffff <_sp+0x7f3a0f>
    36f4:	00081963          	bnez	a6,3706 <__subdf3+0x88>
    36f8:	962a                	add	a2,a2,a0
    36fa:	97ba                	add	a5,a5,a4
    36fc:	00a63533          	sltu	a0,a2,a0
    3700:	97aa                	add	a5,a5,a0
    3702:	4485                	li	s1,1
    3704:	a889                	j	3756 <__subdf3+0xd8>
    3706:	00b49963          	bne	s1,a1,3718 <__subdf3+0x9a>
    370a:	862a                	mv	a2,a0
    370c:	a241                	j	388c <__subdf3+0x20e>
    370e:	feb48ee3          	beq	s1,a1,370a <__subdf3+0x8c>
    3712:	008006b7          	lui	a3,0x800
    3716:	8f55                	or	a4,a4,a3
    3718:	03800693          	li	a3,56
    371c:	0906c663          	blt	a3,a6,37a8 <__subdf3+0x12a>
    3720:	46fd                	li	a3,31
    3722:	02000893          	li	a7,32
    3726:	0506ce63          	blt	a3,a6,3782 <__subdf3+0x104>
    372a:	410888b3          	sub	a7,a7,a6
    372e:	011716b3          	sll	a3,a4,a7
    3732:	010655b3          	srl	a1,a2,a6
    3736:	011618b3          	sll	a7,a2,a7
    373a:	8ecd                	or	a3,a3,a1
    373c:	011038b3          	snez	a7,a7
    3740:	0116e6b3          	or	a3,a3,a7
    3744:	01075833          	srl	a6,a4,a6
    3748:	00a68633          	add	a2,a3,a0
    374c:	983e                	add	a6,a6,a5
    374e:	00d636b3          	sltu	a3,a2,a3
    3752:	00d807b3          	add	a5,a6,a3
    3756:	00879713          	slli	a4,a5,0x8
    375a:	1a075063          	bgez	a4,38fa <__subdf3+0x27c>
    375e:	0485                	addi	s1,s1,1
    3760:	7ff00713          	li	a4,2047
    3764:	4ae48b63          	beq	s1,a4,3c1a <__subdf3+0x59c>
    3768:	ff800737          	lui	a4,0xff800
    376c:	177d                	addi	a4,a4,-1 # ff7fffff <_sp+0xff7f3a0f>
    376e:	8ff9                	and	a5,a5,a4
    3770:	00165713          	srli	a4,a2,0x1
    3774:	8a05                	andi	a2,a2,1
    3776:	8f51                	or	a4,a4,a2
    3778:	01f79613          	slli	a2,a5,0x1f
    377c:	8e59                	or	a2,a2,a4
    377e:	8385                	srli	a5,a5,0x1
    3780:	aaad                	j	38fa <__subdf3+0x27c>
    3782:	fe080693          	addi	a3,a6,-32
    3786:	00d756b3          	srl	a3,a4,a3
    378a:	4581                	li	a1,0
    378c:	01180863          	beq	a6,a7,379c <__subdf3+0x11e>
    3790:	04000593          	li	a1,64
    3794:	410585b3          	sub	a1,a1,a6
    3798:	00b715b3          	sll	a1,a4,a1
    379c:	8dd1                	or	a1,a1,a2
    379e:	00b035b3          	snez	a1,a1
    37a2:	8ecd                	or	a3,a3,a1
    37a4:	4801                	li	a6,0
    37a6:	b74d                	j	3748 <__subdf3+0xca>
    37a8:	00c766b3          	or	a3,a4,a2
    37ac:	00d036b3          	snez	a3,a3
    37b0:	bfd5                	j	37a4 <__subdf3+0x126>
    37b2:	0a080063          	beqz	a6,3852 <__subdf3+0x1d4>
    37b6:	409886b3          	sub	a3,a7,s1
    37ba:	ec91                	bnez	s1,37d6 <__subdf3+0x158>
    37bc:	00a7e833          	or	a6,a5,a0
    37c0:	00080863          	beqz	a6,37d0 <__subdf3+0x152>
    37c4:	fff68813          	addi	a6,a3,-1 # 7fffff <_sp+0x7f3a0f>
    37c8:	f20808e3          	beqz	a6,36f8 <__subdf3+0x7a>
    37cc:	00b69b63          	bne	a3,a1,37e2 <__subdf3+0x164>
    37d0:	87ba                	mv	a5,a4
    37d2:	84b6                	mv	s1,a3
    37d4:	a865                	j	388c <__subdf3+0x20e>
    37d6:	44b88663          	beq	a7,a1,3c22 <__subdf3+0x5a4>
    37da:	008005b7          	lui	a1,0x800
    37de:	8fcd                	or	a5,a5,a1
    37e0:	8836                	mv	a6,a3
    37e2:	03800693          	li	a3,56
    37e6:	0706c163          	blt	a3,a6,3848 <__subdf3+0x1ca>
    37ea:	46fd                	li	a3,31
    37ec:	02000313          	li	t1,32
    37f0:	0306c963          	blt	a3,a6,3822 <__subdf3+0x1a4>
    37f4:	41030333          	sub	t1,t1,a6
    37f8:	006796b3          	sll	a3,a5,t1
    37fc:	010555b3          	srl	a1,a0,a6
    3800:	00651333          	sll	t1,a0,t1
    3804:	8ecd                	or	a3,a3,a1
    3806:	00603333          	snez	t1,t1
    380a:	0066e6b3          	or	a3,a3,t1
    380e:	0107d833          	srl	a6,a5,a6
    3812:	9636                	add	a2,a2,a3
    3814:	983a                	add	a6,a6,a4
    3816:	00d636b3          	sltu	a3,a2,a3
    381a:	00d807b3          	add	a5,a6,a3
    381e:	84c6                	mv	s1,a7
    3820:	bf1d                	j	3756 <__subdf3+0xd8>
    3822:	fe080693          	addi	a3,a6,-32
    3826:	00d7d6b3          	srl	a3,a5,a3
    382a:	4581                	li	a1,0
    382c:	00680863          	beq	a6,t1,383c <__subdf3+0x1be>
    3830:	04000593          	li	a1,64
    3834:	410585b3          	sub	a1,a1,a6
    3838:	00b795b3          	sll	a1,a5,a1
    383c:	8dc9                	or	a1,a1,a0
    383e:	00b035b3          	snez	a1,a1
    3842:	8ecd                	or	a3,a3,a1
    3844:	4801                	li	a6,0
    3846:	b7f1                	j	3812 <__subdf3+0x194>
    3848:	00a7e6b3          	or	a3,a5,a0
    384c:	00d036b3          	snez	a3,a3
    3850:	bfd5                	j	3844 <__subdf3+0x1c6>
    3852:	00148693          	addi	a3,s1,1
    3856:	7fe6f813          	andi	a6,a3,2046
    385a:	08081363          	bnez	a6,38e0 <__subdf3+0x262>
    385e:	00a7e6b3          	or	a3,a5,a0
    3862:	e8a5                	bnez	s1,38d2 <__subdf3+0x254>
    3864:	3a068363          	beqz	a3,3c0a <__subdf3+0x58c>
    3868:	00c766b3          	or	a3,a4,a2
    386c:	3a068163          	beqz	a3,3c0e <__subdf3+0x590>
    3870:	962a                	add	a2,a2,a0
    3872:	97ba                	add	a5,a5,a4
    3874:	00a63533          	sltu	a0,a2,a0
    3878:	97aa                	add	a5,a5,a0
    387a:	00879713          	slli	a4,a5,0x8
    387e:	28075363          	bgez	a4,3b04 <__subdf3+0x486>
    3882:	ff800737          	lui	a4,0xff800
    3886:	177d                	addi	a4,a4,-1 # ff7fffff <_sp+0xff7f3a0f>
    3888:	8ff9                	and	a5,a5,a4
    388a:	4485                	li	s1,1
  FP_PACK_SEMIRAW_D (r, R);
    388c:	01d79693          	slli	a3,a5,0x1d
    3890:	820d                	srli	a2,a2,0x3
    3892:	7ff00713          	li	a4,2047
    3896:	8ed1                	or	a3,a3,a2
    3898:	838d                	srli	a5,a5,0x3
    389a:	00e49963          	bne	s1,a4,38ac <__subdf3+0x22e>
    389e:	8edd                	or	a3,a3,a5
    38a0:	4781                	li	a5,0
    38a2:	c689                	beqz	a3,38ac <__subdf3+0x22e>
    38a4:	000807b7          	lui	a5,0x80
    38a8:	4681                	li	a3,0
    38aa:	4901                	li	s2,0
    38ac:	7ff4f713          	andi	a4,s1,2047
    38b0:	07b2                	slli	a5,a5,0xc
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    38b2:	40f2                	lw	ra,28(sp)
    38b4:	4462                	lw	s0,24(sp)
  FP_PACK_SEMIRAW_D (r, R);
    38b6:	83b1                	srli	a5,a5,0xc
    38b8:	0752                	slli	a4,a4,0x14
    38ba:	01f91593          	slli	a1,s2,0x1f
    38be:	8f5d                	or	a4,a4,a5
    38c0:	00b767b3          	or	a5,a4,a1
}
    38c4:	44d2                	lw	s1,20(sp)
    38c6:	4942                	lw	s2,16(sp)
    38c8:	49b2                	lw	s3,12(sp)
    38ca:	8536                	mv	a0,a3
    38cc:	85be                	mv	a1,a5
    38ce:	6105                	addi	sp,sp,32
    38d0:	8082                	ret
  FP_SUB_D (R, A, B);
    38d2:	34068063          	beqz	a3,3c12 <__subdf3+0x594>
    38d6:	8f51                	or	a4,a4,a2
    38d8:	24071863          	bnez	a4,3b28 <__subdf3+0x4aa>
    38dc:	862a                	mv	a2,a0
    38de:	ae1d                	j	3c14 <__subdf3+0x596>
    38e0:	32b68c63          	beq	a3,a1,3c18 <__subdf3+0x59a>
    38e4:	962a                	add	a2,a2,a0
    38e6:	97ba                	add	a5,a5,a4
    38e8:	00a63533          	sltu	a0,a2,a0
    38ec:	97aa                	add	a5,a5,a0
    38ee:	01f79713          	slli	a4,a5,0x1f
    38f2:	8205                	srli	a2,a2,0x1
    38f4:	8e59                	or	a2,a2,a4
    38f6:	8385                	srli	a5,a5,0x1
    38f8:	84b6                	mv	s1,a3
  FP_PACK_SEMIRAW_D (r, R);
    38fa:	00767713          	andi	a4,a2,7
    38fe:	cf01                	beqz	a4,3916 <__subdf3+0x298>
    3900:	00f67713          	andi	a4,a2,15
    3904:	4691                	li	a3,4
    3906:	00d70863          	beq	a4,a3,3916 <__subdf3+0x298>
    390a:	00d60733          	add	a4,a2,a3
    390e:	00c736b3          	sltu	a3,a4,a2
    3912:	97b6                	add	a5,a5,a3
    3914:	863a                	mv	a2,a4
    3916:	00879713          	slli	a4,a5,0x8
    391a:	f60759e3          	bgez	a4,388c <__subdf3+0x20e>
    391e:	0485                	addi	s1,s1,1
    3920:	7ff00713          	li	a4,2047
    3924:	2ee48b63          	beq	s1,a4,3c1a <__subdf3+0x59c>
    3928:	ff800737          	lui	a4,0xff800
    392c:	177d                	addi	a4,a4,-1 # ff7fffff <_sp+0xff7f3a0f>
    392e:	8ff9                	and	a5,a5,a4
    3930:	bfb1                	j	388c <__subdf3+0x20e>
  FP_SUB_D (R, A, B);
    3932:	0b005e63          	blez	a6,39ee <__subdf3+0x370>
    3936:	06089e63          	bnez	a7,39b2 <__subdf3+0x334>
    393a:	00c766b3          	or	a3,a4,a2
    393e:	dc0686e3          	beqz	a3,370a <__subdf3+0x8c>
    3942:	fff48813          	addi	a6,s1,-1
    3946:	00081a63          	bnez	a6,395a <__subdf3+0x2dc>
    394a:	40c50633          	sub	a2,a0,a2
    394e:	8f99                	sub	a5,a5,a4
    3950:	00c53533          	sltu	a0,a0,a2
    3954:	8f89                	sub	a5,a5,a0
    3956:	4485                	li	s1,1
    3958:	a099                	j	399e <__subdf3+0x320>
    395a:	dab488e3          	beq	s1,a1,370a <__subdf3+0x8c>
    395e:	03800693          	li	a3,56
    3962:	0906c163          	blt	a3,a6,39e4 <__subdf3+0x366>
    3966:	46fd                	li	a3,31
    3968:	02000893          	li	a7,32
    396c:	0506c963          	blt	a3,a6,39be <__subdf3+0x340>
    3970:	410888b3          	sub	a7,a7,a6
    3974:	011716b3          	sll	a3,a4,a7
    3978:	010655b3          	srl	a1,a2,a6
    397c:	011618b3          	sll	a7,a2,a7
    3980:	8ecd                	or	a3,a3,a1
    3982:	011038b3          	snez	a7,a7
    3986:	0116e6b3          	or	a3,a3,a7
    398a:	01075833          	srl	a6,a4,a6
    398e:	40d50633          	sub	a2,a0,a3
    3992:	41078833          	sub	a6,a5,a6
    3996:	00c53533          	sltu	a0,a0,a2
    399a:	40a807b3          	sub	a5,a6,a0
    399e:	00879713          	slli	a4,a5,0x8
    39a2:	f4075ce3          	bgez	a4,38fa <__subdf3+0x27c>
    39a6:	00800437          	lui	s0,0x800
    39aa:	147d                	addi	s0,s0,-1 # 7fffff <_sp+0x7f3a0f>
    39ac:	8c7d                	and	s0,s0,a5
    39ae:	89b2                	mv	s3,a2
    39b0:	aa4d                	j	3b62 <__subdf3+0x4e4>
    39b2:	d4b48ce3          	beq	s1,a1,370a <__subdf3+0x8c>
    39b6:	008006b7          	lui	a3,0x800
    39ba:	8f55                	or	a4,a4,a3
    39bc:	b74d                	j	395e <__subdf3+0x2e0>
    39be:	fe080693          	addi	a3,a6,-32
    39c2:	00d756b3          	srl	a3,a4,a3
    39c6:	4581                	li	a1,0
    39c8:	01180863          	beq	a6,a7,39d8 <__subdf3+0x35a>
    39cc:	04000593          	li	a1,64
    39d0:	410585b3          	sub	a1,a1,a6
    39d4:	00b715b3          	sll	a1,a4,a1
    39d8:	8dd1                	or	a1,a1,a2
    39da:	00b035b3          	snez	a1,a1
    39de:	8ecd                	or	a3,a3,a1
    39e0:	4801                	li	a6,0
    39e2:	b775                	j	398e <__subdf3+0x310>
    39e4:	00c766b3          	or	a3,a4,a2
    39e8:	00d036b3          	snez	a3,a3
    39ec:	bfd5                	j	39e0 <__subdf3+0x362>
    39ee:	0c080263          	beqz	a6,3ab2 <__subdf3+0x434>
    39f2:	40988333          	sub	t1,a7,s1
    39f6:	e88d                	bnez	s1,3a28 <__subdf3+0x3aa>
    39f8:	00a7e833          	or	a6,a5,a0
    39fc:	02080263          	beqz	a6,3a20 <__subdf3+0x3a2>
    3a00:	fff30813          	addi	a6,t1,-1
    3a04:	00081c63          	bnez	a6,3a1c <__subdf3+0x39e>
    3a08:	40a60533          	sub	a0,a2,a0
    3a0c:	00a635b3          	sltu	a1,a2,a0
    3a10:	40f707b3          	sub	a5,a4,a5
    3a14:	862a                	mv	a2,a0
    3a16:	8f8d                	sub	a5,a5,a1
    3a18:	8936                	mv	s2,a3
    3a1a:	bf35                	j	3956 <__subdf3+0x2d8>
    3a1c:	00b31c63          	bne	t1,a1,3a34 <__subdf3+0x3b6>
    3a20:	8936                	mv	s2,a3
    3a22:	87ba                	mv	a5,a4
    3a24:	849a                	mv	s1,t1
    3a26:	b59d                	j	388c <__subdf3+0x20e>
    3a28:	1eb88c63          	beq	a7,a1,3c20 <__subdf3+0x5a2>
    3a2c:	008005b7          	lui	a1,0x800
    3a30:	8fcd                	or	a5,a5,a1
    3a32:	881a                	mv	a6,t1
    3a34:	03800593          	li	a1,56
    3a38:	0705c863          	blt	a1,a6,3aa8 <__subdf3+0x42a>
    3a3c:	45fd                	li	a1,31
    3a3e:	02000e13          	li	t3,32
    3a42:	0305ce63          	blt	a1,a6,3a7e <__subdf3+0x400>
    3a46:	410e0e33          	sub	t3,t3,a6
    3a4a:	01c795b3          	sll	a1,a5,t3
    3a4e:	01055333          	srl	t1,a0,a6
    3a52:	01c51e33          	sll	t3,a0,t3
    3a56:	0065e5b3          	or	a1,a1,t1
    3a5a:	01c03e33          	snez	t3,t3
    3a5e:	01c5e5b3          	or	a1,a1,t3
    3a62:	0107d833          	srl	a6,a5,a6
    3a66:	40b605b3          	sub	a1,a2,a1
    3a6a:	00b637b3          	sltu	a5,a2,a1
    3a6e:	41070833          	sub	a6,a4,a6
    3a72:	862e                	mv	a2,a1
    3a74:	40f807b3          	sub	a5,a6,a5
    3a78:	84c6                	mv	s1,a7
    3a7a:	8936                	mv	s2,a3
    3a7c:	b70d                	j	399e <__subdf3+0x320>
    3a7e:	fe080593          	addi	a1,a6,-32
    3a82:	00b7d5b3          	srl	a1,a5,a1
    3a86:	4301                	li	t1,0
    3a88:	01c80863          	beq	a6,t3,3a98 <__subdf3+0x41a>
    3a8c:	04000313          	li	t1,64
    3a90:	41030333          	sub	t1,t1,a6
    3a94:	00679333          	sll	t1,a5,t1
    3a98:	00a36333          	or	t1,t1,a0
    3a9c:	00603333          	snez	t1,t1
    3aa0:	0065e5b3          	or	a1,a1,t1
    3aa4:	4801                	li	a6,0
    3aa6:	b7c1                	j	3a66 <__subdf3+0x3e8>
    3aa8:	00a7e5b3          	or	a1,a5,a0
    3aac:	00b035b3          	snez	a1,a1
    3ab0:	bfd5                	j	3aa4 <__subdf3+0x426>
    3ab2:	00148813          	addi	a6,s1,1
    3ab6:	7fe87813          	andi	a6,a6,2046
    3aba:	06081f63          	bnez	a6,3b38 <__subdf3+0x4ba>
    3abe:	00c76833          	or	a6,a4,a2
    3ac2:	00a7e8b3          	or	a7,a5,a0
    3ac6:	eca1                	bnez	s1,3b1e <__subdf3+0x4a0>
    3ac8:	00089763          	bnez	a7,3ad6 <__subdf3+0x458>
    3acc:	87ba                	mv	a5,a4
    3ace:	02081a63          	bnez	a6,3b02 <__subdf3+0x484>
    3ad2:	4901                	li	s2,0
    3ad4:	a299                	j	3c1a <__subdf3+0x59c>
    3ad6:	12080c63          	beqz	a6,3c0e <__subdf3+0x590>
    3ada:	40c50833          	sub	a6,a0,a2
    3ade:	010538b3          	sltu	a7,a0,a6
    3ae2:	40e785b3          	sub	a1,a5,a4
    3ae6:	411585b3          	sub	a1,a1,a7
    3aea:	00859893          	slli	a7,a1,0x8
    3aee:	0208d163          	bgez	a7,3b10 <__subdf3+0x492>
    3af2:	40a60533          	sub	a0,a2,a0
    3af6:	00a635b3          	sltu	a1,a2,a0
    3afa:	40f707b3          	sub	a5,a4,a5
    3afe:	862a                	mv	a2,a0
    3b00:	8f8d                	sub	a5,a5,a1
    3b02:	8936                	mv	s2,a3
  FP_PACK_SEMIRAW_D (r, R);
    3b04:	00f66733          	or	a4,a2,a5
    3b08:	12070363          	beqz	a4,3c2e <__subdf3+0x5b0>
    3b0c:	4481                	li	s1,0
    3b0e:	b3f5                	j	38fa <__subdf3+0x27c>
  FP_SUB_D (R, A, B);
    3b10:	00b86633          	or	a2,a6,a1
    3b14:	10060a63          	beqz	a2,3c28 <__subdf3+0x5aa>
    3b18:	87ae                	mv	a5,a1
    3b1a:	8642                	mv	a2,a6
    3b1c:	b7e5                	j	3b04 <__subdf3+0x486>
    3b1e:	00089a63          	bnez	a7,3b32 <__subdf3+0x4b4>
    3b22:	8936                	mv	s2,a3
    3b24:	0e081763          	bnez	a6,3c12 <__subdf3+0x594>
    3b28:	4901                	li	s2,0
    3b2a:	004007b7          	lui	a5,0x400
    3b2e:	4601                	li	a2,0
    3b30:	a0d5                	j	3c14 <__subdf3+0x596>
    3b32:	da0805e3          	beqz	a6,38dc <__subdf3+0x25e>
    3b36:	bfcd                	j	3b28 <__subdf3+0x4aa>
    3b38:	40c505b3          	sub	a1,a0,a2
    3b3c:	00b53833          	sltu	a6,a0,a1
    3b40:	40e78433          	sub	s0,a5,a4
    3b44:	41040433          	sub	s0,s0,a6
    3b48:	00841813          	slli	a6,s0,0x8
    3b4c:	89ae                	mv	s3,a1
    3b4e:	06085263          	bgez	a6,3bb2 <__subdf3+0x534>
    3b52:	40a609b3          	sub	s3,a2,a0
    3b56:	40f70433          	sub	s0,a4,a5
    3b5a:	01363633          	sltu	a2,a2,s3
    3b5e:	8c11                	sub	s0,s0,a2
    3b60:	8936                	mv	s2,a3
    3b62:	cc39                	beqz	s0,3bc0 <__subdf3+0x542>
    3b64:	8522                	mv	a0,s0
    3b66:	2209                	jal	3c68 <__clzsi2>
    3b68:	ff850713          	addi	a4,a0,-8
    3b6c:	02000793          	li	a5,32
    3b70:	8f99                	sub	a5,a5,a4
    3b72:	00e41433          	sll	s0,s0,a4
    3b76:	00f9d7b3          	srl	a5,s3,a5
    3b7a:	8fc1                	or	a5,a5,s0
    3b7c:	00e99633          	sll	a2,s3,a4
    3b80:	06974f63          	blt	a4,s1,3bfe <__subdf3+0x580>
    3b84:	8f05                	sub	a4,a4,s1
    3b86:	00170513          	addi	a0,a4,1
    3b8a:	46fd                	li	a3,31
    3b8c:	02000593          	li	a1,32
    3b90:	04a6c563          	blt	a3,a0,3bda <__subdf3+0x55c>
    3b94:	8d89                	sub	a1,a1,a0
    3b96:	00b79733          	sll	a4,a5,a1
    3b9a:	00a656b3          	srl	a3,a2,a0
    3b9e:	00b615b3          	sll	a1,a2,a1
    3ba2:	8f55                	or	a4,a4,a3
    3ba4:	00b035b3          	snez	a1,a1
    3ba8:	00b76633          	or	a2,a4,a1
    3bac:	00a7d7b3          	srl	a5,a5,a0
    3bb0:	bf91                	j	3b04 <__subdf3+0x486>
    3bb2:	0085e633          	or	a2,a1,s0
    3bb6:	f655                	bnez	a2,3b62 <__subdf3+0x4e4>
    3bb8:	4901                	li	s2,0
    3bba:	4781                	li	a5,0
    3bbc:	4481                	li	s1,0
    3bbe:	b1f9                	j	388c <__subdf3+0x20e>
    3bc0:	854e                	mv	a0,s3
    3bc2:	205d                	jal	3c68 <__clzsi2>
    3bc4:	01850713          	addi	a4,a0,24
    3bc8:	47fd                	li	a5,31
    3bca:	fae7d1e3          	bge	a5,a4,3b6c <__subdf3+0x4ee>
    3bce:	ff850793          	addi	a5,a0,-8
    3bd2:	00f997b3          	sll	a5,s3,a5
    3bd6:	4601                	li	a2,0
    3bd8:	b765                	j	3b80 <__subdf3+0x502>
    3bda:	1705                	addi	a4,a4,-31
    3bdc:	00e7d733          	srl	a4,a5,a4
    3be0:	4681                	li	a3,0
    3be2:	00b50763          	beq	a0,a1,3bf0 <__subdf3+0x572>
    3be6:	04000693          	li	a3,64
    3bea:	8e89                	sub	a3,a3,a0
    3bec:	00d796b3          	sll	a3,a5,a3
    3bf0:	8ed1                	or	a3,a3,a2
    3bf2:	00d036b3          	snez	a3,a3
    3bf6:	00d76633          	or	a2,a4,a3
    3bfa:	4781                	li	a5,0
    3bfc:	b721                	j	3b04 <__subdf3+0x486>
    3bfe:	8c99                	sub	s1,s1,a4
    3c00:	ff800737          	lui	a4,0xff800
    3c04:	177d                	addi	a4,a4,-1 # ff7fffff <_sp+0xff7f3a0f>
    3c06:	8ff9                	and	a5,a5,a4
    3c08:	b9cd                	j	38fa <__subdf3+0x27c>
    3c0a:	87ba                	mv	a5,a4
    3c0c:	bde5                	j	3b04 <__subdf3+0x486>
    3c0e:	862a                	mv	a2,a0
    3c10:	bdd5                	j	3b04 <__subdf3+0x486>
    3c12:	87ba                	mv	a5,a4
    3c14:	84ae                	mv	s1,a1
    3c16:	b99d                	j	388c <__subdf3+0x20e>
    3c18:	84b6                	mv	s1,a3
    3c1a:	4781                	li	a5,0
    3c1c:	4601                	li	a2,0
    3c1e:	b1bd                	j	388c <__subdf3+0x20e>
    3c20:	8936                	mv	s2,a3
    3c22:	87ba                	mv	a5,a4
    3c24:	84c6                	mv	s1,a7
    3c26:	b19d                	j	388c <__subdf3+0x20e>
    3c28:	4901                	li	s2,0
    3c2a:	4781                	li	a5,0
    3c2c:	b185                	j	388c <__subdf3+0x20e>
    3c2e:	4781                	li	a5,0
    3c30:	4601                	li	a2,0
    3c32:	b769                	j	3bbc <__subdf3+0x53e>

00003c34 <__unorddf2>:
  FP_DECL_D (A);
  FP_DECL_D (B);
  CMPtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_D (A, a);
    3c34:	001007b7          	lui	a5,0x100
    3c38:	17fd                	addi	a5,a5,-1 # fffff <_sp+0xf3a0f>
    3c3a:	00b7f733          	and	a4,a5,a1
    3c3e:	81d1                	srli	a1,a1,0x14
  FP_UNPACK_RAW_D (B, b);
    3c40:	8ff5                	and	a5,a5,a3
  FP_UNPACK_RAW_D (A, a);
    3c42:	7ff5f593          	andi	a1,a1,2047
  FP_UNPACK_RAW_D (B, b);
    3c46:	82d1                	srli	a3,a3,0x14
  FP_CMP_UNORD_D (r, A, B, 1);
    3c48:	7ff00813          	li	a6,2047
  FP_UNPACK_RAW_D (B, b);
    3c4c:	7ff6f693          	andi	a3,a3,2047
  FP_CMP_UNORD_D (r, A, B, 1);
    3c50:	01059563          	bne	a1,a6,3c5a <__unorddf2+0x26>
    3c54:	8f49                	or	a4,a4,a0
    3c56:	4505                	li	a0,1
    3c58:	e719                	bnez	a4,3c66 <__unorddf2+0x32>
    3c5a:	4501                	li	a0,0
    3c5c:	01069563          	bne	a3,a6,3c66 <__unorddf2+0x32>
    3c60:	8fd1                	or	a5,a5,a2
    3c62:	00f03533          	snez	a0,a5
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    3c66:	8082                	ret

00003c68 <__clzsi2>:
int
__clzSI2 (UWtype x)
{
  Wtype ret;

  count_leading_zeros (ret, x);
    3c68:	67c1                	lui	a5,0x10
    3c6a:	02f57563          	bgeu	a0,a5,3c94 <__clzsi2+0x2c>
    3c6e:	10053793          	sltiu	a5,a0,256
    3c72:	0017b793          	seqz	a5,a5
    3c76:	078e                	slli	a5,a5,0x3
    3c78:	6729                	lui	a4,0xa
    3c7a:	00f55533          	srl	a0,a0,a5
    3c7e:	5fc70713          	addi	a4,a4,1532 # a5fc <__clz_tab>
    3c82:	972a                	add	a4,a4,a0
    3c84:	00074503          	lbu	a0,0(a4)
    3c88:	02000693          	li	a3,32
    3c8c:	8e9d                	sub	a3,a3,a5

  return ret;
}
    3c8e:	40a68533          	sub	a0,a3,a0
    3c92:	8082                	ret
  count_leading_zeros (ret, x);
    3c94:	01000737          	lui	a4,0x1000
    3c98:	47e1                	li	a5,24
    3c9a:	fce57fe3          	bgeu	a0,a4,3c78 <__clzsi2+0x10>
    3c9e:	47c1                	li	a5,16
    3ca0:	bfe1                	j	3c78 <__clzsi2+0x10>

00003ca2 <__ledf2>:
  FP_DECL_D (A);
  FP_DECL_D (B);
  CMPtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_D (A, a);
    3ca2:	0145d893          	srli	a7,a1,0x14
    3ca6:	00100737          	lui	a4,0x100
    3caa:	177d                	addi	a4,a4,-1 # fffff <_sp+0xf3a0f>
  FP_UNPACK_RAW_D (B, b);
    3cac:	0146d813          	srli	a6,a3,0x14
  FP_UNPACK_RAW_D (A, a);
    3cb0:	7ff8f893          	andi	a7,a7,2047
  FP_CMP_D (r, A, B, 2, 2);
    3cb4:	7ff00793          	li	a5,2047
  FP_UNPACK_RAW_D (A, a);
    3cb8:	00b77333          	and	t1,a4,a1
  FP_UNPACK_RAW_D (B, b);
    3cbc:	7ff87813          	andi	a6,a6,2047
    3cc0:	8f75                	and	a4,a4,a3
  FP_UNPACK_RAW_D (A, a);
    3cc2:	81fd                	srli	a1,a1,0x1f
  FP_UNPACK_RAW_D (B, b);
    3cc4:	82fd                	srli	a3,a3,0x1f
  FP_CMP_D (r, A, B, 2, 2);
    3cc6:	00f88d63          	beq	a7,a5,3ce0 <__ledf2+0x3e>
    3cca:	7ff00e13          	li	t3,2047
  FP_UNPACK_RAW_D (B, b);
    3cce:	87c2                	mv	a5,a6
  FP_CMP_D (r, A, B, 2, 2);
    3cd0:	01c81f63          	bne	a6,t3,3cee <__ledf2+0x4c>
    3cd4:	00c76e33          	or	t3,a4,a2
    3cd8:	000e0b63          	beqz	t3,3cee <__ledf2+0x4c>
    3cdc:	4789                	li	a5,2
    3cde:	a031                	j	3cea <__ledf2+0x48>
    3ce0:	00a36e33          	or	t3,t1,a0
    3ce4:	4789                	li	a5,2
    3ce6:	fe0e02e3          	beqz	t3,3cca <__ledf2+0x28>
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    3cea:	853e                	mv	a0,a5
    3cec:	8082                	ret
  FP_CMP_D (r, A, B, 2, 2);
    3cee:	4e01                	li	t3,0
    3cf0:	00089663          	bnez	a7,3cfc <__ledf2+0x5a>
    3cf4:	00a36e33          	or	t3,t1,a0
    3cf8:	001e3e13          	seqz	t3,t3
    3cfc:	04081363          	bnez	a6,3d42 <__ledf2+0xa0>
    3d00:	00c76eb3          	or	t4,a4,a2
    3d04:	000e0863          	beqz	t3,3d14 <__ledf2+0x72>
    3d08:	fe0e81e3          	beqz	t4,3cea <__ledf2+0x48>
    3d0c:	00169793          	slli	a5,a3,0x1
    3d10:	17fd                	addi	a5,a5,-1 # ffff <_sp+0x3a0f>
    3d12:	bfe1                	j	3cea <__ledf2+0x48>
    3d14:	020e9963          	bnez	t4,3d46 <__ledf2+0xa4>
    3d18:	40b005b3          	neg	a1,a1
    3d1c:	0015e793          	ori	a5,a1,1
    3d20:	b7e9                	j	3cea <__ledf2+0x48>
    3d22:	ff08c5e3          	blt	a7,a6,3d0c <__ledf2+0x6a>
    3d26:	fe6769e3          	bltu	a4,t1,3d18 <__ledf2+0x76>
    3d2a:	00a67463          	bgeu	a2,a0,3d32 <__ledf2+0x90>
    3d2e:	fee305e3          	beq	t1,a4,3d18 <__ledf2+0x76>
    3d32:	00c56563          	bltu	a0,a2,3d3c <__ledf2+0x9a>
    3d36:	4781                	li	a5,0
    3d38:	fae379e3          	bgeu	t1,a4,3cea <__ledf2+0x48>
    3d3c:	00159793          	slli	a5,a1,0x1
    3d40:	bfc1                	j	3d10 <__ledf2+0x6e>
    3d42:	fc0e15e3          	bnez	t3,3d0c <__ledf2+0x6a>
    3d46:	fcb699e3          	bne	a3,a1,3d18 <__ledf2+0x76>
    3d4a:	fd185ce3          	bge	a6,a7,3d22 <__ledf2+0x80>
    3d4e:	40d006b3          	neg	a3,a3
    3d52:	0016e793          	ori	a5,a3,1
    3d56:	bf51                	j	3cea <__ledf2+0x48>

00003d58 <__fixdfsi>:
  FP_DECL_EX;
  FP_DECL_D (A);
  USItype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_D (A, a);
    3d58:	0145d713          	srli	a4,a1,0x14
    3d5c:	001006b7          	lui	a3,0x100
    3d60:	fff68793          	addi	a5,a3,-1 # fffff <_sp+0xf3a0f>
    3d64:	7ff77713          	andi	a4,a4,2047
  FP_TO_INT_D (r, A, SI_BITS, 1);
    3d68:	3fe00613          	li	a2,1022
  FP_UNPACK_RAW_D (A, a);
    3d6c:	8fed                	and	a5,a5,a1
    3d6e:	81fd                	srli	a1,a1,0x1f
  FP_TO_INT_D (r, A, SI_BITS, 1);
    3d70:	04e65363          	bge	a2,a4,3db6 <__fixdfsi+0x5e>
    3d74:	41d00613          	li	a2,1053
    3d78:	00e65763          	bge	a2,a4,3d86 <__fixdfsi+0x2e>
    3d7c:	80000537          	lui	a0,0x80000
    3d80:	157d                	addi	a0,a0,-1 # 7fffffff <_sp+0x7fff3a0f>
    3d82:	952e                	add	a0,a0,a1
    3d84:	8082                	ret
    3d86:	8fd5                	or	a5,a5,a3
    3d88:	41300693          	li	a3,1043
    3d8c:	02e6d163          	bge	a3,a4,3dae <__fixdfsi+0x56>
    3d90:	bed70693          	addi	a3,a4,-1043
    3d94:	00d797b3          	sll	a5,a5,a3
    3d98:	43300693          	li	a3,1075
    3d9c:	40e68733          	sub	a4,a3,a4
    3da0:	00e55533          	srl	a0,a0,a4
    3da4:	8d5d                	or	a0,a0,a5
    3da6:	c989                	beqz	a1,3db8 <__fixdfsi+0x60>
    3da8:	40a00533          	neg	a0,a0
    3dac:	8082                	ret
    3dae:	8e99                	sub	a3,a3,a4
    3db0:	00d7d533          	srl	a0,a5,a3
    3db4:	bfcd                	j	3da6 <__fixdfsi+0x4e>
    3db6:	4501                	li	a0,0
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    3db8:	8082                	ret

00003dba <__floatunsidf>:
#include "soft-fp.h"
#include "double.h"

DFtype
__floatunsidf (USItype i)
{
    3dba:	1141                	addi	sp,sp,-16
    3dbc:	c422                	sw	s0,8(sp)
    3dbe:	c606                	sw	ra,12(sp)
    3dc0:	842a                	mv	s0,a0
  FP_DECL_D (A);
  DFtype a;

  FP_FROM_INT_D (A, i, SI_BITS, USItype);
    3dc2:	cd15                	beqz	a0,3dfe <__floatunsidf+0x44>
    3dc4:	3555                	jal	3c68 <__clzsi2>
    3dc6:	41e00713          	li	a4,1054
    3dca:	47a9                	li	a5,10
    3dcc:	8f09                	sub	a4,a4,a0
    3dce:	02a7c363          	blt	a5,a0,3df4 <__floatunsidf+0x3a>
    3dd2:	47ad                	li	a5,11
    3dd4:	8f89                	sub	a5,a5,a0
    3dd6:	0555                	addi	a0,a0,21
    3dd8:	00f457b3          	srl	a5,s0,a5
    3ddc:	00a41433          	sll	s0,s0,a0
  FP_PACK_RAW_D (a, A);

  return a;
}
    3de0:	40b2                	lw	ra,12(sp)
    3de2:	8522                	mv	a0,s0
    3de4:	4422                	lw	s0,8(sp)
  FP_PACK_RAW_D (a, A);
    3de6:	07b2                	slli	a5,a5,0xc
    3de8:	0752                	slli	a4,a4,0x14
    3dea:	83b1                	srli	a5,a5,0xc
}
    3dec:	00f765b3          	or	a1,a4,a5
    3df0:	0141                	addi	sp,sp,16
    3df2:	8082                	ret
  FP_FROM_INT_D (A, i, SI_BITS, USItype);
    3df4:	1555                	addi	a0,a0,-11
    3df6:	00a417b3          	sll	a5,s0,a0
    3dfa:	4401                	li	s0,0
    3dfc:	b7d5                	j	3de0 <__floatunsidf+0x26>
    3dfe:	4781                	li	a5,0
    3e00:	4701                	li	a4,0
    3e02:	bff9                	j	3de0 <__floatunsidf+0x26>
