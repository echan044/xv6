
_lab1:     file format elf32-i386


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

  printf(1, "\n This program tests the correctness of your lab#1\n");
  12:	83 ec 08             	sub    $0x8,%esp
  15:	68 40 0b 00 00       	push   $0xb40
  1a:	6a 01                	push   $0x1
  1c:	e8 4f 06 00 00       	call   670 <printf>
  
  if (atoi(argv[1]) == 1)
  21:	5a                   	pop    %edx
  22:	ff 73 04             	pushl  0x4(%ebx)
  25:	e8 76 04 00 00       	call   4a0 <atoi>
  2a:	83 c4 10             	add    $0x10,%esp
  2d:	83 f8 01             	cmp    $0x1,%eax
  30:	74 2e                	je     60 <main+0x60>
	exitWait();
  else if (atoi(argv[1]) == 2)
  32:	83 ec 0c             	sub    $0xc,%esp
  35:	ff 73 04             	pushl  0x4(%ebx)
  38:	e8 63 04 00 00       	call   4a0 <atoi>
  3d:	83 c4 10             	add    $0x10,%esp
  40:	83 f8 02             	cmp    $0x2,%eax
  43:	74 22                	je     67 <main+0x67>
	waitPid();
   else 
   printf(1, "\ntype \"lab1 1\" to test exit and wait, \"lab1 2\" to test waitpid\n");
  45:	50                   	push   %eax
  46:	50                   	push   %eax
  47:	68 74 0b 00 00       	push   $0xb74
  4c:	6a 01                	push   $0x1
  4e:	e8 1d 06 00 00       	call   670 <printf>
  53:	83 c4 10             	add    $0x10,%esp
  
    // End of test
	 exit(0);
  56:	83 ec 0c             	sub    $0xc,%esp
  59:	6a 00                	push   $0x0
  5b:	e8 b2 04 00 00       	call   512 <exit>
	int waitPid(void);

  printf(1, "\n This program tests the correctness of your lab#1\n");
  
  if (atoi(argv[1]) == 1)
	exitWait();
  60:	e8 0b 00 00 00       	call   70 <exitWait>
  65:	eb ef                	jmp    56 <main+0x56>
  else if (atoi(argv[1]) == 2)
	waitPid();
  67:	e8 c4 00 00 00       	call   130 <waitPid>
  6c:	eb e8                	jmp    56 <main+0x56>
  6e:	66 90                	xchg   %ax,%ax

00000070 <exitWait>:
    // End of test
	 exit(0);
 }
  
  
