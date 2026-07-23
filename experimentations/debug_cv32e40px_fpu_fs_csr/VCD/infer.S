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
    a468:	cf478793          	addi	a5,a5,-780 # acf4 <inferenceTPG+0x8c0>
    a46c:	00078067          	jr	a5
    a470:	00000593          	li	a1,0
    a474:	00020537          	lui	a0,0x20
    a478:	18450513          	addi	a0,a0,388 # 20184 <__power_manager_start+0x14184>
    a47c:	f30fc0ef          	jal	6bac <iprintf>
    a480:	02012223          	sw	zero,36(sp)
    a484:	0009a707          	flw	fa4,0(s3)
    a488:	f00007d3          	fmv.w.x	fa5,zero
    a48c:	08e7f7d3          	fsub.s	fa5,fa5,fa4
    a490:	02f12427          	fsw	fa5,40(sp)
    a494:	02012623          	sw	zero,44(sp)
    a498:	00300593          	li	a1,3
    a49c:	02410513          	addi	a0,sp,36
    a4a0:	f29ff0ef          	jal	a3c8 <bestProgram>
    a4a4:	000207b7          	lui	a5,0x20
    a4a8:	6cc78793          	addi	a5,a5,1740 # 206cc <jump_table.20>
    a4ac:	00251713          	slli	a4,a0,0x2
    a4b0:	00e78733          	add	a4,a5,a4
    a4b4:	07072703          	lw	a4,112(a4)
    a4b8:	00271713          	slli	a4,a4,0x2
    a4bc:	00e787b3          	add	a5,a5,a4
    a4c0:	0007a783          	lw	a5,0(a5)
    a4c4:	fa9ff06f          	j	a46c <inferenceTPG+0x38>
    a4c8:	00100593          	li	a1,1
    a4cc:	00020537          	lui	a0,0x20
    a4d0:	18450513          	addi	a0,a0,388 # 20184 <__power_manager_start+0x14184>
    a4d4:	ed8fc0ef          	jal	6bac <iprintf>
    a4d8:	00892707          	flw	fa4,8(s2)
    a4dc:	00842787          	flw	fa5,8(s0) # 800008 <_sp+0x7d6788>
    a4e0:	00e7f7d3          	fadd.s	fa5,fa5,fa4
    a4e4:	02f12827          	fsw	fa5,48(sp)
    a4e8:	0089a787          	flw	fa5,8(s3)
    a4ec:	10e7f7d3          	fmul.s	fa5,fa5,fa4
    a4f0:	02f12a27          	fsw	fa5,52(sp)
    a4f4:	00492707          	flw	fa4,4(s2)
    a4f8:	f00006d3          	fmv.w.x	fa3,zero
    a4fc:	20d687d3          	fmv.s	fa5,fa3
    a500:	a0d727d3          	feq.s	a5,fa4,fa3
    a504:	00079663          	bnez	a5,a510 <inferenceTPG+0xdc>
    a508:	0004a787          	flw	fa5,0(s1) # 400000 <_sp+0x3d6780>
    a50c:	18e7f7d3          	fdiv.s	fa5,fa5,fa4
    a510:	02f12c27          	fsw	fa5,56(sp)
    a514:	00300593          	li	a1,3
    a518:	03010513          	addi	a0,sp,48
    a51c:	eadff0ef          	jal	a3c8 <bestProgram>
    a520:	000207b7          	lui	a5,0x20
    a524:	6cc78793          	addi	a5,a5,1740 # 206cc <jump_table.20>
    a528:	00251713          	slli	a4,a0,0x2
    a52c:	00e78733          	add	a4,a5,a4
    a530:	07c72703          	lw	a4,124(a4)
    a534:	00271713          	slli	a4,a4,0x2
    a538:	00e787b3          	add	a5,a5,a4
    a53c:	0007a783          	lw	a5,0(a5)
    a540:	f2dff06f          	j	a46c <inferenceTPG+0x38>
    a544:	00200593          	li	a1,2
    a548:	00020537          	lui	a0,0x20
    a54c:	18450513          	addi	a0,a0,388 # 20184 <__power_manager_start+0x14184>
    a550:	e5cfc0ef          	jal	6bac <iprintf>
    a554:	00892707          	flw	fa4,8(s2)
    a558:	00842787          	flw	fa5,8(s0)
    a55c:	00e7f7d3          	fadd.s	fa5,fa5,fa4
    a560:	00f12227          	fsw	fa5,4(sp)
    a564:	0084a787          	flw	fa5,8(s1)
    a568:	10e7f7d3          	fmul.s	fa5,fa5,fa4
    a56c:	00f12427          	fsw	fa5,8(sp)
    a570:	00200593          	li	a1,2
    a574:	00410513          	addi	a0,sp,4
    a578:	e51ff0ef          	jal	a3c8 <bestProgram>
    a57c:	00251513          	slli	a0,a0,0x2
    a580:	b2818793          	addi	a5,gp,-1240 # 21660 <next.17>
    a584:	00a787b3          	add	a5,a5,a0
    a588:	0007a703          	lw	a4,0(a5)
    a58c:	00271713          	slli	a4,a4,0x2
    a590:	000207b7          	lui	a5,0x20
    a594:	6cc78793          	addi	a5,a5,1740 # 206cc <jump_table.20>
    a598:	00e787b3          	add	a5,a5,a4
    a59c:	0007a783          	lw	a5,0(a5)
    a5a0:	ecdff06f          	j	a46c <inferenceTPG+0x38>
    a5a4:	00300593          	li	a1,3
    a5a8:	00020537          	lui	a0,0x20
    a5ac:	18450513          	addi	a0,a0,388 # 20184 <__power_manager_start+0x14184>
    a5b0:	dfcfc0ef          	jal	6bac <iprintf>
    a5b4:	00892687          	flw	fa3,8(s2)
    a5b8:	00842707          	flw	fa4,8(s0)
    a5bc:	00d777d3          	fadd.s	fa5,fa4,fa3
    a5c0:	0af12627          	fsw	fa5,172(sp)
    a5c4:	00042787          	flw	fa5,0(s0)
    a5c8:	00492607          	flw	fa2,4(s2)
    a5cc:	00c7f5d3          	fadd.s	fa1,fa5,fa2
    a5d0:	0ab12827          	fsw	fa1,176(sp)
    a5d4:	10d77753          	fmul.s	fa4,fa4,fa3
    a5d8:	0ae12a27          	fsw	fa4,180(sp)
    a5dc:	00d7f7d3          	fadd.s	fa5,fa5,fa3
    a5e0:	0af12c27          	fsw	fa5,184(sp)
    a5e4:	f0000753          	fmv.w.x	fa4,zero
    a5e8:	20e707d3          	fmv.s	fa5,fa4
    a5ec:	a0e627d3          	feq.s	a5,fa2,fa4
    a5f0:	00079663          	bnez	a5,a5fc <inferenceTPG+0x1c8>
    a5f4:	0004a787          	flw	fa5,0(s1)
    a5f8:	18c7f7d3          	fdiv.s	fa5,fa5,fa2
    a5fc:	0af12e27          	fsw	fa5,188(sp)
    a600:	00500593          	li	a1,5
    a604:	0ac10513          	addi	a0,sp,172
    a608:	dc1ff0ef          	jal	a3c8 <bestProgram>
    a60c:	000207b7          	lui	a5,0x20
    a610:	6cc78793          	addi	a5,a5,1740 # 206cc <jump_table.20>
    a614:	00251713          	slli	a4,a0,0x2
    a618:	00e78733          	add	a4,a5,a4
    a61c:	08872703          	lw	a4,136(a4)
    a620:	00271713          	slli	a4,a4,0x2
    a624:	00e787b3          	add	a5,a5,a4
    a628:	0007a783          	lw	a5,0(a5)
    a62c:	e41ff06f          	j	a46c <inferenceTPG+0x38>
    a630:	00400593          	li	a1,4
    a634:	00020537          	lui	a0,0x20
    a638:	18450513          	addi	a0,a0,388 # 20184 <__power_manager_start+0x14184>
    a63c:	d70fc0ef          	jal	6bac <iprintf>
    a640:	00042707          	flw	fa4,0(s0)
    a644:	10e777d3          	fmul.s	fa5,fa4,fa4
    a648:	02f12e27          	fsw	fa5,60(sp)
    a64c:	00892787          	flw	fa5,8(s2)
    a650:	0084a687          	flw	fa3,8(s1)
    a654:	00d7f7d3          	fadd.s	fa5,fa5,fa3
    a658:	04f12027          	fsw	fa5,64(sp)
    a65c:	0009a787          	flw	fa5,0(s3)
    a660:	10e7f7d3          	fmul.s	fa5,fa5,fa4
    a664:	04f12227          	fsw	fa5,68(sp)
    a668:	00300593          	li	a1,3
    a66c:	03c10513          	addi	a0,sp,60
    a670:	d59ff0ef          	jal	a3c8 <bestProgram>
    a674:	000207b7          	lui	a5,0x20
    a678:	6cc78793          	addi	a5,a5,1740 # 206cc <jump_table.20>
    a67c:	00251713          	slli	a4,a0,0x2
    a680:	00e78733          	add	a4,a5,a4
    a684:	09c72703          	lw	a4,156(a4)
    a688:	00271713          	slli	a4,a4,0x2
    a68c:	00e787b3          	add	a5,a5,a4
    a690:	0007a783          	lw	a5,0(a5)
    a694:	dd9ff06f          	j	a46c <inferenceTPG+0x38>
    a698:	00500593          	li	a1,5
    a69c:	00020537          	lui	a0,0x20
    a6a0:	18450513          	addi	a0,a0,388 # 20184 <__power_manager_start+0x14184>
    a6a4:	d08fc0ef          	jal	6bac <iprintf>
    a6a8:	00042707          	flw	fa4,0(s0)
    a6ac:	10e777d3          	fmul.s	fa5,fa4,fa4
    a6b0:	04f12427          	fsw	fa5,72(sp)
    a6b4:	0009a787          	flw	fa5,0(s3)
    a6b8:	10e7f7d3          	fmul.s	fa5,fa5,fa4
    a6bc:	04f12627          	fsw	fa5,76(sp)
    a6c0:	00842787          	flw	fa5,8(s0)
    a6c4:	0144a707          	flw	fa4,20(s1)
    a6c8:	00e7f7d3          	fadd.s	fa5,fa5,fa4
    a6cc:	04f12827          	fsw	fa5,80(sp)
    a6d0:	00300593          	li	a1,3
    a6d4:	04810513          	addi	a0,sp,72
    a6d8:	cf1ff0ef          	jal	a3c8 <bestProgram>
    a6dc:	000207b7          	lui	a5,0x20
    a6e0:	6cc78793          	addi	a5,a5,1740 # 206cc <jump_table.20>
    a6e4:	00251713          	slli	a4,a0,0x2
    a6e8:	00e78733          	add	a4,a5,a4
    a6ec:	0a872703          	lw	a4,168(a4)
    a6f0:	00271713          	slli	a4,a4,0x2
    a6f4:	00e787b3          	add	a5,a5,a4
    a6f8:	0007a783          	lw	a5,0(a5)
    a6fc:	d71ff06f          	j	a46c <inferenceTPG+0x38>
    a700:	00600593          	li	a1,6
    a704:	00020537          	lui	a0,0x20
    a708:	18450513          	addi	a0,a0,388 # 20184 <__power_manager_start+0x14184>
    a70c:	ca0fc0ef          	jal	6bac <iprintf>
    a710:	00892707          	flw	fa4,8(s2)
    a714:	0089a787          	flw	fa5,8(s3)
    a718:	10e7f7d3          	fmul.s	fa5,fa5,fa4
    a71c:	06f12627          	fsw	fa5,108(sp)
    a720:	00492787          	flw	fa5,4(s2)
    a724:	f0000653          	fmv.w.x	fa2,zero
    a728:	20c606d3          	fmv.s	fa3,fa2
    a72c:	a0c7a7d3          	feq.s	a5,fa5,fa2
    a730:	00079663          	bnez	a5,a73c <inferenceTPG+0x308>
    a734:	0044a687          	flw	fa3,4(s1)
    a738:	18f6f6d3          	fdiv.s	fa3,fa3,fa5
    a73c:	06d12827          	fsw	fa3,112(sp)
    a740:	10e776d3          	fmul.s	fa3,fa4,fa4
    a744:	06d12a27          	fsw	fa3,116(sp)
    a748:	08e7f7d3          	fsub.s	fa5,fa5,fa4
    a74c:	06f12c27          	fsw	fa5,120(sp)
    a750:	00400593          	li	a1,4
    a754:	06c10513          	addi	a0,sp,108
    a758:	c71ff0ef          	jal	a3c8 <bestProgram>
    a75c:	000207b7          	lui	a5,0x20
    a760:	6cc78793          	addi	a5,a5,1740 # 206cc <jump_table.20>
    a764:	00251713          	slli	a4,a0,0x2
    a768:	00e78733          	add	a4,a5,a4
    a76c:	0b472703          	lw	a4,180(a4)
    a770:	00271713          	slli	a4,a4,0x2
    a774:	00e787b3          	add	a5,a5,a4
    a778:	0007a783          	lw	a5,0(a5)
    a77c:	cf1ff06f          	j	a46c <inferenceTPG+0x38>
    a780:	00700593          	li	a1,7
    a784:	00020537          	lui	a0,0x20
    a788:	18450513          	addi	a0,a0,388 # 20184 <__power_manager_start+0x14184>
    a78c:	c20fc0ef          	jal	6bac <iprintf>
    a790:	00042787          	flw	fa5,0(s0)
    a794:	10f7f753          	fmul.s	fa4,fa5,fa5
    a798:	06e12e27          	fsw	fa4,124(sp)
    a79c:	0009a707          	flw	fa4,0(s3)
    a7a0:	10f77753          	fmul.s	fa4,fa4,fa5
    a7a4:	08e12027          	fsw	fa4,128(sp)
    a7a8:	0044a707          	flw	fa4,4(s1)
    a7ac:	00f777d3          	fadd.s	fa5,fa4,fa5
    a7b0:	08f12227          	fsw	fa5,132(sp)
    a7b4:	00842787          	flw	fa5,8(s0)
    a7b8:	0089a707          	flw	fa4,8(s3)
    a7bc:	10e7f7d3          	fmul.s	fa5,fa5,fa4
    a7c0:	08f12427          	fsw	fa5,136(sp)
    a7c4:	00400593          	li	a1,4
    a7c8:	07c10513          	addi	a0,sp,124
    a7cc:	bfdff0ef          	jal	a3c8 <bestProgram>
    a7d0:	000207b7          	lui	a5,0x20
    a7d4:	6cc78793          	addi	a5,a5,1740 # 206cc <jump_table.20>
    a7d8:	00251713          	slli	a4,a0,0x2
    a7dc:	00e78733          	add	a4,a5,a4
    a7e0:	0c472703          	lw	a4,196(a4)
    a7e4:	00271713          	slli	a4,a4,0x2
    a7e8:	00e787b3          	add	a5,a5,a4
    a7ec:	0007a783          	lw	a5,0(a5)
    a7f0:	c7dff06f          	j	a46c <inferenceTPG+0x38>
    a7f4:	00800593          	li	a1,8
    a7f8:	00020537          	lui	a0,0x20
    a7fc:	18450513          	addi	a0,a0,388 # 20184 <__power_manager_start+0x14184>
    a800:	bacfc0ef          	jal	6bac <iprintf>
    a804:	00042707          	flw	fa4,0(s0)
    a808:	10e777d3          	fmul.s	fa5,fa4,fa4
    a80c:	0cf12027          	fsw	fa5,192(sp)
    a810:	0009a787          	flw	fa5,0(s3)
    a814:	10e7f7d3          	fmul.s	fa5,fa5,fa4
    a818:	0cf12227          	fsw	fa5,196(sp)
    a81c:	00892707          	flw	fa4,8(s2)
    a820:	0084a787          	flw	fa5,8(s1)
    a824:	00e7f7d3          	fadd.s	fa5,fa5,fa4
    a828:	0cf12427          	fsw	fa5,200(sp)
    a82c:	00842787          	flw	fa5,8(s0)
    a830:	0049a687          	flw	fa3,4(s3)
    a834:	10d7f7d3          	fmul.s	fa5,fa5,fa3
    a838:	0cf12627          	fsw	fa5,204(sp)
    a83c:	0089a787          	flw	fa5,8(s3)
    a840:	10e7f7d3          	fmul.s	fa5,fa5,fa4
    a844:	0cf12827          	fsw	fa5,208(sp)
    a848:	00500593          	li	a1,5
    a84c:	0c010513          	addi	a0,sp,192
    a850:	b79ff0ef          	jal	a3c8 <bestProgram>
    a854:	000207b7          	lui	a5,0x20
    a858:	6cc78793          	addi	a5,a5,1740 # 206cc <jump_table.20>
    a85c:	00251713          	slli	a4,a0,0x2
    a860:	00e78733          	add	a4,a5,a4
    a864:	0d472703          	lw	a4,212(a4)
    a868:	00271713          	slli	a4,a4,0x2
    a86c:	00e787b3          	add	a5,a5,a4
    a870:	0007a783          	lw	a5,0(a5)
    a874:	bf9ff06f          	j	a46c <inferenceTPG+0x38>
    a878:	00900593          	li	a1,9
    a87c:	00020537          	lui	a0,0x20
    a880:	18450513          	addi	a0,a0,388 # 20184 <__power_manager_start+0x14184>
    a884:	b28fc0ef          	jal	6bac <iprintf>
    a888:	00042707          	flw	fa4,0(s0)
    a88c:	10e777d3          	fmul.s	fa5,fa4,fa4
    a890:	08f12627          	fsw	fa5,140(sp)
    a894:	0084a787          	flw	fa5,8(s1)
    a898:	00892687          	flw	fa3,8(s2)
    a89c:	10d7f7d3          	fmul.s	fa5,fa5,fa3
    a8a0:	08f12827          	fsw	fa5,144(sp)
    a8a4:	0009a787          	flw	fa5,0(s3)
    a8a8:	10e7f7d3          	fmul.s	fa5,fa5,fa4
    a8ac:	08f12a27          	fsw	fa5,148(sp)
    a8b0:	00842787          	flw	fa5,8(s0)
    a8b4:	0089a707          	flw	fa4,8(s3)
    a8b8:	10e7f7d3          	fmul.s	fa5,fa5,fa4
    a8bc:	08f12c27          	fsw	fa5,152(sp)
    a8c0:	00400593          	li	a1,4
    a8c4:	08c10513          	addi	a0,sp,140
    a8c8:	b01ff0ef          	jal	a3c8 <bestProgram>
    a8cc:	000207b7          	lui	a5,0x20
    a8d0:	6cc78793          	addi	a5,a5,1740 # 206cc <jump_table.20>
    a8d4:	00251713          	slli	a4,a0,0x2
    a8d8:	00e78733          	add	a4,a5,a4
    a8dc:	0e872703          	lw	a4,232(a4)
    a8e0:	00271713          	slli	a4,a4,0x2
    a8e4:	00e787b3          	add	a5,a5,a4
    a8e8:	0007a783          	lw	a5,0(a5)
    a8ec:	b81ff06f          	j	a46c <inferenceTPG+0x38>
    a8f0:	00a00593          	li	a1,10
    a8f4:	00020537          	lui	a0,0x20
    a8f8:	18450513          	addi	a0,a0,388 # 20184 <__power_manager_start+0x14184>
    a8fc:	ab0fc0ef          	jal	6bac <iprintf>
    a900:	00042787          	flw	fa5,0(s0)
    a904:	10f7f753          	fmul.s	fa4,fa5,fa5
    a908:	0ee12e27          	fsw	fa4,252(sp)
    a90c:	0009a687          	flw	fa3,0(s3)
    a910:	10f6f7d3          	fmul.s	fa5,fa3,fa5
    a914:	10f12027          	fsw	fa5,256(sp)
    a918:	0089a787          	flw	fa5,8(s3)
    a91c:	00842707          	flw	fa4,8(s0)
    a920:	10e7f7d3          	fmul.s	fa5,fa5,fa4
    a924:	10f12227          	fsw	fa5,260(sp)
    a928:	00892707          	flw	fa4,8(s2)
    a92c:	0004a787          	flw	fa5,0(s1)
    a930:	10e7f7d3          	fmul.s	fa5,fa5,fa4
    a934:	10f12427          	fsw	fa5,264(sp)
    a938:	00092787          	flw	fa5,0(s2)
    a93c:	10d7f7d3          	fmul.s	fa5,fa5,fa3
    a940:	10f12627          	fsw	fa5,268(sp)
    a944:	0084a787          	flw	fa5,8(s1)
    a948:	10e7f7d3          	fmul.s	fa5,fa5,fa4
    a94c:	10f12827          	fsw	fa5,272(sp)
    a950:	00600593          	li	a1,6
    a954:	0fc10513          	addi	a0,sp,252
    a958:	a71ff0ef          	jal	a3c8 <bestProgram>
    a95c:	000207b7          	lui	a5,0x20
    a960:	6cc78793          	addi	a5,a5,1740 # 206cc <jump_table.20>
    a964:	00251713          	slli	a4,a0,0x2
    a968:	00e78733          	add	a4,a5,a4
    a96c:	0f872703          	lw	a4,248(a4)
    a970:	00271713          	slli	a4,a4,0x2
    a974:	00e787b3          	add	a5,a5,a4
    a978:	0007a783          	lw	a5,0(a5)
    a97c:	af1ff06f          	j	a46c <inferenceTPG+0x38>
    a980:	00b00593          	li	a1,11
    a984:	00020537          	lui	a0,0x20
    a988:	18450513          	addi	a0,a0,388 # 20184 <__power_manager_start+0x14184>
    a98c:	a20fc0ef          	jal	6bac <iprintf>
    a990:	00842707          	flw	fa4,8(s0)
    a994:	10e777d3          	fmul.s	fa5,fa4,fa4
    a998:	04f12a27          	fsw	fa5,84(sp)
    a99c:	0089a787          	flw	fa5,8(s3)
    a9a0:	10e7f7d3          	fmul.s	fa5,fa5,fa4
    a9a4:	04f12c27          	fsw	fa5,88(sp)
    a9a8:	00042787          	flw	fa5,0(s0)
    a9ac:	10f7f7d3          	fmul.s	fa5,fa5,fa5
    a9b0:	04f12e27          	fsw	fa5,92(sp)
    a9b4:	00300593          	li	a1,3
    a9b8:	05410513          	addi	a0,sp,84
    a9bc:	a0dff0ef          	jal	a3c8 <bestProgram>
    a9c0:	000207b7          	lui	a5,0x20
    a9c4:	6cc78793          	addi	a5,a5,1740 # 206cc <jump_table.20>
    a9c8:	00251713          	slli	a4,a0,0x2
    a9cc:	00e78733          	add	a4,a5,a4
    a9d0:	11072703          	lw	a4,272(a4)
    a9d4:	00271713          	slli	a4,a4,0x2
    a9d8:	00e787b3          	add	a5,a5,a4
    a9dc:	0007a783          	lw	a5,0(a5)
    a9e0:	a8dff06f          	j	a46c <inferenceTPG+0x38>
    a9e4:	00c00593          	li	a1,12
    a9e8:	00020537          	lui	a0,0x20
    a9ec:	18450513          	addi	a0,a0,388 # 20184 <__power_manager_start+0x14184>
    a9f0:	9bcfc0ef          	jal	6bac <iprintf>
    a9f4:	0144a787          	flw	fa5,20(s1)
    a9f8:	00842707          	flw	fa4,8(s0)
    a9fc:	10e7f7d3          	fmul.s	fa5,fa5,fa4
    aa00:	00f12627          	fsw	fa5,12(sp)
    aa04:	00892787          	flw	fa5,8(s2)
    aa08:	0004a707          	flw	fa4,0(s1)
    aa0c:	10e7f7d3          	fmul.s	fa5,fa5,fa4
    aa10:	00f12827          	fsw	fa5,16(sp)
    aa14:	00200593          	li	a1,2
    aa18:	00c10513          	addi	a0,sp,12
    aa1c:	9adff0ef          	jal	a3c8 <bestProgram>
    aa20:	00251513          	slli	a0,a0,0x2
    aa24:	b2018793          	addi	a5,gp,-1248 # 21658 <next.7>
    aa28:	00a787b3          	add	a5,a5,a0
    aa2c:	0007a703          	lw	a4,0(a5)
    aa30:	00271713          	slli	a4,a4,0x2
    aa34:	000207b7          	lui	a5,0x20
    aa38:	6cc78793          	addi	a5,a5,1740 # 206cc <jump_table.20>
    aa3c:	00e787b3          	add	a5,a5,a4
    aa40:	0007a783          	lw	a5,0(a5)
    aa44:	a29ff06f          	j	a46c <inferenceTPG+0x38>
    aa48:	00d00593          	li	a1,13
    aa4c:	00020537          	lui	a0,0x20
    aa50:	18450513          	addi	a0,a0,388 # 20184 <__power_manager_start+0x14184>
    aa54:	958fc0ef          	jal	6bac <iprintf>
    aa58:	00042787          	flw	fa5,0(s0)
    aa5c:	0004a707          	flw	fa4,0(s1)
    aa60:	10f77753          	fmul.s	fa4,fa4,fa5
    aa64:	0ce12a27          	fsw	fa4,212(sp)
    aa68:	00492707          	flw	fa4,4(s2)
    aa6c:	00892687          	flw	fa3,8(s2)
    aa70:	10d77753          	fmul.s	fa4,fa4,fa3
    aa74:	0ce12c27          	fsw	fa4,216(sp)
    aa78:	10f7f753          	fmul.s	fa4,fa5,fa5
    aa7c:	0ce12e27          	fsw	fa4,220(sp)
    aa80:	0009a707          	flw	fa4,0(s3)
    aa84:	10f777d3          	fmul.s	fa5,fa4,fa5
    aa88:	0ef12027          	fsw	fa5,224(sp)
    aa8c:	0044a787          	flw	fa5,4(s1)
    aa90:	0084a707          	flw	fa4,8(s1)
    aa94:	00e7f7d3          	fadd.s	fa5,fa5,fa4
    aa98:	0ef12227          	fsw	fa5,228(sp)
    aa9c:	00500593          	li	a1,5
    aaa0:	0d410513          	addi	a0,sp,212
    aaa4:	925ff0ef          	jal	a3c8 <bestProgram>
    aaa8:	000207b7          	lui	a5,0x20
    aaac:	6cc78793          	addi	a5,a5,1740 # 206cc <jump_table.20>
    aab0:	00251713          	slli	a4,a0,0x2
    aab4:	00e78733          	add	a4,a5,a4
    aab8:	11c72703          	lw	a4,284(a4)
    aabc:	00271713          	slli	a4,a4,0x2
    aac0:	00e787b3          	add	a5,a5,a4
    aac4:	0007a783          	lw	a5,0(a5)
    aac8:	9a5ff06f          	j	a46c <inferenceTPG+0x38>
    aacc:	00e00593          	li	a1,14
    aad0:	00020537          	lui	a0,0x20
    aad4:	18450513          	addi	a0,a0,388 # 20184 <__power_manager_start+0x14184>
    aad8:	8d4fc0ef          	jal	6bac <iprintf>
    aadc:	0049a607          	flw	fa2,4(s3)
    aae0:	00492587          	flw	fa1,4(s2)
    aae4:	10b677d3          	fmul.s	fa5,fa2,fa1
    aae8:	0ef12427          	fsw	fa5,232(sp)
    aaec:	00892707          	flw	fa4,8(s2)
    aaf0:	0004a787          	flw	fa5,0(s1)
    aaf4:	10f776d3          	fmul.s	fa3,fa4,fa5
    aaf8:	0ed12627          	fsw	fa3,236(sp)
    aafc:	00442687          	flw	fa3,4(s0)
    ab00:	00f6f6d3          	fadd.s	fa3,fa3,fa5
    ab04:	0ed12827          	fsw	fa3,240(sp)
    ab08:	10b77753          	fmul.s	fa4,fa4,fa1
    ab0c:	0ee12a27          	fsw	fa4,244(sp)
    ab10:	08c7f7d3          	fsub.s	fa5,fa5,fa2
    ab14:	0ef12c27          	fsw	fa5,248(sp)
    ab18:	00500593          	li	a1,5
    ab1c:	0e810513          	addi	a0,sp,232
    ab20:	8a9ff0ef          	jal	a3c8 <bestProgram>
    ab24:	000207b7          	lui	a5,0x20
    ab28:	6cc78793          	addi	a5,a5,1740 # 206cc <jump_table.20>
    ab2c:	00251713          	slli	a4,a0,0x2
    ab30:	00e78733          	add	a4,a5,a4
    ab34:	13072703          	lw	a4,304(a4)
    ab38:	00271713          	slli	a4,a4,0x2
    ab3c:	00e787b3          	add	a5,a5,a4
    ab40:	0007a783          	lw	a5,0(a5)
    ab44:	929ff06f          	j	a46c <inferenceTPG+0x38>
    ab48:	00f00593          	li	a1,15
    ab4c:	00020537          	lui	a0,0x20
    ab50:	18450513          	addi	a0,a0,388 # 20184 <__power_manager_start+0x14184>
    ab54:	858fc0ef          	jal	6bac <iprintf>
    ab58:	00892687          	flw	fa3,8(s2)
    ab5c:	0004a787          	flw	fa5,0(s1)
    ab60:	10f6f753          	fmul.s	fa4,fa3,fa5
    ab64:	08e12e27          	fsw	fa4,156(sp)
    ab68:	00442707          	flw	fa4,4(s0)
    ab6c:	00f77753          	fadd.s	fa4,fa4,fa5
    ab70:	0ae12027          	fsw	fa4,160(sp)
    ab74:	0044a707          	flw	fa4,4(s1)
    ab78:	10d77753          	fmul.s	fa4,fa4,fa3
    ab7c:	0ae12227          	fsw	fa4,164(sp)
    ab80:	00492707          	flw	fa4,4(s2)
    ab84:	08e7f7d3          	fsub.s	fa5,fa5,fa4
    ab88:	0af12427          	fsw	fa5,168(sp)
    ab8c:	00400593          	li	a1,4
    ab90:	09c10513          	addi	a0,sp,156
    ab94:	835ff0ef          	jal	a3c8 <bestProgram>
    ab98:	000207b7          	lui	a5,0x20
    ab9c:	6cc78793          	addi	a5,a5,1740 # 206cc <jump_table.20>
    aba0:	00251713          	slli	a4,a0,0x2
    aba4:	00e78733          	add	a4,a5,a4
    aba8:	14472703          	lw	a4,324(a4)
    abac:	00271713          	slli	a4,a4,0x2
    abb0:	00e787b3          	add	a5,a5,a4
    abb4:	0007a783          	lw	a5,0(a5)
    abb8:	8b5ff06f          	j	a46c <inferenceTPG+0x38>
    abbc:	01000593          	li	a1,16
    abc0:	00020537          	lui	a0,0x20
    abc4:	18450513          	addi	a0,a0,388 # 20184 <__power_manager_start+0x14184>
    abc8:	fe5fb0ef          	jal	6bac <iprintf>
    abcc:	0144a787          	flw	fa5,20(s1)
    abd0:	00842707          	flw	fa4,8(s0)
    abd4:	10e7f7d3          	fmul.s	fa5,fa5,fa4
    abd8:	00f12a27          	fsw	fa5,20(sp)
    abdc:	0084a787          	flw	fa5,8(s1)
    abe0:	00892707          	flw	fa4,8(s2)
    abe4:	10e7f7d3          	fmul.s	fa5,fa5,fa4
    abe8:	00f12c27          	fsw	fa5,24(sp)
    abec:	00200593          	li	a1,2
    abf0:	01410513          	addi	a0,sp,20
    abf4:	fd4ff0ef          	jal	a3c8 <bestProgram>
    abf8:	00251513          	slli	a0,a0,0x2
    abfc:	b1818793          	addi	a5,gp,-1256 # 21650 <next.3>
    ac00:	00a787b3          	add	a5,a5,a0
    ac04:	0007a703          	lw	a4,0(a5)
    ac08:	00271713          	slli	a4,a4,0x2
    ac0c:	000207b7          	lui	a5,0x20
    ac10:	6cc78793          	addi	a5,a5,1740 # 206cc <jump_table.20>
    ac14:	00e787b3          	add	a5,a5,a4
    ac18:	0007a783          	lw	a5,0(a5)
    ac1c:	851ff06f          	j	a46c <inferenceTPG+0x38>
    ac20:	01100593          	li	a1,17
    ac24:	00020537          	lui	a0,0x20
    ac28:	18450513          	addi	a0,a0,388 # 20184 <__power_manager_start+0x14184>
    ac2c:	f81fb0ef          	jal	6bac <iprintf>
    ac30:	0044a787          	flw	fa5,4(s1)
    ac34:	00442707          	flw	fa4,4(s0)
    ac38:	10e7f7d3          	fmul.s	fa5,fa5,fa4
    ac3c:	00f12e27          	fsw	fa5,28(sp)
    ac40:	0144a787          	flw	fa5,20(s1)
    ac44:	00842707          	flw	fa4,8(s0)
    ac48:	10e7f7d3          	fmul.s	fa5,fa5,fa4
    ac4c:	02f12027          	fsw	fa5,32(sp)
    ac50:	00200593          	li	a1,2
    ac54:	01c10513          	addi	a0,sp,28
    ac58:	f70ff0ef          	jal	a3c8 <bestProgram>
    ac5c:	00251513          	slli	a0,a0,0x2
    ac60:	b1018793          	addi	a5,gp,-1264 # 21648 <next.2>
    ac64:	00a787b3          	add	a5,a5,a0
    ac68:	0007a703          	lw	a4,0(a5)
    ac6c:	00271713          	slli	a4,a4,0x2
    ac70:	000207b7          	lui	a5,0x20
    ac74:	6cc78793          	addi	a5,a5,1740 # 206cc <jump_table.20>
    ac78:	00e787b3          	add	a5,a5,a4
    ac7c:	0007a783          	lw	a5,0(a5)
    ac80:	fecff06f          	j	a46c <inferenceTPG+0x38>
    ac84:	01200593          	li	a1,18
    ac88:	00020537          	lui	a0,0x20
    ac8c:	18450513          	addi	a0,a0,388 # 20184 <__power_manager_start+0x14184>
    ac90:	f1dfb0ef          	jal	6bac <iprintf>
    ac94:	0089a707          	flw	fa4,8(s3)
    ac98:	0144a787          	flw	fa5,20(s1)
    ac9c:	10e7f7d3          	fmul.s	fa5,fa5,fa4
    aca0:	06f12027          	fsw	fa5,96(sp)
    aca4:	00042787          	flw	fa5,0(s0)
    aca8:	0009a687          	flw	fa3,0(s3)
    acac:	08d7f7d3          	fsub.s	fa5,fa5,fa3
    acb0:	10e7f7d3          	fmul.s	fa5,fa5,fa4
    acb4:	06f12227          	fsw	fa5,100(sp)
    acb8:	00842787          	flw	fa5,8(s0)
    acbc:	10f7f7d3          	fmul.s	fa5,fa5,fa5
    acc0:	06f12427          	fsw	fa5,104(sp)
    acc4:	00300593          	li	a1,3
    acc8:	06010513          	addi	a0,sp,96
    accc:	efcff0ef          	jal	a3c8 <bestProgram>
    acd0:	000207b7          	lui	a5,0x20
    acd4:	6cc78793          	addi	a5,a5,1740 # 206cc <jump_table.20>
    acd8:	00251713          	slli	a4,a0,0x2
    acdc:	00e78733          	add	a4,a5,a4
    ace0:	15472703          	lw	a4,340(a4)
    ace4:	00271713          	slli	a4,a4,0x2
    ace8:	00e787b3          	add	a5,a5,a4
    acec:	0007a783          	lw	a5,0(a5)
    acf0:	f7cff06f          	j	a46c <inferenceTPG+0x38>
    acf4:	01300593          	li	a1,19
    acf8:	00020537          	lui	a0,0x20
    acfc:	18450513          	addi	a0,a0,388 # 20184 <__power_manager_start+0x14184>
    ad00:	eadfb0ef          	jal	6bac <iprintf>
    ad04:	00092787          	flw	fa5,0(s2)
    ad08:	00042707          	flw	fa4,0(s0)
    ad0c:	10f77753          	fmul.s	fa4,fa4,fa5
    ad10:	10e12a27          	fsw	fa4,276(sp)
    ad14:	10012c23          	sw	zero,280(sp)
    ad18:	0044a707          	flw	fa4,4(s1)
    ad1c:	00442687          	flw	fa3,4(s0)
    ad20:	10d77753          	fmul.s	fa4,fa4,fa3
    ad24:	10e12e27          	fsw	fa4,284(sp)
    ad28:	00492707          	flw	fa4,4(s2)
    ad2c:	00f77753          	fadd.s	fa4,fa4,fa5
    ad30:	12e12027          	fsw	fa4,288(sp)
    ad34:	00892707          	flw	fa4,8(s2)
    ad38:	0084a687          	flw	fa3,8(s1)
    ad3c:	10e6f6d3          	fmul.s	fa3,fa3,fa4
    ad40:	12d12227          	fsw	fa3,292(sp)
    ad44:	00842687          	flw	fa3,8(s0)
    ad48:	00e6f753          	fadd.s	fa4,fa3,fa4
    ad4c:	12e12427          	fsw	fa4,296(sp)
    ad50:	08d7f7d3          	fsub.s	fa5,fa5,fa3
    ad54:	12f12627          	fsw	fa5,300(sp)
    ad58:	00700593          	li	a1,7
    ad5c:	11410513          	addi	a0,sp,276
    ad60:	e68ff0ef          	jal	a3c8 <bestProgram>
    ad64:	000207b7          	lui	a5,0x20
    ad68:	6cc78793          	addi	a5,a5,1740 # 206cc <jump_table.20>
    ad6c:	00251713          	slli	a4,a0,0x2
    ad70:	00e78733          	add	a4,a5,a4
    ad74:	16072703          	lw	a4,352(a4)
    ad78:	00271713          	slli	a4,a4,0x2
    ad7c:	00e787b3          	add	a5,a5,a4
    ad80:	0007a783          	lw	a5,0(a5)
    ad84:	ee8ff06f          	j	a46c <inferenceTPG+0x38>
    ad88:	00400793          	li	a5,4
    ad8c:	00fa2023          	sw	a5,0(s4)
    ad90:	14c12083          	lw	ra,332(sp)
    ad94:	14812403          	lw	s0,328(sp)
    ad98:	14412483          	lw	s1,324(sp)
    ad9c:	14012903          	lw	s2,320(sp)
    ada0:	13c12983          	lw	s3,316(sp)
    ada4:	13812a03          	lw	s4,312(sp)
    ada8:	15010113          	addi	sp,sp,336
    adac:	00008067          	ret
    adb0:	00000793          	li	a5,0
    adb4:	fd9ff06f          	j	ad8c <inferenceTPG+0x958>
    adb8:	00700793          	li	a5,7
    adbc:	fd1ff06f          	j	ad8c <inferenceTPG+0x958>
    adc0:	00800793          	li	a5,8
    adc4:	fc9ff06f          	j	ad8c <inferenceTPG+0x958>
    adc8:	00500793          	li	a5,5
    adcc:	fc1ff06f          	j	ad8c <inferenceTPG+0x958>
    add0:	00600793          	li	a5,6
    add4:	fb9ff06f          	j	ad8c <inferenceTPG+0x958>
    add8:	00100793          	li	a5,1
    addc:	fb1ff06f          	j	ad8c <inferenceTPG+0x958>
    ade0:	00200793          	li	a5,2
    ade4:	fa9ff06f          	j	ad8c <inferenceTPG+0x958>

