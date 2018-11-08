
_lab2:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "user.h"

int main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   f:	8b 59 04             	mov    0x4(%ecx),%ebx
	
	int exitWait(void);
	int waitPid(void);
	int PScheduler(void);
       int testaging(void);
  printf(1, "\n This program tests the correctness of your lab#1\n");
  12:	83 ec 08             	sub    $0x8,%esp
  15:	68 68 0f 00 00       	push   $0xf68
  1a:	6a 01                	push   $0x1
  1c:	e8 7f 08 00 00       	call   8a0 <printf>
  
  if (atoi(argv[1]) == 1)
  21:	5a                   	pop    %edx
  22:	ff 73 04             	pushl  0x4(%ebx)
  25:	e8 a6 06 00 00       	call   6d0 <atoi>
  2a:	83 c4 10             	add    $0x10,%esp
  2d:	83 f8 01             	cmp    $0x1,%eax
  30:	74 54                	je     86 <main+0x86>
	exitWait();
  else if (atoi(argv[1]) == 2)
  32:	83 ec 0c             	sub    $0xc,%esp
  35:	ff 73 04             	pushl  0x4(%ebx)
  38:	e8 93 06 00 00       	call   6d0 <atoi>
  3d:	83 c4 10             	add    $0x10,%esp
  40:	83 f8 02             	cmp    $0x2,%eax
  43:	74 48                	je     8d <main+0x8d>
	waitPid();
  else if (atoi(argv[1]) == 3)
  45:	83 ec 0c             	sub    $0xc,%esp
  48:	ff 73 04             	pushl  0x4(%ebx)
  4b:	e8 80 06 00 00       	call   6d0 <atoi>
  50:	83 c4 10             	add    $0x10,%esp
  53:	83 f8 03             	cmp    $0x3,%eax
  56:	74 3c                	je     94 <main+0x94>
	PScheduler();
 else if(atoi(argv[1]) == 4)
  58:	83 ec 0c             	sub    $0xc,%esp
  5b:	ff 73 04             	pushl  0x4(%ebx)
  5e:	e8 6d 06 00 00       	call   6d0 <atoi>
  63:	83 c4 10             	add    $0x10,%esp
  66:	83 f8 04             	cmp    $0x4,%eax
  69:	74 30                	je     9b <main+0x9b>
	testaging();
  else 
   printf(1, "\ntype \"lab1 1\" to test exit and wait, \"lab1 2\" to test waitpid and \"lab1 3\" to test the priority scheduler \n");
  6b:	50                   	push   %eax
  6c:	50                   	push   %eax
  6d:	68 9c 0f 00 00       	push   $0xf9c
  72:	6a 01                	push   $0x1
  74:	e8 27 08 00 00       	call   8a0 <printf>
  79:	83 c4 10             	add    $0x10,%esp
  
    // End of test
	 exit(0);
  7c:	83 ec 0c             	sub    $0xc,%esp
  7f:	6a 00                	push   $0x0
  81:	e8 bc 06 00 00       	call   742 <exit>
	int PScheduler(void);
       int testaging(void);
  printf(1, "\n This program tests the correctness of your lab#1\n");
  
  if (atoi(argv[1]) == 1)
	exitWait();
  86:	e8 25 00 00 00       	call   b0 <exitWait>
  8b:	eb ef                	jmp    7c <main+0x7c>
  else if (atoi(argv[1]) == 2)
	waitPid();
  8d:	e8 de 00 00 00       	call   170 <waitPid>
  92:	eb e8                	jmp    7c <main+0x7c>
  else if (atoi(argv[1]) == 3)
	PScheduler();
  94:	e8 77 02 00 00       	call   310 <PScheduler>
  99:	eb e1                	jmp    7c <main+0x7c>
 else if(atoi(argv[1]) == 4)
	testaging();
  9b:	e8 80 03 00 00       	call   420 <testaging>
  a0:	eb da                	jmp    7c <main+0x7c>
  a2:	66 90                	xchg   %ax,%ax
  a4:	66 90                	xchg   %ax,%ax
  a6:	66 90                	xchg   %ax,%ax
  a8:	66 90                	xchg   %ax,%ax
  aa:	66 90                	xchg   %ax,%ax
  ac:	66 90                	xchg   %ax,%ax
  ae:	66 90                	xchg   %ax,%ax

000000b0 <exitWait>:
    // End of test
	 exit(0);
 }
  
  