int exitWait(void) {
  70:	55                   	push   %ebp
  71:	89 e5                	mov    %esp,%ebp
  73:	56                   	push   %esi
  74:	53                   	push   %ebx
      {
	 printf(1, "\nThis is child with PID# %d and I will exit with status %d\n" ,getpid(), -1);
      exit(-1);
  } 
    } else if (pid > 0) { // only the parent exeecutes this code
      ret_pid = wait(&exit_status);
  75:	8d 75 f4             	lea    -0xc(%ebp),%esi
       int i;
  // use this part to test exit(int status) and wait(int* status)
 
  printf(1, "\n  Step 1: testing exit(int status) and wait(int* status):\n");

  for (i = 0; i < 2; i++) {
  78:	31 db                	xor    %ebx,%ebx
    // End of test
	 exit(0);
 }
  
  
int exitWait(void) {
  7a:	83 ec 18             	sub    $0x18,%esp
	  int pid, ret_pid, exit_status;
       int i;
  // use this part to test exit(int status) and wait(int* status)
 
  printf(1, "\n  Step 1: testing exit(int status) and wait(int* status):\n");
  7d:	68 90 09 00 00       	push   $0x990
  82:	6a 01                	push   $0x1
  84:	e8 e7 05 00 00       	call   670 <printf>
  89:	83 c4 10             	add    $0x10,%esp

  for (i = 0; i < 2; i++) {
    pid = fork();
  8c:	e8 79 04 00 00       	call   50a <fork>
    if (pid == 0) { // only the child executed this code
  91:	83 f8 00             	cmp    $0x0,%eax
  94:	74 32                	je     c8 <exitWait+0x58>
      else
      {
	 printf(1, "\nThis is child with PID# %d and I will exit with status %d\n" ,getpid(), -1);
      exit(-1);
  } 
    } else if (pid > 0) { // only the parent exeecutes this code
  96:	7e 78                	jle    110 <exitWait+0xa0>
      ret_pid = wait(&exit_status);
  98:	83 ec 0c             	sub    $0xc,%esp
       int i;
  // use this part to test exit(int status) and wait(int* status)
 
  printf(1, "\n  Step 1: testing exit(int status) and wait(int* status):\n");

  for (i = 0; i < 2; i++) {
  9b:	83 c3 01             	add    $0x1,%ebx
      {
	 printf(1, "\nThis is child with PID# %d and I will exit with status %d\n" ,getpid(), -1);
      exit(-1);
  } 
    } else if (pid > 0) { // only the parent exeecutes this code
      ret_pid = wait(&exit_status);
  9e:	56                   	push   %esi
  9f:	e8 76 04 00 00       	call   51a <wait>
      printf(1, "\n This is the parent: child with PID# %d has exited with status %d\n", ret_pid, exit_status);
  a4:	ff 75 f4             	pushl  -0xc(%ebp)
  a7:	50                   	push   %eax
  a8:	68 08 0a 00 00       	push   $0xa08
  ad:	6a 01                	push   $0x1
  af:	e8 bc 05 00 00       	call   670 <printf>
       int i;
  // use this part to test exit(int status) and wait(int* status)
 
  printf(1, "\n  Step 1: testing exit(int status) and wait(int* status):\n");

  for (i = 0; i < 2; i++) {
  b4:	83 c4 20             	add    $0x20,%esp
  b7:	83 fb 02             	cmp    $0x2,%ebx
  ba:	75 d0                	jne    8c <exitWait+0x1c>
	  printf(2, "\nError using fork\n");
      exit(-1);
    }
  }
  return 0;
}
  bc:	8d 65 f8             	lea    -0x8(%ebp),%esp
  bf:	31 c0                	xor    %eax,%eax
  c1:	5b                   	pop    %ebx
  c2:	5e                   	pop    %esi
  c3:	5d                   	pop    %ebp
  c4:	c3                   	ret    
  c5:	8d 76 00             	lea    0x0(%esi),%esi
  printf(1, "\n  Step 1: testing exit(int status) and wait(int* status):\n");

  for (i = 0; i < 2; i++) {
    pid = fork();
    if (pid == 0) { // only the child executed this code
      if (i == 0)
  c8:	85 db                	test   %ebx,%ebx
  ca:	75 24                	jne    f0 <exitWait+0x80>
      {
      printf(1, "\nThis is child with PID# %d and I will exit with status %d\n", getpid(), 0);
  cc:	e8 d1 04 00 00       	call   5a2 <getpid>
  d1:	6a 00                	push   $0x0
  d3:	50                   	push   %eax
  d4:	68 cc 09 00 00       	push   $0x9cc
  d9:	6a 01                	push   $0x1
  db:	e8 90 05 00 00       	call   670 <printf>
      exit(0);
  e0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  e7:	e8 26 04 00 00       	call   512 <exit>
  ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }
      else
      {
	 printf(1, "\nThis is child with PID# %d and I will exit with status %d\n" ,getpid(), -1);
  f0:	e8 ad 04 00 00       	call   5a2 <getpid>
  f5:	6a ff                	push   $0xffffffff
  f7:	50                   	push   %eax
  f8:	68 cc 09 00 00       	push   $0x9cc
  fd:	6a 01                	push   $0x1
  ff:	e8 6c 05 00 00       	call   670 <printf>
      exit(-1);
 104:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 10b:	e8 02 04 00 00       	call   512 <exit>
    } else if (pid > 0) { // only the parent exeecutes this code
      ret_pid = wait(&exit_status);
      printf(1, "\n This is the parent: child with PID# %d has exited with status %d\n", ret_pid, exit_status);
    } else  // something went wrong with fork system call
    {  
	  printf(2, "\nError using fork\n");
 110:	83 ec 08             	sub    $0x8,%esp
 113:	68 b4 0b 00 00       	push   $0xbb4
 118:	6a 02                	push   $0x2
 11a:	e8 51 05 00 00       	call   670 <printf>
      exit(-1);
 11f:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 126:	e8 e7 03 00 00       	call   512 <exit>
 12b:	90                   	nop
 12c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000130 <waitPid>:
    }
  }
  return 0;
}

int waitPid(void){
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	56                   	push   %esi
 134:	53                   	push   %ebx
  int pid_a[5]={0, 0, 0, 0, 0};
 // use this part to test wait(int pid, int* status, int options)

 printf(1, "\n  Step 2: testing waitpid(int pid, int* status, int options):\n");

  for (i = 0; i <5; i++) {
 135:	31 db                	xor    %ebx,%ebx
    }
  }
  return 0;
}

int waitPid(void){
 137:	83 ec 28             	sub    $0x28,%esp
	
  int ret_pid, exit_status;
  int i;
  int pid_a[5]={0, 0, 0, 0, 0};
 13a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 141:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 // use this part to test wait(int pid, int* status, int options)

 printf(1, "\n  Step 2: testing waitpid(int pid, int* status, int options):\n");
 148:	68 4c 0a 00 00       	push   $0xa4c
 14d:	6a 01                	push   $0x1

int waitPid(void){
	
  int ret_pid, exit_status;
  int i;
  int pid_a[5]={0, 0, 0, 0, 0};
 14f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 156:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 15d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 // use this part to test wait(int pid, int* status, int options)

 printf(1, "\n  Step 2: testing waitpid(int pid, int* status, int options):\n");
 164:	e8 07 05 00 00       	call   670 <printf>
 169:	83 c4 10             	add    $0x10,%esp

  for (i = 0; i <5; i++) {
    pid_a[i] = fork();
 16c:	e8 99 03 00 00       	call   50a <fork>
	
    if (pid_a[i] == 0) { // only the child executed this code
 171:	85 c0                	test   %eax,%eax
 // use this part to test wait(int pid, int* status, int options)

 printf(1, "\n  Step 2: testing waitpid(int pid, int* status, int options):\n");

  for (i = 0; i <5; i++) {
    pid_a[i] = fork();
 173:	89 44 9d e4          	mov    %eax,-0x1c(%ebp,%ebx,4)
	
    if (pid_a[i] == 0) { // only the child executed this code
 177:	0f 84 31 01 00 00    	je     2ae <waitPid+0x17e>
  int pid_a[5]={0, 0, 0, 0, 0};
 // use this part to test wait(int pid, int* status, int options)

 printf(1, "\n  Step 2: testing waitpid(int pid, int* status, int options):\n");

  for (i = 0; i <5; i++) {
 17d:	83 c3 01             	add    $0x1,%ebx
 180:	83 fb 05             	cmp    $0x5,%ebx
 183:	75 e7                	jne    16c <waitPid+0x3c>
     
      
      printf(1, "\n The is child with PID# %d and I will exit with status %d\n", getpid(), 0);
      exit(0);}}
       
      sleep(5);
 185:	83 ec 0c             	sub    $0xc,%esp
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[3]);
      ret_pid = waitpid(pid_a[3], &exit_status, 0);
 188:	8d 5d e0             	lea    -0x20(%ebp),%ebx
     
      
      printf(1, "\n The is child with PID# %d and I will exit with status %d\n", getpid(), 0);
      exit(0);}}
       
      sleep(5);
 18b:	6a 05                	push   $0x5
 18d:	e8 20 04 00 00       	call   5b2 <sleep>
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[3]);
 192:	8b 75 f0             	mov    -0x10(%ebp),%esi
 195:	83 c4 0c             	add    $0xc,%esp
 198:	56                   	push   %esi
 199:	68 c8 0a 00 00       	push   $0xac8
 19e:	6a 01                	push   $0x1
 1a0:	e8 cb 04 00 00       	call   670 <printf>
      ret_pid = waitpid(pid_a[3], &exit_status, 0);
 1a5:	83 c4 0c             	add    $0xc,%esp
 1a8:	6a 00                	push   $0x0
 1aa:	53                   	push   %ebx
 1ab:	56                   	push   %esi
 1ac:	e8 71 03 00 00       	call   522 <waitpid>
      printf(1, "\n This is the child: Child# %d has exited with status %d\n",ret_pid, exit_status);
 1b1:	ff 75 e0             	pushl  -0x20(%ebp)
 1b4:	50                   	push   %eax
 1b5:	68 04 0b 00 00       	push   $0xb04
 1ba:	6a 01                	push   $0x1
 1bc:	e8 af 04 00 00       	call   670 <printf>
      sleep(5);
 1c1:	83 c4 14             	add    $0x14,%esp
 1c4:	6a 05                	push   $0x5
 1c6:	e8 e7 03 00 00       	call   5b2 <sleep>
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[1]);
 1cb:	8b 75 e8             	mov    -0x18(%ebp),%esi
 1ce:	83 c4 0c             	add    $0xc,%esp
 1d1:	56                   	push   %esi
 1d2:	68 c8 0a 00 00       	push   $0xac8
 1d7:	6a 01                	push   $0x1
 1d9:	e8 92 04 00 00       	call   670 <printf>
      ret_pid = waitpid(pid_a[1], &exit_status, 0);
 1de:	83 c4 0c             	add    $0xc,%esp
 1e1:	6a 00                	push   $0x0
 1e3:	53                   	push   %ebx
 1e4:	56                   	push   %esi
 1e5:	e8 38 03 00 00       	call   522 <waitpid>
      printf(1, "\n This is the child: Child# %d has exited with status %d\n",ret_pid, exit_status);
 1ea:	ff 75 e0             	pushl  -0x20(%ebp)
 1ed:	50                   	push   %eax
 1ee:	68 04 0b 00 00       	push   $0xb04
 1f3:	6a 01                	push   $0x1
 1f5:	e8 76 04 00 00       	call   670 <printf>
      sleep(5);
 1fa:	83 c4 14             	add    $0x14,%esp
 1fd:	6a 05                	push   $0x5
 1ff:	e8 ae 03 00 00       	call   5b2 <sleep>
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[2]);
 204:	8b 75 ec             	mov    -0x14(%ebp),%esi
 207:	83 c4 0c             	add    $0xc,%esp
 20a:	56                   	push   %esi
 20b:	68 c8 0a 00 00       	push   $0xac8
 210:	6a 01                	push   $0x1
 212:	e8 59 04 00 00       	call   670 <printf>
      ret_pid = waitpid(pid_a[2], &exit_status, 0);
 217:	83 c4 0c             	add    $0xc,%esp
 21a:	6a 00                	push   $0x0
 21c:	53                   	push   %ebx
 21d:	56                   	push   %esi
 21e:	e8 ff 02 00 00       	call   522 <waitpid>
      printf(1, "\n This is the child: Child# %d has exited with status %d\n",ret_pid, exit_status);
 223:	ff 75 e0             	pushl  -0x20(%ebp)
 226:	50                   	push   %eax
 227:	68 04 0b 00 00       	push   $0xb04
 22c:	6a 01                	push   $0x1
 22e:	e8 3d 04 00 00       	call   670 <printf>
      sleep(5);
 233:	83 c4 14             	add    $0x14,%esp
 236:	6a 05                	push   $0x5
 238:	e8 75 03 00 00       	call   5b2 <sleep>
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[0]);
 23d:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 240:	83 c4 0c             	add    $0xc,%esp
 243:	56                   	push   %esi
 244:	68 c8 0a 00 00       	push   $0xac8
 249:	6a 01                	push   $0x1
 24b:	e8 20 04 00 00       	call   670 <printf>
      ret_pid = waitpid(pid_a[0], &exit_status, 0);
 250:	83 c4 0c             	add    $0xc,%esp
 253:	6a 00                	push   $0x0
 255:	53                   	push   %ebx
 256:	56                   	push   %esi
 257:	e8 c6 02 00 00       	call   522 <waitpid>
      printf(1, "\n This is the child: Child# %d has exited with status %d\n",ret_pid, exit_status);
 25c:	ff 75 e0             	pushl  -0x20(%ebp)
 25f:	50                   	push   %eax
 260:	68 04 0b 00 00       	push   $0xb04
 265:	6a 01                	push   $0x1
 267:	e8 04 04 00 00       	call   670 <printf>
      sleep(5);
 26c:	83 c4 14             	add    $0x14,%esp
 26f:	6a 05                	push   $0x5
 271:	e8 3c 03 00 00       	call   5b2 <sleep>
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[4]);
 276:	8b 75 f4             	mov    -0xc(%ebp),%esi
 279:	83 c4 0c             	add    $0xc,%esp
 27c:	56                   	push   %esi
 27d:	68 c8 0a 00 00       	push   $0xac8
 282:	6a 01                	push   $0x1
 284:	e8 e7 03 00 00       	call   670 <printf>
      ret_pid = waitpid(pid_a[4], &exit_status, 0);
 289:	83 c4 0c             	add    $0xc,%esp
 28c:	6a 00                	push   $0x0
 28e:	53                   	push   %ebx
 28f:	56                   	push   %esi
 290:	e8 8d 02 00 00       	call   522 <waitpid>
      printf(1, "\n This is the child: Child# %d has exited with status %d\n",ret_pid, exit_status);
 295:	ff 75 e0             	pushl  -0x20(%ebp)
 298:	50                   	push   %eax
 299:	68 04 0b 00 00       	push   $0xb04
 29e:	6a 01                	push   $0x1
 2a0:	e8 cb 03 00 00       	call   670 <printf>
      
      return 0;
  }
 2a5:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2a8:	31 c0                	xor    %eax,%eax
 2aa:	5b                   	pop    %ebx
 2ab:	5e                   	pop    %esi
 2ac:	5d                   	pop    %ebp
 2ad:	c3                   	ret    
    pid_a[i] = fork();
	
    if (pid_a[i] == 0) { // only the child executed this code
     
      
      printf(1, "\n The is child with PID# %d and I will exit with status %d\n", getpid(), 0);
 2ae:	e8 ef 02 00 00       	call   5a2 <getpid>
 2b3:	6a 00                	push   $0x0
 2b5:	50                   	push   %eax
 2b6:	68 8c 0a 00 00       	push   $0xa8c
 2bb:	6a 01                	push   $0x1
 2bd:	e8 ae 03 00 00       	call   670 <printf>
      exit(0);}}
 2c2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2c9:	e8 44 02 00 00       	call   512 <exit>
 2ce:	66 90                	xchg   %ax,%ax