0000ade8 <main>:
    ade8:	f2010113          	addi	sp,sp,-224
    adec:	0c112e23          	sw	ra,220(sp)
    adf0:	0c812c23          	sw	s0,216(sp)
    adf4:	0c912a23          	sw	s1,212(sp)
    adf8:	0d212823          	sw	s2,208(sp)
    adfc:	0d312623          	sw	s3,204(sp)
    ae00:	0d412423          	sw	s4,200(sp)
    ae04:	0d512223          	sw	s5,196(sp)
    ae08:	0d612023          	sw	s6,192(sp)
    ae0c:	0b712e23          	sw	s7,188(sp)
    ae10:	0b812c23          	sw	s8,184(sp)
    ae14:	0b912a23          	sw	s9,180(sp)
    ae18:	0ba12823          	sw	s10,176(sp)
    ae1c:	0bb12623          	sw	s11,172(sp)
    ae20:	08812e27          	fsw	fs0,156(sp)
    ae24:	08912c27          	fsw	fs1,152(sp)
    ae28:	00100793          	li	a5,1
    ae2c:	3207b073          	csrc	mcountinhibit,a5
    ae30:	01810493          	addi	s1,sp,24
    ae34:	05410713          	addi	a4,sp,84
    ae38:	00048793          	mv	a5,s1
    ae3c:	0007a023          	sw	zero,0(a5)
    ae40:	0007a223          	sw	zero,4(a5)
    ae44:	0007a423          	sw	zero,8(a5)
    ae48:	00c78793          	addi	a5,a5,12
    ae4c:	fee798e3          	bne	a5,a4,ae3c <main+0x54>
    ae50:	00020937          	lui	s2,0x20
    ae54:	6cc90913          	addi	s2,s2,1740 # 206cc <jump_table.20>
    ae58:	17c90d13          	addi	s10,s2,380
    ae5c:	24490c93          	addi	s9,s2,580
    ae60:	30c90c13          	addi	s8,s2,780
    ae64:	3d490b93          	addi	s7,s2,980
    ae68:	49c90b13          	addi	s6,s2,1180
    ae6c:	56490913          	addi	s2,s2,1380
    ae70:	00000413          	li	s0,0
    ae74:	00000a93          	li	s5,0
    ae78:	00020db7          	lui	s11,0x20
    ae7c:	6ccd8d93          	addi	s11,s11,1740 # 206cc <jump_table.20>
    ae80:	000219b7          	lui	s3,0x21
    ae84:	6cc98993          	addi	s3,s3,1740 # 216cc <__sf+0x18>
    ae88:	af41a487          	flw	fs1,-1292(gp) # 2162c <__SDATA_BEGIN__+0x54>
    ae8c:	af81a407          	flw	fs0,-1288(gp) # 21630 <__SDATA_BEGIN__+0x58>
    ae90:	000d2787          	flw	fa5,0(s10)
    ae94:	08f12227          	fsw	fa5,132(sp)
    ae98:	000ca787          	flw	fa5,0(s9)
    ae9c:	08f12427          	fsw	fa5,136(sp)
    aea0:	000c2787          	flw	fa5,0(s8)
    aea4:	08f12627          	fsw	fa5,140(sp)
    aea8:	000ba787          	flw	fa5,0(s7)
    aeac:	06f12c27          	fsw	fa5,120(sp)
    aeb0:	000b2787          	flw	fa5,0(s6)
    aeb4:	06f12e27          	fsw	fa5,124(sp)
    aeb8:	00092787          	flw	fa5,0(s2)
    aebc:	08f12027          	fsw	fa5,128(sp)
    aec0:	000217b7          	lui	a5,0x21
    aec4:	cf878793          	addi	a5,a5,-776 # 20cf8 <dataSourcesLE_6>
    aec8:	008787b3          	add	a5,a5,s0
    aecc:	0007a787          	flw	fa5,0(a5)
    aed0:	06f12627          	fsw	fa5,108(sp)
    aed4:	000217b7          	lui	a5,0x21
    aed8:	dc078793          	addi	a5,a5,-576 # 20dc0 <dataSourcesLE_7>
    aedc:	008787b3          	add	a5,a5,s0
    aee0:	0007a787          	flw	fa5,0(a5)
    aee4:	06f12827          	fsw	fa5,112(sp)
    aee8:	008d87b3          	add	a5,s11,s0
    aeec:	7bc7a787          	flw	fa5,1980(a5)
    aef0:	06f12a27          	fsw	fa5,116(sp)
    aef4:	000217b7          	lui	a5,0x21
    aef8:	f5078793          	addi	a5,a5,-176 # 20f50 <dataSourcesLE_9>
    aefc:	008787b3          	add	a5,a5,s0
    af00:	0007a787          	flw	fa5,0(a5)
    af04:	04f12a27          	fsw	fa5,84(sp)
    af08:	008987b3          	add	a5,s3,s0
    af0c:	94c7a787          	flw	fa5,-1716(a5)
    af10:	04f12c27          	fsw	fa5,88(sp)
    af14:	a147a787          	flw	fa5,-1516(a5)
    af18:	04f12e27          	fsw	fa5,92(sp)
    af1c:	adc7a787          	flw	fa5,-1316(a5)
    af20:	06f12027          	fsw	fa5,96(sp)
    af24:	06912227          	fsw	fs1,100(sp)
    af28:	06812427          	fsw	fs0,104(sp)
    af2c:	00000793          	li	a5,0
    af30:	b0079073          	csrw	mcycle,a5
    af34:	05410713          	addi	a4,sp,84
    af38:	06c10693          	addi	a3,sp,108
    af3c:	07810613          	addi	a2,sp,120
    af40:	08410593          	addi	a1,sp,132
    af44:	01410513          	addi	a0,sp,20
    af48:	cecff0ef          	jal	a434 <inferenceTPG>
    af4c:	b00027f3          	csrr	a5,mcycle
    af50:	00f12623          	sw	a5,12(sp)
    af54:	008987b3          	add	a5,s3,s0
    af58:	ba47aa03          	lw	s4,-1116(a5)
    af5c:	00400793          	li	a5,4
    af60:	0d47e063          	bltu	a5,s4,b020 <main+0x238>
    af64:	000a0693          	mv	a3,s4
    af68:	000a8613          	mv	a2,s5
    af6c:	01412583          	lw	a1,20(sp)
    af70:	00020537          	lui	a0,0x20
    af74:	1b050513          	addi	a0,a0,432 # 201b0 <__power_manager_start+0x141b0>
    af78:	c35fb0ef          	jal	6bac <iprintf>
    af7c:	00c12783          	lw	a5,12(sp)
    af80:	d017f7d3          	fcvt.s.wu	fa5,a5
    af84:	001a1713          	slli	a4,s4,0x1
    af88:	014707b3          	add	a5,a4,s4
    af8c:	00279793          	slli	a5,a5,0x2
    af90:	09010693          	addi	a3,sp,144
    af94:	00f687b3          	add	a5,a3,a5
    af98:	f887a683          	lw	a3,-120(a5)
    af9c:	00168693          	addi	a3,a3,1
    afa0:	f8d7a423          	sw	a3,-120(a5)
    afa4:	f8c7a607          	flw	fa2,-116(a5)
    afa8:	08c7f6d3          	fsub.s	fa3,fa5,fa2
    afac:	d016f753          	fcvt.s.wu	fa4,a3
    afb0:	18e6f753          	fdiv.s	fa4,fa3,fa4
    afb4:	00c77753          	fadd.s	fa4,fa4,fa2
    afb8:	f8e7a627          	fsw	fa4,-116(a5)
    afbc:	08e7f7d3          	fsub.s	fa5,fa5,fa4
    afc0:	10d7f7d3          	fmul.s	fa5,fa5,fa3
    afc4:	f907a707          	flw	fa4,-112(a5)
    afc8:	00e7f7d3          	fadd.s	fa5,fa5,fa4
    afcc:	f8f7a827          	fsw	fa5,-112(a5)
    afd0:	001a8a93          	addi	s5,s5,1
    afd4:	004d0d13          	addi	s10,s10,4
    afd8:	004c8c93          	addi	s9,s9,4
    afdc:	004c0c13          	addi	s8,s8,4
    afe0:	004b8b93          	addi	s7,s7,4
    afe4:	004b0b13          	addi	s6,s6,4
    afe8:	00490913          	addi	s2,s2,4
    afec:	00440413          	addi	s0,s0,4
    aff0:	00300793          	li	a5,3
    aff4:	e8fa9ee3          	bne	s5,a5,ae90 <main+0xa8>
    aff8:	00020537          	lui	a0,0x20
    affc:	1cc50513          	addi	a0,a0,460 # 201cc <__power_manager_start+0x141cc>
    b000:	d05fb0ef          	jal	6d04 <puts>
    b004:	00000413          	li	s0,0
    b008:	00100a93          	li	s5,1
    b00c:	000209b7          	lui	s3,0x20
    b010:	20098993          	addi	s3,s3,512 # 20200 <__power_manager_start+0x14200>
    b014:	f00004d3          	fmv.w.x	fs1,zero
    b018:	00500a13          	li	s4,5
    b01c:	0440006f          	j	b060 <main+0x278>
    b020:	000a0613          	mv	a2,s4
    b024:	000a8593          	mv	a1,s5
    b028:	00020537          	lui	a0,0x20
    b02c:	19050513          	addi	a0,a0,400 # 20190 <__power_manager_start+0x14190>
    b030:	b7dfb0ef          	jal	6bac <iprintf>
    b034:	f9dff06f          	j	afd0 <main+0x1e8>
    b038:	20948553          	fmv.s	fa0,fs1
    b03c:	c0051753          	fcvt.w.s	a4,fa0,rtz
    b040:	c00416d3          	fcvt.w.s	a3,fs0,rtz
    b044:	00090613          	mv	a2,s2
    b048:	00040593          	mv	a1,s0
    b04c:	00098513          	mv	a0,s3
    b050:	b5dfb0ef          	jal	6bac <iprintf>
    b054:	00140413          	addi	s0,s0,1
    b058:	00c48493          	addi	s1,s1,12
    b05c:	03440e63          	beq	s0,s4,b098 <main+0x2b0>
    b060:	0004a903          	lw	s2,0(s1)
    b064:	fe0908e3          	beqz	s2,b054 <main+0x26c>
    b068:	0044a407          	flw	fs0,4(s1)
    b06c:	fd2af6e3          	bgeu	s5,s2,b038 <main+0x250>
    b070:	fff90793          	addi	a5,s2,-1
    b074:	d017f7d3          	fcvt.s.wu	fa5,a5
    b078:	0084a507          	flw	fa0,8(s1)
    b07c:	18f57553          	fdiv.s	fa0,fa0,fa5
    b080:	a0a497d3          	flt.s	a5,fs1,fa0
    b084:	fa078ae3          	beqz	a5,b038 <main+0x250>
    b088:	f49fe0ef          	jal	9fd0 <__extendsfdf2>
    b08c:	c8dfb0ef          	jal	6d18 <sqrt>
    b090:	854ff0ef          	jal	a0e4 <__truncdfsf2>
    b094:	fa9ff06f          	j	b03c <main+0x254>
    b098:	00000513          	li	a0,0
    b09c:	0dc12083          	lw	ra,220(sp)
    b0a0:	0d812403          	lw	s0,216(sp)
    b0a4:	0d412483          	lw	s1,212(sp)
    b0a8:	0d012903          	lw	s2,208(sp)