int exitWait(void) {
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	56                   	push   %esi
  b4:	53                   	push   %ebx
      {
	 printf(1, "\nThis is child with PID# %d and I will exit with status %d\n" ,getpid(), -1);
      exit(-1);
  } 
    } else if (pid > 0) { // only the parent exeecutes this code
      ret_pid = wait(&exit_status);
  b5:	8d 75 f4             	lea    -0xc(%ebp),%esi
       int i;
  // use this part to test exit(int status) and wait(int* status)
 
  printf(1, "\n  Step 1: testing exit(int status) and wait(int* status):\n");

  for (i = 0; i < 2; i++) {
  b8:	31 db                	xor    %ebx,%ebx
    // End of test
	 exit(0);
 }
  
  
int exitWait(void) {
  ba:	83 ec 18             	sub    $0x18,%esp
	  int pid, ret_pid, exit_status;
       int i;
  // use this part to test exit(int status) and wait(int* status)
 
  printf(1, "\n  Step 1: testing exit(int status) and wait(int* status):\n");
  bd:	68 c0 0b 00 00       	push   $0xbc0
  c2:	6a 01                	push   $0x1
  c4:	e8 d7 07 00 00       	call   8a0 <printf>
  c9:	83 c4 10             	add    $0x10,%esp

  for (i = 0; i < 2; i++) {
    pid = fork();
  cc:	e8 69 06 00 00       	call   73a <fork>
    if (pid == 0) { // only the child executed this code
  d1:	83 f8 00             	cmp    $0x0,%eax
  d4:	74 32                	je     108 <exitWait+0x58>
      else
      {
	 printf(1, "\nThis is child with PID# %d and I will exit with status %d\n" ,getpid(), -1);
      exit(-1);
  } 
    } else if (pid > 0) { // only the parent exeecutes this code
  d6:	7e 78                	jle    150 <exitWait+0xa0>
      ret_pid = wait(&exit_status);
  d8:	83 ec 0c             	sub    $0xc,%esp
       int i;
  // use this part to test exit(int status) and wait(int* status)
 
  printf(1, "\n  Step 1: testing exit(int status) and wait(int* status):\n");

  for (i = 0; i < 2; i++) {
  db:	83 c3 01             	add    $0x1,%ebx
      {
	 printf(1, "\nThis is child with PID# %d and I will exit with status %d\n" ,getpid(), -1);
      exit(-1);
  } 
    } else if (pid > 0) { // only the parent exeecutes this code
      ret_pid = wait(&exit_status);
  de:	56                   	push   %esi
  df:	e8 66 06 00 00       	call   74a <wait>
      printf(1, "\n This is the parent: child with PID# %d has exited with status %d\n", ret_pid, exit_status);
  e4:	ff 75 f4             	pushl  -0xc(%ebp)
  e7:	50                   	push   %eax
  e8:	68 38 0c 00 00       	push   $0xc38
  ed:	6a 01                	push   $0x1
  ef:	e8 ac 07 00 00       	call   8a0 <printf>
       int i;
  // use this part to test exit(int status) and wait(int* status)
 
  printf(1, "\n  Step 1: testing exit(int status) and wait(int* status):\n");

  for (i = 0; i < 2; i++) {
  f4:	83 c4 20             	add    $0x20,%esp
  f7:	83 fb 02             	cmp    $0x2,%ebx
  fa:	75 d0                	jne    cc <exitWait+0x1c>
	  printf(2, "\nError using fork\n");
      exit(-1);
    }
  }
  return 0;
}
  fc:	8d 65 f8             	lea    -0x8(%ebp),%esp
  ff:	31 c0                	xor    %eax,%eax
 101:	5b                   	pop    %ebx
 102:	5e                   	pop    %esi
 103:	5d                   	pop    %ebp
 104:	c3                   	ret    
 105:	8d 76 00             	lea    0x0(%esi),%esi
  printf(1, "\n  Step 1: testing exit(int status) and wait(int* status):\n");

  for (i = 0; i < 2; i++) {
    pid = fork();
    if (pid == 0) { // only the child executed this code
      if (i == 0)
 108:	85 db                	test   %ebx,%ebx
 10a:	75 24                	jne    130 <exitWait+0x80>
      {
      printf(1, "\nThis is child with PID# %d and I will exit with status %d\n", getpid(), 0);
 10c:	e8 b9 06 00 00       	call   7ca <getpid>
 111:	6a 00                	push   $0x0
 113:	50                   	push   %eax
 114:	68 fc 0b 00 00       	push   $0xbfc
 119:	6a 01                	push   $0x1
 11b:	e8 80 07 00 00       	call   8a0 <printf>
      exit(0);
 120:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 127:	e8 16 06 00 00       	call   742 <exit>
 12c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }
      else
      {
	 printf(1, "\nThis is child with PID# %d and I will exit with status %d\n" ,getpid(), -1);
 130:	e8 95 06 00 00       	call   7ca <getpid>
 135:	6a ff                	push   $0xffffffff
 137:	50                   	push   %eax
 138:	68 fc 0b 00 00       	push   $0xbfc
 13d:	6a 01                	push   $0x1
 13f:	e8 5c 07 00 00       	call   8a0 <printf>
      exit(-1);
 144:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 14b:	e8 f2 05 00 00       	call   742 <exit>
    } else if (pid > 0) { // only the parent exeecutes this code
      ret_pid = wait(&exit_status);
      printf(1, "\n This is the parent: child with PID# %d has exited with status %d\n", ret_pid, exit_status);
    } else  // something went wrong with fork system call
    {  
	  printf(2, "\nError using fork\n");
 150:	83 ec 08             	sub    $0x8,%esp
 153:	68 0c 10 00 00       	push   $0x100c
 158:	6a 02                	push   $0x2
 15a:	e8 41 07 00 00       	call   8a0 <printf>
      exit(-1);
 15f:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 166:	e8 d7 05 00 00       	call   742 <exit>
 16b:	90                   	nop
 16c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000170 <waitPid>:
    }
  }
  return 0;
}

int waitPid(void){
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	56                   	push   %esi
 174:	53                   	push   %ebx
  int pid_a[5]={0, 0, 0, 0, 0};
 // use this part to test wait(int pid, int* status, int options)

 printf(1, "\n  Step 2: testing waitpid(int pid, int* status, int options):\n");

  for (i = 0; i <5; i++) {
 175:	31 db                	xor    %ebx,%ebx
    }
  }
  return 0;
}

int waitPid(void){
 177:	83 ec 28             	sub    $0x28,%esp
	
  int ret_pid, exit_status;
  int i;
  int pid_a[5]={0, 0, 0, 0, 0};
 17a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 181:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 // use this part to test wait(int pid, int* status, int options)

 printf(1, "\n  Step 2: testing waitpid(int pid, int* status, int options):\n");
 188:	68 7c 0c 00 00       	push   $0xc7c
 18d:	6a 01                	push   $0x1

int waitPid(void){
	
  int ret_pid, exit_status;
  int i;
  int pid_a[5]={0, 0, 0, 0, 0};
 18f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 196:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 19d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 // use this part to test wait(int pid, int* status, int options)

 printf(1, "\n  Step 2: testing waitpid(int pid, int* status, int options):\n");
 1a4:	e8 f7 06 00 00       	call   8a0 <printf>
 1a9:	83 c4 10             	add    $0x10,%esp

  for (i = 0; i <5; i++) {
    pid_a[i] = fork();
 1ac:	e8 89 05 00 00       	call   73a <fork>
	
    if (pid_a[i] == 0) { // only the child executed this code
 1b1:	85 c0                	test   %eax,%eax
 // use this part to test wait(int pid, int* status, int options)

 printf(1, "\n  Step 2: testing waitpid(int pid, int* status, int options):\n");

  for (i = 0; i <5; i++) {
    pid_a[i] = fork();
 1b3:	89 44 9d e4          	mov    %eax,-0x1c(%ebp,%ebx,4)
	
    if (pid_a[i] == 0) { // only the child executed this code
 1b7:	0f 84 31 01 00 00    	je     2ee <waitPid+0x17e>
  int pid_a[5]={0, 0, 0, 0, 0};
 // use this part to test wait(int pid, int* status, int options)

 printf(1, "\n  Step 2: testing waitpid(int pid, int* status, int options):\n");

  for (i = 0; i <5; i++) {
 1bd:	83 c3 01             	add    $0x1,%ebx
 1c0:	83 fb 05             	cmp    $0x5,%ebx
 1c3:	75 e7                	jne    1ac <waitPid+0x3c>
     
      
      printf(1, "\n The is child with PID# %d and I will exit with status %d\n", getpid(), 0);
      exit(0);}}
       
      sleep(5);
 1c5:	83 ec 0c             	sub    $0xc,%esp
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[3]);
      ret_pid = waitpid(pid_a[3], &exit_status, 0);
 1c8:	8d 5d e0             	lea    -0x20(%ebp),%ebx
     
      
      printf(1, "\n The is child with PID# %d and I will exit with status %d\n", getpid(), 0);
      exit(0);}}
       
      sleep(5);
 1cb:	6a 05                	push   $0x5
 1cd:	e8 08 06 00 00       	call   7da <sleep>
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[3]);
 1d2:	8b 75 f0             	mov    -0x10(%ebp),%esi
 1d5:	83 c4 0c             	add    $0xc,%esp
 1d8:	56                   	push   %esi
 1d9:	68 f8 0c 00 00       	push   $0xcf8
 1de:	6a 01                	push   $0x1
 1e0:	e8 bb 06 00 00       	call   8a0 <printf>
      ret_pid = waitpid(pid_a[3], &exit_status, 0);
 1e5:	83 c4 0c             	add    $0xc,%esp
 1e8:	6a 00                	push   $0x0
 1ea:	53                   	push   %ebx
 1eb:	56                   	push   %esi
 1ec:	e8 61 05 00 00       	call   752 <waitpid>
      printf(1, "\n This is the partent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 1f1:	ff 75 e0             	pushl  -0x20(%ebp)
 1f4:	50                   	push   %eax
 1f5:	68 34 0d 00 00       	push   $0xd34
 1fa:	6a 01                	push   $0x1
 1fc:	e8 9f 06 00 00       	call   8a0 <printf>
      sleep(5);
 201:	83 c4 14             	add    $0x14,%esp
 204:	6a 05                	push   $0x5
 206:	e8 cf 05 00 00       	call   7da <sleep>
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[1]);
 20b:	8b 75 e8             	mov    -0x18(%ebp),%esi
 20e:	83 c4 0c             	add    $0xc,%esp
 211:	56                   	push   %esi
 212:	68 f8 0c 00 00       	push   $0xcf8
 217:	6a 01                	push   $0x1
 219:	e8 82 06 00 00       	call   8a0 <printf>
      ret_pid = waitpid(pid_a[1], &exit_status, 0);
 21e:	83 c4 0c             	add    $0xc,%esp
 221:	6a 00                	push   $0x0
 223:	53                   	push   %ebx
 224:	56                   	push   %esi
 225:	e8 28 05 00 00       	call   752 <waitpid>
      printf(1, "\n This is the partent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 22a:	ff 75 e0             	pushl  -0x20(%ebp)
 22d:	50                   	push   %eax
 22e:	68 34 0d 00 00       	push   $0xd34
 233:	6a 01                	push   $0x1
 235:	e8 66 06 00 00       	call   8a0 <printf>
      sleep(5);
 23a:	83 c4 14             	add    $0x14,%esp
 23d:	6a 05                	push   $0x5
 23f:	e8 96 05 00 00       	call   7da <sleep>
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[2]);
 244:	8b 75 ec             	mov    -0x14(%ebp),%esi
 247:	83 c4 0c             	add    $0xc,%esp
 24a:	56                   	push   %esi
 24b:	68 f8 0c 00 00       	push   $0xcf8
 250:	6a 01                	push   $0x1
 252:	e8 49 06 00 00       	call   8a0 <printf>
      ret_pid = waitpid(pid_a[2], &exit_status, 0);
 257:	83 c4 0c             	add    $0xc,%esp
 25a:	6a 00                	push   $0x0
 25c:	53                   	push   %ebx
 25d:	56                   	push   %esi
 25e:	e8 ef 04 00 00       	call   752 <waitpid>
      printf(1, "\n This is the partent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 263:	ff 75 e0             	pushl  -0x20(%ebp)
 266:	50                   	push   %eax
 267:	68 34 0d 00 00       	push   $0xd34
 26c:	6a 01                	push   $0x1
 26e:	e8 2d 06 00 00       	call   8a0 <printf>
      sleep(5);
 273:	83 c4 14             	add    $0x14,%esp
 276:	6a 05                	push   $0x5
 278:	e8 5d 05 00 00       	call   7da <sleep>
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[0]);
 27d:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 280:	83 c4 0c             	add    $0xc,%esp
 283:	56                   	push   %esi
 284:	68 f8 0c 00 00       	push   $0xcf8
 289:	6a 01                	push   $0x1
 28b:	e8 10 06 00 00       	call   8a0 <printf>
      ret_pid = waitpid(pid_a[0], &exit_status, 0);
 290:	83 c4 0c             	add    $0xc,%esp
 293:	6a 00                	push   $0x0
 295:	53                   	push   %ebx
 296:	56                   	push   %esi
 297:	e8 b6 04 00 00       	call   752 <waitpid>
      printf(1, "\n This is the partent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 29c:	ff 75 e0             	pushl  -0x20(%ebp)
 29f:	50                   	push   %eax
 2a0:	68 34 0d 00 00       	push   $0xd34
 2a5:	6a 01                	push   $0x1
 2a7:	e8 f4 05 00 00       	call   8a0 <printf>
      sleep(5);
 2ac:	83 c4 14             	add    $0x14,%esp
 2af:	6a 05                	push   $0x5
 2b1:	e8 24 05 00 00       	call   7da <sleep>
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[4]);
 2b6:	8b 75 f4             	mov    -0xc(%ebp),%esi
 2b9:	83 c4 0c             	add    $0xc,%esp
 2bc:	56                   	push   %esi
 2bd:	68 f8 0c 00 00       	push   $0xcf8
 2c2:	6a 01                	push   $0x1
 2c4:	e8 d7 05 00 00       	call   8a0 <printf>
      ret_pid = waitpid(pid_a[4], &exit_status, 0);
 2c9:	83 c4 0c             	add    $0xc,%esp
 2cc:	6a 00                	push   $0x0
 2ce:	53                   	push   %ebx
 2cf:	56                   	push   %esi
 2d0:	e8 7d 04 00 00       	call   752 <waitpid>
      printf(1, "\n This is the partent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 2d5:	ff 75 e0             	pushl  -0x20(%ebp)
 2d8:	50                   	push   %eax
 2d9:	68 34 0d 00 00       	push   $0xd34
 2de:	6a 01                	push   $0x1
 2e0:	e8 bb 05 00 00       	call   8a0 <printf>
      
      return 0;
  }
 2e5:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2e8:	31 c0                	xor    %eax,%eax
 2ea:	5b                   	pop    %ebx
 2eb:	5e                   	pop    %esi
 2ec:	5d                   	pop    %ebp
 2ed:	c3                   	ret    
    pid_a[i] = fork();
	
    if (pid_a[i] == 0) { // only the child executed this code
     
      
      printf(1, "\n The is child with PID# %d and I will exit with status %d\n", getpid(), 0);
 2ee:	e8 d7 04 00 00       	call   7ca <getpid>
 2f3:	6a 00                	push   $0x0
 2f5:	50                   	push   %eax
 2f6:	68 bc 0c 00 00       	push   $0xcbc
 2fb:	6a 01                	push   $0x1
 2fd:	e8 9e 05 00 00       	call   8a0 <printf>
      exit(0);}}
 302:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 309:	e8 34 04 00 00       	call   742 <exit>
 30e:	66 90                	xchg   %ax,%ax

00000310 <PScheduler>:
      
      return 0;
  }
      
      
     int PScheduler(void){
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	56                   	push   %esi
 314:	53                   	push   %ebx
 315:	83 ec 18             	sub    $0x18,%esp
    // 0 is the highest priority. All processes have a default priority of 20 

  int pid, ret_pid, exit_status;
  int i,j,k;
  
    printf(1, "\n  Step 2: testing the priority scheduler and setpriority(int priority)) systema call:\n");
 318:	68 70 0d 00 00       	push   $0xd70
 31d:	6a 01                	push   $0x1
 31f:	e8 7c 05 00 00       	call   8a0 <printf>
    printf(1, "\n  Step 2: Assuming that the priorities range between range between 0 to 63\n");
 324:	58                   	pop    %eax
 325:	5a                   	pop    %edx
 326:	68 c8 0d 00 00       	push   $0xdc8
 32b:	6a 01                	push   $0x1
 32d:	e8 6e 05 00 00       	call   8a0 <printf>
    printf(1, "\n  Step 2: 0 is the highest priority. All processes have a default priority of 20\n");
 332:	59                   	pop    %ecx
 333:	5b                   	pop    %ebx
 334:	68 18 0e 00 00       	push   $0xe18
 339:	6a 01                	push   $0x1
    printf(1, "\n  Step 2: The parent processes will switch to priority 0\n");
    setpriority(0);
    for (i = 0; i <  3; i++) {
 33b:	31 db                	xor    %ebx,%ebx
  int pid, ret_pid, exit_status;
  int i,j,k;
  
    printf(1, "\n  Step 2: testing the priority scheduler and setpriority(int priority)) systema call:\n");
    printf(1, "\n  Step 2: Assuming that the priorities range between range between 0 to 63\n");
    printf(1, "\n  Step 2: 0 is the highest priority. All processes have a default priority of 20\n");
 33d:	e8 5e 05 00 00       	call   8a0 <printf>
    printf(1, "\n  Step 2: The parent processes will switch to priority 0\n");
 342:	5e                   	pop    %esi
 343:	58                   	pop    %eax
 344:	68 6c 0e 00 00       	push   $0xe6c
 349:	6a 01                	push   $0x1
 34b:	e8 50 05 00 00       	call   8a0 <printf>
    setpriority(0);
 350:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 357:	e8 8e 04 00 00       	call   7ea <setpriority>
 35c:	83 c4 10             	add    $0x10,%esp
    for (i = 0; i <  3; i++) {
	pid = fork();
 35f:	e8 d6 03 00 00       	call   73a <fork>
	if (pid > 0 ) {
 364:	83 f8 00             	cmp    $0x0,%eax
 367:	7e 44                	jle    3ad <PScheduler+0x9d>
    printf(1, "\n  Step 2: testing the priority scheduler and setpriority(int priority)) systema call:\n");
    printf(1, "\n  Step 2: Assuming that the priorities range between range between 0 to 63\n");
    printf(1, "\n  Step 2: 0 is the highest priority. All processes have a default priority of 20\n");
    printf(1, "\n  Step 2: The parent processes will switch to priority 0\n");
    setpriority(0);
    for (i = 0; i <  3; i++) {
 369:	83 c3 01             	add    $0x1,%ebx
 36c:	83 fb 03             	cmp    $0x3,%ebx
 36f:	75 ee                	jne    35f <PScheduler+0x4f>
 371:	8d 75 f4             	lea    -0xc(%ebp),%esi
        }
	}

	if(pid > 0) {
		for (i = 0; i <  3; i++) {
			ret_pid = wait(&exit_status);
 374:	83 ec 0c             	sub    $0xc,%esp
 377:	56                   	push   %esi
 378:	e8 cd 03 00 00       	call   74a <wait>
			//printf("%d This is ret_pid:",ret_pid);	 
			printf(1,"\n This is the parent: child with PID# %d has finished with status %d \n",ret_pid,exit_status);
 37d:	ff 75 f4             	pushl  -0xc(%ebp)
 380:	50                   	push   %eax
 381:	68 d8 0e 00 00       	push   $0xed8
 386:	6a 01                	push   $0x1
 388:	e8 13 05 00 00       	call   8a0 <printf>
			exit(-1);
        }
	}

	if(pid > 0) {
		for (i = 0; i <  3; i++) {
 38d:	83 c4 20             	add    $0x20,%esp
 390:	83 eb 01             	sub    $0x1,%ebx
 393:	75 df                	jne    374 <PScheduler+0x64>
			ret_pid = wait(&exit_status);
			//printf("%d This is ret_pid:",ret_pid);	 
			printf(1,"\n This is the parent: child with PID# %d has finished with status %d \n",ret_pid,exit_status);
			}
                     printf(1,"\n if processes with highest priority finished first then its correct \n");
 395:	83 ec 08             	sub    $0x8,%esp
 398:	68 20 0f 00 00       	push   $0xf20
 39d:	6a 01                	push   $0x1
 39f:	e8 fc 04 00 00       	call   8a0 <printf>
}
			
	return 0;}
 3a4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3a7:	31 c0                	xor    %eax,%eax
 3a9:	5b                   	pop    %ebx
 3aa:	5e                   	pop    %esi
 3ab:	5d                   	pop    %ebp
 3ac:	c3                   	ret    
    setpriority(0);
    for (i = 0; i <  3; i++) {
	pid = fork();
	if (pid > 0 ) {
		continue;}
	else if ( pid == 0) {
 3ad:	75 53                	jne    402 <PScheduler+0xf2>
//		printf(1, "\n Hello! this is child# %d and I will change my priority to %d \n",getpid(),60-20*i);
		setpriority(60-20*i);	
 3af:	6b db ec             	imul   $0xffffffec,%ebx,%ebx
 3b2:	83 ec 0c             	sub    $0xc,%esp
 3b5:	83 c3 3c             	add    $0x3c,%ebx
 3b8:	53                   	push   %ebx
 3b9:	e8 2c 04 00 00       	call   7ea <setpriority>
 3be:	83 c4 10             	add    $0x10,%esp
 3c1:	ba 50 c3 00 00       	mov    $0xc350,%edx
 3c6:	8d 76 00             	lea    0x0(%esi),%esi
 3c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    printf(1, "\n  Step 2: testing the priority scheduler and setpriority(int priority)) systema call:\n");
    printf(1, "\n  Step 2: Assuming that the priorities range between range between 0 to 63\n");
    printf(1, "\n  Step 2: 0 is the highest priority. All processes have a default priority of 20\n");
    printf(1, "\n  Step 2: The parent processes will switch to priority 0\n");
    setpriority(0);
    for (i = 0; i <  3; i++) {
 3d0:	b8 10 27 00 00       	mov    $0x2710,%eax
 3d5:	8d 76 00             	lea    0x0(%esi),%esi
	else if ( pid == 0) {
//		printf(1, "\n Hello! this is child# %d and I will change my priority to %d \n",getpid(),60-20*i);
		setpriority(60-20*i);	
		for (j=0;j<50000;j++) {
			for(k=0;k<10000;k++) {
				asm("nop"); }}
 3d8:	90                   	nop
		continue;}
	else if ( pid == 0) {
//		printf(1, "\n Hello! this is child# %d and I will change my priority to %d \n",getpid(),60-20*i);
		setpriority(60-20*i);	
		for (j=0;j<50000;j++) {
			for(k=0;k<10000;k++) {
 3d9:	83 e8 01             	sub    $0x1,%eax
 3dc:	75 fa                	jne    3d8 <PScheduler+0xc8>
	if (pid > 0 ) {
		continue;}
	else if ( pid == 0) {
//		printf(1, "\n Hello! this is child# %d and I will change my priority to %d \n",getpid(),60-20*i);
		setpriority(60-20*i);	
		for (j=0;j<50000;j++) {
 3de:	83 ea 01             	sub    $0x1,%edx
 3e1:	75 ed                	jne    3d0 <PScheduler+0xc0>
			for(k=0;k<10000;k++) {
				asm("nop"); }}
		printf(1, "\n child# %d with priority %d has finished! \n",getpid(),60-20*i);		
 3e3:	e8 e2 03 00 00       	call   7ca <getpid>
 3e8:	53                   	push   %ebx
 3e9:	50                   	push   %eax
 3ea:	68 a8 0e 00 00       	push   $0xea8
 3ef:	6a 01                	push   $0x1
 3f1:	e8 aa 04 00 00       	call   8a0 <printf>
		exit(0);
 3f6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 3fd:	e8 40 03 00 00       	call   742 <exit>
        }
        else {
			printf(2," \n Error \n");
 402:	83 ec 08             	sub    $0x8,%esp
 405:	68 1f 10 00 00       	push   $0x101f
 40a:	6a 02                	push   $0x2
 40c:	e8 8f 04 00 00       	call   8a0 <printf>
			exit(-1);
 411:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 418:	e8 25 03 00 00       	call   742 <exit>
 41d:	8d 76 00             	lea    0x0(%esi),%esi

00000420 <testaging>:
                     printf(1,"\n if processes with highest priority finished first then its correct \n");
}
			
	return 0;}

int testaging(void){
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	56                   	push   %esi
 424:	53                   	push   %ebx
   int i, j, k;
   int pid, ret_pid, exit_status;
    for(i = 0; i < 15; i++){
 425:	31 db                	xor    %ebx,%ebx
                     printf(1,"\n if processes with highest priority finished first then its correct \n");
}
			
	return 0;}

int testaging(void){
 427:	83 ec 10             	sub    $0x10,%esp
   int i, j, k;
   int pid, ret_pid, exit_status;
    for(i = 0; i < 15; i++){
    	pid = fork();
 42a:	e8 0b 03 00 00       	call   73a <fork>
	if(pid > 0)
 42f:	83 f8 00             	cmp    $0x0,%eax
 432:	7e 3c                	jle    470 <testaging+0x50>
	return 0;}

int testaging(void){
   int i, j, k;
   int pid, ret_pid, exit_status;
    for(i = 0; i < 15; i++){
 434:	83 c3 01             	add    $0x1,%ebx
 437:	83 fb 0f             	cmp    $0xf,%ebx
 43a:	75 ee                	jne    42a <testaging+0xa>
 43c:	8d 75 f4             	lea    -0xc(%ebp),%esi
        }
	}

	if(pid > 0) {
		for (i = 0; i <  15; i++) {
			ret_pid = wait(&exit_status);
 43f:	83 ec 0c             	sub    $0xc,%esp
 442:	56                   	push   %esi
 443:	e8 02 03 00 00       	call   74a <wait>
		printf(1,"\n This is the parent: child with PID# %d has finished with status %d \n",ret_pid,exit_status);
 448:	ff 75 f4             	pushl  -0xc(%ebp)
 44b:	50                   	push   %eax
 44c:	68 d8 0e 00 00       	push   $0xed8
 451:	6a 01                	push   $0x1
 453:	e8 48 04 00 00       	call   8a0 <printf>
			exit(-1);
        }
	}

	if(pid > 0) {
		for (i = 0; i <  15; i++) {
 458:	83 c4 20             	add    $0x20,%esp
 45b:	83 eb 01             	sub    $0x1,%ebx
 45e:	75 df                	jne    43f <testaging+0x1f>
			ret_pid = wait(&exit_status);
		printf(1,"\n This is the parent: child with PID# %d has finished with status %d \n",ret_pid,exit_status);
		}
	}
			
	return 0;} 
 460:	8d 65 f8             	lea    -0x8(%ebp),%esp
 463:	31 c0                	xor    %eax,%eax
 465:	5b                   	pop    %ebx
 466:	5e                   	pop    %esi
 467:	5d                   	pop    %ebp
 468:	c3                   	ret    
 469:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    for(i = 0; i < 15; i++){
    	pid = fork();
	if(pid > 0)
	   continue;

        else if(pid == 0){
 470:	75 6e                	jne    4e0 <testaging+0xc0>
	   if(i == 4)
 472:	83 fb 04             	cmp    $0x4,%ebx
 475:	74 51                	je     4c8 <testaging+0xa8>
		setpriority(30);

	   else 
		setpriority(25);
 477:	83 ec 0c             	sub    $0xc,%esp
 47a:	6a 19                	push   $0x19
 47c:	e8 69 03 00 00       	call   7ea <setpriority>
 481:	83 c4 10             	add    $0x10,%esp
	return 0;}

int testaging(void){
   int i, j, k;
   int pid, ret_pid, exit_status;
    for(i = 0; i < 15; i++){
 484:	ba 50 c3 00 00       	mov    $0xc350,%edx
 489:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 490:	b8 10 27 00 00       	mov    $0x2710,%eax
 495:	8d 76 00             	lea    0x0(%esi),%esi
	   else 
		setpriority(25);

	   for (j=0;j<50000;j++) {
                        for(k=0;k<10000;k++) {
                                asm("nop"); }}
 498:	90                   	nop

	   else 
		setpriority(25);

	   for (j=0;j<50000;j++) {
                        for(k=0;k<10000;k++) {
 499:	83 e8 01             	sub    $0x1,%eax
 49c:	75 fa                	jne    498 <testaging+0x78>
		setpriority(30);

	   else 
		setpriority(25);

	   for (j=0;j<50000;j++) {
 49e:	83 ea 01             	sub    $0x1,%edx
 4a1:	75 ed                	jne    490 <testaging+0x70>
                        for(k=0;k<10000;k++) {
                                asm("nop"); }}
	if(i == 4){
 4a3:	83 fb 04             	cmp    $0x4,%ebx
 4a6:	74 2f                	je     4d7 <testaging+0xb7>

	 printf(1, "\n child# %d with priority %d has finished! \n",getpid(),30);
 	exit(0);
        }
	else
  	   printf(1, "\n child# %d with priority %d has finished! \n",getpid(),25);		
 4a8:	e8 1d 03 00 00       	call   7ca <getpid>
 4ad:	6a 19                	push   $0x19
 4af:	50                   	push   %eax
 4b0:	68 a8 0e 00 00       	push   $0xea8
 4b5:	6a 01                	push   $0x1
 4b7:	e8 e4 03 00 00       	call   8a0 <printf>
		exit(0);
 4bc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 4c3:	e8 7a 02 00 00       	call   742 <exit>
	if(pid > 0)
	   continue;

        else if(pid == 0){
	   if(i == 4)
		setpriority(30);
 4c8:	83 ec 0c             	sub    $0xc,%esp
 4cb:	6a 1e                	push   $0x1e
 4cd:	e8 18 03 00 00       	call   7ea <setpriority>
 4d2:	83 c4 10             	add    $0x10,%esp
 4d5:	eb ad                	jmp    484 <testaging+0x64>
	   for (j=0;j<50000;j++) {
                        for(k=0;k<10000;k++) {
                                asm("nop"); }}
	if(i == 4){

	 printf(1, "\n child# %d with priority %d has finished! \n",getpid(),30);
 4d7:	e8 ee 02 00 00       	call   7ca <getpid>
 4dc:	6a 1e                	push   $0x1e
 4de:	eb cf                	jmp    4af <testaging+0x8f>
	else
  	   printf(1, "\n child# %d with priority %d has finished! \n",getpid(),25);		
		exit(0);
         }
        else {
			printf(2," \n Error \n");
 4e0:	83 ec 08             	sub    $0x8,%esp
 4e3:	68 1f 10 00 00       	push   $0x101f
 4e8:	6a 02                	push   $0x2
 4ea:	e8 b1 03 00 00       	call   8a0 <printf>
			exit(-1);
 4ef:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 4f6:	e8 47 02 00 00       	call   742 <exit>
 4fb:	66 90                	xchg   %ax,%ax
 4fd:	66 90                	xchg   %ax,%ax
 4ff:	90                   	nop

00000500 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	53                   	push   %ebx
 504:	8b 45 08             	mov    0x8(%ebp),%eax
 507:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 50a:	89 c2                	mov    %eax,%edx
 50c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 510:	83 c1 01             	add    $0x1,%ecx
 513:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 517:	83 c2 01             	add    $0x1,%edx
 51a:	84 db                	test   %bl,%bl
 51c:	88 5a ff             	mov    %bl,-0x1(%edx)
 51f:	75 ef                	jne    510 <strcpy+0x10>
    ;
  return os;
}
 521:	5b                   	pop    %ebx
 522:	5d                   	pop    %ebp
 523:	c3                   	ret    
 524:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 52a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000530 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	56                   	push   %esi
 534:	53                   	push   %ebx
 535:	8b 55 08             	mov    0x8(%ebp),%edx
 538:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 53b:	0f b6 02             	movzbl (%edx),%eax
 53e:	0f b6 19             	movzbl (%ecx),%ebx
 541:	84 c0                	test   %al,%al
 543:	75 1e                	jne    563 <strcmp+0x33>
 545:	eb 29                	jmp    570 <strcmp+0x40>
 547:	89 f6                	mov    %esi,%esi
 549:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 550:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 553:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 556:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 559:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 55d:	84 c0                	test   %al,%al
 55f:	74 0f                	je     570 <strcmp+0x40>
 561:	89 f1                	mov    %esi,%ecx
 563:	38 d8                	cmp    %bl,%al
 565:	74 e9                	je     550 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 567:	29 d8                	sub    %ebx,%eax
}
 569:	5b                   	pop    %ebx
 56a:	5e                   	pop    %esi
 56b:	5d                   	pop    %ebp
 56c:	c3                   	ret    
 56d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 570:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 572:	29 d8                	sub    %ebx,%eax
}
 574:	5b                   	pop    %ebx
 575:	5e                   	pop    %esi
 576:	5d                   	pop    %ebp
 577:	c3                   	ret    
 578:	90                   	nop
 579:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000580 <strlen>:

uint
strlen(const char *s)
{
 580:	55                   	push   %ebp
 581:	89 e5                	mov    %esp,%ebp
 583:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 586:	80 39 00             	cmpb   $0x0,(%ecx)
 589:	74 12                	je     59d <strlen+0x1d>
 58b:	31 d2                	xor    %edx,%edx
 58d:	8d 76 00             	lea    0x0(%esi),%esi
 590:	83 c2 01             	add    $0x1,%edx
 593:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 597:	89 d0                	mov    %edx,%eax
 599:	75 f5                	jne    590 <strlen+0x10>
    ;
  return n;
}
 59b:	5d                   	pop    %ebp
 59c:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 59d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 59f:	5d                   	pop    %ebp
 5a0:	c3                   	ret    
 5a1:	eb 0d                	jmp    5b0 <memset>
 5a3:	90                   	nop
 5a4:	90                   	nop
 5a5:	90                   	nop
 5a6:	90                   	nop
 5a7:	90                   	nop
 5a8:	90                   	nop
 5a9:	90                   	nop
 5aa:	90                   	nop
 5ab:	90                   	nop
 5ac:	90                   	nop
 5ad:	90                   	nop
 5ae:	90                   	nop
 5af:	90                   	nop

000005b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 5b0:	55                   	push   %ebp
 5b1:	89 e5                	mov    %esp,%ebp
 5b3:	57                   	push   %edi
 5b4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 5b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 5ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 5bd:	89 d7                	mov    %edx,%edi
 5bf:	fc                   	cld    
 5c0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 5c2:	89 d0                	mov    %edx,%eax
 5c4:	5f                   	pop    %edi
 5c5:	5d                   	pop    %ebp
 5c6:	c3                   	ret    
 5c7:	89 f6                	mov    %esi,%esi
 5c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000005d0 <strchr>:

char*
strchr(const char *s, char c)
{
 5d0:	55                   	push   %ebp
 5d1:	89 e5                	mov    %esp,%ebp
 5d3:	53                   	push   %ebx
 5d4:	8b 45 08             	mov    0x8(%ebp),%eax
 5d7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 5da:	0f b6 10             	movzbl (%eax),%edx
 5dd:	84 d2                	test   %dl,%dl
 5df:	74 1d                	je     5fe <strchr+0x2e>
    if(*s == c)
 5e1:	38 d3                	cmp    %dl,%bl
 5e3:	89 d9                	mov    %ebx,%ecx
 5e5:	75 0d                	jne    5f4 <strchr+0x24>
 5e7:	eb 17                	jmp    600 <strchr+0x30>
 5e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5f0:	38 ca                	cmp    %cl,%dl
 5f2:	74 0c                	je     600 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 5f4:	83 c0 01             	add    $0x1,%eax
 5f7:	0f b6 10             	movzbl (%eax),%edx
 5fa:	84 d2                	test   %dl,%dl
 5fc:	75 f2                	jne    5f0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 5fe:	31 c0                	xor    %eax,%eax
}
 600:	5b                   	pop    %ebx
 601:	5d                   	pop    %ebp
 602:	c3                   	ret    
 603:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000610 <gets>:

char*
gets(char *buf, int max)
{
 610:	55                   	push   %ebp
 611:	89 e5                	mov    %esp,%ebp
 613:	57                   	push   %edi
 614:	56                   	push   %esi
 615:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 616:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 618:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 61b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 61e:	eb 29                	jmp    649 <gets+0x39>
    cc = read(0, &c, 1);
 620:	83 ec 04             	sub    $0x4,%esp
 623:	6a 01                	push   $0x1
 625:	57                   	push   %edi
 626:	6a 00                	push   $0x0
 628:	e8 35 01 00 00       	call   762 <read>
    if(cc < 1)
 62d:	83 c4 10             	add    $0x10,%esp
 630:	85 c0                	test   %eax,%eax
 632:	7e 1d                	jle    651 <gets+0x41>
      break;
    buf[i++] = c;
 634:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 638:	8b 55 08             	mov    0x8(%ebp),%edx
 63b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 63d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 63f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 643:	74 1b                	je     660 <gets+0x50>
 645:	3c 0d                	cmp    $0xd,%al
 647:	74 17                	je     660 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 649:	8d 5e 01             	lea    0x1(%esi),%ebx
 64c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 64f:	7c cf                	jl     620 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 651:	8b 45 08             	mov    0x8(%ebp),%eax
 654:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 658:	8d 65 f4             	lea    -0xc(%ebp),%esp
 65b:	5b                   	pop    %ebx
 65c:	5e                   	pop    %esi
 65d:	5f                   	pop    %edi
 65e:	5d                   	pop    %ebp
 65f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 660:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 663:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 665:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 669:	8d 65 f4             	lea    -0xc(%ebp),%esp
 66c:	5b                   	pop    %ebx
 66d:	5e                   	pop    %esi
 66e:	5f                   	pop    %edi
 66f:	5d                   	pop    %ebp
 670:	c3                   	ret    
 671:	eb 0d                	jmp    680 <stat>
 673:	90                   	nop
 674:	90                   	nop
 675:	90                   	nop
 676:	90                   	nop
 677:	90                   	nop
 678:	90                   	nop
 679:	90                   	nop
 67a:	90                   	nop
 67b:	90                   	nop
 67c:	90                   	nop
 67d:	90                   	nop
 67e:	90                   	nop
 67f:	90                   	nop

00000680 <stat>:

int
stat(const char *n, struct stat *st)
{
 680:	55                   	push   %ebp
 681:	89 e5                	mov    %esp,%ebp
 683:	56                   	push   %esi
 684:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 685:	83 ec 08             	sub    $0x8,%esp
 688:	6a 00                	push   $0x0
 68a:	ff 75 08             	pushl  0x8(%ebp)
 68d:	e8 f8 00 00 00       	call   78a <open>
  if(fd < 0)
 692:	83 c4 10             	add    $0x10,%esp
 695:	85 c0                	test   %eax,%eax
 697:	78 27                	js     6c0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 699:	83 ec 08             	sub    $0x8,%esp
 69c:	ff 75 0c             	pushl  0xc(%ebp)
 69f:	89 c3                	mov    %eax,%ebx
 6a1:	50                   	push   %eax
 6a2:	e8 fb 00 00 00       	call   7a2 <fstat>
 6a7:	89 c6                	mov    %eax,%esi
  close(fd);
 6a9:	89 1c 24             	mov    %ebx,(%esp)
 6ac:	e8 c1 00 00 00       	call   772 <close>
  return r;
 6b1:	83 c4 10             	add    $0x10,%esp
 6b4:	89 f0                	mov    %esi,%eax
}
 6b6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 6b9:	5b                   	pop    %ebx
 6ba:	5e                   	pop    %esi
 6bb:	5d                   	pop    %ebp
 6bc:	c3                   	ret    
 6bd:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 6c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 6c5:	eb ef                	jmp    6b6 <stat+0x36>
 6c7:	89 f6                	mov    %esi,%esi
 6c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000006d0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 6d0:	55                   	push   %ebp
 6d1:	89 e5                	mov    %esp,%ebp
 6d3:	53                   	push   %ebx
 6d4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 6d7:	0f be 11             	movsbl (%ecx),%edx
 6da:	8d 42 d0             	lea    -0x30(%edx),%eax
 6dd:	3c 09                	cmp    $0x9,%al
 6df:	b8 00 00 00 00       	mov    $0x0,%eax
 6e4:	77 1f                	ja     705 <atoi+0x35>
 6e6:	8d 76 00             	lea    0x0(%esi),%esi
 6e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 6f0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 6f3:	83 c1 01             	add    $0x1,%ecx
 6f6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 6fa:	0f be 11             	movsbl (%ecx),%edx
 6fd:	8d 5a d0             	lea    -0x30(%edx),%ebx
 700:	80 fb 09             	cmp    $0x9,%bl
 703:	76 eb                	jbe    6f0 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 705:	5b                   	pop    %ebx
 706:	5d                   	pop    %ebp
 707:	c3                   	ret    
 708:	90                   	nop
 709:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000710 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 710:	55                   	push   %ebp
 711:	89 e5                	mov    %esp,%ebp
 713:	56                   	push   %esi
 714:	53                   	push   %ebx
 715:	8b 5d 10             	mov    0x10(%ebp),%ebx
 718:	8b 45 08             	mov    0x8(%ebp),%eax
 71b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 71e:	85 db                	test   %ebx,%ebx
 720:	7e 14                	jle    736 <memmove+0x26>
 722:	31 d2                	xor    %edx,%edx
 724:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 728:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 72c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 72f:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 732:	39 da                	cmp    %ebx,%edx
 734:	75 f2                	jne    728 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 736:	5b                   	pop    %ebx
 737:	5e                   	pop    %esi
 738:	5d                   	pop    %ebp
 739:	c3                   	ret    

0000073a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 73a:	b8 01 00 00 00       	mov    $0x1,%eax
 73f:	cd 40                	int    $0x40
 741:	c3                   	ret    

00000742 <exit>:
SYSCALL(exit)
 742:	b8 02 00 00 00       	mov    $0x2,%eax
 747:	cd 40                	int    $0x40
 749:	c3                   	ret    

0000074a <wait>:
SYSCALL(wait)
 74a:	b8 03 00 00 00       	mov    $0x3,%eax
 74f:	cd 40                	int    $0x40
 751:	c3                   	ret    

00000752 <waitpid>:
SYSCALL(waitpid)
 752:	b8 16 00 00 00       	mov    $0x16,%eax
 757:	cd 40                	int    $0x40
 759:	c3                   	ret    

0000075a <pipe>:
SYSCALL(pipe)
 75a:	b8 04 00 00 00       	mov    $0x4,%eax
 75f:	cd 40                	int    $0x40
 761:	c3                   	ret    

00000762 <read>:
SYSCALL(read)
 762:	b8 05 00 00 00       	mov    $0x5,%eax
 767:	cd 40                	int    $0x40
 769:	c3                   	ret    

0000076a <write>:
SYSCALL(write)
 76a:	b8 10 00 00 00       	mov    $0x10,%eax
 76f:	cd 40                	int    $0x40
 771:	c3                   	ret    

00000772 <close>:
SYSCALL(close)
 772:	b8 15 00 00 00       	mov    $0x15,%eax
 777:	cd 40                	int    $0x40
 779:	c3                   	ret    

0000077a <kill>:
SYSCALL(kill)
 77a:	b8 06 00 00 00       	mov    $0x6,%eax
 77f:	cd 40                	int    $0x40
 781:	c3                   	ret    

00000782 <exec>:
SYSCALL(exec)
 782:	b8 07 00 00 00       	mov    $0x7,%eax
 787:	cd 40                	int    $0x40
 789:	c3                   	ret    

0000078a <open>:
SYSCALL(open)
 78a:	b8 0f 00 00 00       	mov    $0xf,%eax
 78f:	cd 40                	int    $0x40
 791:	c3                   	ret    

00000792 <mknod>:
SYSCALL(mknod)
 792:	b8 11 00 00 00       	mov    $0x11,%eax
 797:	cd 40                	int    $0x40
 799:	c3                   	ret    

0000079a <unlink>:
SYSCALL(unlink)
 79a:	b8 12 00 00 00       	mov    $0x12,%eax
 79f:	cd 40                	int    $0x40
 7a1:	c3                   	ret    

000007a2 <fstat>:
SYSCALL(fstat)
 7a2:	b8 08 00 00 00       	mov    $0x8,%eax
 7a7:	cd 40                	int    $0x40
 7a9:	c3                   	ret    

000007aa <link>:
SYSCALL(link)
 7aa:	b8 13 00 00 00       	mov    $0x13,%eax
 7af:	cd 40                	int    $0x40
 7b1:	c3                   	ret    

000007b2 <mkdir>:
SYSCALL(mkdir)
 7b2:	b8 14 00 00 00       	mov    $0x14,%eax
 7b7:	cd 40                	int    $0x40
 7b9:	c3                   	ret    

000007ba <chdir>:
SYSCALL(chdir)
 7ba:	b8 09 00 00 00       	mov    $0x9,%eax
 7bf:	cd 40                	int    $0x40
 7c1:	c3                   	ret    

000007c2 <dup>:
SYSCALL(dup)
 7c2:	b8 0a 00 00 00       	mov    $0xa,%eax
 7c7:	cd 40                	int    $0x40
 7c9:	c3                   	ret    

000007ca <getpid>:
SYSCALL(getpid)
 7ca:	b8 0b 00 00 00       	mov    $0xb,%eax
 7cf:	cd 40                	int    $0x40
 7d1:	c3                   	ret    

000007d2 <sbrk>:
SYSCALL(sbrk)
 7d2:	b8 0c 00 00 00       	mov    $0xc,%eax
 7d7:	cd 40                	int    $0x40
 7d9:	c3                   	ret    

000007da <sleep>:
SYSCALL(sleep)
 7da:	b8 0d 00 00 00       	mov    $0xd,%eax
 7df:	cd 40                	int    $0x40
 7e1:	c3                   	ret    

000007e2 <uptime>:
SYSCALL(uptime)
 7e2:	b8 0e 00 00 00       	mov    $0xe,%eax
 7e7:	cd 40                	int    $0x40
 7e9:	c3                   	ret    

000007ea <setpriority>:
SYSCALL(setpriority)
 7ea:	b8 17 00 00 00       	mov    $0x17,%eax
 7ef:	cd 40                	int    $0x40
 7f1:	c3                   	ret    
 7f2:	66 90                	xchg   %ax,%ax
 7f4:	66 90                	xchg   %ax,%ax
 7f6:	66 90                	xchg   %ax,%ax
 7f8:	66 90                	xchg   %ax,%ax
 7fa:	66 90                	xchg   %ax,%ax
 7fc:	66 90                	xchg   %ax,%ax
 7fe:	66 90                	xchg   %ax,%ax

00000800 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 800:	55                   	push   %ebp
 801:	89 e5                	mov    %esp,%ebp
 803:	57                   	push   %edi
 804:	56                   	push   %esi
 805:	53                   	push   %ebx
 806:	89 c6                	mov    %eax,%esi
 808:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 80b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 80e:	85 db                	test   %ebx,%ebx
 810:	74 7e                	je     890 <printint+0x90>
 812:	89 d0                	mov    %edx,%eax
 814:	c1 e8 1f             	shr    $0x1f,%eax
 817:	84 c0                	test   %al,%al
 819:	74 75                	je     890 <printint+0x90>
    neg = 1;
    x = -xx;
 81b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 81d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 824:	f7 d8                	neg    %eax
 826:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 829:	31 ff                	xor    %edi,%edi
 82b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 82e:	89 ce                	mov    %ecx,%esi
 830:	eb 08                	jmp    83a <printint+0x3a>
 832:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 838:	89 cf                	mov    %ecx,%edi
 83a:	31 d2                	xor    %edx,%edx
 83c:	8d 4f 01             	lea    0x1(%edi),%ecx
 83f:	f7 f6                	div    %esi
 841:	0f b6 92 34 10 00 00 	movzbl 0x1034(%edx),%edx
  }while((x /= base) != 0);
 848:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 84a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 84d:	75 e9                	jne    838 <printint+0x38>
  if(neg)
 84f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 852:	8b 75 c0             	mov    -0x40(%ebp),%esi
 855:	85 c0                	test   %eax,%eax
 857:	74 08                	je     861 <printint+0x61>
    buf[i++] = '-';
 859:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 85e:	8d 4f 02             	lea    0x2(%edi),%ecx
 861:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
 865:	8d 76 00             	lea    0x0(%esi),%esi
 868:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 86b:	83 ec 04             	sub    $0x4,%esp
 86e:	83 ef 01             	sub    $0x1,%edi
 871:	6a 01                	push   $0x1
 873:	53                   	push   %ebx
 874:	56                   	push   %esi
 875:	88 45 d7             	mov    %al,-0x29(%ebp)
 878:	e8 ed fe ff ff       	call   76a <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 87d:	83 c4 10             	add    $0x10,%esp
 880:	39 df                	cmp    %ebx,%edi
 882:	75 e4                	jne    868 <printint+0x68>
    putc(fd, buf[i]);
}
 884:	8d 65 f4             	lea    -0xc(%ebp),%esp
 887:	5b                   	pop    %ebx
 888:	5e                   	pop    %esi
 889:	5f                   	pop    %edi
 88a:	5d                   	pop    %ebp
 88b:	c3                   	ret    
 88c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 890:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 892:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 899:	eb 8b                	jmp    826 <printint+0x26>
 89b:	90                   	nop
 89c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000008a0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 8a0:	55                   	push   %ebp
 8a1:	89 e5                	mov    %esp,%ebp
 8a3:	57                   	push   %edi
 8a4:	56                   	push   %esi
 8a5:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8a6:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 8a9:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8ac:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 8af:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8b2:	89 45 d0             	mov    %eax,-0x30(%ebp)
 8b5:	0f b6 1e             	movzbl (%esi),%ebx
 8b8:	83 c6 01             	add    $0x1,%esi
 8bb:	84 db                	test   %bl,%bl
 8bd:	0f 84 b0 00 00 00    	je     973 <printf+0xd3>
 8c3:	31 d2                	xor    %edx,%edx
 8c5:	eb 39                	jmp    900 <printf+0x60>
 8c7:	89 f6                	mov    %esi,%esi
 8c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 8d0:	83 f8 25             	cmp    $0x25,%eax
 8d3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 8d6:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 8db:	74 18                	je     8f5 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 8dd:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 8e0:	83 ec 04             	sub    $0x4,%esp
 8e3:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 8e6:	6a 01                	push   $0x1
 8e8:	50                   	push   %eax
 8e9:	57                   	push   %edi
 8ea:	e8 7b fe ff ff       	call   76a <write>
 8ef:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 8f2:	83 c4 10             	add    $0x10,%esp
 8f5:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8f8:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 8fc:	84 db                	test   %bl,%bl
 8fe:	74 73                	je     973 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
 900:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 902:	0f be cb             	movsbl %bl,%ecx
 905:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 908:	74 c6                	je     8d0 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 90a:	83 fa 25             	cmp    $0x25,%edx
 90d:	75 e6                	jne    8f5 <printf+0x55>
      if(c == 'd'){
 90f:	83 f8 64             	cmp    $0x64,%eax
 912:	0f 84 f8 00 00 00    	je     a10 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 918:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 91e:	83 f9 70             	cmp    $0x70,%ecx
 921:	74 5d                	je     980 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 923:	83 f8 73             	cmp    $0x73,%eax
 926:	0f 84 84 00 00 00    	je     9b0 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 92c:	83 f8 63             	cmp    $0x63,%eax
 92f:	0f 84 ea 00 00 00    	je     a1f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 935:	83 f8 25             	cmp    $0x25,%eax
 938:	0f 84 c2 00 00 00    	je     a00 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 93e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 941:	83 ec 04             	sub    $0x4,%esp
 944:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 948:	6a 01                	push   $0x1
 94a:	50                   	push   %eax
 94b:	57                   	push   %edi
 94c:	e8 19 fe ff ff       	call   76a <write>
 951:	83 c4 0c             	add    $0xc,%esp
 954:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 957:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 95a:	6a 01                	push   $0x1
 95c:	50                   	push   %eax
 95d:	57                   	push   %edi
 95e:	83 c6 01             	add    $0x1,%esi
 961:	e8 04 fe ff ff       	call   76a <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 966:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 96a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 96d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 96f:	84 db                	test   %bl,%bl
 971:	75 8d                	jne    900 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 973:	8d 65 f4             	lea    -0xc(%ebp),%esp
 976:	5b                   	pop    %ebx
 977:	5e                   	pop    %esi
 978:	5f                   	pop    %edi
 979:	5d                   	pop    %ebp
 97a:	c3                   	ret    
 97b:	90                   	nop
 97c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 980:	83 ec 0c             	sub    $0xc,%esp
 983:	b9 10 00 00 00       	mov    $0x10,%ecx
 988:	6a 00                	push   $0x0
 98a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 98d:	89 f8                	mov    %edi,%eax
 98f:	8b 13                	mov    (%ebx),%edx
 991:	e8 6a fe ff ff       	call   800 <printint>
        ap++;
 996:	89 d8                	mov    %ebx,%eax
 998:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 99b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 99d:	83 c0 04             	add    $0x4,%eax
 9a0:	89 45 d0             	mov    %eax,-0x30(%ebp)
 9a3:	e9 4d ff ff ff       	jmp    8f5 <printf+0x55>
 9a8:	90                   	nop
 9a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 9b0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 9b3:	8b 18                	mov    (%eax),%ebx
        ap++;
 9b5:	83 c0 04             	add    $0x4,%eax
 9b8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
 9bb:	b8 2a 10 00 00       	mov    $0x102a,%eax
 9c0:	85 db                	test   %ebx,%ebx
 9c2:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
 9c5:	0f b6 03             	movzbl (%ebx),%eax
 9c8:	84 c0                	test   %al,%al
 9ca:	74 23                	je     9ef <printf+0x14f>
 9cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 9d0:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 9d3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 9d6:	83 ec 04             	sub    $0x4,%esp
 9d9:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 9db:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 9de:	50                   	push   %eax
 9df:	57                   	push   %edi
 9e0:	e8 85 fd ff ff       	call   76a <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 9e5:	0f b6 03             	movzbl (%ebx),%eax
 9e8:	83 c4 10             	add    $0x10,%esp
 9eb:	84 c0                	test   %al,%al
 9ed:	75 e1                	jne    9d0 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 9ef:	31 d2                	xor    %edx,%edx
 9f1:	e9 ff fe ff ff       	jmp    8f5 <printf+0x55>
 9f6:	8d 76 00             	lea    0x0(%esi),%esi
 9f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 a00:	83 ec 04             	sub    $0x4,%esp
 a03:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 a06:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 a09:	6a 01                	push   $0x1
 a0b:	e9 4c ff ff ff       	jmp    95c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 a10:	83 ec 0c             	sub    $0xc,%esp
 a13:	b9 0a 00 00 00       	mov    $0xa,%ecx
 a18:	6a 01                	push   $0x1
 a1a:	e9 6b ff ff ff       	jmp    98a <printf+0xea>
 a1f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 a22:	83 ec 04             	sub    $0x4,%esp
 a25:	8b 03                	mov    (%ebx),%eax
 a27:	6a 01                	push   $0x1
 a29:	88 45 e4             	mov    %al,-0x1c(%ebp)
 a2c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 a2f:	50                   	push   %eax
 a30:	57                   	push   %edi
 a31:	e8 34 fd ff ff       	call   76a <write>
 a36:	e9 5b ff ff ff       	jmp    996 <printf+0xf6>
 a3b:	66 90                	xchg   %ax,%ax
 a3d:	66 90                	xchg   %ax,%ax
 a3f:	90                   	nop

00000a40 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 a40:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a41:	a1 80 13 00 00       	mov    0x1380,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 a46:	89 e5                	mov    %esp,%ebp
 a48:	57                   	push   %edi
 a49:	56                   	push   %esi
 a4a:	53                   	push   %ebx
 a4b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a4e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 a50:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a53:	39 c8                	cmp    %ecx,%eax
 a55:	73 19                	jae    a70 <free+0x30>
 a57:	89 f6                	mov    %esi,%esi
 a59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 a60:	39 d1                	cmp    %edx,%ecx
 a62:	72 1c                	jb     a80 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a64:	39 d0                	cmp    %edx,%eax
 a66:	73 18                	jae    a80 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 a68:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a6a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a6c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a6e:	72 f0                	jb     a60 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a70:	39 d0                	cmp    %edx,%eax
 a72:	72 f4                	jb     a68 <free+0x28>
 a74:	39 d1                	cmp    %edx,%ecx
 a76:	73 f0                	jae    a68 <free+0x28>
 a78:	90                   	nop
 a79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 a80:	8b 73 fc             	mov    -0x4(%ebx),%esi
 a83:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 a86:	39 d7                	cmp    %edx,%edi
 a88:	74 19                	je     aa3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 a8a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 a8d:	8b 50 04             	mov    0x4(%eax),%edx
 a90:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 a93:	39 f1                	cmp    %esi,%ecx
 a95:	74 23                	je     aba <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 a97:	89 08                	mov    %ecx,(%eax)
  freep = p;
 a99:	a3 80 13 00 00       	mov    %eax,0x1380
}
 a9e:	5b                   	pop    %ebx
 a9f:	5e                   	pop    %esi
 aa0:	5f                   	pop    %edi
 aa1:	5d                   	pop    %ebp
 aa2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 aa3:	03 72 04             	add    0x4(%edx),%esi
 aa6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 aa9:	8b 10                	mov    (%eax),%edx
 aab:	8b 12                	mov    (%edx),%edx
 aad:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 ab0:	8b 50 04             	mov    0x4(%eax),%edx
 ab3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 ab6:	39 f1                	cmp    %esi,%ecx
 ab8:	75 dd                	jne    a97 <free+0x57>
    p->s.size += bp->s.size;
 aba:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 abd:	a3 80 13 00 00       	mov    %eax,0x1380
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 ac2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 ac5:	8b 53 f8             	mov    -0x8(%ebx),%edx
 ac8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 aca:	5b                   	pop    %ebx
 acb:	5e                   	pop    %esi
 acc:	5f                   	pop    %edi
 acd:	5d                   	pop    %ebp
 ace:	c3                   	ret    
 acf:	90                   	nop

00000ad0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 ad0:	55                   	push   %ebp
 ad1:	89 e5                	mov    %esp,%ebp
 ad3:	57                   	push   %edi
 ad4:	56                   	push   %esi
 ad5:	53                   	push   %ebx
 ad6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ad9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 adc:	8b 15 80 13 00 00    	mov    0x1380,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ae2:	8d 78 07             	lea    0x7(%eax),%edi
 ae5:	c1 ef 03             	shr    $0x3,%edi
 ae8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 aeb:	85 d2                	test   %edx,%edx
 aed:	0f 84 a3 00 00 00    	je     b96 <malloc+0xc6>
 af3:	8b 02                	mov    (%edx),%eax
 af5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 af8:	39 cf                	cmp    %ecx,%edi
 afa:	76 74                	jbe    b70 <malloc+0xa0>
 afc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 b02:	be 00 10 00 00       	mov    $0x1000,%esi
 b07:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 b0e:	0f 43 f7             	cmovae %edi,%esi
 b11:	ba 00 80 00 00       	mov    $0x8000,%edx
 b16:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 b1c:	0f 46 da             	cmovbe %edx,%ebx
 b1f:	eb 10                	jmp    b31 <malloc+0x61>
 b21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b28:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 b2a:	8b 48 04             	mov    0x4(%eax),%ecx
 b2d:	39 cf                	cmp    %ecx,%edi
 b2f:	76 3f                	jbe    b70 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 b31:	39 05 80 13 00 00    	cmp    %eax,0x1380
 b37:	89 c2                	mov    %eax,%edx
 b39:	75 ed                	jne    b28 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 b3b:	83 ec 0c             	sub    $0xc,%esp
 b3e:	53                   	push   %ebx
 b3f:	e8 8e fc ff ff       	call   7d2 <sbrk>
  if(p == (char*)-1)
 b44:	83 c4 10             	add    $0x10,%esp
 b47:	83 f8 ff             	cmp    $0xffffffff,%eax
 b4a:	74 1c                	je     b68 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 b4c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 b4f:	83 ec 0c             	sub    $0xc,%esp
 b52:	83 c0 08             	add    $0x8,%eax
 b55:	50                   	push   %eax
 b56:	e8 e5 fe ff ff       	call   a40 <free>
  return freep;
 b5b:	8b 15 80 13 00 00    	mov    0x1380,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 b61:	83 c4 10             	add    $0x10,%esp
 b64:	85 d2                	test   %edx,%edx
 b66:	75 c0                	jne    b28 <malloc+0x58>
        return 0;
 b68:	31 c0                	xor    %eax,%eax
 b6a:	eb 1c                	jmp    b88 <malloc+0xb8>
 b6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 b70:	39 cf                	cmp    %ecx,%edi
 b72:	74 1c                	je     b90 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 b74:	29 f9                	sub    %edi,%ecx
 b76:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 b79:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 b7c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 b7f:	89 15 80 13 00 00    	mov    %edx,0x1380
      return (void*)(p + 1);
 b85:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 b88:	8d 65 f4             	lea    -0xc(%ebp),%esp
 b8b:	5b                   	pop    %ebx
 b8c:	5e                   	pop    %esi
 b8d:	5f                   	pop    %edi
 b8e:	5d                   	pop    %ebp
 b8f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 b90:	8b 08                	mov    (%eax),%ecx
 b92:	89 0a                	mov    %ecx,(%edx)
 b94:	eb e9                	jmp    b7f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 b96:	c7 05 80 13 00 00 84 	movl   $0x1384,0x1380
 b9d:	13 00 00 
 ba0:	c7 05 84 13 00 00 84 	movl   $0x1384,0x1384
 ba7:	13 00 00 
    base.s.size = 0;
 baa:	b8 84 13 00 00       	mov    $0x1384,%eax
 baf:	c7 05 88 13 00 00 00 	movl   $0x0,0x1388
 bb6:	00 00 00 
 bb9:	e9 3e ff ff ff       	jmp    afc <malloc+0x2c>