000002d0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	53                   	push   %ebx
 2d4:	8b 45 08             	mov    0x8(%ebp),%eax
 2d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2da:	89 c2                	mov    %eax,%edx
 2dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2e0:	83 c1 01             	add    $0x1,%ecx
 2e3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 2e7:	83 c2 01             	add    $0x1,%edx
 2ea:	84 db                	test   %bl,%bl
 2ec:	88 5a ff             	mov    %bl,-0x1(%edx)
 2ef:	75 ef                	jne    2e0 <strcpy+0x10>
    ;
  return os;
}
 2f1:	5b                   	pop    %ebx
 2f2:	5d                   	pop    %ebp
 2f3:	c3                   	ret    
 2f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000300 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	56                   	push   %esi
 304:	53                   	push   %ebx
 305:	8b 55 08             	mov    0x8(%ebp),%edx
 308:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 30b:	0f b6 02             	movzbl (%edx),%eax
 30e:	0f b6 19             	movzbl (%ecx),%ebx
 311:	84 c0                	test   %al,%al
 313:	75 1e                	jne    333 <strcmp+0x33>
 315:	eb 29                	jmp    340 <strcmp+0x40>
 317:	89 f6                	mov    %esi,%esi
 319:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 320:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 323:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 326:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 329:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 32d:	84 c0                	test   %al,%al
 32f:	74 0f                	je     340 <strcmp+0x40>
 331:	89 f1                	mov    %esi,%ecx
 333:	38 d8                	cmp    %bl,%al
 335:	74 e9                	je     320 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 337:	29 d8                	sub    %ebx,%eax
}
 339:	5b                   	pop    %ebx
 33a:	5e                   	pop    %esi
 33b:	5d                   	pop    %ebp
 33c:	c3                   	ret    
 33d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 340:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 342:	29 d8                	sub    %ebx,%eax
}
 344:	5b                   	pop    %ebx
 345:	5e                   	pop    %esi
 346:	5d                   	pop    %ebp
 347:	c3                   	ret    
 348:	90                   	nop
 349:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000350 <strlen>:

