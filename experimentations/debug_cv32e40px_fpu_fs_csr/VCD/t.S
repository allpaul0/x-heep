0000a434 <inferenceTPG>:
    a434:	eb010113          	addi	sp,sp,-336
    a438:	14112623          	sw	ra,332(sp)
    a43c:	14812423          	sw	s0,328(sp)
    a440:	14912223          	sw	s1,324(sp)
    a444:	15212023          	sw	s2,320(sp)
    a448:	13312e23          	sw	s3,316(sp)
    a44c:	13412c23          	sw	s4,312(sp)
    a450:	00050a13          	mv	s4,a0
    a454:	00058993          	mv	s3,a1
    a458:	00060413          	mv	s0,a2
    a45c:	00068913          	mv	s2,a3
    a460:	00070493          	mv	s1,a4
    a464:	0000b7b7          	lui	a5,0xb
    a468:	c5878793          	addi	a5,a5,-936 # ac58 <inferenceTPG+0x824>
    a46c:	00078067          	jr	a5
    a470:	02012223          	sw	zero,36(sp)
    a474:	f0000753          	fmv.w.x	fa4,zero
    a478:	0009a787          	flw	fa5,0(s3)
    a47c:	08f777d3          	fsub.s	fa5,fa4,fa5
    a480:	02f12427          	fsw	fa5,40(sp)
    a484:	00492787          	flw	fa5,4(s2)
    a488:	a0f717d3          	flt.s	a5,fa4,fa5
    a48c:	00079e63          	bnez	a5,a4a8 <inferenceTPG+0x74>
    a490:	a0e797d3          	flt.s	a5,fa5,fa4
    a494:	00079663          	bnez	a5,a4a0 <inferenceTPG+0x6c>
    a498:	af81a787          	flw	fa5,-1288(gp) # 21620 <__SDATA_BEGIN__+0x58>
    a49c:	0100006f          	j	a4ac <inferenceTPG+0x78>
    a4a0:	af01a787          	flw	fa5,-1296(gp) # 21618 <__SDATA_BEGIN__+0x50>
    a4a4:	0080006f          	j	a4ac <inferenceTPG+0x78>
    a4a8:	af41a787          	flw	fa5,-1292(gp) # 2161c <__SDATA_BEGIN__+0x54>
    a4ac:	02f12627          	fsw	fa5,44(sp)
    a4b0:	00300593          	li	a1,3
    a4b4:	02410513          	addi	a0,sp,36
    a4b8:	f11ff0ef          	jal	a3c8 <bestProgram>
    a4bc:	000207b7          	lui	a5,0x20
    a4c0:	6bc78793          	addi	a5,a5,1724 # 206bc <jump_table.20>
    a4c4:	00251713          	slli	a4,a0,0x2
    a4c8:	00e78733          	add	a4,a5,a4
    a4cc:	07072703          	lw	a4,112(a4)
    a4d0:	00271713          	slli	a4,a4,0x2
    a4d4:	00e787b3          	add	a5,a5,a4
    a4d8:	0007a783          	lw	a5,0(a5)
    a4dc:	f91ff06f          	j	a46c <inferenceTPG+0x38>
    a4e0:	00892707          	flw	fa4,8(s2)
    a4e4:	00842787          	flw	fa5,8(s0) # 800008 <_sp+0x7d6798>
    a4e8:	00e7f7d3          	fadd.s	fa5,fa5,fa4
    a4ec:	02f12827          	fsw	fa5,48(sp)
    a4f0:	0089a787          	flw	fa5,8(s3)
    a4f4:	10e7f7d3          	fmul.s	fa5,fa5,fa4
    a4f8:	02f12a27          	fsw	fa5,52(sp)
    a4fc:	0004a787          	flw	fa5,0(s1) # 400000 <_sp+0x3d6790>
    a500:	00492707          	flw	fa4,4(s2)
    a504:	f00006d3          	fmv.w.x	fa3,zero
    a508:	a0d727d3          	feq.s	a5,fa4,fa3
    a50c:	02078263          	beqz	a5,a530 <inferenceTPG+0xfc>
    a510:	a0f697d3          	flt.s	a5,fa3,fa5
    a514:	04079a63          	bnez	a5,a568 <inferenceTPG+0x134>
    a518:	a0d797d3          	flt.s	a5,fa5,fa3
    a51c:	00079663          	bnez	a5,a528 <inferenceTPG+0xf4>
    a520:	af81a787          	flw	fa5,-1288(gp) # 21620 <__SDATA_BEGIN__+0x58>
    a524:	0100006f          	j	a534 <inferenceTPG+0x100>
    a528:	af01a787          	flw	fa5,-1296(gp) # 21618 <__SDATA_BEGIN__+0x50>
    a52c:	0080006f          	j	a534 <inferenceTPG+0x100>
    a530:	18e7f7d3          	fdiv.s	fa5,fa5,fa4
    a534:	02f12c27          	fsw	fa5,56(sp)
    a538:	00300593          	li	a1,3
    a53c:	03010513          	addi	a0,sp,48
    a540:	e89ff0ef          	jal	a3c8 <bestProgram>
    a544:	000207b7          	lui	a5,0x20
    a548:	6bc78793          	addi	a5,a5,1724 # 206bc <jump_table.20>
    a54c:	00251713          	slli	a4,a0,0x2
    a550:	00e78733          	add	a4,a5,a4
    a554:	07c72703          	lw	a4,124(a4)
    a558:	00271713          	slli	a4,a4,0x2
    a55c:	00e787b3          	add	a5,a5,a4
    a560:	0007a783          	lw	a5,0(a5)
    a564:	f09ff06f          	j	a46c <inferenceTPG+0x38>
    a568:	af41a787          	flw	fa5,-1292(gp) # 2161c <__SDATA_BEGIN__+0x54>
    a56c:	fc9ff06f          	j	a534 <inferenceTPG+0x100>
    a570:	00892707          	flw	fa4,8(s2)
    a574:	00842787          	flw	fa5,8(s0)
    a578:	00e7f7d3          	fadd.s	fa5,fa5,fa4
    a57c:	00f12227          	fsw	fa5,4(sp)
    a580:	0084a787          	flw	fa5,8(s1)
    a584:	10e7f7d3          	fmul.s	fa5,fa5,fa4
    a588:	00f12427          	fsw	fa5,8(sp)
    a58c:	00200593          	li	a1,2
    a590:	00410513          	addi	a0,sp,4
    a594:	e35ff0ef          	jal	a3c8 <bestProgram>
    a598:	00251513          	slli	a0,a0,0x2
    a59c:	b3018793          	addi	a5,gp,-1232 # 21658 <next.17>
    a5a0:	00a787b3          	add	a5,a5,a0
    a5a4:	0007a703          	lw	a4,0(a5)
    a5a8:	00271713          	slli	a4,a4,0x2
    a5ac:	000207b7          	lui	a5,0x20
    a5b0:	6bc78793          	addi	a5,a5,1724 # 206bc <jump_table.20>
    a5b4:	00e787b3          	add	a5,a5,a4
    a5b8:	0007a783          	lw	a5,0(a5)
    a5bc:	eb1ff06f          	j	a46c <inferenceTPG+0x38>
    a5c0:	00892787          	flw	fa5,8(s2)
    a5c4:	00842707          	flw	fa4,8(s0)
    a5c8:	00f776d3          	fadd.s	fa3,fa4,fa5
    a5cc:	0ad12627          	fsw	fa3,172(sp)
    a5d0:	00042607          	flw	fa2,0(s0)
    a5d4:	00492687          	flw	fa3,4(s2)
    a5d8:	00c6f5d3          	fadd.s	fa1,fa3,fa2
    a5dc:	0ab12827          	fsw	fa1,176(sp)
    a5e0:	10f77753          	fmul.s	fa4,fa4,fa5
    a5e4:	0ae12a27          	fsw	fa4,180(sp)
    a5e8:	00c7f7d3          	fadd.s	fa5,fa5,fa2
    a5ec:	0af12c27          	fsw	fa5,184(sp)
    a5f0:	0004a787          	flw	fa5,0(s1)
    a5f4:	f0000753          	fmv.w.x	fa4,zero
    a5f8:	a0e6a7d3          	feq.s	a5,fa3,fa4
    a5fc:	02078263          	beqz	a5,a620 <inferenceTPG+0x1ec>
    a600:	a0f717d3          	flt.s	a5,fa4,fa5
    a604:	04079a63          	bnez	a5,a658 <inferenceTPG+0x224>
    a608:	a0e797d3          	flt.s	a5,fa5,fa4
    a60c:	00079663          	bnez	a5,a618 <inferenceTPG+0x1e4>
    a610:	af81a787          	flw	fa5,-1288(gp) # 21620 <__SDATA_BEGIN__+0x58>
    a614:	0100006f          	j	a624 <inferenceTPG+0x1f0>
    a618:	af01a787          	flw	fa5,-1296(gp) # 21618 <__SDATA_BEGIN__+0x50>
    a61c:	0080006f          	j	a624 <inferenceTPG+0x1f0>
    a620:	18d7f7d3          	fdiv.s	fa5,fa5,fa3
    a624:	0af12e27          	fsw	fa5,188(sp)
    a628:	00500593          	li	a1,5
    a62c:	0ac10513          	addi	a0,sp,172
    a630:	d99ff0ef          	jal	a3c8 <bestProgram>
    a634:	000207b7          	lui	a5,0x20
    a638:	6bc78793          	addi	a5,a5,1724 # 206bc <jump_table.20>
    a63c:	00251713          	slli	a4,a0,0x2
    a640:	00e78733          	add	a4,a5,a4
    a644:	08872703          	lw	a4,136(a4)
    a648:	00271713          	slli	a4,a4,0x2
    a64c:	00e787b3          	add	a5,a5,a4
    a650:	0007a783          	lw	a5,0(a5)
    a654:	e19ff06f          	j	a46c <inferenceTPG+0x38>
    a658:	af41a787          	flw	fa5,-1292(gp) # 2161c <__SDATA_BEGIN__+0x54>
    a65c:	fc9ff06f          	j	a624 <inferenceTPG+0x1f0>
    a660:	00042707          	flw	fa4,0(s0)
    a664:	10e777d3          	fmul.s	fa5,fa4,fa4
    a668:	02f12e27          	fsw	fa5,60(sp)
    a66c:	0084a787          	flw	fa5,8(s1)
    a670:	00892687          	flw	fa3,8(s2)
    a674:	00d7f7d3          	fadd.s	fa5,fa5,fa3
    a678:	04f12027          	fsw	fa5,64(sp)
    a67c:	0009a787          	flw	fa5,0(s3)
    a680:	10e7f7d3          	fmul.s	fa5,fa5,fa4
    a684:	04f12227          	fsw	fa5,68(sp)
    a688:	00300593          	li	a1,3
    a68c:	03c10513          	addi	a0,sp,60
    a690:	d39ff0ef          	jal	a3c8 <bestProgram>
    a694:	000207b7          	lui	a5,0x20
    a698:	6bc78793          	addi	a5,a5,1724 # 206bc <jump_table.20>
    a69c:	00251713          	slli	a4,a0,0x2
    a6a0:	00e78733          	add	a4,a5,a4
    a6a4:	09c72703          	lw	a4,156(a4)
    a6a8:	00271713          	slli	a4,a4,0x2
    a6ac:	00e787b3          	add	a5,a5,a4
    a6b0:	0007a783          	lw	a5,0(a5)
    a6b4:	db9ff06f          	j	a46c <inferenceTPG+0x38>
    a6b8:	00042707          	flw	fa4,0(s0)
    a6bc:	10e777d3          	fmul.s	fa5,fa4,fa4
    a6c0:	04f12427          	fsw	fa5,72(sp)
    a6c4:	0009a787          	flw	fa5,0(s3)
    a6c8:	10e7f7d3          	fmul.s	fa5,fa5,fa4
    a6cc:	04f12627          	fsw	fa5,76(sp)
    a6d0:	00842787          	flw	fa5,8(s0)
    a6d4:	0144a707          	flw	fa4,20(s1)
    a6d8:	00e7f7d3          	fadd.s	fa5,fa5,fa4
    a6dc:	04f12827          	fsw	fa5,80(sp)
    a6e0:	00300593          	li	a1,3
    a6e4:	04810513          	addi	a0,sp,72
    a6e8:	ce1ff0ef          	jal	a3c8 <bestProgram>
    a6ec:	000207b7          	lui	a5,0x20
    a6f0:	6bc78793          	addi	a5,a5,1724 # 206bc <jump_table.20>
    a6f4:	00251713          	slli	a4,a0,0x2
    a6f8:	00e78733          	add	a4,a5,a4
    a6fc:	0a872703          	lw	a4,168(a4)
    a700:	00271713          	slli	a4,a4,0x2
    a704:	00e787b3          	add	a5,a5,a4
    a708:	0007a783          	lw	a5,0(a5)
    a70c:	d61ff06f          	j	a46c <inferenceTPG+0x38>
    a710:	00892707          	flw	fa4,8(s2)
    a714:	0089a787          	flw	fa5,8(s3)
    a718:	10e7f7d3          	fmul.s	fa5,fa5,fa4
    a71c:	06f12627          	fsw	fa5,108(sp)
    a720:	0044a687          	flw	fa3,4(s1)
    a724:	00492787          	flw	fa5,4(s2)
    a728:	f0000653          	fmv.w.x	fa2,zero
    a72c:	a0c7a7d3          	feq.s	a5,fa5,fa2
    a730:	02078263          	beqz	a5,a754 <inferenceTPG+0x320>
    a734:	a0d617d3          	flt.s	a5,fa2,fa3
    a738:	06079263          	bnez	a5,a79c <inferenceTPG+0x368>
    a73c:	a0c697d3          	flt.s	a5,fa3,fa2
    a740:	00079663          	bnez	a5,a74c <inferenceTPG+0x318>
    a744:	af81a687          	flw	fa3,-1288(gp) # 21620 <__SDATA_BEGIN__+0x58>
    a748:	0100006f          	j	a758 <inferenceTPG+0x324>
    a74c:	af01a687          	flw	fa3,-1296(gp) # 21618 <__SDATA_BEGIN__+0x50>
    a750:	0080006f          	j	a758 <inferenceTPG+0x324>
    a754:	18f6f6d3          	fdiv.s	fa3,fa3,fa5
    a758:	06d12827          	fsw	fa3,112(sp)
    a75c:	10e776d3          	fmul.s	fa3,fa4,fa4
    a760:	06d12a27          	fsw	fa3,116(sp)
    a764:	08e7f7d3          	fsub.s	fa5,fa5,fa4
    a768:	06f12c27          	fsw	fa5,120(sp)
    a76c:	00400593          	li	a1,4
    a770:	06c10513          	addi	a0,sp,108
    a774:	c55ff0ef          	jal	a3c8 <bestProgram>
    a778:	000207b7          	lui	a5,0x20
    a77c:	6bc78793          	addi	a5,a5,1724 # 206bc <jump_table.20>
    a780:	00251713          	slli	a4,a0,0x2
    a784:	00e78733          	add	a4,a5,a4
    a788:	0b472703          	lw	a4,180(a4)
    a78c:	00271713          	slli	a4,a4,0x2
    a790:	00e787b3          	add	a5,a5,a4
    a794:	0007a783          	lw	a5,0(a5)
    a798:	cd5ff06f          	j	a46c <inferenceTPG+0x38>
    a79c:	af41a687          	flw	fa3,-1292(gp) # 2161c <__SDATA_BEGIN__+0x54>
    a7a0:	fb9ff06f          	j	a758 <inferenceTPG+0x324>
    a7a4:	00042787          	flw	fa5,0(s0)
    a7a8:	10f7f753          	fmul.s	fa4,fa5,fa5
    a7ac:	06e12e27          	fsw	fa4,124(sp)
    a7b0:	0009a707          	flw	fa4,0(s3)
    a7b4:	10f77753          	fmul.s	fa4,fa4,fa5
    a7b8:	08e12027          	fsw	fa4,128(sp)
    a7bc:	0044a707          	flw	fa4,4(s1)
    a7c0:	00f777d3          	fadd.s	fa5,fa4,fa5
    a7c4:	08f12227          	fsw	fa5,132(sp)
    a7c8:	0089a787          	flw	fa5,8(s3)
    a7cc:	00842707          	flw	fa4,8(s0)
    a7d0:	10e7f7d3          	fmul.s	fa5,fa5,fa4
    a7d4:	08f12427          	fsw	fa5,136(sp)
    a7d8:	00400593          	li	a1,4
    a7dc:	07c10513          	addi	a0,sp,124
    a7e0:	be9ff0ef          	jal	a3c8 <bestProgram>
    a7e4:	000207b7          	lui	a5,0x20
    a7e8:	6bc78793          	addi	a5,a5,1724 # 206bc <jump_table.20>
    a7ec:	00251713          	slli	a4,a0,0x2
    a7f0:	00e78733          	add	a4,a5,a4
    a7f4:	0c472703          	lw	a4,196(a4)
    a7f8:	00271713          	slli	a4,a4,0x2
    a7fc:	00e787b3          	add	a5,a5,a4
    a800:	0007a783          	lw	a5,0(a5)
    a804:	c69ff06f          	j	a46c <inferenceTPG+0x38>
    a808:	00042707          	flw	fa4,0(s0)
    a80c:	10e777d3          	fmul.s	fa5,fa4,fa4
    a810:	0cf12027          	fsw	fa5,192(sp)
    a814:	0009a787          	flw	fa5,0(s3)
    a818:	10e7f7d3          	fmul.s	fa5,fa5,fa4
    a81c:	0cf12227          	fsw	fa5,196(sp)
    a820:	00892707          	flw	fa4,8(s2)
    a824:	0084a787          	flw	fa5,8(s1)
    a828:	00e7f7d3          	fadd.s	fa5,fa5,fa4
    a82c:	0cf12427          	fsw	fa5,200(sp)
    a830:	00842787          	flw	fa5,8(s0)
    a834:	0049a687          	flw	fa3,4(s3)
    a838:	10d7f7d3          	fmul.s	fa5,fa5,fa3
    a83c:	0cf12627          	fsw	fa5,204(sp)
    a840:	0089a787          	flw	fa5,8(s3)
    a844:	10e7f7d3          	fmul.s	fa5,fa5,fa4
    a848:	0cf12827          	fsw	fa5,208(sp)
    a84c:	00500593          	li	a1,5
    a850:	0c010513          	addi	a0,sp,192
    a854:	b75ff0ef          	jal	a3c8 <bestProgram>
    a858:	000207b7          	lui	a5,0x20
    a85c:	6bc78793          	addi	a5,a5,1724 # 206bc <jump_table.20>
    a860:	00251713          	slli	a4,a0,0x2
    a864:	00e78733          	add	a4,a5,a4
    a868:	0d472703          	lw	a4,212(a4)
    a86c:	00271713          	slli	a4,a4,0x2
    a870:	00e787b3          	add	a5,a5,a4
    a874:	0007a783          	lw	a5,0(a5)
    a878:	bf5ff06f          	j	a46c <inferenceTPG+0x38>
    a87c:	00042707          	flw	fa4,0(s0)
    a880:	10e777d3          	fmul.s	fa5,fa4,fa4
    a884:	08f12627          	fsw	fa5,140(sp)
    a888:	00892787          	flw	fa5,8(s2)
    a88c:	0084a687          	flw	fa3,8(s1)
    a890:	10d7f7d3          	fmul.s	fa5,fa5,fa3
    a894:	08f12827          	fsw	fa5,144(sp)
    a898:	0009a787          	flw	fa5,0(s3)
    a89c:	10e7f7d3          	fmul.s	fa5,fa5,fa4
    a8a0:	08f12a27          	fsw	fa5,148(sp)
    a8a4:	00842787          	flw	fa5,8(s0)
    a8a8:	0089a707          	flw	fa4,8(s3)
    a8ac:	10e7f7d3          	fmul.s	fa5,fa5,fa4
    a8b0:	08f12c27          	fsw	fa5,152(sp)
    a8b4:	00400593          	li	a1,4
    a8b8:	08c10513          	addi	a0,sp,140
    a8bc:	b0dff0ef          	jal	a3c8 <bestProgram>
    a8c0:	000207b7          	lui	a5,0x20
    a8c4:	6bc78793          	addi	a5,a5,1724 # 206bc <jump_table.20>
    a8c8:	00251713          	slli	a4,a0,0x2
    a8cc:	00e78733          	add	a4,a5,a4
    a8d0:	0e872703          	lw	a4,232(a4)
    a8d4:	00271713          	slli	a4,a4,0x2
    a8d8:	00e787b3          	add	a5,a5,a4
    a8dc:	0007a783          	lw	a5,0(a5)
    a8e0:	b8dff06f          	j	a46c <inferenceTPG+0x38>
    a8e4:	00042787          	flw	fa5,0(s0)
    a8e8:	10f7f753          	fmul.s	fa4,fa5,fa5
    a8ec:	0ee12e27          	fsw	fa4,252(sp)
    a8f0:	0009a687          	flw	fa3,0(s3)
    a8f4:	10f6f7d3          	fmul.s	fa5,fa3,fa5
    a8f8:	10f12027          	fsw	fa5,256(sp)
    a8fc:	0089a787          	flw	fa5,8(s3)
    a900:	00842707          	flw	fa4,8(s0)
    a904:	10e7f7d3          	fmul.s	fa5,fa5,fa4
    a908:	10f12227          	fsw	fa5,260(sp)
    a90c:	00892707          	flw	fa4,8(s2)
    a910:	0004a787          	flw	fa5,0(s1)
    a914:	10e7f7d3          	fmul.s	fa5,fa5,fa4
    a918:	10f12427          	fsw	fa5,264(sp)
    a91c:	00092787          	flw	fa5,0(s2)
    a920:	10d7f7d3          	fmul.s	fa5,fa5,fa3
    a924:	10f12627          	fsw	fa5,268(sp)
    a928:	0084a787          	flw	fa5,8(s1)
    a92c:	10e7f7d3          	fmul.s	fa5,fa5,fa4
    a930:	10f12827          	fsw	fa5,272(sp)
    a934:	00600593          	li	a1,6
    a938:	0fc10513          	addi	a0,sp,252
    a93c:	a8dff0ef          	jal	a3c8 <bestProgram>
    a940:	000207b7          	lui	a5,0x20
    a944:	6bc78793          	addi	a5,a5,1724 # 206bc <jump_table.20>
    a948:	00251713          	slli	a4,a0,0x2
    a94c:	00e78733          	add	a4,a5,a4
    a950:	0f872703          	lw	a4,248(a4)
    a954:	00271713          	slli	a4,a4,0x2
    a958:	00e787b3          	add	a5,a5,a4
    a95c:	0007a783          	lw	a5,0(a5)
    a960:	b0dff06f          	j	a46c <inferenceTPG+0x38>
    a964:	00842707          	flw	fa4,8(s0)
    a968:	10e777d3          	fmul.s	fa5,fa4,fa4
    a96c:	04f12a27          	fsw	fa5,84(sp)
    a970:	0089a787          	flw	fa5,8(s3)
    a974:	10e7f7d3          	fmul.s	fa5,fa5,fa4
    a978:	04f12c27          	fsw	fa5,88(sp)
    a97c:	00042787          	flw	fa5,0(s0)
    a980:	10f7f7d3          	fmul.s	fa5,fa5,fa5
    a984:	04f12e27          	fsw	fa5,92(sp)
    a988:	00300593          	li	a1,3
    a98c:	05410513          	addi	a0,sp,84
    a990:	a39ff0ef          	jal	a3c8 <bestProgram>
    a994:	000207b7          	lui	a5,0x20
    a998:	6bc78793          	addi	a5,a5,1724 # 206bc <jump_table.20>
    a99c:	00251713          	slli	a4,a0,0x2
    a9a0:	00e78733          	add	a4,a5,a4
    a9a4:	11072703          	lw	a4,272(a4)
    a9a8:	00271713          	slli	a4,a4,0x2
    a9ac:	00e787b3          	add	a5,a5,a4
    a9b0:	0007a783          	lw	a5,0(a5)
    a9b4:	ab9ff06f          	j	a46c <inferenceTPG+0x38>
    a9b8:	0144a787          	flw	fa5,20(s1)
    a9bc:	00842707          	flw	fa4,8(s0)
    a9c0:	10e7f7d3          	fmul.s	fa5,fa5,fa4
    a9c4:	00f12627          	fsw	fa5,12(sp)
    a9c8:	00892787          	flw	fa5,8(s2)
    a9cc:	0004a707          	flw	fa4,0(s1)
    a9d0:	10e7f7d3          	fmul.s	fa5,fa5,fa4
    a9d4:	00f12827          	fsw	fa5,16(sp)
    a9d8:	00200593          	li	a1,2
    a9dc:	00c10513          	addi	a0,sp,12
    a9e0:	9e9ff0ef          	jal	a3c8 <bestProgram>
    a9e4:	00251513          	slli	a0,a0,0x2
    a9e8:	b2818793          	addi	a5,gp,-1240 # 21650 <next.7>
    a9ec:	00a787b3          	add	a5,a5,a0
    a9f0:	0007a703          	lw	a4,0(a5)
    a9f4:	00271713          	slli	a4,a4,0x2
    a9f8:	000207b7          	lui	a5,0x20
    a9fc:	6bc78793          	addi	a5,a5,1724 # 206bc <jump_table.20>
    aa00:	00e787b3          	add	a5,a5,a4
    aa04:	0007a783          	lw	a5,0(a5)
    aa08:	a65ff06f          	j	a46c <inferenceTPG+0x38>
    aa0c:	00042787          	flw	fa5,0(s0)
    aa10:	0004a707          	flw	fa4,0(s1)
    aa14:	10f77753          	fmul.s	fa4,fa4,fa5
    aa18:	0ce12a27          	fsw	fa4,212(sp)
    aa1c:	00492707          	flw	fa4,4(s2)
    aa20:	00892687          	flw	fa3,8(s2)
    aa24:	10d77753          	fmul.s	fa4,fa4,fa3
    aa28:	0ce12c27          	fsw	fa4,216(sp)
    aa2c:	10f7f753          	fmul.s	fa4,fa5,fa5
    aa30:	0ce12e27          	fsw	fa4,220(sp)
    aa34:	0009a707          	flw	fa4,0(s3)
    aa38:	10f777d3          	fmul.s	fa5,fa4,fa5
    aa3c:	0ef12027          	fsw	fa5,224(sp)
    aa40:	0044a787          	flw	fa5,4(s1)
    aa44:	0084a707          	flw	fa4,8(s1)
    aa48:	00e7f7d3          	fadd.s	fa5,fa5,fa4
    aa4c:	0ef12227          	fsw	fa5,228(sp)
    aa50:	00500593          	li	a1,5
    aa54:	0d410513          	addi	a0,sp,212
    aa58:	971ff0ef          	jal	a3c8 <bestProgram>
    aa5c:	000207b7          	lui	a5,0x20
    aa60:	6bc78793          	addi	a5,a5,1724 # 206bc <jump_table.20>
    aa64:	00251713          	slli	a4,a0,0x2
    aa68:	00e78733          	add	a4,a5,a4
    aa6c:	11c72703          	lw	a4,284(a4)
    aa70:	00271713          	slli	a4,a4,0x2
