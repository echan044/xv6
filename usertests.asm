
_usertests:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return randstate;
}

int
main(int argc, char *argv[])
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "usertests starting\n");
      11:	68 ce 52 00 00       	push   $0x52ce
      16:	6a 01                	push   $0x1
      18:	e8 a3 3f 00 00       	call   3fc0 <printf>

  if(open("usertests.ran", 0) >= 0){
      1d:	5a                   	pop    %edx
      1e:	59                   	pop    %ecx
      1f:	6a 00                	push   $0x0
      21:	68 e2 52 00 00       	push   $0x52e2
      26:	e8 8f 3e 00 00       	call   3eba <open>
      2b:	83 c4 10             	add    $0x10,%esp
      2e:	85 c0                	test   %eax,%eax
      30:	78 1b                	js     4d <main+0x4d>
    printf(1, "already ran user tests -- rebuild fs.img\n");
      32:	83 ec 08             	sub    $0x8,%esp
      35:	68 4c 5a 00 00       	push   $0x5a4c
      3a:	6a 01                	push   $0x1
      3c:	e8 7f 3f 00 00       	call   3fc0 <printf>
    exit(-1);
      41:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
      48:	e8 25 3e 00 00       	call   3e72 <exit>
  }
  close(open("usertests.ran", O_CREATE));
      4d:	50                   	push   %eax
      4e:	50                   	push   %eax
      4f:	68 00 02 00 00       	push   $0x200
      54:	68 e2 52 00 00       	push   $0x52e2
      59:	e8 5c 3e 00 00       	call   3eba <open>
      5e:	89 04 24             	mov    %eax,(%esp)
      61:	e8 3c 3e 00 00       	call   3ea2 <close>

  argptest();
      66:	e8 35 3b 00 00       	call   3ba0 <argptest>
  createdelete();
      6b:	e8 60 13 00 00       	call   13d0 <createdelete>
  linkunlink();
      70:	e8 fb 1c 00 00       	call   1d70 <linkunlink>
  concreate();
      75:	e8 b6 19 00 00       	call   1a30 <concreate>
  fourfiles();
      7a:	e8 11 11 00 00       	call   1190 <fourfiles>
  sharedfd();
      7f:	e8 4c 0f 00 00       	call   fd0 <sharedfd>

  bigargtest();
      84:	e8 77 37 00 00       	call   3800 <bigargtest>
  bigwrite();
      89:	e8 22 27 00 00       	call   27b0 <bigwrite>
  bigargtest();
      8e:	e8 6d 37 00 00       	call   3800 <bigargtest>
  bsstest();
      93:	e8 e8 36 00 00       	call   3780 <bsstest>
  sbrktest();
      98:	e8 73 31 00 00       	call   3210 <sbrktest>
  validatetest();
      9d:	e8 1e 36 00 00       	call   36c0 <validatetest>

  opentest();
      a2:	e8 e9 03 00 00       	call   490 <opentest>
  writetest();
      a7:	e8 84 04 00 00       	call   530 <writetest>
  writetest1();
      ac:	e8 8f 06 00 00       	call   740 <writetest1>
  createtest();
      b1:	e8 8a 08 00 00       	call   940 <createtest>

  openiputtest();
      b6:	e8 a5 02 00 00       	call   360 <openiputtest>
  exitiputtest();
      bb:	e8 70 01 00 00       	call   230 <exitiputtest>
  iputtest();
      c0:	e8 6b 00 00 00       	call   130 <iputtest>

  mem();
      c5:	e8 26 0e 00 00       	call   ef0 <mem>
  pipe1();
      ca:	e8 71 0a 00 00       	call   b40 <pipe1>
  preempt();
      cf:	e8 2c 0c 00 00       	call   d00 <preempt>
  exitwait();
      d4:	e8 77 0d 00 00       	call   e50 <exitwait>

  rmdot();
      d9:	e8 22 2b 00 00       	call   2c00 <rmdot>
  fourteen();
      de:	e8 bd 29 00 00       	call   2aa0 <fourteen>
  bigfile();
      e3:	e8 b8 27 00 00       	call   28a0 <bigfile>
  subdir();
      e8:	e8 e3 1e 00 00       	call   1fd0 <subdir>
  linktest();
      ed:	e8 ee 16 00 00       	call   17e0 <linktest>
  unlinkread();
      f2:	e8 29 15 00 00       	call   1620 <unlinkread>
  dirfile();
      f7:	e8 b4 2c 00 00       	call   2db0 <dirfile>
  iref();
      fc:	e8 ff 2e 00 00       	call   3000 <iref>
  forktest();
     101:	e8 2a 30 00 00       	call   3130 <forktest>
  bigdir(); // slow
     106:	e8 75 1d 00 00       	call   1e80 <bigdir>

  uio();
     10b:	e8 00 3a 00 00       	call   3b10 <uio>

  exectest();
     110:	e8 db 09 00 00       	call   af0 <exectest>

  exit(0);
     115:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     11c:	e8 51 3d 00 00       	call   3e72 <exit>
     121:	66 90                	xchg   %ax,%ax
     123:	66 90                	xchg   %ax,%ax
     125:	66 90                	xchg   %ax,%ax
     127:	66 90                	xchg   %ax,%ax
     129:	66 90                	xchg   %ax,%ax
     12b:	66 90                	xchg   %ax,%ax
     12d:	66 90                	xchg   %ax,%ax
     12f:	90                   	nop

00000130 <iputtest>:
int stdout = 1;

// does chdir() call iput(p->cwd) in a transaction?
void
iputtest(void)
{
     130:	55                   	push   %ebp
     131:	89 e5                	mov    %esp,%ebp
     133:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "iput test\n");
     136:	68 74 43 00 00       	push   $0x4374
     13b:	ff 35 74 63 00 00    	pushl  0x6374
     141:	e8 7a 3e 00 00       	call   3fc0 <printf>

  if(mkdir("iputdir") < 0){
     146:	c7 04 24 07 43 00 00 	movl   $0x4307,(%esp)
     14d:	e8 90 3d 00 00       	call   3ee2 <mkdir>
     152:	83 c4 10             	add    $0x10,%esp
     155:	85 c0                	test   %eax,%eax
     157:	78 58                	js     1b1 <iputtest+0x81>
    printf(stdout, "mkdir failed\n");
    exit(-1);
  }
  if(chdir("iputdir") < 0){
     159:	83 ec 0c             	sub    $0xc,%esp
     15c:	68 07 43 00 00       	push   $0x4307
     161:	e8 84 3d 00 00       	call   3eea <chdir>
     166:	83 c4 10             	add    $0x10,%esp
     169:	85 c0                	test   %eax,%eax
     16b:	0f 88 9a 00 00 00    	js     20b <iputtest+0xdb>
    printf(stdout, "chdir iputdir failed\n");
    exit(-1);
  }
  if(unlink("../iputdir") < 0){
     171:	83 ec 0c             	sub    $0xc,%esp
     174:	68 04 43 00 00       	push   $0x4304
     179:	e8 4c 3d 00 00       	call   3eca <unlink>
     17e:	83 c4 10             	add    $0x10,%esp
     181:	85 c0                	test   %eax,%eax
     183:	78 68                	js     1ed <iputtest+0xbd>
    printf(stdout, "unlink ../iputdir failed\n");
    exit(-1);
  }
  if(chdir("/") < 0){
     185:	83 ec 0c             	sub    $0xc,%esp
     188:	68 29 43 00 00       	push   $0x4329
     18d:	e8 58 3d 00 00       	call   3eea <chdir>
     192:	83 c4 10             	add    $0x10,%esp
     195:	85 c0                	test   %eax,%eax
     197:	78 36                	js     1cf <iputtest+0x9f>
    printf(stdout, "chdir / failed\n");
    exit(-1);
  }
  printf(stdout, "iput test ok\n");
     199:	83 ec 08             	sub    $0x8,%esp
     19c:	68 ac 43 00 00       	push   $0x43ac
     1a1:	ff 35 74 63 00 00    	pushl  0x6374
     1a7:	e8 14 3e 00 00       	call   3fc0 <printf>
}
     1ac:	83 c4 10             	add    $0x10,%esp
     1af:	c9                   	leave  
     1b0:	c3                   	ret    
iputtest(void)
{
  printf(stdout, "iput test\n");

  if(mkdir("iputdir") < 0){
    printf(stdout, "mkdir failed\n");
     1b1:	50                   	push   %eax
     1b2:	50                   	push   %eax
     1b3:	68 e0 42 00 00       	push   $0x42e0
     1b8:	ff 35 74 63 00 00    	pushl  0x6374
     1be:	e8 fd 3d 00 00       	call   3fc0 <printf>
    exit(-1);
     1c3:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
     1ca:	e8 a3 3c 00 00       	call   3e72 <exit>
  if(unlink("../iputdir") < 0){
    printf(stdout, "unlink ../iputdir failed\n");
    exit(-1);
  }
  if(chdir("/") < 0){
    printf(stdout, "chdir / failed\n");
     1cf:	50                   	push   %eax
     1d0:	50                   	push   %eax
     1d1:	68 2b 43 00 00       	push   $0x432b
     1d6:	ff 35 74 63 00 00    	pushl  0x6374
     1dc:	e8 df 3d 00 00       	call   3fc0 <printf>
    exit(-1);
     1e1:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
     1e8:	e8 85 3c 00 00       	call   3e72 <exit>
  if(chdir("iputdir") < 0){
    printf(stdout, "chdir iputdir failed\n");
    exit(-1);
  }
  if(unlink("../iputdir") < 0){
    printf(stdout, "unlink ../iputdir failed\n");
     1ed:	52                   	push   %edx
     1ee:	52                   	push   %edx
     1ef:	68 0f 43 00 00       	push   $0x430f
     1f4:	ff 35 74 63 00 00    	pushl  0x6374
     1fa:	e8 c1 3d 00 00       	call   3fc0 <printf>
    exit(-1);
     1ff:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
     206:	e8 67 3c 00 00       	call   3e72 <exit>
  if(mkdir("iputdir") < 0){
    printf(stdout, "mkdir failed\n");
    exit(-1);
  }
  if(chdir("iputdir") < 0){
    printf(stdout, "chdir iputdir failed\n");
     20b:	51                   	push   %ecx
     20c:	51                   	push   %ecx
     20d:	68 ee 42 00 00       	push   $0x42ee
     212:	ff 35 74 63 00 00    	pushl  0x6374
     218:	e8 a3 3d 00 00       	call   3fc0 <printf>
    exit(-1);
     21d:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
     224:	e8 49 3c 00 00       	call   3e72 <exit>
     229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000230 <exitiputtest>:
}

// does exit() call iput(p->cwd) in a transaction?
void
exitiputtest(void)
{
     230:	55                   	push   %ebp
     231:	89 e5                	mov    %esp,%ebp
     233:	83 ec 10             	sub    $0x10,%esp
  int pid;

  printf(stdout, "exitiput test\n");
     236:	68 3b 43 00 00       	push   $0x433b
     23b:	ff 35 74 63 00 00    	pushl  0x6374
     241:	e8 7a 3d 00 00       	call   3fc0 <printf>

  pid = fork();
     246:	e8 1f 3c 00 00       	call   3e6a <fork>
  if(pid < 0){
     24b:	83 c4 10             	add    $0x10,%esp
     24e:	85 c0                	test   %eax,%eax
     250:	0f 88 a1 00 00 00    	js     2f7 <exitiputtest+0xc7>
    printf(stdout, "fork failed\n");
    exit(-1);
  }
  if(pid == 0){
     256:	75 58                	jne    2b0 <exitiputtest+0x80>
    if(mkdir("iputdir") < 0){
     258:	83 ec 0c             	sub    $0xc,%esp
     25b:	68 07 43 00 00       	push   $0x4307
     260:	e8 7d 3c 00 00       	call   3ee2 <mkdir>
     265:	83 c4 10             	add    $0x10,%esp
     268:	85 c0                	test   %eax,%eax
     26a:	0f 88 c3 00 00 00    	js     333 <exitiputtest+0x103>
      printf(stdout, "mkdir failed\n");
      exit(-1);
    }
    if(chdir("iputdir") < 0){
     270:	83 ec 0c             	sub    $0xc,%esp
     273:	68 07 43 00 00       	push   $0x4307
     278:	e8 6d 3c 00 00       	call   3eea <chdir>
     27d:	83 c4 10             	add    $0x10,%esp
     280:	85 c0                	test   %eax,%eax
     282:	0f 88 8d 00 00 00    	js     315 <exitiputtest+0xe5>
      printf(stdout, "child chdir failed\n");
      exit(-1);
    }
    if(unlink("../iputdir") < 0){
     288:	83 ec 0c             	sub    $0xc,%esp
     28b:	68 04 43 00 00       	push   $0x4304
     290:	e8 35 3c 00 00       	call   3eca <unlink>
     295:	83 c4 10             	add    $0x10,%esp
     298:	85 c0                	test   %eax,%eax
     29a:	78 3c                	js     2d8 <exitiputtest+0xa8>
      printf(stdout, "unlink ../iputdir failed\n");
      exit(-1);
    }
    exit(-1);
     29c:	83 ec 0c             	sub    $0xc,%esp
     29f:	6a ff                	push   $0xffffffff
     2a1:	e8 cc 3b 00 00       	call   3e72 <exit>
     2a6:	8d 76 00             	lea    0x0(%esi),%esi
     2a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  }
  wait(0);
     2b0:	83 ec 0c             	sub    $0xc,%esp
     2b3:	6a 00                	push   $0x0
     2b5:	e8 c0 3b 00 00       	call   3e7a <wait>
  printf(stdout, "exitiput test ok\n");
     2ba:	58                   	pop    %eax
     2bb:	5a                   	pop    %edx
     2bc:	68 5e 43 00 00       	push   $0x435e
     2c1:	ff 35 74 63 00 00    	pushl  0x6374
     2c7:	e8 f4 3c 00 00       	call   3fc0 <printf>
}
     2cc:	83 c4 10             	add    $0x10,%esp
     2cf:	c9                   	leave  
     2d0:	c3                   	ret    
     2d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(chdir("iputdir") < 0){
      printf(stdout, "child chdir failed\n");
      exit(-1);
    }
    if(unlink("../iputdir") < 0){
      printf(stdout, "unlink ../iputdir failed\n");
     2d8:	83 ec 08             	sub    $0x8,%esp
     2db:	68 0f 43 00 00       	push   $0x430f
     2e0:	ff 35 74 63 00 00    	pushl  0x6374
     2e6:	e8 d5 3c 00 00       	call   3fc0 <printf>
      exit(-1);
     2eb:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
     2f2:	e8 7b 3b 00 00       	call   3e72 <exit>

  printf(stdout, "exitiput test\n");

  pid = fork();
  if(pid < 0){
    printf(stdout, "fork failed\n");
     2f7:	50                   	push   %eax
     2f8:	50                   	push   %eax
     2f9:	68 21 52 00 00       	push   $0x5221
     2fe:	ff 35 74 63 00 00    	pushl  0x6374
     304:	e8 b7 3c 00 00       	call   3fc0 <printf>
    exit(-1);
     309:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
     310:	e8 5d 3b 00 00       	call   3e72 <exit>
    if(mkdir("iputdir") < 0){
      printf(stdout, "mkdir failed\n");
      exit(-1);
    }
    if(chdir("iputdir") < 0){
      printf(stdout, "child chdir failed\n");
     315:	51                   	push   %ecx
     316:	51                   	push   %ecx
     317:	68 4a 43 00 00       	push   $0x434a
     31c:	ff 35 74 63 00 00    	pushl  0x6374
     322:	e8 99 3c 00 00       	call   3fc0 <printf>
      exit(-1);
     327:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
     32e:	e8 3f 3b 00 00       	call   3e72 <exit>
    printf(stdout, "fork failed\n");
    exit(-1);
  }
  if(pid == 0){
    if(mkdir("iputdir") < 0){
      printf(stdout, "mkdir failed\n");
     333:	50                   	push   %eax
     334:	50                   	push   %eax
     335:	68 e0 42 00 00       	push   $0x42e0
     33a:	ff 35 74 63 00 00    	pushl  0x6374
     340:	e8 7b 3c 00 00       	call   3fc0 <printf>
      exit(-1);
     345:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
     34c:	e8 21 3b 00 00       	call   3e72 <exit>
     351:	eb 0d                	jmp    360 <openiputtest>
     353:	90                   	nop
     354:	90                   	nop
     355:	90                   	nop
     356:	90                   	nop
     357:	90                   	nop
     358:	90                   	nop
     359:	90                   	nop
     35a:	90                   	nop
     35b:	90                   	nop
     35c:	90                   	nop
     35d:	90                   	nop
     35e:	90                   	nop
     35f:	90                   	nop

00000360 <openiputtest>:
//      for(i = 0; i < 10000; i++)
//        yield();
//    }
void
openiputtest(void)
{
     360:	55                   	push   %ebp
     361:	89 e5                	mov    %esp,%ebp
     363:	83 ec 10             	sub    $0x10,%esp
  int pid;

  printf(stdout, "openiput test\n");
     366:	68 70 43 00 00       	push   $0x4370
     36b:	ff 35 74 63 00 00    	pushl  0x6374
     371:	e8 4a 3c 00 00       	call   3fc0 <printf>
  if(mkdir("oidir") < 0){
     376:	c7 04 24 7f 43 00 00 	movl   $0x437f,(%esp)
     37d:	e8 60 3b 00 00       	call   3ee2 <mkdir>
     382:	83 c4 10             	add    $0x10,%esp
     385:	85 c0                	test   %eax,%eax
     387:	0f 88 9d 00 00 00    	js     42a <openiputtest+0xca>
    printf(stdout, "mkdir oidir failed\n");
    exit(-1);
  }
  pid = fork();
     38d:	e8 d8 3a 00 00       	call   3e6a <fork>
  if(pid < 0){
     392:	85 c0                	test   %eax,%eax
     394:	0f 88 ae 00 00 00    	js     448 <openiputtest+0xe8>
    printf(stdout, "fork failed\n");
    exit(-1);
  }
  if(pid == 0){
     39a:	75 3c                	jne    3d8 <openiputtest+0x78>
    int fd = open("oidir", O_RDWR);
     39c:	83 ec 08             	sub    $0x8,%esp
     39f:	6a 02                	push   $0x2
     3a1:	68 7f 43 00 00       	push   $0x437f
     3a6:	e8 0f 3b 00 00       	call   3eba <open>
    if(fd >= 0){
     3ab:	83 c4 10             	add    $0x10,%esp
     3ae:	85 c0                	test   %eax,%eax
     3b0:	78 6e                	js     420 <openiputtest+0xc0>
      printf(stdout, "open directory for write succeeded\n");
     3b2:	83 ec 08             	sub    $0x8,%esp
     3b5:	68 04 53 00 00       	push   $0x5304
     3ba:	ff 35 74 63 00 00    	pushl  0x6374
     3c0:	e8 fb 3b 00 00       	call   3fc0 <printf>
      exit(0);
     3c5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     3cc:	e8 a1 3a 00 00       	call   3e72 <exit>
     3d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
    exit(0);
  }
  sleep(1);
     3d8:	83 ec 0c             	sub    $0xc,%esp
     3db:	6a 01                	push   $0x1
     3dd:	e8 28 3b 00 00       	call   3f0a <sleep>
  if(unlink("oidir") != 0){
     3e2:	c7 04 24 7f 43 00 00 	movl   $0x437f,(%esp)
     3e9:	e8 dc 3a 00 00       	call   3eca <unlink>
     3ee:	83 c4 10             	add    $0x10,%esp
     3f1:	85 c0                	test   %eax,%eax
     3f3:	75 71                	jne    466 <openiputtest+0x106>
    printf(stdout, "unlink failed\n");
    exit(-1);
  }
  wait(0);
     3f5:	83 ec 0c             	sub    $0xc,%esp
     3f8:	6a 00                	push   $0x0
     3fa:	e8 7b 3a 00 00       	call   3e7a <wait>
  printf(stdout, "openiput test ok\n");
     3ff:	58                   	pop    %eax
     400:	5a                   	pop    %edx
     401:	68 a8 43 00 00       	push   $0x43a8
     406:	ff 35 74 63 00 00    	pushl  0x6374
     40c:	e8 af 3b 00 00       	call   3fc0 <printf>
}
     411:	83 c4 10             	add    $0x10,%esp
     414:	c9                   	leave  
     415:	c3                   	ret    
     416:	8d 76 00             	lea    0x0(%esi),%esi
     419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    int fd = open("oidir", O_RDWR);
    if(fd >= 0){
      printf(stdout, "open directory for write succeeded\n");
      exit(0);
    }
    exit(0);
     420:	83 ec 0c             	sub    $0xc,%esp
     423:	6a 00                	push   $0x0
     425:	e8 48 3a 00 00       	call   3e72 <exit>
{
  int pid;

  printf(stdout, "openiput test\n");
  if(mkdir("oidir") < 0){
    printf(stdout, "mkdir oidir failed\n");
     42a:	50                   	push   %eax
     42b:	50                   	push   %eax
     42c:	68 85 43 00 00       	push   $0x4385
     431:	ff 35 74 63 00 00    	pushl  0x6374
     437:	e8 84 3b 00 00       	call   3fc0 <printf>
    exit(-1);
     43c:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
     443:	e8 2a 3a 00 00       	call   3e72 <exit>
  }
  pid = fork();
  if(pid < 0){
    printf(stdout, "fork failed\n");
     448:	50                   	push   %eax
     449:	50                   	push   %eax
     44a:	68 21 52 00 00       	push   $0x5221
     44f:	ff 35 74 63 00 00    	pushl  0x6374
     455:	e8 66 3b 00 00       	call   3fc0 <printf>
    exit(-1);
     45a:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
     461:	e8 0c 3a 00 00       	call   3e72 <exit>
    }
    exit(0);
  }
  sleep(1);
  if(unlink("oidir") != 0){
    printf(stdout, "unlink failed\n");
     466:	51                   	push   %ecx
     467:	51                   	push   %ecx
     468:	68 99 43 00 00       	push   $0x4399
     46d:	ff 35 74 63 00 00    	pushl  0x6374
     473:	e8 48 3b 00 00       	call   3fc0 <printf>
    exit(-1);
     478:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
     47f:	e8 ee 39 00 00       	call   3e72 <exit>
     484:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     48a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000490 <opentest>:

// simple file system tests

void
opentest(void)
{
     490:	55                   	push   %ebp
     491:	89 e5                	mov    %esp,%ebp
     493:	83 ec 10             	sub    $0x10,%esp
  int fd;

  printf(stdout, "open test\n");
     496:	68 ba 43 00 00       	push   $0x43ba
     49b:	ff 35 74 63 00 00    	pushl  0x6374
     4a1:	e8 1a 3b 00 00       	call   3fc0 <printf>
  fd = open("echo", 0);
     4a6:	58                   	pop    %eax
     4a7:	5a                   	pop    %edx
     4a8:	6a 00                	push   $0x0
     4aa:	68 c5 43 00 00       	push   $0x43c5
     4af:	e8 06 3a 00 00       	call   3eba <open>
  if(fd < 0){
     4b4:	83 c4 10             	add    $0x10,%esp
     4b7:	85 c0                	test   %eax,%eax
     4b9:	78 36                	js     4f1 <opentest+0x61>
    printf(stdout, "open echo failed!\n");
    exit(-1);
  }
  close(fd);
     4bb:	83 ec 0c             	sub    $0xc,%esp
     4be:	50                   	push   %eax
     4bf:	e8 de 39 00 00       	call   3ea2 <close>
  fd = open("doesnotexist", 0);
     4c4:	5a                   	pop    %edx
     4c5:	59                   	pop    %ecx
     4c6:	6a 00                	push   $0x0
     4c8:	68 dd 43 00 00       	push   $0x43dd
     4cd:	e8 e8 39 00 00       	call   3eba <open>
  if(fd >= 0){
     4d2:	83 c4 10             	add    $0x10,%esp
     4d5:	85 c0                	test   %eax,%eax
     4d7:	79 36                	jns    50f <opentest+0x7f>
    printf(stdout, "open doesnotexist succeeded!\n");
    exit(0);
  }
  printf(stdout, "open test ok\n");
     4d9:	83 ec 08             	sub    $0x8,%esp
     4dc:	68 08 44 00 00       	push   $0x4408
     4e1:	ff 35 74 63 00 00    	pushl  0x6374
     4e7:	e8 d4 3a 00 00       	call   3fc0 <printf>
}
     4ec:	83 c4 10             	add    $0x10,%esp
     4ef:	c9                   	leave  
     4f0:	c3                   	ret    
  int fd;

  printf(stdout, "open test\n");
  fd = open("echo", 0);
  if(fd < 0){
    printf(stdout, "open echo failed!\n");
     4f1:	50                   	push   %eax
     4f2:	50                   	push   %eax
     4f3:	68 ca 43 00 00       	push   $0x43ca
     4f8:	ff 35 74 63 00 00    	pushl  0x6374
     4fe:	e8 bd 3a 00 00       	call   3fc0 <printf>
    exit(-1);
     503:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
     50a:	e8 63 39 00 00       	call   3e72 <exit>
  }
  close(fd);
  fd = open("doesnotexist", 0);
  if(fd >= 0){
    printf(stdout, "open doesnotexist succeeded!\n");
     50f:	50                   	push   %eax
     510:	50                   	push   %eax
     511:	68 ea 43 00 00       	push   $0x43ea
     516:	ff 35 74 63 00 00    	pushl  0x6374
     51c:	e8 9f 3a 00 00       	call   3fc0 <printf>
    exit(0);
     521:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     528:	e8 45 39 00 00       	call   3e72 <exit>
     52d:	8d 76 00             	lea    0x0(%esi),%esi

00000530 <writetest>:
  printf(stdout, "open test ok\n");
}

void
writetest(void)
{
     530:	55                   	push   %ebp
     531:	89 e5                	mov    %esp,%ebp
     533:	56                   	push   %esi
     534:	53                   	push   %ebx
  int fd;
  int i;

  printf(stdout, "small file test\n");
     535:	83 ec 08             	sub    $0x8,%esp
     538:	68 16 44 00 00       	push   $0x4416
     53d:	ff 35 74 63 00 00    	pushl  0x6374
     543:	e8 78 3a 00 00       	call   3fc0 <printf>
  fd = open("small", O_CREATE|O_RDWR);
     548:	59                   	pop    %ecx
     549:	5b                   	pop    %ebx
     54a:	68 02 02 00 00       	push   $0x202
     54f:	68 27 44 00 00       	push   $0x4427
     554:	e8 61 39 00 00       	call   3eba <open>
  if(fd >= 0){
     559:	83 c4 10             	add    $0x10,%esp
     55c:	85 c0                	test   %eax,%eax
     55e:	0f 88 b2 01 00 00    	js     716 <writetest+0x1e6>
    printf(stdout, "creat small succeeded; ok\n");
     564:	83 ec 08             	sub    $0x8,%esp
     567:	89 c6                	mov    %eax,%esi
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit(-1);
  }
  for(i = 0; i < 100; i++){
     569:	31 db                	xor    %ebx,%ebx
  int i;

  printf(stdout, "small file test\n");
  fd = open("small", O_CREATE|O_RDWR);
  if(fd >= 0){
    printf(stdout, "creat small succeeded; ok\n");
     56b:	68 2d 44 00 00       	push   $0x442d
     570:	ff 35 74 63 00 00    	pushl  0x6374
     576:	e8 45 3a 00 00       	call   3fc0 <printf>
     57b:	83 c4 10             	add    $0x10,%esp
     57e:	66 90                	xchg   %ax,%ax
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit(-1);
  }
  for(i = 0; i < 100; i++){
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     580:	83 ec 04             	sub    $0x4,%esp
     583:	6a 0a                	push   $0xa
     585:	68 64 44 00 00       	push   $0x4464
     58a:	56                   	push   %esi
     58b:	e8 0a 39 00 00       	call   3e9a <write>
     590:	83 c4 10             	add    $0x10,%esp
     593:	83 f8 0a             	cmp    $0xa,%eax
     596:	0f 85 dd 00 00 00    	jne    679 <writetest+0x149>
      printf(stdout, "error: write aa %d new file failed\n", i);
      exit(-1);
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     59c:	83 ec 04             	sub    $0x4,%esp
     59f:	6a 0a                	push   $0xa
     5a1:	68 6f 44 00 00       	push   $0x446f
     5a6:	56                   	push   %esi
     5a7:	e8 ee 38 00 00       	call   3e9a <write>
     5ac:	83 c4 10             	add    $0x10,%esp
     5af:	83 f8 0a             	cmp    $0xa,%eax
     5b2:	0f 85 e1 00 00 00    	jne    699 <writetest+0x169>
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit(-1);
  }
  for(i = 0; i < 100; i++){
     5b8:	83 c3 01             	add    $0x1,%ebx
     5bb:	83 fb 64             	cmp    $0x64,%ebx
     5be:	75 c0                	jne    580 <writetest+0x50>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
      printf(stdout, "error: write bb %d new file failed\n", i);
      exit(-1);
    }
  }
  printf(stdout, "writes ok\n");
     5c0:	83 ec 08             	sub    $0x8,%esp
     5c3:	68 7a 44 00 00       	push   $0x447a
     5c8:	ff 35 74 63 00 00    	pushl  0x6374
     5ce:	e8 ed 39 00 00       	call   3fc0 <printf>
  close(fd);
     5d3:	89 34 24             	mov    %esi,(%esp)
     5d6:	e8 c7 38 00 00       	call   3ea2 <close>
  fd = open("small", O_RDONLY);
     5db:	58                   	pop    %eax
     5dc:	5a                   	pop    %edx
     5dd:	6a 00                	push   $0x0
     5df:	68 27 44 00 00       	push   $0x4427
     5e4:	e8 d1 38 00 00       	call   3eba <open>
  if(fd >= 0){
     5e9:	83 c4 10             	add    $0x10,%esp
     5ec:	85 c0                	test   %eax,%eax
      exit(-1);
    }
  }
  printf(stdout, "writes ok\n");
  close(fd);
  fd = open("small", O_RDONLY);
     5ee:	89 c3                	mov    %eax,%ebx
  if(fd >= 0){
     5f0:	0f 88 c3 00 00 00    	js     6b9 <writetest+0x189>
    printf(stdout, "open small succeeded ok\n");
     5f6:	83 ec 08             	sub    $0x8,%esp
     5f9:	68 85 44 00 00       	push   $0x4485
     5fe:	ff 35 74 63 00 00    	pushl  0x6374
     604:	e8 b7 39 00 00       	call   3fc0 <printf>
  } else {
    printf(stdout, "error: open small failed!\n");
    exit(-1);
  }
  i = read(fd, buf, 2000);
     609:	83 c4 0c             	add    $0xc,%esp
     60c:	68 d0 07 00 00       	push   $0x7d0
     611:	68 60 8b 00 00       	push   $0x8b60
     616:	53                   	push   %ebx
     617:	e8 76 38 00 00       	call   3e92 <read>
  if(i == 2000){
     61c:	83 c4 10             	add    $0x10,%esp
     61f:	3d d0 07 00 00       	cmp    $0x7d0,%eax
     624:	0f 85 ae 00 00 00    	jne    6d8 <writetest+0x1a8>
    printf(stdout, "read succeeded ok\n");
     62a:	83 ec 08             	sub    $0x8,%esp
     62d:	68 b9 44 00 00       	push   $0x44b9
     632:	ff 35 74 63 00 00    	pushl  0x6374
     638:	e8 83 39 00 00       	call   3fc0 <printf>
  } else {
    printf(stdout, "read failed\n");
    exit(-1);
  }
  close(fd);
     63d:	89 1c 24             	mov    %ebx,(%esp)
     640:	e8 5d 38 00 00       	call   3ea2 <close>

  if(unlink("small") < 0){
     645:	c7 04 24 27 44 00 00 	movl   $0x4427,(%esp)
     64c:	e8 79 38 00 00       	call   3eca <unlink>
     651:	83 c4 10             	add    $0x10,%esp
     654:	85 c0                	test   %eax,%eax
     656:	0f 88 9b 00 00 00    	js     6f7 <writetest+0x1c7>
    printf(stdout, "unlink small failed\n");
    exit(-1);
  }
  printf(stdout, "small file test ok\n");
     65c:	83 ec 08             	sub    $0x8,%esp
     65f:	68 e1 44 00 00       	push   $0x44e1
     664:	ff 35 74 63 00 00    	pushl  0x6374
     66a:	e8 51 39 00 00       	call   3fc0 <printf>
}
     66f:	83 c4 10             	add    $0x10,%esp
     672:	8d 65 f8             	lea    -0x8(%ebp),%esp
     675:	5b                   	pop    %ebx
     676:	5e                   	pop    %esi
     677:	5d                   	pop    %ebp
     678:	c3                   	ret    
    printf(stdout, "error: creat small failed!\n");
    exit(-1);
  }
  for(i = 0; i < 100; i++){
    if(write(fd, "aaaaaaaaaa", 10) != 10){
      printf(stdout, "error: write aa %d new file failed\n", i);
     679:	83 ec 04             	sub    $0x4,%esp
     67c:	53                   	push   %ebx
     67d:	68 28 53 00 00       	push   $0x5328
     682:	ff 35 74 63 00 00    	pushl  0x6374
     688:	e8 33 39 00 00       	call   3fc0 <printf>
      exit(-1);
     68d:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
     694:	e8 d9 37 00 00       	call   3e72 <exit>
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
      printf(stdout, "error: write bb %d new file failed\n", i);
     699:	83 ec 04             	sub    $0x4,%esp
     69c:	53                   	push   %ebx
     69d:	68 4c 53 00 00       	push   $0x534c
     6a2:	ff 35 74 63 00 00    	pushl  0x6374
     6a8:	e8 13 39 00 00       	call   3fc0 <printf>
      exit(-1);
     6ad:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
     6b4:	e8 b9 37 00 00       	call   3e72 <exit>
  close(fd);
  fd = open("small", O_RDONLY);
  if(fd >= 0){
    printf(stdout, "open small succeeded ok\n");
  } else {
    printf(stdout, "error: open small failed!\n");
     6b9:	83 ec 08             	sub    $0x8,%esp
     6bc:	68 9e 44 00 00       	push   $0x449e
     6c1:	ff 35 74 63 00 00    	pushl  0x6374
     6c7:	e8 f4 38 00 00       	call   3fc0 <printf>
    exit(-1);
     6cc:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
     6d3:	e8 9a 37 00 00       	call   3e72 <exit>
  }
  i = read(fd, buf, 2000);
  if(i == 2000){
    printf(stdout, "read succeeded ok\n");
  } else {
    printf(stdout, "read failed\n");
     6d8:	83 ec 08             	sub    $0x8,%esp
     6db:	68 e5 47 00 00       	push   $0x47e5
     6e0:	ff 35 74 63 00 00    	pushl  0x6374
     6e6:	e8 d5 38 00 00       	call   3fc0 <printf>
    exit(-1);
     6eb:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
     6f2:	e8 7b 37 00 00       	call   3e72 <exit>
  }
  close(fd);

  if(unlink("small") < 0){
    printf(stdout, "unlink small failed\n");
     6f7:	83 ec 08             	sub    $0x8,%esp
     6fa:	68 cc 44 00 00       	push   $0x44cc
     6ff:	ff 35 74 63 00 00    	pushl  0x6374
     705:	e8 b6 38 00 00       	call   3fc0 <printf>
    exit(-1);
     70a:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
     711:	e8 5c 37 00 00       	call   3e72 <exit>
  printf(stdout, "small file test\n");
  fd = open("small", O_CREATE|O_RDWR);
  if(fd >= 0){
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
     716:	83 ec 08             	sub    $0x8,%esp
     719:	68 48 44 00 00       	push   $0x4448
     71e:	ff 35 74 63 00 00    	pushl  0x6374
     724:	e8 97 38 00 00       	call   3fc0 <printf>
    exit(-1);
     729:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
     730:	e8 3d 37 00 00       	call   3e72 <exit>
     735:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     739:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000740 <writetest1>:
  printf(stdout, "small file test ok\n");
}

void
writetest1(void)
{
     740:	55                   	push   %ebp
     741:	89 e5                	mov    %esp,%ebp
     743:	56                   	push   %esi
     744:	53                   	push   %ebx
  int i, fd, n;

  printf(stdout, "big files test\n");
     745:	83 ec 08             	sub    $0x8,%esp
     748:	68 f5 44 00 00       	push   $0x44f5
     74d:	ff 35 74 63 00 00    	pushl  0x6374
     753:	e8 68 38 00 00       	call   3fc0 <printf>

  fd = open("big", O_CREATE|O_RDWR);
     758:	59                   	pop    %ecx
     759:	5b                   	pop    %ebx
     75a:	68 02 02 00 00       	push   $0x202
     75f:	68 6f 45 00 00       	push   $0x456f
     764:	e8 51 37 00 00       	call   3eba <open>
  if(fd < 0){
     769:	83 c4 10             	add    $0x10,%esp
     76c:	85 c0                	test   %eax,%eax
     76e:	0f 88 8b 01 00 00    	js     8ff <writetest1+0x1bf>
     774:	89 c6                	mov    %eax,%esi
     776:	31 db                	xor    %ebx,%ebx
     778:	90                   	nop
     779:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    exit(-1);
  }

  for(i = 0; i < MAXFILE; i++){
    ((int*)buf)[0] = i;
    if(write(fd, buf, 512) != 512){
     780:	83 ec 04             	sub    $0x4,%esp
    printf(stdout, "error: creat big failed!\n");
    exit(-1);
  }

  for(i = 0; i < MAXFILE; i++){
    ((int*)buf)[0] = i;
     783:	89 1d 60 8b 00 00    	mov    %ebx,0x8b60
    if(write(fd, buf, 512) != 512){
     789:	68 00 02 00 00       	push   $0x200
     78e:	68 60 8b 00 00       	push   $0x8b60
     793:	56                   	push   %esi
     794:	e8 01 37 00 00       	call   3e9a <write>
     799:	83 c4 10             	add    $0x10,%esp
     79c:	3d 00 02 00 00       	cmp    $0x200,%eax
     7a1:	0f 85 b7 00 00 00    	jne    85e <writetest1+0x11e>
  if(fd < 0){
    printf(stdout, "error: creat big failed!\n");
    exit(-1);
  }

  for(i = 0; i < MAXFILE; i++){
     7a7:	83 c3 01             	add    $0x1,%ebx
     7aa:	81 fb 8c 00 00 00    	cmp    $0x8c,%ebx
     7b0:	75 ce                	jne    780 <writetest1+0x40>
      printf(stdout, "error: write big file failed\n", i);
      exit(-1);
    }
  }

  close(fd);
     7b2:	83 ec 0c             	sub    $0xc,%esp
     7b5:	56                   	push   %esi
     7b6:	e8 e7 36 00 00       	call   3ea2 <close>

  fd = open("big", O_RDONLY);
     7bb:	58                   	pop    %eax
     7bc:	5a                   	pop    %edx
     7bd:	6a 00                	push   $0x0
     7bf:	68 6f 45 00 00       	push   $0x456f
     7c4:	e8 f1 36 00 00       	call   3eba <open>
  if(fd < 0){
     7c9:	83 c4 10             	add    $0x10,%esp
     7cc:	85 c0                	test   %eax,%eax
    }
  }

  close(fd);

  fd = open("big", O_RDONLY);
     7ce:	89 c6                	mov    %eax,%esi
  if(fd < 0){
     7d0:	0f 88 0a 01 00 00    	js     8e0 <writetest1+0x1a0>
     7d6:	31 db                	xor    %ebx,%ebx
     7d8:	eb 21                	jmp    7fb <writetest1+0xbb>
     7da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(n == MAXFILE - 1){
        printf(stdout, "read only %d blocks from big", n);
        exit(0);
      }
      break;
    } else if(i != 512){
     7e0:	3d 00 02 00 00       	cmp    $0x200,%eax
     7e5:	0f 85 b1 00 00 00    	jne    89c <writetest1+0x15c>
      printf(stdout, "read failed %d\n", i);
      exit(-1);
    }
    if(((int*)buf)[0] != n){
     7eb:	a1 60 8b 00 00       	mov    0x8b60,%eax
     7f0:	39 c3                	cmp    %eax,%ebx
     7f2:	0f 85 86 00 00 00    	jne    87e <writetest1+0x13e>
      printf(stdout, "read content of block %d is %d\n",
             n, ((int*)buf)[0]);
      exit(0);
    }
    n++;
     7f8:	83 c3 01             	add    $0x1,%ebx
    exit(-1);
  }

  n = 0;
  for(;;){
    i = read(fd, buf, 512);
     7fb:	83 ec 04             	sub    $0x4,%esp
     7fe:	68 00 02 00 00       	push   $0x200
     803:	68 60 8b 00 00       	push   $0x8b60
     808:	56                   	push   %esi
     809:	e8 84 36 00 00       	call   3e92 <read>
    if(i == 0){
     80e:	83 c4 10             	add    $0x10,%esp
     811:	85 c0                	test   %eax,%eax
     813:	75 cb                	jne    7e0 <writetest1+0xa0>
      if(n == MAXFILE - 1){
     815:	81 fb 8b 00 00 00    	cmp    $0x8b,%ebx
     81b:	0f 84 9b 00 00 00    	je     8bc <writetest1+0x17c>
             n, ((int*)buf)[0]);
      exit(0);
    }
    n++;
  }
  close(fd);
     821:	83 ec 0c             	sub    $0xc,%esp
     824:	56                   	push   %esi
     825:	e8 78 36 00 00       	call   3ea2 <close>
  if(unlink("big") < 0){
     82a:	c7 04 24 6f 45 00 00 	movl   $0x456f,(%esp)
     831:	e8 94 36 00 00       	call   3eca <unlink>
     836:	83 c4 10             	add    $0x10,%esp
     839:	85 c0                	test   %eax,%eax
     83b:	0f 88 dd 00 00 00    	js     91e <writetest1+0x1de>
    printf(stdout, "unlink big failed\n");
    exit(-1);
  }
  printf(stdout, "big files ok\n");
     841:	83 ec 08             	sub    $0x8,%esp
     844:	68 96 45 00 00       	push   $0x4596
     849:	ff 35 74 63 00 00    	pushl  0x6374
     84f:	e8 6c 37 00 00       	call   3fc0 <printf>
}
     854:	83 c4 10             	add    $0x10,%esp
     857:	8d 65 f8             	lea    -0x8(%ebp),%esp
     85a:	5b                   	pop    %ebx
     85b:	5e                   	pop    %esi
     85c:	5d                   	pop    %ebp
     85d:	c3                   	ret    
  }

  for(i = 0; i < MAXFILE; i++){
    ((int*)buf)[0] = i;
    if(write(fd, buf, 512) != 512){
      printf(stdout, "error: write big file failed\n", i);
     85e:	83 ec 04             	sub    $0x4,%esp
     861:	53                   	push   %ebx
     862:	68 1f 45 00 00       	push   $0x451f
     867:	ff 35 74 63 00 00    	pushl  0x6374
     86d:	e8 4e 37 00 00       	call   3fc0 <printf>
      exit(-1);
     872:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
     879:	e8 f4 35 00 00       	call   3e72 <exit>
    } else if(i != 512){
      printf(stdout, "read failed %d\n", i);
      exit(-1);
    }
    if(((int*)buf)[0] != n){
      printf(stdout, "read content of block %d is %d\n",
     87e:	50                   	push   %eax
     87f:	53                   	push   %ebx
     880:	68 70 53 00 00       	push   $0x5370
     885:	ff 35 74 63 00 00    	pushl  0x6374
     88b:	e8 30 37 00 00       	call   3fc0 <printf>
             n, ((int*)buf)[0]);
      exit(0);
     890:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     897:	e8 d6 35 00 00       	call   3e72 <exit>
        printf(stdout, "read only %d blocks from big", n);
        exit(0);
      }
      break;
    } else if(i != 512){
      printf(stdout, "read failed %d\n", i);
     89c:	83 ec 04             	sub    $0x4,%esp
     89f:	50                   	push   %eax
     8a0:	68 73 45 00 00       	push   $0x4573
     8a5:	ff 35 74 63 00 00    	pushl  0x6374
     8ab:	e8 10 37 00 00       	call   3fc0 <printf>
      exit(-1);
     8b0:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
     8b7:	e8 b6 35 00 00       	call   3e72 <exit>
  n = 0;
  for(;;){
    i = read(fd, buf, 512);
    if(i == 0){
      if(n == MAXFILE - 1){
        printf(stdout, "read only %d blocks from big", n);
     8bc:	83 ec 04             	sub    $0x4,%esp
     8bf:	68 8b 00 00 00       	push   $0x8b
     8c4:	68 56 45 00 00       	push   $0x4556
     8c9:	ff 35 74 63 00 00    	pushl  0x6374
     8cf:	e8 ec 36 00 00       	call   3fc0 <printf>
        exit(0);
     8d4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     8db:	e8 92 35 00 00       	call   3e72 <exit>

  close(fd);

  fd = open("big", O_RDONLY);
  if(fd < 0){
    printf(stdout, "error: open big failed!\n");
     8e0:	83 ec 08             	sub    $0x8,%esp
     8e3:	68 3d 45 00 00       	push   $0x453d
     8e8:	ff 35 74 63 00 00    	pushl  0x6374
     8ee:	e8 cd 36 00 00       	call   3fc0 <printf>
    exit(-1);
     8f3:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
     8fa:	e8 73 35 00 00       	call   3e72 <exit>

  printf(stdout, "big files test\n");

  fd = open("big", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(stdout, "error: creat big failed!\n");
     8ff:	83 ec 08             	sub    $0x8,%esp
     902:	68 05 45 00 00       	push   $0x4505
     907:	ff 35 74 63 00 00    	pushl  0x6374
     90d:	e8 ae 36 00 00       	call   3fc0 <printf>
    exit(-1);
     912:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
     919:	e8 54 35 00 00       	call   3e72 <exit>
    }
    n++;
  }
  close(fd);
  if(unlink("big") < 0){
    printf(stdout, "unlink big failed\n");
     91e:	83 ec 08             	sub    $0x8,%esp
     921:	68 83 45 00 00       	push   $0x4583
     926:	ff 35 74 63 00 00    	pushl  0x6374
     92c:	e8 8f 36 00 00       	call   3fc0 <printf>
    exit(-1);
     931:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
     938:	e8 35 35 00 00       	call   3e72 <exit>
     93d:	8d 76 00             	lea    0x0(%esi),%esi

00000940 <createtest>:
  printf(stdout, "big files ok\n");
}

void
createtest(void)
{
     940:	55                   	push   %ebp
     941:	89 e5                	mov    %esp,%ebp
     943:	53                   	push   %ebx
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
     944:	bb 30 00 00 00       	mov    $0x30,%ebx
  printf(stdout, "big files ok\n");
}

void
createtest(void)
{
     949:	83 ec 0c             	sub    $0xc,%esp
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");
     94c:	68 90 53 00 00       	push   $0x5390
     951:	ff 35 74 63 00 00    	pushl  0x6374
     957:	e8 64 36 00 00       	call   3fc0 <printf>

  name[0] = 'a';
     95c:	c6 05 60 ab 00 00 61 	movb   $0x61,0xab60
  name[2] = '\0';
     963:	c6 05 62 ab 00 00 00 	movb   $0x0,0xab62
     96a:	83 c4 10             	add    $0x10,%esp
     96d:	8d 76 00             	lea    0x0(%esi),%esi
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
    fd = open(name, O_CREATE|O_RDWR);
     970:	83 ec 08             	sub    $0x8,%esp
  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
     973:	88 1d 61 ab 00 00    	mov    %bl,0xab61
     979:	83 c3 01             	add    $0x1,%ebx
    fd = open(name, O_CREATE|O_RDWR);
     97c:	68 02 02 00 00       	push   $0x202
     981:	68 60 ab 00 00       	push   $0xab60
     986:	e8 2f 35 00 00       	call   3eba <open>
    close(fd);
     98b:	89 04 24             	mov    %eax,(%esp)
     98e:	e8 0f 35 00 00       	call   3ea2 <close>

  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     993:	83 c4 10             	add    $0x10,%esp
     996:	80 fb 64             	cmp    $0x64,%bl
     999:	75 d5                	jne    970 <createtest+0x30>
    name[1] = '0' + i;
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
     99b:	c6 05 60 ab 00 00 61 	movb   $0x61,0xab60
  name[2] = '\0';
     9a2:	c6 05 62 ab 00 00 00 	movb   $0x0,0xab62
     9a9:	bb 30 00 00 00       	mov    $0x30,%ebx
     9ae:	66 90                	xchg   %ax,%ax
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
    unlink(name);
     9b0:	83 ec 0c             	sub    $0xc,%esp
    close(fd);
  }
  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
     9b3:	88 1d 61 ab 00 00    	mov    %bl,0xab61
     9b9:	83 c3 01             	add    $0x1,%ebx
    unlink(name);
     9bc:	68 60 ab 00 00       	push   $0xab60
     9c1:	e8 04 35 00 00       	call   3eca <unlink>
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     9c6:	83 c4 10             	add    $0x10,%esp
     9c9:	80 fb 64             	cmp    $0x64,%bl
     9cc:	75 e2                	jne    9b0 <createtest+0x70>
    name[1] = '0' + i;
    unlink(name);
  }
  printf(stdout, "many creates, followed by unlink; ok\n");
     9ce:	83 ec 08             	sub    $0x8,%esp
     9d1:	68 b8 53 00 00       	push   $0x53b8
     9d6:	ff 35 74 63 00 00    	pushl  0x6374
     9dc:	e8 df 35 00 00       	call   3fc0 <printf>
}
     9e1:	83 c4 10             	add    $0x10,%esp
     9e4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     9e7:	c9                   	leave  
     9e8:	c3                   	ret    
     9e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000009f0 <dirtest>:

void dirtest(void)
{
     9f0:	55                   	push   %ebp
     9f1:	89 e5                	mov    %esp,%ebp
     9f3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "mkdir test\n");
     9f6:	68 a4 45 00 00       	push   $0x45a4
     9fb:	ff 35 74 63 00 00    	pushl  0x6374
     a01:	e8 ba 35 00 00       	call   3fc0 <printf>

  if(mkdir("dir0") < 0){
     a06:	c7 04 24 b0 45 00 00 	movl   $0x45b0,(%esp)
     a0d:	e8 d0 34 00 00       	call   3ee2 <mkdir>
     a12:	83 c4 10             	add    $0x10,%esp
     a15:	85 c0                	test   %eax,%eax
     a17:	78 58                	js     a71 <dirtest+0x81>
    printf(stdout, "mkdir failed\n");
    exit(-1);
  }

  if(chdir("dir0") < 0){
     a19:	83 ec 0c             	sub    $0xc,%esp
     a1c:	68 b0 45 00 00       	push   $0x45b0
     a21:	e8 c4 34 00 00       	call   3eea <chdir>
     a26:	83 c4 10             	add    $0x10,%esp
     a29:	85 c0                	test   %eax,%eax
     a2b:	0f 88 9a 00 00 00    	js     acb <dirtest+0xdb>
    printf(stdout, "chdir dir0 failed\n");
    exit(-1);
  }

  if(chdir("..") < 0){
     a31:	83 ec 0c             	sub    $0xc,%esp
     a34:	68 55 4b 00 00       	push   $0x4b55
     a39:	e8 ac 34 00 00       	call   3eea <chdir>
     a3e:	83 c4 10             	add    $0x10,%esp
     a41:	85 c0                	test   %eax,%eax
     a43:	78 68                	js     aad <dirtest+0xbd>
    printf(stdout, "chdir .. failed\n");
    exit(-1);
  }

  if(unlink("dir0") < 0){
     a45:	83 ec 0c             	sub    $0xc,%esp
     a48:	68 b0 45 00 00       	push   $0x45b0
     a4d:	e8 78 34 00 00       	call   3eca <unlink>
     a52:	83 c4 10             	add    $0x10,%esp
     a55:	85 c0                	test   %eax,%eax
     a57:	78 36                	js     a8f <dirtest+0x9f>
    printf(stdout, "unlink dir0 failed\n");
    exit(-1);
  }
  printf(stdout, "mkdir test ok\n");
     a59:	83 ec 08             	sub    $0x8,%esp
     a5c:	68 ed 45 00 00       	push   $0x45ed
     a61:	ff 35 74 63 00 00    	pushl  0x6374
     a67:	e8 54 35 00 00       	call   3fc0 <printf>
}
     a6c:	83 c4 10             	add    $0x10,%esp
     a6f:	c9                   	leave  
     a70:	c3                   	ret    
void dirtest(void)
{
  printf(stdout, "mkdir test\n");

  if(mkdir("dir0") < 0){
    printf(stdout, "mkdir failed\n");
     a71:	50                   	push   %eax
     a72:	50                   	push   %eax
     a73:	68 e0 42 00 00       	push   $0x42e0
     a78:	ff 35 74 63 00 00    	pushl  0x6374
     a7e:	e8 3d 35 00 00       	call   3fc0 <printf>
    exit(-1);
     a83:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
     a8a:	e8 e3 33 00 00       	call   3e72 <exit>
    printf(stdout, "chdir .. failed\n");
    exit(-1);
  }

  if(unlink("dir0") < 0){
    printf(stdout, "unlink dir0 failed\n");
     a8f:	50                   	push   %eax
     a90:	50                   	push   %eax
     a91:	68 d9 45 00 00       	push   $0x45d9
     a96:	ff 35 74 63 00 00    	pushl  0x6374
     a9c:	e8 1f 35 00 00       	call   3fc0 <printf>
    exit(-1);
     aa1:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
     aa8:	e8 c5 33 00 00       	call   3e72 <exit>
    printf(stdout, "chdir dir0 failed\n");
    exit(-1);
  }

  if(chdir("..") < 0){
    printf(stdout, "chdir .. failed\n");
     aad:	52                   	push   %edx
     aae:	52                   	push   %edx
     aaf:	68 c8 45 00 00       	push   $0x45c8
     ab4:	ff 35 74 63 00 00    	pushl  0x6374
     aba:	e8 01 35 00 00       	call   3fc0 <printf>
    exit(-1);
     abf:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
     ac6:	e8 a7 33 00 00       	call   3e72 <exit>
    printf(stdout, "mkdir failed\n");
    exit(-1);
  }

  if(chdir("dir0") < 0){
    printf(stdout, "chdir dir0 failed\n");
     acb:	51                   	push   %ecx
     acc:	51                   	push   %ecx
     acd:	68 b5 45 00 00       	push   $0x45b5
     ad2:	ff 35 74 63 00 00    	pushl  0x6374
     ad8:	e8 e3 34 00 00       	call   3fc0 <printf>
    exit(-1);
     add:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
     ae4:	e8 89 33 00 00       	call   3e72 <exit>
     ae9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000af0 <exectest>:
  printf(stdout, "mkdir test ok\n");
}

void
exectest(void)
{
     af0:	55                   	push   %ebp
     af1:	89 e5                	mov    %esp,%ebp
     af3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "exec test\n");
     af6:	68 fc 45 00 00       	push   $0x45fc
     afb:	ff 35 74 63 00 00    	pushl  0x6374
     b01:	e8 ba 34 00 00       	call   3fc0 <printf>
  if(exec("echo", echoargv) < 0){
     b06:	5a                   	pop    %edx
     b07:	59                   	pop    %ecx
     b08:	68 78 63 00 00       	push   $0x6378
     b0d:	68 c5 43 00 00       	push   $0x43c5
     b12:	e8 9b 33 00 00       	call   3eb2 <exec>
     b17:	83 c4 10             	add    $0x10,%esp
     b1a:	85 c0                	test   %eax,%eax
     b1c:	78 02                	js     b20 <exectest+0x30>
    printf(stdout, "exec echo failed\n");
    exit(-1);
  }
}
     b1e:	c9                   	leave  
     b1f:	c3                   	ret    
void
exectest(void)
{
  printf(stdout, "exec test\n");
  if(exec("echo", echoargv) < 0){
    printf(stdout, "exec echo failed\n");
     b20:	50                   	push   %eax
     b21:	50                   	push   %eax
     b22:	68 07 46 00 00       	push   $0x4607
     b27:	ff 35 74 63 00 00    	pushl  0x6374
     b2d:	e8 8e 34 00 00       	call   3fc0 <printf>
    exit(-1);
     b32:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
     b39:	e8 34 33 00 00       	call   3e72 <exit>
     b3e:	66 90                	xchg   %ax,%ax

00000b40 <pipe1>:

// simple fork and pipe read/write

void
pipe1(void)
{
     b40:	55                   	push   %ebp
     b41:	89 e5                	mov    %esp,%ebp
     b43:	57                   	push   %edi
     b44:	56                   	push   %esi
     b45:	53                   	push   %ebx
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
     b46:	8d 45 e0             	lea    -0x20(%ebp),%eax

// simple fork and pipe read/write

void
pipe1(void)
{
     b49:	83 ec 38             	sub    $0x38,%esp
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
     b4c:	50                   	push   %eax
     b4d:	e8 38 33 00 00       	call   3e8a <pipe>
     b52:	83 c4 10             	add    $0x10,%esp
     b55:	85 c0                	test   %eax,%eax
     b57:	0f 85 4c 01 00 00    	jne    ca9 <pipe1+0x169>
    printf(1, "pipe() failed\n");
    exit(-1);
  }
  pid = fork();
     b5d:	e8 08 33 00 00       	call   3e6a <fork>
  seq = 0;
  if(pid == 0){
     b62:	83 f8 00             	cmp    $0x0,%eax
     b65:	0f 84 86 00 00 00    	je     bf1 <pipe1+0xb1>
        printf(1, "pipe1 oops 1\n");
        exit(-1);
      }
    }
    exit(0);
  } else if(pid > 0){
     b6b:	0f 8e 53 01 00 00    	jle    cc4 <pipe1+0x184>
    close(fds[1]);
     b71:	83 ec 0c             	sub    $0xc,%esp
     b74:	ff 75 e4             	pushl  -0x1c(%ebp)
    total = 0;
    cc = 1;
     b77:	bf 01 00 00 00       	mov    $0x1,%edi
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit(-1);
  }
  pid = fork();
  seq = 0;
     b7c:	31 db                	xor    %ebx,%ebx
        exit(-1);
      }
    }
    exit(0);
  } else if(pid > 0){
    close(fds[1]);
     b7e:	e8 1f 33 00 00       	call   3ea2 <close>
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
     b83:	83 c4 10             	add    $0x10,%esp
      }
    }
    exit(0);
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
     b86:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
     b8d:	83 ec 04             	sub    $0x4,%esp
     b90:	57                   	push   %edi
     b91:	68 60 8b 00 00       	push   $0x8b60
     b96:	ff 75 e0             	pushl  -0x20(%ebp)
     b99:	e8 f4 32 00 00       	call   3e92 <read>
     b9e:	83 c4 10             	add    $0x10,%esp
     ba1:	85 c0                	test   %eax,%eax
     ba3:	0f 8e ac 00 00 00    	jle    c55 <pipe1+0x115>
      for(i = 0; i < n; i++){
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     ba9:	89 d9                	mov    %ebx,%ecx
     bab:	8d 34 18             	lea    (%eax,%ebx,1),%esi
     bae:	f7 d9                	neg    %ecx
     bb0:	38 9c 0b 60 8b 00 00 	cmp    %bl,0x8b60(%ebx,%ecx,1)
     bb7:	8d 53 01             	lea    0x1(%ebx),%edx
     bba:	75 1b                	jne    bd7 <pipe1+0x97>
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
      for(i = 0; i < n; i++){
     bbc:	39 f2                	cmp    %esi,%edx
     bbe:	89 d3                	mov    %edx,%ebx
     bc0:	75 ee                	jne    bb0 <pipe1+0x70>
          printf(1, "pipe1 oops 2\n");
          return;
        }
      }
      total += n;
      cc = cc * 2;
     bc2:	01 ff                	add    %edi,%edi
        if((buf[i] & 0xff) != (seq++ & 0xff)){
          printf(1, "pipe1 oops 2\n");
          return;
        }
      }
      total += n;
     bc4:	01 45 d4             	add    %eax,-0x2c(%ebp)
     bc7:	b8 00 20 00 00       	mov    $0x2000,%eax
     bcc:	81 ff 00 20 00 00    	cmp    $0x2000,%edi
     bd2:	0f 4f f8             	cmovg  %eax,%edi
     bd5:	eb b6                	jmp    b8d <pipe1+0x4d>
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
      for(i = 0; i < n; i++){
        if((buf[i] & 0xff) != (seq++ & 0xff)){
          printf(1, "pipe1 oops 2\n");
     bd7:	83 ec 08             	sub    $0x8,%esp
     bda:	68 36 46 00 00       	push   $0x4636
     bdf:	6a 01                	push   $0x1
     be1:	e8 da 33 00 00       	call   3fc0 <printf>
          return;
     be6:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(1, "fork() failed\n");
    exit(-1);
  }
  printf(1, "pipe1 ok\n");
}
     be9:	8d 65 f4             	lea    -0xc(%ebp),%esp
     bec:	5b                   	pop    %ebx
     bed:	5e                   	pop    %esi
     bee:	5f                   	pop    %edi
     bef:	5d                   	pop    %ebp
     bf0:	c3                   	ret    
    exit(-1);
  }
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
     bf1:	83 ec 0c             	sub    $0xc,%esp
     bf4:	ff 75 e0             	pushl  -0x20(%ebp)
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit(-1);
  }
  pid = fork();
  seq = 0;
     bf7:	31 f6                	xor    %esi,%esi
  if(pid == 0){
    close(fds[0]);
     bf9:	e8 a4 32 00 00       	call   3ea2 <close>
     bfe:	83 c4 10             	add    $0x10,%esp
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
        buf[i] = seq++;
     c01:	89 f0                	mov    %esi,%eax
     c03:	8d 96 09 04 00 00    	lea    0x409(%esi),%edx

// simple fork and pipe read/write

void
pipe1(void)
{
     c09:	89 f3                	mov    %esi,%ebx
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
        buf[i] = seq++;
     c0b:	f7 d8                	neg    %eax
     c0d:	8d 76 00             	lea    0x0(%esi),%esi
     c10:	88 9c 18 60 8b 00 00 	mov    %bl,0x8b60(%eax,%ebx,1)
     c17:	83 c3 01             	add    $0x1,%ebx
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
     c1a:	39 d3                	cmp    %edx,%ebx
     c1c:	75 f2                	jne    c10 <pipe1+0xd0>
        buf[i] = seq++;
      if(write(fds[1], buf, 1033) != 1033){
     c1e:	83 ec 04             	sub    $0x4,%esp
     c21:	89 de                	mov    %ebx,%esi
     c23:	68 09 04 00 00       	push   $0x409
     c28:	68 60 8b 00 00       	push   $0x8b60
     c2d:	ff 75 e4             	pushl  -0x1c(%ebp)
     c30:	e8 65 32 00 00       	call   3e9a <write>
     c35:	83 c4 10             	add    $0x10,%esp
     c38:	3d 09 04 00 00       	cmp    $0x409,%eax
     c3d:	0f 85 9c 00 00 00    	jne    cdf <pipe1+0x19f>
  }
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
     c43:	81 fb 2d 14 00 00    	cmp    $0x142d,%ebx
     c49:	75 b6                	jne    c01 <pipe1+0xc1>
      if(write(fds[1], buf, 1033) != 1033){
        printf(1, "pipe1 oops 1\n");
        exit(-1);
      }
    }
    exit(0);
     c4b:	83 ec 0c             	sub    $0xc,%esp
     c4e:	6a 00                	push   $0x0
     c50:	e8 1d 32 00 00       	call   3e72 <exit>
      total += n;
      cc = cc * 2;
      if(cc > sizeof(buf))
        cc = sizeof(buf);
    }
    if(total != 5 * 1033){
     c55:	81 7d d4 2d 14 00 00 	cmpl   $0x142d,-0x2c(%ebp)
     c5c:	75 2d                	jne    c8b <pipe1+0x14b>
      printf(1, "pipe1 oops 3 total %d\n", total);
      exit(-1);
    }
    close(fds[0]);
     c5e:	83 ec 0c             	sub    $0xc,%esp
     c61:	ff 75 e0             	pushl  -0x20(%ebp)
     c64:	e8 39 32 00 00       	call   3ea2 <close>
    wait(0);
     c69:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     c70:	e8 05 32 00 00       	call   3e7a <wait>
  } else {
    printf(1, "fork() failed\n");
    exit(-1);
  }
  printf(1, "pipe1 ok\n");
     c75:	58                   	pop    %eax
     c76:	5a                   	pop    %edx
     c77:	68 5b 46 00 00       	push   $0x465b
     c7c:	6a 01                	push   $0x1
     c7e:	e8 3d 33 00 00       	call   3fc0 <printf>
     c83:	83 c4 10             	add    $0x10,%esp
     c86:	e9 5e ff ff ff       	jmp    be9 <pipe1+0xa9>
      cc = cc * 2;
      if(cc > sizeof(buf))
        cc = sizeof(buf);
    }
    if(total != 5 * 1033){
      printf(1, "pipe1 oops 3 total %d\n", total);
     c8b:	83 ec 04             	sub    $0x4,%esp
     c8e:	ff 75 d4             	pushl  -0x2c(%ebp)
     c91:	68 44 46 00 00       	push   $0x4644
     c96:	6a 01                	push   $0x1
     c98:	e8 23 33 00 00       	call   3fc0 <printf>
      exit(-1);
     c9d:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
     ca4:	e8 c9 31 00 00       	call   3e72 <exit>
{
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
     ca9:	83 ec 08             	sub    $0x8,%esp
     cac:	68 19 46 00 00       	push   $0x4619
     cb1:	6a 01                	push   $0x1
     cb3:	e8 08 33 00 00       	call   3fc0 <printf>
    exit(-1);
     cb8:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
     cbf:	e8 ae 31 00 00       	call   3e72 <exit>
      exit(-1);
    }
    close(fds[0]);
    wait(0);
  } else {
    printf(1, "fork() failed\n");
     cc4:	83 ec 08             	sub    $0x8,%esp
     cc7:	68 65 46 00 00       	push   $0x4665
     ccc:	6a 01                	push   $0x1
     cce:	e8 ed 32 00 00       	call   3fc0 <printf>
    exit(-1);
     cd3:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
     cda:	e8 93 31 00 00       	call   3e72 <exit>
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
        buf[i] = seq++;
      if(write(fds[1], buf, 1033) != 1033){
        printf(1, "pipe1 oops 1\n");
     cdf:	83 ec 08             	sub    $0x8,%esp
     ce2:	68 28 46 00 00       	push   $0x4628
     ce7:	6a 01                	push   $0x1
     ce9:	e8 d2 32 00 00       	call   3fc0 <printf>
        exit(-1);
     cee:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
     cf5:	e8 78 31 00 00       	call   3e72 <exit>
     cfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000d00 <preempt>:
}

// meant to be run w/ at most two CPUs
void
preempt(void)
{
     d00:	55                   	push   %ebp
     d01:	89 e5                	mov    %esp,%ebp
     d03:	57                   	push   %edi
     d04:	56                   	push   %esi
     d05:	53                   	push   %ebx
     d06:	83 ec 24             	sub    $0x24,%esp
  int pid1, pid2, pid3;
  int pfds[2];

  printf(1, "preempt: ");
     d09:	68 74 46 00 00       	push   $0x4674
     d0e:	6a 01                	push   $0x1
     d10:	e8 ab 32 00 00       	call   3fc0 <printf>
  pid1 = fork();
     d15:	e8 50 31 00 00       	call   3e6a <fork>
  if(pid1 == 0)
     d1a:	83 c4 10             	add    $0x10,%esp
     d1d:	85 c0                	test   %eax,%eax
     d1f:	75 02                	jne    d23 <preempt+0x23>
     d21:	eb fe                	jmp    d21 <preempt+0x21>
     d23:	89 c7                	mov    %eax,%edi
    for(;;)
      ;

  pid2 = fork();
     d25:	e8 40 31 00 00       	call   3e6a <fork>
  if(pid2 == 0)
     d2a:	85 c0                	test   %eax,%eax
  pid1 = fork();
  if(pid1 == 0)
    for(;;)
      ;

  pid2 = fork();
     d2c:	89 c6                	mov    %eax,%esi
  if(pid2 == 0)
     d2e:	75 02                	jne    d32 <preempt+0x32>
     d30:	eb fe                	jmp    d30 <preempt+0x30>
    for(;;)
      ;

  pipe(pfds);
     d32:	8d 45 e0             	lea    -0x20(%ebp),%eax
     d35:	83 ec 0c             	sub    $0xc,%esp
     d38:	50                   	push   %eax
     d39:	e8 4c 31 00 00       	call   3e8a <pipe>
  pid3 = fork();
     d3e:	e8 27 31 00 00       	call   3e6a <fork>
  if(pid3 == 0){
     d43:	83 c4 10             	add    $0x10,%esp
     d46:	85 c0                	test   %eax,%eax
  if(pid2 == 0)
    for(;;)
      ;

  pipe(pfds);
  pid3 = fork();
     d48:	89 c3                	mov    %eax,%ebx
  if(pid3 == 0){
     d4a:	75 47                	jne    d93 <preempt+0x93>
    close(pfds[0]);
     d4c:	83 ec 0c             	sub    $0xc,%esp
     d4f:	ff 75 e0             	pushl  -0x20(%ebp)
     d52:	e8 4b 31 00 00       	call   3ea2 <close>
    if(write(pfds[1], "x", 1) != 1)
     d57:	83 c4 0c             	add    $0xc,%esp
     d5a:	6a 01                	push   $0x1
     d5c:	68 39 4c 00 00       	push   $0x4c39
     d61:	ff 75 e4             	pushl  -0x1c(%ebp)
     d64:	e8 31 31 00 00       	call   3e9a <write>
     d69:	83 c4 10             	add    $0x10,%esp
     d6c:	83 f8 01             	cmp    $0x1,%eax
     d6f:	74 12                	je     d83 <preempt+0x83>
      printf(1, "preempt write error");
     d71:	83 ec 08             	sub    $0x8,%esp
     d74:	68 7e 46 00 00       	push   $0x467e
     d79:	6a 01                	push   $0x1
     d7b:	e8 40 32 00 00       	call   3fc0 <printf>
     d80:	83 c4 10             	add    $0x10,%esp
    close(pfds[1]);
     d83:	83 ec 0c             	sub    $0xc,%esp
     d86:	ff 75 e4             	pushl  -0x1c(%ebp)
     d89:	e8 14 31 00 00       	call   3ea2 <close>
     d8e:	83 c4 10             	add    $0x10,%esp
     d91:	eb fe                	jmp    d91 <preempt+0x91>
    for(;;)
      ;
  }

  close(pfds[1]);
     d93:	83 ec 0c             	sub    $0xc,%esp
     d96:	ff 75 e4             	pushl  -0x1c(%ebp)
     d99:	e8 04 31 00 00       	call   3ea2 <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     d9e:	83 c4 0c             	add    $0xc,%esp
     da1:	68 00 20 00 00       	push   $0x2000
     da6:	68 60 8b 00 00       	push   $0x8b60
     dab:	ff 75 e0             	pushl  -0x20(%ebp)
     dae:	e8 df 30 00 00       	call   3e92 <read>
     db3:	83 c4 10             	add    $0x10,%esp
     db6:	83 f8 01             	cmp    $0x1,%eax
     db9:	74 1a                	je     dd5 <preempt+0xd5>
    printf(1, "preempt read error");
     dbb:	83 ec 08             	sub    $0x8,%esp
     dbe:	68 92 46 00 00       	push   $0x4692
     dc3:	6a 01                	push   $0x1
     dc5:	e8 f6 31 00 00       	call   3fc0 <printf>
    return;
     dca:	83 c4 10             	add    $0x10,%esp
  printf(1, "wait... ");
  wait(0);
  wait(0);
  wait(0);
  printf(1, "preempt ok\n");
}
     dcd:	8d 65 f4             	lea    -0xc(%ebp),%esp
     dd0:	5b                   	pop    %ebx
     dd1:	5e                   	pop    %esi
     dd2:	5f                   	pop    %edi
     dd3:	5d                   	pop    %ebp
     dd4:	c3                   	ret    
  close(pfds[1]);
  if(read(pfds[0], buf, sizeof(buf)) != 1){
    printf(1, "preempt read error");
    return;
  }
  close(pfds[0]);
     dd5:	83 ec 0c             	sub    $0xc,%esp
     dd8:	ff 75 e0             	pushl  -0x20(%ebp)
     ddb:	e8 c2 30 00 00       	call   3ea2 <close>
  printf(1, "kill... ");
     de0:	58                   	pop    %eax
     de1:	5a                   	pop    %edx
     de2:	68 a5 46 00 00       	push   $0x46a5
     de7:	6a 01                	push   $0x1
     de9:	e8 d2 31 00 00       	call   3fc0 <printf>
  kill(pid1);
     dee:	89 3c 24             	mov    %edi,(%esp)
     df1:	e8 b4 30 00 00       	call   3eaa <kill>
  kill(pid2);
     df6:	89 34 24             	mov    %esi,(%esp)
     df9:	e8 ac 30 00 00       	call   3eaa <kill>
  kill(pid3);
     dfe:	89 1c 24             	mov    %ebx,(%esp)
     e01:	e8 a4 30 00 00       	call   3eaa <kill>
  printf(1, "wait... ");
     e06:	59                   	pop    %ecx
     e07:	5b                   	pop    %ebx
     e08:	68 ae 46 00 00       	push   $0x46ae
     e0d:	6a 01                	push   $0x1
     e0f:	e8 ac 31 00 00       	call   3fc0 <printf>
  wait(0);
     e14:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     e1b:	e8 5a 30 00 00       	call   3e7a <wait>
  wait(0);
     e20:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     e27:	e8 4e 30 00 00       	call   3e7a <wait>
  wait(0);
     e2c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     e33:	e8 42 30 00 00       	call   3e7a <wait>
  printf(1, "preempt ok\n");
     e38:	5e                   	pop    %esi
     e39:	5f                   	pop    %edi
     e3a:	68 b7 46 00 00       	push   $0x46b7
     e3f:	6a 01                	push   $0x1
     e41:	e8 7a 31 00 00       	call   3fc0 <printf>
     e46:	83 c4 10             	add    $0x10,%esp
     e49:	eb 82                	jmp    dcd <preempt+0xcd>
     e4b:	90                   	nop
     e4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000e50 <exitwait>:
}

// try to find any races between exit and wait
void
exitwait(void)
{
     e50:	55                   	push   %ebp
     e51:	89 e5                	mov    %esp,%ebp
     e53:	56                   	push   %esi
     e54:	be 64 00 00 00       	mov    $0x64,%esi
     e59:	53                   	push   %ebx
     e5a:	eb 1c                	jmp    e78 <exitwait+0x28>
     e5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
      return;
    }
    if(pid){
     e60:	74 77                	je     ed9 <exitwait+0x89>
      if(wait(0) != pid){
     e62:	83 ec 0c             	sub    $0xc,%esp
     e65:	6a 00                	push   $0x0
     e67:	e8 0e 30 00 00       	call   3e7a <wait>
     e6c:	83 c4 10             	add    $0x10,%esp
     e6f:	39 c3                	cmp    %eax,%ebx
     e71:	75 2d                	jne    ea0 <exitwait+0x50>
void
exitwait(void)
{
  int i, pid;

  for(i = 0; i < 100; i++){
     e73:	83 ee 01             	sub    $0x1,%esi
     e76:	74 48                	je     ec0 <exitwait+0x70>
    pid = fork();
     e78:	e8 ed 2f 00 00       	call   3e6a <fork>
    if(pid < 0){
     e7d:	85 c0                	test   %eax,%eax
exitwait(void)
{
  int i, pid;

  for(i = 0; i < 100; i++){
    pid = fork();
     e7f:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
     e81:	79 dd                	jns    e60 <exitwait+0x10>
      printf(1, "fork failed\n");
     e83:	83 ec 08             	sub    $0x8,%esp
     e86:	68 21 52 00 00       	push   $0x5221
     e8b:	6a 01                	push   $0x1
     e8d:	e8 2e 31 00 00       	call   3fc0 <printf>
      return;
     e92:	83 c4 10             	add    $0x10,%esp
    } else {
      exit(0);
    }
  }
  printf(1, "exitwait ok\n");
}
     e95:	8d 65 f8             	lea    -0x8(%ebp),%esp
     e98:	5b                   	pop    %ebx
     e99:	5e                   	pop    %esi
     e9a:	5d                   	pop    %ebp
     e9b:	c3                   	ret    
     e9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printf(1, "fork failed\n");
      return;
    }
    if(pid){
      if(wait(0) != pid){
        printf(1, "wait wrong pid\n");
     ea0:	83 ec 08             	sub    $0x8,%esp
     ea3:	68 c3 46 00 00       	push   $0x46c3
     ea8:	6a 01                	push   $0x1
     eaa:	e8 11 31 00 00       	call   3fc0 <printf>
        return;
     eaf:	83 c4 10             	add    $0x10,%esp
    } else {
      exit(0);
    }
  }
  printf(1, "exitwait ok\n");
}
     eb2:	8d 65 f8             	lea    -0x8(%ebp),%esp
     eb5:	5b                   	pop    %ebx
     eb6:	5e                   	pop    %esi
     eb7:	5d                   	pop    %ebp
     eb8:	c3                   	ret    
     eb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      }
    } else {
      exit(0);
    }
  }
  printf(1, "exitwait ok\n");
     ec0:	83 ec 08             	sub    $0x8,%esp
     ec3:	68 d3 46 00 00       	push   $0x46d3
     ec8:	6a 01                	push   $0x1
     eca:	e8 f1 30 00 00       	call   3fc0 <printf>
     ecf:	83 c4 10             	add    $0x10,%esp
}
     ed2:	8d 65 f8             	lea    -0x8(%ebp),%esp
     ed5:	5b                   	pop    %ebx
     ed6:	5e                   	pop    %esi
     ed7:	5d                   	pop    %ebp
     ed8:	c3                   	ret    
      if(wait(0) != pid){
        printf(1, "wait wrong pid\n");
        return;
      }
    } else {
      exit(0);
     ed9:	83 ec 0c             	sub    $0xc,%esp
     edc:	6a 00                	push   $0x0
     ede:	e8 8f 2f 00 00       	call   3e72 <exit>
     ee3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     ee9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ef0 <mem>:
  printf(1, "exitwait ok\n");
}

void
mem(void)
{
     ef0:	55                   	push   %ebp
     ef1:	89 e5                	mov    %esp,%ebp
     ef3:	57                   	push   %edi
     ef4:	56                   	push   %esi
     ef5:	53                   	push   %ebx
     ef6:	83 ec 14             	sub    $0x14,%esp
  void *m1, *m2;
  int pid, ppid;

  printf(1, "mem test\n");
     ef9:	68 e0 46 00 00       	push   $0x46e0
     efe:	6a 01                	push   $0x1
     f00:	e8 bb 30 00 00       	call   3fc0 <printf>
  ppid = getpid();
     f05:	e8 f0 2f 00 00       	call   3efa <getpid>
     f0a:	89 c6                	mov    %eax,%esi
  if((pid = fork()) == 0){
     f0c:	e8 59 2f 00 00       	call   3e6a <fork>
     f11:	83 c4 10             	add    $0x10,%esp
     f14:	85 c0                	test   %eax,%eax
     f16:	75 78                	jne    f90 <mem+0xa0>
     f18:	31 db                	xor    %ebx,%ebx
     f1a:	eb 08                	jmp    f24 <mem+0x34>
     f1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
      *(char**)m2 = m1;
     f20:	89 18                	mov    %ebx,(%eax)
     f22:	89 c3                	mov    %eax,%ebx

  printf(1, "mem test\n");
  ppid = getpid();
  if((pid = fork()) == 0){
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
     f24:	83 ec 0c             	sub    $0xc,%esp
     f27:	68 11 27 00 00       	push   $0x2711
     f2c:	e8 bf 32 00 00       	call   41f0 <malloc>
     f31:	83 c4 10             	add    $0x10,%esp
     f34:	85 c0                	test   %eax,%eax
     f36:	75 e8                	jne    f20 <mem+0x30>
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     f38:	85 db                	test   %ebx,%ebx
     f3a:	74 18                	je     f54 <mem+0x64>
     f3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      m2 = *(char**)m1;
     f40:	8b 3b                	mov    (%ebx),%edi
      free(m1);
     f42:	83 ec 0c             	sub    $0xc,%esp
     f45:	53                   	push   %ebx
     f46:	89 fb                	mov    %edi,%ebx
     f48:	e8 13 32 00 00       	call   4160 <free>
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     f4d:	83 c4 10             	add    $0x10,%esp
     f50:	85 db                	test   %ebx,%ebx
     f52:	75 ec                	jne    f40 <mem+0x50>
      m2 = *(char**)m1;
      free(m1);
      m1 = m2;
    }
    m1 = malloc(1024*20);
     f54:	83 ec 0c             	sub    $0xc,%esp
     f57:	68 00 50 00 00       	push   $0x5000
     f5c:	e8 8f 32 00 00       	call   41f0 <malloc>
    if(m1 == 0){
     f61:	83 c4 10             	add    $0x10,%esp
     f64:	85 c0                	test   %eax,%eax
     f66:	74 40                	je     fa8 <mem+0xb8>
      printf(1, "couldn't allocate mem?!!\n");
      kill(ppid);
      exit(-1);
    }
    free(m1);
     f68:	83 ec 0c             	sub    $0xc,%esp
     f6b:	50                   	push   %eax
     f6c:	e8 ef 31 00 00       	call   4160 <free>
    printf(1, "mem ok\n");
     f71:	58                   	pop    %eax
     f72:	5a                   	pop    %edx
     f73:	68 04 47 00 00       	push   $0x4704
     f78:	6a 01                	push   $0x1
     f7a:	e8 41 30 00 00       	call   3fc0 <printf>
    exit(0);
     f7f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     f86:	e8 e7 2e 00 00       	call   3e72 <exit>
     f8b:	90                   	nop
     f8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  } else {
    wait(0);
     f90:	83 ec 0c             	sub    $0xc,%esp
     f93:	6a 00                	push   $0x0
     f95:	e8 e0 2e 00 00       	call   3e7a <wait>
  }
}
     f9a:	83 c4 10             	add    $0x10,%esp
     f9d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fa0:	5b                   	pop    %ebx
     fa1:	5e                   	pop    %esi
     fa2:	5f                   	pop    %edi
     fa3:	5d                   	pop    %ebp
     fa4:	c3                   	ret    
     fa5:	8d 76 00             	lea    0x0(%esi),%esi
      free(m1);
      m1 = m2;
    }
    m1 = malloc(1024*20);
    if(m1 == 0){
      printf(1, "couldn't allocate mem?!!\n");
     fa8:	83 ec 08             	sub    $0x8,%esp
     fab:	68 ea 46 00 00       	push   $0x46ea
     fb0:	6a 01                	push   $0x1
     fb2:	e8 09 30 00 00       	call   3fc0 <printf>
      kill(ppid);
     fb7:	89 34 24             	mov    %esi,(%esp)
     fba:	e8 eb 2e 00 00       	call   3eaa <kill>
      exit(-1);
     fbf:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
     fc6:	e8 a7 2e 00 00       	call   3e72 <exit>
     fcb:	90                   	nop
     fcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000fd0 <sharedfd>:

// two processes write to the same file descriptor
// is the offset shared? does inode locking work?
void
sharedfd(void)
{
     fd0:	55                   	push   %ebp
     fd1:	89 e5                	mov    %esp,%ebp
     fd3:	57                   	push   %edi
     fd4:	56                   	push   %esi
     fd5:	53                   	push   %ebx
     fd6:	83 ec 34             	sub    $0x34,%esp
  int fd, pid, i, n, nc, np;
  char buf[10];

  printf(1, "sharedfd test\n");
     fd9:	68 0c 47 00 00       	push   $0x470c
     fde:	6a 01                	push   $0x1
     fe0:	e8 db 2f 00 00       	call   3fc0 <printf>

  unlink("sharedfd");
     fe5:	c7 04 24 1b 47 00 00 	movl   $0x471b,(%esp)
     fec:	e8 d9 2e 00 00       	call   3eca <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
     ff1:	5b                   	pop    %ebx
     ff2:	5e                   	pop    %esi
     ff3:	68 02 02 00 00       	push   $0x202
     ff8:	68 1b 47 00 00       	push   $0x471b
     ffd:	e8 b8 2e 00 00       	call   3eba <open>
  if(fd < 0){
    1002:	83 c4 10             	add    $0x10,%esp
    1005:	85 c0                	test   %eax,%eax
    1007:	0f 88 29 01 00 00    	js     1136 <sharedfd+0x166>
    100d:	89 c7                	mov    %eax,%edi
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
  memset(buf, pid==0?'c':'p', sizeof(buf));
    100f:	8d 75 de             	lea    -0x22(%ebp),%esi
    1012:	bb e8 03 00 00       	mov    $0x3e8,%ebx
  fd = open("sharedfd", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
    1017:	e8 4e 2e 00 00       	call   3e6a <fork>
  memset(buf, pid==0?'c':'p', sizeof(buf));
    101c:	83 f8 01             	cmp    $0x1,%eax
  fd = open("sharedfd", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
    101f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  memset(buf, pid==0?'c':'p', sizeof(buf));
    1022:	19 c0                	sbb    %eax,%eax
    1024:	83 ec 04             	sub    $0x4,%esp
    1027:	83 e0 f3             	and    $0xfffffff3,%eax
    102a:	6a 0a                	push   $0xa
    102c:	83 c0 70             	add    $0x70,%eax
    102f:	50                   	push   %eax
    1030:	56                   	push   %esi
    1031:	e8 aa 2c 00 00       	call   3ce0 <memset>
    1036:	83 c4 10             	add    $0x10,%esp
    1039:	eb 0a                	jmp    1045 <sharedfd+0x75>
    103b:	90                   	nop
    103c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 1000; i++){
    1040:	83 eb 01             	sub    $0x1,%ebx
    1043:	74 26                	je     106b <sharedfd+0x9b>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
    1045:	83 ec 04             	sub    $0x4,%esp
    1048:	6a 0a                	push   $0xa
    104a:	56                   	push   %esi
    104b:	57                   	push   %edi
    104c:	e8 49 2e 00 00       	call   3e9a <write>
    1051:	83 c4 10             	add    $0x10,%esp
    1054:	83 f8 0a             	cmp    $0xa,%eax
    1057:	74 e7                	je     1040 <sharedfd+0x70>
      printf(1, "fstests: write sharedfd failed\n");
    1059:	83 ec 08             	sub    $0x8,%esp
    105c:	68 0c 54 00 00       	push   $0x540c
    1061:	6a 01                	push   $0x1
    1063:	e8 58 2f 00 00       	call   3fc0 <printf>
      break;
    1068:	83 c4 10             	add    $0x10,%esp
    }
  }
  if(pid == 0)
    106b:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
    106e:	85 c9                	test   %ecx,%ecx
    1070:	0f 84 f4 00 00 00    	je     116a <sharedfd+0x19a>
    exit(0);
  else
    wait(0);
    1076:	83 ec 0c             	sub    $0xc,%esp
    1079:	31 db                	xor    %ebx,%ebx
    107b:	6a 00                	push   $0x0
    107d:	e8 f8 2d 00 00       	call   3e7a <wait>
  close(fd);
    1082:	89 3c 24             	mov    %edi,(%esp)
    1085:	8d 7d e8             	lea    -0x18(%ebp),%edi
    1088:	e8 15 2e 00 00       	call   3ea2 <close>
  fd = open("sharedfd", 0);
    108d:	58                   	pop    %eax
    108e:	5a                   	pop    %edx
    108f:	6a 00                	push   $0x0
    1091:	68 1b 47 00 00       	push   $0x471b
    1096:	e8 1f 2e 00 00       	call   3eba <open>
  if(fd < 0){
    109b:	83 c4 10             	add    $0x10,%esp
    109e:	31 d2                	xor    %edx,%edx
    10a0:	85 c0                	test   %eax,%eax
  if(pid == 0)
    exit(0);
  else
    wait(0);
  close(fd);
  fd = open("sharedfd", 0);
    10a2:	89 45 d0             	mov    %eax,-0x30(%ebp)
  if(fd < 0){
    10a5:	0f 88 a5 00 00 00    	js     1150 <sharedfd+0x180>
    10ab:	90                   	nop
    10ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    10b0:	83 ec 04             	sub    $0x4,%esp
    10b3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    10b6:	6a 0a                	push   $0xa
    10b8:	56                   	push   %esi
    10b9:	ff 75 d0             	pushl  -0x30(%ebp)
    10bc:	e8 d1 2d 00 00       	call   3e92 <read>
    10c1:	83 c4 10             	add    $0x10,%esp
    10c4:	85 c0                	test   %eax,%eax
    10c6:	7e 27                	jle    10ef <sharedfd+0x11f>
    10c8:	89 f0                	mov    %esi,%eax
    10ca:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    10cd:	eb 13                	jmp    10e2 <sharedfd+0x112>
    10cf:	90                   	nop
    for(i = 0; i < sizeof(buf); i++){
      if(buf[i] == 'c')
        nc++;
      if(buf[i] == 'p')
        np++;
    10d0:	80 f9 70             	cmp    $0x70,%cl
    10d3:	0f 94 c1             	sete   %cl
    10d6:	0f b6 c9             	movzbl %cl,%ecx
    10d9:	01 cb                	add    %ecx,%ebx
    10db:	83 c0 01             	add    $0x1,%eax
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i = 0; i < sizeof(buf); i++){
    10de:	39 c7                	cmp    %eax,%edi
    10e0:	74 ce                	je     10b0 <sharedfd+0xe0>
      if(buf[i] == 'c')
    10e2:	0f b6 08             	movzbl (%eax),%ecx
    10e5:	80 f9 63             	cmp    $0x63,%cl
    10e8:	75 e6                	jne    10d0 <sharedfd+0x100>
        nc++;
    10ea:	83 c2 01             	add    $0x1,%edx
    10ed:	eb ec                	jmp    10db <sharedfd+0x10b>
      if(buf[i] == 'p')
        np++;
    }
  }
  close(fd);
    10ef:	83 ec 0c             	sub    $0xc,%esp
    10f2:	ff 75 d0             	pushl  -0x30(%ebp)
    10f5:	e8 a8 2d 00 00       	call   3ea2 <close>
  unlink("sharedfd");
    10fa:	c7 04 24 1b 47 00 00 	movl   $0x471b,(%esp)
    1101:	e8 c4 2d 00 00       	call   3eca <unlink>
  if(nc == 10000 && np == 10000){
    1106:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    1109:	83 c4 10             	add    $0x10,%esp
    110c:	81 fa 10 27 00 00    	cmp    $0x2710,%edx
    1112:	75 60                	jne    1174 <sharedfd+0x1a4>
    1114:	81 fb 10 27 00 00    	cmp    $0x2710,%ebx
    111a:	75 58                	jne    1174 <sharedfd+0x1a4>
    printf(1, "sharedfd ok\n");
    111c:	83 ec 08             	sub    $0x8,%esp
    111f:	68 24 47 00 00       	push   $0x4724
    1124:	6a 01                	push   $0x1
    1126:	e8 95 2e 00 00       	call   3fc0 <printf>
    112b:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit(-1);
  }
}
    112e:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1131:	5b                   	pop    %ebx
    1132:	5e                   	pop    %esi
    1133:	5f                   	pop    %edi
    1134:	5d                   	pop    %ebp
    1135:	c3                   	ret    
  printf(1, "sharedfd test\n");

  unlink("sharedfd");
  fd = open("sharedfd", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for writing");
    1136:	83 ec 08             	sub    $0x8,%esp
    1139:	68 e0 53 00 00       	push   $0x53e0
    113e:	6a 01                	push   $0x1
    1140:	e8 7b 2e 00 00       	call   3fc0 <printf>
    return;
    1145:	83 c4 10             	add    $0x10,%esp
    printf(1, "sharedfd ok\n");
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit(-1);
  }
}
    1148:	8d 65 f4             	lea    -0xc(%ebp),%esp
    114b:	5b                   	pop    %ebx
    114c:	5e                   	pop    %esi
    114d:	5f                   	pop    %edi
    114e:	5d                   	pop    %ebp
    114f:	c3                   	ret    
  else
    wait(0);
  close(fd);
  fd = open("sharedfd", 0);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for reading\n");
    1150:	83 ec 08             	sub    $0x8,%esp
    1153:	68 2c 54 00 00       	push   $0x542c
    1158:	6a 01                	push   $0x1
    115a:	e8 61 2e 00 00       	call   3fc0 <printf>
    return;
    115f:	83 c4 10             	add    $0x10,%esp
    printf(1, "sharedfd ok\n");
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit(-1);
  }
}
    1162:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1165:	5b                   	pop    %ebx
    1166:	5e                   	pop    %esi
    1167:	5f                   	pop    %edi
    1168:	5d                   	pop    %ebp
    1169:	c3                   	ret    
      printf(1, "fstests: write sharedfd failed\n");
      break;
    }
  }
  if(pid == 0)
    exit(0);
    116a:	83 ec 0c             	sub    $0xc,%esp
    116d:	6a 00                	push   $0x0
    116f:	e8 fe 2c 00 00       	call   3e72 <exit>
  close(fd);
  unlink("sharedfd");
  if(nc == 10000 && np == 10000){
    printf(1, "sharedfd ok\n");
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    1174:	53                   	push   %ebx
    1175:	52                   	push   %edx
    1176:	68 31 47 00 00       	push   $0x4731
    117b:	6a 01                	push   $0x1
    117d:	e8 3e 2e 00 00       	call   3fc0 <printf>
    exit(-1);
    1182:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    1189:	e8 e4 2c 00 00       	call   3e72 <exit>
    118e:	66 90                	xchg   %ax,%ax

00001190 <fourfiles>:

// four processes write different files at the same
// time, to test block allocation.
void
fourfiles(void)
{
    1190:	55                   	push   %ebp
    1191:	89 e5                	mov    %esp,%ebp
    1193:	57                   	push   %edi
    1194:	56                   	push   %esi
    1195:	53                   	push   %ebx
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
  char *fname;

  printf(1, "fourfiles test\n");
    1196:	be 46 47 00 00       	mov    $0x4746,%esi

  for(pi = 0; pi < 4; pi++){
    119b:	31 db                	xor    %ebx,%ebx

// four processes write different files at the same
// time, to test block allocation.
void
fourfiles(void)
{
    119d:	83 ec 34             	sub    $0x34,%esp
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
    11a0:	c7 45 d8 46 47 00 00 	movl   $0x4746,-0x28(%ebp)
    11a7:	c7 45 dc 8f 48 00 00 	movl   $0x488f,-0x24(%ebp)
  char *fname;

  printf(1, "fourfiles test\n");
    11ae:	68 4c 47 00 00       	push   $0x474c
    11b3:	6a 01                	push   $0x1
// time, to test block allocation.
void
fourfiles(void)
{
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
    11b5:	c7 45 e0 93 48 00 00 	movl   $0x4893,-0x20(%ebp)
    11bc:	c7 45 e4 49 47 00 00 	movl   $0x4749,-0x1c(%ebp)
  char *fname;

  printf(1, "fourfiles test\n");
    11c3:	e8 f8 2d 00 00       	call   3fc0 <printf>
    11c8:	83 c4 10             	add    $0x10,%esp

  for(pi = 0; pi < 4; pi++){
    fname = names[pi];
    unlink(fname);
    11cb:	83 ec 0c             	sub    $0xc,%esp
    11ce:	56                   	push   %esi
    11cf:	e8 f6 2c 00 00       	call   3eca <unlink>

    pid = fork();
    11d4:	e8 91 2c 00 00       	call   3e6a <fork>
    if(pid < 0){
    11d9:	83 c4 10             	add    $0x10,%esp
    11dc:	85 c0                	test   %eax,%eax
    11de:	0f 88 c4 01 00 00    	js     13a8 <fourfiles+0x218>
      printf(1, "fork failed\n");
      exit(-1);
    }

    if(pid == 0){
    11e4:	0f 84 0a 01 00 00    	je     12f4 <fourfiles+0x164>
  char *names[] = { "f0", "f1", "f2", "f3" };
  char *fname;

  printf(1, "fourfiles test\n");

  for(pi = 0; pi < 4; pi++){
    11ea:	83 c3 01             	add    $0x1,%ebx
    11ed:	83 fb 04             	cmp    $0x4,%ebx
    11f0:	74 06                	je     11f8 <fourfiles+0x68>
    11f2:	8b 74 9d d8          	mov    -0x28(%ebp,%ebx,4),%esi
    11f6:	eb d3                	jmp    11cb <fourfiles+0x3b>
      exit(0);
    }
  }

  for(pi = 0; pi < 4; pi++){
    wait(0);
    11f8:	83 ec 0c             	sub    $0xc,%esp
    11fb:	bf 30 00 00 00       	mov    $0x30,%edi
    1200:	6a 00                	push   $0x0
    1202:	e8 73 2c 00 00       	call   3e7a <wait>
    1207:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    120e:	e8 67 2c 00 00       	call   3e7a <wait>
    1213:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    121a:	e8 5b 2c 00 00       	call   3e7a <wait>
    121f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1226:	e8 4f 2c 00 00       	call   3e7a <wait>
    122b:	83 c4 10             	add    $0x10,%esp
    122e:	c7 45 d4 46 47 00 00 	movl   $0x4746,-0x2c(%ebp)
  }

  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    1235:	83 ec 08             	sub    $0x8,%esp
    total = 0;
    1238:	31 db                	xor    %ebx,%ebx
    wait(0);
  }

  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    123a:	6a 00                	push   $0x0
    123c:	ff 75 d4             	pushl  -0x2c(%ebp)
    123f:	e8 76 2c 00 00       	call   3eba <open>
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
    1244:	83 c4 10             	add    $0x10,%esp
    wait(0);
  }

  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    1247:	89 c6                	mov    %eax,%esi
    1249:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
    1250:	83 ec 04             	sub    $0x4,%esp
    1253:	68 00 20 00 00       	push   $0x2000
    1258:	68 60 8b 00 00       	push   $0x8b60
    125d:	56                   	push   %esi
    125e:	e8 2f 2c 00 00       	call   3e92 <read>
    1263:	83 c4 10             	add    $0x10,%esp
    1266:	85 c0                	test   %eax,%eax
    1268:	7e 1c                	jle    1286 <fourfiles+0xf6>
    126a:	31 d2                	xor    %edx,%edx
    126c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      for(j = 0; j < n; j++){
        if(buf[j] != '0'+i){
    1270:	0f be 8a 60 8b 00 00 	movsbl 0x8b60(%edx),%ecx
    1277:	39 f9                	cmp    %edi,%ecx
    1279:	75 5e                	jne    12d9 <fourfiles+0x149>
  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
    127b:	83 c2 01             	add    $0x1,%edx
    127e:	39 d0                	cmp    %edx,%eax
    1280:	75 ee                	jne    1270 <fourfiles+0xe0>
        if(buf[j] != '0'+i){
          printf(1, "wrong char\n");
          exit(-1);
        }
      }
      total += n;
    1282:	01 c3                	add    %eax,%ebx
    1284:	eb ca                	jmp    1250 <fourfiles+0xc0>
    }
    close(fd);
    1286:	83 ec 0c             	sub    $0xc,%esp
    1289:	56                   	push   %esi
    128a:	e8 13 2c 00 00       	call   3ea2 <close>
    if(total != 12*500){
    128f:	83 c4 10             	add    $0x10,%esp
    1292:	81 fb 70 17 00 00    	cmp    $0x1770,%ebx
    1298:	0f 85 ee 00 00 00    	jne    138c <fourfiles+0x1fc>
      printf(1, "wrong length %d\n", total);
      exit(-1);
    }
    unlink(fname);
    129e:	83 ec 0c             	sub    $0xc,%esp
    12a1:	ff 75 d4             	pushl  -0x2c(%ebp)
    12a4:	83 c7 01             	add    $0x1,%edi
    12a7:	e8 1e 2c 00 00       	call   3eca <unlink>

  for(pi = 0; pi < 4; pi++){
    wait(0);
  }

  for(i = 0; i < 2; i++){
    12ac:	83 c4 10             	add    $0x10,%esp
    12af:	83 ff 32             	cmp    $0x32,%edi
    12b2:	75 1a                	jne    12ce <fourfiles+0x13e>
      exit(-1);
    }
    unlink(fname);
  }

  printf(1, "fourfiles ok\n");
    12b4:	83 ec 08             	sub    $0x8,%esp
    12b7:	68 8a 47 00 00       	push   $0x478a
    12bc:	6a 01                	push   $0x1
    12be:	e8 fd 2c 00 00       	call   3fc0 <printf>
}
    12c3:	83 c4 10             	add    $0x10,%esp
    12c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
    12c9:	5b                   	pop    %ebx
    12ca:	5e                   	pop    %esi
    12cb:	5f                   	pop    %edi
    12cc:	5d                   	pop    %ebp
    12cd:	c3                   	ret    
    12ce:	8b 45 dc             	mov    -0x24(%ebp),%eax
    12d1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    12d4:	e9 5c ff ff ff       	jmp    1235 <fourfiles+0xa5>
    fd = open(fname, 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
        if(buf[j] != '0'+i){
          printf(1, "wrong char\n");
    12d9:	83 ec 08             	sub    $0x8,%esp
    12dc:	68 6d 47 00 00       	push   $0x476d
    12e1:	6a 01                	push   $0x1
    12e3:	e8 d8 2c 00 00       	call   3fc0 <printf>
          exit(-1);
    12e8:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    12ef:	e8 7e 2b 00 00       	call   3e72 <exit>
      printf(1, "fork failed\n");
      exit(-1);
    }

    if(pid == 0){
      fd = open(fname, O_CREATE | O_RDWR);
    12f4:	83 ec 08             	sub    $0x8,%esp
    12f7:	68 02 02 00 00       	push   $0x202
    12fc:	56                   	push   %esi
    12fd:	e8 b8 2b 00 00       	call   3eba <open>
      if(fd < 0){
    1302:	83 c4 10             	add    $0x10,%esp
    1305:	85 c0                	test   %eax,%eax
      printf(1, "fork failed\n");
      exit(-1);
    }

    if(pid == 0){
      fd = open(fname, O_CREATE | O_RDWR);
    1307:	89 c6                	mov    %eax,%esi
      if(fd < 0){
    1309:	78 66                	js     1371 <fourfiles+0x1e1>
        printf(1, "create failed\n");
        exit(-1);
      }

      memset(buf, '0'+pi, 512);
    130b:	83 ec 04             	sub    $0x4,%esp
    130e:	83 c3 30             	add    $0x30,%ebx
    1311:	68 00 02 00 00       	push   $0x200
    1316:	53                   	push   %ebx
    1317:	bb 0c 00 00 00       	mov    $0xc,%ebx
    131c:	68 60 8b 00 00       	push   $0x8b60
    1321:	e8 ba 29 00 00       	call   3ce0 <memset>
    1326:	83 c4 10             	add    $0x10,%esp
      for(i = 0; i < 12; i++){
        if((n = write(fd, buf, 500)) != 500){
    1329:	83 ec 04             	sub    $0x4,%esp
    132c:	68 f4 01 00 00       	push   $0x1f4
    1331:	68 60 8b 00 00       	push   $0x8b60
    1336:	56                   	push   %esi
    1337:	e8 5e 2b 00 00       	call   3e9a <write>
    133c:	83 c4 10             	add    $0x10,%esp
    133f:	3d f4 01 00 00       	cmp    $0x1f4,%eax
    1344:	75 0f                	jne    1355 <fourfiles+0x1c5>
        printf(1, "create failed\n");
        exit(-1);
      }

      memset(buf, '0'+pi, 512);
      for(i = 0; i < 12; i++){
    1346:	83 eb 01             	sub    $0x1,%ebx
    1349:	75 de                	jne    1329 <fourfiles+0x199>
        if((n = write(fd, buf, 500)) != 500){
          printf(1, "write failed %d\n", n);
          exit(-1);
        }
      }
      exit(0);
    134b:	83 ec 0c             	sub    $0xc,%esp
    134e:	6a 00                	push   $0x0
    1350:	e8 1d 2b 00 00       	call   3e72 <exit>
      }

      memset(buf, '0'+pi, 512);
      for(i = 0; i < 12; i++){
        if((n = write(fd, buf, 500)) != 500){
          printf(1, "write failed %d\n", n);
    1355:	83 ec 04             	sub    $0x4,%esp
    1358:	50                   	push   %eax
    1359:	68 5c 47 00 00       	push   $0x475c
    135e:	6a 01                	push   $0x1
    1360:	e8 5b 2c 00 00       	call   3fc0 <printf>
          exit(-1);
    1365:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    136c:	e8 01 2b 00 00       	call   3e72 <exit>
    }

    if(pid == 0){
      fd = open(fname, O_CREATE | O_RDWR);
      if(fd < 0){
        printf(1, "create failed\n");
    1371:	83 ec 08             	sub    $0x8,%esp
    1374:	68 e7 49 00 00       	push   $0x49e7
    1379:	6a 01                	push   $0x1
    137b:	e8 40 2c 00 00       	call   3fc0 <printf>
        exit(-1);
    1380:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    1387:	e8 e6 2a 00 00       	call   3e72 <exit>
      }
      total += n;
    }
    close(fd);
    if(total != 12*500){
      printf(1, "wrong length %d\n", total);
    138c:	83 ec 04             	sub    $0x4,%esp
    138f:	53                   	push   %ebx
    1390:	68 79 47 00 00       	push   $0x4779
    1395:	6a 01                	push   $0x1
    1397:	e8 24 2c 00 00       	call   3fc0 <printf>
      exit(-1);
    139c:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    13a3:	e8 ca 2a 00 00       	call   3e72 <exit>
    fname = names[pi];
    unlink(fname);

    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
    13a8:	83 ec 08             	sub    $0x8,%esp
    13ab:	68 21 52 00 00       	push   $0x5221
    13b0:	6a 01                	push   $0x1
    13b2:	e8 09 2c 00 00       	call   3fc0 <printf>
      exit(-1);
    13b7:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    13be:	e8 af 2a 00 00       	call   3e72 <exit>
    13c3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    13c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000013d0 <createdelete>:
}

// four processes create and delete different files in same directory
void
createdelete(void)
{
    13d0:	55                   	push   %ebp
    13d1:	89 e5                	mov    %esp,%ebp
    13d3:	57                   	push   %edi
    13d4:	56                   	push   %esi
    13d5:	53                   	push   %ebx
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");

  for(pi = 0; pi < 4; pi++){
    13d6:	31 db                	xor    %ebx,%ebx
}

// four processes create and delete different files in same directory
void
createdelete(void)
{
    13d8:	83 ec 44             	sub    $0x44,%esp
  enum { N = 20 };
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");
    13db:	68 98 47 00 00       	push   $0x4798
    13e0:	6a 01                	push   $0x1
    13e2:	e8 d9 2b 00 00       	call   3fc0 <printf>
    13e7:	83 c4 10             	add    $0x10,%esp

  for(pi = 0; pi < 4; pi++){
    pid = fork();
    13ea:	e8 7b 2a 00 00       	call   3e6a <fork>
    if(pid < 0){
    13ef:	85 c0                	test   %eax,%eax
    13f1:	0f 88 ea 01 00 00    	js     15e1 <createdelete+0x211>
      printf(1, "fork failed\n");
      exit(-1);
    }

    if(pid == 0){
    13f7:	0f 84 0e 01 00 00    	je     150b <createdelete+0x13b>
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");

  for(pi = 0; pi < 4; pi++){
    13fd:	83 c3 01             	add    $0x1,%ebx
    1400:	83 fb 04             	cmp    $0x4,%ebx
    1403:	75 e5                	jne    13ea <createdelete+0x1a>
      exit(0);
    }
  }

  for(pi = 0; pi < 4; pi++){
    wait(0);
    1405:	83 ec 0c             	sub    $0xc,%esp
    1408:	8d 7d c8             	lea    -0x38(%ebp),%edi
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    140b:	31 f6                	xor    %esi,%esi
      exit(0);
    }
  }

  for(pi = 0; pi < 4; pi++){
    wait(0);
    140d:	6a 00                	push   $0x0
    140f:	e8 66 2a 00 00       	call   3e7a <wait>
    1414:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    141b:	e8 5a 2a 00 00       	call   3e7a <wait>
    1420:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1427:	e8 4e 2a 00 00       	call   3e7a <wait>
    142c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1433:	e8 42 2a 00 00       	call   3e7a <wait>
  }

  name[0] = name[1] = name[2] = 0;
    1438:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    143c:	83 c4 10             	add    $0x10,%esp
    143f:	90                   	nop
    1440:	8d 46 30             	lea    0x30(%esi),%eax
    1443:	83 fe 09             	cmp    $0x9,%esi
      exit(-1);
    }

    if(pid == 0){
      name[0] = 'p' + pi;
      name[2] = '\0';
    1446:	bb 70 00 00 00       	mov    $0x70,%ebx
    144b:	0f 9f c2             	setg   %dl
    144e:	85 f6                	test   %esi,%esi
    1450:	88 45 c7             	mov    %al,-0x39(%ebp)
    1453:	0f 94 c0             	sete   %al
    1456:	09 c2                	or     %eax,%edx
      name[1] = '0' + i;
      fd = open(name, 0);
      if((i == 0 || i >= N/2) && fd < 0){
        printf(1, "oops createdelete %s didn't exist\n", name);
        exit(-1);
      } else if((i >= 1 && i < N/2) && fd >= 0){
    1458:	8d 46 ff             	lea    -0x1(%esi),%eax
    145b:	88 55 c6             	mov    %dl,-0x3a(%ebp)
    145e:	89 45 c0             	mov    %eax,-0x40(%ebp)

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
      name[1] = '0' + i;
    1461:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
      fd = open(name, 0);
    1465:	83 ec 08             	sub    $0x8,%esp
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
    1468:	88 5d c8             	mov    %bl,-0x38(%ebp)
      name[1] = '0' + i;
      fd = open(name, 0);
    146b:	6a 00                	push   $0x0
    146d:	57                   	push   %edi

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
      name[1] = '0' + i;
    146e:	88 45 c9             	mov    %al,-0x37(%ebp)
      fd = open(name, 0);
    1471:	e8 44 2a 00 00       	call   3eba <open>
      if((i == 0 || i >= N/2) && fd < 0){
    1476:	89 c1                	mov    %eax,%ecx
    1478:	83 c4 10             	add    $0x10,%esp
    147b:	c1 e9 1f             	shr    $0x1f,%ecx
    147e:	84 c9                	test   %cl,%cl
    1480:	74 0a                	je     148c <createdelete+0xbc>
    1482:	80 7d c6 00          	cmpb   $0x0,-0x3a(%ebp)
    1486:	0f 85 1e 01 00 00    	jne    15aa <createdelete+0x1da>
        printf(1, "oops createdelete %s didn't exist\n", name);
        exit(-1);
      } else if((i >= 1 && i < N/2) && fd >= 0){
    148c:	83 7d c0 08          	cmpl   $0x8,-0x40(%ebp)
    1490:	0f 86 66 01 00 00    	jbe    15fc <createdelete+0x22c>
        printf(1, "oops createdelete %s did exist\n", name);
        exit(-1);
      }
      if(fd >= 0)
    1496:	85 c0                	test   %eax,%eax
    1498:	78 0c                	js     14a6 <createdelete+0xd6>
        close(fd);
    149a:	83 ec 0c             	sub    $0xc,%esp
    149d:	50                   	push   %eax
    149e:	e8 ff 29 00 00       	call   3ea2 <close>
    14a3:	83 c4 10             	add    $0x10,%esp
    14a6:	83 c3 01             	add    $0x1,%ebx
    wait(0);
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
    14a9:	80 fb 74             	cmp    $0x74,%bl
    14ac:	75 b3                	jne    1461 <createdelete+0x91>
  for(pi = 0; pi < 4; pi++){
    wait(0);
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    14ae:	83 c6 01             	add    $0x1,%esi
    14b1:	83 fe 14             	cmp    $0x14,%esi
    14b4:	75 8a                	jne    1440 <createdelete+0x70>
    14b6:	be 70 00 00 00       	mov    $0x70,%esi
    14bb:	90                   	nop
    14bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    14c0:	8d 46 c0             	lea    -0x40(%esi),%eax
    14c3:	bb 04 00 00 00       	mov    $0x4,%ebx
    14c8:	88 45 c7             	mov    %al,-0x39(%ebp)
    }
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + i;
    14cb:	89 f0                	mov    %esi,%eax
      name[1] = '0' + i;
      unlink(name);
    14cd:	83 ec 0c             	sub    $0xc,%esp
    }
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + i;
    14d0:	88 45 c8             	mov    %al,-0x38(%ebp)
      name[1] = '0' + i;
    14d3:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
      unlink(name);
    14d7:	57                   	push   %edi
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + i;
      name[1] = '0' + i;
    14d8:	88 45 c9             	mov    %al,-0x37(%ebp)
      unlink(name);
    14db:	e8 ea 29 00 00       	call   3eca <unlink>
        close(fd);
    }
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
    14e0:	83 c4 10             	add    $0x10,%esp
    14e3:	83 eb 01             	sub    $0x1,%ebx
    14e6:	75 e3                	jne    14cb <createdelete+0xfb>
    14e8:	83 c6 01             	add    $0x1,%esi
      if(fd >= 0)
        close(fd);
    }
  }

  for(i = 0; i < N; i++){
    14eb:	89 f0                	mov    %esi,%eax
    14ed:	3c 84                	cmp    $0x84,%al
    14ef:	75 cf                	jne    14c0 <createdelete+0xf0>
      name[1] = '0' + i;
      unlink(name);
    }
  }

  printf(1, "createdelete ok\n");
    14f1:	83 ec 08             	sub    $0x8,%esp
    14f4:	68 ab 47 00 00       	push   $0x47ab
    14f9:	6a 01                	push   $0x1
    14fb:	e8 c0 2a 00 00       	call   3fc0 <printf>
}
    1500:	83 c4 10             	add    $0x10,%esp
    1503:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1506:	5b                   	pop    %ebx
    1507:	5e                   	pop    %esi
    1508:	5f                   	pop    %edi
    1509:	5d                   	pop    %ebp
    150a:	c3                   	ret    
      printf(1, "fork failed\n");
      exit(-1);
    }

    if(pid == 0){
      name[0] = 'p' + pi;
    150b:	83 c3 70             	add    $0x70,%ebx
      name[2] = '\0';
    150e:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    1512:	be 01 00 00 00       	mov    $0x1,%esi
      printf(1, "fork failed\n");
      exit(-1);
    }

    if(pid == 0){
      name[0] = 'p' + pi;
    1517:	88 5d c8             	mov    %bl,-0x38(%ebp)
    151a:	8d 7d c8             	lea    -0x38(%ebp),%edi
      name[2] = '\0';
    151d:	31 db                	xor    %ebx,%ebx
    151f:	eb 12                	jmp    1533 <createdelete+0x163>
    1521:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      for(i = 0; i < N; i++){
    1528:	83 fe 14             	cmp    $0x14,%esi
    152b:	74 73                	je     15a0 <createdelete+0x1d0>
    152d:	83 c3 01             	add    $0x1,%ebx
    1530:	83 c6 01             	add    $0x1,%esi
        name[1] = '0' + i;
        fd = open(name, O_CREATE | O_RDWR);
    1533:	83 ec 08             	sub    $0x8,%esp

    if(pid == 0){
      name[0] = 'p' + pi;
      name[2] = '\0';
      for(i = 0; i < N; i++){
        name[1] = '0' + i;
    1536:	8d 43 30             	lea    0x30(%ebx),%eax
        fd = open(name, O_CREATE | O_RDWR);
    1539:	68 02 02 00 00       	push   $0x202
    153e:	57                   	push   %edi

    if(pid == 0){
      name[0] = 'p' + pi;
      name[2] = '\0';
      for(i = 0; i < N; i++){
        name[1] = '0' + i;
    153f:	88 45 c9             	mov    %al,-0x37(%ebp)
        fd = open(name, O_CREATE | O_RDWR);
    1542:	e8 73 29 00 00       	call   3eba <open>
        if(fd < 0){
    1547:	83 c4 10             	add    $0x10,%esp
    154a:	85 c0                	test   %eax,%eax
    154c:	78 78                	js     15c6 <createdelete+0x1f6>
          printf(1, "create failed\n");
          exit(-1);
        }
        close(fd);
    154e:	83 ec 0c             	sub    $0xc,%esp
    1551:	50                   	push   %eax
    1552:	e8 4b 29 00 00       	call   3ea2 <close>
        if(i > 0 && (i % 2 ) == 0){
    1557:	83 c4 10             	add    $0x10,%esp
    155a:	85 db                	test   %ebx,%ebx
    155c:	74 cf                	je     152d <createdelete+0x15d>
    155e:	f6 c3 01             	test   $0x1,%bl
    1561:	75 c5                	jne    1528 <createdelete+0x158>
          name[1] = '0' + (i / 2);
          if(unlink(name) < 0){
    1563:	83 ec 0c             	sub    $0xc,%esp
          printf(1, "create failed\n");
          exit(-1);
        }
        close(fd);
        if(i > 0 && (i % 2 ) == 0){
          name[1] = '0' + (i / 2);
    1566:	89 d8                	mov    %ebx,%eax
    1568:	d1 f8                	sar    %eax
          if(unlink(name) < 0){
    156a:	57                   	push   %edi
          printf(1, "create failed\n");
          exit(-1);
        }
        close(fd);
        if(i > 0 && (i % 2 ) == 0){
          name[1] = '0' + (i / 2);
    156b:	83 c0 30             	add    $0x30,%eax
    156e:	88 45 c9             	mov    %al,-0x37(%ebp)
          if(unlink(name) < 0){
    1571:	e8 54 29 00 00       	call   3eca <unlink>
    1576:	83 c4 10             	add    $0x10,%esp
    1579:	85 c0                	test   %eax,%eax
    157b:	79 ab                	jns    1528 <createdelete+0x158>
            printf(1, "unlink failed\n");
    157d:	83 ec 08             	sub    $0x8,%esp
    1580:	68 99 43 00 00       	push   $0x4399
    1585:	6a 01                	push   $0x1
    1587:	e8 34 2a 00 00       	call   3fc0 <printf>
            exit(-1);
    158c:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    1593:	e8 da 28 00 00       	call   3e72 <exit>
    1598:	90                   	nop
    1599:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
          }
        }
      }
      exit(0);
    15a0:	83 ec 0c             	sub    $0xc,%esp
    15a3:	6a 00                	push   $0x0
    15a5:	e8 c8 28 00 00       	call   3e72 <exit>
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
      name[1] = '0' + i;
      fd = open(name, 0);
      if((i == 0 || i >= N/2) && fd < 0){
        printf(1, "oops createdelete %s didn't exist\n", name);
    15aa:	83 ec 04             	sub    $0x4,%esp
    15ad:	57                   	push   %edi
    15ae:	68 58 54 00 00       	push   $0x5458
    15b3:	6a 01                	push   $0x1
    15b5:	e8 06 2a 00 00       	call   3fc0 <printf>
        exit(-1);
    15ba:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    15c1:	e8 ac 28 00 00       	call   3e72 <exit>
      name[2] = '\0';
      for(i = 0; i < N; i++){
        name[1] = '0' + i;
        fd = open(name, O_CREATE | O_RDWR);
        if(fd < 0){
          printf(1, "create failed\n");
    15c6:	83 ec 08             	sub    $0x8,%esp
    15c9:	68 e7 49 00 00       	push   $0x49e7
    15ce:	6a 01                	push   $0x1
    15d0:	e8 eb 29 00 00       	call   3fc0 <printf>
          exit(-1);
    15d5:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    15dc:	e8 91 28 00 00       	call   3e72 <exit>
  printf(1, "createdelete test\n");

  for(pi = 0; pi < 4; pi++){
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
    15e1:	83 ec 08             	sub    $0x8,%esp
    15e4:	68 21 52 00 00       	push   $0x5221
    15e9:	6a 01                	push   $0x1
    15eb:	e8 d0 29 00 00       	call   3fc0 <printf>
      exit(-1);
    15f0:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    15f7:	e8 76 28 00 00       	call   3e72 <exit>
      name[1] = '0' + i;
      fd = open(name, 0);
      if((i == 0 || i >= N/2) && fd < 0){
        printf(1, "oops createdelete %s didn't exist\n", name);
        exit(-1);
      } else if((i >= 1 && i < N/2) && fd >= 0){
    15fc:	85 c0                	test   %eax,%eax
    15fe:	0f 88 a2 fe ff ff    	js     14a6 <createdelete+0xd6>
        printf(1, "oops createdelete %s did exist\n", name);
    1604:	83 ec 04             	sub    $0x4,%esp
    1607:	57                   	push   %edi
    1608:	68 7c 54 00 00       	push   $0x547c
    160d:	6a 01                	push   $0x1
    160f:	e8 ac 29 00 00       	call   3fc0 <printf>
        exit(-1);
    1614:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    161b:	e8 52 28 00 00       	call   3e72 <exit>

00001620 <unlinkread>:
}

// can I unlink a file and still read it?
void
unlinkread(void)
{
    1620:	55                   	push   %ebp
    1621:	89 e5                	mov    %esp,%ebp
    1623:	56                   	push   %esi
    1624:	53                   	push   %ebx
  int fd, fd1;

  printf(1, "unlinkread test\n");
    1625:	83 ec 08             	sub    $0x8,%esp
    1628:	68 bc 47 00 00       	push   $0x47bc
    162d:	6a 01                	push   $0x1
    162f:	e8 8c 29 00 00       	call   3fc0 <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    1634:	5b                   	pop    %ebx
    1635:	5e                   	pop    %esi
    1636:	68 02 02 00 00       	push   $0x202
    163b:	68 cd 47 00 00       	push   $0x47cd
    1640:	e8 75 28 00 00       	call   3eba <open>
  if(fd < 0){
    1645:	83 c4 10             	add    $0x10,%esp
    1648:	85 c0                	test   %eax,%eax
    164a:	0f 88 e6 00 00 00    	js     1736 <unlinkread+0x116>
    printf(1, "create unlinkread failed\n");
    exit(-1);
  }
  write(fd, "hello", 5);
    1650:	83 ec 04             	sub    $0x4,%esp
    1653:	89 c3                	mov    %eax,%ebx
    1655:	6a 05                	push   $0x5
    1657:	68 f2 47 00 00       	push   $0x47f2
    165c:	50                   	push   %eax
    165d:	e8 38 28 00 00       	call   3e9a <write>
  close(fd);
    1662:	89 1c 24             	mov    %ebx,(%esp)
    1665:	e8 38 28 00 00       	call   3ea2 <close>

  fd = open("unlinkread", O_RDWR);
    166a:	58                   	pop    %eax
    166b:	5a                   	pop    %edx
    166c:	6a 02                	push   $0x2
    166e:	68 cd 47 00 00       	push   $0x47cd
    1673:	e8 42 28 00 00       	call   3eba <open>
  if(fd < 0){
    1678:	83 c4 10             	add    $0x10,%esp
    167b:	85 c0                	test   %eax,%eax
    exit(-1);
  }
  write(fd, "hello", 5);
  close(fd);

  fd = open("unlinkread", O_RDWR);
    167d:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    167f:	0f 88 33 01 00 00    	js     17b8 <unlinkread+0x198>
    printf(1, "open unlinkread failed\n");
    exit(-1);
  }
  if(unlink("unlinkread") != 0){
    1685:	83 ec 0c             	sub    $0xc,%esp
    1688:	68 cd 47 00 00       	push   $0x47cd
    168d:	e8 38 28 00 00       	call   3eca <unlink>
    1692:	83 c4 10             	add    $0x10,%esp
    1695:	85 c0                	test   %eax,%eax
    1697:	0f 85 01 01 00 00    	jne    179e <unlinkread+0x17e>
    printf(1, "unlink unlinkread failed\n");
    exit(-1);
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    169d:	83 ec 08             	sub    $0x8,%esp
    16a0:	68 02 02 00 00       	push   $0x202
    16a5:	68 cd 47 00 00       	push   $0x47cd
    16aa:	e8 0b 28 00 00       	call   3eba <open>
  write(fd1, "yyy", 3);
    16af:	83 c4 0c             	add    $0xc,%esp
  if(unlink("unlinkread") != 0){
    printf(1, "unlink unlinkread failed\n");
    exit(-1);
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    16b2:	89 c6                	mov    %eax,%esi
  write(fd1, "yyy", 3);
    16b4:	6a 03                	push   $0x3
    16b6:	68 2a 48 00 00       	push   $0x482a
    16bb:	50                   	push   %eax
    16bc:	e8 d9 27 00 00       	call   3e9a <write>
  close(fd1);
    16c1:	89 34 24             	mov    %esi,(%esp)
    16c4:	e8 d9 27 00 00       	call   3ea2 <close>

  if(read(fd, buf, sizeof(buf)) != 5){
    16c9:	83 c4 0c             	add    $0xc,%esp
    16cc:	68 00 20 00 00       	push   $0x2000
    16d1:	68 60 8b 00 00       	push   $0x8b60
    16d6:	53                   	push   %ebx
    16d7:	e8 b6 27 00 00       	call   3e92 <read>
    16dc:	83 c4 10             	add    $0x10,%esp
    16df:	83 f8 05             	cmp    $0x5,%eax
    16e2:	0f 85 9c 00 00 00    	jne    1784 <unlinkread+0x164>
    printf(1, "unlinkread read failed");
    exit(-1);
  }
  if(buf[0] != 'h'){
    16e8:	80 3d 60 8b 00 00 68 	cmpb   $0x68,0x8b60
    16ef:	75 79                	jne    176a <unlinkread+0x14a>
    printf(1, "unlinkread wrong data\n");
    exit(-1);
  }
  if(write(fd, buf, 10) != 10){
    16f1:	83 ec 04             	sub    $0x4,%esp
    16f4:	6a 0a                	push   $0xa
    16f6:	68 60 8b 00 00       	push   $0x8b60
    16fb:	53                   	push   %ebx
    16fc:	e8 99 27 00 00       	call   3e9a <write>
    1701:	83 c4 10             	add    $0x10,%esp
    1704:	83 f8 0a             	cmp    $0xa,%eax
    1707:	75 47                	jne    1750 <unlinkread+0x130>
    printf(1, "unlinkread write failed\n");
    exit(-1);
  }
  close(fd);
    1709:	83 ec 0c             	sub    $0xc,%esp
    170c:	53                   	push   %ebx
    170d:	e8 90 27 00 00       	call   3ea2 <close>
  unlink("unlinkread");
    1712:	c7 04 24 cd 47 00 00 	movl   $0x47cd,(%esp)
    1719:	e8 ac 27 00 00       	call   3eca <unlink>
  printf(1, "unlinkread ok\n");
    171e:	58                   	pop    %eax
    171f:	5a                   	pop    %edx
    1720:	68 75 48 00 00       	push   $0x4875
    1725:	6a 01                	push   $0x1
    1727:	e8 94 28 00 00       	call   3fc0 <printf>
}
    172c:	83 c4 10             	add    $0x10,%esp
    172f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1732:	5b                   	pop    %ebx
    1733:	5e                   	pop    %esi
    1734:	5d                   	pop    %ebp
    1735:	c3                   	ret    
  int fd, fd1;

  printf(1, "unlinkread test\n");
  fd = open("unlinkread", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create unlinkread failed\n");
    1736:	51                   	push   %ecx
    1737:	51                   	push   %ecx
    1738:	68 d8 47 00 00       	push   $0x47d8
    173d:	6a 01                	push   $0x1
    173f:	e8 7c 28 00 00       	call   3fc0 <printf>
    exit(-1);
    1744:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    174b:	e8 22 27 00 00       	call   3e72 <exit>
  if(buf[0] != 'h'){
    printf(1, "unlinkread wrong data\n");
    exit(-1);
  }
  if(write(fd, buf, 10) != 10){
    printf(1, "unlinkread write failed\n");
    1750:	51                   	push   %ecx
    1751:	51                   	push   %ecx
    1752:	68 5c 48 00 00       	push   $0x485c
    1757:	6a 01                	push   $0x1
    1759:	e8 62 28 00 00       	call   3fc0 <printf>
    exit(-1);
    175e:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    1765:	e8 08 27 00 00       	call   3e72 <exit>
  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "unlinkread read failed");
    exit(-1);
  }
  if(buf[0] != 'h'){
    printf(1, "unlinkread wrong data\n");
    176a:	53                   	push   %ebx
    176b:	53                   	push   %ebx
    176c:	68 45 48 00 00       	push   $0x4845
    1771:	6a 01                	push   $0x1
    1773:	e8 48 28 00 00       	call   3fc0 <printf>
    exit(-1);
    1778:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    177f:	e8 ee 26 00 00       	call   3e72 <exit>
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
  write(fd1, "yyy", 3);
  close(fd1);

  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "unlinkread read failed");
    1784:	56                   	push   %esi
    1785:	56                   	push   %esi
    1786:	68 2e 48 00 00       	push   $0x482e
    178b:	6a 01                	push   $0x1
    178d:	e8 2e 28 00 00       	call   3fc0 <printf>
    exit(-1);
    1792:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    1799:	e8 d4 26 00 00       	call   3e72 <exit>
  if(fd < 0){
    printf(1, "open unlinkread failed\n");
    exit(-1);
  }
  if(unlink("unlinkread") != 0){
    printf(1, "unlink unlinkread failed\n");
    179e:	50                   	push   %eax
    179f:	50                   	push   %eax
    17a0:	68 10 48 00 00       	push   $0x4810
    17a5:	6a 01                	push   $0x1
    17a7:	e8 14 28 00 00       	call   3fc0 <printf>
    exit(-1);
    17ac:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    17b3:	e8 ba 26 00 00       	call   3e72 <exit>
  write(fd, "hello", 5);
  close(fd);

  fd = open("unlinkread", O_RDWR);
  if(fd < 0){
    printf(1, "open unlinkread failed\n");
    17b8:	50                   	push   %eax
    17b9:	50                   	push   %eax
    17ba:	68 f8 47 00 00       	push   $0x47f8
    17bf:	6a 01                	push   $0x1
    17c1:	e8 fa 27 00 00       	call   3fc0 <printf>
    exit(-1);
    17c6:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    17cd:	e8 a0 26 00 00       	call   3e72 <exit>
    17d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    17d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000017e0 <linktest>:
  printf(1, "unlinkread ok\n");
}

void
linktest(void)
{
    17e0:	55                   	push   %ebp
    17e1:	89 e5                	mov    %esp,%ebp
    17e3:	53                   	push   %ebx
    17e4:	83 ec 0c             	sub    $0xc,%esp
  int fd;

  printf(1, "linktest\n");
    17e7:	68 84 48 00 00       	push   $0x4884
    17ec:	6a 01                	push   $0x1
    17ee:	e8 cd 27 00 00       	call   3fc0 <printf>

  unlink("lf1");
    17f3:	c7 04 24 8e 48 00 00 	movl   $0x488e,(%esp)
    17fa:	e8 cb 26 00 00       	call   3eca <unlink>
  unlink("lf2");
    17ff:	c7 04 24 92 48 00 00 	movl   $0x4892,(%esp)
    1806:	e8 bf 26 00 00       	call   3eca <unlink>

  fd = open("lf1", O_CREATE|O_RDWR);
    180b:	58                   	pop    %eax
    180c:	5a                   	pop    %edx
    180d:	68 02 02 00 00       	push   $0x202
    1812:	68 8e 48 00 00       	push   $0x488e
    1817:	e8 9e 26 00 00       	call   3eba <open>
  if(fd < 0){
    181c:	83 c4 10             	add    $0x10,%esp
    181f:	85 c0                	test   %eax,%eax
    1821:	0f 88 1e 01 00 00    	js     1945 <linktest+0x165>
    printf(1, "create lf1 failed\n");
    exit(-1);
  }
  if(write(fd, "hello", 5) != 5){
    1827:	83 ec 04             	sub    $0x4,%esp
    182a:	89 c3                	mov    %eax,%ebx
    182c:	6a 05                	push   $0x5
    182e:	68 f2 47 00 00       	push   $0x47f2
    1833:	50                   	push   %eax
    1834:	e8 61 26 00 00       	call   3e9a <write>
    1839:	83 c4 10             	add    $0x10,%esp
    183c:	83 f8 05             	cmp    $0x5,%eax
    183f:	0f 85 d0 01 00 00    	jne    1a15 <linktest+0x235>
    printf(1, "write lf1 failed\n");
    exit(-1);
  }
  close(fd);
    1845:	83 ec 0c             	sub    $0xc,%esp
    1848:	53                   	push   %ebx
    1849:	e8 54 26 00 00       	call   3ea2 <close>

  if(link("lf1", "lf2") < 0){
    184e:	5b                   	pop    %ebx
    184f:	58                   	pop    %eax
    1850:	68 92 48 00 00       	push   $0x4892
    1855:	68 8e 48 00 00       	push   $0x488e
    185a:	e8 7b 26 00 00       	call   3eda <link>
    185f:	83 c4 10             	add    $0x10,%esp
    1862:	85 c0                	test   %eax,%eax
    1864:	0f 88 91 01 00 00    	js     19fb <linktest+0x21b>
    printf(1, "link lf1 lf2 failed\n");
    exit(-1);
  }
  unlink("lf1");
    186a:	83 ec 0c             	sub    $0xc,%esp
    186d:	68 8e 48 00 00       	push   $0x488e
    1872:	e8 53 26 00 00       	call   3eca <unlink>

  if(open("lf1", 0) >= 0){
    1877:	58                   	pop    %eax
    1878:	5a                   	pop    %edx
    1879:	6a 00                	push   $0x0
    187b:	68 8e 48 00 00       	push   $0x488e
    1880:	e8 35 26 00 00       	call   3eba <open>
    1885:	83 c4 10             	add    $0x10,%esp
    1888:	85 c0                	test   %eax,%eax
    188a:	0f 89 51 01 00 00    	jns    19e1 <linktest+0x201>
    printf(1, "unlinked lf1 but it is still there!\n");
    exit(-1);
  }

  fd = open("lf2", 0);
    1890:	83 ec 08             	sub    $0x8,%esp
    1893:	6a 00                	push   $0x0
    1895:	68 92 48 00 00       	push   $0x4892
    189a:	e8 1b 26 00 00       	call   3eba <open>
  if(fd < 0){
    189f:	83 c4 10             	add    $0x10,%esp
    18a2:	85 c0                	test   %eax,%eax
  if(open("lf1", 0) >= 0){
    printf(1, "unlinked lf1 but it is still there!\n");
    exit(-1);
  }

  fd = open("lf2", 0);
    18a4:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    18a6:	0f 88 1b 01 00 00    	js     19c7 <linktest+0x1e7>
    printf(1, "open lf2 failed\n");
    exit(-1);
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    18ac:	83 ec 04             	sub    $0x4,%esp
    18af:	68 00 20 00 00       	push   $0x2000
    18b4:	68 60 8b 00 00       	push   $0x8b60
    18b9:	50                   	push   %eax
    18ba:	e8 d3 25 00 00       	call   3e92 <read>
    18bf:	83 c4 10             	add    $0x10,%esp
    18c2:	83 f8 05             	cmp    $0x5,%eax
    18c5:	0f 85 e2 00 00 00    	jne    19ad <linktest+0x1cd>
    printf(1, "read lf2 failed\n");
    exit(-1);
  }
  close(fd);
    18cb:	83 ec 0c             	sub    $0xc,%esp
    18ce:	53                   	push   %ebx
    18cf:	e8 ce 25 00 00       	call   3ea2 <close>

  if(link("lf2", "lf2") >= 0){
    18d4:	58                   	pop    %eax
    18d5:	5a                   	pop    %edx
    18d6:	68 92 48 00 00       	push   $0x4892
    18db:	68 92 48 00 00       	push   $0x4892
    18e0:	e8 f5 25 00 00       	call   3eda <link>
    18e5:	83 c4 10             	add    $0x10,%esp
    18e8:	85 c0                	test   %eax,%eax
    18ea:	0f 89 a3 00 00 00    	jns    1993 <linktest+0x1b3>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    exit(0);
  }

  unlink("lf2");
    18f0:	83 ec 0c             	sub    $0xc,%esp
    18f3:	68 92 48 00 00       	push   $0x4892
    18f8:	e8 cd 25 00 00       	call   3eca <unlink>
  if(link("lf2", "lf1") >= 0){
    18fd:	59                   	pop    %ecx
    18fe:	5b                   	pop    %ebx
    18ff:	68 8e 48 00 00       	push   $0x488e
    1904:	68 92 48 00 00       	push   $0x4892
    1909:	e8 cc 25 00 00       	call   3eda <link>
    190e:	83 c4 10             	add    $0x10,%esp
    1911:	85 c0                	test   %eax,%eax
    1913:	79 64                	jns    1979 <linktest+0x199>
    printf(1, "link non-existant succeeded! oops\n");
    exit(0);
  }

  if(link(".", "lf1") >= 0){
    1915:	83 ec 08             	sub    $0x8,%esp
    1918:	68 8e 48 00 00       	push   $0x488e
    191d:	68 56 4b 00 00       	push   $0x4b56
    1922:	e8 b3 25 00 00       	call   3eda <link>
    1927:	83 c4 10             	add    $0x10,%esp
    192a:	85 c0                	test   %eax,%eax
    192c:	79 31                	jns    195f <linktest+0x17f>
    printf(1, "link . lf1 succeeded! oops\n");
    exit(0);
  }

  printf(1, "linktest ok\n");
    192e:	83 ec 08             	sub    $0x8,%esp
    1931:	68 2c 49 00 00       	push   $0x492c
    1936:	6a 01                	push   $0x1
    1938:	e8 83 26 00 00       	call   3fc0 <printf>
}
    193d:	83 c4 10             	add    $0x10,%esp
    1940:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1943:	c9                   	leave  
    1944:	c3                   	ret    
  unlink("lf1");
  unlink("lf2");

  fd = open("lf1", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "create lf1 failed\n");
    1945:	50                   	push   %eax
    1946:	50                   	push   %eax
    1947:	68 96 48 00 00       	push   $0x4896
    194c:	6a 01                	push   $0x1
    194e:	e8 6d 26 00 00       	call   3fc0 <printf>
    exit(-1);
    1953:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    195a:	e8 13 25 00 00       	call   3e72 <exit>
    printf(1, "link non-existant succeeded! oops\n");
    exit(0);
  }

  if(link(".", "lf1") >= 0){
    printf(1, "link . lf1 succeeded! oops\n");
    195f:	50                   	push   %eax
    1960:	50                   	push   %eax
    1961:	68 10 49 00 00       	push   $0x4910
    1966:	6a 01                	push   $0x1
    1968:	e8 53 26 00 00       	call   3fc0 <printf>
    exit(0);
    196d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1974:	e8 f9 24 00 00       	call   3e72 <exit>
    exit(0);
  }

  unlink("lf2");
  if(link("lf2", "lf1") >= 0){
    printf(1, "link non-existant succeeded! oops\n");
    1979:	52                   	push   %edx
    197a:	52                   	push   %edx
    197b:	68 c4 54 00 00       	push   $0x54c4
    1980:	6a 01                	push   $0x1
    1982:	e8 39 26 00 00       	call   3fc0 <printf>
    exit(0);
    1987:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    198e:	e8 df 24 00 00       	call   3e72 <exit>
    exit(-1);
  }
  close(fd);

  if(link("lf2", "lf2") >= 0){
    printf(1, "link lf2 lf2 succeeded! oops\n");
    1993:	50                   	push   %eax
    1994:	50                   	push   %eax
    1995:	68 f2 48 00 00       	push   $0x48f2
    199a:	6a 01                	push   $0x1
    199c:	e8 1f 26 00 00       	call   3fc0 <printf>
    exit(0);
    19a1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    19a8:	e8 c5 24 00 00       	call   3e72 <exit>
  if(fd < 0){
    printf(1, "open lf2 failed\n");
    exit(-1);
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "read lf2 failed\n");
    19ad:	51                   	push   %ecx
    19ae:	51                   	push   %ecx
    19af:	68 e1 48 00 00       	push   $0x48e1
    19b4:	6a 01                	push   $0x1
    19b6:	e8 05 26 00 00       	call   3fc0 <printf>
    exit(-1);
    19bb:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    19c2:	e8 ab 24 00 00       	call   3e72 <exit>
    exit(-1);
  }

  fd = open("lf2", 0);
  if(fd < 0){
    printf(1, "open lf2 failed\n");
    19c7:	53                   	push   %ebx
    19c8:	53                   	push   %ebx
    19c9:	68 d0 48 00 00       	push   $0x48d0
    19ce:	6a 01                	push   $0x1
    19d0:	e8 eb 25 00 00       	call   3fc0 <printf>
    exit(-1);
    19d5:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    19dc:	e8 91 24 00 00       	call   3e72 <exit>
    exit(-1);
  }
  unlink("lf1");

  if(open("lf1", 0) >= 0){
    printf(1, "unlinked lf1 but it is still there!\n");
    19e1:	50                   	push   %eax
    19e2:	50                   	push   %eax
    19e3:	68 9c 54 00 00       	push   $0x549c
    19e8:	6a 01                	push   $0x1
    19ea:	e8 d1 25 00 00       	call   3fc0 <printf>
    exit(-1);
    19ef:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    19f6:	e8 77 24 00 00       	call   3e72 <exit>
    exit(-1);
  }
  close(fd);

  if(link("lf1", "lf2") < 0){
    printf(1, "link lf1 lf2 failed\n");
    19fb:	51                   	push   %ecx
    19fc:	51                   	push   %ecx
    19fd:	68 bb 48 00 00       	push   $0x48bb
    1a02:	6a 01                	push   $0x1
    1a04:	e8 b7 25 00 00       	call   3fc0 <printf>
    exit(-1);
    1a09:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    1a10:	e8 5d 24 00 00       	call   3e72 <exit>
  if(fd < 0){
    printf(1, "create lf1 failed\n");
    exit(-1);
  }
  if(write(fd, "hello", 5) != 5){
    printf(1, "write lf1 failed\n");
    1a15:	50                   	push   %eax
    1a16:	50                   	push   %eax
    1a17:	68 a9 48 00 00       	push   $0x48a9
    1a1c:	6a 01                	push   $0x1
    1a1e:	e8 9d 25 00 00       	call   3fc0 <printf>
    exit(-1);
    1a23:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    1a2a:	e8 43 24 00 00       	call   3e72 <exit>
    1a2f:	90                   	nop

00001a30 <concreate>:
}

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    1a30:	55                   	push   %ebp
    1a31:	89 e5                	mov    %esp,%ebp
    1a33:	57                   	push   %edi
    1a34:	56                   	push   %esi
    1a35:	53                   	push   %ebx
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    1a36:	31 f6                	xor    %esi,%esi
    1a38:	8d 5d ad             	lea    -0x53(%ebp),%ebx
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
    1a3b:	bf 56 55 55 55       	mov    $0x55555556,%edi
}

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    1a40:	83 ec 64             	sub    $0x64,%esp
  struct {
    ushort inum;
    char name[14];
  } de;

  printf(1, "concreate test\n");
    1a43:	68 39 49 00 00       	push   $0x4939
    1a48:	6a 01                	push   $0x1
    1a4a:	e8 71 25 00 00       	call   3fc0 <printf>
  file[0] = 'C';
    1a4f:	c6 45 ad 43          	movb   $0x43,-0x53(%ebp)
  file[2] = '\0';
    1a53:	c6 45 af 00          	movb   $0x0,-0x51(%ebp)
    1a57:	83 c4 10             	add    $0x10,%esp
    1a5a:	eb 59                	jmp    1ab5 <concreate+0x85>
    1a5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
    1a60:	89 f0                	mov    %esi,%eax
    1a62:	89 f1                	mov    %esi,%ecx
    1a64:	f7 ef                	imul   %edi
    1a66:	89 f0                	mov    %esi,%eax
    1a68:	c1 f8 1f             	sar    $0x1f,%eax
    1a6b:	29 c2                	sub    %eax,%edx
    1a6d:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1a70:	29 c1                	sub    %eax,%ecx
    1a72:	83 f9 01             	cmp    $0x1,%ecx
    1a75:	0f 84 cd 00 00 00    	je     1b48 <concreate+0x118>
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
      link("C0", file);
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    1a7b:	83 ec 08             	sub    $0x8,%esp
    1a7e:	68 02 02 00 00       	push   $0x202
    1a83:	53                   	push   %ebx
    1a84:	e8 31 24 00 00       	call   3eba <open>
      if(fd < 0){
    1a89:	83 c4 10             	add    $0x10,%esp
    1a8c:	85 c0                	test   %eax,%eax
    1a8e:	78 75                	js     1b05 <concreate+0xd5>
        printf(1, "concreate create %s failed\n", file);
        exit(-1);
      }
      close(fd);
    1a90:	83 ec 0c             	sub    $0xc,%esp
    1a93:	50                   	push   %eax
    1a94:	e8 09 24 00 00       	call   3ea2 <close>
    1a99:	83 c4 10             	add    $0x10,%esp
    }
    if(pid == 0)
      exit(0);
    else
      wait(0);
    1a9c:	83 ec 0c             	sub    $0xc,%esp
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    1a9f:	83 c6 01             	add    $0x1,%esi
      close(fd);
    }
    if(pid == 0)
      exit(0);
    else
      wait(0);
    1aa2:	6a 00                	push   $0x0
    1aa4:	e8 d1 23 00 00       	call   3e7a <wait>
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    1aa9:	83 c4 10             	add    $0x10,%esp
    1aac:	83 fe 28             	cmp    $0x28,%esi
    1aaf:	0f 84 ab 00 00 00    	je     1b60 <concreate+0x130>
    file[1] = '0' + i;
    unlink(file);
    1ab5:	83 ec 0c             	sub    $0xc,%esp

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    1ab8:	8d 46 30             	lea    0x30(%esi),%eax
    unlink(file);
    1abb:	53                   	push   %ebx

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    1abc:	88 45 ae             	mov    %al,-0x52(%ebp)
    unlink(file);
    1abf:	e8 06 24 00 00       	call   3eca <unlink>
    pid = fork();
    1ac4:	e8 a1 23 00 00       	call   3e6a <fork>
    if(pid && (i % 3) == 1){
    1ac9:	83 c4 10             	add    $0x10,%esp
    1acc:	85 c0                	test   %eax,%eax
    1ace:	75 90                	jne    1a60 <concreate+0x30>
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
    1ad0:	89 f0                	mov    %esi,%eax
    1ad2:	ba 67 66 66 66       	mov    $0x66666667,%edx
    1ad7:	f7 ea                	imul   %edx
    1ad9:	89 f0                	mov    %esi,%eax
    1adb:	c1 f8 1f             	sar    $0x1f,%eax
    1ade:	d1 fa                	sar    %edx
    1ae0:	29 c2                	sub    %eax,%edx
    1ae2:	8d 04 92             	lea    (%edx,%edx,4),%eax
    1ae5:	29 c6                	sub    %eax,%esi
    1ae7:	83 fe 01             	cmp    $0x1,%esi
    1aea:	74 3c                	je     1b28 <concreate+0xf8>
      link("C0", file);
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    1aec:	83 ec 08             	sub    $0x8,%esp
    1aef:	68 02 02 00 00       	push   $0x202
    1af4:	53                   	push   %ebx
    1af5:	e8 c0 23 00 00       	call   3eba <open>
      if(fd < 0){
    1afa:	83 c4 10             	add    $0x10,%esp
    1afd:	85 c0                	test   %eax,%eax
    1aff:	0f 89 56 02 00 00    	jns    1d5b <concreate+0x32b>
        printf(1, "concreate create %s failed\n", file);
    1b05:	83 ec 04             	sub    $0x4,%esp
    1b08:	53                   	push   %ebx
    1b09:	68 4c 49 00 00       	push   $0x494c
    1b0e:	6a 01                	push   $0x1
    1b10:	e8 ab 24 00 00       	call   3fc0 <printf>
        exit(-1);
    1b15:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    1b1c:	e8 51 23 00 00       	call   3e72 <exit>
    1b21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
      link("C0", file);
    1b28:	83 ec 08             	sub    $0x8,%esp
    1b2b:	53                   	push   %ebx
    1b2c:	68 49 49 00 00       	push   $0x4949
    1b31:	e8 a4 23 00 00       	call   3eda <link>
    1b36:	83 c4 10             	add    $0x10,%esp
        exit(-1);
      }
      close(fd);
    }
    if(pid == 0)
      exit(0);
    1b39:	83 ec 0c             	sub    $0xc,%esp
    1b3c:	6a 00                	push   $0x0
    1b3e:	e8 2f 23 00 00       	call   3e72 <exit>
    1b43:	90                   	nop
    1b44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
      link("C0", file);
    1b48:	83 ec 08             	sub    $0x8,%esp
    1b4b:	53                   	push   %ebx
    1b4c:	68 49 49 00 00       	push   $0x4949
    1b51:	e8 84 23 00 00       	call   3eda <link>
    1b56:	83 c4 10             	add    $0x10,%esp
    1b59:	e9 3e ff ff ff       	jmp    1a9c <concreate+0x6c>
    1b5e:	66 90                	xchg   %ax,%ax
      exit(0);
    else
      wait(0);
  }

  memset(fa, 0, sizeof(fa));
    1b60:	8d 45 c0             	lea    -0x40(%ebp),%eax
    1b63:	83 ec 04             	sub    $0x4,%esp
    1b66:	8d 7d b0             	lea    -0x50(%ebp),%edi
    1b69:	6a 28                	push   $0x28
    1b6b:	6a 00                	push   $0x0
    1b6d:	50                   	push   %eax
    1b6e:	e8 6d 21 00 00       	call   3ce0 <memset>
  fd = open(".", 0);
    1b73:	59                   	pop    %ecx
    1b74:	5e                   	pop    %esi
    1b75:	6a 00                	push   $0x0
    1b77:	68 56 4b 00 00       	push   $0x4b56
    1b7c:	e8 39 23 00 00       	call   3eba <open>
  n = 0;
  while(read(fd, &de, sizeof(de)) > 0){
    1b81:	83 c4 10             	add    $0x10,%esp
    else
      wait(0);
  }

  memset(fa, 0, sizeof(fa));
  fd = open(".", 0);
    1b84:	89 c6                	mov    %eax,%esi
  n = 0;
    1b86:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%ebp)
    1b8d:	8d 76 00             	lea    0x0(%esi),%esi
  while(read(fd, &de, sizeof(de)) > 0){
    1b90:	83 ec 04             	sub    $0x4,%esp
    1b93:	6a 10                	push   $0x10
    1b95:	57                   	push   %edi
    1b96:	56                   	push   %esi
    1b97:	e8 f6 22 00 00       	call   3e92 <read>
    1b9c:	83 c4 10             	add    $0x10,%esp
    1b9f:	85 c0                	test   %eax,%eax
    1ba1:	7e 3d                	jle    1be0 <concreate+0x1b0>
    if(de.inum == 0)
    1ba3:	66 83 7d b0 00       	cmpw   $0x0,-0x50(%ebp)
    1ba8:	74 e6                	je     1b90 <concreate+0x160>
      continue;
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    1baa:	80 7d b2 43          	cmpb   $0x43,-0x4e(%ebp)
    1bae:	75 e0                	jne    1b90 <concreate+0x160>
    1bb0:	80 7d b4 00          	cmpb   $0x0,-0x4c(%ebp)
    1bb4:	75 da                	jne    1b90 <concreate+0x160>
      i = de.name[1] - '0';
    1bb6:	0f be 45 b3          	movsbl -0x4d(%ebp),%eax
    1bba:	83 e8 30             	sub    $0x30,%eax
      if(i < 0 || i >= sizeof(fa)){
    1bbd:	83 f8 27             	cmp    $0x27,%eax
    1bc0:	0f 87 76 01 00 00    	ja     1d3c <concreate+0x30c>
        printf(1, "concreate weird file %s\n", de.name);
        exit(-1);
      }
      if(fa[i]){
    1bc6:	80 7c 05 c0 00       	cmpb   $0x0,-0x40(%ebp,%eax,1)
    1bcb:	0f 85 4c 01 00 00    	jne    1d1d <concreate+0x2ed>
        printf(1, "concreate duplicate file %s\n", de.name);
        exit(-1);
      }
      fa[i] = 1;
    1bd1:	c6 44 05 c0 01       	movb   $0x1,-0x40(%ebp,%eax,1)
      n++;
    1bd6:	83 45 a4 01          	addl   $0x1,-0x5c(%ebp)
    1bda:	eb b4                	jmp    1b90 <concreate+0x160>
    1bdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }
  close(fd);
    1be0:	83 ec 0c             	sub    $0xc,%esp
    1be3:	56                   	push   %esi
    1be4:	e8 b9 22 00 00       	call   3ea2 <close>

  if(n != 40){
    1be9:	83 c4 10             	add    $0x10,%esp
    1bec:	83 7d a4 28          	cmpl   $0x28,-0x5c(%ebp)
    1bf0:	0f 85 0c 01 00 00    	jne    1d02 <concreate+0x2d2>
    1bf6:	31 f6                	xor    %esi,%esi
    1bf8:	eb 78                	jmp    1c72 <concreate+0x242>
    1bfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(pid < 0){
      printf(1, "fork failed\n");
      exit(-1);
    }
    if(((i % 3) == 0 && pid == 0) ||
       ((i % 3) == 1 && pid != 0)){
    1c00:	83 fa 01             	cmp    $0x1,%edx
    1c03:	0f 85 a1 00 00 00    	jne    1caa <concreate+0x27a>
      close(open(file, 0));
    1c09:	83 ec 08             	sub    $0x8,%esp
    1c0c:	6a 00                	push   $0x0
    1c0e:	53                   	push   %ebx
    1c0f:	e8 a6 22 00 00       	call   3eba <open>
    1c14:	89 04 24             	mov    %eax,(%esp)
    1c17:	e8 86 22 00 00       	call   3ea2 <close>
      close(open(file, 0));
    1c1c:	58                   	pop    %eax
    1c1d:	5a                   	pop    %edx
    1c1e:	6a 00                	push   $0x0
    1c20:	53                   	push   %ebx
    1c21:	e8 94 22 00 00       	call   3eba <open>
    1c26:	89 04 24             	mov    %eax,(%esp)
    1c29:	e8 74 22 00 00       	call   3ea2 <close>
      close(open(file, 0));
    1c2e:	59                   	pop    %ecx
    1c2f:	58                   	pop    %eax
    1c30:	6a 00                	push   $0x0
    1c32:	53                   	push   %ebx
    1c33:	e8 82 22 00 00       	call   3eba <open>
    1c38:	89 04 24             	mov    %eax,(%esp)
    1c3b:	e8 62 22 00 00       	call   3ea2 <close>
      close(open(file, 0));
    1c40:	58                   	pop    %eax
    1c41:	5a                   	pop    %edx
    1c42:	6a 00                	push   $0x0
    1c44:	53                   	push   %ebx
    1c45:	e8 70 22 00 00       	call   3eba <open>
    1c4a:	89 04 24             	mov    %eax,(%esp)
    1c4d:	e8 50 22 00 00       	call   3ea2 <close>
    1c52:	83 c4 10             	add    $0x10,%esp
      unlink(file);
      unlink(file);
      unlink(file);
      unlink(file);
    }
    if(pid == 0)
    1c55:	85 ff                	test   %edi,%edi
    1c57:	0f 84 dc fe ff ff    	je     1b39 <concreate+0x109>
      exit(0);
    else
      wait(0);
    1c5d:	83 ec 0c             	sub    $0xc,%esp
  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    exit(-1);
  }

  for(i = 0; i < 40; i++){
    1c60:	83 c6 01             	add    $0x1,%esi
      unlink(file);
    }
    if(pid == 0)
      exit(0);
    else
      wait(0);
    1c63:	6a 00                	push   $0x0
    1c65:	e8 10 22 00 00       	call   3e7a <wait>
  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    exit(-1);
  }

  for(i = 0; i < 40; i++){
    1c6a:	83 c4 10             	add    $0x10,%esp
    1c6d:	83 fe 28             	cmp    $0x28,%esi
    1c70:	74 5e                	je     1cd0 <concreate+0x2a0>
    file[1] = '0' + i;
    1c72:	8d 46 30             	lea    0x30(%esi),%eax
    1c75:	88 45 ae             	mov    %al,-0x52(%ebp)
    pid = fork();
    1c78:	e8 ed 21 00 00       	call   3e6a <fork>
    if(pid < 0){
    1c7d:	85 c0                	test   %eax,%eax
    exit(-1);
  }

  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    pid = fork();
    1c7f:	89 c7                	mov    %eax,%edi
    if(pid < 0){
    1c81:	78 64                	js     1ce7 <concreate+0x2b7>
      printf(1, "fork failed\n");
      exit(-1);
    }
    if(((i % 3) == 0 && pid == 0) ||
    1c83:	b8 56 55 55 55       	mov    $0x55555556,%eax
    1c88:	f7 ee                	imul   %esi
    1c8a:	89 f0                	mov    %esi,%eax
    1c8c:	c1 f8 1f             	sar    $0x1f,%eax
    1c8f:	29 c2                	sub    %eax,%edx
    1c91:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1c94:	89 f2                	mov    %esi,%edx
    1c96:	29 c2                	sub    %eax,%edx
    1c98:	89 f8                	mov    %edi,%eax
    1c9a:	09 d0                	or     %edx,%eax
    1c9c:	0f 84 67 ff ff ff    	je     1c09 <concreate+0x1d9>
       ((i % 3) == 1 && pid != 0)){
    1ca2:	85 ff                	test   %edi,%edi
    1ca4:	0f 85 56 ff ff ff    	jne    1c00 <concreate+0x1d0>
      close(open(file, 0));
      close(open(file, 0));
      close(open(file, 0));
      close(open(file, 0));
    } else {
      unlink(file);
    1caa:	83 ec 0c             	sub    $0xc,%esp
    1cad:	53                   	push   %ebx
    1cae:	e8 17 22 00 00       	call   3eca <unlink>
      unlink(file);
    1cb3:	89 1c 24             	mov    %ebx,(%esp)
    1cb6:	e8 0f 22 00 00       	call   3eca <unlink>
      unlink(file);
    1cbb:	89 1c 24             	mov    %ebx,(%esp)
    1cbe:	e8 07 22 00 00       	call   3eca <unlink>
      unlink(file);
    1cc3:	89 1c 24             	mov    %ebx,(%esp)
    1cc6:	e8 ff 21 00 00       	call   3eca <unlink>
    1ccb:	83 c4 10             	add    $0x10,%esp
    1cce:	eb 85                	jmp    1c55 <concreate+0x225>
      exit(0);
    else
      wait(0);
  }

  printf(1, "concreate ok\n");
    1cd0:	83 ec 08             	sub    $0x8,%esp
    1cd3:	68 9e 49 00 00       	push   $0x499e
    1cd8:	6a 01                	push   $0x1
    1cda:	e8 e1 22 00 00       	call   3fc0 <printf>
}
    1cdf:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1ce2:	5b                   	pop    %ebx
    1ce3:	5e                   	pop    %esi
    1ce4:	5f                   	pop    %edi
    1ce5:	5d                   	pop    %ebp
    1ce6:	c3                   	ret    

  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
    1ce7:	83 ec 08             	sub    $0x8,%esp
    1cea:	68 21 52 00 00       	push   $0x5221
    1cef:	6a 01                	push   $0x1
    1cf1:	e8 ca 22 00 00       	call   3fc0 <printf>
      exit(-1);
    1cf6:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    1cfd:	e8 70 21 00 00       	call   3e72 <exit>
    }
  }
  close(fd);

  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    1d02:	83 ec 08             	sub    $0x8,%esp
    1d05:	68 e8 54 00 00       	push   $0x54e8
    1d0a:	6a 01                	push   $0x1
    1d0c:	e8 af 22 00 00       	call   3fc0 <printf>
    exit(-1);
    1d11:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    1d18:	e8 55 21 00 00       	call   3e72 <exit>
      if(i < 0 || i >= sizeof(fa)){
        printf(1, "concreate weird file %s\n", de.name);
        exit(-1);
      }
      if(fa[i]){
        printf(1, "concreate duplicate file %s\n", de.name);
    1d1d:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1d20:	83 ec 04             	sub    $0x4,%esp
    1d23:	50                   	push   %eax
    1d24:	68 81 49 00 00       	push   $0x4981
    1d29:	6a 01                	push   $0x1
    1d2b:	e8 90 22 00 00       	call   3fc0 <printf>
        exit(-1);
    1d30:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    1d37:	e8 36 21 00 00       	call   3e72 <exit>
    if(de.inum == 0)
      continue;
    if(de.name[0] == 'C' && de.name[2] == '\0'){
      i = de.name[1] - '0';
      if(i < 0 || i >= sizeof(fa)){
        printf(1, "concreate weird file %s\n", de.name);
    1d3c:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1d3f:	83 ec 04             	sub    $0x4,%esp
    1d42:	50                   	push   %eax
    1d43:	68 68 49 00 00       	push   $0x4968
    1d48:	6a 01                	push   $0x1
    1d4a:	e8 71 22 00 00       	call   3fc0 <printf>
        exit(-1);
    1d4f:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    1d56:	e8 17 21 00 00       	call   3e72 <exit>
      fd = open(file, O_CREATE | O_RDWR);
      if(fd < 0){
        printf(1, "concreate create %s failed\n", file);
        exit(-1);
      }
      close(fd);
    1d5b:	83 ec 0c             	sub    $0xc,%esp
    1d5e:	50                   	push   %eax
    1d5f:	e8 3e 21 00 00       	call   3ea2 <close>
    1d64:	83 c4 10             	add    $0x10,%esp
    1d67:	e9 cd fd ff ff       	jmp    1b39 <concreate+0x109>
    1d6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001d70 <linkunlink>:

// another concurrent link/unlink/create test,
// to look for deadlocks.
void
linkunlink()
{
    1d70:	55                   	push   %ebp
    1d71:	89 e5                	mov    %esp,%ebp
    1d73:	57                   	push   %edi
    1d74:	56                   	push   %esi
    1d75:	53                   	push   %ebx
    1d76:	83 ec 24             	sub    $0x24,%esp
  int pid, i;

  printf(1, "linkunlink test\n");
    1d79:	68 ac 49 00 00       	push   $0x49ac
    1d7e:	6a 01                	push   $0x1
    1d80:	e8 3b 22 00 00       	call   3fc0 <printf>

  unlink("x");
    1d85:	c7 04 24 39 4c 00 00 	movl   $0x4c39,(%esp)
    1d8c:	e8 39 21 00 00       	call   3eca <unlink>
  pid = fork();
    1d91:	e8 d4 20 00 00       	call   3e6a <fork>
  if(pid < 0){
    1d96:	83 c4 10             	add    $0x10,%esp
    1d99:	85 c0                	test   %eax,%eax
  int pid, i;

  printf(1, "linkunlink test\n");

  unlink("x");
  pid = fork();
    1d9b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(pid < 0){
    1d9e:	0f 88 b6 00 00 00    	js     1e5a <linkunlink+0xea>
    printf(1, "fork failed\n");
    exit(-1);
  }

  unsigned int x = (pid ? 1 : 97);
    1da4:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
    1da8:	bb 64 00 00 00       	mov    $0x64,%ebx
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
    1dad:	be ab aa aa aa       	mov    $0xaaaaaaab,%esi
  if(pid < 0){
    printf(1, "fork failed\n");
    exit(-1);
  }

  unsigned int x = (pid ? 1 : 97);
    1db2:	19 ff                	sbb    %edi,%edi
    1db4:	83 e7 60             	and    $0x60,%edi
    1db7:	83 c7 01             	add    $0x1,%edi
    1dba:	eb 1e                	jmp    1dda <linkunlink+0x6a>
    1dbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
      close(open("x", O_RDWR | O_CREATE));
    } else if((x % 3) == 1){
    1dc0:	83 fa 01             	cmp    $0x1,%edx
    1dc3:	74 7b                	je     1e40 <linkunlink+0xd0>
      link("cat", "x");
    } else {
      unlink("x");
    1dc5:	83 ec 0c             	sub    $0xc,%esp
    1dc8:	68 39 4c 00 00       	push   $0x4c39
    1dcd:	e8 f8 20 00 00       	call   3eca <unlink>
    1dd2:	83 c4 10             	add    $0x10,%esp
    printf(1, "fork failed\n");
    exit(-1);
  }

  unsigned int x = (pid ? 1 : 97);
  for(i = 0; i < 100; i++){
    1dd5:	83 eb 01             	sub    $0x1,%ebx
    1dd8:	74 3d                	je     1e17 <linkunlink+0xa7>
    x = x * 1103515245 + 12345;
    1dda:	69 cf 6d 4e c6 41    	imul   $0x41c64e6d,%edi,%ecx
    1de0:	8d b9 39 30 00 00    	lea    0x3039(%ecx),%edi
    if((x % 3) == 0){
    1de6:	89 f8                	mov    %edi,%eax
    1de8:	f7 e6                	mul    %esi
    1dea:	d1 ea                	shr    %edx
    1dec:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1def:	89 fa                	mov    %edi,%edx
    1df1:	29 c2                	sub    %eax,%edx
    1df3:	75 cb                	jne    1dc0 <linkunlink+0x50>
      close(open("x", O_RDWR | O_CREATE));
    1df5:	83 ec 08             	sub    $0x8,%esp
    1df8:	68 02 02 00 00       	push   $0x202
    1dfd:	68 39 4c 00 00       	push   $0x4c39
    1e02:	e8 b3 20 00 00       	call   3eba <open>
    1e07:	89 04 24             	mov    %eax,(%esp)
    1e0a:	e8 93 20 00 00       	call   3ea2 <close>
    1e0f:	83 c4 10             	add    $0x10,%esp
    printf(1, "fork failed\n");
    exit(-1);
  }

  unsigned int x = (pid ? 1 : 97);
  for(i = 0; i < 100; i++){
    1e12:	83 eb 01             	sub    $0x1,%ebx
    1e15:	75 c3                	jne    1dda <linkunlink+0x6a>
    } else {
      unlink("x");
    }
  }

  if(pid)
    1e17:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    1e1a:	85 c9                	test   %ecx,%ecx
    1e1c:	74 57                	je     1e75 <linkunlink+0x105>
    wait(0);
    1e1e:	83 ec 0c             	sub    $0xc,%esp
    1e21:	6a 00                	push   $0x0
    1e23:	e8 52 20 00 00       	call   3e7a <wait>
  else
    exit(0);

  printf(1, "linkunlink ok\n");
    1e28:	58                   	pop    %eax
    1e29:	5a                   	pop    %edx
    1e2a:	68 c1 49 00 00       	push   $0x49c1
    1e2f:	6a 01                	push   $0x1
    1e31:	e8 8a 21 00 00       	call   3fc0 <printf>
}
    1e36:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1e39:	5b                   	pop    %ebx
    1e3a:	5e                   	pop    %esi
    1e3b:	5f                   	pop    %edi
    1e3c:	5d                   	pop    %ebp
    1e3d:	c3                   	ret    
    1e3e:	66 90                	xchg   %ax,%ax
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
      close(open("x", O_RDWR | O_CREATE));
    } else if((x % 3) == 1){
      link("cat", "x");
    1e40:	83 ec 08             	sub    $0x8,%esp
    1e43:	68 39 4c 00 00       	push   $0x4c39
    1e48:	68 bd 49 00 00       	push   $0x49bd
    1e4d:	e8 88 20 00 00       	call   3eda <link>
    1e52:	83 c4 10             	add    $0x10,%esp
    1e55:	e9 7b ff ff ff       	jmp    1dd5 <linkunlink+0x65>
  printf(1, "linkunlink test\n");

  unlink("x");
  pid = fork();
  if(pid < 0){
    printf(1, "fork failed\n");
    1e5a:	83 ec 08             	sub    $0x8,%esp
    1e5d:	68 21 52 00 00       	push   $0x5221
    1e62:	6a 01                	push   $0x1
    1e64:	e8 57 21 00 00       	call   3fc0 <printf>
    exit(-1);
    1e69:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    1e70:	e8 fd 1f 00 00       	call   3e72 <exit>
  }

  if(pid)
    wait(0);
  else
    exit(0);
    1e75:	83 ec 0c             	sub    $0xc,%esp
    1e78:	6a 00                	push   $0x0
    1e7a:	e8 f3 1f 00 00       	call   3e72 <exit>
    1e7f:	90                   	nop

00001e80 <bigdir>:
}

// directory that uses indirect blocks
void
bigdir(void)
{
    1e80:	55                   	push   %ebp
    1e81:	89 e5                	mov    %esp,%ebp
    1e83:	56                   	push   %esi
    1e84:	53                   	push   %ebx
    1e85:	83 ec 18             	sub    $0x18,%esp
  int i, fd;
  char name[10];

  printf(1, "bigdir test\n");
    1e88:	68 d0 49 00 00       	push   $0x49d0
    1e8d:	6a 01                	push   $0x1
    1e8f:	e8 2c 21 00 00       	call   3fc0 <printf>
  unlink("bd");
    1e94:	c7 04 24 dd 49 00 00 	movl   $0x49dd,(%esp)
    1e9b:	e8 2a 20 00 00       	call   3eca <unlink>

  fd = open("bd", O_CREATE);
    1ea0:	58                   	pop    %eax
    1ea1:	5a                   	pop    %edx
    1ea2:	68 00 02 00 00       	push   $0x200
    1ea7:	68 dd 49 00 00       	push   $0x49dd
    1eac:	e8 09 20 00 00       	call   3eba <open>
  if(fd < 0){
    1eb1:	83 c4 10             	add    $0x10,%esp
    1eb4:	85 c0                	test   %eax,%eax
    1eb6:	0f 88 ec 00 00 00    	js     1fa8 <bigdir+0x128>
    printf(1, "bigdir create failed\n");
    exit(-1);
  }
  close(fd);
    1ebc:	83 ec 0c             	sub    $0xc,%esp
    1ebf:	8d 75 ee             	lea    -0x12(%ebp),%esi

  for(i = 0; i < 500; i++){
    1ec2:	31 db                	xor    %ebx,%ebx
  fd = open("bd", O_CREATE);
  if(fd < 0){
    printf(1, "bigdir create failed\n");
    exit(-1);
  }
  close(fd);
    1ec4:	50                   	push   %eax
    1ec5:	e8 d8 1f 00 00       	call   3ea2 <close>
    1eca:	83 c4 10             	add    $0x10,%esp
    1ecd:	8d 76 00             	lea    0x0(%esi),%esi

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1ed0:	89 d8                	mov    %ebx,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(link("bd", name) != 0){
    1ed2:	83 ec 08             	sub    $0x8,%esp
    exit(-1);
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    1ed5:	c6 45 ee 78          	movb   $0x78,-0x12(%ebp)
    name[1] = '0' + (i / 64);
    1ed9:	c1 f8 06             	sar    $0x6,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(link("bd", name) != 0){
    1edc:	56                   	push   %esi
    1edd:	68 dd 49 00 00       	push   $0x49dd
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1ee2:	83 c0 30             	add    $0x30,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    1ee5:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1ee9:	88 45 ef             	mov    %al,-0x11(%ebp)
    name[2] = '0' + (i % 64);
    1eec:	89 d8                	mov    %ebx,%eax
    1eee:	83 e0 3f             	and    $0x3f,%eax
    1ef1:	83 c0 30             	add    $0x30,%eax
    1ef4:	88 45 f0             	mov    %al,-0x10(%ebp)
    name[3] = '\0';
    if(link("bd", name) != 0){
    1ef7:	e8 de 1f 00 00       	call   3eda <link>
    1efc:	83 c4 10             	add    $0x10,%esp
    1eff:	85 c0                	test   %eax,%eax
    1f01:	75 6f                	jne    1f72 <bigdir+0xf2>
    printf(1, "bigdir create failed\n");
    exit(-1);
  }
  close(fd);

  for(i = 0; i < 500; i++){
    1f03:	83 c3 01             	add    $0x1,%ebx
    1f06:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    1f0c:	75 c2                	jne    1ed0 <bigdir+0x50>
      printf(1, "bigdir link failed\n");
      exit(-1);
    }
  }

  unlink("bd");
    1f0e:	83 ec 0c             	sub    $0xc,%esp
  for(i = 0; i < 500; i++){
    1f11:	31 db                	xor    %ebx,%ebx
      printf(1, "bigdir link failed\n");
      exit(-1);
    }
  }

  unlink("bd");
    1f13:	68 dd 49 00 00       	push   $0x49dd
    1f18:	e8 ad 1f 00 00       	call   3eca <unlink>
    1f1d:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1f20:	89 d8                	mov    %ebx,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(unlink(name) != 0){
    1f22:	83 ec 0c             	sub    $0xc,%esp
    }
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    1f25:	c6 45 ee 78          	movb   $0x78,-0x12(%ebp)
    name[1] = '0' + (i / 64);
    1f29:	c1 f8 06             	sar    $0x6,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(unlink(name) != 0){
    1f2c:	56                   	push   %esi
  unlink("bd");
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    1f2d:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1f31:	83 c0 30             	add    $0x30,%eax
    1f34:	88 45 ef             	mov    %al,-0x11(%ebp)
    name[2] = '0' + (i % 64);
    1f37:	89 d8                	mov    %ebx,%eax
    1f39:	83 e0 3f             	and    $0x3f,%eax
    1f3c:	83 c0 30             	add    $0x30,%eax
    1f3f:	88 45 f0             	mov    %al,-0x10(%ebp)
    name[3] = '\0';
    if(unlink(name) != 0){
    1f42:	e8 83 1f 00 00       	call   3eca <unlink>
    1f47:	83 c4 10             	add    $0x10,%esp
    1f4a:	85 c0                	test   %eax,%eax
    1f4c:	75 3f                	jne    1f8d <bigdir+0x10d>
      exit(-1);
    }
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    1f4e:	83 c3 01             	add    $0x1,%ebx
    1f51:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    1f57:	75 c7                	jne    1f20 <bigdir+0xa0>
      printf(1, "bigdir unlink failed");
      exit(-1);
    }
  }

  printf(1, "bigdir ok\n");
    1f59:	83 ec 08             	sub    $0x8,%esp
    1f5c:	68 1f 4a 00 00       	push   $0x4a1f
    1f61:	6a 01                	push   $0x1
    1f63:	e8 58 20 00 00       	call   3fc0 <printf>
}
    1f68:	83 c4 10             	add    $0x10,%esp
    1f6b:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1f6e:	5b                   	pop    %ebx
    1f6f:	5e                   	pop    %esi
    1f70:	5d                   	pop    %ebp
    1f71:	c3                   	ret    
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(link("bd", name) != 0){
      printf(1, "bigdir link failed\n");
    1f72:	83 ec 08             	sub    $0x8,%esp
    1f75:	68 f6 49 00 00       	push   $0x49f6
    1f7a:	6a 01                	push   $0x1
    1f7c:	e8 3f 20 00 00       	call   3fc0 <printf>
      exit(-1);
    1f81:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    1f88:	e8 e5 1e 00 00       	call   3e72 <exit>
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(unlink(name) != 0){
      printf(1, "bigdir unlink failed");
    1f8d:	83 ec 08             	sub    $0x8,%esp
    1f90:	68 0a 4a 00 00       	push   $0x4a0a
    1f95:	6a 01                	push   $0x1
    1f97:	e8 24 20 00 00       	call   3fc0 <printf>
      exit(-1);
    1f9c:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    1fa3:	e8 ca 1e 00 00       	call   3e72 <exit>
  printf(1, "bigdir test\n");
  unlink("bd");

  fd = open("bd", O_CREATE);
  if(fd < 0){
    printf(1, "bigdir create failed\n");
    1fa8:	83 ec 08             	sub    $0x8,%esp
    1fab:	68 e0 49 00 00       	push   $0x49e0
    1fb0:	6a 01                	push   $0x1
    1fb2:	e8 09 20 00 00       	call   3fc0 <printf>
    exit(-1);
    1fb7:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    1fbe:	e8 af 1e 00 00       	call   3e72 <exit>
    1fc3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1fc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001fd0 <subdir>:
  printf(1, "bigdir ok\n");
}

void
subdir(void)
{
    1fd0:	55                   	push   %ebp
    1fd1:	89 e5                	mov    %esp,%ebp
    1fd3:	53                   	push   %ebx
    1fd4:	83 ec 0c             	sub    $0xc,%esp
  int fd, cc;

  printf(1, "subdir test\n");
    1fd7:	68 2a 4a 00 00       	push   $0x4a2a
    1fdc:	6a 01                	push   $0x1
    1fde:	e8 dd 1f 00 00       	call   3fc0 <printf>

  unlink("ff");
    1fe3:	c7 04 24 b3 4a 00 00 	movl   $0x4ab3,(%esp)
    1fea:	e8 db 1e 00 00       	call   3eca <unlink>
  if(mkdir("dd") != 0){
    1fef:	c7 04 24 50 4b 00 00 	movl   $0x4b50,(%esp)
    1ff6:	e8 e7 1e 00 00       	call   3ee2 <mkdir>
    1ffb:	83 c4 10             	add    $0x10,%esp
    1ffe:	85 c0                	test   %eax,%eax
    2000:	0f 85 4d 06 00 00    	jne    2653 <subdir+0x683>
    printf(1, "subdir mkdir dd failed\n");
    exit(-1);
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    2006:	83 ec 08             	sub    $0x8,%esp
    2009:	68 02 02 00 00       	push   $0x202
    200e:	68 89 4a 00 00       	push   $0x4a89
    2013:	e8 a2 1e 00 00       	call   3eba <open>
  if(fd < 0){
    2018:	83 c4 10             	add    $0x10,%esp
    201b:	85 c0                	test   %eax,%eax
  if(mkdir("dd") != 0){
    printf(1, "subdir mkdir dd failed\n");
    exit(-1);
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    201d:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    201f:	0f 88 14 06 00 00    	js     2639 <subdir+0x669>
    printf(1, "create dd/ff failed\n");
    exit(-1);
  }
  write(fd, "ff", 2);
    2025:	83 ec 04             	sub    $0x4,%esp
    2028:	6a 02                	push   $0x2
    202a:	68 b3 4a 00 00       	push   $0x4ab3
    202f:	50                   	push   %eax
    2030:	e8 65 1e 00 00       	call   3e9a <write>
  close(fd);
    2035:	89 1c 24             	mov    %ebx,(%esp)
    2038:	e8 65 1e 00 00       	call   3ea2 <close>

  if(unlink("dd") >= 0){
    203d:	c7 04 24 50 4b 00 00 	movl   $0x4b50,(%esp)
    2044:	e8 81 1e 00 00       	call   3eca <unlink>
    2049:	83 c4 10             	add    $0x10,%esp
    204c:	85 c0                	test   %eax,%eax
    204e:	0f 89 cb 05 00 00    	jns    261f <subdir+0x64f>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    exit(0);
  }

  if(mkdir("/dd/dd") != 0){
    2054:	83 ec 0c             	sub    $0xc,%esp
    2057:	68 64 4a 00 00       	push   $0x4a64
    205c:	e8 81 1e 00 00       	call   3ee2 <mkdir>
    2061:	83 c4 10             	add    $0x10,%esp
    2064:	85 c0                	test   %eax,%eax
    2066:	0f 85 99 05 00 00    	jne    2605 <subdir+0x635>
    printf(1, "subdir mkdir dd/dd failed\n");
    exit(-1);
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    206c:	83 ec 08             	sub    $0x8,%esp
    206f:	68 02 02 00 00       	push   $0x202
    2074:	68 86 4a 00 00       	push   $0x4a86
    2079:	e8 3c 1e 00 00       	call   3eba <open>
  if(fd < 0){
    207e:	83 c4 10             	add    $0x10,%esp
    2081:	85 c0                	test   %eax,%eax
  if(mkdir("/dd/dd") != 0){
    printf(1, "subdir mkdir dd/dd failed\n");
    exit(-1);
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    2083:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    2085:	0f 88 5c 04 00 00    	js     24e7 <subdir+0x517>
    printf(1, "create dd/dd/ff failed\n");
    exit(-1);
  }
  write(fd, "FF", 2);
    208b:	83 ec 04             	sub    $0x4,%esp
    208e:	6a 02                	push   $0x2
    2090:	68 a7 4a 00 00       	push   $0x4aa7
    2095:	50                   	push   %eax
    2096:	e8 ff 1d 00 00       	call   3e9a <write>
  close(fd);
    209b:	89 1c 24             	mov    %ebx,(%esp)
    209e:	e8 ff 1d 00 00       	call   3ea2 <close>

  fd = open("dd/dd/../ff", 0);
    20a3:	58                   	pop    %eax
    20a4:	5a                   	pop    %edx
    20a5:	6a 00                	push   $0x0
    20a7:	68 aa 4a 00 00       	push   $0x4aaa
    20ac:	e8 09 1e 00 00       	call   3eba <open>
  if(fd < 0){
    20b1:	83 c4 10             	add    $0x10,%esp
    20b4:	85 c0                	test   %eax,%eax
    exit(-1);
  }
  write(fd, "FF", 2);
  close(fd);

  fd = open("dd/dd/../ff", 0);
    20b6:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    20b8:	0f 88 0f 04 00 00    	js     24cd <subdir+0x4fd>
    printf(1, "open dd/dd/../ff failed\n");
    exit(-1);
  }
  cc = read(fd, buf, sizeof(buf));
    20be:	83 ec 04             	sub    $0x4,%esp
    20c1:	68 00 20 00 00       	push   $0x2000
    20c6:	68 60 8b 00 00       	push   $0x8b60
    20cb:	50                   	push   %eax
    20cc:	e8 c1 1d 00 00       	call   3e92 <read>
  if(cc != 2 || buf[0] != 'f'){
    20d1:	83 c4 10             	add    $0x10,%esp
    20d4:	83 f8 02             	cmp    $0x2,%eax
    20d7:	0f 85 3a 03 00 00    	jne    2417 <subdir+0x447>
    20dd:	80 3d 60 8b 00 00 66 	cmpb   $0x66,0x8b60
    20e4:	0f 85 2d 03 00 00    	jne    2417 <subdir+0x447>
    printf(1, "dd/dd/../ff wrong content\n");
    exit(-1);
  }
  close(fd);
    20ea:	83 ec 0c             	sub    $0xc,%esp
    20ed:	53                   	push   %ebx
    20ee:	e8 af 1d 00 00       	call   3ea2 <close>

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    20f3:	5b                   	pop    %ebx
    20f4:	58                   	pop    %eax
    20f5:	68 ea 4a 00 00       	push   $0x4aea
    20fa:	68 86 4a 00 00       	push   $0x4a86
    20ff:	e8 d6 1d 00 00       	call   3eda <link>
    2104:	83 c4 10             	add    $0x10,%esp
    2107:	85 c0                	test   %eax,%eax
    2109:	0f 85 0c 04 00 00    	jne    251b <subdir+0x54b>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    exit(-1);
  }

  if(unlink("dd/dd/ff") != 0){
    210f:	83 ec 0c             	sub    $0xc,%esp
    2112:	68 86 4a 00 00       	push   $0x4a86
    2117:	e8 ae 1d 00 00       	call   3eca <unlink>
    211c:	83 c4 10             	add    $0x10,%esp
    211f:	85 c0                	test   %eax,%eax
    2121:	0f 85 24 03 00 00    	jne    244b <subdir+0x47b>
    printf(1, "unlink dd/dd/ff failed\n");
    exit(-1);
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    2127:	83 ec 08             	sub    $0x8,%esp
    212a:	6a 00                	push   $0x0
    212c:	68 86 4a 00 00       	push   $0x4a86
    2131:	e8 84 1d 00 00       	call   3eba <open>
    2136:	83 c4 10             	add    $0x10,%esp
    2139:	85 c0                	test   %eax,%eax
    213b:	0f 89 aa 04 00 00    	jns    25eb <subdir+0x61b>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    exit(-1);
  }

  if(chdir("dd") != 0){
    2141:	83 ec 0c             	sub    $0xc,%esp
    2144:	68 50 4b 00 00       	push   $0x4b50
    2149:	e8 9c 1d 00 00       	call   3eea <chdir>
    214e:	83 c4 10             	add    $0x10,%esp
    2151:	85 c0                	test   %eax,%eax
    2153:	0f 85 78 04 00 00    	jne    25d1 <subdir+0x601>
    printf(1, "chdir dd failed\n");
    exit(-1);
  }
  if(chdir("dd/../../dd") != 0){
    2159:	83 ec 0c             	sub    $0xc,%esp
    215c:	68 1e 4b 00 00       	push   $0x4b1e
    2161:	e8 84 1d 00 00       	call   3eea <chdir>
    2166:	83 c4 10             	add    $0x10,%esp
    2169:	85 c0                	test   %eax,%eax
    216b:	0f 85 c0 02 00 00    	jne    2431 <subdir+0x461>
    printf(1, "chdir dd/../../dd failed\n");
    exit(-1);
  }
  if(chdir("dd/../../../dd") != 0){
    2171:	83 ec 0c             	sub    $0xc,%esp
    2174:	68 44 4b 00 00       	push   $0x4b44
    2179:	e8 6c 1d 00 00       	call   3eea <chdir>
    217e:	83 c4 10             	add    $0x10,%esp
    2181:	85 c0                	test   %eax,%eax
    2183:	0f 85 a8 02 00 00    	jne    2431 <subdir+0x461>
    printf(1, "chdir dd/../../dd failed\n");
    exit(-1);
  }
  if(chdir("./..") != 0){
    2189:	83 ec 0c             	sub    $0xc,%esp
    218c:	68 53 4b 00 00       	push   $0x4b53
    2191:	e8 54 1d 00 00       	call   3eea <chdir>
    2196:	83 c4 10             	add    $0x10,%esp
    2199:	85 c0                	test   %eax,%eax
    219b:	0f 85 60 03 00 00    	jne    2501 <subdir+0x531>
    printf(1, "chdir ./.. failed\n");
    exit(-1);
  }

  fd = open("dd/dd/ffff", 0);
    21a1:	83 ec 08             	sub    $0x8,%esp
    21a4:	6a 00                	push   $0x0
    21a6:	68 ea 4a 00 00       	push   $0x4aea
    21ab:	e8 0a 1d 00 00       	call   3eba <open>
  if(fd < 0){
    21b0:	83 c4 10             	add    $0x10,%esp
    21b3:	85 c0                	test   %eax,%eax
  if(chdir("./..") != 0){
    printf(1, "chdir ./.. failed\n");
    exit(-1);
  }

  fd = open("dd/dd/ffff", 0);
    21b5:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    21b7:	0f 88 ce 05 00 00    	js     278b <subdir+0x7bb>
    printf(1, "open dd/dd/ffff failed\n");
    exit(-1);
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    21bd:	83 ec 04             	sub    $0x4,%esp
    21c0:	68 00 20 00 00       	push   $0x2000
    21c5:	68 60 8b 00 00       	push   $0x8b60
    21ca:	50                   	push   %eax
    21cb:	e8 c2 1c 00 00       	call   3e92 <read>
    21d0:	83 c4 10             	add    $0x10,%esp
    21d3:	83 f8 02             	cmp    $0x2,%eax
    21d6:	0f 85 95 05 00 00    	jne    2771 <subdir+0x7a1>
    printf(1, "read dd/dd/ffff wrong len\n");
    exit(-1);
  }
  close(fd);
    21dc:	83 ec 0c             	sub    $0xc,%esp
    21df:	53                   	push   %ebx
    21e0:	e8 bd 1c 00 00       	call   3ea2 <close>

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    21e5:	59                   	pop    %ecx
    21e6:	5b                   	pop    %ebx
    21e7:	6a 00                	push   $0x0
    21e9:	68 86 4a 00 00       	push   $0x4a86
    21ee:	e8 c7 1c 00 00       	call   3eba <open>
    21f3:	83 c4 10             	add    $0x10,%esp
    21f6:	85 c0                	test   %eax,%eax
    21f8:	0f 89 81 02 00 00    	jns    247f <subdir+0x4af>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    exit(0);
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    21fe:	83 ec 08             	sub    $0x8,%esp
    2201:	68 02 02 00 00       	push   $0x202
    2206:	68 9e 4b 00 00       	push   $0x4b9e
    220b:	e8 aa 1c 00 00       	call   3eba <open>
    2210:	83 c4 10             	add    $0x10,%esp
    2213:	85 c0                	test   %eax,%eax
    2215:	0f 89 4a 02 00 00    	jns    2465 <subdir+0x495>
    printf(1, "create dd/ff/ff succeeded!\n");
    exit(0);
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    221b:	83 ec 08             	sub    $0x8,%esp
    221e:	68 02 02 00 00       	push   $0x202
    2223:	68 c3 4b 00 00       	push   $0x4bc3
    2228:	e8 8d 1c 00 00       	call   3eba <open>
    222d:	83 c4 10             	add    $0x10,%esp
    2230:	85 c0                	test   %eax,%eax
    2232:	0f 89 7f 03 00 00    	jns    25b7 <subdir+0x5e7>
    printf(1, "create dd/xx/ff succeeded!\n");
    exit(0);
  }
  if(open("dd", O_CREATE) >= 0){
    2238:	83 ec 08             	sub    $0x8,%esp
    223b:	68 00 02 00 00       	push   $0x200
    2240:	68 50 4b 00 00       	push   $0x4b50
    2245:	e8 70 1c 00 00       	call   3eba <open>
    224a:	83 c4 10             	add    $0x10,%esp
    224d:	85 c0                	test   %eax,%eax
    224f:	0f 89 48 03 00 00    	jns    259d <subdir+0x5cd>
    printf(1, "create dd succeeded!\n");
    exit(0);
  }
  if(open("dd", O_RDWR) >= 0){
    2255:	83 ec 08             	sub    $0x8,%esp
    2258:	6a 02                	push   $0x2
    225a:	68 50 4b 00 00       	push   $0x4b50
    225f:	e8 56 1c 00 00       	call   3eba <open>
    2264:	83 c4 10             	add    $0x10,%esp
    2267:	85 c0                	test   %eax,%eax
    2269:	0f 89 14 03 00 00    	jns    2583 <subdir+0x5b3>
    printf(1, "open dd rdwr succeeded!\n");
    exit(0);
  }
  if(open("dd", O_WRONLY) >= 0){
    226f:	83 ec 08             	sub    $0x8,%esp
    2272:	6a 01                	push   $0x1
    2274:	68 50 4b 00 00       	push   $0x4b50
    2279:	e8 3c 1c 00 00       	call   3eba <open>
    227e:	83 c4 10             	add    $0x10,%esp
    2281:	85 c0                	test   %eax,%eax
    2283:	0f 89 e0 02 00 00    	jns    2569 <subdir+0x599>
    printf(1, "open dd wronly succeeded!\n");
    exit(0);
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    2289:	83 ec 08             	sub    $0x8,%esp
    228c:	68 32 4c 00 00       	push   $0x4c32
    2291:	68 9e 4b 00 00       	push   $0x4b9e
    2296:	e8 3f 1c 00 00       	call   3eda <link>
    229b:	83 c4 10             	add    $0x10,%esp
    229e:	85 c0                	test   %eax,%eax
    22a0:	0f 84 a9 02 00 00    	je     254f <subdir+0x57f>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    exit(0);
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    22a6:	83 ec 08             	sub    $0x8,%esp
    22a9:	68 32 4c 00 00       	push   $0x4c32
    22ae:	68 c3 4b 00 00       	push   $0x4bc3
    22b3:	e8 22 1c 00 00       	call   3eda <link>
    22b8:	83 c4 10             	add    $0x10,%esp
    22bb:	85 c0                	test   %eax,%eax
    22bd:	0f 84 72 02 00 00    	je     2535 <subdir+0x565>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    exit(0);
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    22c3:	83 ec 08             	sub    $0x8,%esp
    22c6:	68 ea 4a 00 00       	push   $0x4aea
    22cb:	68 89 4a 00 00       	push   $0x4a89
    22d0:	e8 05 1c 00 00       	call   3eda <link>
    22d5:	83 c4 10             	add    $0x10,%esp
    22d8:	85 c0                	test   %eax,%eax
    22da:	0f 84 d3 01 00 00    	je     24b3 <subdir+0x4e3>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    exit(0);
  }
  if(mkdir("dd/ff/ff") == 0){
    22e0:	83 ec 0c             	sub    $0xc,%esp
    22e3:	68 9e 4b 00 00       	push   $0x4b9e
    22e8:	e8 f5 1b 00 00       	call   3ee2 <mkdir>
    22ed:	83 c4 10             	add    $0x10,%esp
    22f0:	85 c0                	test   %eax,%eax
    22f2:	0f 84 a1 01 00 00    	je     2499 <subdir+0x4c9>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    exit(0);
  }
  if(mkdir("dd/xx/ff") == 0){
    22f8:	83 ec 0c             	sub    $0xc,%esp
    22fb:	68 c3 4b 00 00       	push   $0x4bc3
    2300:	e8 dd 1b 00 00       	call   3ee2 <mkdir>
    2305:	83 c4 10             	add    $0x10,%esp
    2308:	85 c0                	test   %eax,%eax
    230a:	0f 84 47 04 00 00    	je     2757 <subdir+0x787>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    exit(0);
  }
  if(mkdir("dd/dd/ffff") == 0){
    2310:	83 ec 0c             	sub    $0xc,%esp
    2313:	68 ea 4a 00 00       	push   $0x4aea
    2318:	e8 c5 1b 00 00       	call   3ee2 <mkdir>
    231d:	83 c4 10             	add    $0x10,%esp
    2320:	85 c0                	test   %eax,%eax
    2322:	0f 84 15 04 00 00    	je     273d <subdir+0x76d>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    exit(0);
  }
  if(unlink("dd/xx/ff") == 0){
    2328:	83 ec 0c             	sub    $0xc,%esp
    232b:	68 c3 4b 00 00       	push   $0x4bc3
    2330:	e8 95 1b 00 00       	call   3eca <unlink>
    2335:	83 c4 10             	add    $0x10,%esp
    2338:	85 c0                	test   %eax,%eax
    233a:	0f 84 e3 03 00 00    	je     2723 <subdir+0x753>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    exit(0);
  }
  if(unlink("dd/ff/ff") == 0){
    2340:	83 ec 0c             	sub    $0xc,%esp
    2343:	68 9e 4b 00 00       	push   $0x4b9e
    2348:	e8 7d 1b 00 00       	call   3eca <unlink>
    234d:	83 c4 10             	add    $0x10,%esp
    2350:	85 c0                	test   %eax,%eax
    2352:	0f 84 b1 03 00 00    	je     2709 <subdir+0x739>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    exit(0);
  }
  if(chdir("dd/ff") == 0){
    2358:	83 ec 0c             	sub    $0xc,%esp
    235b:	68 89 4a 00 00       	push   $0x4a89
    2360:	e8 85 1b 00 00       	call   3eea <chdir>
    2365:	83 c4 10             	add    $0x10,%esp
    2368:	85 c0                	test   %eax,%eax
    236a:	0f 84 7f 03 00 00    	je     26ef <subdir+0x71f>
    printf(1, "chdir dd/ff succeeded!\n");
    exit(0);
  }
  if(chdir("dd/xx") == 0){
    2370:	83 ec 0c             	sub    $0xc,%esp
    2373:	68 35 4c 00 00       	push   $0x4c35
    2378:	e8 6d 1b 00 00       	call   3eea <chdir>
    237d:	83 c4 10             	add    $0x10,%esp
    2380:	85 c0                	test   %eax,%eax
    2382:	0f 84 4d 03 00 00    	je     26d5 <subdir+0x705>
    printf(1, "chdir dd/xx succeeded!\n");
    exit(0);
  }

  if(unlink("dd/dd/ffff") != 0){
    2388:	83 ec 0c             	sub    $0xc,%esp
    238b:	68 ea 4a 00 00       	push   $0x4aea
    2390:	e8 35 1b 00 00       	call   3eca <unlink>
    2395:	83 c4 10             	add    $0x10,%esp
    2398:	85 c0                	test   %eax,%eax
    239a:	0f 85 ab 00 00 00    	jne    244b <subdir+0x47b>
    printf(1, "unlink dd/dd/ff failed\n");
    exit(-1);
  }
  if(unlink("dd/ff") != 0){
    23a0:	83 ec 0c             	sub    $0xc,%esp
    23a3:	68 89 4a 00 00       	push   $0x4a89
    23a8:	e8 1d 1b 00 00       	call   3eca <unlink>
    23ad:	83 c4 10             	add    $0x10,%esp
    23b0:	85 c0                	test   %eax,%eax
    23b2:	0f 85 03 03 00 00    	jne    26bb <subdir+0x6eb>
    printf(1, "unlink dd/ff failed\n");
    exit(-1);
  }
  if(unlink("dd") == 0){
    23b8:	83 ec 0c             	sub    $0xc,%esp
    23bb:	68 50 4b 00 00       	push   $0x4b50
    23c0:	e8 05 1b 00 00       	call   3eca <unlink>
    23c5:	83 c4 10             	add    $0x10,%esp
    23c8:	85 c0                	test   %eax,%eax
    23ca:	0f 84 d1 02 00 00    	je     26a1 <subdir+0x6d1>
    printf(1, "unlink non-empty dd succeeded!\n");
    exit(0);
  }
  if(unlink("dd/dd") < 0){
    23d0:	83 ec 0c             	sub    $0xc,%esp
    23d3:	68 65 4a 00 00       	push   $0x4a65
    23d8:	e8 ed 1a 00 00       	call   3eca <unlink>
    23dd:	83 c4 10             	add    $0x10,%esp
    23e0:	85 c0                	test   %eax,%eax
    23e2:	0f 88 9f 02 00 00    	js     2687 <subdir+0x6b7>
    printf(1, "unlink dd/dd failed\n");
    exit(-1);
  }
  if(unlink("dd") < 0){
    23e8:	83 ec 0c             	sub    $0xc,%esp
    23eb:	68 50 4b 00 00       	push   $0x4b50
    23f0:	e8 d5 1a 00 00       	call   3eca <unlink>
    23f5:	83 c4 10             	add    $0x10,%esp
    23f8:	85 c0                	test   %eax,%eax
    23fa:	0f 88 6d 02 00 00    	js     266d <subdir+0x69d>
    printf(1, "unlink dd failed\n");
    exit(-1);
  }

  printf(1, "subdir ok\n");
    2400:	83 ec 08             	sub    $0x8,%esp
    2403:	68 32 4d 00 00       	push   $0x4d32
    2408:	6a 01                	push   $0x1
    240a:	e8 b1 1b 00 00       	call   3fc0 <printf>
}
    240f:	83 c4 10             	add    $0x10,%esp
    2412:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2415:	c9                   	leave  
    2416:	c3                   	ret    
    printf(1, "open dd/dd/../ff failed\n");
    exit(-1);
  }
  cc = read(fd, buf, sizeof(buf));
  if(cc != 2 || buf[0] != 'f'){
    printf(1, "dd/dd/../ff wrong content\n");
    2417:	50                   	push   %eax
    2418:	50                   	push   %eax
    2419:	68 cf 4a 00 00       	push   $0x4acf
    241e:	6a 01                	push   $0x1
    2420:	e8 9b 1b 00 00       	call   3fc0 <printf>
    exit(-1);
    2425:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    242c:	e8 41 1a 00 00       	call   3e72 <exit>
  if(chdir("dd") != 0){
    printf(1, "chdir dd failed\n");
    exit(-1);
  }
  if(chdir("dd/../../dd") != 0){
    printf(1, "chdir dd/../../dd failed\n");
    2431:	50                   	push   %eax
    2432:	50                   	push   %eax
    2433:	68 2a 4b 00 00       	push   $0x4b2a
    2438:	6a 01                	push   $0x1
    243a:	e8 81 1b 00 00       	call   3fc0 <printf>
    exit(-1);
    243f:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    2446:	e8 27 1a 00 00       	call   3e72 <exit>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    exit(-1);
  }

  if(unlink("dd/dd/ff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    244b:	52                   	push   %edx
    244c:	52                   	push   %edx
    244d:	68 f5 4a 00 00       	push   $0x4af5
    2452:	6a 01                	push   $0x1
    2454:	e8 67 1b 00 00       	call   3fc0 <printf>
    exit(-1);
    2459:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    2460:	e8 0d 1a 00 00       	call   3e72 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    exit(0);
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/ff/ff succeeded!\n");
    2465:	50                   	push   %eax
    2466:	50                   	push   %eax
    2467:	68 a7 4b 00 00       	push   $0x4ba7
    246c:	6a 01                	push   $0x1
    246e:	e8 4d 1b 00 00       	call   3fc0 <printf>
    exit(0);
    2473:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    247a:	e8 f3 19 00 00       	call   3e72 <exit>
    exit(-1);
  }
  close(fd);

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    247f:	52                   	push   %edx
    2480:	52                   	push   %edx
    2481:	68 8c 55 00 00       	push   $0x558c
    2486:	6a 01                	push   $0x1
    2488:	e8 33 1b 00 00       	call   3fc0 <printf>
    exit(0);
    248d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2494:	e8 d9 19 00 00       	call   3e72 <exit>
  if(link("dd/ff", "dd/dd/ffff") == 0){
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    exit(0);
  }
  if(mkdir("dd/ff/ff") == 0){
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    2499:	52                   	push   %edx
    249a:	52                   	push   %edx
    249b:	68 3b 4c 00 00       	push   $0x4c3b
    24a0:	6a 01                	push   $0x1
    24a2:	e8 19 1b 00 00       	call   3fc0 <printf>
    exit(0);
    24a7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    24ae:	e8 bf 19 00 00       	call   3e72 <exit>
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    exit(0);
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    24b3:	51                   	push   %ecx
    24b4:	51                   	push   %ecx
    24b5:	68 fc 55 00 00       	push   $0x55fc
    24ba:	6a 01                	push   $0x1
    24bc:	e8 ff 1a 00 00       	call   3fc0 <printf>
    exit(0);
    24c1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    24c8:	e8 a5 19 00 00       	call   3e72 <exit>
  write(fd, "FF", 2);
  close(fd);

  fd = open("dd/dd/../ff", 0);
  if(fd < 0){
    printf(1, "open dd/dd/../ff failed\n");
    24cd:	50                   	push   %eax
    24ce:	50                   	push   %eax
    24cf:	68 b6 4a 00 00       	push   $0x4ab6
    24d4:	6a 01                	push   $0x1
    24d6:	e8 e5 1a 00 00       	call   3fc0 <printf>
    exit(-1);
    24db:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    24e2:	e8 8b 19 00 00       	call   3e72 <exit>
    exit(-1);
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create dd/dd/ff failed\n");
    24e7:	51                   	push   %ecx
    24e8:	51                   	push   %ecx
    24e9:	68 8f 4a 00 00       	push   $0x4a8f
    24ee:	6a 01                	push   $0x1
    24f0:	e8 cb 1a 00 00       	call   3fc0 <printf>
    exit(-1);
    24f5:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    24fc:	e8 71 19 00 00       	call   3e72 <exit>
  if(chdir("dd/../../../dd") != 0){
    printf(1, "chdir dd/../../dd failed\n");
    exit(-1);
  }
  if(chdir("./..") != 0){
    printf(1, "chdir ./.. failed\n");
    2501:	50                   	push   %eax
    2502:	50                   	push   %eax
    2503:	68 58 4b 00 00       	push   $0x4b58
    2508:	6a 01                	push   $0x1
    250a:	e8 b1 1a 00 00       	call   3fc0 <printf>
    exit(-1);
    250f:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    2516:	e8 57 19 00 00       	call   3e72 <exit>
    exit(-1);
  }
  close(fd);

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    251b:	51                   	push   %ecx
    251c:	51                   	push   %ecx
    251d:	68 44 55 00 00       	push   $0x5544
    2522:	6a 01                	push   $0x1
    2524:	e8 97 1a 00 00       	call   3fc0 <printf>
    exit(-1);
    2529:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    2530:	e8 3d 19 00 00       	call   3e72 <exit>
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    exit(0);
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    2535:	53                   	push   %ebx
    2536:	53                   	push   %ebx
    2537:	68 d8 55 00 00       	push   $0x55d8
    253c:	6a 01                	push   $0x1
    253e:	e8 7d 1a 00 00       	call   3fc0 <printf>
    exit(0);
    2543:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    254a:	e8 23 19 00 00       	call   3e72 <exit>
  if(open("dd", O_WRONLY) >= 0){
    printf(1, "open dd wronly succeeded!\n");
    exit(0);
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    254f:	50                   	push   %eax
    2550:	50                   	push   %eax
    2551:	68 b4 55 00 00       	push   $0x55b4
    2556:	6a 01                	push   $0x1
    2558:	e8 63 1a 00 00       	call   3fc0 <printf>
    exit(0);
    255d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2564:	e8 09 19 00 00       	call   3e72 <exit>
  if(open("dd", O_RDWR) >= 0){
    printf(1, "open dd rdwr succeeded!\n");
    exit(0);
  }
  if(open("dd", O_WRONLY) >= 0){
    printf(1, "open dd wronly succeeded!\n");
    2569:	50                   	push   %eax
    256a:	50                   	push   %eax
    256b:	68 17 4c 00 00       	push   $0x4c17
    2570:	6a 01                	push   $0x1
    2572:	e8 49 1a 00 00       	call   3fc0 <printf>
    exit(0);
    2577:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    257e:	e8 ef 18 00 00       	call   3e72 <exit>
  if(open("dd", O_CREATE) >= 0){
    printf(1, "create dd succeeded!\n");
    exit(0);
  }
  if(open("dd", O_RDWR) >= 0){
    printf(1, "open dd rdwr succeeded!\n");
    2583:	50                   	push   %eax
    2584:	50                   	push   %eax
    2585:	68 fe 4b 00 00       	push   $0x4bfe
    258a:	6a 01                	push   $0x1
    258c:	e8 2f 1a 00 00       	call   3fc0 <printf>
    exit(0);
    2591:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2598:	e8 d5 18 00 00       	call   3e72 <exit>
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/xx/ff succeeded!\n");
    exit(0);
  }
  if(open("dd", O_CREATE) >= 0){
    printf(1, "create dd succeeded!\n");
    259d:	50                   	push   %eax
    259e:	50                   	push   %eax
    259f:	68 e8 4b 00 00       	push   $0x4be8
    25a4:	6a 01                	push   $0x1
    25a6:	e8 15 1a 00 00       	call   3fc0 <printf>
    exit(0);
    25ab:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    25b2:	e8 bb 18 00 00       	call   3e72 <exit>
  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/ff/ff succeeded!\n");
    exit(0);
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/xx/ff succeeded!\n");
    25b7:	50                   	push   %eax
    25b8:	50                   	push   %eax
    25b9:	68 cc 4b 00 00       	push   $0x4bcc
    25be:	6a 01                	push   $0x1
    25c0:	e8 fb 19 00 00       	call   3fc0 <printf>
    exit(0);
    25c5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    25cc:	e8 a1 18 00 00       	call   3e72 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    exit(-1);
  }

  if(chdir("dd") != 0){
    printf(1, "chdir dd failed\n");
    25d1:	50                   	push   %eax
    25d2:	50                   	push   %eax
    25d3:	68 0d 4b 00 00       	push   $0x4b0d
    25d8:	6a 01                	push   $0x1
    25da:	e8 e1 19 00 00       	call   3fc0 <printf>
    exit(-1);
    25df:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    25e6:	e8 87 18 00 00       	call   3e72 <exit>
  if(unlink("dd/dd/ff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    exit(-1);
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    25eb:	50                   	push   %eax
    25ec:	50                   	push   %eax
    25ed:	68 68 55 00 00       	push   $0x5568
    25f2:	6a 01                	push   $0x1
    25f4:	e8 c7 19 00 00       	call   3fc0 <printf>
    exit(-1);
    25f9:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    2600:	e8 6d 18 00 00       	call   3e72 <exit>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    exit(0);
  }

  if(mkdir("/dd/dd") != 0){
    printf(1, "subdir mkdir dd/dd failed\n");
    2605:	53                   	push   %ebx
    2606:	53                   	push   %ebx
    2607:	68 6b 4a 00 00       	push   $0x4a6b
    260c:	6a 01                	push   $0x1
    260e:	e8 ad 19 00 00       	call   3fc0 <printf>
    exit(-1);
    2613:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    261a:	e8 53 18 00 00       	call   3e72 <exit>
  }
  write(fd, "ff", 2);
  close(fd);

  if(unlink("dd") >= 0){
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    261f:	50                   	push   %eax
    2620:	50                   	push   %eax
    2621:	68 1c 55 00 00       	push   $0x551c
    2626:	6a 01                	push   $0x1
    2628:	e8 93 19 00 00       	call   3fc0 <printf>
    exit(0);
    262d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2634:	e8 39 18 00 00       	call   3e72 <exit>
    exit(-1);
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create dd/ff failed\n");
    2639:	50                   	push   %eax
    263a:	50                   	push   %eax
    263b:	68 4f 4a 00 00       	push   $0x4a4f
    2640:	6a 01                	push   $0x1
    2642:	e8 79 19 00 00       	call   3fc0 <printf>
    exit(-1);
    2647:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    264e:	e8 1f 18 00 00       	call   3e72 <exit>

  printf(1, "subdir test\n");

  unlink("ff");
  if(mkdir("dd") != 0){
    printf(1, "subdir mkdir dd failed\n");
    2653:	50                   	push   %eax
    2654:	50                   	push   %eax
    2655:	68 37 4a 00 00       	push   $0x4a37
    265a:	6a 01                	push   $0x1
    265c:	e8 5f 19 00 00       	call   3fc0 <printf>
    exit(-1);
    2661:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    2668:	e8 05 18 00 00       	call   3e72 <exit>
  if(unlink("dd/dd") < 0){
    printf(1, "unlink dd/dd failed\n");
    exit(-1);
  }
  if(unlink("dd") < 0){
    printf(1, "unlink dd failed\n");
    266d:	50                   	push   %eax
    266e:	50                   	push   %eax
    266f:	68 20 4d 00 00       	push   $0x4d20
    2674:	6a 01                	push   $0x1
    2676:	e8 45 19 00 00       	call   3fc0 <printf>
    exit(-1);
    267b:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    2682:	e8 eb 17 00 00       	call   3e72 <exit>
  if(unlink("dd") == 0){
    printf(1, "unlink non-empty dd succeeded!\n");
    exit(0);
  }
  if(unlink("dd/dd") < 0){
    printf(1, "unlink dd/dd failed\n");
    2687:	52                   	push   %edx
    2688:	52                   	push   %edx
    2689:	68 0b 4d 00 00       	push   $0x4d0b
    268e:	6a 01                	push   $0x1
    2690:	e8 2b 19 00 00       	call   3fc0 <printf>
    exit(-1);
    2695:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    269c:	e8 d1 17 00 00       	call   3e72 <exit>
  if(unlink("dd/ff") != 0){
    printf(1, "unlink dd/ff failed\n");
    exit(-1);
  }
  if(unlink("dd") == 0){
    printf(1, "unlink non-empty dd succeeded!\n");
    26a1:	51                   	push   %ecx
    26a2:	51                   	push   %ecx
    26a3:	68 20 56 00 00       	push   $0x5620
    26a8:	6a 01                	push   $0x1
    26aa:	e8 11 19 00 00       	call   3fc0 <printf>
    exit(0);
    26af:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    26b6:	e8 b7 17 00 00       	call   3e72 <exit>
  if(unlink("dd/dd/ffff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    exit(-1);
  }
  if(unlink("dd/ff") != 0){
    printf(1, "unlink dd/ff failed\n");
    26bb:	53                   	push   %ebx
    26bc:	53                   	push   %ebx
    26bd:	68 f6 4c 00 00       	push   $0x4cf6
    26c2:	6a 01                	push   $0x1
    26c4:	e8 f7 18 00 00       	call   3fc0 <printf>
    exit(-1);
    26c9:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    26d0:	e8 9d 17 00 00       	call   3e72 <exit>
  if(chdir("dd/ff") == 0){
    printf(1, "chdir dd/ff succeeded!\n");
    exit(0);
  }
  if(chdir("dd/xx") == 0){
    printf(1, "chdir dd/xx succeeded!\n");
    26d5:	50                   	push   %eax
    26d6:	50                   	push   %eax
    26d7:	68 de 4c 00 00       	push   $0x4cde
    26dc:	6a 01                	push   $0x1
    26de:	e8 dd 18 00 00       	call   3fc0 <printf>
    exit(0);
    26e3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    26ea:	e8 83 17 00 00       	call   3e72 <exit>
  if(unlink("dd/ff/ff") == 0){
    printf(1, "unlink dd/ff/ff succeeded!\n");
    exit(0);
  }
  if(chdir("dd/ff") == 0){
    printf(1, "chdir dd/ff succeeded!\n");
    26ef:	50                   	push   %eax
    26f0:	50                   	push   %eax
    26f1:	68 c6 4c 00 00       	push   $0x4cc6
    26f6:	6a 01                	push   $0x1
    26f8:	e8 c3 18 00 00       	call   3fc0 <printf>
    exit(0);
    26fd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2704:	e8 69 17 00 00       	call   3e72 <exit>
  if(unlink("dd/xx/ff") == 0){
    printf(1, "unlink dd/xx/ff succeeded!\n");
    exit(0);
  }
  if(unlink("dd/ff/ff") == 0){
    printf(1, "unlink dd/ff/ff succeeded!\n");
    2709:	50                   	push   %eax
    270a:	50                   	push   %eax
    270b:	68 aa 4c 00 00       	push   $0x4caa
    2710:	6a 01                	push   $0x1
    2712:	e8 a9 18 00 00       	call   3fc0 <printf>
    exit(0);
    2717:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    271e:	e8 4f 17 00 00       	call   3e72 <exit>
  if(mkdir("dd/dd/ffff") == 0){
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    exit(0);
  }
  if(unlink("dd/xx/ff") == 0){
    printf(1, "unlink dd/xx/ff succeeded!\n");
    2723:	50                   	push   %eax
    2724:	50                   	push   %eax
    2725:	68 8e 4c 00 00       	push   $0x4c8e
    272a:	6a 01                	push   $0x1
    272c:	e8 8f 18 00 00       	call   3fc0 <printf>
    exit(0);
    2731:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2738:	e8 35 17 00 00       	call   3e72 <exit>
  if(mkdir("dd/xx/ff") == 0){
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    exit(0);
  }
  if(mkdir("dd/dd/ffff") == 0){
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    273d:	50                   	push   %eax
    273e:	50                   	push   %eax
    273f:	68 71 4c 00 00       	push   $0x4c71
    2744:	6a 01                	push   $0x1
    2746:	e8 75 18 00 00       	call   3fc0 <printf>
    exit(0);
    274b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2752:	e8 1b 17 00 00       	call   3e72 <exit>
  if(mkdir("dd/ff/ff") == 0){
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    exit(0);
  }
  if(mkdir("dd/xx/ff") == 0){
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    2757:	50                   	push   %eax
    2758:	50                   	push   %eax
    2759:	68 56 4c 00 00       	push   $0x4c56
    275e:	6a 01                	push   $0x1
    2760:	e8 5b 18 00 00       	call   3fc0 <printf>
    exit(0);
    2765:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    276c:	e8 01 17 00 00       	call   3e72 <exit>
  if(fd < 0){
    printf(1, "open dd/dd/ffff failed\n");
    exit(-1);
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    printf(1, "read dd/dd/ffff wrong len\n");
    2771:	50                   	push   %eax
    2772:	50                   	push   %eax
    2773:	68 83 4b 00 00       	push   $0x4b83
    2778:	6a 01                	push   $0x1
    277a:	e8 41 18 00 00       	call   3fc0 <printf>
    exit(-1);
    277f:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    2786:	e8 e7 16 00 00       	call   3e72 <exit>
    exit(-1);
  }

  fd = open("dd/dd/ffff", 0);
  if(fd < 0){
    printf(1, "open dd/dd/ffff failed\n");
    278b:	50                   	push   %eax
    278c:	50                   	push   %eax
    278d:	68 6b 4b 00 00       	push   $0x4b6b
    2792:	6a 01                	push   $0x1
    2794:	e8 27 18 00 00       	call   3fc0 <printf>
    exit(-1);
    2799:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    27a0:	e8 cd 16 00 00       	call   3e72 <exit>
    27a5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    27a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000027b0 <bigwrite>:
}

// test writes that are larger than the log.
void
bigwrite(void)
{
    27b0:	55                   	push   %ebp
    27b1:	89 e5                	mov    %esp,%ebp
    27b3:	56                   	push   %esi
    27b4:	53                   	push   %ebx
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    27b5:	bb f3 01 00 00       	mov    $0x1f3,%ebx
void
bigwrite(void)
{
  int fd, sz;

  printf(1, "bigwrite test\n");
    27ba:	83 ec 08             	sub    $0x8,%esp
    27bd:	68 3d 4d 00 00       	push   $0x4d3d
    27c2:	6a 01                	push   $0x1
    27c4:	e8 f7 17 00 00       	call   3fc0 <printf>

  unlink("bigwrite");
    27c9:	c7 04 24 4c 4d 00 00 	movl   $0x4d4c,(%esp)
    27d0:	e8 f5 16 00 00       	call   3eca <unlink>
    27d5:	83 c4 10             	add    $0x10,%esp
    27d8:	90                   	nop
    27d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(sz = 499; sz < 12*512; sz += 471){
    fd = open("bigwrite", O_CREATE | O_RDWR);
    27e0:	83 ec 08             	sub    $0x8,%esp
    27e3:	68 02 02 00 00       	push   $0x202
    27e8:	68 4c 4d 00 00       	push   $0x4d4c
    27ed:	e8 c8 16 00 00       	call   3eba <open>
    if(fd < 0){
    27f2:	83 c4 10             	add    $0x10,%esp
    27f5:	85 c0                	test   %eax,%eax

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    fd = open("bigwrite", O_CREATE | O_RDWR);
    27f7:	89 c6                	mov    %eax,%esi
    if(fd < 0){
    27f9:	0f 88 85 00 00 00    	js     2884 <bigwrite+0xd4>
      printf(1, "cannot create bigwrite\n");
      exit(-1);
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
    27ff:	83 ec 04             	sub    $0x4,%esp
    2802:	53                   	push   %ebx
    2803:	68 60 8b 00 00       	push   $0x8b60
    2808:	50                   	push   %eax
    2809:	e8 8c 16 00 00       	call   3e9a <write>
      if(cc != sz){
    280e:	83 c4 10             	add    $0x10,%esp
    2811:	39 c3                	cmp    %eax,%ebx
    2813:	75 55                	jne    286a <bigwrite+0xba>
      printf(1, "cannot create bigwrite\n");
      exit(-1);
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
    2815:	83 ec 04             	sub    $0x4,%esp
    2818:	53                   	push   %ebx
    2819:	68 60 8b 00 00       	push   $0x8b60
    281e:	56                   	push   %esi
    281f:	e8 76 16 00 00       	call   3e9a <write>
      if(cc != sz){
    2824:	83 c4 10             	add    $0x10,%esp
    2827:	39 c3                	cmp    %eax,%ebx
    2829:	75 3f                	jne    286a <bigwrite+0xba>
        printf(1, "write(%d) ret %d\n", sz, cc);
        exit(0);
      }
    }
    close(fd);
    282b:	83 ec 0c             	sub    $0xc,%esp
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    282e:	81 c3 d7 01 00 00    	add    $0x1d7,%ebx
      if(cc != sz){
        printf(1, "write(%d) ret %d\n", sz, cc);
        exit(0);
      }
    }
    close(fd);
    2834:	56                   	push   %esi
    2835:	e8 68 16 00 00       	call   3ea2 <close>
    unlink("bigwrite");
    283a:	c7 04 24 4c 4d 00 00 	movl   $0x4d4c,(%esp)
    2841:	e8 84 16 00 00       	call   3eca <unlink>
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    2846:	83 c4 10             	add    $0x10,%esp
    2849:	81 fb 07 18 00 00    	cmp    $0x1807,%ebx
    284f:	75 8f                	jne    27e0 <bigwrite+0x30>
    }
    close(fd);
    unlink("bigwrite");
  }

  printf(1, "bigwrite ok\n");
    2851:	83 ec 08             	sub    $0x8,%esp
    2854:	68 7f 4d 00 00       	push   $0x4d7f
    2859:	6a 01                	push   $0x1
    285b:	e8 60 17 00 00       	call   3fc0 <printf>
}
    2860:	83 c4 10             	add    $0x10,%esp
    2863:	8d 65 f8             	lea    -0x8(%ebp),%esp
    2866:	5b                   	pop    %ebx
    2867:	5e                   	pop    %esi
    2868:	5d                   	pop    %ebp
    2869:	c3                   	ret    
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
      if(cc != sz){
        printf(1, "write(%d) ret %d\n", sz, cc);
    286a:	50                   	push   %eax
    286b:	53                   	push   %ebx
    286c:	68 6d 4d 00 00       	push   $0x4d6d
    2871:	6a 01                	push   $0x1
    2873:	e8 48 17 00 00       	call   3fc0 <printf>
        exit(0);
    2878:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    287f:	e8 ee 15 00 00       	call   3e72 <exit>

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    fd = open("bigwrite", O_CREATE | O_RDWR);
    if(fd < 0){
      printf(1, "cannot create bigwrite\n");
    2884:	83 ec 08             	sub    $0x8,%esp
    2887:	68 55 4d 00 00       	push   $0x4d55
    288c:	6a 01                	push   $0x1
    288e:	e8 2d 17 00 00       	call   3fc0 <printf>
      exit(-1);
    2893:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    289a:	e8 d3 15 00 00       	call   3e72 <exit>
    289f:	90                   	nop

000028a0 <bigfile>:
  printf(1, "bigwrite ok\n");
}

void
bigfile(void)
{
    28a0:	55                   	push   %ebp
    28a1:	89 e5                	mov    %esp,%ebp
    28a3:	57                   	push   %edi
    28a4:	56                   	push   %esi
    28a5:	53                   	push   %ebx
    28a6:	83 ec 14             	sub    $0x14,%esp
  int fd, i, total, cc;

  printf(1, "bigfile test\n");
    28a9:	68 8c 4d 00 00       	push   $0x4d8c
    28ae:	6a 01                	push   $0x1
    28b0:	e8 0b 17 00 00       	call   3fc0 <printf>

  unlink("bigfile");
    28b5:	c7 04 24 a8 4d 00 00 	movl   $0x4da8,(%esp)
    28bc:	e8 09 16 00 00       	call   3eca <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    28c1:	5e                   	pop    %esi
    28c2:	5f                   	pop    %edi
    28c3:	68 02 02 00 00       	push   $0x202
    28c8:	68 a8 4d 00 00       	push   $0x4da8
    28cd:	e8 e8 15 00 00       	call   3eba <open>
  if(fd < 0){
    28d2:	83 c4 10             	add    $0x10,%esp
    28d5:	85 c0                	test   %eax,%eax
    28d7:	0f 88 82 01 00 00    	js     2a5f <bigfile+0x1bf>
    28dd:	89 c6                	mov    %eax,%esi
    28df:	31 db                	xor    %ebx,%ebx
    28e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "cannot create bigfile");
    exit(-1);
  }
  for(i = 0; i < 20; i++){
    memset(buf, i, 600);
    28e8:	83 ec 04             	sub    $0x4,%esp
    28eb:	68 58 02 00 00       	push   $0x258
    28f0:	53                   	push   %ebx
    28f1:	68 60 8b 00 00       	push   $0x8b60
    28f6:	e8 e5 13 00 00       	call   3ce0 <memset>
    if(write(fd, buf, 600) != 600){
    28fb:	83 c4 0c             	add    $0xc,%esp
    28fe:	68 58 02 00 00       	push   $0x258
    2903:	68 60 8b 00 00       	push   $0x8b60
    2908:	56                   	push   %esi
    2909:	e8 8c 15 00 00       	call   3e9a <write>
    290e:	83 c4 10             	add    $0x10,%esp
    2911:	3d 58 02 00 00       	cmp    $0x258,%eax
    2916:	0f 85 0d 01 00 00    	jne    2a29 <bigfile+0x189>
  fd = open("bigfile", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "cannot create bigfile");
    exit(-1);
  }
  for(i = 0; i < 20; i++){
    291c:	83 c3 01             	add    $0x1,%ebx
    291f:	83 fb 14             	cmp    $0x14,%ebx
    2922:	75 c4                	jne    28e8 <bigfile+0x48>
    if(write(fd, buf, 600) != 600){
      printf(1, "write bigfile failed\n");
      exit(-1);
    }
  }
  close(fd);
    2924:	83 ec 0c             	sub    $0xc,%esp
    2927:	56                   	push   %esi
    2928:	e8 75 15 00 00       	call   3ea2 <close>

  fd = open("bigfile", 0);
    292d:	59                   	pop    %ecx
    292e:	5b                   	pop    %ebx
    292f:	6a 00                	push   $0x0
    2931:	68 a8 4d 00 00       	push   $0x4da8
    2936:	e8 7f 15 00 00       	call   3eba <open>
  if(fd < 0){
    293b:	83 c4 10             	add    $0x10,%esp
    293e:	85 c0                	test   %eax,%eax
      exit(-1);
    }
  }
  close(fd);

  fd = open("bigfile", 0);
    2940:	89 c6                	mov    %eax,%esi
  if(fd < 0){
    2942:	0f 88 fc 00 00 00    	js     2a44 <bigfile+0x1a4>
    2948:	31 db                	xor    %ebx,%ebx
    294a:	31 ff                	xor    %edi,%edi
    294c:	eb 30                	jmp    297e <bigfile+0xde>
    294e:	66 90                	xchg   %ax,%ax
      printf(1, "read bigfile failed\n");
      exit(-1);
    }
    if(cc == 0)
      break;
    if(cc != 300){
    2950:	3d 2c 01 00 00       	cmp    $0x12c,%eax
    2955:	0f 85 98 00 00 00    	jne    29f3 <bigfile+0x153>
      printf(1, "short read bigfile\n");
      exit(-1);
    }
    if(buf[0] != i/2 || buf[299] != i/2){
    295b:	0f be 05 60 8b 00 00 	movsbl 0x8b60,%eax
    2962:	89 fa                	mov    %edi,%edx
    2964:	d1 fa                	sar    %edx
    2966:	39 d0                	cmp    %edx,%eax
    2968:	75 6e                	jne    29d8 <bigfile+0x138>
    296a:	0f be 15 8b 8c 00 00 	movsbl 0x8c8b,%edx
    2971:	39 d0                	cmp    %edx,%eax
    2973:	75 63                	jne    29d8 <bigfile+0x138>
      printf(1, "read bigfile wrong data\n");
      exit(-1);
    }
    total += cc;
    2975:	81 c3 2c 01 00 00    	add    $0x12c,%ebx
  if(fd < 0){
    printf(1, "cannot open bigfile\n");
    exit(-1);
  }
  total = 0;
  for(i = 0; ; i++){
    297b:	83 c7 01             	add    $0x1,%edi
    cc = read(fd, buf, 300);
    297e:	83 ec 04             	sub    $0x4,%esp
    2981:	68 2c 01 00 00       	push   $0x12c
    2986:	68 60 8b 00 00       	push   $0x8b60
    298b:	56                   	push   %esi
    298c:	e8 01 15 00 00       	call   3e92 <read>
    if(cc < 0){
    2991:	83 c4 10             	add    $0x10,%esp
    2994:	85 c0                	test   %eax,%eax
    2996:	78 76                	js     2a0e <bigfile+0x16e>
      printf(1, "read bigfile failed\n");
      exit(-1);
    }
    if(cc == 0)
    2998:	75 b6                	jne    2950 <bigfile+0xb0>
      printf(1, "read bigfile wrong data\n");
      exit(-1);
    }
    total += cc;
  }
  close(fd);
    299a:	83 ec 0c             	sub    $0xc,%esp
    299d:	56                   	push   %esi
    299e:	e8 ff 14 00 00       	call   3ea2 <close>
  if(total != 20*600){
    29a3:	83 c4 10             	add    $0x10,%esp
    29a6:	81 fb e0 2e 00 00    	cmp    $0x2ee0,%ebx
    29ac:	0f 85 c8 00 00 00    	jne    2a7a <bigfile+0x1da>
    printf(1, "read bigfile wrong total\n");
    exit(-1);
  }
  unlink("bigfile");
    29b2:	83 ec 0c             	sub    $0xc,%esp
    29b5:	68 a8 4d 00 00       	push   $0x4da8
    29ba:	e8 0b 15 00 00       	call   3eca <unlink>

  printf(1, "bigfile test ok\n");
    29bf:	58                   	pop    %eax
    29c0:	5a                   	pop    %edx
    29c1:	68 37 4e 00 00       	push   $0x4e37
    29c6:	6a 01                	push   $0x1
    29c8:	e8 f3 15 00 00       	call   3fc0 <printf>
}
    29cd:	83 c4 10             	add    $0x10,%esp
    29d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    29d3:	5b                   	pop    %ebx
    29d4:	5e                   	pop    %esi
    29d5:	5f                   	pop    %edi
    29d6:	5d                   	pop    %ebp
    29d7:	c3                   	ret    
    if(cc != 300){
      printf(1, "short read bigfile\n");
      exit(-1);
    }
    if(buf[0] != i/2 || buf[299] != i/2){
      printf(1, "read bigfile wrong data\n");
    29d8:	83 ec 08             	sub    $0x8,%esp
    29db:	68 04 4e 00 00       	push   $0x4e04
    29e0:	6a 01                	push   $0x1
    29e2:	e8 d9 15 00 00       	call   3fc0 <printf>
      exit(-1);
    29e7:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    29ee:	e8 7f 14 00 00       	call   3e72 <exit>
      exit(-1);
    }
    if(cc == 0)
      break;
    if(cc != 300){
      printf(1, "short read bigfile\n");
    29f3:	83 ec 08             	sub    $0x8,%esp
    29f6:	68 f0 4d 00 00       	push   $0x4df0
    29fb:	6a 01                	push   $0x1
    29fd:	e8 be 15 00 00       	call   3fc0 <printf>
      exit(-1);
    2a02:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    2a09:	e8 64 14 00 00       	call   3e72 <exit>
  }
  total = 0;
  for(i = 0; ; i++){
    cc = read(fd, buf, 300);
    if(cc < 0){
      printf(1, "read bigfile failed\n");
    2a0e:	83 ec 08             	sub    $0x8,%esp
    2a11:	68 db 4d 00 00       	push   $0x4ddb
    2a16:	6a 01                	push   $0x1
    2a18:	e8 a3 15 00 00       	call   3fc0 <printf>
      exit(-1);
    2a1d:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    2a24:	e8 49 14 00 00       	call   3e72 <exit>
    exit(-1);
  }
  for(i = 0; i < 20; i++){
    memset(buf, i, 600);
    if(write(fd, buf, 600) != 600){
      printf(1, "write bigfile failed\n");
    2a29:	83 ec 08             	sub    $0x8,%esp
    2a2c:	68 b0 4d 00 00       	push   $0x4db0
    2a31:	6a 01                	push   $0x1
    2a33:	e8 88 15 00 00       	call   3fc0 <printf>
      exit(-1);
    2a38:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    2a3f:	e8 2e 14 00 00       	call   3e72 <exit>
  }
  close(fd);

  fd = open("bigfile", 0);
  if(fd < 0){
    printf(1, "cannot open bigfile\n");
    2a44:	83 ec 08             	sub    $0x8,%esp
    2a47:	68 c6 4d 00 00       	push   $0x4dc6
    2a4c:	6a 01                	push   $0x1
    2a4e:	e8 6d 15 00 00       	call   3fc0 <printf>
    exit(-1);
    2a53:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    2a5a:	e8 13 14 00 00       	call   3e72 <exit>
  printf(1, "bigfile test\n");

  unlink("bigfile");
  fd = open("bigfile", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "cannot create bigfile");
    2a5f:	83 ec 08             	sub    $0x8,%esp
    2a62:	68 9a 4d 00 00       	push   $0x4d9a
    2a67:	6a 01                	push   $0x1
    2a69:	e8 52 15 00 00       	call   3fc0 <printf>
    exit(-1);
    2a6e:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    2a75:	e8 f8 13 00 00       	call   3e72 <exit>
    }
    total += cc;
  }
  close(fd);
  if(total != 20*600){
    printf(1, "read bigfile wrong total\n");
    2a7a:	83 ec 08             	sub    $0x8,%esp
    2a7d:	68 1d 4e 00 00       	push   $0x4e1d
    2a82:	6a 01                	push   $0x1
    2a84:	e8 37 15 00 00       	call   3fc0 <printf>
    exit(-1);
    2a89:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    2a90:	e8 dd 13 00 00       	call   3e72 <exit>
    2a95:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    2a99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00002aa0 <fourteen>:
  printf(1, "bigfile test ok\n");
}

void
fourteen(void)
{
    2aa0:	55                   	push   %ebp
    2aa1:	89 e5                	mov    %esp,%ebp
    2aa3:	83 ec 10             	sub    $0x10,%esp
  int fd;

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");
    2aa6:	68 48 4e 00 00       	push   $0x4e48
    2aab:	6a 01                	push   $0x1
    2aad:	e8 0e 15 00 00       	call   3fc0 <printf>

  if(mkdir("12345678901234") != 0){
    2ab2:	c7 04 24 83 4e 00 00 	movl   $0x4e83,(%esp)
    2ab9:	e8 24 14 00 00       	call   3ee2 <mkdir>
    2abe:	83 c4 10             	add    $0x10,%esp
    2ac1:	85 c0                	test   %eax,%eax
    2ac3:	0f 85 9b 00 00 00    	jne    2b64 <fourteen+0xc4>
    printf(1, "mkdir 12345678901234 failed\n");
    exit(-1);
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    2ac9:	83 ec 0c             	sub    $0xc,%esp
    2acc:	68 40 56 00 00       	push   $0x5640
    2ad1:	e8 0c 14 00 00       	call   3ee2 <mkdir>
    2ad6:	83 c4 10             	add    $0x10,%esp
    2ad9:	85 c0                	test   %eax,%eax
    2adb:	0f 85 05 01 00 00    	jne    2be6 <fourteen+0x146>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    exit(-1);
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    2ae1:	83 ec 08             	sub    $0x8,%esp
    2ae4:	68 00 02 00 00       	push   $0x200
    2ae9:	68 90 56 00 00       	push   $0x5690
    2aee:	e8 c7 13 00 00       	call   3eba <open>
  if(fd < 0){
    2af3:	83 c4 10             	add    $0x10,%esp
    2af6:	85 c0                	test   %eax,%eax
    2af8:	0f 88 ce 00 00 00    	js     2bcc <fourteen+0x12c>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    exit(-1);
  }
  close(fd);
    2afe:	83 ec 0c             	sub    $0xc,%esp
    2b01:	50                   	push   %eax
    2b02:	e8 9b 13 00 00       	call   3ea2 <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    2b07:	58                   	pop    %eax
    2b08:	5a                   	pop    %edx
    2b09:	6a 00                	push   $0x0
    2b0b:	68 00 57 00 00       	push   $0x5700
    2b10:	e8 a5 13 00 00       	call   3eba <open>
  if(fd < 0){
    2b15:	83 c4 10             	add    $0x10,%esp
    2b18:	85 c0                	test   %eax,%eax
    2b1a:	0f 88 92 00 00 00    	js     2bb2 <fourteen+0x112>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    exit(-1);
  }
  close(fd);
    2b20:	83 ec 0c             	sub    $0xc,%esp
    2b23:	50                   	push   %eax
    2b24:	e8 79 13 00 00       	call   3ea2 <close>

  if(mkdir("12345678901234/12345678901234") == 0){
    2b29:	c7 04 24 74 4e 00 00 	movl   $0x4e74,(%esp)
    2b30:	e8 ad 13 00 00       	call   3ee2 <mkdir>
    2b35:	83 c4 10             	add    $0x10,%esp
    2b38:	85 c0                	test   %eax,%eax
    2b3a:	74 5c                	je     2b98 <fourteen+0xf8>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    exit(0);
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    2b3c:	83 ec 0c             	sub    $0xc,%esp
    2b3f:	68 9c 57 00 00       	push   $0x579c
    2b44:	e8 99 13 00 00       	call   3ee2 <mkdir>
    2b49:	83 c4 10             	add    $0x10,%esp
    2b4c:	85 c0                	test   %eax,%eax
    2b4e:	74 2e                	je     2b7e <fourteen+0xde>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    exit(0);
  }

  printf(1, "fourteen ok\n");
    2b50:	83 ec 08             	sub    $0x8,%esp
    2b53:	68 92 4e 00 00       	push   $0x4e92
    2b58:	6a 01                	push   $0x1
    2b5a:	e8 61 14 00 00       	call   3fc0 <printf>
}
    2b5f:	83 c4 10             	add    $0x10,%esp
    2b62:	c9                   	leave  
    2b63:	c3                   	ret    

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");

  if(mkdir("12345678901234") != 0){
    printf(1, "mkdir 12345678901234 failed\n");
    2b64:	50                   	push   %eax
    2b65:	50                   	push   %eax
    2b66:	68 57 4e 00 00       	push   $0x4e57
    2b6b:	6a 01                	push   $0x1
    2b6d:	e8 4e 14 00 00       	call   3fc0 <printf>
    exit(-1);
    2b72:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    2b79:	e8 f4 12 00 00       	call   3e72 <exit>
  if(mkdir("12345678901234/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    exit(0);
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    2b7e:	50                   	push   %eax
    2b7f:	50                   	push   %eax
    2b80:	68 bc 57 00 00       	push   $0x57bc
    2b85:	6a 01                	push   $0x1
    2b87:	e8 34 14 00 00       	call   3fc0 <printf>
    exit(0);
    2b8c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2b93:	e8 da 12 00 00       	call   3e72 <exit>
    exit(-1);
  }
  close(fd);

  if(mkdir("12345678901234/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    2b98:	52                   	push   %edx
    2b99:	52                   	push   %edx
    2b9a:	68 6c 57 00 00       	push   $0x576c
    2b9f:	6a 01                	push   $0x1
    2ba1:	e8 1a 14 00 00       	call   3fc0 <printf>
    exit(0);
    2ba6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2bad:	e8 c0 12 00 00       	call   3e72 <exit>
    exit(-1);
  }
  close(fd);
  fd = open("12345678901234/12345678901234/12345678901234", 0);
  if(fd < 0){
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    2bb2:	51                   	push   %ecx
    2bb3:	51                   	push   %ecx
    2bb4:	68 30 57 00 00       	push   $0x5730
    2bb9:	6a 01                	push   $0x1
    2bbb:	e8 00 14 00 00       	call   3fc0 <printf>
    exit(-1);
    2bc0:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    2bc7:	e8 a6 12 00 00       	call   3e72 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    exit(-1);
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
  if(fd < 0){
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    2bcc:	51                   	push   %ecx
    2bcd:	51                   	push   %ecx
    2bce:	68 c0 56 00 00       	push   $0x56c0
    2bd3:	6a 01                	push   $0x1
    2bd5:	e8 e6 13 00 00       	call   3fc0 <printf>
    exit(-1);
    2bda:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    2be1:	e8 8c 12 00 00       	call   3e72 <exit>
  if(mkdir("12345678901234") != 0){
    printf(1, "mkdir 12345678901234 failed\n");
    exit(-1);
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    2be6:	50                   	push   %eax
    2be7:	50                   	push   %eax
    2be8:	68 60 56 00 00       	push   $0x5660
    2bed:	6a 01                	push   $0x1
    2bef:	e8 cc 13 00 00       	call   3fc0 <printf>
    exit(-1);
    2bf4:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    2bfb:	e8 72 12 00 00       	call   3e72 <exit>

00002c00 <rmdot>:
  printf(1, "fourteen ok\n");
}

void
rmdot(void)
{
    2c00:	55                   	push   %ebp
    2c01:	89 e5                	mov    %esp,%ebp
    2c03:	83 ec 10             	sub    $0x10,%esp
  printf(1, "rmdot test\n");
    2c06:	68 9f 4e 00 00       	push   $0x4e9f
    2c0b:	6a 01                	push   $0x1
    2c0d:	e8 ae 13 00 00       	call   3fc0 <printf>
  if(mkdir("dots") != 0){
    2c12:	c7 04 24 ab 4e 00 00 	movl   $0x4eab,(%esp)
    2c19:	e8 c4 12 00 00       	call   3ee2 <mkdir>
    2c1e:	83 c4 10             	add    $0x10,%esp
    2c21:	85 c0                	test   %eax,%eax
    2c23:	0f 85 b4 00 00 00    	jne    2cdd <rmdot+0xdd>
    printf(1, "mkdir dots failed\n");
    exit(-1);
  }
  if(chdir("dots") != 0){
    2c29:	83 ec 0c             	sub    $0xc,%esp
    2c2c:	68 ab 4e 00 00       	push   $0x4eab
    2c31:	e8 b4 12 00 00       	call   3eea <chdir>
    2c36:	83 c4 10             	add    $0x10,%esp
    2c39:	85 c0                	test   %eax,%eax
    2c3b:	0f 85 52 01 00 00    	jne    2d93 <rmdot+0x193>
    printf(1, "chdir dots failed\n");
    exit(-1);
  }
  if(unlink(".") == 0){
    2c41:	83 ec 0c             	sub    $0xc,%esp
    2c44:	68 56 4b 00 00       	push   $0x4b56
    2c49:	e8 7c 12 00 00       	call   3eca <unlink>
    2c4e:	83 c4 10             	add    $0x10,%esp
    2c51:	85 c0                	test   %eax,%eax
    2c53:	0f 84 20 01 00 00    	je     2d79 <rmdot+0x179>
    printf(1, "rm . worked!\n");
    exit(-1);
  }
  if(unlink("..") == 0){
    2c59:	83 ec 0c             	sub    $0xc,%esp
    2c5c:	68 55 4b 00 00       	push   $0x4b55
    2c61:	e8 64 12 00 00       	call   3eca <unlink>
    2c66:	83 c4 10             	add    $0x10,%esp
    2c69:	85 c0                	test   %eax,%eax
    2c6b:	0f 84 ee 00 00 00    	je     2d5f <rmdot+0x15f>
    printf(1, "rm .. worked!\n");
    exit(-1);
  }
  if(chdir("/") != 0){
    2c71:	83 ec 0c             	sub    $0xc,%esp
    2c74:	68 29 43 00 00       	push   $0x4329
    2c79:	e8 6c 12 00 00       	call   3eea <chdir>
    2c7e:	83 c4 10             	add    $0x10,%esp
    2c81:	85 c0                	test   %eax,%eax
    2c83:	0f 85 bc 00 00 00    	jne    2d45 <rmdot+0x145>
    printf(1, "chdir / failed\n");
    exit(-1);
  }
  if(unlink("dots/.") == 0){
    2c89:	83 ec 0c             	sub    $0xc,%esp
    2c8c:	68 f3 4e 00 00       	push   $0x4ef3
    2c91:	e8 34 12 00 00       	call   3eca <unlink>
    2c96:	83 c4 10             	add    $0x10,%esp
    2c99:	85 c0                	test   %eax,%eax
    2c9b:	0f 84 8a 00 00 00    	je     2d2b <rmdot+0x12b>
    printf(1, "unlink dots/. worked!\n");
    exit(0);
  }
  if(unlink("dots/..") == 0){
    2ca1:	83 ec 0c             	sub    $0xc,%esp
    2ca4:	68 11 4f 00 00       	push   $0x4f11
    2ca9:	e8 1c 12 00 00       	call   3eca <unlink>
    2cae:	83 c4 10             	add    $0x10,%esp
    2cb1:	85 c0                	test   %eax,%eax
    2cb3:	74 5c                	je     2d11 <rmdot+0x111>
    printf(1, "unlink dots/.. worked!\n");
    exit(0);
  }
  if(unlink("dots") != 0){
    2cb5:	83 ec 0c             	sub    $0xc,%esp
    2cb8:	68 ab 4e 00 00       	push   $0x4eab
    2cbd:	e8 08 12 00 00       	call   3eca <unlink>
    2cc2:	83 c4 10             	add    $0x10,%esp
    2cc5:	85 c0                	test   %eax,%eax
    2cc7:	75 2e                	jne    2cf7 <rmdot+0xf7>
    printf(1, "unlink dots failed!\n");
    exit(-1);
  }
  printf(1, "rmdot ok\n");
    2cc9:	83 ec 08             	sub    $0x8,%esp
    2ccc:	68 46 4f 00 00       	push   $0x4f46
    2cd1:	6a 01                	push   $0x1
    2cd3:	e8 e8 12 00 00       	call   3fc0 <printf>
}
    2cd8:	83 c4 10             	add    $0x10,%esp
    2cdb:	c9                   	leave  
    2cdc:	c3                   	ret    
void
rmdot(void)
{
  printf(1, "rmdot test\n");
  if(mkdir("dots") != 0){
    printf(1, "mkdir dots failed\n");
    2cdd:	50                   	push   %eax
    2cde:	50                   	push   %eax
    2cdf:	68 b0 4e 00 00       	push   $0x4eb0
    2ce4:	6a 01                	push   $0x1
    2ce6:	e8 d5 12 00 00       	call   3fc0 <printf>
    exit(-1);
    2ceb:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    2cf2:	e8 7b 11 00 00       	call   3e72 <exit>
  if(unlink("dots/..") == 0){
    printf(1, "unlink dots/.. worked!\n");
    exit(0);
  }
  if(unlink("dots") != 0){
    printf(1, "unlink dots failed!\n");
    2cf7:	50                   	push   %eax
    2cf8:	50                   	push   %eax
    2cf9:	68 31 4f 00 00       	push   $0x4f31
    2cfe:	6a 01                	push   $0x1
    2d00:	e8 bb 12 00 00       	call   3fc0 <printf>
    exit(-1);
    2d05:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    2d0c:	e8 61 11 00 00       	call   3e72 <exit>
  if(unlink("dots/.") == 0){
    printf(1, "unlink dots/. worked!\n");
    exit(0);
  }
  if(unlink("dots/..") == 0){
    printf(1, "unlink dots/.. worked!\n");
    2d11:	52                   	push   %edx
    2d12:	52                   	push   %edx
    2d13:	68 19 4f 00 00       	push   $0x4f19
    2d18:	6a 01                	push   $0x1
    2d1a:	e8 a1 12 00 00       	call   3fc0 <printf>
    exit(0);
    2d1f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2d26:	e8 47 11 00 00       	call   3e72 <exit>
  if(chdir("/") != 0){
    printf(1, "chdir / failed\n");
    exit(-1);
  }
  if(unlink("dots/.") == 0){
    printf(1, "unlink dots/. worked!\n");
    2d2b:	51                   	push   %ecx
    2d2c:	51                   	push   %ecx
    2d2d:	68 fa 4e 00 00       	push   $0x4efa
    2d32:	6a 01                	push   $0x1
    2d34:	e8 87 12 00 00       	call   3fc0 <printf>
    exit(0);
    2d39:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2d40:	e8 2d 11 00 00       	call   3e72 <exit>
  if(unlink("..") == 0){
    printf(1, "rm .. worked!\n");
    exit(-1);
  }
  if(chdir("/") != 0){
    printf(1, "chdir / failed\n");
    2d45:	50                   	push   %eax
    2d46:	50                   	push   %eax
    2d47:	68 2b 43 00 00       	push   $0x432b
    2d4c:	6a 01                	push   $0x1
    2d4e:	e8 6d 12 00 00       	call   3fc0 <printf>
    exit(-1);
    2d53:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    2d5a:	e8 13 11 00 00       	call   3e72 <exit>
  if(unlink(".") == 0){
    printf(1, "rm . worked!\n");
    exit(-1);
  }
  if(unlink("..") == 0){
    printf(1, "rm .. worked!\n");
    2d5f:	50                   	push   %eax
    2d60:	50                   	push   %eax
    2d61:	68 e4 4e 00 00       	push   $0x4ee4
    2d66:	6a 01                	push   $0x1
    2d68:	e8 53 12 00 00       	call   3fc0 <printf>
    exit(-1);
    2d6d:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    2d74:	e8 f9 10 00 00       	call   3e72 <exit>
  if(chdir("dots") != 0){
    printf(1, "chdir dots failed\n");
    exit(-1);
  }
  if(unlink(".") == 0){
    printf(1, "rm . worked!\n");
    2d79:	50                   	push   %eax
    2d7a:	50                   	push   %eax
    2d7b:	68 d6 4e 00 00       	push   $0x4ed6
    2d80:	6a 01                	push   $0x1
    2d82:	e8 39 12 00 00       	call   3fc0 <printf>
    exit(-1);
    2d87:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    2d8e:	e8 df 10 00 00       	call   3e72 <exit>
  if(mkdir("dots") != 0){
    printf(1, "mkdir dots failed\n");
    exit(-1);
  }
  if(chdir("dots") != 0){
    printf(1, "chdir dots failed\n");
    2d93:	50                   	push   %eax
    2d94:	50                   	push   %eax
    2d95:	68 c3 4e 00 00       	push   $0x4ec3
    2d9a:	6a 01                	push   $0x1
    2d9c:	e8 1f 12 00 00       	call   3fc0 <printf>
    exit(-1);
    2da1:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    2da8:	e8 c5 10 00 00       	call   3e72 <exit>
    2dad:	8d 76 00             	lea    0x0(%esi),%esi

00002db0 <dirfile>:
  printf(1, "rmdot ok\n");
}

void
dirfile(void)
{
    2db0:	55                   	push   %ebp
    2db1:	89 e5                	mov    %esp,%ebp
    2db3:	53                   	push   %ebx
    2db4:	83 ec 0c             	sub    $0xc,%esp
  int fd;

  printf(1, "dir vs file\n");
    2db7:	68 50 4f 00 00       	push   $0x4f50
    2dbc:	6a 01                	push   $0x1
    2dbe:	e8 fd 11 00 00       	call   3fc0 <printf>

  fd = open("dirfile", O_CREATE);
    2dc3:	5b                   	pop    %ebx
    2dc4:	58                   	pop    %eax
    2dc5:	68 00 02 00 00       	push   $0x200
    2dca:	68 5d 4f 00 00       	push   $0x4f5d
    2dcf:	e8 e6 10 00 00       	call   3eba <open>
  if(fd < 0){
    2dd4:	83 c4 10             	add    $0x10,%esp
    2dd7:	85 c0                	test   %eax,%eax
    2dd9:	0f 88 19 01 00 00    	js     2ef8 <dirfile+0x148>
    printf(1, "create dirfile failed\n");
    exit(-1);
  }
  close(fd);
    2ddf:	83 ec 0c             	sub    $0xc,%esp
    2de2:	50                   	push   %eax
    2de3:	e8 ba 10 00 00       	call   3ea2 <close>
  if(chdir("dirfile") == 0){
    2de8:	c7 04 24 5d 4f 00 00 	movl   $0x4f5d,(%esp)
    2def:	e8 f6 10 00 00       	call   3eea <chdir>
    2df4:	83 c4 10             	add    $0x10,%esp
    2df7:	85 c0                	test   %eax,%eax
    2df9:	0f 84 e3 01 00 00    	je     2fe2 <dirfile+0x232>
    printf(1, "chdir dirfile succeeded!\n");
    exit(0);
  }
  fd = open("dirfile/xx", 0);
    2dff:	83 ec 08             	sub    $0x8,%esp
    2e02:	6a 00                	push   $0x0
    2e04:	68 96 4f 00 00       	push   $0x4f96
    2e09:	e8 ac 10 00 00       	call   3eba <open>
  if(fd >= 0){
    2e0e:	83 c4 10             	add    $0x10,%esp
    2e11:	85 c0                	test   %eax,%eax
    2e13:	0f 89 af 01 00 00    	jns    2fc8 <dirfile+0x218>
    printf(1, "create dirfile/xx succeeded!\n");
    exit(-1);
  }
  fd = open("dirfile/xx", O_CREATE);
    2e19:	83 ec 08             	sub    $0x8,%esp
    2e1c:	68 00 02 00 00       	push   $0x200
    2e21:	68 96 4f 00 00       	push   $0x4f96
    2e26:	e8 8f 10 00 00       	call   3eba <open>
  if(fd >= 0){
    2e2b:	83 c4 10             	add    $0x10,%esp
    2e2e:	85 c0                	test   %eax,%eax
    2e30:	0f 89 78 01 00 00    	jns    2fae <dirfile+0x1fe>
    printf(1, "create dirfile/xx succeeded!\n");
    exit(0);
  }
  if(mkdir("dirfile/xx") == 0){
    2e36:	83 ec 0c             	sub    $0xc,%esp
    2e39:	68 96 4f 00 00       	push   $0x4f96
    2e3e:	e8 9f 10 00 00       	call   3ee2 <mkdir>
    2e43:	83 c4 10             	add    $0x10,%esp
    2e46:	85 c0                	test   %eax,%eax
    2e48:	0f 84 46 01 00 00    	je     2f94 <dirfile+0x1e4>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    exit(0);
  }
  if(unlink("dirfile/xx") == 0){
    2e4e:	83 ec 0c             	sub    $0xc,%esp
    2e51:	68 96 4f 00 00       	push   $0x4f96
    2e56:	e8 6f 10 00 00       	call   3eca <unlink>
    2e5b:	83 c4 10             	add    $0x10,%esp
    2e5e:	85 c0                	test   %eax,%eax
    2e60:	0f 84 14 01 00 00    	je     2f7a <dirfile+0x1ca>
    printf(1, "unlink dirfile/xx succeeded!\n");
    exit(0);
  }
  if(link("README", "dirfile/xx") == 0){
    2e66:	83 ec 08             	sub    $0x8,%esp
    2e69:	68 96 4f 00 00       	push   $0x4f96
    2e6e:	68 fa 4f 00 00       	push   $0x4ffa
    2e73:	e8 62 10 00 00       	call   3eda <link>
    2e78:	83 c4 10             	add    $0x10,%esp
    2e7b:	85 c0                	test   %eax,%eax
    2e7d:	0f 84 dd 00 00 00    	je     2f60 <dirfile+0x1b0>
    printf(1, "link to dirfile/xx succeeded!\n");
    exit(0);
  }
  if(unlink("dirfile") != 0){
    2e83:	83 ec 0c             	sub    $0xc,%esp
    2e86:	68 5d 4f 00 00       	push   $0x4f5d
    2e8b:	e8 3a 10 00 00       	call   3eca <unlink>
    2e90:	83 c4 10             	add    $0x10,%esp
    2e93:	85 c0                	test   %eax,%eax
    2e95:	0f 85 ab 00 00 00    	jne    2f46 <dirfile+0x196>
    printf(1, "unlink dirfile failed!\n");
    exit(-1);
  }

  fd = open(".", O_RDWR);
    2e9b:	83 ec 08             	sub    $0x8,%esp
    2e9e:	6a 02                	push   $0x2
    2ea0:	68 56 4b 00 00       	push   $0x4b56
    2ea5:	e8 10 10 00 00       	call   3eba <open>
  if(fd >= 0){
    2eaa:	83 c4 10             	add    $0x10,%esp
    2ead:	85 c0                	test   %eax,%eax
    2eaf:	79 7b                	jns    2f2c <dirfile+0x17c>
    printf(1, "open . for writing succeeded!\n");
    exit(0);
  }
  fd = open(".", 0);
    2eb1:	83 ec 08             	sub    $0x8,%esp
    2eb4:	6a 00                	push   $0x0
    2eb6:	68 56 4b 00 00       	push   $0x4b56
    2ebb:	e8 fa 0f 00 00       	call   3eba <open>
  if(write(fd, "x", 1) > 0){
    2ec0:	83 c4 0c             	add    $0xc,%esp
  fd = open(".", O_RDWR);
  if(fd >= 0){
    printf(1, "open . for writing succeeded!\n");
    exit(0);
  }
  fd = open(".", 0);
    2ec3:	89 c3                	mov    %eax,%ebx
  if(write(fd, "x", 1) > 0){
    2ec5:	6a 01                	push   $0x1
    2ec7:	68 39 4c 00 00       	push   $0x4c39
    2ecc:	50                   	push   %eax
    2ecd:	e8 c8 0f 00 00       	call   3e9a <write>
    2ed2:	83 c4 10             	add    $0x10,%esp
    2ed5:	85 c0                	test   %eax,%eax
    2ed7:	7f 39                	jg     2f12 <dirfile+0x162>
    printf(1, "write . succeeded!\n");
    exit(0);
  }
  close(fd);
    2ed9:	83 ec 0c             	sub    $0xc,%esp
    2edc:	53                   	push   %ebx
    2edd:	e8 c0 0f 00 00       	call   3ea2 <close>

  printf(1, "dir vs file OK\n");
    2ee2:	58                   	pop    %eax
    2ee3:	5a                   	pop    %edx
    2ee4:	68 2d 50 00 00       	push   $0x502d
    2ee9:	6a 01                	push   $0x1
    2eeb:	e8 d0 10 00 00       	call   3fc0 <printf>
}
    2ef0:	83 c4 10             	add    $0x10,%esp
    2ef3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2ef6:	c9                   	leave  
    2ef7:	c3                   	ret    

  printf(1, "dir vs file\n");

  fd = open("dirfile", O_CREATE);
  if(fd < 0){
    printf(1, "create dirfile failed\n");
    2ef8:	51                   	push   %ecx
    2ef9:	51                   	push   %ecx
    2efa:	68 65 4f 00 00       	push   $0x4f65
    2eff:	6a 01                	push   $0x1
    2f01:	e8 ba 10 00 00       	call   3fc0 <printf>
    exit(-1);
    2f06:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    2f0d:	e8 60 0f 00 00       	call   3e72 <exit>
    printf(1, "open . for writing succeeded!\n");
    exit(0);
  }
  fd = open(".", 0);
  if(write(fd, "x", 1) > 0){
    printf(1, "write . succeeded!\n");
    2f12:	51                   	push   %ecx
    2f13:	51                   	push   %ecx
    2f14:	68 19 50 00 00       	push   $0x5019
    2f19:	6a 01                	push   $0x1
    2f1b:	e8 a0 10 00 00       	call   3fc0 <printf>
    exit(0);
    2f20:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f27:	e8 46 0f 00 00       	call   3e72 <exit>
    exit(-1);
  }

  fd = open(".", O_RDWR);
  if(fd >= 0){
    printf(1, "open . for writing succeeded!\n");
    2f2c:	53                   	push   %ebx
    2f2d:	53                   	push   %ebx
    2f2e:	68 10 58 00 00       	push   $0x5810
    2f33:	6a 01                	push   $0x1
    2f35:	e8 86 10 00 00       	call   3fc0 <printf>
    exit(0);
    2f3a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f41:	e8 2c 0f 00 00       	call   3e72 <exit>
  if(link("README", "dirfile/xx") == 0){
    printf(1, "link to dirfile/xx succeeded!\n");
    exit(0);
  }
  if(unlink("dirfile") != 0){
    printf(1, "unlink dirfile failed!\n");
    2f46:	50                   	push   %eax
    2f47:	50                   	push   %eax
    2f48:	68 01 50 00 00       	push   $0x5001
    2f4d:	6a 01                	push   $0x1
    2f4f:	e8 6c 10 00 00       	call   3fc0 <printf>
    exit(-1);
    2f54:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    2f5b:	e8 12 0f 00 00       	call   3e72 <exit>
  if(unlink("dirfile/xx") == 0){
    printf(1, "unlink dirfile/xx succeeded!\n");
    exit(0);
  }
  if(link("README", "dirfile/xx") == 0){
    printf(1, "link to dirfile/xx succeeded!\n");
    2f60:	50                   	push   %eax
    2f61:	50                   	push   %eax
    2f62:	68 f0 57 00 00       	push   $0x57f0
    2f67:	6a 01                	push   $0x1
    2f69:	e8 52 10 00 00       	call   3fc0 <printf>
    exit(0);
    2f6e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f75:	e8 f8 0e 00 00       	call   3e72 <exit>
  if(mkdir("dirfile/xx") == 0){
    printf(1, "mkdir dirfile/xx succeeded!\n");
    exit(0);
  }
  if(unlink("dirfile/xx") == 0){
    printf(1, "unlink dirfile/xx succeeded!\n");
    2f7a:	50                   	push   %eax
    2f7b:	50                   	push   %eax
    2f7c:	68 dc 4f 00 00       	push   $0x4fdc
    2f81:	6a 01                	push   $0x1
    2f83:	e8 38 10 00 00       	call   3fc0 <printf>
    exit(0);
    2f88:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f8f:	e8 de 0e 00 00       	call   3e72 <exit>
  if(fd >= 0){
    printf(1, "create dirfile/xx succeeded!\n");
    exit(0);
  }
  if(mkdir("dirfile/xx") == 0){
    printf(1, "mkdir dirfile/xx succeeded!\n");
    2f94:	50                   	push   %eax
    2f95:	50                   	push   %eax
    2f96:	68 bf 4f 00 00       	push   $0x4fbf
    2f9b:	6a 01                	push   $0x1
    2f9d:	e8 1e 10 00 00       	call   3fc0 <printf>
    exit(0);
    2fa2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2fa9:	e8 c4 0e 00 00       	call   3e72 <exit>
    printf(1, "create dirfile/xx succeeded!\n");
    exit(-1);
  }
  fd = open("dirfile/xx", O_CREATE);
  if(fd >= 0){
    printf(1, "create dirfile/xx succeeded!\n");
    2fae:	50                   	push   %eax
    2faf:	50                   	push   %eax
    2fb0:	68 a1 4f 00 00       	push   $0x4fa1
    2fb5:	6a 01                	push   $0x1
    2fb7:	e8 04 10 00 00       	call   3fc0 <printf>
    exit(0);
    2fbc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2fc3:	e8 aa 0e 00 00       	call   3e72 <exit>
    printf(1, "chdir dirfile succeeded!\n");
    exit(0);
  }
  fd = open("dirfile/xx", 0);
  if(fd >= 0){
    printf(1, "create dirfile/xx succeeded!\n");
    2fc8:	50                   	push   %eax
    2fc9:	50                   	push   %eax
    2fca:	68 a1 4f 00 00       	push   $0x4fa1
    2fcf:	6a 01                	push   $0x1
    2fd1:	e8 ea 0f 00 00       	call   3fc0 <printf>
    exit(-1);
    2fd6:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    2fdd:	e8 90 0e 00 00       	call   3e72 <exit>
    printf(1, "create dirfile failed\n");
    exit(-1);
  }
  close(fd);
  if(chdir("dirfile") == 0){
    printf(1, "chdir dirfile succeeded!\n");
    2fe2:	52                   	push   %edx
    2fe3:	52                   	push   %edx
    2fe4:	68 7c 4f 00 00       	push   $0x4f7c
    2fe9:	6a 01                	push   $0x1
    2feb:	e8 d0 0f 00 00       	call   3fc0 <printf>
    exit(0);
    2ff0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2ff7:	e8 76 0e 00 00       	call   3e72 <exit>
    2ffc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003000 <iref>:
}

// test that iput() is called at the end of _namei()
void
iref(void)
{
    3000:	55                   	push   %ebp
    3001:	89 e5                	mov    %esp,%ebp
    3003:	53                   	push   %ebx
  int i, fd;

  printf(1, "empty file name\n");
    3004:	bb 33 00 00 00       	mov    $0x33,%ebx
}

// test that iput() is called at the end of _namei()
void
iref(void)
{
    3009:	83 ec 0c             	sub    $0xc,%esp
  int i, fd;

  printf(1, "empty file name\n");
    300c:	68 3d 50 00 00       	push   $0x503d
    3011:	6a 01                	push   $0x1
    3013:	e8 a8 0f 00 00       	call   3fc0 <printf>
    3018:	83 c4 10             	add    $0x10,%esp
    301b:	90                   	nop
    301c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    if(mkdir("irefd") != 0){
    3020:	83 ec 0c             	sub    $0xc,%esp
    3023:	68 4e 50 00 00       	push   $0x504e
    3028:	e8 b5 0e 00 00       	call   3ee2 <mkdir>
    302d:	83 c4 10             	add    $0x10,%esp
    3030:	85 c0                	test   %eax,%eax
    3032:	0f 85 bb 00 00 00    	jne    30f3 <iref+0xf3>
      printf(1, "mkdir irefd failed\n");
      exit(-1);
    }
    if(chdir("irefd") != 0){
    3038:	83 ec 0c             	sub    $0xc,%esp
    303b:	68 4e 50 00 00       	push   $0x504e
    3040:	e8 a5 0e 00 00       	call   3eea <chdir>
    3045:	83 c4 10             	add    $0x10,%esp
    3048:	85 c0                	test   %eax,%eax
    304a:	0f 85 be 00 00 00    	jne    310e <iref+0x10e>
      printf(1, "chdir irefd failed\n");
      exit(-1);
    }

    mkdir("");
    3050:	83 ec 0c             	sub    $0xc,%esp
    3053:	68 03 47 00 00       	push   $0x4703
    3058:	e8 85 0e 00 00       	call   3ee2 <mkdir>
    link("README", "");
    305d:	59                   	pop    %ecx
    305e:	58                   	pop    %eax
    305f:	68 03 47 00 00       	push   $0x4703
    3064:	68 fa 4f 00 00       	push   $0x4ffa
    3069:	e8 6c 0e 00 00       	call   3eda <link>
    fd = open("", O_CREATE);
    306e:	58                   	pop    %eax
    306f:	5a                   	pop    %edx
    3070:	68 00 02 00 00       	push   $0x200
    3075:	68 03 47 00 00       	push   $0x4703
    307a:	e8 3b 0e 00 00       	call   3eba <open>
    if(fd >= 0)
    307f:	83 c4 10             	add    $0x10,%esp
    3082:	85 c0                	test   %eax,%eax
    3084:	78 0c                	js     3092 <iref+0x92>
      close(fd);
    3086:	83 ec 0c             	sub    $0xc,%esp
    3089:	50                   	push   %eax
    308a:	e8 13 0e 00 00       	call   3ea2 <close>
    308f:	83 c4 10             	add    $0x10,%esp
    fd = open("xx", O_CREATE);
    3092:	83 ec 08             	sub    $0x8,%esp
    3095:	68 00 02 00 00       	push   $0x200
    309a:	68 38 4c 00 00       	push   $0x4c38
    309f:	e8 16 0e 00 00       	call   3eba <open>
    if(fd >= 0)
    30a4:	83 c4 10             	add    $0x10,%esp
    30a7:	85 c0                	test   %eax,%eax
    30a9:	78 0c                	js     30b7 <iref+0xb7>
      close(fd);
    30ab:	83 ec 0c             	sub    $0xc,%esp
    30ae:	50                   	push   %eax
    30af:	e8 ee 0d 00 00       	call   3ea2 <close>
    30b4:	83 c4 10             	add    $0x10,%esp
    unlink("xx");
    30b7:	83 ec 0c             	sub    $0xc,%esp
    30ba:	68 38 4c 00 00       	push   $0x4c38
    30bf:	e8 06 0e 00 00       	call   3eca <unlink>
  int i, fd;

  printf(1, "empty file name\n");

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    30c4:	83 c4 10             	add    $0x10,%esp
    30c7:	83 eb 01             	sub    $0x1,%ebx
    30ca:	0f 85 50 ff ff ff    	jne    3020 <iref+0x20>
    if(fd >= 0)
      close(fd);
    unlink("xx");
  }

  chdir("/");
    30d0:	83 ec 0c             	sub    $0xc,%esp
    30d3:	68 29 43 00 00       	push   $0x4329
    30d8:	e8 0d 0e 00 00       	call   3eea <chdir>
  printf(1, "empty file name OK\n");
    30dd:	58                   	pop    %eax
    30de:	5a                   	pop    %edx
    30df:	68 7c 50 00 00       	push   $0x507c
    30e4:	6a 01                	push   $0x1
    30e6:	e8 d5 0e 00 00       	call   3fc0 <printf>
}
    30eb:	83 c4 10             	add    $0x10,%esp
    30ee:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    30f1:	c9                   	leave  
    30f2:	c3                   	ret    
  printf(1, "empty file name\n");

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    if(mkdir("irefd") != 0){
      printf(1, "mkdir irefd failed\n");
    30f3:	83 ec 08             	sub    $0x8,%esp
    30f6:	68 54 50 00 00       	push   $0x5054
    30fb:	6a 01                	push   $0x1
    30fd:	e8 be 0e 00 00       	call   3fc0 <printf>
      exit(-1);
    3102:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    3109:	e8 64 0d 00 00       	call   3e72 <exit>
    }
    if(chdir("irefd") != 0){
      printf(1, "chdir irefd failed\n");
    310e:	83 ec 08             	sub    $0x8,%esp
    3111:	68 68 50 00 00       	push   $0x5068
    3116:	6a 01                	push   $0x1
    3118:	e8 a3 0e 00 00       	call   3fc0 <printf>
      exit(-1);
    311d:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    3124:	e8 49 0d 00 00       	call   3e72 <exit>
    3129:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00003130 <forktest>:
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    3130:	55                   	push   %ebp
    3131:	89 e5                	mov    %esp,%ebp
    3133:	53                   	push   %ebx
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<1000; n++){
    3134:	31 db                	xor    %ebx,%ebx
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    3136:	83 ec 0c             	sub    $0xc,%esp
  int n, pid;

  printf(1, "fork test\n");
    3139:	68 90 50 00 00       	push   $0x5090
    313e:	6a 01                	push   $0x1
    3140:	e8 7b 0e 00 00       	call   3fc0 <printf>
    3145:	83 c4 10             	add    $0x10,%esp
    3148:	eb 13                	jmp    315d <forktest+0x2d>
    314a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(n=0; n<1000; n++){
    pid = fork();
    if(pid < 0)
      break;
    if(pid == 0)
    3150:	74 79                	je     31cb <forktest+0x9b>
{
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<1000; n++){
    3152:	83 c3 01             	add    $0x1,%ebx
    3155:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
    315b:	74 53                	je     31b0 <forktest+0x80>
    pid = fork();
    315d:	e8 08 0d 00 00       	call   3e6a <fork>
    if(pid < 0)
    3162:	85 c0                	test   %eax,%eax
    3164:	79 ea                	jns    3150 <forktest+0x20>
  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    exit(0);
  }

  for(; n > 0; n--){
    3166:	85 db                	test   %ebx,%ebx
    3168:	74 1c                	je     3186 <forktest+0x56>
    316a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(wait(0) < 0){
    3170:	83 ec 0c             	sub    $0xc,%esp
    3173:	6a 00                	push   $0x0
    3175:	e8 00 0d 00 00       	call   3e7a <wait>
    317a:	83 c4 10             	add    $0x10,%esp
    317d:	85 c0                	test   %eax,%eax
    317f:	78 54                	js     31d5 <forktest+0xa5>
  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    exit(0);
  }

  for(; n > 0; n--){
    3181:	83 eb 01             	sub    $0x1,%ebx
    3184:	75 ea                	jne    3170 <forktest+0x40>
      printf(1, "wait stopped early\n");
      exit(-1);
    }
  }

  if(wait(0) != -1){
    3186:	83 ec 0c             	sub    $0xc,%esp
    3189:	6a 00                	push   $0x0
    318b:	e8 ea 0c 00 00       	call   3e7a <wait>
    3190:	83 c4 10             	add    $0x10,%esp
    3193:	83 f8 ff             	cmp    $0xffffffff,%eax
    3196:	75 58                	jne    31f0 <forktest+0xc0>
    printf(1, "wait got too many\n");
    exit(-1);
  }

  printf(1, "fork test OK\n");
    3198:	83 ec 08             	sub    $0x8,%esp
    319b:	68 c2 50 00 00       	push   $0x50c2
    31a0:	6a 01                	push   $0x1
    31a2:	e8 19 0e 00 00       	call   3fc0 <printf>
}
    31a7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    31aa:	c9                   	leave  
    31ab:	c3                   	ret    
    31ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(pid == 0)
      exit(0);
  }

  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    31b0:	83 ec 08             	sub    $0x8,%esp
    31b3:	68 30 58 00 00       	push   $0x5830
    31b8:	6a 01                	push   $0x1
    31ba:	e8 01 0e 00 00       	call   3fc0 <printf>
    exit(0);
    31bf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    31c6:	e8 a7 0c 00 00       	call   3e72 <exit>
  for(n=0; n<1000; n++){
    pid = fork();
    if(pid < 0)
      break;
    if(pid == 0)
      exit(0);
    31cb:	83 ec 0c             	sub    $0xc,%esp
    31ce:	6a 00                	push   $0x0
    31d0:	e8 9d 0c 00 00       	call   3e72 <exit>
    exit(0);
  }

  for(; n > 0; n--){
    if(wait(0) < 0){
      printf(1, "wait stopped early\n");
    31d5:	83 ec 08             	sub    $0x8,%esp
    31d8:	68 9b 50 00 00       	push   $0x509b
    31dd:	6a 01                	push   $0x1
    31df:	e8 dc 0d 00 00       	call   3fc0 <printf>
      exit(-1);
    31e4:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    31eb:	e8 82 0c 00 00       	call   3e72 <exit>
    }
  }

  if(wait(0) != -1){
    printf(1, "wait got too many\n");
    31f0:	83 ec 08             	sub    $0x8,%esp
    31f3:	68 af 50 00 00       	push   $0x50af
    31f8:	6a 01                	push   $0x1
    31fa:	e8 c1 0d 00 00       	call   3fc0 <printf>
    exit(-1);
    31ff:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    3206:	e8 67 0c 00 00       	call   3e72 <exit>
    320b:	90                   	nop
    320c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003210 <sbrktest>:
  printf(1, "fork test OK\n");
}

void
sbrktest(void)
{
    3210:	55                   	push   %ebp
    3211:	89 e5                	mov    %esp,%ebp
    3213:	57                   	push   %edi
    3214:	56                   	push   %esi
    3215:	53                   	push   %ebx
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    3216:	31 ff                	xor    %edi,%edi
  printf(1, "fork test OK\n");
}

void
sbrktest(void)
{
    3218:	83 ec 64             	sub    $0x64,%esp
  int fds[2], pid, pids[10], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
    321b:	68 d0 50 00 00       	push   $0x50d0
    3220:	ff 35 74 63 00 00    	pushl  0x6374
    3226:	e8 95 0d 00 00       	call   3fc0 <printf>
  oldbrk = sbrk(0);
    322b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3232:	e8 cb 0c 00 00       	call   3f02 <sbrk>

  // can one sbrk() less than a page?
  a = sbrk(0);
    3237:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  int fds[2], pid, pids[10], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
  oldbrk = sbrk(0);
    323e:	89 45 a4             	mov    %eax,-0x5c(%ebp)

  // can one sbrk() less than a page?
  a = sbrk(0);
    3241:	e8 bc 0c 00 00       	call   3f02 <sbrk>
    3246:	83 c4 10             	add    $0x10,%esp
    3249:	89 c3                	mov    %eax,%ebx
    324b:	90                   	nop
    324c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int i;
  for(i = 0; i < 5000; i++){
    b = sbrk(1);
    3250:	83 ec 0c             	sub    $0xc,%esp
    3253:	6a 01                	push   $0x1
    3255:	e8 a8 0c 00 00       	call   3f02 <sbrk>
    if(b != a){
    325a:	83 c4 10             	add    $0x10,%esp
    325d:	39 d8                	cmp    %ebx,%eax
    325f:	0f 85 9d 02 00 00    	jne    3502 <sbrktest+0x2f2>
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    3265:	83 c7 01             	add    $0x1,%edi
    b = sbrk(1);
    if(b != a){
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
      exit(-1);
    }
    *b = 1;
    3268:	c6 03 01             	movb   $0x1,(%ebx)
    a = b + 1;
    326b:	83 c3 01             	add    $0x1,%ebx
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    326e:	81 ff 88 13 00 00    	cmp    $0x1388,%edi
    3274:	75 da                	jne    3250 <sbrktest+0x40>
      exit(-1);
    }
    *b = 1;
    a = b + 1;
  }
  pid = fork();
    3276:	e8 ef 0b 00 00       	call   3e6a <fork>
  if(pid < 0){
    327b:	85 c0                	test   %eax,%eax
      exit(-1);
    }
    *b = 1;
    a = b + 1;
  }
  pid = fork();
    327d:	89 c7                	mov    %eax,%edi
  if(pid < 0){
    327f:	0f 88 ff 03 00 00    	js     3684 <sbrktest+0x474>
    printf(stdout, "sbrk test fork failed\n");
    exit(-1);
  }
  c = sbrk(1);
    3285:	83 ec 0c             	sub    $0xc,%esp
  c = sbrk(1);
  if(c != a + 1){
    3288:	83 c3 01             	add    $0x1,%ebx
  pid = fork();
  if(pid < 0){
    printf(stdout, "sbrk test fork failed\n");
    exit(-1);
  }
  c = sbrk(1);
    328b:	6a 01                	push   $0x1
    328d:	e8 70 0c 00 00       	call   3f02 <sbrk>
  c = sbrk(1);
    3292:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3299:	e8 64 0c 00 00       	call   3f02 <sbrk>
  if(c != a + 1){
    329e:	83 c4 10             	add    $0x10,%esp
    32a1:	39 d8                	cmp    %ebx,%eax
    32a3:	0f 85 bc 03 00 00    	jne    3665 <sbrktest+0x455>
    printf(stdout, "sbrk test failed post-fork\n");
    exit(-1);
  }
  if(pid == 0)
    32a9:	85 ff                	test   %edi,%edi
    32ab:	0f 84 aa 03 00 00    	je     365b <sbrktest+0x44b>
    exit(0);
  wait(0);
    32b1:	83 ec 0c             	sub    $0xc,%esp
    32b4:	6a 00                	push   $0x0
    32b6:	e8 bf 0b 00 00       	call   3e7a <wait>

  // can one grow address space to something big?
#define BIG (100*1024*1024)
  a = sbrk(0);
    32bb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    32c2:	e8 3b 0c 00 00       	call   3f02 <sbrk>
    32c7:	89 c3                	mov    %eax,%ebx
  amt = (BIG) - (uint)a;
  p = sbrk(amt);
    32c9:	b8 00 00 40 06       	mov    $0x6400000,%eax
    32ce:	29 d8                	sub    %ebx,%eax
    32d0:	89 04 24             	mov    %eax,(%esp)
    32d3:	e8 2a 0c 00 00       	call   3f02 <sbrk>
  if (p != a) {
    32d8:	83 c4 10             	add    $0x10,%esp
    32db:	39 c3                	cmp    %eax,%ebx
    32dd:	0f 85 59 03 00 00    	jne    363c <sbrktest+0x42c>
  }
  lastaddr = (char*) (BIG-1);
  *lastaddr = 99;

  // can one de-allocate?
  a = sbrk(0);
    32e3:	83 ec 0c             	sub    $0xc,%esp
  if (p != a) {
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    exit(-1);
  }
  lastaddr = (char*) (BIG-1);
  *lastaddr = 99;
    32e6:	c6 05 ff ff 3f 06 63 	movb   $0x63,0x63fffff

  // can one de-allocate?
  a = sbrk(0);
    32ed:	6a 00                	push   $0x0
    32ef:	e8 0e 0c 00 00       	call   3f02 <sbrk>
  c = sbrk(-4096);
    32f4:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
  }
  lastaddr = (char*) (BIG-1);
  *lastaddr = 99;

  // can one de-allocate?
  a = sbrk(0);
    32fb:	89 c3                	mov    %eax,%ebx
  c = sbrk(-4096);
    32fd:	e8 00 0c 00 00       	call   3f02 <sbrk>
  if(c == (char*)0xffffffff){
    3302:	83 c4 10             	add    $0x10,%esp
    3305:	83 f8 ff             	cmp    $0xffffffff,%eax
    3308:	0f 84 0f 03 00 00    	je     361d <sbrktest+0x40d>
    printf(stdout, "sbrk could not deallocate\n");
    exit(-1);
  }
  c = sbrk(0);
    330e:	83 ec 0c             	sub    $0xc,%esp
    3311:	6a 00                	push   $0x0
    3313:	e8 ea 0b 00 00       	call   3f02 <sbrk>
  if(c != a - 4096){
    3318:	8d 93 00 f0 ff ff    	lea    -0x1000(%ebx),%edx
    331e:	83 c4 10             	add    $0x10,%esp
    3321:	39 d0                	cmp    %edx,%eax
    3323:	0f 85 d6 02 00 00    	jne    35ff <sbrktest+0x3ef>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    exit(-1);
  }

  // can one re-allocate that page?
  a = sbrk(0);
    3329:	83 ec 0c             	sub    $0xc,%esp
    332c:	6a 00                	push   $0x0
    332e:	e8 cf 0b 00 00       	call   3f02 <sbrk>
    3333:	89 c3                	mov    %eax,%ebx
  c = sbrk(4096);
    3335:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    333c:	e8 c1 0b 00 00       	call   3f02 <sbrk>
  if(c != a || sbrk(0) != a + 4096){
    3341:	83 c4 10             	add    $0x10,%esp
    3344:	39 c3                	cmp    %eax,%ebx
    exit(-1);
  }

  // can one re-allocate that page?
  a = sbrk(0);
  c = sbrk(4096);
    3346:	89 c7                	mov    %eax,%edi
  if(c != a || sbrk(0) != a + 4096){
    3348:	0f 85 93 02 00 00    	jne    35e1 <sbrktest+0x3d1>
    334e:	83 ec 0c             	sub    $0xc,%esp
    3351:	6a 00                	push   $0x0
    3353:	e8 aa 0b 00 00       	call   3f02 <sbrk>
    3358:	8d 93 00 10 00 00    	lea    0x1000(%ebx),%edx
    335e:	83 c4 10             	add    $0x10,%esp
    3361:	39 d0                	cmp    %edx,%eax
    3363:	0f 85 78 02 00 00    	jne    35e1 <sbrktest+0x3d1>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    exit(-1);
  }
  if(*lastaddr == 99){
    3369:	80 3d ff ff 3f 06 63 	cmpb   $0x63,0x63fffff
    3370:	0f 84 4c 02 00 00    	je     35c2 <sbrktest+0x3b2>
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    exit(-1);
  }

  a = sbrk(0);
    3376:	83 ec 0c             	sub    $0xc,%esp
    3379:	6a 00                	push   $0x0
    337b:	e8 82 0b 00 00       	call   3f02 <sbrk>
  c = sbrk(-(sbrk(0) - oldbrk));
    3380:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    exit(-1);
  }

  a = sbrk(0);
    3387:	89 c3                	mov    %eax,%ebx
  c = sbrk(-(sbrk(0) - oldbrk));
    3389:	e8 74 0b 00 00       	call   3f02 <sbrk>
    338e:	8b 4d a4             	mov    -0x5c(%ebp),%ecx
    3391:	29 c1                	sub    %eax,%ecx
    3393:	89 0c 24             	mov    %ecx,(%esp)
    3396:	e8 67 0b 00 00       	call   3f02 <sbrk>
  if(c != a){
    339b:	83 c4 10             	add    $0x10,%esp
    339e:	39 c3                	cmp    %eax,%ebx
    33a0:	0f 85 fe 01 00 00    	jne    35a4 <sbrktest+0x394>
    33a6:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    33ab:	90                   	nop
    33ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    exit(-1);
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    ppid = getpid();
    33b0:	e8 45 0b 00 00       	call   3efa <getpid>
    33b5:	89 c7                	mov    %eax,%edi
    pid = fork();
    33b7:	e8 ae 0a 00 00       	call   3e6a <fork>
    if(pid < 0){
    33bc:	85 c0                	test   %eax,%eax
    33be:	0f 88 c1 01 00 00    	js     3585 <sbrktest+0x375>
      printf(stdout, "fork failed\n");
      exit(-1);
    }
    if(pid == 0){
    33c4:	0f 84 92 01 00 00    	je     355c <sbrktest+0x34c>
      printf(stdout, "oops could read %x = %x\n", a, *a);
      kill(ppid);
      exit(-1);
    }
    wait(0);
    33ca:	83 ec 0c             	sub    $0xc,%esp
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit(-1);
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    33cd:	81 c3 50 c3 00 00    	add    $0xc350,%ebx
    if(pid == 0){
      printf(stdout, "oops could read %x = %x\n", a, *a);
      kill(ppid);
      exit(-1);
    }
    wait(0);
    33d3:	6a 00                	push   $0x0
    33d5:	e8 a0 0a 00 00       	call   3e7a <wait>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit(-1);
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    33da:	83 c4 10             	add    $0x10,%esp
    33dd:	81 fb 80 84 1e 80    	cmp    $0x801e8480,%ebx
    33e3:	75 cb                	jne    33b0 <sbrktest+0x1a0>
    wait(0);
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    33e5:	8d 45 b8             	lea    -0x48(%ebp),%eax
    33e8:	83 ec 0c             	sub    $0xc,%esp
    33eb:	50                   	push   %eax
    33ec:	e8 99 0a 00 00       	call   3e8a <pipe>
    33f1:	83 c4 10             	add    $0x10,%esp
    33f4:	85 c0                	test   %eax,%eax
    33f6:	0f 85 45 01 00 00    	jne    3541 <sbrktest+0x331>
    33fc:	8d 5d c0             	lea    -0x40(%ebp),%ebx
    33ff:	8d 7d e8             	lea    -0x18(%ebp),%edi
    3402:	89 de                	mov    %ebx,%esi
    printf(1, "pipe() failed\n");
    exit(-1);
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if((pids[i] = fork()) == 0){
    3404:	e8 61 0a 00 00       	call   3e6a <fork>
    3409:	85 c0                	test   %eax,%eax
    340b:	89 06                	mov    %eax,(%esi)
    340d:	0f 84 a8 00 00 00    	je     34bb <sbrktest+0x2ab>
      sbrk(BIG - (uint)sbrk(0));
      write(fds[1], "x", 1);
      // sit around until killed
      for(;;) sleep(1000);
    }
    if(pids[i] != -1)
    3413:	83 f8 ff             	cmp    $0xffffffff,%eax
    3416:	74 14                	je     342c <sbrktest+0x21c>
      read(fds[0], &scratch, 1);
    3418:	8d 45 b7             	lea    -0x49(%ebp),%eax
    341b:	83 ec 04             	sub    $0x4,%esp
    341e:	6a 01                	push   $0x1
    3420:	50                   	push   %eax
    3421:	ff 75 b8             	pushl  -0x48(%ebp)
    3424:	e8 69 0a 00 00       	call   3e92 <read>
    3429:	83 c4 10             	add    $0x10,%esp
    342c:	83 c6 04             	add    $0x4,%esi
  // failed allocation?
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit(-1);
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    342f:	39 f7                	cmp    %esi,%edi
    3431:	75 d1                	jne    3404 <sbrktest+0x1f4>
    if(pids[i] != -1)
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
    3433:	83 ec 0c             	sub    $0xc,%esp
    3436:	68 00 10 00 00       	push   $0x1000
    343b:	e8 c2 0a 00 00       	call   3f02 <sbrk>
    3440:	83 c4 10             	add    $0x10,%esp
    3443:	89 c6                	mov    %eax,%esi
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if(pids[i] == -1)
    3445:	8b 03                	mov    (%ebx),%eax
    3447:	83 f8 ff             	cmp    $0xffffffff,%eax
    344a:	74 18                	je     3464 <sbrktest+0x254>
      continue;
    kill(pids[i]);
    344c:	83 ec 0c             	sub    $0xc,%esp
    344f:	50                   	push   %eax
    3450:	e8 55 0a 00 00       	call   3eaa <kill>
    wait(0);
    3455:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    345c:	e8 19 0a 00 00       	call   3e7a <wait>
    3461:	83 c4 10             	add    $0x10,%esp
    3464:	83 c3 04             	add    $0x4,%ebx
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3467:	39 fb                	cmp    %edi,%ebx
    3469:	75 da                	jne    3445 <sbrktest+0x235>
    if(pids[i] == -1)
      continue;
    kill(pids[i]);
    wait(0);
  }
  if(c == (char*)0xffffffff){
    346b:	83 fe ff             	cmp    $0xffffffff,%esi
    346e:	0f 84 ae 00 00 00    	je     3522 <sbrktest+0x312>
    printf(stdout, "failed sbrk leaked memory\n");
    exit(-1);
  }

  if(sbrk(0) > oldbrk)
    3474:	83 ec 0c             	sub    $0xc,%esp
    3477:	6a 00                	push   $0x0
    3479:	e8 84 0a 00 00       	call   3f02 <sbrk>
    347e:	83 c4 10             	add    $0x10,%esp
    3481:	39 45 a4             	cmp    %eax,-0x5c(%ebp)
    3484:	73 1a                	jae    34a0 <sbrktest+0x290>
    sbrk(-(sbrk(0) - oldbrk));
    3486:	83 ec 0c             	sub    $0xc,%esp
    3489:	6a 00                	push   $0x0
    348b:	e8 72 0a 00 00       	call   3f02 <sbrk>
    3490:	8b 75 a4             	mov    -0x5c(%ebp),%esi
    3493:	29 c6                	sub    %eax,%esi
    3495:	89 34 24             	mov    %esi,(%esp)
    3498:	e8 65 0a 00 00       	call   3f02 <sbrk>
    349d:	83 c4 10             	add    $0x10,%esp

  printf(stdout, "sbrk test OK\n");
    34a0:	83 ec 08             	sub    $0x8,%esp
    34a3:	68 78 51 00 00       	push   $0x5178
    34a8:	ff 35 74 63 00 00    	pushl  0x6374
    34ae:	e8 0d 0b 00 00       	call   3fc0 <printf>
}
    34b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    34b6:	5b                   	pop    %ebx
    34b7:	5e                   	pop    %esi
    34b8:	5f                   	pop    %edi
    34b9:	5d                   	pop    %ebp
    34ba:	c3                   	ret    
    exit(-1);
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if((pids[i] = fork()) == 0){
      // allocate a lot of memory
      sbrk(BIG - (uint)sbrk(0));
    34bb:	83 ec 0c             	sub    $0xc,%esp
    34be:	6a 00                	push   $0x0
    34c0:	e8 3d 0a 00 00       	call   3f02 <sbrk>
    34c5:	ba 00 00 40 06       	mov    $0x6400000,%edx
    34ca:	29 c2                	sub    %eax,%edx
    34cc:	89 14 24             	mov    %edx,(%esp)
    34cf:	e8 2e 0a 00 00       	call   3f02 <sbrk>
      write(fds[1], "x", 1);
    34d4:	83 c4 0c             	add    $0xc,%esp
    34d7:	6a 01                	push   $0x1
    34d9:	68 39 4c 00 00       	push   $0x4c39
    34de:	ff 75 bc             	pushl  -0x44(%ebp)
    34e1:	e8 b4 09 00 00       	call   3e9a <write>
    34e6:	83 c4 10             	add    $0x10,%esp
    34e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      // sit around until killed
      for(;;) sleep(1000);
    34f0:	83 ec 0c             	sub    $0xc,%esp
    34f3:	68 e8 03 00 00       	push   $0x3e8
    34f8:	e8 0d 0a 00 00       	call   3f0a <sleep>
    34fd:	83 c4 10             	add    $0x10,%esp
    3500:	eb ee                	jmp    34f0 <sbrktest+0x2e0>
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    b = sbrk(1);
    if(b != a){
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    3502:	83 ec 0c             	sub    $0xc,%esp
    3505:	50                   	push   %eax
    3506:	53                   	push   %ebx
    3507:	57                   	push   %edi
    3508:	68 db 50 00 00       	push   $0x50db
    350d:	ff 35 74 63 00 00    	pushl  0x6374
    3513:	e8 a8 0a 00 00       	call   3fc0 <printf>
      exit(-1);
    3518:	83 c4 14             	add    $0x14,%esp
    351b:	6a ff                	push   $0xffffffff
    351d:	e8 50 09 00 00       	call   3e72 <exit>
      continue;
    kill(pids[i]);
    wait(0);
  }
  if(c == (char*)0xffffffff){
    printf(stdout, "failed sbrk leaked memory\n");
    3522:	83 ec 08             	sub    $0x8,%esp
    3525:	68 5d 51 00 00       	push   $0x515d
    352a:	ff 35 74 63 00 00    	pushl  0x6374
    3530:	e8 8b 0a 00 00       	call   3fc0 <printf>
    exit(-1);
    3535:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    353c:	e8 31 09 00 00       	call   3e72 <exit>
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    3541:	83 ec 08             	sub    $0x8,%esp
    3544:	68 19 46 00 00       	push   $0x4619
    3549:	6a 01                	push   $0x1
    354b:	e8 70 0a 00 00       	call   3fc0 <printf>
    exit(-1);
    3550:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    3557:	e8 16 09 00 00       	call   3e72 <exit>
    if(pid < 0){
      printf(stdout, "fork failed\n");
      exit(-1);
    }
    if(pid == 0){
      printf(stdout, "oops could read %x = %x\n", a, *a);
    355c:	0f be 03             	movsbl (%ebx),%eax
    355f:	50                   	push   %eax
    3560:	53                   	push   %ebx
    3561:	68 44 51 00 00       	push   $0x5144
    3566:	ff 35 74 63 00 00    	pushl  0x6374
    356c:	e8 4f 0a 00 00       	call   3fc0 <printf>
      kill(ppid);
    3571:	89 3c 24             	mov    %edi,(%esp)
    3574:	e8 31 09 00 00       	call   3eaa <kill>
      exit(-1);
    3579:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    3580:	e8 ed 08 00 00       	call   3e72 <exit>
  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    ppid = getpid();
    pid = fork();
    if(pid < 0){
      printf(stdout, "fork failed\n");
    3585:	83 ec 08             	sub    $0x8,%esp
    3588:	68 21 52 00 00       	push   $0x5221
    358d:	ff 35 74 63 00 00    	pushl  0x6374
    3593:	e8 28 0a 00 00       	call   3fc0 <printf>
      exit(-1);
    3598:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    359f:	e8 ce 08 00 00       	call   3e72 <exit>
  }

  a = sbrk(0);
  c = sbrk(-(sbrk(0) - oldbrk));
  if(c != a){
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    35a4:	50                   	push   %eax
    35a5:	53                   	push   %ebx
    35a6:	68 24 59 00 00       	push   $0x5924
    35ab:	ff 35 74 63 00 00    	pushl  0x6374
    35b1:	e8 0a 0a 00 00       	call   3fc0 <printf>
    exit(-1);
    35b6:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    35bd:	e8 b0 08 00 00       	call   3e72 <exit>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    exit(-1);
  }
  if(*lastaddr == 99){
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    35c2:	83 ec 08             	sub    $0x8,%esp
    35c5:	68 f4 58 00 00       	push   $0x58f4
    35ca:	ff 35 74 63 00 00    	pushl  0x6374
    35d0:	e8 eb 09 00 00       	call   3fc0 <printf>
    exit(-1);
    35d5:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    35dc:	e8 91 08 00 00       	call   3e72 <exit>

  // can one re-allocate that page?
  a = sbrk(0);
  c = sbrk(4096);
  if(c != a || sbrk(0) != a + 4096){
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    35e1:	57                   	push   %edi
    35e2:	53                   	push   %ebx
    35e3:	68 cc 58 00 00       	push   $0x58cc
    35e8:	ff 35 74 63 00 00    	pushl  0x6374
    35ee:	e8 cd 09 00 00       	call   3fc0 <printf>
    exit(-1);
    35f3:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    35fa:	e8 73 08 00 00       	call   3e72 <exit>
    printf(stdout, "sbrk could not deallocate\n");
    exit(-1);
  }
  c = sbrk(0);
  if(c != a - 4096){
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    35ff:	50                   	push   %eax
    3600:	53                   	push   %ebx
    3601:	68 94 58 00 00       	push   $0x5894
    3606:	ff 35 74 63 00 00    	pushl  0x6374
    360c:	e8 af 09 00 00       	call   3fc0 <printf>
    exit(-1);
    3611:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    3618:	e8 55 08 00 00       	call   3e72 <exit>

  // can one de-allocate?
  a = sbrk(0);
  c = sbrk(-4096);
  if(c == (char*)0xffffffff){
    printf(stdout, "sbrk could not deallocate\n");
    361d:	83 ec 08             	sub    $0x8,%esp
    3620:	68 29 51 00 00       	push   $0x5129
    3625:	ff 35 74 63 00 00    	pushl  0x6374
    362b:	e8 90 09 00 00       	call   3fc0 <printf>
    exit(-1);
    3630:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    3637:	e8 36 08 00 00       	call   3e72 <exit>
#define BIG (100*1024*1024)
  a = sbrk(0);
  amt = (BIG) - (uint)a;
  p = sbrk(amt);
  if (p != a) {
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    363c:	83 ec 08             	sub    $0x8,%esp
    363f:	68 54 58 00 00       	push   $0x5854
    3644:	ff 35 74 63 00 00    	pushl  0x6374
    364a:	e8 71 09 00 00       	call   3fc0 <printf>
    exit(-1);
    364f:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    3656:	e8 17 08 00 00       	call   3e72 <exit>
  if(c != a + 1){
    printf(stdout, "sbrk test failed post-fork\n");
    exit(-1);
  }
  if(pid == 0)
    exit(0);
    365b:	83 ec 0c             	sub    $0xc,%esp
    365e:	6a 00                	push   $0x0
    3660:	e8 0d 08 00 00       	call   3e72 <exit>
    exit(-1);
  }
  c = sbrk(1);
  c = sbrk(1);
  if(c != a + 1){
    printf(stdout, "sbrk test failed post-fork\n");
    3665:	83 ec 08             	sub    $0x8,%esp
    3668:	68 0d 51 00 00       	push   $0x510d
    366d:	ff 35 74 63 00 00    	pushl  0x6374
    3673:	e8 48 09 00 00       	call   3fc0 <printf>
    exit(-1);
    3678:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    367f:	e8 ee 07 00 00       	call   3e72 <exit>
    *b = 1;
    a = b + 1;
  }
  pid = fork();
  if(pid < 0){
    printf(stdout, "sbrk test fork failed\n");
    3684:	83 ec 08             	sub    $0x8,%esp
    3687:	68 f6 50 00 00       	push   $0x50f6
    368c:	ff 35 74 63 00 00    	pushl  0x6374
    3692:	e8 29 09 00 00       	call   3fc0 <printf>
    exit(-1);
    3697:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    369e:	e8 cf 07 00 00       	call   3e72 <exit>
    36a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    36a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000036b0 <validateint>:
  printf(stdout, "sbrk test OK\n");
}

void
validateint(int *p)
{
    36b0:	55                   	push   %ebp
    36b1:	89 e5                	mov    %esp,%ebp
      "int %2\n\t"
      "mov %%ebx, %%esp" :
      "=a" (res) :
      "a" (SYS_sleep), "n" (T_SYSCALL), "c" (p) :
      "ebx");
}
    36b3:	5d                   	pop    %ebp
    36b4:	c3                   	ret    
    36b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    36b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000036c0 <validatetest>:

void
validatetest(void)
{
    36c0:	55                   	push   %ebp
    36c1:	89 e5                	mov    %esp,%ebp
    36c3:	56                   	push   %esi
    36c4:	53                   	push   %ebx
  uint p;

  printf(stdout, "validate test\n");
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    36c5:	31 db                	xor    %ebx,%ebx
validatetest(void)
{
  int hi, pid;
  uint p;

  printf(stdout, "validate test\n");
    36c7:	83 ec 08             	sub    $0x8,%esp
    36ca:	68 86 51 00 00       	push   $0x5186
    36cf:	ff 35 74 63 00 00    	pushl  0x6374
    36d5:	e8 e6 08 00 00       	call   3fc0 <printf>
    36da:	83 c4 10             	add    $0x10,%esp
    36dd:	8d 76 00             	lea    0x0(%esi),%esi
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    if((pid = fork()) == 0){
    36e0:	e8 85 07 00 00       	call   3e6a <fork>
    36e5:	85 c0                	test   %eax,%eax
    36e7:	89 c6                	mov    %eax,%esi
    36e9:	74 6a                	je     3755 <validatetest+0x95>
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
      exit(0);
    }
    sleep(0);
    36eb:	83 ec 0c             	sub    $0xc,%esp
    36ee:	6a 00                	push   $0x0
    36f0:	e8 15 08 00 00       	call   3f0a <sleep>
    sleep(0);
    36f5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    36fc:	e8 09 08 00 00       	call   3f0a <sleep>
    kill(pid);
    3701:	89 34 24             	mov    %esi,(%esp)
    3704:	e8 a1 07 00 00       	call   3eaa <kill>
    wait(0);
    3709:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3710:	e8 65 07 00 00       	call   3e7a <wait>

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
    3715:	58                   	pop    %eax
    3716:	5a                   	pop    %edx
    3717:	53                   	push   %ebx
    3718:	68 95 51 00 00       	push   $0x5195
    371d:	e8 b8 07 00 00       	call   3eda <link>
    3722:	83 c4 10             	add    $0x10,%esp
    3725:	83 f8 ff             	cmp    $0xffffffff,%eax
    3728:	75 35                	jne    375f <validatetest+0x9f>
  uint p;

  printf(stdout, "validate test\n");
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    372a:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    3730:	81 fb 00 40 11 00    	cmp    $0x114000,%ebx
    3736:	75 a8                	jne    36e0 <validatetest+0x20>
      printf(stdout, "link should not succeed\n");
      exit(-1);
    }
  }

  printf(stdout, "validate ok\n");
    3738:	83 ec 08             	sub    $0x8,%esp
    373b:	68 b9 51 00 00       	push   $0x51b9
    3740:	ff 35 74 63 00 00    	pushl  0x6374
    3746:	e8 75 08 00 00       	call   3fc0 <printf>
}
    374b:	83 c4 10             	add    $0x10,%esp
    374e:	8d 65 f8             	lea    -0x8(%ebp),%esp
    3751:	5b                   	pop    %ebx
    3752:	5e                   	pop    %esi
    3753:	5d                   	pop    %ebp
    3754:	c3                   	ret    

  for(p = 0; p <= (uint)hi; p += 4096){
    if((pid = fork()) == 0){
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
      exit(0);
    3755:	83 ec 0c             	sub    $0xc,%esp
    3758:	6a 00                	push   $0x0
    375a:	e8 13 07 00 00       	call   3e72 <exit>
    kill(pid);
    wait(0);

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
      printf(stdout, "link should not succeed\n");
    375f:	83 ec 08             	sub    $0x8,%esp
    3762:	68 a0 51 00 00       	push   $0x51a0
    3767:	ff 35 74 63 00 00    	pushl  0x6374
    376d:	e8 4e 08 00 00       	call   3fc0 <printf>
      exit(-1);
    3772:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    3779:	e8 f4 06 00 00       	call   3e72 <exit>
    377e:	66 90                	xchg   %ax,%ax

00003780 <bsstest>:

// does unintialized data start out zero?
char uninit[10000];
void
bsstest(void)
{
    3780:	55                   	push   %ebp
    3781:	89 e5                	mov    %esp,%ebp
    3783:	83 ec 10             	sub    $0x10,%esp
  int i;

  printf(stdout, "bss test\n");
    3786:	68 c6 51 00 00       	push   $0x51c6
    378b:	ff 35 74 63 00 00    	pushl  0x6374
    3791:	e8 2a 08 00 00       	call   3fc0 <printf>
  for(i = 0; i < sizeof(uninit); i++){
    if(uninit[i] != '\0'){
    3796:	83 c4 10             	add    $0x10,%esp
    3799:	80 3d 40 64 00 00 00 	cmpb   $0x0,0x6440
    37a0:	75 35                	jne    37d7 <bsstest+0x57>
    37a2:	b8 41 64 00 00       	mov    $0x6441,%eax
    37a7:	89 f6                	mov    %esi,%esi
    37a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    37b0:	80 38 00             	cmpb   $0x0,(%eax)
    37b3:	75 22                	jne    37d7 <bsstest+0x57>
    37b5:	83 c0 01             	add    $0x1,%eax
bsstest(void)
{
  int i;

  printf(stdout, "bss test\n");
  for(i = 0; i < sizeof(uninit); i++){
    37b8:	3d 50 8b 00 00       	cmp    $0x8b50,%eax
    37bd:	75 f1                	jne    37b0 <bsstest+0x30>
    if(uninit[i] != '\0'){
      printf(stdout, "bss test failed\n");
      exit(-1);
    }
  }
  printf(stdout, "bss test ok\n");
    37bf:	83 ec 08             	sub    $0x8,%esp
    37c2:	68 e1 51 00 00       	push   $0x51e1
    37c7:	ff 35 74 63 00 00    	pushl  0x6374
    37cd:	e8 ee 07 00 00       	call   3fc0 <printf>
}
    37d2:	83 c4 10             	add    $0x10,%esp
    37d5:	c9                   	leave  
    37d6:	c3                   	ret    
  int i;

  printf(stdout, "bss test\n");
  for(i = 0; i < sizeof(uninit); i++){
    if(uninit[i] != '\0'){
      printf(stdout, "bss test failed\n");
    37d7:	83 ec 08             	sub    $0x8,%esp
    37da:	68 d0 51 00 00       	push   $0x51d0
    37df:	ff 35 74 63 00 00    	pushl  0x6374
    37e5:	e8 d6 07 00 00       	call   3fc0 <printf>
      exit(-1);
    37ea:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    37f1:	e8 7c 06 00 00       	call   3e72 <exit>
    37f6:	8d 76 00             	lea    0x0(%esi),%esi
    37f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003800 <bigargtest>:
// does exec return an error if the arguments
// are larger than a page? or does it write
// below the stack and wreck the instructions/data?
void
bigargtest(void)
{
    3800:	55                   	push   %ebp
    3801:	89 e5                	mov    %esp,%ebp
    3803:	83 ec 14             	sub    $0x14,%esp
  int pid, fd;

  unlink("bigarg-ok");
    3806:	68 ee 51 00 00       	push   $0x51ee
    380b:	e8 ba 06 00 00       	call   3eca <unlink>
  pid = fork();
    3810:	e8 55 06 00 00       	call   3e6a <fork>
  if(pid == 0){
    3815:	83 c4 10             	add    $0x10,%esp
    3818:	85 c0                	test   %eax,%eax
    381a:	74 43                	je     385f <bigargtest+0x5f>
    exec("echo", args);
    printf(stdout, "bigarg test ok\n");
    fd = open("bigarg-ok", O_CREATE);
    close(fd);
    exit(0);
  } else if(pid < 0){
    381c:	0f 88 d8 00 00 00    	js     38fa <bigargtest+0xfa>
    printf(stdout, "bigargtest: fork failed\n");
    exit(-1);
  }
  wait(0);
    3822:	83 ec 0c             	sub    $0xc,%esp
    3825:	6a 00                	push   $0x0
    3827:	e8 4e 06 00 00       	call   3e7a <wait>
  fd = open("bigarg-ok", 0);
    382c:	5a                   	pop    %edx
    382d:	59                   	pop    %ecx
    382e:	6a 00                	push   $0x0
    3830:	68 ee 51 00 00       	push   $0x51ee
    3835:	e8 80 06 00 00       	call   3eba <open>
  if(fd < 0){
    383a:	83 c4 10             	add    $0x10,%esp
    383d:	85 c0                	test   %eax,%eax
    383f:	0f 88 97 00 00 00    	js     38dc <bigargtest+0xdc>
    printf(stdout, "bigarg test failed!\n");
    exit(-1);
  }
  close(fd);
    3845:	83 ec 0c             	sub    $0xc,%esp
    3848:	50                   	push   %eax
    3849:	e8 54 06 00 00       	call   3ea2 <close>
  unlink("bigarg-ok");
    384e:	c7 04 24 ee 51 00 00 	movl   $0x51ee,(%esp)
    3855:	e8 70 06 00 00       	call   3eca <unlink>
}
    385a:	83 c4 10             	add    $0x10,%esp
    385d:	c9                   	leave  
    385e:	c3                   	ret    
    385f:	b8 a0 63 00 00       	mov    $0x63a0,%eax
    3864:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  pid = fork();
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    3868:	c7 00 48 59 00 00    	movl   $0x5948,(%eax)
    386e:	83 c0 04             	add    $0x4,%eax
  unlink("bigarg-ok");
  pid = fork();
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
    3871:	3d 1c 64 00 00       	cmp    $0x641c,%eax
    3876:	75 f0                	jne    3868 <bigargtest+0x68>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    args[MAXARG-1] = 0;
    printf(stdout, "bigarg test\n");
    3878:	50                   	push   %eax
    3879:	50                   	push   %eax
    387a:	68 f8 51 00 00       	push   $0x51f8
    387f:	ff 35 74 63 00 00    	pushl  0x6374
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    args[MAXARG-1] = 0;
    3885:	c7 05 1c 64 00 00 00 	movl   $0x0,0x641c
    388c:	00 00 00 
    printf(stdout, "bigarg test\n");
    388f:	e8 2c 07 00 00       	call   3fc0 <printf>
    exec("echo", args);
    3894:	58                   	pop    %eax
    3895:	5a                   	pop    %edx
    3896:	68 a0 63 00 00       	push   $0x63a0
    389b:	68 c5 43 00 00       	push   $0x43c5
    38a0:	e8 0d 06 00 00       	call   3eb2 <exec>
    printf(stdout, "bigarg test ok\n");
    38a5:	59                   	pop    %ecx
    38a6:	58                   	pop    %eax
    38a7:	68 05 52 00 00       	push   $0x5205
    38ac:	ff 35 74 63 00 00    	pushl  0x6374
    38b2:	e8 09 07 00 00       	call   3fc0 <printf>
    fd = open("bigarg-ok", O_CREATE);
    38b7:	58                   	pop    %eax
    38b8:	5a                   	pop    %edx
    38b9:	68 00 02 00 00       	push   $0x200
    38be:	68 ee 51 00 00       	push   $0x51ee
    38c3:	e8 f2 05 00 00       	call   3eba <open>
    close(fd);
    38c8:	89 04 24             	mov    %eax,(%esp)
    38cb:	e8 d2 05 00 00       	call   3ea2 <close>
    exit(0);
    38d0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    38d7:	e8 96 05 00 00       	call   3e72 <exit>
    exit(-1);
  }
  wait(0);
  fd = open("bigarg-ok", 0);
  if(fd < 0){
    printf(stdout, "bigarg test failed!\n");
    38dc:	50                   	push   %eax
    38dd:	50                   	push   %eax
    38de:	68 2e 52 00 00       	push   $0x522e
    38e3:	ff 35 74 63 00 00    	pushl  0x6374
    38e9:	e8 d2 06 00 00       	call   3fc0 <printf>
    exit(-1);
    38ee:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    38f5:	e8 78 05 00 00       	call   3e72 <exit>
    printf(stdout, "bigarg test ok\n");
    fd = open("bigarg-ok", O_CREATE);
    close(fd);
    exit(0);
  } else if(pid < 0){
    printf(stdout, "bigargtest: fork failed\n");
    38fa:	50                   	push   %eax
    38fb:	50                   	push   %eax
    38fc:	68 15 52 00 00       	push   $0x5215
    3901:	ff 35 74 63 00 00    	pushl  0x6374
    3907:	e8 b4 06 00 00       	call   3fc0 <printf>
    exit(-1);
    390c:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    3913:	e8 5a 05 00 00       	call   3e72 <exit>
    3918:	90                   	nop
    3919:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00003920 <fsfull>:

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    3920:	55                   	push   %ebp
    3921:	89 e5                	mov    %esp,%ebp
    3923:	57                   	push   %edi
    3924:	56                   	push   %esi
    3925:	53                   	push   %ebx
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    3926:	31 db                	xor    %ebx,%ebx

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    3928:	83 ec 54             	sub    $0x54,%esp
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");
    392b:	68 43 52 00 00       	push   $0x5243
    3930:	6a 01                	push   $0x1
    3932:	e8 89 06 00 00       	call   3fc0 <printf>
    3937:	83 c4 10             	add    $0x10,%esp
    393a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3940:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    3945:	89 de                	mov    %ebx,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    3947:	89 d9                	mov    %ebx,%ecx
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3949:	f7 eb                	imul   %ebx
    394b:	c1 fe 1f             	sar    $0x1f,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    394e:	89 df                	mov    %ebx,%edi
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    3950:	83 ec 04             	sub    $0x4,%esp

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    3953:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    3957:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    395b:	c1 fa 06             	sar    $0x6,%edx
    395e:	29 f2                	sub    %esi,%edx
    3960:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    3963:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3969:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    396c:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    3971:	29 d1                	sub    %edx,%ecx
    3973:	f7 e9                	imul   %ecx
    3975:	c1 f9 1f             	sar    $0x1f,%ecx
    name[3] = '0' + (nfiles % 100) / 10;
    3978:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    397d:	c1 fa 05             	sar    $0x5,%edx
    3980:	29 ca                	sub    %ecx,%edx
    name[3] = '0' + (nfiles % 100) / 10;
    3982:	b9 67 66 66 66       	mov    $0x66666667,%ecx

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    3987:	83 c2 30             	add    $0x30,%edx
    398a:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    398d:	f7 eb                	imul   %ebx
    398f:	c1 fa 05             	sar    $0x5,%edx
    3992:	29 f2                	sub    %esi,%edx
    3994:	6b d2 64             	imul   $0x64,%edx,%edx
    3997:	29 d7                	sub    %edx,%edi
    3999:	89 f8                	mov    %edi,%eax
    399b:	c1 ff 1f             	sar    $0x1f,%edi
    399e:	f7 e9                	imul   %ecx
    name[4] = '0' + (nfiles % 10);
    39a0:	89 d8                	mov    %ebx,%eax
  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    39a2:	c1 fa 02             	sar    $0x2,%edx
    39a5:	29 fa                	sub    %edi,%edx
    39a7:	83 c2 30             	add    $0x30,%edx
    39aa:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    39ad:	f7 e9                	imul   %ecx
    39af:	89 d9                	mov    %ebx,%ecx
    39b1:	c1 fa 02             	sar    $0x2,%edx
    39b4:	29 f2                	sub    %esi,%edx
    39b6:	8d 04 92             	lea    (%edx,%edx,4),%eax
    39b9:	01 c0                	add    %eax,%eax
    39bb:	29 c1                	sub    %eax,%ecx
    39bd:	89 c8                	mov    %ecx,%eax
    39bf:	83 c0 30             	add    $0x30,%eax
    39c2:	88 45 ac             	mov    %al,-0x54(%ebp)
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    39c5:	8d 45 a8             	lea    -0x58(%ebp),%eax
    39c8:	50                   	push   %eax
    39c9:	68 50 52 00 00       	push   $0x5250
    39ce:	6a 01                	push   $0x1
    39d0:	e8 eb 05 00 00       	call   3fc0 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    39d5:	58                   	pop    %eax
    39d6:	8d 45 a8             	lea    -0x58(%ebp),%eax
    39d9:	5a                   	pop    %edx
    39da:	68 02 02 00 00       	push   $0x202
    39df:	50                   	push   %eax
    39e0:	e8 d5 04 00 00       	call   3eba <open>
    if(fd < 0){
    39e5:	83 c4 10             	add    $0x10,%esp
    39e8:	85 c0                	test   %eax,%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    int fd = open(name, O_CREATE|O_RDWR);
    39ea:	89 c7                	mov    %eax,%edi
    if(fd < 0){
    39ec:	78 50                	js     3a3e <fsfull+0x11e>
    39ee:	31 f6                	xor    %esi,%esi
    39f0:	eb 08                	jmp    39fa <fsfull+0xda>
    39f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    int total = 0;
    while(1){
      int cc = write(fd, buf, 512);
      if(cc < 512)
        break;
      total += cc;
    39f8:	01 c6                	add    %eax,%esi
      printf(1, "open %s failed\n", name);
      break;
    }
    int total = 0;
    while(1){
      int cc = write(fd, buf, 512);
    39fa:	83 ec 04             	sub    $0x4,%esp
    39fd:	68 00 02 00 00       	push   $0x200
    3a02:	68 60 8b 00 00       	push   $0x8b60
    3a07:	57                   	push   %edi
    3a08:	e8 8d 04 00 00       	call   3e9a <write>
      if(cc < 512)
    3a0d:	83 c4 10             	add    $0x10,%esp
    3a10:	3d ff 01 00 00       	cmp    $0x1ff,%eax
    3a15:	7f e1                	jg     39f8 <fsfull+0xd8>
        break;
      total += cc;
      fsblocks++;
    }
    printf(1, "wrote %d bytes\n", total);
    3a17:	83 ec 04             	sub    $0x4,%esp
    3a1a:	56                   	push   %esi
    3a1b:	68 6c 52 00 00       	push   $0x526c
    3a20:	6a 01                	push   $0x1
    3a22:	e8 99 05 00 00       	call   3fc0 <printf>
    close(fd);
    3a27:	89 3c 24             	mov    %edi,(%esp)
    3a2a:	e8 73 04 00 00       	call   3ea2 <close>
    if(total == 0)
    3a2f:	83 c4 10             	add    $0x10,%esp
    3a32:	85 f6                	test   %esi,%esi
    3a34:	74 22                	je     3a58 <fsfull+0x138>
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    3a36:	83 c3 01             	add    $0x1,%ebx
    }
    printf(1, "wrote %d bytes\n", total);
    close(fd);
    if(total == 0)
      break;
  }
    3a39:	e9 02 ff ff ff       	jmp    3940 <fsfull+0x20>
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    int fd = open(name, O_CREATE|O_RDWR);
    if(fd < 0){
      printf(1, "open %s failed\n", name);
    3a3e:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3a41:	83 ec 04             	sub    $0x4,%esp
    3a44:	50                   	push   %eax
    3a45:	68 5c 52 00 00       	push   $0x525c
    3a4a:	6a 01                	push   $0x1
    3a4c:	e8 6f 05 00 00       	call   3fc0 <printf>
      break;
    3a51:	83 c4 10             	add    $0x10,%esp
    3a54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3a58:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    3a5d:	89 de                	mov    %ebx,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    3a5f:	89 d9                	mov    %ebx,%ecx
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3a61:	f7 eb                	imul   %ebx
    3a63:	c1 fe 1f             	sar    $0x1f,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    3a66:	89 df                	mov    %ebx,%edi
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    unlink(name);
    3a68:	83 ec 0c             	sub    $0xc,%esp
      break;
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    3a6b:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    3a6f:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3a73:	c1 fa 06             	sar    $0x6,%edx
    3a76:	29 f2                	sub    %esi,%edx
    3a78:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    3a7b:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3a81:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    3a84:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    3a89:	29 d1                	sub    %edx,%ecx
    3a8b:	f7 e9                	imul   %ecx
    3a8d:	c1 f9 1f             	sar    $0x1f,%ecx
    name[3] = '0' + (nfiles % 100) / 10;
    3a90:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    3a95:	c1 fa 05             	sar    $0x5,%edx
    3a98:	29 ca                	sub    %ecx,%edx
    name[3] = '0' + (nfiles % 100) / 10;
    3a9a:	b9 67 66 66 66       	mov    $0x66666667,%ecx

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    3a9f:	83 c2 30             	add    $0x30,%edx
    3aa2:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    3aa5:	f7 eb                	imul   %ebx
    3aa7:	c1 fa 05             	sar    $0x5,%edx
    3aaa:	29 f2                	sub    %esi,%edx
    3aac:	6b d2 64             	imul   $0x64,%edx,%edx
    3aaf:	29 d7                	sub    %edx,%edi
    3ab1:	89 f8                	mov    %edi,%eax
    3ab3:	c1 ff 1f             	sar    $0x1f,%edi
    3ab6:	f7 e9                	imul   %ecx
    name[4] = '0' + (nfiles % 10);
    3ab8:	89 d8                	mov    %ebx,%eax
  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    3aba:	c1 fa 02             	sar    $0x2,%edx
    3abd:	29 fa                	sub    %edi,%edx
    3abf:	83 c2 30             	add    $0x30,%edx
    3ac2:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    3ac5:	f7 e9                	imul   %ecx
    3ac7:	89 d9                	mov    %ebx,%ecx
    name[5] = '\0';
    unlink(name);
    nfiles--;
    3ac9:	83 eb 01             	sub    $0x1,%ebx
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    3acc:	c1 fa 02             	sar    $0x2,%edx
    3acf:	29 f2                	sub    %esi,%edx
    3ad1:	8d 04 92             	lea    (%edx,%edx,4),%eax
    3ad4:	01 c0                	add    %eax,%eax
    3ad6:	29 c1                	sub    %eax,%ecx
    3ad8:	89 c8                	mov    %ecx,%eax
    3ada:	83 c0 30             	add    $0x30,%eax
    3add:	88 45 ac             	mov    %al,-0x54(%ebp)
    name[5] = '\0';
    unlink(name);
    3ae0:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3ae3:	50                   	push   %eax
    3ae4:	e8 e1 03 00 00       	call   3eca <unlink>
    close(fd);
    if(total == 0)
      break;
  }

  while(nfiles >= 0){
    3ae9:	83 c4 10             	add    $0x10,%esp
    3aec:	83 fb ff             	cmp    $0xffffffff,%ebx
    3aef:	0f 85 63 ff ff ff    	jne    3a58 <fsfull+0x138>
    name[5] = '\0';
    unlink(name);
    nfiles--;
  }

  printf(1, "fsfull test finished\n");
    3af5:	83 ec 08             	sub    $0x8,%esp
    3af8:	68 7c 52 00 00       	push   $0x527c
    3afd:	6a 01                	push   $0x1
    3aff:	e8 bc 04 00 00       	call   3fc0 <printf>
}
    3b04:	83 c4 10             	add    $0x10,%esp
    3b07:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3b0a:	5b                   	pop    %ebx
    3b0b:	5e                   	pop    %esi
    3b0c:	5f                   	pop    %edi
    3b0d:	5d                   	pop    %ebp
    3b0e:	c3                   	ret    
    3b0f:	90                   	nop

00003b10 <uio>:

void
uio()
{
    3b10:	55                   	push   %ebp
    3b11:	89 e5                	mov    %esp,%ebp
    3b13:	83 ec 10             	sub    $0x10,%esp

  ushort port = 0;
  uchar val = 0;
  int pid;

  printf(1, "uio test\n");
    3b16:	68 92 52 00 00       	push   $0x5292
    3b1b:	6a 01                	push   $0x1
    3b1d:	e8 9e 04 00 00       	call   3fc0 <printf>
  pid = fork();
    3b22:	e8 43 03 00 00       	call   3e6a <fork>
  if(pid == 0){
    3b27:	83 c4 10             	add    $0x10,%esp
    3b2a:	85 c0                	test   %eax,%eax
    3b2c:	74 1f                	je     3b4d <uio+0x3d>
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    port = RTC_DATA;
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    printf(1, "uio: uio succeeded; test FAILED\n");
    exit(-1);
  } else if(pid < 0){
    3b2e:	78 48                	js     3b78 <uio+0x68>
    printf (1, "fork failed\n");
    exit(-1);
  }
  wait(0);
    3b30:	83 ec 0c             	sub    $0xc,%esp
    3b33:	6a 00                	push   $0x0
    3b35:	e8 40 03 00 00       	call   3e7a <wait>
  printf(1, "uio test done\n");
    3b3a:	58                   	pop    %eax
    3b3b:	5a                   	pop    %edx
    3b3c:	68 9c 52 00 00       	push   $0x529c
    3b41:	6a 01                	push   $0x1
    3b43:	e8 78 04 00 00       	call   3fc0 <printf>
}
    3b48:	83 c4 10             	add    $0x10,%esp
    3b4b:	c9                   	leave  
    3b4c:	c3                   	ret    
  pid = fork();
  if(pid == 0){
    port = RTC_ADDR;
    val = 0x09;  /* year */
    /* http://wiki.osdev.org/Inline_Assembly/Examples */
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    3b4d:	ba 70 00 00 00       	mov    $0x70,%edx
    3b52:	b8 09 00 00 00       	mov    $0x9,%eax
    3b57:	ee                   	out    %al,(%dx)
    port = RTC_DATA;
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    3b58:	ba 71 00 00 00       	mov    $0x71,%edx
    3b5d:	ec                   	in     (%dx),%al
    printf(1, "uio: uio succeeded; test FAILED\n");
    3b5e:	50                   	push   %eax
    3b5f:	50                   	push   %eax
    3b60:	68 28 5a 00 00       	push   $0x5a28
    3b65:	6a 01                	push   $0x1
    3b67:	e8 54 04 00 00       	call   3fc0 <printf>
    exit(-1);
    3b6c:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    3b73:	e8 fa 02 00 00       	call   3e72 <exit>
  } else if(pid < 0){
    printf (1, "fork failed\n");
    3b78:	51                   	push   %ecx
    3b79:	51                   	push   %ecx
    3b7a:	68 21 52 00 00       	push   $0x5221
    3b7f:	6a 01                	push   $0x1
    3b81:	e8 3a 04 00 00       	call   3fc0 <printf>
    exit(-1);
    3b86:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    3b8d:	e8 e0 02 00 00       	call   3e72 <exit>
    3b92:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3b99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003ba0 <argptest>:
  wait(0);
  printf(1, "uio test done\n");
}

void argptest()
{
    3ba0:	55                   	push   %ebp
    3ba1:	89 e5                	mov    %esp,%ebp
    3ba3:	53                   	push   %ebx
    3ba4:	83 ec 0c             	sub    $0xc,%esp
  int fd;
  fd = open("init", O_RDONLY);
    3ba7:	6a 00                	push   $0x0
    3ba9:	68 ab 52 00 00       	push   $0x52ab
    3bae:	e8 07 03 00 00       	call   3eba <open>
  if (fd < 0) {
    3bb3:	83 c4 10             	add    $0x10,%esp
    3bb6:	85 c0                	test   %eax,%eax
    3bb8:	78 39                	js     3bf3 <argptest+0x53>
    printf(2, "open failed\n");
    exit(-1);
  }
  read(fd, sbrk(0) - 1, -1);
    3bba:	83 ec 0c             	sub    $0xc,%esp
    3bbd:	89 c3                	mov    %eax,%ebx
    3bbf:	6a 00                	push   $0x0
    3bc1:	e8 3c 03 00 00       	call   3f02 <sbrk>
    3bc6:	83 c4 0c             	add    $0xc,%esp
    3bc9:	83 e8 01             	sub    $0x1,%eax
    3bcc:	6a ff                	push   $0xffffffff
    3bce:	50                   	push   %eax
    3bcf:	53                   	push   %ebx
    3bd0:	e8 bd 02 00 00       	call   3e92 <read>
  close(fd);
    3bd5:	89 1c 24             	mov    %ebx,(%esp)
    3bd8:	e8 c5 02 00 00       	call   3ea2 <close>
  printf(1, "arg test passed\n");
    3bdd:	58                   	pop    %eax
    3bde:	5a                   	pop    %edx
    3bdf:	68 bd 52 00 00       	push   $0x52bd
    3be4:	6a 01                	push   $0x1
    3be6:	e8 d5 03 00 00       	call   3fc0 <printf>
}
    3beb:	83 c4 10             	add    $0x10,%esp
    3bee:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3bf1:	c9                   	leave  
    3bf2:	c3                   	ret    
void argptest()
{
  int fd;
  fd = open("init", O_RDONLY);
  if (fd < 0) {
    printf(2, "open failed\n");
    3bf3:	51                   	push   %ecx
    3bf4:	51                   	push   %ecx
    3bf5:	68 b0 52 00 00       	push   $0x52b0
    3bfa:	6a 02                	push   $0x2
    3bfc:	e8 bf 03 00 00       	call   3fc0 <printf>
    exit(-1);
    3c01:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    3c08:	e8 65 02 00 00       	call   3e72 <exit>
    3c0d:	8d 76 00             	lea    0x0(%esi),%esi

00003c10 <rand>:

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
    3c10:	69 05 70 63 00 00 0d 	imul   $0x19660d,0x6370,%eax
    3c17:	66 19 00 
}

unsigned long randstate = 1;
unsigned int
rand()
{
    3c1a:	55                   	push   %ebp
    3c1b:	89 e5                	mov    %esp,%ebp
  randstate = randstate * 1664525 + 1013904223;
  return randstate;
}
    3c1d:	5d                   	pop    %ebp

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
    3c1e:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    3c23:	a3 70 63 00 00       	mov    %eax,0x6370
  return randstate;
}
    3c28:	c3                   	ret    
    3c29:	66 90                	xchg   %ax,%ax
    3c2b:	66 90                	xchg   %ax,%ax
    3c2d:	66 90                	xchg   %ax,%ax
    3c2f:	90                   	nop

00003c30 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    3c30:	55                   	push   %ebp
    3c31:	89 e5                	mov    %esp,%ebp
    3c33:	53                   	push   %ebx
    3c34:	8b 45 08             	mov    0x8(%ebp),%eax
    3c37:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    3c3a:	89 c2                	mov    %eax,%edx
    3c3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3c40:	83 c1 01             	add    $0x1,%ecx
    3c43:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    3c47:	83 c2 01             	add    $0x1,%edx
    3c4a:	84 db                	test   %bl,%bl
    3c4c:	88 5a ff             	mov    %bl,-0x1(%edx)
    3c4f:	75 ef                	jne    3c40 <strcpy+0x10>
    ;
  return os;
}
    3c51:	5b                   	pop    %ebx
    3c52:	5d                   	pop    %ebp
    3c53:	c3                   	ret    
    3c54:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    3c5a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00003c60 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    3c60:	55                   	push   %ebp
    3c61:	89 e5                	mov    %esp,%ebp
    3c63:	56                   	push   %esi
    3c64:	53                   	push   %ebx
    3c65:	8b 55 08             	mov    0x8(%ebp),%edx
    3c68:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    3c6b:	0f b6 02             	movzbl (%edx),%eax
    3c6e:	0f b6 19             	movzbl (%ecx),%ebx
    3c71:	84 c0                	test   %al,%al
    3c73:	75 1e                	jne    3c93 <strcmp+0x33>
    3c75:	eb 29                	jmp    3ca0 <strcmp+0x40>
    3c77:	89 f6                	mov    %esi,%esi
    3c79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    3c80:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3c83:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    3c86:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3c89:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    3c8d:	84 c0                	test   %al,%al
    3c8f:	74 0f                	je     3ca0 <strcmp+0x40>
    3c91:	89 f1                	mov    %esi,%ecx
    3c93:	38 d8                	cmp    %bl,%al
    3c95:	74 e9                	je     3c80 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    3c97:	29 d8                	sub    %ebx,%eax
}
    3c99:	5b                   	pop    %ebx
    3c9a:	5e                   	pop    %esi
    3c9b:	5d                   	pop    %ebp
    3c9c:	c3                   	ret    
    3c9d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3ca0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
    3ca2:	29 d8                	sub    %ebx,%eax
}
    3ca4:	5b                   	pop    %ebx
    3ca5:	5e                   	pop    %esi
    3ca6:	5d                   	pop    %ebp
    3ca7:	c3                   	ret    
    3ca8:	90                   	nop
    3ca9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00003cb0 <strlen>:

uint
strlen(const char *s)
{
    3cb0:	55                   	push   %ebp
    3cb1:	89 e5                	mov    %esp,%ebp
    3cb3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    3cb6:	80 39 00             	cmpb   $0x0,(%ecx)
    3cb9:	74 12                	je     3ccd <strlen+0x1d>
    3cbb:	31 d2                	xor    %edx,%edx
    3cbd:	8d 76 00             	lea    0x0(%esi),%esi
    3cc0:	83 c2 01             	add    $0x1,%edx
    3cc3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    3cc7:	89 d0                	mov    %edx,%eax
    3cc9:	75 f5                	jne    3cc0 <strlen+0x10>
    ;
  return n;
}
    3ccb:	5d                   	pop    %ebp
    3ccc:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    3ccd:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
    3ccf:	5d                   	pop    %ebp
    3cd0:	c3                   	ret    
    3cd1:	eb 0d                	jmp    3ce0 <memset>
    3cd3:	90                   	nop
    3cd4:	90                   	nop
    3cd5:	90                   	nop
    3cd6:	90                   	nop
    3cd7:	90                   	nop
    3cd8:	90                   	nop
    3cd9:	90                   	nop
    3cda:	90                   	nop
    3cdb:	90                   	nop
    3cdc:	90                   	nop
    3cdd:	90                   	nop
    3cde:	90                   	nop
    3cdf:	90                   	nop

00003ce0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    3ce0:	55                   	push   %ebp
    3ce1:	89 e5                	mov    %esp,%ebp
    3ce3:	57                   	push   %edi
    3ce4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    3ce7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    3cea:	8b 45 0c             	mov    0xc(%ebp),%eax
    3ced:	89 d7                	mov    %edx,%edi
    3cef:	fc                   	cld    
    3cf0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    3cf2:	89 d0                	mov    %edx,%eax
    3cf4:	5f                   	pop    %edi
    3cf5:	5d                   	pop    %ebp
    3cf6:	c3                   	ret    
    3cf7:	89 f6                	mov    %esi,%esi
    3cf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003d00 <strchr>:

char*
strchr(const char *s, char c)
{
    3d00:	55                   	push   %ebp
    3d01:	89 e5                	mov    %esp,%ebp
    3d03:	53                   	push   %ebx
    3d04:	8b 45 08             	mov    0x8(%ebp),%eax
    3d07:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    3d0a:	0f b6 10             	movzbl (%eax),%edx
    3d0d:	84 d2                	test   %dl,%dl
    3d0f:	74 1d                	je     3d2e <strchr+0x2e>
    if(*s == c)
    3d11:	38 d3                	cmp    %dl,%bl
    3d13:	89 d9                	mov    %ebx,%ecx
    3d15:	75 0d                	jne    3d24 <strchr+0x24>
    3d17:	eb 17                	jmp    3d30 <strchr+0x30>
    3d19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3d20:	38 ca                	cmp    %cl,%dl
    3d22:	74 0c                	je     3d30 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    3d24:	83 c0 01             	add    $0x1,%eax
    3d27:	0f b6 10             	movzbl (%eax),%edx
    3d2a:	84 d2                	test   %dl,%dl
    3d2c:	75 f2                	jne    3d20 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
    3d2e:	31 c0                	xor    %eax,%eax
}
    3d30:	5b                   	pop    %ebx
    3d31:	5d                   	pop    %ebp
    3d32:	c3                   	ret    
    3d33:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    3d39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003d40 <gets>:

char*
gets(char *buf, int max)
{
    3d40:	55                   	push   %ebp
    3d41:	89 e5                	mov    %esp,%ebp
    3d43:	57                   	push   %edi
    3d44:	56                   	push   %esi
    3d45:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3d46:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
    3d48:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
    3d4b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3d4e:	eb 29                	jmp    3d79 <gets+0x39>
    cc = read(0, &c, 1);
    3d50:	83 ec 04             	sub    $0x4,%esp
    3d53:	6a 01                	push   $0x1
    3d55:	57                   	push   %edi
    3d56:	6a 00                	push   $0x0
    3d58:	e8 35 01 00 00       	call   3e92 <read>
    if(cc < 1)
    3d5d:	83 c4 10             	add    $0x10,%esp
    3d60:	85 c0                	test   %eax,%eax
    3d62:	7e 1d                	jle    3d81 <gets+0x41>
      break;
    buf[i++] = c;
    3d64:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    3d68:	8b 55 08             	mov    0x8(%ebp),%edx
    3d6b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
    3d6d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    3d6f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    3d73:	74 1b                	je     3d90 <gets+0x50>
    3d75:	3c 0d                	cmp    $0xd,%al
    3d77:	74 17                	je     3d90 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3d79:	8d 5e 01             	lea    0x1(%esi),%ebx
    3d7c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    3d7f:	7c cf                	jl     3d50 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    3d81:	8b 45 08             	mov    0x8(%ebp),%eax
    3d84:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    3d88:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3d8b:	5b                   	pop    %ebx
    3d8c:	5e                   	pop    %esi
    3d8d:	5f                   	pop    %edi
    3d8e:	5d                   	pop    %ebp
    3d8f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    3d90:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3d93:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    3d95:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    3d99:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3d9c:	5b                   	pop    %ebx
    3d9d:	5e                   	pop    %esi
    3d9e:	5f                   	pop    %edi
    3d9f:	5d                   	pop    %ebp
    3da0:	c3                   	ret    
    3da1:	eb 0d                	jmp    3db0 <stat>
    3da3:	90                   	nop
    3da4:	90                   	nop
    3da5:	90                   	nop
    3da6:	90                   	nop
    3da7:	90                   	nop
    3da8:	90                   	nop
    3da9:	90                   	nop
    3daa:	90                   	nop
    3dab:	90                   	nop
    3dac:	90                   	nop
    3dad:	90                   	nop
    3dae:	90                   	nop
    3daf:	90                   	nop

00003db0 <stat>:

int
stat(const char *n, struct stat *st)
{
    3db0:	55                   	push   %ebp
    3db1:	89 e5                	mov    %esp,%ebp
    3db3:	56                   	push   %esi
    3db4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    3db5:	83 ec 08             	sub    $0x8,%esp
    3db8:	6a 00                	push   $0x0
    3dba:	ff 75 08             	pushl  0x8(%ebp)
    3dbd:	e8 f8 00 00 00       	call   3eba <open>
  if(fd < 0)
    3dc2:	83 c4 10             	add    $0x10,%esp
    3dc5:	85 c0                	test   %eax,%eax
    3dc7:	78 27                	js     3df0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    3dc9:	83 ec 08             	sub    $0x8,%esp
    3dcc:	ff 75 0c             	pushl  0xc(%ebp)
    3dcf:	89 c3                	mov    %eax,%ebx
    3dd1:	50                   	push   %eax
    3dd2:	e8 fb 00 00 00       	call   3ed2 <fstat>
    3dd7:	89 c6                	mov    %eax,%esi
  close(fd);
    3dd9:	89 1c 24             	mov    %ebx,(%esp)
    3ddc:	e8 c1 00 00 00       	call   3ea2 <close>
  return r;
    3de1:	83 c4 10             	add    $0x10,%esp
    3de4:	89 f0                	mov    %esi,%eax
}
    3de6:	8d 65 f8             	lea    -0x8(%ebp),%esp
    3de9:	5b                   	pop    %ebx
    3dea:	5e                   	pop    %esi
    3deb:	5d                   	pop    %ebp
    3dec:	c3                   	ret    
    3ded:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
    3df0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3df5:	eb ef                	jmp    3de6 <stat+0x36>
    3df7:	89 f6                	mov    %esi,%esi
    3df9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003e00 <atoi>:
  return r;
}

int
atoi(const char *s)
{
    3e00:	55                   	push   %ebp
    3e01:	89 e5                	mov    %esp,%ebp
    3e03:	53                   	push   %ebx
    3e04:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    3e07:	0f be 11             	movsbl (%ecx),%edx
    3e0a:	8d 42 d0             	lea    -0x30(%edx),%eax
    3e0d:	3c 09                	cmp    $0x9,%al
    3e0f:	b8 00 00 00 00       	mov    $0x0,%eax
    3e14:	77 1f                	ja     3e35 <atoi+0x35>
    3e16:	8d 76 00             	lea    0x0(%esi),%esi
    3e19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    3e20:	8d 04 80             	lea    (%eax,%eax,4),%eax
    3e23:	83 c1 01             	add    $0x1,%ecx
    3e26:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    3e2a:	0f be 11             	movsbl (%ecx),%edx
    3e2d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    3e30:	80 fb 09             	cmp    $0x9,%bl
    3e33:	76 eb                	jbe    3e20 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
    3e35:	5b                   	pop    %ebx
    3e36:	5d                   	pop    %ebp
    3e37:	c3                   	ret    
    3e38:	90                   	nop
    3e39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00003e40 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    3e40:	55                   	push   %ebp
    3e41:	89 e5                	mov    %esp,%ebp
    3e43:	56                   	push   %esi
    3e44:	53                   	push   %ebx
    3e45:	8b 5d 10             	mov    0x10(%ebp),%ebx
    3e48:	8b 45 08             	mov    0x8(%ebp),%eax
    3e4b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    3e4e:	85 db                	test   %ebx,%ebx
    3e50:	7e 14                	jle    3e66 <memmove+0x26>
    3e52:	31 d2                	xor    %edx,%edx
    3e54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    3e58:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    3e5c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    3e5f:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    3e62:	39 da                	cmp    %ebx,%edx
    3e64:	75 f2                	jne    3e58 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
    3e66:	5b                   	pop    %ebx
    3e67:	5e                   	pop    %esi
    3e68:	5d                   	pop    %ebp
    3e69:	c3                   	ret    

00003e6a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    3e6a:	b8 01 00 00 00       	mov    $0x1,%eax
    3e6f:	cd 40                	int    $0x40
    3e71:	c3                   	ret    

00003e72 <exit>:
SYSCALL(exit)
    3e72:	b8 02 00 00 00       	mov    $0x2,%eax
    3e77:	cd 40                	int    $0x40
    3e79:	c3                   	ret    

00003e7a <wait>:
SYSCALL(wait)
    3e7a:	b8 03 00 00 00       	mov    $0x3,%eax
    3e7f:	cd 40                	int    $0x40
    3e81:	c3                   	ret    

00003e82 <waitpid>:
SYSCALL(waitpid)
    3e82:	b8 16 00 00 00       	mov    $0x16,%eax
    3e87:	cd 40                	int    $0x40
    3e89:	c3                   	ret    

00003e8a <pipe>:
SYSCALL(pipe)
    3e8a:	b8 04 00 00 00       	mov    $0x4,%eax
    3e8f:	cd 40                	int    $0x40
    3e91:	c3                   	ret    

00003e92 <read>:
SYSCALL(read)
    3e92:	b8 05 00 00 00       	mov    $0x5,%eax
    3e97:	cd 40                	int    $0x40
    3e99:	c3                   	ret    

00003e9a <write>:
SYSCALL(write)
    3e9a:	b8 10 00 00 00       	mov    $0x10,%eax
    3e9f:	cd 40                	int    $0x40
    3ea1:	c3                   	ret    

00003ea2 <close>:
SYSCALL(close)
    3ea2:	b8 15 00 00 00       	mov    $0x15,%eax
    3ea7:	cd 40                	int    $0x40
    3ea9:	c3                   	ret    

00003eaa <kill>:
SYSCALL(kill)
    3eaa:	b8 06 00 00 00       	mov    $0x6,%eax
    3eaf:	cd 40                	int    $0x40
    3eb1:	c3                   	ret    

00003eb2 <exec>:
SYSCALL(exec)
    3eb2:	b8 07 00 00 00       	mov    $0x7,%eax
    3eb7:	cd 40                	int    $0x40
    3eb9:	c3                   	ret    

00003eba <open>:
SYSCALL(open)
    3eba:	b8 0f 00 00 00       	mov    $0xf,%eax
    3ebf:	cd 40                	int    $0x40
    3ec1:	c3                   	ret    

00003ec2 <mknod>:
SYSCALL(mknod)
    3ec2:	b8 11 00 00 00       	mov    $0x11,%eax
    3ec7:	cd 40                	int    $0x40
    3ec9:	c3                   	ret    

00003eca <unlink>:
SYSCALL(unlink)
    3eca:	b8 12 00 00 00       	mov    $0x12,%eax
    3ecf:	cd 40                	int    $0x40
    3ed1:	c3                   	ret    

00003ed2 <fstat>:
SYSCALL(fstat)
    3ed2:	b8 08 00 00 00       	mov    $0x8,%eax
    3ed7:	cd 40                	int    $0x40
    3ed9:	c3                   	ret    

00003eda <link>:
SYSCALL(link)
    3eda:	b8 13 00 00 00       	mov    $0x13,%eax
    3edf:	cd 40                	int    $0x40
    3ee1:	c3                   	ret    

00003ee2 <mkdir>:
SYSCALL(mkdir)
    3ee2:	b8 14 00 00 00       	mov    $0x14,%eax
    3ee7:	cd 40                	int    $0x40
    3ee9:	c3                   	ret    

00003eea <chdir>:
SYSCALL(chdir)
    3eea:	b8 09 00 00 00       	mov    $0x9,%eax
    3eef:	cd 40                	int    $0x40
    3ef1:	c3                   	ret    

00003ef2 <dup>:
SYSCALL(dup)
    3ef2:	b8 0a 00 00 00       	mov    $0xa,%eax
    3ef7:	cd 40                	int    $0x40
    3ef9:	c3                   	ret    

00003efa <getpid>:
SYSCALL(getpid)
    3efa:	b8 0b 00 00 00       	mov    $0xb,%eax
    3eff:	cd 40                	int    $0x40
    3f01:	c3                   	ret    

00003f02 <sbrk>:
SYSCALL(sbrk)
    3f02:	b8 0c 00 00 00       	mov    $0xc,%eax
    3f07:	cd 40                	int    $0x40
    3f09:	c3                   	ret    

00003f0a <sleep>:
SYSCALL(sleep)
    3f0a:	b8 0d 00 00 00       	mov    $0xd,%eax
    3f0f:	cd 40                	int    $0x40
    3f11:	c3                   	ret    

00003f12 <uptime>:
SYSCALL(uptime)
    3f12:	b8 0e 00 00 00       	mov    $0xe,%eax
    3f17:	cd 40                	int    $0x40
    3f19:	c3                   	ret    
    3f1a:	66 90                	xchg   %ax,%ax
    3f1c:	66 90                	xchg   %ax,%ax
    3f1e:	66 90                	xchg   %ax,%ax

00003f20 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    3f20:	55                   	push   %ebp
    3f21:	89 e5                	mov    %esp,%ebp
    3f23:	57                   	push   %edi
    3f24:	56                   	push   %esi
    3f25:	53                   	push   %ebx
    3f26:	89 c6                	mov    %eax,%esi
    3f28:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    3f2b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    3f2e:	85 db                	test   %ebx,%ebx
    3f30:	74 7e                	je     3fb0 <printint+0x90>
    3f32:	89 d0                	mov    %edx,%eax
    3f34:	c1 e8 1f             	shr    $0x1f,%eax
    3f37:	84 c0                	test   %al,%al
    3f39:	74 75                	je     3fb0 <printint+0x90>
    neg = 1;
    x = -xx;
    3f3b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    3f3d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
    3f44:	f7 d8                	neg    %eax
    3f46:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    3f49:	31 ff                	xor    %edi,%edi
    3f4b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    3f4e:	89 ce                	mov    %ecx,%esi
    3f50:	eb 08                	jmp    3f5a <printint+0x3a>
    3f52:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    3f58:	89 cf                	mov    %ecx,%edi
    3f5a:	31 d2                	xor    %edx,%edx
    3f5c:	8d 4f 01             	lea    0x1(%edi),%ecx
    3f5f:	f7 f6                	div    %esi
    3f61:	0f b6 92 80 5a 00 00 	movzbl 0x5a80(%edx),%edx
  }while((x /= base) != 0);
    3f68:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    3f6a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    3f6d:	75 e9                	jne    3f58 <printint+0x38>
  if(neg)
    3f6f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    3f72:	8b 75 c0             	mov    -0x40(%ebp),%esi
    3f75:	85 c0                	test   %eax,%eax
    3f77:	74 08                	je     3f81 <printint+0x61>
    buf[i++] = '-';
    3f79:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
    3f7e:	8d 4f 02             	lea    0x2(%edi),%ecx
    3f81:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
    3f85:	8d 76 00             	lea    0x0(%esi),%esi
    3f88:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3f8b:	83 ec 04             	sub    $0x4,%esp
    3f8e:	83 ef 01             	sub    $0x1,%edi
    3f91:	6a 01                	push   $0x1
    3f93:	53                   	push   %ebx
    3f94:	56                   	push   %esi
    3f95:	88 45 d7             	mov    %al,-0x29(%ebp)
    3f98:	e8 fd fe ff ff       	call   3e9a <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    3f9d:	83 c4 10             	add    $0x10,%esp
    3fa0:	39 df                	cmp    %ebx,%edi
    3fa2:	75 e4                	jne    3f88 <printint+0x68>
    putc(fd, buf[i]);
}
    3fa4:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3fa7:	5b                   	pop    %ebx
    3fa8:	5e                   	pop    %esi
    3fa9:	5f                   	pop    %edi
    3faa:	5d                   	pop    %ebp
    3fab:	c3                   	ret    
    3fac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    3fb0:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    3fb2:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    3fb9:	eb 8b                	jmp    3f46 <printint+0x26>
    3fbb:	90                   	nop
    3fbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003fc0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    3fc0:	55                   	push   %ebp
    3fc1:	89 e5                	mov    %esp,%ebp
    3fc3:	57                   	push   %edi
    3fc4:	56                   	push   %esi
    3fc5:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3fc6:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    3fc9:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3fcc:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    3fcf:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3fd2:	89 45 d0             	mov    %eax,-0x30(%ebp)
    3fd5:	0f b6 1e             	movzbl (%esi),%ebx
    3fd8:	83 c6 01             	add    $0x1,%esi
    3fdb:	84 db                	test   %bl,%bl
    3fdd:	0f 84 b0 00 00 00    	je     4093 <printf+0xd3>
    3fe3:	31 d2                	xor    %edx,%edx
    3fe5:	eb 39                	jmp    4020 <printf+0x60>
    3fe7:	89 f6                	mov    %esi,%esi
    3fe9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    3ff0:	83 f8 25             	cmp    $0x25,%eax
    3ff3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    3ff6:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    3ffb:	74 18                	je     4015 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3ffd:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    4000:	83 ec 04             	sub    $0x4,%esp
    4003:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    4006:	6a 01                	push   $0x1
    4008:	50                   	push   %eax
    4009:	57                   	push   %edi
    400a:	e8 8b fe ff ff       	call   3e9a <write>
    400f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    4012:	83 c4 10             	add    $0x10,%esp
    4015:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    4018:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    401c:	84 db                	test   %bl,%bl
    401e:	74 73                	je     4093 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
    4020:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    4022:	0f be cb             	movsbl %bl,%ecx
    4025:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    4028:	74 c6                	je     3ff0 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    402a:	83 fa 25             	cmp    $0x25,%edx
    402d:	75 e6                	jne    4015 <printf+0x55>
      if(c == 'd'){
    402f:	83 f8 64             	cmp    $0x64,%eax
    4032:	0f 84 f8 00 00 00    	je     4130 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    4038:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    403e:	83 f9 70             	cmp    $0x70,%ecx
    4041:	74 5d                	je     40a0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    4043:	83 f8 73             	cmp    $0x73,%eax
    4046:	0f 84 84 00 00 00    	je     40d0 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    404c:	83 f8 63             	cmp    $0x63,%eax
    404f:	0f 84 ea 00 00 00    	je     413f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    4055:	83 f8 25             	cmp    $0x25,%eax
    4058:	0f 84 c2 00 00 00    	je     4120 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    405e:	8d 45 e7             	lea    -0x19(%ebp),%eax
    4061:	83 ec 04             	sub    $0x4,%esp
    4064:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    4068:	6a 01                	push   $0x1
    406a:	50                   	push   %eax
    406b:	57                   	push   %edi
    406c:	e8 29 fe ff ff       	call   3e9a <write>
    4071:	83 c4 0c             	add    $0xc,%esp
    4074:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    4077:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    407a:	6a 01                	push   $0x1
    407c:	50                   	push   %eax
    407d:	57                   	push   %edi
    407e:	83 c6 01             	add    $0x1,%esi
    4081:	e8 14 fe ff ff       	call   3e9a <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    4086:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    408a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    408d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    408f:	84 db                	test   %bl,%bl
    4091:	75 8d                	jne    4020 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    4093:	8d 65 f4             	lea    -0xc(%ebp),%esp
    4096:	5b                   	pop    %ebx
    4097:	5e                   	pop    %esi
    4098:	5f                   	pop    %edi
    4099:	5d                   	pop    %ebp
    409a:	c3                   	ret    
    409b:	90                   	nop
    409c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    40a0:	83 ec 0c             	sub    $0xc,%esp
    40a3:	b9 10 00 00 00       	mov    $0x10,%ecx
    40a8:	6a 00                	push   $0x0
    40aa:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    40ad:	89 f8                	mov    %edi,%eax
    40af:	8b 13                	mov    (%ebx),%edx
    40b1:	e8 6a fe ff ff       	call   3f20 <printint>
        ap++;
    40b6:	89 d8                	mov    %ebx,%eax
    40b8:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    40bb:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
    40bd:	83 c0 04             	add    $0x4,%eax
    40c0:	89 45 d0             	mov    %eax,-0x30(%ebp)
    40c3:	e9 4d ff ff ff       	jmp    4015 <printf+0x55>
    40c8:	90                   	nop
    40c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
    40d0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    40d3:	8b 18                	mov    (%eax),%ebx
        ap++;
    40d5:	83 c0 04             	add    $0x4,%eax
    40d8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
    40db:	b8 78 5a 00 00       	mov    $0x5a78,%eax
    40e0:	85 db                	test   %ebx,%ebx
    40e2:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
    40e5:	0f b6 03             	movzbl (%ebx),%eax
    40e8:	84 c0                	test   %al,%al
    40ea:	74 23                	je     410f <printf+0x14f>
    40ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    40f0:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    40f3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    40f6:	83 ec 04             	sub    $0x4,%esp
    40f9:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
    40fb:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    40fe:	50                   	push   %eax
    40ff:	57                   	push   %edi
    4100:	e8 95 fd ff ff       	call   3e9a <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    4105:	0f b6 03             	movzbl (%ebx),%eax
    4108:	83 c4 10             	add    $0x10,%esp
    410b:	84 c0                	test   %al,%al
    410d:	75 e1                	jne    40f0 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    410f:	31 d2                	xor    %edx,%edx
    4111:	e9 ff fe ff ff       	jmp    4015 <printf+0x55>
    4116:	8d 76 00             	lea    0x0(%esi),%esi
    4119:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    4120:	83 ec 04             	sub    $0x4,%esp
    4123:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    4126:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    4129:	6a 01                	push   $0x1
    412b:	e9 4c ff ff ff       	jmp    407c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    4130:	83 ec 0c             	sub    $0xc,%esp
    4133:	b9 0a 00 00 00       	mov    $0xa,%ecx
    4138:	6a 01                	push   $0x1
    413a:	e9 6b ff ff ff       	jmp    40aa <printf+0xea>
    413f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    4142:	83 ec 04             	sub    $0x4,%esp
    4145:	8b 03                	mov    (%ebx),%eax
    4147:	6a 01                	push   $0x1
    4149:	88 45 e4             	mov    %al,-0x1c(%ebp)
    414c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    414f:	50                   	push   %eax
    4150:	57                   	push   %edi
    4151:	e8 44 fd ff ff       	call   3e9a <write>
    4156:	e9 5b ff ff ff       	jmp    40b6 <printf+0xf6>
    415b:	66 90                	xchg   %ax,%ax
    415d:	66 90                	xchg   %ax,%ax
    415f:	90                   	nop

00004160 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    4160:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    4161:	a1 20 64 00 00       	mov    0x6420,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    4166:	89 e5                	mov    %esp,%ebp
    4168:	57                   	push   %edi
    4169:	56                   	push   %esi
    416a:	53                   	push   %ebx
    416b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    416e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
    4170:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    4173:	39 c8                	cmp    %ecx,%eax
    4175:	73 19                	jae    4190 <free+0x30>
    4177:	89 f6                	mov    %esi,%esi
    4179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    4180:	39 d1                	cmp    %edx,%ecx
    4182:	72 1c                	jb     41a0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    4184:	39 d0                	cmp    %edx,%eax
    4186:	73 18                	jae    41a0 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
    4188:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    418a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    418c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    418e:	72 f0                	jb     4180 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    4190:	39 d0                	cmp    %edx,%eax
    4192:	72 f4                	jb     4188 <free+0x28>
    4194:	39 d1                	cmp    %edx,%ecx
    4196:	73 f0                	jae    4188 <free+0x28>
    4198:	90                   	nop
    4199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
    41a0:	8b 73 fc             	mov    -0x4(%ebx),%esi
    41a3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    41a6:	39 d7                	cmp    %edx,%edi
    41a8:	74 19                	je     41c3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    41aa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    41ad:	8b 50 04             	mov    0x4(%eax),%edx
    41b0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    41b3:	39 f1                	cmp    %esi,%ecx
    41b5:	74 23                	je     41da <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    41b7:	89 08                	mov    %ecx,(%eax)
  freep = p;
    41b9:	a3 20 64 00 00       	mov    %eax,0x6420
}
    41be:	5b                   	pop    %ebx
    41bf:	5e                   	pop    %esi
    41c0:	5f                   	pop    %edi
    41c1:	5d                   	pop    %ebp
    41c2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    41c3:	03 72 04             	add    0x4(%edx),%esi
    41c6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    41c9:	8b 10                	mov    (%eax),%edx
    41cb:	8b 12                	mov    (%edx),%edx
    41cd:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    41d0:	8b 50 04             	mov    0x4(%eax),%edx
    41d3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    41d6:	39 f1                	cmp    %esi,%ecx
    41d8:	75 dd                	jne    41b7 <free+0x57>
    p->s.size += bp->s.size;
    41da:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    41dd:	a3 20 64 00 00       	mov    %eax,0x6420
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    41e2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    41e5:	8b 53 f8             	mov    -0x8(%ebx),%edx
    41e8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    41ea:	5b                   	pop    %ebx
    41eb:	5e                   	pop    %esi
    41ec:	5f                   	pop    %edi
    41ed:	5d                   	pop    %ebp
    41ee:	c3                   	ret    
    41ef:	90                   	nop

000041f0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    41f0:	55                   	push   %ebp
    41f1:	89 e5                	mov    %esp,%ebp
    41f3:	57                   	push   %edi
    41f4:	56                   	push   %esi
    41f5:	53                   	push   %ebx
    41f6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    41f9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    41fc:	8b 15 20 64 00 00    	mov    0x6420,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    4202:	8d 78 07             	lea    0x7(%eax),%edi
    4205:	c1 ef 03             	shr    $0x3,%edi
    4208:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    420b:	85 d2                	test   %edx,%edx
    420d:	0f 84 a3 00 00 00    	je     42b6 <malloc+0xc6>
    4213:	8b 02                	mov    (%edx),%eax
    4215:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    4218:	39 cf                	cmp    %ecx,%edi
    421a:	76 74                	jbe    4290 <malloc+0xa0>
    421c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    4222:	be 00 10 00 00       	mov    $0x1000,%esi
    4227:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
    422e:	0f 43 f7             	cmovae %edi,%esi
    4231:	ba 00 80 00 00       	mov    $0x8000,%edx
    4236:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
    423c:	0f 46 da             	cmovbe %edx,%ebx
    423f:	eb 10                	jmp    4251 <malloc+0x61>
    4241:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    4248:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    424a:	8b 48 04             	mov    0x4(%eax),%ecx
    424d:	39 cf                	cmp    %ecx,%edi
    424f:	76 3f                	jbe    4290 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    4251:	39 05 20 64 00 00    	cmp    %eax,0x6420
    4257:	89 c2                	mov    %eax,%edx
    4259:	75 ed                	jne    4248 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    425b:	83 ec 0c             	sub    $0xc,%esp
    425e:	53                   	push   %ebx
    425f:	e8 9e fc ff ff       	call   3f02 <sbrk>
  if(p == (char*)-1)
    4264:	83 c4 10             	add    $0x10,%esp
    4267:	83 f8 ff             	cmp    $0xffffffff,%eax
    426a:	74 1c                	je     4288 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    426c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
    426f:	83 ec 0c             	sub    $0xc,%esp
    4272:	83 c0 08             	add    $0x8,%eax
    4275:	50                   	push   %eax
    4276:	e8 e5 fe ff ff       	call   4160 <free>
  return freep;
    427b:	8b 15 20 64 00 00    	mov    0x6420,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    4281:	83 c4 10             	add    $0x10,%esp
    4284:	85 d2                	test   %edx,%edx
    4286:	75 c0                	jne    4248 <malloc+0x58>
        return 0;
    4288:	31 c0                	xor    %eax,%eax
    428a:	eb 1c                	jmp    42a8 <malloc+0xb8>
    428c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    4290:	39 cf                	cmp    %ecx,%edi
    4292:	74 1c                	je     42b0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    4294:	29 f9                	sub    %edi,%ecx
    4296:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    4299:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    429c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
    429f:	89 15 20 64 00 00    	mov    %edx,0x6420
      return (void*)(p + 1);
    42a5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    42a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    42ab:	5b                   	pop    %ebx
    42ac:	5e                   	pop    %esi
    42ad:	5f                   	pop    %edi
    42ae:	5d                   	pop    %ebp
    42af:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    42b0:	8b 08                	mov    (%eax),%ecx
    42b2:	89 0a                	mov    %ecx,(%edx)
    42b4:	eb e9                	jmp    429f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    42b6:	c7 05 20 64 00 00 24 	movl   $0x6424,0x6420
    42bd:	64 00 00 
    42c0:	c7 05 24 64 00 00 24 	movl   $0x6424,0x6424
    42c7:	64 00 00 
    base.s.size = 0;
    42ca:	b8 24 64 00 00       	mov    $0x6424,%eax
    42cf:	c7 05 28 64 00 00 00 	movl   $0x0,0x6428
    42d6:	00 00 00 
    42d9:	e9 3e ff ff ff       	jmp    421c <malloc+0x2c>