uint
strlen(const char *s)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 356:	80 39 00             	cmpb   $0x0,(%ecx)
 359:	74 12                	je     36d <strlen+0x1d>
 35b:	31 d2                	xor    %edx,%edx
 35d:	8d 76 00             	lea    0x0(%esi),%esi
 360:	83 c2 01             	add    $0x1,%edx
 363:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 367:	89 d0                	mov    %edx,%eax
 369:	75 f5                	jne    360 <strlen+0x10>
    ;
  return n;
}
 36b:	5d                   	pop    %ebp
 36c:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 36d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 36f:	5d                   	pop    %ebp
 370:	c3                   	ret    
 371:	eb 0d                	jmp    380 <memset>
 373:	90                   	nop
 374:	90                   	nop
 375:	90                   	nop
 376:	90                   	nop
 377:	90                   	nop
 378:	90                   	nop
 379:	90                   	nop
 37a:	90                   	nop
 37b:	90                   	nop
 37c:	90                   	nop
 37d:	90                   	nop
 37e:	90                   	nop
 37f:	90                   	nop

00000380 <memset>:

void*
memset(void *dst, int c, uint n)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	57                   	push   %edi
 384:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 387:	8b 4d 10             	mov    0x10(%ebp),%ecx
 38a:	8b 45 0c             	mov    0xc(%ebp),%eax
 38d:	89 d7                	mov    %edx,%edi
 38f:	fc                   	cld    
 390:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 392:	89 d0                	mov    %edx,%eax
 394:	5f                   	pop    %edi
 395:	5d                   	pop    %ebp
 396:	c3                   	ret    
 397:	89 f6                	mov    %esi,%esi
 399:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003a0 <strchr>:

char*
strchr(const char *s, char c)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	53                   	push   %ebx
 3a4:	8b 45 08             	mov    0x8(%ebp),%eax
 3a7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 3aa:	0f b6 10             	movzbl (%eax),%edx
 3ad:	84 d2                	test   %dl,%dl
 3af:	74 1d                	je     3ce <strchr+0x2e>
    if(*s == c)
 3b1:	38 d3                	cmp    %dl,%bl
 3b3:	89 d9                	mov    %ebx,%ecx
 3b5:	75 0d                	jne    3c4 <strchr+0x24>
 3b7:	eb 17                	jmp    3d0 <strchr+0x30>
 3b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3c0:	38 ca                	cmp    %cl,%dl
 3c2:	74 0c                	je     3d0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 3c4:	83 c0 01             	add    $0x1,%eax
 3c7:	0f b6 10             	movzbl (%eax),%edx
 3ca:	84 d2                	test   %dl,%dl
 3cc:	75 f2                	jne    3c0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 3ce:	31 c0                	xor    %eax,%eax
}
 3d0:	5b                   	pop    %ebx
 3d1:	5d                   	pop    %ebp
 3d2:	c3                   	ret    
 3d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 3d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003e0 <gets>:

