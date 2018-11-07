
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

  printf(1, "\n This program tests the correctness of your lab#1\n");
  12:	83 ec 08             	sub    $0x8,%esp
  15:	68 68 0e 00 00       	push   $0xe68
  1a:	6a 01                	push   $0x1
  1c:	e8 7f 07 00 00       	call   7a0 <printf>
  
  if (atoi(argv[1]) == 1)
  21:	5a                   	pop    %edx
  22:	ff 73 04             	pushl  0x4(%ebx)
  25:	e8 a6 05 00 00       	call   5d0 <atoi>
  2a:	83 c4 10             	add    $0x10,%esp
  2d:	83 f8 01             	cmp    $0x1,%eax
  30:	74 41                	je     73 <main+0x73>
	exitWait();
  else if (atoi(argv[1]) == 2)
  32:	83 ec 0c             	sub    $0xc,%esp
  35:	ff 73 04             	pushl  0x4(%ebx)
  38:	e8 93 05 00 00       	call   5d0 <atoi>
  3d:	83 c4 10             	add    $0x10,%esp
  40:	83 f8 02             	cmp    $0x2,%eax
  43:	74 35                	je     7a <main+0x7a>
	waitPid();
  else if (atoi(argv[1]) == 3)
  45:	83 ec 0c             	sub    $0xc,%esp
  48:	ff 73 04             	pushl  0x4(%ebx)
  4b:	e8 80 05 00 00       	call   5d0 <atoi>
  50:	83 c4 10             	add    $0x10,%esp
  53:	83 f8 03             	cmp    $0x3,%eax
  56:	74 29                	je     81 <main+0x81>
	PScheduler();
  else 
   printf(1, "\ntype \"lab1 1\" to test exit and wait, \"lab1 2\" to test waitpid and \"lab1 3\" to test the priority scheduler \n");
  58:	50                   	push   %eax
  59:	50                   	push   %eax
  5a:	68 9c 0e 00 00       	push   $0xe9c
  5f:	6a 01                	push   $0x1
  61:	e8 3a 07 00 00       	call   7a0 <printf>
  66:	83 c4 10             	add    $0x10,%esp
  
    // End of test
	 exit(0);
  69:	83 ec 0c             	sub    $0xc,%esp
  6c:	6a 00                	push   $0x0
  6e:	e8 cf 05 00 00       	call   642 <exit>
	int PScheduler(void);

  printf(1, "\n This program tests the correctness of your lab#1\n");
  
  if (atoi(argv[1]) == 1)
	exitWait();
  73:	e8 18 00 00 00       	call   90 <exitWait>
  78:	eb ef                	jmp    69 <main+0x69>
  else if (atoi(argv[1]) == 2)
	waitPid();
  7a:	e8 d1 00 00 00       	call   150 <waitPid>
  7f:	eb e8                	jmp    69 <main+0x69>
  else if (atoi(argv[1]) == 3)
	PScheduler();
  81:	e8 6a 02 00 00       	call   2f0 <PScheduler>
  86:	eb e1                	jmp    69 <main+0x69>
  88:	66 90                	xchg   %ax,%ax
  8a:	66 90                	xchg   %ax,%ax
  8c:	66 90                	xchg   %ax,%ax
  8e:	66 90                	xchg   %ax,%ax

00000090 <exitWait>:
    // End of test
	 exit(0);
 }
  
  