char*
gets(char *buf, int max)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	57                   	push   %edi
 3e4:	56                   	push   %esi
 3e5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3e6:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 3e8:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 3eb:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3ee:	eb 29                	jmp    419 <gets+0x39>
    cc = read(0, &c, 1);
 3f0:	83 ec 04             	sub    $0x4,%esp
 3f3:	6a 01                	push   $0x1
 3f5:	57                   	push   %edi
 3f6:	6a 00                	push   $0x0
 3f8:	e8 3d 01 00 00       	call   53a <read>
    if(cc < 1)
 3fd:	83 c4 10             	add    $0x10,%esp
 400:	85 c0                	test   %eax,%eax
 402:	7e 1d                	jle    421 <gets+0x41>
      break;
    buf[i++] = c;
 404:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 408:	8b 55 08             	mov    0x8(%ebp),%edx
 40b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 40d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 40f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 413:	74 1b                	je     430 <gets+0x50>
 415:	3c 0d                	cmp    $0xd,%al
 417:	74 17                	je     430 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 419:	8d 5e 01             	lea    0x1(%esi),%ebx
 41c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 41f:	7c cf                	jl     3f0 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 421:	8b 45 08             	mov    0x8(%ebp),%eax
 424:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 428:	8d 65 f4             	lea    -0xc(%ebp),%esp
 42b:	5b                   	pop    %ebx
 42c:	5e                   	pop    %esi
 42d:	5f                   	pop    %edi
 42e:	5d                   	pop    %ebp
 42f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 430:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 433:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 435:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 439:	8d 65 f4             	lea    -0xc(%ebp),%esp
 43c:	5b                   	pop    %ebx
 43d:	5e                   	pop    %esi
 43e:	5f                   	pop    %edi
 43f:	5d                   	pop    %ebp
 440:	c3                   	ret    
 441:	eb 0d                	jmp    450 <stat>
 443:	90                   	nop
 444:	90                   	nop
 445:	90                   	nop
 446:	90                   	nop
 447:	90                   	nop
 448:	90                   	nop
 449:	90                   	nop
 44a:	90                   	nop
 44b:	90                   	nop
 44c:	90                   	nop
 44d:	90                   	nop
 44e:	90                   	nop
 44f:	90                   	nop

00000450 <stat>:

int
stat(const char *n, struct stat *st)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	56                   	push   %esi
 454:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 455:	83 ec 08             	sub    $0x8,%esp
 458:	6a 00                	push   $0x0
 45a:	ff 75 08             	pushl  0x8(%ebp)
 45d:	e8 00 01 00 00       	call   562 <open>
  if(fd < 0)
 462:	83 c4 10             	add    $0x10,%esp
 465:	85 c0                	test   %eax,%eax
 467:	78 27                	js     490 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 469:	83 ec 08             	sub    $0x8,%esp
 46c:	ff 75 0c             	pushl  0xc(%ebp)
 46f:	89 c3                	mov    %eax,%ebx
 471:	50                   	push   %eax
 472:	e8 03 01 00 00       	call   57a <fstat>
 477:	89 c6                	mov    %eax,%esi
  close(fd);
 479:	89 1c 24             	mov    %ebx,(%esp)
 47c:	e8 c9 00 00 00       	call   54a <close>
  return r;
 481:	83 c4 10             	add    $0x10,%esp
 484:	89 f0                	mov    %esi,%eax
}
 486:	8d 65 f8             	lea    -0x8(%ebp),%esp
 489:	5b                   	pop    %ebx
 48a:	5e                   	pop    %esi
 48b:	5d                   	pop    %ebp
 48c:	c3                   	ret    
 48d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 490:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 495:	eb ef                	jmp    486 <stat+0x36>
 497:	89 f6                	mov    %esi,%esi
 499:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004a0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	53                   	push   %ebx
 4a4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 4a7:	0f be 11             	movsbl (%ecx),%edx
 4aa:	8d 42 d0             	lea    -0x30(%edx),%eax
 4ad:	3c 09                	cmp    $0x9,%al
 4af:	b8 00 00 00 00       	mov    $0x0,%eax
 4b4:	77 1f                	ja     4d5 <atoi+0x35>
 4b6:	8d 76 00             	lea    0x0(%esi),%esi
 4b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 4c0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 4c3:	83 c1 01             	add    $0x1,%ecx
 4c6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 4ca:	0f be 11             	movsbl (%ecx),%edx
 4cd:	8d 5a d0             	lea    -0x30(%edx),%ebx
 4d0:	80 fb 09             	cmp    $0x9,%bl
 4d3:	76 eb                	jbe    4c0 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 4d5:	5b                   	pop    %ebx
 4d6:	5d                   	pop    %ebp
 4d7:	c3                   	ret    
 4d8:	90                   	nop
 4d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000004e0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	56                   	push   %esi
 4e4:	53                   	push   %ebx
 4e5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4e8:	8b 45 08             	mov    0x8(%ebp),%eax
 4eb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4ee:	85 db                	test   %ebx,%ebx
 4f0:	7e 14                	jle    506 <memmove+0x26>
 4f2:	31 d2                	xor    %edx,%edx
 4f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 4f8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 4fc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 4ff:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 502:	39 da                	cmp    %ebx,%edx
 504:	75 f2                	jne    4f8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 506:	5b                   	pop    %ebx
 507:	5e                   	pop    %esi
 508:	5d                   	pop    %ebp
 509:	c3                   	ret    

0000050a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 50a:	b8 01 00 00 00       	mov    $0x1,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    

00000512 <exit>:
SYSCALL(exit)
 512:	b8 02 00 00 00       	mov    $0x2,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret    

0000051a <wait>:
SYSCALL(wait)
 51a:	b8 03 00 00 00       	mov    $0x3,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret    

00000522 <waitpid>:
SYSCALL(waitpid)
 522:	b8 16 00 00 00       	mov    $0x16,%eax
 527:	cd 40                	int    $0x40
 529:	c3                   	ret    

0000052a <priority>:
SYSCALL(priority)
 52a:	b8 17 00 00 00       	mov    $0x17,%eax
 52f:	cd 40                	int    $0x40
 531:	c3                   	ret    

00000532 <pipe>:
SYSCALL(pipe)
 532:	b8 04 00 00 00       	mov    $0x4,%eax
 537:	cd 40                	int    $0x40
 539:	c3                   	ret    

0000053a <read>:
SYSCALL(read)
 53a:	b8 05 00 00 00       	mov    $0x5,%eax
 53f:	cd 40                	int    $0x40
 541:	c3                   	ret    

00000542 <write>:
SYSCALL(write)
 542:	b8 10 00 00 00       	mov    $0x10,%eax
 547:	cd 40                	int    $0x40
 549:	c3                   	ret    

0000054a <close>:
SYSCALL(close)
 54a:	b8 15 00 00 00       	mov    $0x15,%eax
 54f:	cd 40                	int    $0x40
 551:	c3                   	ret    

00000552 <kill>:
SYSCALL(kill)
 552:	b8 06 00 00 00       	mov    $0x6,%eax
 557:	cd 40                	int    $0x40
 559:	c3                   	ret    

0000055a <exec>:
SYSCALL(exec)
 55a:	b8 07 00 00 00       	mov    $0x7,%eax
 55f:	cd 40                	int    $0x40
 561:	c3                   	ret    

00000562 <open>:
SYSCALL(open)
 562:	b8 0f 00 00 00       	mov    $0xf,%eax
 567:	cd 40                	int    $0x40
 569:	c3                   	ret    

0000056a <mknod>:
SYSCALL(mknod)
 56a:	b8 11 00 00 00       	mov    $0x11,%eax
 56f:	cd 40                	int    $0x40
 571:	c3                   	ret    

00000572 <unlink>:
SYSCALL(unlink)
 572:	b8 12 00 00 00       	mov    $0x12,%eax
 577:	cd 40                	int    $0x40
 579:	c3                   	ret    

0000057a <fstat>:
SYSCALL(fstat)
 57a:	b8 08 00 00 00       	mov    $0x8,%eax
 57f:	cd 40                	int    $0x40
 581:	c3                   	ret    

00000582 <link>:
SYSCALL(link)
 582:	b8 13 00 00 00       	mov    $0x13,%eax
 587:	cd 40                	int    $0x40
 589:	c3                   	ret    

0000058a <mkdir>:
SYSCALL(mkdir)
 58a:	b8 14 00 00 00       	mov    $0x14,%eax
 58f:	cd 40                	int    $0x40
 591:	c3                   	ret    

00000592 <chdir>:
SYSCALL(chdir)
 592:	b8 09 00 00 00       	mov    $0x9,%eax
 597:	cd 40                	int    $0x40
 599:	c3                   	ret    

0000059a <dup>:
SYSCALL(dup)
 59a:	b8 0a 00 00 00       	mov    $0xa,%eax
 59f:	cd 40                	int    $0x40
 5a1:	c3                   	ret    

000005a2 <getpid>:
SYSCALL(getpid)
 5a2:	b8 0b 00 00 00       	mov    $0xb,%eax
 5a7:	cd 40                	int    $0x40
 5a9:	c3                   	ret    

000005aa <sbrk>:
SYSCALL(sbrk)
 5aa:	b8 0c 00 00 00       	mov    $0xc,%eax
 5af:	cd 40                	int    $0x40
 5b1:	c3                   	ret    

000005b2 <sleep>:
SYSCALL(sleep)
 5b2:	b8 0d 00 00 00       	mov    $0xd,%eax
 5b7:	cd 40                	int    $0x40
 5b9:	c3                   	ret    

000005ba <uptime>:
SYSCALL(uptime)
 5ba:	b8 0e 00 00 00       	mov    $0xe,%eax
 5bf:	cd 40                	int    $0x40
 5c1:	c3                   	ret    
 5c2:	66 90                	xchg   %ax,%ax
 5c4:	66 90                	xchg   %ax,%ax
 5c6:	66 90                	xchg   %ax,%ax
 5c8:	66 90                	xchg   %ax,%ax
 5ca:	66 90                	xchg   %ax,%ax
 5cc:	66 90                	xchg   %ax,%ax
 5ce:	66 90                	xchg   %ax,%ax