int exitWait(void) {
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	56                   	push   %esi
  94:	53                   	push   %ebx
      {
	 printf(1, "\nThis is child with PID# %d and I will exit with status %d\n" ,getpid(), -1);
      exit(-1);
  } 
    } else if (pid > 0) { // only the parent exeecutes this code
      ret_pid = wait(&exit_status);
  95:	8d 75 f4             	lea    -0xc(%ebp),%esi
       int i;
  // use this part to test exit(int status) and wait(int* status)
 
  printf(1, "\n  Step 1: testing exit(int status) and wait(int* status):\n");

  for (i = 0; i < 2; i++) {
  98:	31 db                	xor    %ebx,%ebx
    // End of test
	 exit(0);
 }
  
  
int exitWait(void) {
  9a:	83 ec 18             	sub    $0x18,%esp
	  int pid, ret_pid, exit_status;
       int i;
  // use this part to test exit(int status) and wait(int* status)
 
  printf(1, "\n  Step 1: testing exit(int status) and wait(int* status):\n");
  9d:	68 c0 0a 00 00       	push   $0xac0
  a2:	6a 01                	push   $0x1
  a4:	e8 f7 06 00 00       	call   7a0 <printf>
  a9:	83 c4 10             	add    $0x10,%esp

  for (i = 0; i < 2; i++) {
    pid = fork();
  ac:	e8 89 05 00 00       	call   63a <fork>
    if (pid == 0) { // only the child executed this code
  b1:	83 f8 00             	cmp    $0x0,%eax
  b4:	74 32                	je     e8 <exitWait+0x58>
      else
      {
	 printf(1, "\nThis is child with PID# %d and I will exit with status %d\n" ,getpid(), -1);
      exit(-1);
  } 
    } else if (pid > 0) { // only the parent exeecutes this code
  b6:	7e 78                	jle    130 <exitWait+0xa0>
      ret_pid = wait(&exit_status);
  b8:	83 ec 0c             	sub    $0xc,%esp
       int i;
  // use this part to test exit(int status) and wait(int* status)
 
  printf(1, "\n  Step 1: testing exit(int status) and wait(int* status):\n");

  for (i = 0; i < 2; i++) {
  bb:	83 c3 01             	add    $0x1,%ebx
      {
	 printf(1, "\nThis is child with PID# %d and I will exit with status %d\n" ,getpid(), -1);
      exit(-1);
  } 
    } else if (pid > 0) { // only the parent exeecutes this code
      ret_pid = wait(&exit_status);
  be:	56                   	push   %esi
  bf:	e8 86 05 00 00       	call   64a <wait>
      printf(1, "\n This is the parent: child with PID# %d has exited with status %d\n", ret_pid, exit_status);
  c4:	ff 75 f4             	pushl  -0xc(%ebp)
  c7:	50                   	push   %eax
  c8:	68 38 0b 00 00       	push   $0xb38
  cd:	6a 01                	push   $0x1
  cf:	e8 cc 06 00 00       	call   7a0 <printf>
       int i;
  // use this part to test exit(int status) and wait(int* status)
 
  printf(1, "\n  Step 1: testing exit(int status) and wait(int* status):\n");

  for (i = 0; i < 2; i++) {
  d4:	83 c4 20             	add    $0x20,%esp
  d7:	83 fb 02             	cmp    $0x2,%ebx
  da:	75 d0                	jne    ac <exitWait+0x1c>
	  printf(2, "\nError using fork\n");
      exit(-1);
    }
  }
  return 0;
}
  dc:	8d 65 f8             	lea    -0x8(%ebp),%esp
  df:	31 c0                	xor    %eax,%eax
  e1:	5b                   	pop    %ebx
  e2:	5e                   	pop    %esi
  e3:	5d                   	pop    %ebp
  e4:	c3                   	ret    
  e5:	8d 76 00             	lea    0x0(%esi),%esi
  printf(1, "\n  Step 1: testing exit(int status) and wait(int* status):\n");

  for (i = 0; i < 2; i++) {
    pid = fork();
    if (pid == 0) { // only the child executed this code
      if (i == 0)
  e8:	85 db                	test   %ebx,%ebx
  ea:	75 24                	jne    110 <exitWait+0x80>
      {
      printf(1, "\nThis is child with PID# %d and I will exit with status %d\n", getpid(), 0);
  ec:	e8 d9 05 00 00       	call   6ca <getpid>
  f1:	6a 00                	push   $0x0
  f3:	50                   	push   %eax
  f4:	68 fc 0a 00 00       	push   $0xafc
  f9:	6a 01                	push   $0x1
  fb:	e8 a0 06 00 00       	call   7a0 <printf>
      exit(0);
 100:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 107:	e8 36 05 00 00       	call   642 <exit>
 10c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }
      else
      {
	 printf(1, "\nThis is child with PID# %d and I will exit with status %d\n" ,getpid(), -1);
 110:	e8 b5 05 00 00       	call   6ca <getpid>
 115:	6a ff                	push   $0xffffffff
 117:	50                   	push   %eax
 118:	68 fc 0a 00 00       	push   $0xafc
 11d:	6a 01                	push   $0x1
 11f:	e8 7c 06 00 00       	call   7a0 <printf>
      exit(-1);
 124:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 12b:	e8 12 05 00 00       	call   642 <exit>
    } else if (pid > 0) { // only the parent exeecutes this code
      ret_pid = wait(&exit_status);
      printf(1, "\n This is the parent: child with PID# %d has exited with status %d\n", ret_pid, exit_status);
    } else  // something went wrong with fork system call
    {  
	  printf(2, "\nError using fork\n");
 130:	83 ec 08             	sub    $0x8,%esp
 133:	68 0c 0f 00 00       	push   $0xf0c
 138:	6a 02                	push   $0x2
 13a:	e8 61 06 00 00       	call   7a0 <printf>
      exit(-1);
 13f:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 146:	e8 f7 04 00 00       	call   642 <exit>
 14b:	90                   	nop
 14c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000150 <waitPid>:
    }
  }
  return 0;
}

int waitPid(void){
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	56                   	push   %esi
 154:	53                   	push   %ebx
  int pid_a[5]={0, 0, 0, 0, 0};
 // use this part to test wait(int pid, int* status, int options)

 printf(1, "\n  Step 2: testing waitpid(int pid, int* status, int options):\n");

  for (i = 0; i <5; i++) {
 155:	31 db                	xor    %ebx,%ebx
    }
  }
  return 0;
}

int waitPid(void){
 157:	83 ec 28             	sub    $0x28,%esp
	
  int ret_pid, exit_status;
  int i;
  int pid_a[5]={0, 0, 0, 0, 0};
 15a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 161:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 // use this part to test wait(int pid, int* status, int options)

 printf(1, "\n  Step 2: testing waitpid(int pid, int* status, int options):\n");
 168:	68 7c 0b 00 00       	push   $0xb7c
 16d:	6a 01                	push   $0x1

int waitPid(void){
	
  int ret_pid, exit_status;
  int i;
  int pid_a[5]={0, 0, 0, 0, 0};
 16f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 176:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 17d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 // use this part to test wait(int pid, int* status, int options)

 printf(1, "\n  Step 2: testing waitpid(int pid, int* status, int options):\n");
 184:	e8 17 06 00 00       	call   7a0 <printf>
 189:	83 c4 10             	add    $0x10,%esp

  for (i = 0; i <5; i++) {
    pid_a[i] = fork();
 18c:	e8 a9 04 00 00       	call   63a <fork>
	
    if (pid_a[i] == 0) { // only the child executed this code
 191:	85 c0                	test   %eax,%eax
 // use this part to test wait(int pid, int* status, int options)

 printf(1, "\n  Step 2: testing waitpid(int pid, int* status, int options):\n");

  for (i = 0; i <5; i++) {
    pid_a[i] = fork();
 193:	89 44 9d e4          	mov    %eax,-0x1c(%ebp,%ebx,4)
	
    if (pid_a[i] == 0) { // only the child executed this code
 197:	0f 84 31 01 00 00    	je     2ce <waitPid+0x17e>
  int pid_a[5]={0, 0, 0, 0, 0};
 // use this part to test wait(int pid, int* status, int options)

 printf(1, "\n  Step 2: testing waitpid(int pid, int* status, int options):\n");

  for (i = 0; i <5; i++) {
 19d:	83 c3 01             	add    $0x1,%ebx
 1a0:	83 fb 05             	cmp    $0x5,%ebx
 1a3:	75 e7                	jne    18c <waitPid+0x3c>
     
      
      printf(1, "\n The is child with PID# %d and I will exit with status %d\n", getpid(), 0);
      exit(0);}}
       
      sleep(5);
 1a5:	83 ec 0c             	sub    $0xc,%esp
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[3]);
      ret_pid = waitpid(pid_a[3], &exit_status, 0);
 1a8:	8d 5d e0             	lea    -0x20(%ebp),%ebx
     
      
      printf(1, "\n The is child with PID# %d and I will exit with status %d\n", getpid(), 0);
      exit(0);}}
       
      sleep(5);
 1ab:	6a 05                	push   $0x5
 1ad:	e8 28 05 00 00       	call   6da <sleep>
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[3]);
 1b2:	8b 75 f0             	mov    -0x10(%ebp),%esi
 1b5:	83 c4 0c             	add    $0xc,%esp
 1b8:	56                   	push   %esi
 1b9:	68 f8 0b 00 00       	push   $0xbf8
 1be:	6a 01                	push   $0x1
 1c0:	e8 db 05 00 00       	call   7a0 <printf>
      ret_pid = waitpid(pid_a[3], &exit_status, 0);
 1c5:	83 c4 0c             	add    $0xc,%esp
 1c8:	6a 00                	push   $0x0
 1ca:	53                   	push   %ebx
 1cb:	56                   	push   %esi
 1cc:	e8 81 04 00 00       	call   652 <waitpid>
      printf(1, "\n This is the partent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 1d1:	ff 75 e0             	pushl  -0x20(%ebp)
 1d4:	50                   	push   %eax
 1d5:	68 34 0c 00 00       	push   $0xc34
 1da:	6a 01                	push   $0x1
 1dc:	e8 bf 05 00 00       	call   7a0 <printf>
      sleep(5);
 1e1:	83 c4 14             	add    $0x14,%esp
 1e4:	6a 05                	push   $0x5
 1e6:	e8 ef 04 00 00       	call   6da <sleep>
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[1]);
 1eb:	8b 75 e8             	mov    -0x18(%ebp),%esi
 1ee:	83 c4 0c             	add    $0xc,%esp
 1f1:	56                   	push   %esi
 1f2:	68 f8 0b 00 00       	push   $0xbf8
 1f7:	6a 01                	push   $0x1
 1f9:	e8 a2 05 00 00       	call   7a0 <printf>
      ret_pid = waitpid(pid_a[1], &exit_status, 0);
 1fe:	83 c4 0c             	add    $0xc,%esp
 201:	6a 00                	push   $0x0
 203:	53                   	push   %ebx
 204:	56                   	push   %esi
 205:	e8 48 04 00 00       	call   652 <waitpid>
      printf(1, "\n This is the partent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 20a:	ff 75 e0             	pushl  -0x20(%ebp)
 20d:	50                   	push   %eax
 20e:	68 34 0c 00 00       	push   $0xc34
 213:	6a 01                	push   $0x1
 215:	e8 86 05 00 00       	call   7a0 <printf>
      sleep(5);
 21a:	83 c4 14             	add    $0x14,%esp
 21d:	6a 05                	push   $0x5
 21f:	e8 b6 04 00 00       	call   6da <sleep>
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[2]);
 224:	8b 75 ec             	mov    -0x14(%ebp),%esi
 227:	83 c4 0c             	add    $0xc,%esp
 22a:	56                   	push   %esi
 22b:	68 f8 0b 00 00       	push   $0xbf8
 230:	6a 01                	push   $0x1
 232:	e8 69 05 00 00       	call   7a0 <printf>
      ret_pid = waitpid(pid_a[2], &exit_status, 0);
 237:	83 c4 0c             	add    $0xc,%esp
 23a:	6a 00                	push   $0x0
 23c:	53                   	push   %ebx
 23d:	56                   	push   %esi
 23e:	e8 0f 04 00 00       	call   652 <waitpid>
      printf(1, "\n This is the partent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 243:	ff 75 e0             	pushl  -0x20(%ebp)
 246:	50                   	push   %eax
 247:	68 34 0c 00 00       	push   $0xc34
 24c:	6a 01                	push   $0x1
 24e:	e8 4d 05 00 00       	call   7a0 <printf>
      sleep(5);
 253:	83 c4 14             	add    $0x14,%esp
 256:	6a 05                	push   $0x5
 258:	e8 7d 04 00 00       	call   6da <sleep>
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[0]);
 25d:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 260:	83 c4 0c             	add    $0xc,%esp
 263:	56                   	push   %esi
 264:	68 f8 0b 00 00       	push   $0xbf8
 269:	6a 01                	push   $0x1
 26b:	e8 30 05 00 00       	call   7a0 <printf>
      ret_pid = waitpid(pid_a[0], &exit_status, 0);
 270:	83 c4 0c             	add    $0xc,%esp
 273:	6a 00                	push   $0x0
 275:	53                   	push   %ebx
 276:	56                   	push   %esi
 277:	e8 d6 03 00 00       	call   652 <waitpid>
      printf(1, "\n This is the partent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 27c:	ff 75 e0             	pushl  -0x20(%ebp)
 27f:	50                   	push   %eax
 280:	68 34 0c 00 00       	push   $0xc34
 285:	6a 01                	push   $0x1
 287:	e8 14 05 00 00       	call   7a0 <printf>
      sleep(5);
 28c:	83 c4 14             	add    $0x14,%esp
 28f:	6a 05                	push   $0x5
 291:	e8 44 04 00 00       	call   6da <sleep>
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[4]);
 296:	8b 75 f4             	mov    -0xc(%ebp),%esi
 299:	83 c4 0c             	add    $0xc,%esp
 29c:	56                   	push   %esi
 29d:	68 f8 0b 00 00       	push   $0xbf8
 2a2:	6a 01                	push   $0x1
 2a4:	e8 f7 04 00 00       	call   7a0 <printf>
      ret_pid = waitpid(pid_a[4], &exit_status, 0);
 2a9:	83 c4 0c             	add    $0xc,%esp
 2ac:	6a 00                	push   $0x0
 2ae:	53                   	push   %ebx
 2af:	56                   	push   %esi
 2b0:	e8 9d 03 00 00       	call   652 <waitpid>
      printf(1, "\n This is the partent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 2b5:	ff 75 e0             	pushl  -0x20(%ebp)
 2b8:	50                   	push   %eax
 2b9:	68 34 0c 00 00       	push   $0xc34
 2be:	6a 01                	push   $0x1
 2c0:	e8 db 04 00 00       	call   7a0 <printf>
      
      return 0;
  }
 2c5:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2c8:	31 c0                	xor    %eax,%eax
 2ca:	5b                   	pop    %ebx
 2cb:	5e                   	pop    %esi
 2cc:	5d                   	pop    %ebp
 2cd:	c3                   	ret    
    pid_a[i] = fork();
	
    if (pid_a[i] == 0) { // only the child executed this code
     
      
      printf(1, "\n The is child with PID# %d and I will exit with status %d\n", getpid(), 0);
 2ce:	e8 f7 03 00 00       	call   6ca <getpid>
 2d3:	6a 00                	push   $0x0
 2d5:	50                   	push   %eax
 2d6:	68 bc 0b 00 00       	push   $0xbbc
 2db:	6a 01                	push   $0x1
 2dd:	e8 be 04 00 00       	call   7a0 <printf>
      exit(0);}}
 2e2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2e9:	e8 54 03 00 00       	call   642 <exit>
 2ee:	66 90                	xchg   %ax,%ax

000002f0 <PScheduler>:
      
      return 0;
  }
      
      
     int PScheduler(void){
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	56                   	push   %esi
 2f4:	53                   	push   %ebx
 2f5:	83 ec 18             	sub    $0x18,%esp
    // 0 is the highest priority. All processes have a default priority of 20 

  int pid, ret_pid, exit_status;
  int i,j,k;
  
    printf(1, "\n  Step 2: testing the priority scheduler and setpriority(int priority)) systema call:\n");
 2f8:	68 70 0c 00 00       	push   $0xc70
 2fd:	6a 01                	push   $0x1
 2ff:	e8 9c 04 00 00       	call   7a0 <printf>
    printf(1, "\n  Step 2: Assuming that the priorities range between range between 0 to 63\n");
 304:	58                   	pop    %eax
 305:	5a                   	pop    %edx
 306:	68 c8 0c 00 00       	push   $0xcc8
 30b:	6a 01                	push   $0x1
 30d:	e8 8e 04 00 00       	call   7a0 <printf>
    printf(1, "\n  Step 2: 0 is the highest priority. All processes have a default priority of 20\n");
 312:	59                   	pop    %ecx
 313:	5b                   	pop    %ebx
 314:	68 18 0d 00 00       	push   $0xd18
 319:	6a 01                	push   $0x1
    printf(1, "\n  Step 2: The parent processes will switch to priority 0\n");
    setpriority(0);
    for (i = 0; i <  3; i++) {
 31b:	31 db                	xor    %ebx,%ebx
  int pid, ret_pid, exit_status;
  int i,j,k;
  
    printf(1, "\n  Step 2: testing the priority scheduler and setpriority(int priority)) systema call:\n");
    printf(1, "\n  Step 2: Assuming that the priorities range between range between 0 to 63\n");
    printf(1, "\n  Step 2: 0 is the highest priority. All processes have a default priority of 20\n");
 31d:	e8 7e 04 00 00       	call   7a0 <printf>
    printf(1, "\n  Step 2: The parent processes will switch to priority 0\n");
 322:	5e                   	pop    %esi
 323:	58                   	pop    %eax
 324:	68 6c 0d 00 00       	push   $0xd6c
 329:	6a 01                	push   $0x1
 32b:	e8 70 04 00 00       	call   7a0 <printf>
    setpriority(0);
 330:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 337:	e8 ae 03 00 00       	call   6ea <setpriority>
 33c:	83 c4 10             	add    $0x10,%esp
    for (i = 0; i <  3; i++) {
	pid = fork();
 33f:	e8 f6 02 00 00       	call   63a <fork>
	if (pid > 0 ) {
 344:	83 f8 00             	cmp    $0x0,%eax
 347:	7e 44                	jle    38d <PScheduler+0x9d>
    printf(1, "\n  Step 2: testing the priority scheduler and setpriority(int priority)) systema call:\n");
    printf(1, "\n  Step 2: Assuming that the priorities range between range between 0 to 63\n");
    printf(1, "\n  Step 2: 0 is the highest priority. All processes have a default priority of 20\n");
    printf(1, "\n  Step 2: The parent processes will switch to priority 0\n");
    setpriority(0);
    for (i = 0; i <  3; i++) {
 349:	83 c3 01             	add    $0x1,%ebx
 34c:	83 fb 03             	cmp    $0x3,%ebx
 34f:	75 ee                	jne    33f <PScheduler+0x4f>
 351:	8d 75 f4             	lea    -0xc(%ebp),%esi
        }
	}

	if(pid > 0) {
		for (i = 0; i <  3; i++) {
			ret_pid = wait(&exit_status);
 354:	83 ec 0c             	sub    $0xc,%esp
 357:	56                   	push   %esi
 358:	e8 ed 02 00 00       	call   64a <wait>
			printf(1,"\n This is the parent: child with PID# %d has finished with status %d \n",ret_pid,exit_status);
 35d:	ff 75 f4             	pushl  -0xc(%ebp)
 360:	50                   	push   %eax
 361:	68 d8 0d 00 00       	push   $0xdd8
 366:	6a 01                	push   $0x1
 368:	e8 33 04 00 00       	call   7a0 <printf>
			exit(-1);
        }
	}

	if(pid > 0) {
		for (i = 0; i <  3; i++) {
 36d:	83 c4 20             	add    $0x20,%esp
 370:	83 eb 01             	sub    $0x1,%ebx
 373:	75 df                	jne    354 <PScheduler+0x64>
			ret_pid = wait(&exit_status);
			printf(1,"\n This is the parent: child with PID# %d has finished with status %d \n",ret_pid,exit_status);
			}
                     printf(1,"\n if processes with highest priority finished first then its correct \n");
 375:	83 ec 08             	sub    $0x8,%esp
 378:	68 20 0e 00 00       	push   $0xe20
 37d:	6a 01                	push   $0x1
 37f:	e8 1c 04 00 00       	call   7a0 <printf>
}
			
	return 0;}
 384:	8d 65 f8             	lea    -0x8(%ebp),%esp
 387:	31 c0                	xor    %eax,%eax
 389:	5b                   	pop    %ebx
 38a:	5e                   	pop    %esi
 38b:	5d                   	pop    %ebp
 38c:	c3                   	ret    
    setpriority(0);
    for (i = 0; i <  3; i++) {
	pid = fork();
	if (pid > 0 ) {
		continue;}
	else if ( pid == 0) {
 38d:	75 53                	jne    3e2 <PScheduler+0xf2>
//		printf(1, "\n Hello! this is child# %d and I will change my priority to %d \n",getpid(),60-20*i);
		setpriority(60-20*i);	
 38f:	6b db ec             	imul   $0xffffffec,%ebx,%ebx
 392:	83 ec 0c             	sub    $0xc,%esp
 395:	83 c3 3c             	add    $0x3c,%ebx
 398:	53                   	push   %ebx
 399:	e8 4c 03 00 00       	call   6ea <setpriority>
 39e:	83 c4 10             	add    $0x10,%esp
 3a1:	ba 50 c3 00 00       	mov    $0xc350,%edx
 3a6:	8d 76 00             	lea    0x0(%esi),%esi
 3a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    printf(1, "\n  Step 2: testing the priority scheduler and setpriority(int priority)) systema call:\n");
    printf(1, "\n  Step 2: Assuming that the priorities range between range between 0 to 63\n");
    printf(1, "\n  Step 2: 0 is the highest priority. All processes have a default priority of 20\n");
    printf(1, "\n  Step 2: The parent processes will switch to priority 0\n");
    setpriority(0);
    for (i = 0; i <  3; i++) {
 3b0:	b8 10 27 00 00       	mov    $0x2710,%eax
 3b5:	8d 76 00             	lea    0x0(%esi),%esi
	else if ( pid == 0) {
//		printf(1, "\n Hello! this is child# %d and I will change my priority to %d \n",getpid(),60-20*i);
		setpriority(60-20*i);	
		for (j=0;j<50000;j++) {
			for(k=0;k<10000;k++) {
				asm("nop"); }}
 3b8:	90                   	nop
		continue;}
	else if ( pid == 0) {
//		printf(1, "\n Hello! this is child# %d and I will change my priority to %d \n",getpid(),60-20*i);
		setpriority(60-20*i);	
		for (j=0;j<50000;j++) {
			for(k=0;k<10000;k++) {
 3b9:	83 e8 01             	sub    $0x1,%eax
 3bc:	75 fa                	jne    3b8 <PScheduler+0xc8>
	if (pid > 0 ) {
		continue;}
	else if ( pid == 0) {
//		printf(1, "\n Hello! this is child# %d and I will change my priority to %d \n",getpid(),60-20*i);
		setpriority(60-20*i);	
		for (j=0;j<50000;j++) {
 3be:	83 ea 01             	sub    $0x1,%edx
 3c1:	75 ed                	jne    3b0 <PScheduler+0xc0>
			for(k=0;k<10000;k++) {
				asm("nop"); }}
		printf(1, "\n child# %d with priority %d has finished! \n",getpid(),60-20*i);		
 3c3:	e8 02 03 00 00       	call   6ca <getpid>
 3c8:	53                   	push   %ebx
 3c9:	50                   	push   %eax
 3ca:	68 a8 0d 00 00       	push   $0xda8
 3cf:	6a 01                	push   $0x1
 3d1:	e8 ca 03 00 00       	call   7a0 <printf>
		exit(0);
 3d6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 3dd:	e8 60 02 00 00       	call   642 <exit>
        }
        else {
			printf(2," \n Error \n");
 3e2:	83 ec 08             	sub    $0x8,%esp
 3e5:	68 1f 0f 00 00       	push   $0xf1f
 3ea:	6a 02                	push   $0x2
 3ec:	e8 af 03 00 00       	call   7a0 <printf>
			exit(-1);
 3f1:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 3f8:	e8 45 02 00 00       	call   642 <exit>
 3fd:	66 90                	xchg   %ax,%ax
 3ff:	90                   	nop

00000400 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	53                   	push   %ebx
 404:	8b 45 08             	mov    0x8(%ebp),%eax
 407:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 40a:	89 c2                	mov    %eax,%edx
 40c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 410:	83 c1 01             	add    $0x1,%ecx
 413:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 417:	83 c2 01             	add    $0x1,%edx
 41a:	84 db                	test   %bl,%bl
 41c:	88 5a ff             	mov    %bl,-0x1(%edx)
 41f:	75 ef                	jne    410 <strcpy+0x10>
    ;
  return os;
}
 421:	5b                   	pop    %ebx
 422:	5d                   	pop    %ebp
 423:	c3                   	ret    
 424:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 42a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000430 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	56                   	push   %esi
 434:	53                   	push   %ebx
 435:	8b 55 08             	mov    0x8(%ebp),%edx
 438:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 43b:	0f b6 02             	movzbl (%edx),%eax
 43e:	0f b6 19             	movzbl (%ecx),%ebx
 441:	84 c0                	test   %al,%al
 443:	75 1e                	jne    463 <strcmp+0x33>
 445:	eb 29                	jmp    470 <strcmp+0x40>
 447:	89 f6                	mov    %esi,%esi
 449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 450:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 453:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 456:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 459:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 45d:	84 c0                	test   %al,%al
 45f:	74 0f                	je     470 <strcmp+0x40>
 461:	89 f1                	mov    %esi,%ecx
 463:	38 d8                	cmp    %bl,%al
 465:	74 e9                	je     450 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 467:	29 d8                	sub    %ebx,%eax
}
 469:	5b                   	pop    %ebx
 46a:	5e                   	pop    %esi
 46b:	5d                   	pop    %ebp
 46c:	c3                   	ret    
 46d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 470:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 472:	29 d8                	sub    %ebx,%eax
}
 474:	5b                   	pop    %ebx
 475:	5e                   	pop    %esi
 476:	5d                   	pop    %ebp
 477:	c3                   	ret    
 478:	90                   	nop
 479:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000480 <strlen>:

uint
strlen(const char *s)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 486:	80 39 00             	cmpb   $0x0,(%ecx)
 489:	74 12                	je     49d <strlen+0x1d>
 48b:	31 d2                	xor    %edx,%edx
 48d:	8d 76 00             	lea    0x0(%esi),%esi
 490:	83 c2 01             	add    $0x1,%edx
 493:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 497:	89 d0                	mov    %edx,%eax
 499:	75 f5                	jne    490 <strlen+0x10>
    ;
  return n;
}
 49b:	5d                   	pop    %ebp
 49c:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 49d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 49f:	5d                   	pop    %ebp
 4a0:	c3                   	ret    
 4a1:	eb 0d                	jmp    4b0 <memset>
 4a3:	90                   	nop
 4a4:	90                   	nop
 4a5:	90                   	nop
 4a6:	90                   	nop
 4a7:	90                   	nop
 4a8:	90                   	nop
 4a9:	90                   	nop
 4aa:	90                   	nop
 4ab:	90                   	nop
 4ac:	90                   	nop
 4ad:	90                   	nop
 4ae:	90                   	nop
 4af:	90                   	nop

000004b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	57                   	push   %edi
 4b4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 4b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 4ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 4bd:	89 d7                	mov    %edx,%edi
 4bf:	fc                   	cld    
 4c0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 4c2:	89 d0                	mov    %edx,%eax
 4c4:	5f                   	pop    %edi
 4c5:	5d                   	pop    %ebp
 4c6:	c3                   	ret    
 4c7:	89 f6                	mov    %esi,%esi
 4c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004d0 <strchr>:

char*
strchr(const char *s, char c)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	53                   	push   %ebx
 4d4:	8b 45 08             	mov    0x8(%ebp),%eax
 4d7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 4da:	0f b6 10             	movzbl (%eax),%edx
 4dd:	84 d2                	test   %dl,%dl
 4df:	74 1d                	je     4fe <strchr+0x2e>
    if(*s == c)
 4e1:	38 d3                	cmp    %dl,%bl
 4e3:	89 d9                	mov    %ebx,%ecx
 4e5:	75 0d                	jne    4f4 <strchr+0x24>
 4e7:	eb 17                	jmp    500 <strchr+0x30>
 4e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4f0:	38 ca                	cmp    %cl,%dl
 4f2:	74 0c                	je     500 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 4f4:	83 c0 01             	add    $0x1,%eax
 4f7:	0f b6 10             	movzbl (%eax),%edx
 4fa:	84 d2                	test   %dl,%dl
 4fc:	75 f2                	jne    4f0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 4fe:	31 c0                	xor    %eax,%eax
}
 500:	5b                   	pop    %ebx
 501:	5d                   	pop    %ebp
 502:	c3                   	ret    
 503:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 509:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000510 <gets>:

char*
gets(char *buf, int max)
{
 510:	55                   	push   %ebp
 511:	89 e5                	mov    %esp,%ebp
 513:	57                   	push   %edi
 514:	56                   	push   %esi
 515:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 516:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 518:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 51b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 51e:	eb 29                	jmp    549 <gets+0x39>
    cc = read(0, &c, 1);
 520:	83 ec 04             	sub    $0x4,%esp
 523:	6a 01                	push   $0x1
 525:	57                   	push   %edi
 526:	6a 00                	push   $0x0
 528:	e8 35 01 00 00       	call   662 <read>
    if(cc < 1)
 52d:	83 c4 10             	add    $0x10,%esp
 530:	85 c0                	test   %eax,%eax
 532:	7e 1d                	jle    551 <gets+0x41>
      break;
    buf[i++] = c;
 534:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 538:	8b 55 08             	mov    0x8(%ebp),%edx
 53b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 53d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 53f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 543:	74 1b                	je     560 <gets+0x50>
 545:	3c 0d                	cmp    $0xd,%al
 547:	74 17                	je     560 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 549:	8d 5e 01             	lea    0x1(%esi),%ebx
 54c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 54f:	7c cf                	jl     520 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 551:	8b 45 08             	mov    0x8(%ebp),%eax
 554:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 558:	8d 65 f4             	lea    -0xc(%ebp),%esp
 55b:	5b                   	pop    %ebx
 55c:	5e                   	pop    %esi
 55d:	5f                   	pop    %edi
 55e:	5d                   	pop    %ebp
 55f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 560:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 563:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 565:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 569:	8d 65 f4             	lea    -0xc(%ebp),%esp
 56c:	5b                   	pop    %ebx
 56d:	5e                   	pop    %esi
 56e:	5f                   	pop    %edi
 56f:	5d                   	pop    %ebp
 570:	c3                   	ret    
 571:	eb 0d                	jmp    580 <stat>
 573:	90                   	nop
 574:	90                   	nop
 575:	90                   	nop
 576:	90                   	nop
 577:	90                   	nop
 578:	90                   	nop
 579:	90                   	nop
 57a:	90                   	nop
 57b:	90                   	nop
 57c:	90                   	nop
 57d:	90                   	nop
 57e:	90                   	nop
 57f:	90                   	nop

00000580 <stat>:

int
stat(const char *n, struct stat *st)
{
 580:	55                   	push   %ebp
 581:	89 e5                	mov    %esp,%ebp
 583:	56                   	push   %esi
 584:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 585:	83 ec 08             	sub    $0x8,%esp
 588:	6a 00                	push   $0x0
 58a:	ff 75 08             	pushl  0x8(%ebp)
 58d:	e8 f8 00 00 00       	call   68a <open>
  if(fd < 0)
 592:	83 c4 10             	add    $0x10,%esp
 595:	85 c0                	test   %eax,%eax
 597:	78 27                	js     5c0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 599:	83 ec 08             	sub    $0x8,%esp
 59c:	ff 75 0c             	pushl  0xc(%ebp)
 59f:	89 c3                	mov    %eax,%ebx
 5a1:	50                   	push   %eax
 5a2:	e8 fb 00 00 00       	call   6a2 <fstat>
 5a7:	89 c6                	mov    %eax,%esi
  close(fd);
 5a9:	89 1c 24             	mov    %ebx,(%esp)
 5ac:	e8 c1 00 00 00       	call   672 <close>
  return r;
 5b1:	83 c4 10             	add    $0x10,%esp
 5b4:	89 f0                	mov    %esi,%eax
}
 5b6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 5b9:	5b                   	pop    %ebx
 5ba:	5e                   	pop    %esi
 5bb:	5d                   	pop    %ebp
 5bc:	c3                   	ret    
 5bd:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 5c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 5c5:	eb ef                	jmp    5b6 <stat+0x36>
 5c7:	89 f6                	mov    %esi,%esi
 5c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000005d0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 5d0:	55                   	push   %ebp
 5d1:	89 e5                	mov    %esp,%ebp
 5d3:	53                   	push   %ebx
 5d4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 5d7:	0f be 11             	movsbl (%ecx),%edx
 5da:	8d 42 d0             	lea    -0x30(%edx),%eax
 5dd:	3c 09                	cmp    $0x9,%al
 5df:	b8 00 00 00 00       	mov    $0x0,%eax
 5e4:	77 1f                	ja     605 <atoi+0x35>
 5e6:	8d 76 00             	lea    0x0(%esi),%esi
 5e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 5f0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 5f3:	83 c1 01             	add    $0x1,%ecx
 5f6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 5fa:	0f be 11             	movsbl (%ecx),%edx
 5fd:	8d 5a d0             	lea    -0x30(%edx),%ebx
 600:	80 fb 09             	cmp    $0x9,%bl
 603:	76 eb                	jbe    5f0 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 605:	5b                   	pop    %ebx
 606:	5d                   	pop    %ebp
 607:	c3                   	ret    
 608:	90                   	nop
 609:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000610 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 610:	55                   	push   %ebp
 611:	89 e5                	mov    %esp,%ebp
 613:	56                   	push   %esi
 614:	53                   	push   %ebx
 615:	8b 5d 10             	mov    0x10(%ebp),%ebx
 618:	8b 45 08             	mov    0x8(%ebp),%eax
 61b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 61e:	85 db                	test   %ebx,%ebx
 620:	7e 14                	jle    636 <memmove+0x26>
 622:	31 d2                	xor    %edx,%edx
 624:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 628:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 62c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 62f:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 632:	39 da                	cmp    %ebx,%edx
 634:	75 f2                	jne    628 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 636:	5b                   	pop    %ebx
 637:	5e                   	pop    %esi
 638:	5d                   	pop    %ebp
 639:	c3                   	ret    

0000063a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 63a:	b8 01 00 00 00       	mov    $0x1,%eax
 63f:	cd 40                	int    $0x40
 641:	c3                   	ret    

00000642 <exit>:
SYSCALL(exit)
 642:	b8 02 00 00 00       	mov    $0x2,%eax
 647:	cd 40                	int    $0x40
 649:	c3                   	ret    

0000064a <wait>:
SYSCALL(wait)
 64a:	b8 03 00 00 00       	mov    $0x3,%eax
 64f:	cd 40                	int    $0x40
 651:	c3                   	ret    

00000652 <waitpid>:
SYSCALL(waitpid)
 652:	b8 16 00 00 00       	mov    $0x16,%eax
 657:	cd 40                	int    $0x40
 659:	c3                   	ret    

0000065a <pipe>:
SYSCALL(pipe)
 65a:	b8 04 00 00 00       	mov    $0x4,%eax
 65f:	cd 40                	int    $0x40
 661:	c3                   	ret    

00000662 <read>:
SYSCALL(read)
 662:	b8 05 00 00 00       	mov    $0x5,%eax
 667:	cd 40                	int    $0x40
 669:	c3                   	ret    

0000066a <write>:
SYSCALL(write)
 66a:	b8 10 00 00 00       	mov    $0x10,%eax
 66f:	cd 40                	int    $0x40
 671:	c3                   	ret    

00000672 <close>:
SYSCALL(close)
 672:	b8 15 00 00 00       	mov    $0x15,%eax
 677:	cd 40                	int    $0x40
 679:	c3                   	ret    

0000067a <kill>:
SYSCALL(kill)
 67a:	b8 06 00 00 00       	mov    $0x6,%eax
 67f:	cd 40                	int    $0x40
 681:	c3                   	ret    

00000682 <exec>:
SYSCALL(exec)
 682:	b8 07 00 00 00       	mov    $0x7,%eax
 687:	cd 40                	int    $0x40
 689:	c3                   	ret    

0000068a <open>:
SYSCALL(open)
 68a:	b8 0f 00 00 00       	mov    $0xf,%eax
 68f:	cd 40                	int    $0x40
 691:	c3                   	ret    

00000692 <mknod>:
SYSCALL(mknod)
 692:	b8 11 00 00 00       	mov    $0x11,%eax
 697:	cd 40                	int    $0x40
 699:	c3                   	ret    

0000069a <unlink>:
SYSCALL(unlink)
 69a:	b8 12 00 00 00       	mov    $0x12,%eax
 69f:	cd 40                	int    $0x40
 6a1:	c3                   	ret    

000006a2 <fstat>:
SYSCALL(fstat)
 6a2:	b8 08 00 00 00       	mov    $0x8,%eax
 6a7:	cd 40                	int    $0x40
 6a9:	c3                   	ret    

000006aa <link>:
SYSCALL(link)
 6aa:	b8 13 00 00 00       	mov    $0x13,%eax
 6af:	cd 40                	int    $0x40
 6b1:	c3                   	ret    

000006b2 <mkdir>:
SYSCALL(mkdir)
 6b2:	b8 14 00 00 00       	mov    $0x14,%eax
 6b7:	cd 40                	int    $0x40
 6b9:	c3                   	ret    

000006ba <chdir>:
SYSCALL(chdir)
 6ba:	b8 09 00 00 00       	mov    $0x9,%eax
 6bf:	cd 40                	int    $0x40
 6c1:	c3                   	ret    

000006c2 <dup>:
SYSCALL(dup)
 6c2:	b8 0a 00 00 00       	mov    $0xa,%eax
 6c7:	cd 40                	int    $0x40
 6c9:	c3                   	ret    

000006ca <getpid>:
SYSCALL(getpid)
 6ca:	b8 0b 00 00 00       	mov    $0xb,%eax
 6cf:	cd 40                	int    $0x40
 6d1:	c3                   	ret    

000006d2 <sbrk>:
SYSCALL(sbrk)
 6d2:	b8 0c 00 00 00       	mov    $0xc,%eax
 6d7:	cd 40                	int    $0x40
 6d9:	c3                   	ret    

000006da <sleep>:
SYSCALL(sleep)
 6da:	b8 0d 00 00 00       	mov    $0xd,%eax
 6df:	cd 40                	int    $0x40
 6e1:	c3                   	ret    

000006e2 <uptime>:
SYSCALL(uptime)
 6e2:	b8 0e 00 00 00       	mov    $0xe,%eax
 6e7:	cd 40                	int    $0x40
 6e9:	c3                   	ret    

000006ea <setpriority>:
SYSCALL(setpriority)
 6ea:	b8 17 00 00 00       	mov    $0x17,%eax
 6ef:	cd 40                	int    $0x40
 6f1:	c3                   	ret    
 6f2:	66 90                	xchg   %ax,%ax
 6f4:	66 90                	xchg   %ax,%ax
 6f6:	66 90                	xchg   %ax,%ax
 6f8:	66 90                	xchg   %ax,%ax
 6fa:	66 90                	xchg   %ax,%ax
 6fc:	66 90                	xchg   %ax,%ax
 6fe:	66 90                	xchg   %ax,%ax

00000700 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 700:	55                   	push   %ebp
 701:	89 e5                	mov    %esp,%ebp
 703:	57                   	push   %edi
 704:	56                   	push   %esi
 705:	53                   	push   %ebx
 706:	89 c6                	mov    %eax,%esi
 708:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 70b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 70e:	85 db                	test   %ebx,%ebx
 710:	74 7e                	je     790 <printint+0x90>
 712:	89 d0                	mov    %edx,%eax
 714:	c1 e8 1f             	shr    $0x1f,%eax
 717:	84 c0                	test   %al,%al
 719:	74 75                	je     790 <printint+0x90>
    neg = 1;
    x = -xx;
 71b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 71d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 724:	f7 d8                	neg    %eax
 726:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 729:	31 ff                	xor    %edi,%edi
 72b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 72e:	89 ce                	mov    %ecx,%esi
 730:	eb 08                	jmp    73a <printint+0x3a>
 732:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 738:	89 cf                	mov    %ecx,%edi
 73a:	31 d2                	xor    %edx,%edx
 73c:	8d 4f 01             	lea    0x1(%edi),%ecx
 73f:	f7 f6                	div    %esi
 741:	0f b6 92 34 0f 00 00 	movzbl 0xf34(%edx),%edx
  }while((x /= base) != 0);
 748:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 74a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 74d:	75 e9                	jne    738 <printint+0x38>
  if(neg)
 74f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 752:	8b 75 c0             	mov    -0x40(%ebp),%esi
 755:	85 c0                	test   %eax,%eax
 757:	74 08                	je     761 <printint+0x61>
    buf[i++] = '-';
 759:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 75e:	8d 4f 02             	lea    0x2(%edi),%ecx
 761:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
 765:	8d 76 00             	lea    0x0(%esi),%esi
 768:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 76b:	83 ec 04             	sub    $0x4,%esp
 76e:	83 ef 01             	sub    $0x1,%edi
 771:	6a 01                	push   $0x1
 773:	53                   	push   %ebx
 774:	56                   	push   %esi
 775:	88 45 d7             	mov    %al,-0x29(%ebp)
 778:	e8 ed fe ff ff       	call   66a <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 77d:	83 c4 10             	add    $0x10,%esp
 780:	39 df                	cmp    %ebx,%edi
 782:	75 e4                	jne    768 <printint+0x68>
    putc(fd, buf[i]);
}
 784:	8d 65 f4             	lea    -0xc(%ebp),%esp
 787:	5b                   	pop    %ebx
 788:	5e                   	pop    %esi
 789:	5f                   	pop    %edi
 78a:	5d                   	pop    %ebp
 78b:	c3                   	ret    
 78c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 790:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 792:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 799:	eb 8b                	jmp    726 <printint+0x26>
 79b:	90                   	nop
 79c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000007a0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7a0:	55                   	push   %ebp
 7a1:	89 e5                	mov    %esp,%ebp
 7a3:	57                   	push   %edi
 7a4:	56                   	push   %esi
 7a5:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7a6:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7a9:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7ac:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7af:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7b2:	89 45 d0             	mov    %eax,-0x30(%ebp)
 7b5:	0f b6 1e             	movzbl (%esi),%ebx
 7b8:	83 c6 01             	add    $0x1,%esi
 7bb:	84 db                	test   %bl,%bl
 7bd:	0f 84 b0 00 00 00    	je     873 <printf+0xd3>
 7c3:	31 d2                	xor    %edx,%edx
 7c5:	eb 39                	jmp    800 <printf+0x60>
 7c7:	89 f6                	mov    %esi,%esi
 7c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 7d0:	83 f8 25             	cmp    $0x25,%eax
 7d3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 7d6:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 7db:	74 18                	je     7f5 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 7dd:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 7e0:	83 ec 04             	sub    $0x4,%esp
 7e3:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 7e6:	6a 01                	push   $0x1
 7e8:	50                   	push   %eax
 7e9:	57                   	push   %edi
 7ea:	e8 7b fe ff ff       	call   66a <write>
 7ef:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 7f2:	83 c4 10             	add    $0x10,%esp
 7f5:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7f8:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 7fc:	84 db                	test   %bl,%bl
 7fe:	74 73                	je     873 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
 800:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 802:	0f be cb             	movsbl %bl,%ecx
 805:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 808:	74 c6                	je     7d0 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 80a:	83 fa 25             	cmp    $0x25,%edx
 80d:	75 e6                	jne    7f5 <printf+0x55>
      if(c == 'd'){
 80f:	83 f8 64             	cmp    $0x64,%eax
 812:	0f 84 f8 00 00 00    	je     910 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 818:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 81e:	83 f9 70             	cmp    $0x70,%ecx
 821:	74 5d                	je     880 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 823:	83 f8 73             	cmp    $0x73,%eax
 826:	0f 84 84 00 00 00    	je     8b0 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 82c:	83 f8 63             	cmp    $0x63,%eax
 82f:	0f 84 ea 00 00 00    	je     91f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 835:	83 f8 25             	cmp    $0x25,%eax
 838:	0f 84 c2 00 00 00    	je     900 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 83e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 841:	83 ec 04             	sub    $0x4,%esp
 844:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 848:	6a 01                	push   $0x1
 84a:	50                   	push   %eax
 84b:	57                   	push   %edi
 84c:	e8 19 fe ff ff       	call   66a <write>
 851:	83 c4 0c             	add    $0xc,%esp
 854:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 857:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 85a:	6a 01                	push   $0x1
 85c:	50                   	push   %eax
 85d:	57                   	push   %edi
 85e:	83 c6 01             	add    $0x1,%esi
 861:	e8 04 fe ff ff       	call   66a <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 866:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 86a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 86d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 86f:	84 db                	test   %bl,%bl
 871:	75 8d                	jne    800 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 873:	8d 65 f4             	lea    -0xc(%ebp),%esp
 876:	5b                   	pop    %ebx
 877:	5e                   	pop    %esi
 878:	5f                   	pop    %edi
 879:	5d                   	pop    %ebp
 87a:	c3                   	ret    
 87b:	90                   	nop
 87c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 880:	83 ec 0c             	sub    $0xc,%esp
 883:	b9 10 00 00 00       	mov    $0x10,%ecx
 888:	6a 00                	push   $0x0
 88a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 88d:	89 f8                	mov    %edi,%eax
 88f:	8b 13                	mov    (%ebx),%edx
 891:	e8 6a fe ff ff       	call   700 <printint>
        ap++;
 896:	89 d8                	mov    %ebx,%eax
 898:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 89b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 89d:	83 c0 04             	add    $0x4,%eax
 8a0:	89 45 d0             	mov    %eax,-0x30(%ebp)
 8a3:	e9 4d ff ff ff       	jmp    7f5 <printf+0x55>
 8a8:	90                   	nop
 8a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 8b0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 8b3:	8b 18                	mov    (%eax),%ebx
        ap++;
 8b5:	83 c0 04             	add    $0x4,%eax
 8b8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
 8bb:	b8 2a 0f 00 00       	mov    $0xf2a,%eax
 8c0:	85 db                	test   %ebx,%ebx
 8c2:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
 8c5:	0f b6 03             	movzbl (%ebx),%eax
 8c8:	84 c0                	test   %al,%al
 8ca:	74 23                	je     8ef <printf+0x14f>
 8cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8d0:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 8d3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 8d6:	83 ec 04             	sub    $0x4,%esp
 8d9:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 8db:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 8de:	50                   	push   %eax
 8df:	57                   	push   %edi
 8e0:	e8 85 fd ff ff       	call   66a <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 8e5:	0f b6 03             	movzbl (%ebx),%eax
 8e8:	83 c4 10             	add    $0x10,%esp
 8eb:	84 c0                	test   %al,%al
 8ed:	75 e1                	jne    8d0 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 8ef:	31 d2                	xor    %edx,%edx
 8f1:	e9 ff fe ff ff       	jmp    7f5 <printf+0x55>
 8f6:	8d 76 00             	lea    0x0(%esi),%esi
 8f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 900:	83 ec 04             	sub    $0x4,%esp
 903:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 906:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 909:	6a 01                	push   $0x1
 90b:	e9 4c ff ff ff       	jmp    85c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 910:	83 ec 0c             	sub    $0xc,%esp
 913:	b9 0a 00 00 00       	mov    $0xa,%ecx
 918:	6a 01                	push   $0x1
 91a:	e9 6b ff ff ff       	jmp    88a <printf+0xea>
 91f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 922:	83 ec 04             	sub    $0x4,%esp
 925:	8b 03                	mov    (%ebx),%eax
 927:	6a 01                	push   $0x1
 929:	88 45 e4             	mov    %al,-0x1c(%ebp)
 92c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 92f:	50                   	push   %eax
 930:	57                   	push   %edi
 931:	e8 34 fd ff ff       	call   66a <write>
 936:	e9 5b ff ff ff       	jmp    896 <printf+0xf6>
 93b:	66 90                	xchg   %ax,%ax
 93d:	66 90                	xchg   %ax,%ax
 93f:	90                   	nop

00000940 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 940:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 941:	a1 54 12 00 00       	mov    0x1254,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 946:	89 e5                	mov    %esp,%ebp
 948:	57                   	push   %edi
 949:	56                   	push   %esi
 94a:	53                   	push   %ebx
 94b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 94e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 950:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 953:	39 c8                	cmp    %ecx,%eax
 955:	73 19                	jae    970 <free+0x30>
 957:	89 f6                	mov    %esi,%esi
 959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 960:	39 d1                	cmp    %edx,%ecx
 962:	72 1c                	jb     980 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 964:	39 d0                	cmp    %edx,%eax
 966:	73 18                	jae    980 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 968:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 96a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 96c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 96e:	72 f0                	jb     960 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 970:	39 d0                	cmp    %edx,%eax
 972:	72 f4                	jb     968 <free+0x28>
 974:	39 d1                	cmp    %edx,%ecx
 976:	73 f0                	jae    968 <free+0x28>
 978:	90                   	nop
 979:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 980:	8b 73 fc             	mov    -0x4(%ebx),%esi
 983:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 986:	39 d7                	cmp    %edx,%edi
 988:	74 19                	je     9a3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 98a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 98d:	8b 50 04             	mov    0x4(%eax),%edx
 990:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 993:	39 f1                	cmp    %esi,%ecx
 995:	74 23                	je     9ba <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 997:	89 08                	mov    %ecx,(%eax)
  freep = p;
 999:	a3 54 12 00 00       	mov    %eax,0x1254
}
 99e:	5b                   	pop    %ebx
 99f:	5e                   	pop    %esi
 9a0:	5f                   	pop    %edi
 9a1:	5d                   	pop    %ebp
 9a2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 9a3:	03 72 04             	add    0x4(%edx),%esi
 9a6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9a9:	8b 10                	mov    (%eax),%edx
 9ab:	8b 12                	mov    (%edx),%edx
 9ad:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 9b0:	8b 50 04             	mov    0x4(%eax),%edx
 9b3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9b6:	39 f1                	cmp    %esi,%ecx
 9b8:	75 dd                	jne    997 <free+0x57>
    p->s.size += bp->s.size;
 9ba:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 9bd:	a3 54 12 00 00       	mov    %eax,0x1254
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 9c2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9c5:	8b 53 f8             	mov    -0x8(%ebx),%edx
 9c8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 9ca:	5b                   	pop    %ebx
 9cb:	5e                   	pop    %esi
 9cc:	5f                   	pop    %edi
 9cd:	5d                   	pop    %ebp
 9ce:	c3                   	ret    
 9cf:	90                   	nop

000009d0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 9d0:	55                   	push   %ebp
 9d1:	89 e5                	mov    %esp,%ebp
 9d3:	57                   	push   %edi
 9d4:	56                   	push   %esi
 9d5:	53                   	push   %ebx
 9d6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9d9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 9dc:	8b 15 54 12 00 00    	mov    0x1254,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9e2:	8d 78 07             	lea    0x7(%eax),%edi
 9e5:	c1 ef 03             	shr    $0x3,%edi
 9e8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 9eb:	85 d2                	test   %edx,%edx
 9ed:	0f 84 a3 00 00 00    	je     a96 <malloc+0xc6>
 9f3:	8b 02                	mov    (%edx),%eax
 9f5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 9f8:	39 cf                	cmp    %ecx,%edi
 9fa:	76 74                	jbe    a70 <malloc+0xa0>
 9fc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 a02:	be 00 10 00 00       	mov    $0x1000,%esi
 a07:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 a0e:	0f 43 f7             	cmovae %edi,%esi
 a11:	ba 00 80 00 00       	mov    $0x8000,%edx
 a16:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 a1c:	0f 46 da             	cmovbe %edx,%ebx
 a1f:	eb 10                	jmp    a31 <malloc+0x61>
 a21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a28:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 a2a:	8b 48 04             	mov    0x4(%eax),%ecx
 a2d:	39 cf                	cmp    %ecx,%edi
 a2f:	76 3f                	jbe    a70 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a31:	39 05 54 12 00 00    	cmp    %eax,0x1254
 a37:	89 c2                	mov    %eax,%edx
 a39:	75 ed                	jne    a28 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 a3b:	83 ec 0c             	sub    $0xc,%esp
 a3e:	53                   	push   %ebx
 a3f:	e8 8e fc ff ff       	call   6d2 <sbrk>
  if(p == (char*)-1)
 a44:	83 c4 10             	add    $0x10,%esp
 a47:	83 f8 ff             	cmp    $0xffffffff,%eax
 a4a:	74 1c                	je     a68 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 a4c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 a4f:	83 ec 0c             	sub    $0xc,%esp
 a52:	83 c0 08             	add    $0x8,%eax
 a55:	50                   	push   %eax
 a56:	e8 e5 fe ff ff       	call   940 <free>
  return freep;
 a5b:	8b 15 54 12 00 00    	mov    0x1254,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 a61:	83 c4 10             	add    $0x10,%esp
 a64:	85 d2                	test   %edx,%edx
 a66:	75 c0                	jne    a28 <malloc+0x58>
        return 0;
 a68:	31 c0                	xor    %eax,%eax
 a6a:	eb 1c                	jmp    a88 <malloc+0xb8>
 a6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a70:	39 cf                	cmp    %ecx,%edi
 a72:	74 1c                	je     a90 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a74:	29 f9                	sub    %edi,%ecx
 a76:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 a79:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 a7c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 a7f:	89 15 54 12 00 00    	mov    %edx,0x1254
      return (void*)(p + 1);
 a85:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a88:	8d 65 f4             	lea    -0xc(%ebp),%esp
 a8b:	5b                   	pop    %ebx
 a8c:	5e                   	pop    %esi
 a8d:	5f                   	pop    %edi
 a8e:	5d                   	pop    %ebp
 a8f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 a90:	8b 08                	mov    (%eax),%ecx
 a92:	89 0a                	mov    %ecx,(%edx)
 a94:	eb e9                	jmp    a7f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 a96:	c7 05 54 12 00 00 58 	movl   $0x1258,0x1254
 a9d:	12 00 00 
 aa0:	c7 05 58 12 00 00 58 	movl   $0x1258,0x1258
 aa7:	12 00 00 
    base.s.size = 0;
 aaa:	b8 58 12 00 00       	mov    $0x1258,%eax
 aaf:	c7 05 5c 12 00 00 00 	movl   $0x0,0x125c
 ab6:	00 00 00 
 ab9:	e9 3e ff ff ff       	jmp    9fc <malloc+0x2c>