000005d0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 5d0:	55                   	push   %ebp
 5d1:	89 e5                	mov    %esp,%ebp
 5d3:	57                   	push   %edi
 5d4:	56                   	push   %esi
 5d5:	53                   	push   %ebx
 5d6:	89 c6                	mov    %eax,%esi
 5d8:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5db:	8b 5d 08             	mov    0x8(%ebp),%ebx
 5de:	85 db                	test   %ebx,%ebx
 5e0:	74 7e                	je     660 <printint+0x90>
 5e2:	89 d0                	mov    %edx,%eax
 5e4:	c1 e8 1f             	shr    $0x1f,%eax
 5e7:	84 c0                	test   %al,%al
 5e9:	74 75                	je     660 <printint+0x90>
    neg = 1;
    x = -xx;
 5eb:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 5ed:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 5f4:	f7 d8                	neg    %eax
 5f6:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5f9:	31 ff                	xor    %edi,%edi
 5fb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 5fe:	89 ce                	mov    %ecx,%esi
 600:	eb 08                	jmp    60a <printint+0x3a>
 602:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 608:	89 cf                	mov    %ecx,%edi
 60a:	31 d2                	xor    %edx,%edx
 60c:	8d 4f 01             	lea    0x1(%edi),%ecx
 60f:	f7 f6                	div    %esi
 611:	0f b6 92 d0 0b 00 00 	movzbl 0xbd0(%edx),%edx
  }while((x /= base) != 0);
 618:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 61a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 61d:	75 e9                	jne    608 <printint+0x38>
  if(neg)
 61f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 622:	8b 75 c0             	mov    -0x40(%ebp),%esi
 625:	85 c0                	test   %eax,%eax
 627:	74 08                	je     631 <printint+0x61>
    buf[i++] = '-';
 629:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 62e:	8d 4f 02             	lea    0x2(%edi),%ecx
 631:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
 635:	8d 76 00             	lea    0x0(%esi),%esi
 638:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 63b:	83 ec 04             	sub    $0x4,%esp
 63e:	83 ef 01             	sub    $0x1,%edi
 641:	6a 01                	push   $0x1
 643:	53                   	push   %ebx
 644:	56                   	push   %esi
 645:	88 45 d7             	mov    %al,-0x29(%ebp)
 648:	e8 f5 fe ff ff       	call   542 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 64d:	83 c4 10             	add    $0x10,%esp
 650:	39 df                	cmp    %ebx,%edi
 652:	75 e4                	jne    638 <printint+0x68>
    putc(fd, buf[i]);
}
 654:	8d 65 f4             	lea    -0xc(%ebp),%esp
 657:	5b                   	pop    %ebx
 658:	5e                   	pop    %esi
 659:	5f                   	pop    %edi
 65a:	5d                   	pop    %ebp
 65b:	c3                   	ret    
 65c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 660:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 662:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 669:	eb 8b                	jmp    5f6 <printint+0x26>
 66b:	90                   	nop
 66c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000670 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 670:	55                   	push   %ebp
 671:	89 e5                	mov    %esp,%ebp
 673:	57                   	push   %edi
 674:	56                   	push   %esi
 675:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 676:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 679:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 67c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 67f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 682:	89 45 d0             	mov    %eax,-0x30(%ebp)
 685:	0f b6 1e             	movzbl (%esi),%ebx
 688:	83 c6 01             	add    $0x1,%esi
 68b:	84 db                	test   %bl,%bl
 68d:	0f 84 b0 00 00 00    	je     743 <printf+0xd3>
 693:	31 d2                	xor    %edx,%edx
 695:	eb 39                	jmp    6d0 <printf+0x60>
 697:	89 f6                	mov    %esi,%esi
 699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 6a0:	83 f8 25             	cmp    $0x25,%eax
 6a3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 6a6:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 6ab:	74 18                	je     6c5 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 6ad:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 6b0:	83 ec 04             	sub    $0x4,%esp
 6b3:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 6b6:	6a 01                	push   $0x1
 6b8:	50                   	push   %eax
 6b9:	57                   	push   %edi
 6ba:	e8 83 fe ff ff       	call   542 <write>
 6bf:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 6c2:	83 c4 10             	add    $0x10,%esp
 6c5:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6c8:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 6cc:	84 db                	test   %bl,%bl
 6ce:	74 73                	je     743 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
 6d0:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 6d2:	0f be cb             	movsbl %bl,%ecx
 6d5:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 6d8:	74 c6                	je     6a0 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 6da:	83 fa 25             	cmp    $0x25,%edx
 6dd:	75 e6                	jne    6c5 <printf+0x55>
      if(c == 'd'){
 6df:	83 f8 64             	cmp    $0x64,%eax
 6e2:	0f 84 f8 00 00 00    	je     7e0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 6e8:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 6ee:	83 f9 70             	cmp    $0x70,%ecx
 6f1:	74 5d                	je     750 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 6f3:	83 f8 73             	cmp    $0x73,%eax
 6f6:	0f 84 84 00 00 00    	je     780 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6fc:	83 f8 63             	cmp    $0x63,%eax
 6ff:	0f 84 ea 00 00 00    	je     7ef <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 705:	83 f8 25             	cmp    $0x25,%eax
 708:	0f 84 c2 00 00 00    	je     7d0 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 70e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 711:	83 ec 04             	sub    $0x4,%esp
 714:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 718:	6a 01                	push   $0x1
 71a:	50                   	push   %eax
 71b:	57                   	push   %edi
 71c:	e8 21 fe ff ff       	call   542 <write>
 721:	83 c4 0c             	add    $0xc,%esp
 724:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 727:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 72a:	6a 01                	push   $0x1
 72c:	50                   	push   %eax
 72d:	57                   	push   %edi
 72e:	83 c6 01             	add    $0x1,%esi
 731:	e8 0c fe ff ff       	call   542 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 736:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 73a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 73d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 73f:	84 db                	test   %bl,%bl
 741:	75 8d                	jne    6d0 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 743:	8d 65 f4             	lea    -0xc(%ebp),%esp
 746:	5b                   	pop    %ebx
 747:	5e                   	pop    %esi
 748:	5f                   	pop    %edi
 749:	5d                   	pop    %ebp
 74a:	c3                   	ret    
 74b:	90                   	nop
 74c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 750:	83 ec 0c             	sub    $0xc,%esp
 753:	b9 10 00 00 00       	mov    $0x10,%ecx
 758:	6a 00                	push   $0x0
 75a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 75d:	89 f8                	mov    %edi,%eax
 75f:	8b 13                	mov    (%ebx),%edx
 761:	e8 6a fe ff ff       	call   5d0 <printint>
        ap++;
 766:	89 d8                	mov    %ebx,%eax
 768:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 76b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 76d:	83 c0 04             	add    $0x4,%eax
 770:	89 45 d0             	mov    %eax,-0x30(%ebp)
 773:	e9 4d ff ff ff       	jmp    6c5 <printf+0x55>
 778:	90                   	nop
 779:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 780:	8b 45 d0             	mov    -0x30(%ebp),%eax
 783:	8b 18                	mov    (%eax),%ebx
        ap++;
 785:	83 c0 04             	add    $0x4,%eax
 788:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
 78b:	b8 c7 0b 00 00       	mov    $0xbc7,%eax
 790:	85 db                	test   %ebx,%ebx
 792:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
 795:	0f b6 03             	movzbl (%ebx),%eax
 798:	84 c0                	test   %al,%al
 79a:	74 23                	je     7bf <printf+0x14f>
 79c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7a0:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 7a3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 7a6:	83 ec 04             	sub    $0x4,%esp
 7a9:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 7ab:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 7ae:	50                   	push   %eax
 7af:	57                   	push   %edi
 7b0:	e8 8d fd ff ff       	call   542 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 7b5:	0f b6 03             	movzbl (%ebx),%eax
 7b8:	83 c4 10             	add    $0x10,%esp
 7bb:	84 c0                	test   %al,%al
 7bd:	75 e1                	jne    7a0 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7bf:	31 d2                	xor    %edx,%edx
 7c1:	e9 ff fe ff ff       	jmp    6c5 <printf+0x55>
 7c6:	8d 76 00             	lea    0x0(%esi),%esi
 7c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 7d0:	83 ec 04             	sub    $0x4,%esp
 7d3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 7d6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 7d9:	6a 01                	push   $0x1
 7db:	e9 4c ff ff ff       	jmp    72c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 7e0:	83 ec 0c             	sub    $0xc,%esp
 7e3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7e8:	6a 01                	push   $0x1
 7ea:	e9 6b ff ff ff       	jmp    75a <printf+0xea>
 7ef:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 7f2:	83 ec 04             	sub    $0x4,%esp
 7f5:	8b 03                	mov    (%ebx),%eax
 7f7:	6a 01                	push   $0x1
 7f9:	88 45 e4             	mov    %al,-0x1c(%ebp)
 7fc:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 7ff:	50                   	push   %eax
 800:	57                   	push   %edi
 801:	e8 3c fd ff ff       	call   542 <write>
 806:	e9 5b ff ff ff       	jmp    766 <printf+0xf6>
 80b:	66 90                	xchg   %ax,%ax
 80d:	66 90                	xchg   %ax,%ax
 80f:	90                   	nop

00000810 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 810:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 811:	a1 c4 0e 00 00       	mov    0xec4,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 816:	89 e5                	mov    %esp,%ebp
 818:	57                   	push   %edi
 819:	56                   	push   %esi
 81a:	53                   	push   %ebx
 81b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 81e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 820:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 823:	39 c8                	cmp    %ecx,%eax
 825:	73 19                	jae    840 <free+0x30>
 827:	89 f6                	mov    %esi,%esi
 829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 830:	39 d1                	cmp    %edx,%ecx
 832:	72 1c                	jb     850 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 834:	39 d0                	cmp    %edx,%eax
 836:	73 18                	jae    850 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 838:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 83a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 83c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 83e:	72 f0                	jb     830 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 840:	39 d0                	cmp    %edx,%eax
 842:	72 f4                	jb     838 <free+0x28>
 844:	39 d1                	cmp    %edx,%ecx
 846:	73 f0                	jae    838 <free+0x28>
 848:	90                   	nop
 849:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 850:	8b 73 fc             	mov    -0x4(%ebx),%esi
 853:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 856:	39 d7                	cmp    %edx,%edi
 858:	74 19                	je     873 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 85a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 85d:	8b 50 04             	mov    0x4(%eax),%edx
 860:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 863:	39 f1                	cmp    %esi,%ecx
 865:	74 23                	je     88a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 867:	89 08                	mov    %ecx,(%eax)
  freep = p;
 869:	a3 c4 0e 00 00       	mov    %eax,0xec4
}
 86e:	5b                   	pop    %ebx
 86f:	5e                   	pop    %esi
 870:	5f                   	pop    %edi
 871:	5d                   	pop    %ebp
 872:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 873:	03 72 04             	add    0x4(%edx),%esi
 876:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 879:	8b 10                	mov    (%eax),%edx
 87b:	8b 12                	mov    (%edx),%edx
 87d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 880:	8b 50 04             	mov    0x4(%eax),%edx
 883:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 886:	39 f1                	cmp    %esi,%ecx
 888:	75 dd                	jne    867 <free+0x57>
    p->s.size += bp->s.size;
 88a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 88d:	a3 c4 0e 00 00       	mov    %eax,0xec4
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 892:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 895:	8b 53 f8             	mov    -0x8(%ebx),%edx
 898:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 89a:	5b                   	pop    %ebx
 89b:	5e                   	pop    %esi
 89c:	5f                   	pop    %edi
 89d:	5d                   	pop    %ebp
 89e:	c3                   	ret    
 89f:	90                   	nop

000008a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8a0:	55                   	push   %ebp
 8a1:	89 e5                	mov    %esp,%ebp
 8a3:	57                   	push   %edi
 8a4:	56                   	push   %esi
 8a5:	53                   	push   %ebx
 8a6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8a9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 8ac:	8b 15 c4 0e 00 00    	mov    0xec4,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8b2:	8d 78 07             	lea    0x7(%eax),%edi
 8b5:	c1 ef 03             	shr    $0x3,%edi
 8b8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 8bb:	85 d2                	test   %edx,%edx
 8bd:	0f 84 a3 00 00 00    	je     966 <malloc+0xc6>
 8c3:	8b 02                	mov    (%edx),%eax
 8c5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 8c8:	39 cf                	cmp    %ecx,%edi
 8ca:	76 74                	jbe    940 <malloc+0xa0>
 8cc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 8d2:	be 00 10 00 00       	mov    $0x1000,%esi
 8d7:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 8de:	0f 43 f7             	cmovae %edi,%esi
 8e1:	ba 00 80 00 00       	mov    $0x8000,%edx
 8e6:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 8ec:	0f 46 da             	cmovbe %edx,%ebx
 8ef:	eb 10                	jmp    901 <malloc+0x61>
 8f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8f8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 8fa:	8b 48 04             	mov    0x4(%eax),%ecx
 8fd:	39 cf                	cmp    %ecx,%edi
 8ff:	76 3f                	jbe    940 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 901:	39 05 c4 0e 00 00    	cmp    %eax,0xec4
 907:	89 c2                	mov    %eax,%edx
 909:	75 ed                	jne    8f8 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 90b:	83 ec 0c             	sub    $0xc,%esp
 90e:	53                   	push   %ebx
 90f:	e8 96 fc ff ff       	call   5aa <sbrk>
  if(p == (char*)-1)
 914:	83 c4 10             	add    $0x10,%esp
 917:	83 f8 ff             	cmp    $0xffffffff,%eax
 91a:	74 1c                	je     938 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 91c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 91f:	83 ec 0c             	sub    $0xc,%esp
 922:	83 c0 08             	add    $0x8,%eax
 925:	50                   	push   %eax
 926:	e8 e5 fe ff ff       	call   810 <free>
  return freep;
 92b:	8b 15 c4 0e 00 00    	mov    0xec4,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 931:	83 c4 10             	add    $0x10,%esp
 934:	85 d2                	test   %edx,%edx
 936:	75 c0                	jne    8f8 <malloc+0x58>
        return 0;
 938:	31 c0                	xor    %eax,%eax
 93a:	eb 1c                	jmp    958 <malloc+0xb8>
 93c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 940:	39 cf                	cmp    %ecx,%edi
 942:	74 1c                	je     960 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 944:	29 f9                	sub    %edi,%ecx
 946:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 949:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 94c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 94f:	89 15 c4 0e 00 00    	mov    %edx,0xec4
      return (void*)(p + 1);
 955:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 958:	8d 65 f4             	lea    -0xc(%ebp),%esp
 95b:	5b                   	pop    %ebx
 95c:	5e                   	pop    %esi
 95d:	5f                   	pop    %edi
 95e:	5d                   	pop    %ebp
 95f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 960:	8b 08                	mov    (%eax),%ecx
 962:	89 0a                	mov    %ecx,(%edx)
 964:	eb e9                	jmp    94f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 966:	c7 05 c4 0e 00 00 c8 	movl   $0xec8,0xec4
 96d:	0e 00 00 
 970:	c7 05 c8 0e 00 00 c8 	movl   $0xec8,0xec8
 977:	0e 00 00 
    base.s.size = 0;
 97a:	b8 c8 0e 00 00       	mov    $0xec8,%eax
 97f:	c7 05 cc 0e 00 00 00 	movl   $0x0,0xecc
 986:	00 00 00 
 989:	e9 3e ff ff ff       	jmp    8cc <malloc+0x2c>
