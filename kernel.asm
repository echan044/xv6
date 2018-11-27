
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:

# Entering xv6 on boot processor, with paging off.
.globl entry
entry:
  # Turn on page size extension for 4Mbyte pages
  movl    %cr4, %eax
8010000c:	0f 20 e0             	mov    %cr4,%eax
  orl     $(CR4_PSE), %eax
8010000f:	83 c8 10             	or     $0x10,%eax
  movl    %eax, %cr4
80100012:	0f 22 e0             	mov    %eax,%cr4
  # Set page directory
  movl    $(V2P_WO(entrypgdir)), %eax
80100015:	b8 00 90 10 00       	mov    $0x109000,%eax
  movl    %eax, %cr3
8010001a:	0f 22 d8             	mov    %eax,%cr3
  # Turn on paging.
  movl    %cr0, %eax
8010001d:	0f 20 c0             	mov    %cr0,%eax
  orl     $(CR0_PG|CR0_WP), %eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
  movl    %eax, %cr0
80100025:	0f 22 c0             	mov    %eax,%cr0

  # Set up the stack pointer.
  movl $(stack + KSTACKSIZE), %esp
80100028:	bc c0 b5 10 80       	mov    $0x8010b5c0,%esp

  # Jump to main(), and switch to executing at
  # high addresses. The indirect call is needed because
  # the assembler produces a PC-relative instruction
  # for a direct jump.
  mov $main, %eax
8010002d:	b8 80 2e 10 80       	mov    $0x80102e80,%eax
  jmp *%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
80100044:	bb f4 b5 10 80       	mov    $0x8010b5f4,%ebx
  struct buf head;
} bcache;

void
binit(void)
{
80100049:	83 ec 0c             	sub    $0xc,%esp
  struct buf *b;

  initlock(&bcache.lock, "bcache");
8010004c:	68 e0 70 10 80       	push   $0x801070e0
80100051:	68 c0 b5 10 80       	push   $0x8010b5c0
80100056:	e8 65 41 00 00       	call   801041c0 <initlock>

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
8010005b:	c7 05 0c fd 10 80 bc 	movl   $0x8010fcbc,0x8010fd0c
80100062:	fc 10 80 
  bcache.head.next = &bcache.head;
80100065:	c7 05 10 fd 10 80 bc 	movl   $0x8010fcbc,0x8010fd10
8010006c:	fc 10 80 
8010006f:	83 c4 10             	add    $0x10,%esp
80100072:	ba bc fc 10 80       	mov    $0x8010fcbc,%edx
80100077:	eb 09                	jmp    80100082 <binit+0x42>
80100079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 c3                	mov    %eax,%ebx
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    b->next = bcache.head.next;
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
80100082:	8d 43 0c             	lea    0xc(%ebx),%eax
80100085:	83 ec 08             	sub    $0x8,%esp
//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    b->next = bcache.head.next;
80100088:	89 53 54             	mov    %edx,0x54(%ebx)
    b->prev = &bcache.head;
8010008b:	c7 43 50 bc fc 10 80 	movl   $0x8010fcbc,0x50(%ebx)
    initsleeplock(&b->lock, "buffer");
80100092:	68 e7 70 10 80       	push   $0x801070e7
80100097:	50                   	push   %eax
80100098:	e8 13 40 00 00       	call   801040b0 <initsleeplock>
    bcache.head.next->prev = b;
8010009d:	a1 10 fd 10 80       	mov    0x8010fd10,%eax

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000a2:	83 c4 10             	add    $0x10,%esp
801000a5:	89 da                	mov    %ebx,%edx
    b->next = bcache.head.next;
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
    bcache.head.next->prev = b;
801000a7:	89 58 50             	mov    %ebx,0x50(%eax)

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000aa:	8d 83 5c 02 00 00    	lea    0x25c(%ebx),%eax
    b->next = bcache.head.next;
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
    bcache.head.next->prev = b;
    bcache.head.next = b;
801000b0:	89 1d 10 fd 10 80    	mov    %ebx,0x8010fd10

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000b6:	3d bc fc 10 80       	cmp    $0x8010fcbc,%eax
801000bb:	75 c3                	jne    80100080 <binit+0x40>
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
    bcache.head.next->prev = b;
    bcache.head.next = b;
  }
}
801000bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000c0:	c9                   	leave  
801000c1:	c3                   	ret    
801000c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801000d0 <bread>:
}

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 18             	sub    $0x18,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
801000dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
static struct buf*
bget(uint dev, uint blockno)
{
  struct buf *b;

  acquire(&bcache.lock);
801000df:	68 c0 b5 10 80       	push   $0x8010b5c0
801000e4:	e8 d7 41 00 00       	call   801042c0 <acquire>

  // Is the block already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
801000e9:	8b 1d 10 fd 10 80    	mov    0x8010fd10,%ebx
801000ef:	83 c4 10             	add    $0x10,%esp
801000f2:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
801000f8:	75 11                	jne    8010010b <bread+0x3b>
801000fa:	eb 24                	jmp    80100120 <bread+0x50>
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
    if(b->dev == dev && b->blockno == blockno){
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
      b->refcnt++;
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	90                   	nop
8010011c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }

  // Not cached; recycle an unused buffer.
  // Even if refcnt==0, B_DIRTY indicates a buffer is in use
  // because log.c has modified it but not yet committed it.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
80100120:	8b 1d 0c fd 10 80    	mov    0x8010fd0c,%ebx
80100126:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 60                	jmp    80100190 <bread+0xc0>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
80100139:	74 55                	je     80100190 <bread+0xc0>
    if(b->refcnt == 0 && (b->flags & B_DIRTY) == 0) {
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
      b->dev = dev;
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
      b->blockno = blockno;
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
      b->flags = 0;
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
      b->refcnt = 1;
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
      release(&bcache.lock);
8010015a:	83 ec 0c             	sub    $0xc,%esp
8010015d:	68 c0 b5 10 80       	push   $0x8010b5c0
80100162:	e8 79 42 00 00       	call   801043e0 <release>
      acquiresleep(&b->lock);
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 7e 3f 00 00       	call   801040f0 <acquiresleep>
80100172:	83 c4 10             	add    $0x10,%esp
bread(uint dev, uint blockno)
{
  struct buf *b;

  b = bget(dev, blockno);
  if((b->flags & B_VALID) == 0) {
80100175:	f6 03 02             	testb  $0x2,(%ebx)
80100178:	75 0c                	jne    80100186 <bread+0xb6>
    iderw(b);
8010017a:	83 ec 0c             	sub    $0xc,%esp
8010017d:	53                   	push   %ebx
8010017e:	e8 8d 1f 00 00       	call   80102110 <iderw>
80100183:	83 c4 10             	add    $0x10,%esp
  }
  return b;
}
80100186:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100189:	89 d8                	mov    %ebx,%eax
8010018b:	5b                   	pop    %ebx
8010018c:	5e                   	pop    %esi
8010018d:	5f                   	pop    %edi
8010018e:	5d                   	pop    %ebp
8010018f:	c3                   	ret    
      release(&bcache.lock);
      acquiresleep(&b->lock);
      return b;
    }
  }
  panic("bget: no buffers");
80100190:	83 ec 0c             	sub    $0xc,%esp
80100193:	68 ee 70 10 80       	push   $0x801070ee
80100198:	e8 d3 01 00 00       	call   80100370 <panic>
8010019d:	8d 76 00             	lea    0x0(%esi),%esi

801001a0 <bwrite>:
}

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
801001a0:	55                   	push   %ebp
801001a1:	89 e5                	mov    %esp,%ebp
801001a3:	53                   	push   %ebx
801001a4:	83 ec 10             	sub    $0x10,%esp
801001a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001aa:	8d 43 0c             	lea    0xc(%ebx),%eax
801001ad:	50                   	push   %eax
801001ae:	e8 dd 3f 00 00       	call   80104190 <holdingsleep>
801001b3:	83 c4 10             	add    $0x10,%esp
801001b6:	85 c0                	test   %eax,%eax
801001b8:	74 0f                	je     801001c9 <bwrite+0x29>
    panic("bwrite");
  b->flags |= B_DIRTY;
801001ba:	83 0b 04             	orl    $0x4,(%ebx)
  iderw(b);
801001bd:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801001c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001c3:	c9                   	leave  
bwrite(struct buf *b)
{
  if(!holdingsleep(&b->lock))
    panic("bwrite");
  b->flags |= B_DIRTY;
  iderw(b);
801001c4:	e9 47 1f 00 00       	jmp    80102110 <iderw>
// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
  if(!holdingsleep(&b->lock))
    panic("bwrite");
801001c9:	83 ec 0c             	sub    $0xc,%esp
801001cc:	68 ff 70 10 80       	push   $0x801070ff
801001d1:	e8 9a 01 00 00       	call   80100370 <panic>
801001d6:	8d 76 00             	lea    0x0(%esi),%esi
801001d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801001e0 <brelse>:

// Release a locked buffer.
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
801001e0:	55                   	push   %ebp
801001e1:	89 e5                	mov    %esp,%ebp
801001e3:	56                   	push   %esi
801001e4:	53                   	push   %ebx
801001e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001e8:	83 ec 0c             	sub    $0xc,%esp
801001eb:	8d 73 0c             	lea    0xc(%ebx),%esi
801001ee:	56                   	push   %esi
801001ef:	e8 9c 3f 00 00       	call   80104190 <holdingsleep>
801001f4:	83 c4 10             	add    $0x10,%esp
801001f7:	85 c0                	test   %eax,%eax
801001f9:	74 66                	je     80100261 <brelse+0x81>
    panic("brelse");

  releasesleep(&b->lock);
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 4c 3f 00 00       	call   80104150 <releasesleep>

  acquire(&bcache.lock);
80100204:	c7 04 24 c0 b5 10 80 	movl   $0x8010b5c0,(%esp)
8010020b:	e8 b0 40 00 00       	call   801042c0 <acquire>
  b->refcnt--;
80100210:	8b 43 4c             	mov    0x4c(%ebx),%eax
  if (b->refcnt == 0) {
80100213:	83 c4 10             	add    $0x10,%esp
    panic("brelse");

  releasesleep(&b->lock);

  acquire(&bcache.lock);
  b->refcnt--;
80100216:	83 e8 01             	sub    $0x1,%eax
  if (b->refcnt == 0) {
80100219:	85 c0                	test   %eax,%eax
    panic("brelse");

  releasesleep(&b->lock);

  acquire(&bcache.lock);
  b->refcnt--;
8010021b:	89 43 4c             	mov    %eax,0x4c(%ebx)
  if (b->refcnt == 0) {
8010021e:	75 2f                	jne    8010024f <brelse+0x6f>
    // no one is waiting for it.
    b->next->prev = b->prev;
80100220:	8b 43 54             	mov    0x54(%ebx),%eax
80100223:	8b 53 50             	mov    0x50(%ebx),%edx
80100226:	89 50 50             	mov    %edx,0x50(%eax)
    b->prev->next = b->next;
80100229:	8b 43 50             	mov    0x50(%ebx),%eax
8010022c:	8b 53 54             	mov    0x54(%ebx),%edx
8010022f:	89 50 54             	mov    %edx,0x54(%eax)
    b->next = bcache.head.next;
80100232:	a1 10 fd 10 80       	mov    0x8010fd10,%eax
    b->prev = &bcache.head;
80100237:	c7 43 50 bc fc 10 80 	movl   $0x8010fcbc,0x50(%ebx)
  b->refcnt--;
  if (b->refcnt == 0) {
    // no one is waiting for it.
    b->next->prev = b->prev;
    b->prev->next = b->next;
    b->next = bcache.head.next;
8010023e:	89 43 54             	mov    %eax,0x54(%ebx)
    b->prev = &bcache.head;
    bcache.head.next->prev = b;
80100241:	a1 10 fd 10 80       	mov    0x8010fd10,%eax
80100246:	89 58 50             	mov    %ebx,0x50(%eax)
    bcache.head.next = b;
80100249:	89 1d 10 fd 10 80    	mov    %ebx,0x8010fd10
  }
  
  release(&bcache.lock);
8010024f:	c7 45 08 c0 b5 10 80 	movl   $0x8010b5c0,0x8(%ebp)
}
80100256:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100259:	5b                   	pop    %ebx
8010025a:	5e                   	pop    %esi
8010025b:	5d                   	pop    %ebp
    b->prev = &bcache.head;
    bcache.head.next->prev = b;
    bcache.head.next = b;
  }
  
  release(&bcache.lock);
8010025c:	e9 7f 41 00 00       	jmp    801043e0 <release>
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
  if(!holdingsleep(&b->lock))
    panic("brelse");
80100261:	83 ec 0c             	sub    $0xc,%esp
80100264:	68 06 71 10 80       	push   $0x80107106
80100269:	e8 02 01 00 00       	call   80100370 <panic>
8010026e:	66 90                	xchg   %ax,%ax

80100270 <consoleread>:
  }
}

int
consoleread(struct inode *ip, char *dst, int n)
{
80100270:	55                   	push   %ebp
80100271:	89 e5                	mov    %esp,%ebp
80100273:	57                   	push   %edi
80100274:	56                   	push   %esi
80100275:	53                   	push   %ebx
80100276:	83 ec 28             	sub    $0x28,%esp
80100279:	8b 7d 08             	mov    0x8(%ebp),%edi
8010027c:	8b 75 0c             	mov    0xc(%ebp),%esi
  uint target;
  int c;

  iunlock(ip);
8010027f:	57                   	push   %edi
80100280:	e8 eb 14 00 00       	call   80101770 <iunlock>
  target = n;
  acquire(&cons.lock);
80100285:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010028c:	e8 2f 40 00 00       	call   801042c0 <acquire>
  while(n > 0){
80100291:	8b 5d 10             	mov    0x10(%ebp),%ebx
80100294:	83 c4 10             	add    $0x10,%esp
80100297:	31 c0                	xor    %eax,%eax
80100299:	85 db                	test   %ebx,%ebx
8010029b:	0f 8e 9a 00 00 00    	jle    8010033b <consoleread+0xcb>
    while(input.r == input.w){
801002a1:	a1 a0 ff 10 80       	mov    0x8010ffa0,%eax
801002a6:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
801002ac:	74 24                	je     801002d2 <consoleread+0x62>
801002ae:	eb 58                	jmp    80100308 <consoleread+0x98>
      if(myproc()->killed){
        release(&cons.lock);
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
801002b0:	83 ec 08             	sub    $0x8,%esp
801002b3:	68 20 a5 10 80       	push   $0x8010a520
801002b8:	68 a0 ff 10 80       	push   $0x8010ffa0
801002bd:	e8 8e 3a 00 00       	call   80103d50 <sleep>

  iunlock(ip);
  target = n;
  acquire(&cons.lock);
  while(n > 0){
    while(input.r == input.w){
801002c2:	a1 a0 ff 10 80       	mov    0x8010ffa0,%eax
801002c7:	83 c4 10             	add    $0x10,%esp
801002ca:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
801002d0:	75 36                	jne    80100308 <consoleread+0x98>
      if(myproc()->killed){
801002d2:	e8 c9 34 00 00       	call   801037a0 <myproc>
801002d7:	8b 40 24             	mov    0x24(%eax),%eax
801002da:	85 c0                	test   %eax,%eax
801002dc:	74 d2                	je     801002b0 <consoleread+0x40>
        release(&cons.lock);
801002de:	83 ec 0c             	sub    $0xc,%esp
801002e1:	68 20 a5 10 80       	push   $0x8010a520
801002e6:	e8 f5 40 00 00       	call   801043e0 <release>
        ilock(ip);
801002eb:	89 3c 24             	mov    %edi,(%esp)
801002ee:	e8 9d 13 00 00       	call   80101690 <ilock>
        return -1;
801002f3:	83 c4 10             	add    $0x10,%esp
801002f6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  release(&cons.lock);
  ilock(ip);

  return target - n;
}
801002fb:	8d 65 f4             	lea    -0xc(%ebp),%esp
801002fe:	5b                   	pop    %ebx
801002ff:	5e                   	pop    %esi
80100300:	5f                   	pop    %edi
80100301:	5d                   	pop    %ebp
80100302:	c3                   	ret    
80100303:	90                   	nop
80100304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
    }
    c = input.buf[input.r++ % INPUT_BUF];
80100308:	8d 50 01             	lea    0x1(%eax),%edx
8010030b:	89 15 a0 ff 10 80    	mov    %edx,0x8010ffa0
80100311:	89 c2                	mov    %eax,%edx
80100313:	83 e2 7f             	and    $0x7f,%edx
80100316:	0f be 92 20 ff 10 80 	movsbl -0x7fef00e0(%edx),%edx
    if(c == C('D')){  // EOF
8010031d:	83 fa 04             	cmp    $0x4,%edx
80100320:	74 39                	je     8010035b <consoleread+0xeb>
        // caller gets a 0-byte result.
        input.r--;
      }
      break;
    }
    *dst++ = c;
80100322:	83 c6 01             	add    $0x1,%esi
    --n;
80100325:	83 eb 01             	sub    $0x1,%ebx
    if(c == '\n')
80100328:	83 fa 0a             	cmp    $0xa,%edx
        // caller gets a 0-byte result.
        input.r--;
      }
      break;
    }
    *dst++ = c;
8010032b:	88 56 ff             	mov    %dl,-0x1(%esi)
    --n;
    if(c == '\n')
8010032e:	74 35                	je     80100365 <consoleread+0xf5>
  int c;

  iunlock(ip);
  target = n;
  acquire(&cons.lock);
  while(n > 0){
80100330:	85 db                	test   %ebx,%ebx
80100332:	0f 85 69 ff ff ff    	jne    801002a1 <consoleread+0x31>
80100338:	8b 45 10             	mov    0x10(%ebp),%eax
    *dst++ = c;
    --n;
    if(c == '\n')
      break;
  }
  release(&cons.lock);
8010033b:	83 ec 0c             	sub    $0xc,%esp
8010033e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100341:	68 20 a5 10 80       	push   $0x8010a520
80100346:	e8 95 40 00 00       	call   801043e0 <release>
  ilock(ip);
8010034b:	89 3c 24             	mov    %edi,(%esp)
8010034e:	e8 3d 13 00 00       	call   80101690 <ilock>

  return target - n;
80100353:	83 c4 10             	add    $0x10,%esp
80100356:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100359:	eb a0                	jmp    801002fb <consoleread+0x8b>
      }
      sleep(&input.r, &cons.lock);
    }
    c = input.buf[input.r++ % INPUT_BUF];
    if(c == C('D')){  // EOF
      if(n < target){
8010035b:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010035e:	76 05                	jbe    80100365 <consoleread+0xf5>
        // Save ^D for next time, to make sure
        // caller gets a 0-byte result.
        input.r--;
80100360:	a3 a0 ff 10 80       	mov    %eax,0x8010ffa0
80100365:	8b 45 10             	mov    0x10(%ebp),%eax
80100368:	29 d8                	sub    %ebx,%eax
8010036a:	eb cf                	jmp    8010033b <consoleread+0xcb>
8010036c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100370 <panic>:
    release(&cons.lock);
}

void
panic(char *s)
{
80100370:	55                   	push   %ebp
80100371:	89 e5                	mov    %esp,%ebp
80100373:	56                   	push   %esi
80100374:	53                   	push   %ebx
80100375:	83 ec 30             	sub    $0x30,%esp
}

static inline void
cli(void)
{
  asm volatile("cli");
80100378:	fa                   	cli    
  int i;
  uint pcs[10];

  cli();
  cons.locking = 0;
80100379:	c7 05 54 a5 10 80 00 	movl   $0x0,0x8010a554
80100380:	00 00 00 
  // use lapiccpunum so that we can call panic from mycpu()
  cprintf("lapicid %d: panic: ", lapicid());
  cprintf(s);
  cprintf("\n");
  getcallerpcs(&s, pcs);
80100383:	8d 5d d0             	lea    -0x30(%ebp),%ebx
80100386:	8d 75 f8             	lea    -0x8(%ebp),%esi
  uint pcs[10];

  cli();
  cons.locking = 0;
  // use lapiccpunum so that we can call panic from mycpu()
  cprintf("lapicid %d: panic: ", lapicid());
80100389:	e8 82 23 00 00       	call   80102710 <lapicid>
8010038e:	83 ec 08             	sub    $0x8,%esp
80100391:	50                   	push   %eax
80100392:	68 0d 71 10 80       	push   $0x8010710d
80100397:	e8 c4 02 00 00       	call   80100660 <cprintf>
  cprintf(s);
8010039c:	58                   	pop    %eax
8010039d:	ff 75 08             	pushl  0x8(%ebp)
801003a0:	e8 bb 02 00 00       	call   80100660 <cprintf>
  cprintf("\n");
801003a5:	c7 04 24 a7 7a 10 80 	movl   $0x80107aa7,(%esp)
801003ac:	e8 af 02 00 00       	call   80100660 <cprintf>
  getcallerpcs(&s, pcs);
801003b1:	5a                   	pop    %edx
801003b2:	8d 45 08             	lea    0x8(%ebp),%eax
801003b5:	59                   	pop    %ecx
801003b6:	53                   	push   %ebx
801003b7:	50                   	push   %eax
801003b8:	e8 23 3e 00 00       	call   801041e0 <getcallerpcs>
801003bd:	83 c4 10             	add    $0x10,%esp
  for(i=0; i<10; i++)
    cprintf(" %p", pcs[i]);
801003c0:	83 ec 08             	sub    $0x8,%esp
801003c3:	ff 33                	pushl  (%ebx)
801003c5:	83 c3 04             	add    $0x4,%ebx
801003c8:	68 21 71 10 80       	push   $0x80107121
801003cd:	e8 8e 02 00 00       	call   80100660 <cprintf>
  // use lapiccpunum so that we can call panic from mycpu()
  cprintf("lapicid %d: panic: ", lapicid());
  cprintf(s);
  cprintf("\n");
  getcallerpcs(&s, pcs);
  for(i=0; i<10; i++)
801003d2:	83 c4 10             	add    $0x10,%esp
801003d5:	39 f3                	cmp    %esi,%ebx
801003d7:	75 e7                	jne    801003c0 <panic+0x50>
    cprintf(" %p", pcs[i]);
  panicked = 1; // freeze other CPU
801003d9:	c7 05 58 a5 10 80 01 	movl   $0x1,0x8010a558
801003e0:	00 00 00 
801003e3:	eb fe                	jmp    801003e3 <panic+0x73>
801003e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801003e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801003f0 <consputc>:
}

void
consputc(int c)
{
  if(panicked){
801003f0:	8b 15 58 a5 10 80    	mov    0x8010a558,%edx
801003f6:	85 d2                	test   %edx,%edx
801003f8:	74 06                	je     80100400 <consputc+0x10>
801003fa:	fa                   	cli    
801003fb:	eb fe                	jmp    801003fb <consputc+0xb>
801003fd:	8d 76 00             	lea    0x0(%esi),%esi
  crt[pos] = ' ' | 0x0700;
}

void
consputc(int c)
{
80100400:	55                   	push   %ebp
80100401:	89 e5                	mov    %esp,%ebp
80100403:	57                   	push   %edi
80100404:	56                   	push   %esi
80100405:	53                   	push   %ebx
80100406:	89 c3                	mov    %eax,%ebx
80100408:	83 ec 0c             	sub    $0xc,%esp
    cli();
    for(;;)
      ;
  }

  if(c == BACKSPACE){
8010040b:	3d 00 01 00 00       	cmp    $0x100,%eax
80100410:	0f 84 b8 00 00 00    	je     801004ce <consputc+0xde>
    uartputc('\b'); uartputc(' '); uartputc('\b');
  } else
    uartputc(c);
80100416:	83 ec 0c             	sub    $0xc,%esp
80100419:	50                   	push   %eax
8010041a:	e8 71 57 00 00       	call   80105b90 <uartputc>
8010041f:	83 c4 10             	add    $0x10,%esp
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100422:	bf d4 03 00 00       	mov    $0x3d4,%edi
80100427:	b8 0e 00 00 00       	mov    $0xe,%eax
8010042c:	89 fa                	mov    %edi,%edx
8010042e:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010042f:	be d5 03 00 00       	mov    $0x3d5,%esi
80100434:	89 f2                	mov    %esi,%edx
80100436:	ec                   	in     (%dx),%al
{
  int pos;

  // Cursor position: col + 80*row.
  outb(CRTPORT, 14);
  pos = inb(CRTPORT+1) << 8;
80100437:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010043a:	89 fa                	mov    %edi,%edx
8010043c:	c1 e0 08             	shl    $0x8,%eax
8010043f:	89 c1                	mov    %eax,%ecx
80100441:	b8 0f 00 00 00       	mov    $0xf,%eax
80100446:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80100447:	89 f2                	mov    %esi,%edx
80100449:	ec                   	in     (%dx),%al
  outb(CRTPORT, 15);
  pos |= inb(CRTPORT+1);
8010044a:	0f b6 c0             	movzbl %al,%eax
8010044d:	09 c8                	or     %ecx,%eax

  if(c == '\n')
8010044f:	83 fb 0a             	cmp    $0xa,%ebx
80100452:	0f 84 0b 01 00 00    	je     80100563 <consputc+0x173>
    pos += 80 - pos%80;
  else if(c == BACKSPACE){
80100458:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
8010045e:	0f 84 e6 00 00 00    	je     8010054a <consputc+0x15a>
    if(pos > 0) --pos;
  } else
    crt[pos++] = (c&0xff) | 0x0700;  // black on white
80100464:	0f b6 d3             	movzbl %bl,%edx
80100467:	8d 78 01             	lea    0x1(%eax),%edi
8010046a:	80 ce 07             	or     $0x7,%dh
8010046d:	66 89 94 00 00 80 0b 	mov    %dx,-0x7ff48000(%eax,%eax,1)
80100474:	80 

  if(pos < 0 || pos > 25*80)
80100475:	81 ff d0 07 00 00    	cmp    $0x7d0,%edi
8010047b:	0f 8f bc 00 00 00    	jg     8010053d <consputc+0x14d>
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
80100481:	81 ff 7f 07 00 00    	cmp    $0x77f,%edi
80100487:	7f 6f                	jg     801004f8 <consputc+0x108>
80100489:	89 f8                	mov    %edi,%eax
8010048b:	8d 8c 3f 00 80 0b 80 	lea    -0x7ff48000(%edi,%edi,1),%ecx
80100492:	89 fb                	mov    %edi,%ebx
80100494:	c1 e8 08             	shr    $0x8,%eax
80100497:	89 c6                	mov    %eax,%esi
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100499:	bf d4 03 00 00       	mov    $0x3d4,%edi
8010049e:	b8 0e 00 00 00       	mov    $0xe,%eax
801004a3:	89 fa                	mov    %edi,%edx
801004a5:	ee                   	out    %al,(%dx)
801004a6:	ba d5 03 00 00       	mov    $0x3d5,%edx
801004ab:	89 f0                	mov    %esi,%eax
801004ad:	ee                   	out    %al,(%dx)
801004ae:	b8 0f 00 00 00       	mov    $0xf,%eax
801004b3:	89 fa                	mov    %edi,%edx
801004b5:	ee                   	out    %al,(%dx)
801004b6:	ba d5 03 00 00       	mov    $0x3d5,%edx
801004bb:	89 d8                	mov    %ebx,%eax
801004bd:	ee                   	out    %al,(%dx)

  outb(CRTPORT, 14);
  outb(CRTPORT+1, pos>>8);
  outb(CRTPORT, 15);
  outb(CRTPORT+1, pos);
  crt[pos] = ' ' | 0x0700;
801004be:	b8 20 07 00 00       	mov    $0x720,%eax
801004c3:	66 89 01             	mov    %ax,(%ecx)
  if(c == BACKSPACE){
    uartputc('\b'); uartputc(' '); uartputc('\b');
  } else
    uartputc(c);
  cgaputc(c);
}
801004c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801004c9:	5b                   	pop    %ebx
801004ca:	5e                   	pop    %esi
801004cb:	5f                   	pop    %edi
801004cc:	5d                   	pop    %ebp
801004cd:	c3                   	ret    
    for(;;)
      ;
  }

  if(c == BACKSPACE){
    uartputc('\b'); uartputc(' '); uartputc('\b');
801004ce:	83 ec 0c             	sub    $0xc,%esp
801004d1:	6a 08                	push   $0x8
801004d3:	e8 b8 56 00 00       	call   80105b90 <uartputc>
801004d8:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004df:	e8 ac 56 00 00       	call   80105b90 <uartputc>
801004e4:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
801004eb:	e8 a0 56 00 00       	call   80105b90 <uartputc>
801004f0:	83 c4 10             	add    $0x10,%esp
801004f3:	e9 2a ff ff ff       	jmp    80100422 <consputc+0x32>

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
801004f8:	83 ec 04             	sub    $0x4,%esp
    pos -= 80;
801004fb:	8d 5f b0             	lea    -0x50(%edi),%ebx

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
801004fe:	68 60 0e 00 00       	push   $0xe60
80100503:	68 a0 80 0b 80       	push   $0x800b80a0
80100508:	68 00 80 0b 80       	push   $0x800b8000
    pos -= 80;
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
8010050d:	8d b4 1b 00 80 0b 80 	lea    -0x7ff48000(%ebx,%ebx,1),%esi

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
80100514:	e8 c7 3f 00 00       	call   801044e0 <memmove>
    pos -= 80;
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
80100519:	b8 80 07 00 00       	mov    $0x780,%eax
8010051e:	83 c4 0c             	add    $0xc,%esp
80100521:	29 d8                	sub    %ebx,%eax
80100523:	01 c0                	add    %eax,%eax
80100525:	50                   	push   %eax
80100526:	6a 00                	push   $0x0
80100528:	56                   	push   %esi
80100529:	e8 02 3f 00 00       	call   80104430 <memset>
8010052e:	89 f1                	mov    %esi,%ecx
80100530:	83 c4 10             	add    $0x10,%esp
80100533:	be 07 00 00 00       	mov    $0x7,%esi
80100538:	e9 5c ff ff ff       	jmp    80100499 <consputc+0xa9>
    if(pos > 0) --pos;
  } else
    crt[pos++] = (c&0xff) | 0x0700;  // black on white

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");
8010053d:	83 ec 0c             	sub    $0xc,%esp
80100540:	68 25 71 10 80       	push   $0x80107125
80100545:	e8 26 fe ff ff       	call   80100370 <panic>
  pos |= inb(CRTPORT+1);

  if(c == '\n')
    pos += 80 - pos%80;
  else if(c == BACKSPACE){
    if(pos > 0) --pos;
8010054a:	85 c0                	test   %eax,%eax
8010054c:	8d 78 ff             	lea    -0x1(%eax),%edi
8010054f:	0f 85 20 ff ff ff    	jne    80100475 <consputc+0x85>
80100555:	b9 00 80 0b 80       	mov    $0x800b8000,%ecx
8010055a:	31 db                	xor    %ebx,%ebx
8010055c:	31 f6                	xor    %esi,%esi
8010055e:	e9 36 ff ff ff       	jmp    80100499 <consputc+0xa9>
  pos = inb(CRTPORT+1) << 8;
  outb(CRTPORT, 15);
  pos |= inb(CRTPORT+1);

  if(c == '\n')
    pos += 80 - pos%80;
80100563:	ba 67 66 66 66       	mov    $0x66666667,%edx
80100568:	f7 ea                	imul   %edx
8010056a:	89 d0                	mov    %edx,%eax
8010056c:	c1 e8 05             	shr    $0x5,%eax
8010056f:	8d 04 80             	lea    (%eax,%eax,4),%eax
80100572:	c1 e0 04             	shl    $0x4,%eax
80100575:	8d 78 50             	lea    0x50(%eax),%edi
80100578:	e9 f8 fe ff ff       	jmp    80100475 <consputc+0x85>
8010057d:	8d 76 00             	lea    0x0(%esi),%esi

80100580 <printint>:
  int locking;
} cons;

static void
printint(int xx, int base, int sign)
{
80100580:	55                   	push   %ebp
80100581:	89 e5                	mov    %esp,%ebp
80100583:	57                   	push   %edi
80100584:	56                   	push   %esi
80100585:	53                   	push   %ebx
80100586:	89 d6                	mov    %edx,%esi
80100588:	83 ec 2c             	sub    $0x2c,%esp
  static char digits[] = "0123456789abcdef";
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
8010058b:	85 c9                	test   %ecx,%ecx
  int locking;
} cons;

static void
printint(int xx, int base, int sign)
{
8010058d:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  static char digits[] = "0123456789abcdef";
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
80100590:	74 0c                	je     8010059e <printint+0x1e>
80100592:	89 c7                	mov    %eax,%edi
80100594:	c1 ef 1f             	shr    $0x1f,%edi
80100597:	85 c0                	test   %eax,%eax
80100599:	89 7d d4             	mov    %edi,-0x2c(%ebp)
8010059c:	78 51                	js     801005ef <printint+0x6f>
    x = -xx;
  else
    x = xx;

  i = 0;
8010059e:	31 ff                	xor    %edi,%edi
801005a0:	8d 5d d7             	lea    -0x29(%ebp),%ebx
801005a3:	eb 05                	jmp    801005aa <printint+0x2a>
801005a5:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
801005a8:	89 cf                	mov    %ecx,%edi
801005aa:	31 d2                	xor    %edx,%edx
801005ac:	8d 4f 01             	lea    0x1(%edi),%ecx
801005af:	f7 f6                	div    %esi
801005b1:	0f b6 92 50 71 10 80 	movzbl -0x7fef8eb0(%edx),%edx
  }while((x /= base) != 0);
801005b8:	85 c0                	test   %eax,%eax
  else
    x = xx;

  i = 0;
  do{
    buf[i++] = digits[x % base];
801005ba:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
801005bd:	75 e9                	jne    801005a8 <printint+0x28>

  if(sign)
801005bf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
801005c2:	85 c0                	test   %eax,%eax
801005c4:	74 08                	je     801005ce <printint+0x4e>
    buf[i++] = '-';
801005c6:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
801005cb:	8d 4f 02             	lea    0x2(%edi),%ecx
801005ce:	8d 74 0d d7          	lea    -0x29(%ebp,%ecx,1),%esi
801005d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  while(--i >= 0)
    consputc(buf[i]);
801005d8:	0f be 06             	movsbl (%esi),%eax
801005db:	83 ee 01             	sub    $0x1,%esi
801005de:	e8 0d fe ff ff       	call   801003f0 <consputc>
  }while((x /= base) != 0);

  if(sign)
    buf[i++] = '-';

  while(--i >= 0)
801005e3:	39 de                	cmp    %ebx,%esi
801005e5:	75 f1                	jne    801005d8 <printint+0x58>
    consputc(buf[i]);
}
801005e7:	83 c4 2c             	add    $0x2c,%esp
801005ea:	5b                   	pop    %ebx
801005eb:	5e                   	pop    %esi
801005ec:	5f                   	pop    %edi
801005ed:	5d                   	pop    %ebp
801005ee:	c3                   	ret    
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
    x = -xx;
801005ef:	f7 d8                	neg    %eax
801005f1:	eb ab                	jmp    8010059e <printint+0x1e>
801005f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100600 <consolewrite>:
  return target - n;
}

int
consolewrite(struct inode *ip, char *buf, int n)
{
80100600:	55                   	push   %ebp
80100601:	89 e5                	mov    %esp,%ebp
80100603:	57                   	push   %edi
80100604:	56                   	push   %esi
80100605:	53                   	push   %ebx
80100606:	83 ec 18             	sub    $0x18,%esp
  int i;

  iunlock(ip);
80100609:	ff 75 08             	pushl  0x8(%ebp)
  return target - n;
}

int
consolewrite(struct inode *ip, char *buf, int n)
{
8010060c:	8b 75 10             	mov    0x10(%ebp),%esi
  int i;

  iunlock(ip);
8010060f:	e8 5c 11 00 00       	call   80101770 <iunlock>
  acquire(&cons.lock);
80100614:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010061b:	e8 a0 3c 00 00       	call   801042c0 <acquire>
80100620:	8b 7d 0c             	mov    0xc(%ebp),%edi
  for(i = 0; i < n; i++)
80100623:	83 c4 10             	add    $0x10,%esp
80100626:	85 f6                	test   %esi,%esi
80100628:	8d 1c 37             	lea    (%edi,%esi,1),%ebx
8010062b:	7e 12                	jle    8010063f <consolewrite+0x3f>
8010062d:	8d 76 00             	lea    0x0(%esi),%esi
    consputc(buf[i] & 0xff);
80100630:	0f b6 07             	movzbl (%edi),%eax
80100633:	83 c7 01             	add    $0x1,%edi
80100636:	e8 b5 fd ff ff       	call   801003f0 <consputc>
{
  int i;

  iunlock(ip);
  acquire(&cons.lock);
  for(i = 0; i < n; i++)
8010063b:	39 df                	cmp    %ebx,%edi
8010063d:	75 f1                	jne    80100630 <consolewrite+0x30>
    consputc(buf[i] & 0xff);
  release(&cons.lock);
8010063f:	83 ec 0c             	sub    $0xc,%esp
80100642:	68 20 a5 10 80       	push   $0x8010a520
80100647:	e8 94 3d 00 00       	call   801043e0 <release>
  ilock(ip);
8010064c:	58                   	pop    %eax
8010064d:	ff 75 08             	pushl  0x8(%ebp)
80100650:	e8 3b 10 00 00       	call   80101690 <ilock>

  return n;
}
80100655:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100658:	89 f0                	mov    %esi,%eax
8010065a:	5b                   	pop    %ebx
8010065b:	5e                   	pop    %esi
8010065c:	5f                   	pop    %edi
8010065d:	5d                   	pop    %ebp
8010065e:	c3                   	ret    
8010065f:	90                   	nop

80100660 <cprintf>:
//PAGEBREAK: 50

// Print to the console. only understands %d, %x, %p, %s.
void
cprintf(char *fmt, ...)
{
80100660:	55                   	push   %ebp
80100661:	89 e5                	mov    %esp,%ebp
80100663:	57                   	push   %edi
80100664:	56                   	push   %esi
80100665:	53                   	push   %ebx
80100666:	83 ec 1c             	sub    $0x1c,%esp
  int i, c, locking;
  uint *argp;
  char *s;

  locking = cons.locking;
80100669:	a1 54 a5 10 80       	mov    0x8010a554,%eax
  if(locking)
8010066e:	85 c0                	test   %eax,%eax
{
  int i, c, locking;
  uint *argp;
  char *s;

  locking = cons.locking;
80100670:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(locking)
80100673:	0f 85 47 01 00 00    	jne    801007c0 <cprintf+0x160>
    acquire(&cons.lock);

  if (fmt == 0)
80100679:	8b 45 08             	mov    0x8(%ebp),%eax
8010067c:	85 c0                	test   %eax,%eax
8010067e:	89 c1                	mov    %eax,%ecx
80100680:	0f 84 4f 01 00 00    	je     801007d5 <cprintf+0x175>
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80100686:	0f b6 00             	movzbl (%eax),%eax
80100689:	31 db                	xor    %ebx,%ebx
8010068b:	8d 75 0c             	lea    0xc(%ebp),%esi
8010068e:	89 cf                	mov    %ecx,%edi
80100690:	85 c0                	test   %eax,%eax
80100692:	75 55                	jne    801006e9 <cprintf+0x89>
80100694:	eb 68                	jmp    801006fe <cprintf+0x9e>
80100696:	8d 76 00             	lea    0x0(%esi),%esi
80100699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(c != '%'){
      consputc(c);
      continue;
    }
    c = fmt[++i] & 0xff;
801006a0:	83 c3 01             	add    $0x1,%ebx
801006a3:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
    if(c == 0)
801006a7:	85 d2                	test   %edx,%edx
801006a9:	74 53                	je     801006fe <cprintf+0x9e>
      break;
    switch(c){
801006ab:	83 fa 70             	cmp    $0x70,%edx
801006ae:	74 7a                	je     8010072a <cprintf+0xca>
801006b0:	7f 6e                	jg     80100720 <cprintf+0xc0>
801006b2:	83 fa 25             	cmp    $0x25,%edx
801006b5:	0f 84 ad 00 00 00    	je     80100768 <cprintf+0x108>
801006bb:	83 fa 64             	cmp    $0x64,%edx
801006be:	0f 85 84 00 00 00    	jne    80100748 <cprintf+0xe8>
    case 'd':
      printint(*argp++, 10, 1);
801006c4:	8d 46 04             	lea    0x4(%esi),%eax
801006c7:	b9 01 00 00 00       	mov    $0x1,%ecx
801006cc:	ba 0a 00 00 00       	mov    $0xa,%edx
801006d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801006d4:	8b 06                	mov    (%esi),%eax
801006d6:	e8 a5 fe ff ff       	call   80100580 <printint>
801006db:	8b 75 e4             	mov    -0x1c(%ebp),%esi

  if (fmt == 0)
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006de:	83 c3 01             	add    $0x1,%ebx
801006e1:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006e5:	85 c0                	test   %eax,%eax
801006e7:	74 15                	je     801006fe <cprintf+0x9e>
    if(c != '%'){
801006e9:	83 f8 25             	cmp    $0x25,%eax
801006ec:	74 b2                	je     801006a0 <cprintf+0x40>
        s = "(null)";
      for(; *s; s++)
        consputc(*s);
      break;
    case '%':
      consputc('%');
801006ee:	e8 fd fc ff ff       	call   801003f0 <consputc>

  if (fmt == 0)
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006f3:	83 c3 01             	add    $0x1,%ebx
801006f6:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006fa:	85 c0                	test   %eax,%eax
801006fc:	75 eb                	jne    801006e9 <cprintf+0x89>
      consputc(c);
      break;
    }
  }

  if(locking)
801006fe:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100701:	85 c0                	test   %eax,%eax
80100703:	74 10                	je     80100715 <cprintf+0xb5>
    release(&cons.lock);
80100705:	83 ec 0c             	sub    $0xc,%esp
80100708:	68 20 a5 10 80       	push   $0x8010a520
8010070d:	e8 ce 3c 00 00       	call   801043e0 <release>
80100712:	83 c4 10             	add    $0x10,%esp
}
80100715:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100718:	5b                   	pop    %ebx
80100719:	5e                   	pop    %esi
8010071a:	5f                   	pop    %edi
8010071b:	5d                   	pop    %ebp
8010071c:	c3                   	ret    
8010071d:	8d 76 00             	lea    0x0(%esi),%esi
      continue;
    }
    c = fmt[++i] & 0xff;
    if(c == 0)
      break;
    switch(c){
80100720:	83 fa 73             	cmp    $0x73,%edx
80100723:	74 5b                	je     80100780 <cprintf+0x120>
80100725:	83 fa 78             	cmp    $0x78,%edx
80100728:	75 1e                	jne    80100748 <cprintf+0xe8>
    case 'd':
      printint(*argp++, 10, 1);
      break;
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
8010072a:	8d 46 04             	lea    0x4(%esi),%eax
8010072d:	31 c9                	xor    %ecx,%ecx
8010072f:	ba 10 00 00 00       	mov    $0x10,%edx
80100734:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100737:	8b 06                	mov    (%esi),%eax
80100739:	e8 42 fe ff ff       	call   80100580 <printint>
8010073e:	8b 75 e4             	mov    -0x1c(%ebp),%esi
      break;
80100741:	eb 9b                	jmp    801006de <cprintf+0x7e>
80100743:	90                   	nop
80100744:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    case '%':
      consputc('%');
      break;
    default:
      // Print unknown % sequence to draw attention.
      consputc('%');
80100748:	b8 25 00 00 00       	mov    $0x25,%eax
8010074d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80100750:	e8 9b fc ff ff       	call   801003f0 <consputc>
      consputc(c);
80100755:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80100758:	89 d0                	mov    %edx,%eax
8010075a:	e8 91 fc ff ff       	call   801003f0 <consputc>
      break;
8010075f:	e9 7a ff ff ff       	jmp    801006de <cprintf+0x7e>
80100764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = "(null)";
      for(; *s; s++)
        consputc(*s);
      break;
    case '%':
      consputc('%');
80100768:	b8 25 00 00 00       	mov    $0x25,%eax
8010076d:	e8 7e fc ff ff       	call   801003f0 <consputc>
80100772:	e9 7c ff ff ff       	jmp    801006f3 <cprintf+0x93>
80100777:	89 f6                	mov    %esi,%esi
80100779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
80100780:	8d 46 04             	lea    0x4(%esi),%eax
80100783:	8b 36                	mov    (%esi),%esi
80100785:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        s = "(null)";
80100788:	b8 38 71 10 80       	mov    $0x80107138,%eax
8010078d:	85 f6                	test   %esi,%esi
8010078f:	0f 44 f0             	cmove  %eax,%esi
      for(; *s; s++)
80100792:	0f be 06             	movsbl (%esi),%eax
80100795:	84 c0                	test   %al,%al
80100797:	74 16                	je     801007af <cprintf+0x14f>
80100799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801007a0:	83 c6 01             	add    $0x1,%esi
        consputc(*s);
801007a3:	e8 48 fc ff ff       	call   801003f0 <consputc>
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
        s = "(null)";
      for(; *s; s++)
801007a8:	0f be 06             	movsbl (%esi),%eax
801007ab:	84 c0                	test   %al,%al
801007ad:	75 f1                	jne    801007a0 <cprintf+0x140>
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
801007af:	8b 75 e4             	mov    -0x1c(%ebp),%esi
801007b2:	e9 27 ff ff ff       	jmp    801006de <cprintf+0x7e>
801007b7:	89 f6                	mov    %esi,%esi
801007b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  uint *argp;
  char *s;

  locking = cons.locking;
  if(locking)
    acquire(&cons.lock);
801007c0:	83 ec 0c             	sub    $0xc,%esp
801007c3:	68 20 a5 10 80       	push   $0x8010a520
801007c8:	e8 f3 3a 00 00       	call   801042c0 <acquire>
801007cd:	83 c4 10             	add    $0x10,%esp
801007d0:	e9 a4 fe ff ff       	jmp    80100679 <cprintf+0x19>

  if (fmt == 0)
    panic("null fmt");
801007d5:	83 ec 0c             	sub    $0xc,%esp
801007d8:	68 3f 71 10 80       	push   $0x8010713f
801007dd:	e8 8e fb ff ff       	call   80100370 <panic>
801007e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801007e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801007f0 <consoleintr>:

#define C(x)  ((x)-'@')  // Control-x

void
consoleintr(int (*getc)(void))
{
801007f0:	55                   	push   %ebp
801007f1:	89 e5                	mov    %esp,%ebp
801007f3:	57                   	push   %edi
801007f4:	56                   	push   %esi
801007f5:	53                   	push   %ebx
  int c, doprocdump = 0;
801007f6:	31 f6                	xor    %esi,%esi

#define C(x)  ((x)-'@')  // Control-x

void
consoleintr(int (*getc)(void))
{
801007f8:	83 ec 18             	sub    $0x18,%esp
801007fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int c, doprocdump = 0;

  acquire(&cons.lock);
801007fe:	68 20 a5 10 80       	push   $0x8010a520
80100803:	e8 b8 3a 00 00       	call   801042c0 <acquire>
  while((c = getc()) >= 0){
80100808:	83 c4 10             	add    $0x10,%esp
8010080b:	90                   	nop
8010080c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100810:	ff d3                	call   *%ebx
80100812:	85 c0                	test   %eax,%eax
80100814:	89 c7                	mov    %eax,%edi
80100816:	78 48                	js     80100860 <consoleintr+0x70>
    switch(c){
80100818:	83 ff 10             	cmp    $0x10,%edi
8010081b:	0f 84 3f 01 00 00    	je     80100960 <consoleintr+0x170>
80100821:	7e 5d                	jle    80100880 <consoleintr+0x90>
80100823:	83 ff 15             	cmp    $0x15,%edi
80100826:	0f 84 dc 00 00 00    	je     80100908 <consoleintr+0x118>
8010082c:	83 ff 7f             	cmp    $0x7f,%edi
8010082f:	75 54                	jne    80100885 <consoleintr+0x95>
        input.e--;
        consputc(BACKSPACE);
      }
      break;
    case C('H'): case '\x7f':  // Backspace
      if(input.e != input.w){
80100831:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
80100836:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
8010083c:	74 d2                	je     80100810 <consoleintr+0x20>
        input.e--;
8010083e:	83 e8 01             	sub    $0x1,%eax
80100841:	a3 a8 ff 10 80       	mov    %eax,0x8010ffa8
        consputc(BACKSPACE);
80100846:	b8 00 01 00 00       	mov    $0x100,%eax
8010084b:	e8 a0 fb ff ff       	call   801003f0 <consputc>
consoleintr(int (*getc)(void))
{
  int c, doprocdump = 0;

  acquire(&cons.lock);
  while((c = getc()) >= 0){
80100850:	ff d3                	call   *%ebx
80100852:	85 c0                	test   %eax,%eax
80100854:	89 c7                	mov    %eax,%edi
80100856:	79 c0                	jns    80100818 <consoleintr+0x28>
80100858:	90                   	nop
80100859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        }
      }
      break;
    }
  }
  release(&cons.lock);
80100860:	83 ec 0c             	sub    $0xc,%esp
80100863:	68 20 a5 10 80       	push   $0x8010a520
80100868:	e8 73 3b 00 00       	call   801043e0 <release>
  if(doprocdump) {
8010086d:	83 c4 10             	add    $0x10,%esp
80100870:	85 f6                	test   %esi,%esi
80100872:	0f 85 f8 00 00 00    	jne    80100970 <consoleintr+0x180>
    procdump();  // now call procdump() wo. cons.lock held
  }
}
80100878:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010087b:	5b                   	pop    %ebx
8010087c:	5e                   	pop    %esi
8010087d:	5f                   	pop    %edi
8010087e:	5d                   	pop    %ebp
8010087f:	c3                   	ret    
{
  int c, doprocdump = 0;

  acquire(&cons.lock);
  while((c = getc()) >= 0){
    switch(c){
80100880:	83 ff 08             	cmp    $0x8,%edi
80100883:	74 ac                	je     80100831 <consoleintr+0x41>
        input.e--;
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
80100885:	85 ff                	test   %edi,%edi
80100887:	74 87                	je     80100810 <consoleintr+0x20>
80100889:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
8010088e:	89 c2                	mov    %eax,%edx
80100890:	2b 15 a0 ff 10 80    	sub    0x8010ffa0,%edx
80100896:	83 fa 7f             	cmp    $0x7f,%edx
80100899:	0f 87 71 ff ff ff    	ja     80100810 <consoleintr+0x20>
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
8010089f:	8d 50 01             	lea    0x1(%eax),%edx
801008a2:	83 e0 7f             	and    $0x7f,%eax
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
801008a5:	83 ff 0d             	cmp    $0xd,%edi
        input.buf[input.e++ % INPUT_BUF] = c;
801008a8:	89 15 a8 ff 10 80    	mov    %edx,0x8010ffa8
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
801008ae:	0f 84 c8 00 00 00    	je     8010097c <consoleintr+0x18c>
        input.buf[input.e++ % INPUT_BUF] = c;
801008b4:	89 f9                	mov    %edi,%ecx
801008b6:	88 88 20 ff 10 80    	mov    %cl,-0x7fef00e0(%eax)
        consputc(c);
801008bc:	89 f8                	mov    %edi,%eax
801008be:	e8 2d fb ff ff       	call   801003f0 <consputc>
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
801008c3:	83 ff 0a             	cmp    $0xa,%edi
801008c6:	0f 84 c1 00 00 00    	je     8010098d <consoleintr+0x19d>
801008cc:	83 ff 04             	cmp    $0x4,%edi
801008cf:	0f 84 b8 00 00 00    	je     8010098d <consoleintr+0x19d>
801008d5:	a1 a0 ff 10 80       	mov    0x8010ffa0,%eax
801008da:	83 e8 80             	sub    $0xffffff80,%eax
801008dd:	39 05 a8 ff 10 80    	cmp    %eax,0x8010ffa8
801008e3:	0f 85 27 ff ff ff    	jne    80100810 <consoleintr+0x20>
          input.w = input.e;
          wakeup(&input.r);
801008e9:	83 ec 0c             	sub    $0xc,%esp
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
        consputc(c);
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
          input.w = input.e;
801008ec:	a3 a4 ff 10 80       	mov    %eax,0x8010ffa4
          wakeup(&input.r);
801008f1:	68 a0 ff 10 80       	push   $0x8010ffa0
801008f6:	e8 05 36 00 00       	call   80103f00 <wakeup>
801008fb:	83 c4 10             	add    $0x10,%esp
801008fe:	e9 0d ff ff ff       	jmp    80100810 <consoleintr+0x20>
80100903:	90                   	nop
80100904:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
80100908:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
8010090d:	39 05 a4 ff 10 80    	cmp    %eax,0x8010ffa4
80100913:	75 2b                	jne    80100940 <consoleintr+0x150>
80100915:	e9 f6 fe ff ff       	jmp    80100810 <consoleintr+0x20>
8010091a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
        input.e--;
80100920:	a3 a8 ff 10 80       	mov    %eax,0x8010ffa8
        consputc(BACKSPACE);
80100925:	b8 00 01 00 00       	mov    $0x100,%eax
8010092a:	e8 c1 fa ff ff       	call   801003f0 <consputc>
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
8010092f:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
80100934:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
8010093a:	0f 84 d0 fe ff ff    	je     80100810 <consoleintr+0x20>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
80100940:	83 e8 01             	sub    $0x1,%eax
80100943:	89 c2                	mov    %eax,%edx
80100945:	83 e2 7f             	and    $0x7f,%edx
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
80100948:	80 ba 20 ff 10 80 0a 	cmpb   $0xa,-0x7fef00e0(%edx)
8010094f:	75 cf                	jne    80100920 <consoleintr+0x130>
80100951:	e9 ba fe ff ff       	jmp    80100810 <consoleintr+0x20>
80100956:	8d 76 00             	lea    0x0(%esi),%esi
80100959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  acquire(&cons.lock);
  while((c = getc()) >= 0){
    switch(c){
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
80100960:	be 01 00 00 00       	mov    $0x1,%esi
80100965:	e9 a6 fe ff ff       	jmp    80100810 <consoleintr+0x20>
8010096a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }
  release(&cons.lock);
  if(doprocdump) {
    procdump();  // now call procdump() wo. cons.lock held
  }
}
80100970:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100973:	5b                   	pop    %ebx
80100974:	5e                   	pop    %esi
80100975:	5f                   	pop    %edi
80100976:	5d                   	pop    %ebp
      break;
    }
  }
  release(&cons.lock);
  if(doprocdump) {
    procdump();  // now call procdump() wo. cons.lock held
80100977:	e9 74 36 00 00       	jmp    80103ff0 <procdump>
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
8010097c:	c6 80 20 ff 10 80 0a 	movb   $0xa,-0x7fef00e0(%eax)
        consputc(c);
80100983:	b8 0a 00 00 00       	mov    $0xa,%eax
80100988:	e8 63 fa ff ff       	call   801003f0 <consputc>
8010098d:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
80100992:	e9 52 ff ff ff       	jmp    801008e9 <consoleintr+0xf9>
80100997:	89 f6                	mov    %esi,%esi
80100999:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801009a0 <consoleinit>:
  return n;
}

void
consoleinit(void)
{
801009a0:	55                   	push   %ebp
801009a1:	89 e5                	mov    %esp,%ebp
801009a3:	83 ec 10             	sub    $0x10,%esp
  initlock(&cons.lock, "console");
801009a6:	68 48 71 10 80       	push   $0x80107148
801009ab:	68 20 a5 10 80       	push   $0x8010a520
801009b0:	e8 0b 38 00 00       	call   801041c0 <initlock>

  devsw[CONSOLE].write = consolewrite;
  devsw[CONSOLE].read = consoleread;
  cons.locking = 1;

  ioapicenable(IRQ_KBD, 0);
801009b5:	58                   	pop    %eax
801009b6:	5a                   	pop    %edx
801009b7:	6a 00                	push   $0x0
801009b9:	6a 01                	push   $0x1
void
consoleinit(void)
{
  initlock(&cons.lock, "console");

  devsw[CONSOLE].write = consolewrite;
801009bb:	c7 05 6c 09 11 80 00 	movl   $0x80100600,0x8011096c
801009c2:	06 10 80 
  devsw[CONSOLE].read = consoleread;
801009c5:	c7 05 68 09 11 80 70 	movl   $0x80100270,0x80110968
801009cc:	02 10 80 
  cons.locking = 1;
801009cf:	c7 05 54 a5 10 80 01 	movl   $0x1,0x8010a554
801009d6:	00 00 00 

  ioapicenable(IRQ_KBD, 0);
801009d9:	e8 e2 18 00 00       	call   801022c0 <ioapicenable>
}
801009de:	83 c4 10             	add    $0x10,%esp
801009e1:	c9                   	leave  
801009e2:	c3                   	ret    
801009e3:	66 90                	xchg   %ax,%ax
801009e5:	66 90                	xchg   %ax,%ax
801009e7:	66 90                	xchg   %ax,%ax
801009e9:	66 90                	xchg   %ax,%ax
801009eb:	66 90                	xchg   %ax,%ax
801009ed:	66 90                	xchg   %ax,%ax
801009ef:	90                   	nop

801009f0 <exec>:
#include "x86.h"
#include "elf.h"

int
exec(char *path, char **argv)
{
801009f0:	55                   	push   %ebp
801009f1:	89 e5                	mov    %esp,%ebp
801009f3:	57                   	push   %edi
801009f4:	56                   	push   %esi
801009f5:	53                   	push   %ebx
801009f6:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
  uint argc, sz, sp, ustack[3+MAXARG+1];
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pde_t *pgdir, *oldpgdir;
  struct proc *curproc = myproc();
801009fc:	e8 9f 2d 00 00       	call   801037a0 <myproc>
80100a01:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)

  begin_op();
80100a07:	e8 64 21 00 00       	call   80102b70 <begin_op>

  if((ip = namei(path)) == 0){
80100a0c:	83 ec 0c             	sub    $0xc,%esp
80100a0f:	ff 75 08             	pushl  0x8(%ebp)
80100a12:	e8 c9 14 00 00       	call   80101ee0 <namei>
80100a17:	83 c4 10             	add    $0x10,%esp
80100a1a:	85 c0                	test   %eax,%eax
80100a1c:	0f 84 9c 01 00 00    	je     80100bbe <exec+0x1ce>
    end_op();
    cprintf("exec: fail\n");
    return -1;
  }
  ilock(ip);
80100a22:	83 ec 0c             	sub    $0xc,%esp
80100a25:	89 c3                	mov    %eax,%ebx
80100a27:	50                   	push   %eax
80100a28:	e8 63 0c 00 00       	call   80101690 <ilock>
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) != sizeof(elf))
80100a2d:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100a33:	6a 34                	push   $0x34
80100a35:	6a 00                	push   $0x0
80100a37:	50                   	push   %eax
80100a38:	53                   	push   %ebx
80100a39:	e8 32 0f 00 00       	call   80101970 <readi>
80100a3e:	83 c4 20             	add    $0x20,%esp
80100a41:	83 f8 34             	cmp    $0x34,%eax
80100a44:	74 22                	je     80100a68 <exec+0x78>

 bad:
  if(pgdir)
    freevm(pgdir);
  if(ip){
    iunlockput(ip);
80100a46:	83 ec 0c             	sub    $0xc,%esp
80100a49:	53                   	push   %ebx
80100a4a:	e8 d1 0e 00 00       	call   80101920 <iunlockput>
    end_op();
80100a4f:	e8 8c 21 00 00       	call   80102be0 <end_op>
80100a54:	83 c4 10             	add    $0x10,%esp
  }
  return -1;
80100a57:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100a5c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100a5f:	5b                   	pop    %ebx
80100a60:	5e                   	pop    %esi
80100a61:	5f                   	pop    %edi
80100a62:	5d                   	pop    %ebp
80100a63:	c3                   	ret    
80100a64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) != sizeof(elf))
    goto bad;
  if(elf.magic != ELF_MAGIC)
80100a68:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100a6f:	45 4c 46 
80100a72:	75 d2                	jne    80100a46 <exec+0x56>
    goto bad;

  if((pgdir = setupkvm()) == 0)
80100a74:	e8 a7 62 00 00       	call   80106d20 <setupkvm>
80100a79:	85 c0                	test   %eax,%eax
80100a7b:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100a81:	74 c3                	je     80100a46 <exec+0x56>
    goto bad;

  // Load program into memory.
  sz = 0;
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100a83:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100a8a:	00 
80100a8b:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
80100a91:	c7 85 ec fe ff ff 00 	movl   $0x0,-0x114(%ebp)
80100a98:	00 00 00 
80100a9b:	0f 84 c5 00 00 00    	je     80100b66 <exec+0x176>
80100aa1:	31 ff                	xor    %edi,%edi
80100aa3:	eb 18                	jmp    80100abd <exec+0xcd>
80100aa5:	8d 76 00             	lea    0x0(%esi),%esi
80100aa8:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100aaf:	83 c7 01             	add    $0x1,%edi
80100ab2:	83 c6 20             	add    $0x20,%esi
80100ab5:	39 f8                	cmp    %edi,%eax
80100ab7:	0f 8e a9 00 00 00    	jle    80100b66 <exec+0x176>
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
80100abd:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100ac3:	6a 20                	push   $0x20
80100ac5:	56                   	push   %esi
80100ac6:	50                   	push   %eax
80100ac7:	53                   	push   %ebx
80100ac8:	e8 a3 0e 00 00       	call   80101970 <readi>
80100acd:	83 c4 10             	add    $0x10,%esp
80100ad0:	83 f8 20             	cmp    $0x20,%eax
80100ad3:	75 7b                	jne    80100b50 <exec+0x160>
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
80100ad5:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100adc:	75 ca                	jne    80100aa8 <exec+0xb8>
      continue;
    if(ph.memsz < ph.filesz)
80100ade:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100ae4:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100aea:	72 64                	jb     80100b50 <exec+0x160>
      goto bad;
    if(ph.vaddr + ph.memsz < ph.vaddr)
80100aec:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100af2:	72 5c                	jb     80100b50 <exec+0x160>
      goto bad;
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
80100af4:	83 ec 04             	sub    $0x4,%esp
80100af7:	50                   	push   %eax
80100af8:	ff b5 ec fe ff ff    	pushl  -0x114(%ebp)
80100afe:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b04:	e8 67 60 00 00       	call   80106b70 <allocuvm>
80100b09:	83 c4 10             	add    $0x10,%esp
80100b0c:	85 c0                	test   %eax,%eax
80100b0e:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
80100b14:	74 3a                	je     80100b50 <exec+0x160>
      goto bad;
    if(ph.vaddr % PGSIZE != 0)
80100b16:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100b1c:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100b21:	75 2d                	jne    80100b50 <exec+0x160>
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
80100b23:	83 ec 0c             	sub    $0xc,%esp
80100b26:	ff b5 14 ff ff ff    	pushl  -0xec(%ebp)
80100b2c:	ff b5 08 ff ff ff    	pushl  -0xf8(%ebp)
80100b32:	53                   	push   %ebx
80100b33:	50                   	push   %eax
80100b34:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b3a:	e8 71 5f 00 00       	call   80106ab0 <loaduvm>
80100b3f:	83 c4 20             	add    $0x20,%esp
80100b42:	85 c0                	test   %eax,%eax
80100b44:	0f 89 5e ff ff ff    	jns    80100aa8 <exec+0xb8>
80100b4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  freevm(oldpgdir);
  return 0;

 bad:
  if(pgdir)
    freevm(pgdir);
80100b50:	83 ec 0c             	sub    $0xc,%esp
80100b53:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b59:	e8 42 61 00 00       	call   80106ca0 <freevm>
80100b5e:	83 c4 10             	add    $0x10,%esp
80100b61:	e9 e0 fe ff ff       	jmp    80100a46 <exec+0x56>
    if(ph.vaddr % PGSIZE != 0)
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
      goto bad;
  }
  iunlockput(ip);
80100b66:	83 ec 0c             	sub    $0xc,%esp
80100b69:	53                   	push   %ebx
80100b6a:	e8 b1 0d 00 00       	call   80101920 <iunlockput>
  end_op();
80100b6f:	e8 6c 20 00 00       	call   80102be0 <end_op>
  ip = 0;

  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
80100b74:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
 if((sz = allocuvm(pgdir, sz, sz + PGSIZE)) == 0)
80100b7a:	83 c4 0c             	add    $0xc,%esp
  end_op();
  ip = 0;

  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
80100b7d:	05 ff 0f 00 00       	add    $0xfff,%eax
80100b82:	25 00 f0 ff ff       	and    $0xfffff000,%eax
 if((sz = allocuvm(pgdir, sz, sz + PGSIZE)) == 0)
80100b87:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
80100b8d:	52                   	push   %edx
80100b8e:	50                   	push   %eax
80100b8f:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b95:	e8 d6 5f 00 00       	call   80106b70 <allocuvm>
80100b9a:	83 c4 10             	add    $0x10,%esp
80100b9d:	85 c0                	test   %eax,%eax
80100b9f:	89 c6                	mov    %eax,%esi
80100ba1:	75 3a                	jne    80100bdd <exec+0x1ed>
  freevm(oldpgdir);
  return 0;

 bad:
  if(pgdir)
    freevm(pgdir);
80100ba3:	83 ec 0c             	sub    $0xc,%esp
80100ba6:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100bac:	e8 ef 60 00 00       	call   80106ca0 <freevm>
80100bb1:	83 c4 10             	add    $0x10,%esp
  if(ip){
    iunlockput(ip);
    end_op();
  }
  return -1;
80100bb4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bb9:	e9 9e fe ff ff       	jmp    80100a5c <exec+0x6c>
  struct proc *curproc = myproc();

  begin_op();

  if((ip = namei(path)) == 0){
    end_op();
80100bbe:	e8 1d 20 00 00       	call   80102be0 <end_op>
    cprintf("exec: fail\n");
80100bc3:	83 ec 0c             	sub    $0xc,%esp
80100bc6:	68 61 71 10 80       	push   $0x80107161
80100bcb:	e8 90 fa ff ff       	call   80100660 <cprintf>
    return -1;
80100bd0:	83 c4 10             	add    $0x10,%esp
80100bd3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bd8:	e9 7f fe ff ff       	jmp    80100a5c <exec+0x6c>
  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
 if((sz = allocuvm(pgdir, sz, sz + PGSIZE)) == 0)
    goto bad;
 if((allocuvm(pgdir, KERNBASE - PGSIZE, KERNBASE + 4 - PGSIZE)) == 0)
80100bdd:	83 ec 04             	sub    $0x4,%esp
80100be0:	68 04 f0 ff 7f       	push   $0x7ffff004
80100be5:	68 00 f0 ff 7f       	push   $0x7ffff000
80100bea:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100bf0:	e8 7b 5f 00 00       	call   80106b70 <allocuvm>
80100bf5:	83 c4 10             	add    $0x10,%esp
80100bf8:	85 c0                	test   %eax,%eax
80100bfa:	74 a7                	je     80100ba3 <exec+0x1b3>
    goto bad;
  clearpteu(pgdir, (char*)(sz - PGSIZE));
80100bfc:	8d 86 00 f0 ff ff    	lea    -0x1000(%esi),%eax
80100c02:	51                   	push   %ecx
80100c03:	51                   	push   %ecx
  sp = KERNBASE - 4;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100c04:	31 ff                	xor    %edi,%edi
80100c06:	bb fc ff ff 7f       	mov    $0x7ffffffc,%ebx
  sz = PGROUNDUP(sz);
 if((sz = allocuvm(pgdir, sz, sz + PGSIZE)) == 0)
    goto bad;
 if((allocuvm(pgdir, KERNBASE - PGSIZE, KERNBASE + 4 - PGSIZE)) == 0)
    goto bad;
  clearpteu(pgdir, (char*)(sz - PGSIZE));
80100c0b:	50                   	push   %eax
80100c0c:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100c12:	e8 a9 61 00 00       	call   80106dc0 <clearpteu>
  sp = KERNBASE - 4;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100c17:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c1a:	83 c4 10             	add    $0x10,%esp
80100c1d:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100c23:	8b 00                	mov    (%eax),%eax
80100c25:	85 c0                	test   %eax,%eax
80100c27:	74 78                	je     80100ca1 <exec+0x2b1>
80100c29:	89 b5 ec fe ff ff    	mov    %esi,-0x114(%ebp)
80100c2f:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
80100c35:	eb 12                	jmp    80100c49 <exec+0x259>
80100c37:	89 f6                	mov    %esi,%esi
80100c39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(argc >= MAXARG)
80100c40:	83 ff 20             	cmp    $0x20,%edi
80100c43:	0f 84 5a ff ff ff    	je     80100ba3 <exec+0x1b3>
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100c49:	83 ec 0c             	sub    $0xc,%esp
80100c4c:	50                   	push   %eax
80100c4d:	e8 1e 3a 00 00       	call   80104670 <strlen>
80100c52:	f7 d0                	not    %eax
80100c54:	01 c3                	add    %eax,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100c56:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c59:	5a                   	pop    %edx

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100c5a:	83 e3 fc             	and    $0xfffffffc,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100c5d:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c60:	e8 0b 3a 00 00       	call   80104670 <strlen>
80100c65:	83 c0 01             	add    $0x1,%eax
80100c68:	50                   	push   %eax
80100c69:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c6c:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c6f:	53                   	push   %ebx
80100c70:	56                   	push   %esi
80100c71:	e8 4a 63 00 00       	call   80106fc0 <copyout>
80100c76:	83 c4 20             	add    $0x20,%esp
80100c79:	85 c0                	test   %eax,%eax
80100c7b:	0f 88 22 ff ff ff    	js     80100ba3 <exec+0x1b3>
    goto bad;
  clearpteu(pgdir, (char*)(sz - PGSIZE));
  sp = KERNBASE - 4;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100c81:	8b 45 0c             	mov    0xc(%ebp),%eax
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
80100c84:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
    goto bad;
  clearpteu(pgdir, (char*)(sz - PGSIZE));
  sp = KERNBASE - 4;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100c8b:	83 c7 01             	add    $0x1,%edi
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
80100c8e:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
    goto bad;
  clearpteu(pgdir, (char*)(sz - PGSIZE));
  sp = KERNBASE - 4;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100c94:	8b 04 b8             	mov    (%eax,%edi,4),%eax
80100c97:	85 c0                	test   %eax,%eax
80100c99:	75 a5                	jne    80100c40 <exec+0x250>
80100c9b:	8b b5 ec fe ff ff    	mov    -0x114(%ebp),%esi
  }
  ustack[3+argc] = 0;

  ustack[0] = 0xffffffff;  // fake return PC
  ustack[1] = argc;
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100ca1:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
80100ca8:	89 d9                	mov    %ebx,%ecx
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
  }
  ustack[3+argc] = 0;
80100caa:	c7 84 bd 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edi,4)
80100cb1:	00 00 00 00 

  ustack[0] = 0xffffffff;  // fake return PC
80100cb5:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100cbc:	ff ff ff 
  ustack[1] = argc;
80100cbf:	89 bd 5c ff ff ff    	mov    %edi,-0xa4(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100cc5:	29 c1                	sub    %eax,%ecx

  sp -= (3+argc+1) * 4;
80100cc7:	83 c0 0c             	add    $0xc,%eax
80100cca:	29 c3                	sub    %eax,%ebx
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100ccc:	50                   	push   %eax
80100ccd:	52                   	push   %edx
80100cce:	53                   	push   %ebx
80100ccf:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
  }
  ustack[3+argc] = 0;

  ustack[0] = 0xffffffff;  // fake return PC
  ustack[1] = argc;
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100cd5:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)

  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100cdb:	e8 e0 62 00 00       	call   80106fc0 <copyout>
80100ce0:	83 c4 10             	add    $0x10,%esp
80100ce3:	85 c0                	test   %eax,%eax
80100ce5:	0f 88 b8 fe ff ff    	js     80100ba3 <exec+0x1b3>
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100ceb:	8b 45 08             	mov    0x8(%ebp),%eax
80100cee:	0f b6 10             	movzbl (%eax),%edx
80100cf1:	84 d2                	test   %dl,%dl
80100cf3:	74 1a                	je     80100d0f <exec+0x31f>
80100cf5:	8b 4d 08             	mov    0x8(%ebp),%ecx
80100cf8:	83 c0 01             	add    $0x1,%eax
    if(*s == '/')
      last = s+1;
80100cfb:	80 fa 2f             	cmp    $0x2f,%dl
80100cfe:	0f 44 c8             	cmove  %eax,%ecx
80100d01:	83 c0 01             	add    $0x1,%eax
  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100d04:	0f b6 50 ff          	movzbl -0x1(%eax),%edx
80100d08:	84 d2                	test   %dl,%dl
80100d0a:	75 ef                	jne    80100cfb <exec+0x30b>
80100d0c:	89 4d 08             	mov    %ecx,0x8(%ebp)
    if(*s == '/')
      last = s+1;
  safestrcpy(curproc->name, last, sizeof(curproc->name));
80100d0f:	8b bd f4 fe ff ff    	mov    -0x10c(%ebp),%edi
80100d15:	50                   	push   %eax
80100d16:	6a 10                	push   $0x10
80100d18:	ff 75 08             	pushl  0x8(%ebp)
80100d1b:	89 f8                	mov    %edi,%eax
80100d1d:	83 c0 6c             	add    $0x6c,%eax
80100d20:	50                   	push   %eax
80100d21:	e8 0a 39 00 00       	call   80104630 <safestrcpy>

  // Commit to the user image.
  oldpgdir = curproc->pgdir;
  curproc->pgdir = pgdir;
80100d26:	8b 8d f0 fe ff ff    	mov    -0x110(%ebp),%ecx
    if(*s == '/')
      last = s+1;
  safestrcpy(curproc->name, last, sizeof(curproc->name));

  // Commit to the user image.
  oldpgdir = curproc->pgdir;
80100d2c:	89 f8                	mov    %edi,%eax
80100d2e:	8b 7f 04             	mov    0x4(%edi),%edi
  curproc->pgdir = pgdir;
  curproc->sz = sz;
80100d31:	89 30                	mov    %esi,(%eax)
      last = s+1;
  safestrcpy(curproc->name, last, sizeof(curproc->name));

  // Commit to the user image.
  oldpgdir = curproc->pgdir;
  curproc->pgdir = pgdir;
80100d33:	89 48 04             	mov    %ecx,0x4(%eax)
  curproc->sz = sz;
  curproc->tf->eip = elf.entry;  // main
80100d36:	89 c1                	mov    %eax,%ecx
80100d38:	8b 95 3c ff ff ff    	mov    -0xc4(%ebp),%edx
80100d3e:	8b 40 18             	mov    0x18(%eax),%eax
80100d41:	89 50 38             	mov    %edx,0x38(%eax)
  curproc->tf->esp = sp;
80100d44:	8b 41 18             	mov    0x18(%ecx),%eax
80100d47:	89 58 44             	mov    %ebx,0x44(%eax)
  curproc->numPages = 1;
80100d4a:	c7 41 7c 01 00 00 00 	movl   $0x1,0x7c(%ecx)
  switchuvm(curproc);
80100d51:	89 0c 24             	mov    %ecx,(%esp)
80100d54:	e8 c7 5b 00 00       	call   80106920 <switchuvm>
  freevm(oldpgdir);
80100d59:	89 3c 24             	mov    %edi,(%esp)
80100d5c:	e8 3f 5f 00 00       	call   80106ca0 <freevm>
  return 0;
80100d61:	83 c4 10             	add    $0x10,%esp
80100d64:	31 c0                	xor    %eax,%eax
80100d66:	e9 f1 fc ff ff       	jmp    80100a5c <exec+0x6c>
80100d6b:	66 90                	xchg   %ax,%ax
80100d6d:	66 90                	xchg   %ax,%ax
80100d6f:	90                   	nop

80100d70 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
80100d70:	55                   	push   %ebp
80100d71:	89 e5                	mov    %esp,%ebp
80100d73:	83 ec 10             	sub    $0x10,%esp
  initlock(&ftable.lock, "ftable");
80100d76:	68 6d 71 10 80       	push   $0x8010716d
80100d7b:	68 c0 ff 10 80       	push   $0x8010ffc0
80100d80:	e8 3b 34 00 00       	call   801041c0 <initlock>
}
80100d85:	83 c4 10             	add    $0x10,%esp
80100d88:	c9                   	leave  
80100d89:	c3                   	ret    
80100d8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100d90 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
80100d90:	55                   	push   %ebp
80100d91:	89 e5                	mov    %esp,%ebp
80100d93:	53                   	push   %ebx
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100d94:	bb f4 ff 10 80       	mov    $0x8010fff4,%ebx
}

// Allocate a file structure.
struct file*
filealloc(void)
{
80100d99:	83 ec 10             	sub    $0x10,%esp
  struct file *f;

  acquire(&ftable.lock);
80100d9c:	68 c0 ff 10 80       	push   $0x8010ffc0
80100da1:	e8 1a 35 00 00       	call   801042c0 <acquire>
80100da6:	83 c4 10             	add    $0x10,%esp
80100da9:	eb 10                	jmp    80100dbb <filealloc+0x2b>
80100dab:	90                   	nop
80100dac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100db0:	83 c3 18             	add    $0x18,%ebx
80100db3:	81 fb 54 09 11 80    	cmp    $0x80110954,%ebx
80100db9:	74 25                	je     80100de0 <filealloc+0x50>
    if(f->ref == 0){
80100dbb:	8b 43 04             	mov    0x4(%ebx),%eax
80100dbe:	85 c0                	test   %eax,%eax
80100dc0:	75 ee                	jne    80100db0 <filealloc+0x20>
      f->ref = 1;
      release(&ftable.lock);
80100dc2:	83 ec 0c             	sub    $0xc,%esp
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    if(f->ref == 0){
      f->ref = 1;
80100dc5:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
      release(&ftable.lock);
80100dcc:	68 c0 ff 10 80       	push   $0x8010ffc0
80100dd1:	e8 0a 36 00 00       	call   801043e0 <release>
      return f;
80100dd6:	89 d8                	mov    %ebx,%eax
80100dd8:	83 c4 10             	add    $0x10,%esp
    }
  }
  release(&ftable.lock);
  return 0;
}
80100ddb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100dde:	c9                   	leave  
80100ddf:	c3                   	ret    
      f->ref = 1;
      release(&ftable.lock);
      return f;
    }
  }
  release(&ftable.lock);
80100de0:	83 ec 0c             	sub    $0xc,%esp
80100de3:	68 c0 ff 10 80       	push   $0x8010ffc0
80100de8:	e8 f3 35 00 00       	call   801043e0 <release>
  return 0;
80100ded:	83 c4 10             	add    $0x10,%esp
80100df0:	31 c0                	xor    %eax,%eax
}
80100df2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100df5:	c9                   	leave  
80100df6:	c3                   	ret    
80100df7:	89 f6                	mov    %esi,%esi
80100df9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100e00 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
80100e00:	55                   	push   %ebp
80100e01:	89 e5                	mov    %esp,%ebp
80100e03:	53                   	push   %ebx
80100e04:	83 ec 10             	sub    $0x10,%esp
80100e07:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ftable.lock);
80100e0a:	68 c0 ff 10 80       	push   $0x8010ffc0
80100e0f:	e8 ac 34 00 00       	call   801042c0 <acquire>
  if(f->ref < 1)
80100e14:	8b 43 04             	mov    0x4(%ebx),%eax
80100e17:	83 c4 10             	add    $0x10,%esp
80100e1a:	85 c0                	test   %eax,%eax
80100e1c:	7e 1a                	jle    80100e38 <filedup+0x38>
    panic("filedup");
  f->ref++;
80100e1e:	83 c0 01             	add    $0x1,%eax
  release(&ftable.lock);
80100e21:	83 ec 0c             	sub    $0xc,%esp
filedup(struct file *f)
{
  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("filedup");
  f->ref++;
80100e24:	89 43 04             	mov    %eax,0x4(%ebx)
  release(&ftable.lock);
80100e27:	68 c0 ff 10 80       	push   $0x8010ffc0
80100e2c:	e8 af 35 00 00       	call   801043e0 <release>
  return f;
}
80100e31:	89 d8                	mov    %ebx,%eax
80100e33:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e36:	c9                   	leave  
80100e37:	c3                   	ret    
struct file*
filedup(struct file *f)
{
  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("filedup");
80100e38:	83 ec 0c             	sub    $0xc,%esp
80100e3b:	68 74 71 10 80       	push   $0x80107174
80100e40:	e8 2b f5 ff ff       	call   80100370 <panic>
80100e45:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100e49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100e50 <fileclose>:
}

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
80100e50:	55                   	push   %ebp
80100e51:	89 e5                	mov    %esp,%ebp
80100e53:	57                   	push   %edi
80100e54:	56                   	push   %esi
80100e55:	53                   	push   %ebx
80100e56:	83 ec 28             	sub    $0x28,%esp
80100e59:	8b 7d 08             	mov    0x8(%ebp),%edi
  struct file ff;

  acquire(&ftable.lock);
80100e5c:	68 c0 ff 10 80       	push   $0x8010ffc0
80100e61:	e8 5a 34 00 00       	call   801042c0 <acquire>
  if(f->ref < 1)
80100e66:	8b 47 04             	mov    0x4(%edi),%eax
80100e69:	83 c4 10             	add    $0x10,%esp
80100e6c:	85 c0                	test   %eax,%eax
80100e6e:	0f 8e 9b 00 00 00    	jle    80100f0f <fileclose+0xbf>
    panic("fileclose");
  if(--f->ref > 0){
80100e74:	83 e8 01             	sub    $0x1,%eax
80100e77:	85 c0                	test   %eax,%eax
80100e79:	89 47 04             	mov    %eax,0x4(%edi)
80100e7c:	74 1a                	je     80100e98 <fileclose+0x48>
    release(&ftable.lock);
80100e7e:	c7 45 08 c0 ff 10 80 	movl   $0x8010ffc0,0x8(%ebp)
  else if(ff.type == FD_INODE){
    begin_op();
    iput(ff.ip);
    end_op();
  }
}
80100e85:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e88:	5b                   	pop    %ebx
80100e89:	5e                   	pop    %esi
80100e8a:	5f                   	pop    %edi
80100e8b:	5d                   	pop    %ebp

  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
80100e8c:	e9 4f 35 00 00       	jmp    801043e0 <release>
80100e91:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return;
  }
  ff = *f;
80100e98:	0f b6 47 09          	movzbl 0x9(%edi),%eax
80100e9c:	8b 1f                	mov    (%edi),%ebx
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);
80100e9e:	83 ec 0c             	sub    $0xc,%esp
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100ea1:	8b 77 0c             	mov    0xc(%edi),%esi
  f->ref = 0;
  f->type = FD_NONE;
80100ea4:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100eaa:	88 45 e7             	mov    %al,-0x19(%ebp)
80100ead:	8b 47 10             	mov    0x10(%edi),%eax
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);
80100eb0:	68 c0 ff 10 80       	push   $0x8010ffc0
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100eb5:	89 45 e0             	mov    %eax,-0x20(%ebp)
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);
80100eb8:	e8 23 35 00 00       	call   801043e0 <release>

  if(ff.type == FD_PIPE)
80100ebd:	83 c4 10             	add    $0x10,%esp
80100ec0:	83 fb 01             	cmp    $0x1,%ebx
80100ec3:	74 13                	je     80100ed8 <fileclose+0x88>
    pipeclose(ff.pipe, ff.writable);
  else if(ff.type == FD_INODE){
80100ec5:	83 fb 02             	cmp    $0x2,%ebx
80100ec8:	74 26                	je     80100ef0 <fileclose+0xa0>
    begin_op();
    iput(ff.ip);
    end_op();
  }
}
80100eca:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ecd:	5b                   	pop    %ebx
80100ece:	5e                   	pop    %esi
80100ecf:	5f                   	pop    %edi
80100ed0:	5d                   	pop    %ebp
80100ed1:	c3                   	ret    
80100ed2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);

  if(ff.type == FD_PIPE)
    pipeclose(ff.pipe, ff.writable);
80100ed8:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100edc:	83 ec 08             	sub    $0x8,%esp
80100edf:	53                   	push   %ebx
80100ee0:	56                   	push   %esi
80100ee1:	e8 2a 24 00 00       	call   80103310 <pipeclose>
80100ee6:	83 c4 10             	add    $0x10,%esp
80100ee9:	eb df                	jmp    80100eca <fileclose+0x7a>
80100eeb:	90                   	nop
80100eec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  else if(ff.type == FD_INODE){
    begin_op();
80100ef0:	e8 7b 1c 00 00       	call   80102b70 <begin_op>
    iput(ff.ip);
80100ef5:	83 ec 0c             	sub    $0xc,%esp
80100ef8:	ff 75 e0             	pushl  -0x20(%ebp)
80100efb:	e8 c0 08 00 00       	call   801017c0 <iput>
    end_op();
80100f00:	83 c4 10             	add    $0x10,%esp
  }
}
80100f03:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f06:	5b                   	pop    %ebx
80100f07:	5e                   	pop    %esi
80100f08:	5f                   	pop    %edi
80100f09:	5d                   	pop    %ebp
  if(ff.type == FD_PIPE)
    pipeclose(ff.pipe, ff.writable);
  else if(ff.type == FD_INODE){
    begin_op();
    iput(ff.ip);
    end_op();
80100f0a:	e9 d1 1c 00 00       	jmp    80102be0 <end_op>
{
  struct file ff;

  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("fileclose");
80100f0f:	83 ec 0c             	sub    $0xc,%esp
80100f12:	68 7c 71 10 80       	push   $0x8010717c
80100f17:	e8 54 f4 ff ff       	call   80100370 <panic>
80100f1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100f20 <filestat>:
}

// Get metadata about file f.
int
filestat(struct file *f, struct stat *st)
{
80100f20:	55                   	push   %ebp
80100f21:	89 e5                	mov    %esp,%ebp
80100f23:	53                   	push   %ebx
80100f24:	83 ec 04             	sub    $0x4,%esp
80100f27:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(f->type == FD_INODE){
80100f2a:	83 3b 02             	cmpl   $0x2,(%ebx)
80100f2d:	75 31                	jne    80100f60 <filestat+0x40>
    ilock(f->ip);
80100f2f:	83 ec 0c             	sub    $0xc,%esp
80100f32:	ff 73 10             	pushl  0x10(%ebx)
80100f35:	e8 56 07 00 00       	call   80101690 <ilock>
    stati(f->ip, st);
80100f3a:	58                   	pop    %eax
80100f3b:	5a                   	pop    %edx
80100f3c:	ff 75 0c             	pushl  0xc(%ebp)
80100f3f:	ff 73 10             	pushl  0x10(%ebx)
80100f42:	e8 f9 09 00 00       	call   80101940 <stati>
    iunlock(f->ip);
80100f47:	59                   	pop    %ecx
80100f48:	ff 73 10             	pushl  0x10(%ebx)
80100f4b:	e8 20 08 00 00       	call   80101770 <iunlock>
    return 0;
80100f50:	83 c4 10             	add    $0x10,%esp
80100f53:	31 c0                	xor    %eax,%eax
  }
  return -1;
}
80100f55:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f58:	c9                   	leave  
80100f59:	c3                   	ret    
80100f5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    ilock(f->ip);
    stati(f->ip, st);
    iunlock(f->ip);
    return 0;
  }
  return -1;
80100f60:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100f65:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f68:	c9                   	leave  
80100f69:	c3                   	ret    
80100f6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100f70 <fileread>:

// Read from file f.
int
fileread(struct file *f, char *addr, int n)
{
80100f70:	55                   	push   %ebp
80100f71:	89 e5                	mov    %esp,%ebp
80100f73:	57                   	push   %edi
80100f74:	56                   	push   %esi
80100f75:	53                   	push   %ebx
80100f76:	83 ec 0c             	sub    $0xc,%esp
80100f79:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f7c:	8b 75 0c             	mov    0xc(%ebp),%esi
80100f7f:	8b 7d 10             	mov    0x10(%ebp),%edi
  int r;

  if(f->readable == 0)
80100f82:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100f86:	74 60                	je     80100fe8 <fileread+0x78>
    return -1;
  if(f->type == FD_PIPE)
80100f88:	8b 03                	mov    (%ebx),%eax
80100f8a:	83 f8 01             	cmp    $0x1,%eax
80100f8d:	74 41                	je     80100fd0 <fileread+0x60>
    return piperead(f->pipe, addr, n);
  if(f->type == FD_INODE){
80100f8f:	83 f8 02             	cmp    $0x2,%eax
80100f92:	75 5b                	jne    80100fef <fileread+0x7f>
    ilock(f->ip);
80100f94:	83 ec 0c             	sub    $0xc,%esp
80100f97:	ff 73 10             	pushl  0x10(%ebx)
80100f9a:	e8 f1 06 00 00       	call   80101690 <ilock>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
80100f9f:	57                   	push   %edi
80100fa0:	ff 73 14             	pushl  0x14(%ebx)
80100fa3:	56                   	push   %esi
80100fa4:	ff 73 10             	pushl  0x10(%ebx)
80100fa7:	e8 c4 09 00 00       	call   80101970 <readi>
80100fac:	83 c4 20             	add    $0x20,%esp
80100faf:	85 c0                	test   %eax,%eax
80100fb1:	89 c6                	mov    %eax,%esi
80100fb3:	7e 03                	jle    80100fb8 <fileread+0x48>
      f->off += r;
80100fb5:	01 43 14             	add    %eax,0x14(%ebx)
    iunlock(f->ip);
80100fb8:	83 ec 0c             	sub    $0xc,%esp
80100fbb:	ff 73 10             	pushl  0x10(%ebx)
80100fbe:	e8 ad 07 00 00       	call   80101770 <iunlock>
    return r;
80100fc3:	83 c4 10             	add    $0x10,%esp
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
  if(f->type == FD_INODE){
    ilock(f->ip);
    if((r = readi(f->ip, addr, f->off, n)) > 0)
80100fc6:	89 f0                	mov    %esi,%eax
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
}
80100fc8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fcb:	5b                   	pop    %ebx
80100fcc:	5e                   	pop    %esi
80100fcd:	5f                   	pop    %edi
80100fce:	5d                   	pop    %ebp
80100fcf:	c3                   	ret    
  int r;

  if(f->readable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
80100fd0:	8b 43 0c             	mov    0xc(%ebx),%eax
80100fd3:	89 45 08             	mov    %eax,0x8(%ebp)
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
}
80100fd6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fd9:	5b                   	pop    %ebx
80100fda:	5e                   	pop    %esi
80100fdb:	5f                   	pop    %edi
80100fdc:	5d                   	pop    %ebp
  int r;

  if(f->readable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
80100fdd:	e9 ce 24 00 00       	jmp    801034b0 <piperead>
80100fe2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
fileread(struct file *f, char *addr, int n)
{
  int r;

  if(f->readable == 0)
    return -1;
80100fe8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100fed:	eb d9                	jmp    80100fc8 <fileread+0x58>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
80100fef:	83 ec 0c             	sub    $0xc,%esp
80100ff2:	68 86 71 10 80       	push   $0x80107186
80100ff7:	e8 74 f3 ff ff       	call   80100370 <panic>
80100ffc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101000 <filewrite>:

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
80101000:	55                   	push   %ebp
80101001:	89 e5                	mov    %esp,%ebp
80101003:	57                   	push   %edi
80101004:	56                   	push   %esi
80101005:	53                   	push   %ebx
80101006:	83 ec 1c             	sub    $0x1c,%esp
80101009:	8b 75 08             	mov    0x8(%ebp),%esi
8010100c:	8b 45 0c             	mov    0xc(%ebp),%eax
  int r;

  if(f->writable == 0)
8010100f:	80 7e 09 00          	cmpb   $0x0,0x9(%esi)

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
80101013:	89 45 dc             	mov    %eax,-0x24(%ebp)
80101016:	8b 45 10             	mov    0x10(%ebp),%eax
80101019:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int r;

  if(f->writable == 0)
8010101c:	0f 84 aa 00 00 00    	je     801010cc <filewrite+0xcc>
    return -1;
  if(f->type == FD_PIPE)
80101022:	8b 06                	mov    (%esi),%eax
80101024:	83 f8 01             	cmp    $0x1,%eax
80101027:	0f 84 c2 00 00 00    	je     801010ef <filewrite+0xef>
    return pipewrite(f->pipe, addr, n);
  if(f->type == FD_INODE){
8010102d:	83 f8 02             	cmp    $0x2,%eax
80101030:	0f 85 d8 00 00 00    	jne    8010110e <filewrite+0x10e>
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((LOGSIZE-1-1-2) / 2) * 512;
    int i = 0;
    while(i < n){
80101036:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101039:	31 ff                	xor    %edi,%edi
8010103b:	85 c0                	test   %eax,%eax
8010103d:	7f 34                	jg     80101073 <filewrite+0x73>
8010103f:	e9 9c 00 00 00       	jmp    801010e0 <filewrite+0xe0>
80101044:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        n1 = max;

      begin_op();
      ilock(f->ip);
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
        f->off += r;
80101048:	01 46 14             	add    %eax,0x14(%esi)
      iunlock(f->ip);
8010104b:	83 ec 0c             	sub    $0xc,%esp
8010104e:	ff 76 10             	pushl  0x10(%esi)
        n1 = max;

      begin_op();
      ilock(f->ip);
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
        f->off += r;
80101051:	89 45 e0             	mov    %eax,-0x20(%ebp)
      iunlock(f->ip);
80101054:	e8 17 07 00 00       	call   80101770 <iunlock>
      end_op();
80101059:	e8 82 1b 00 00       	call   80102be0 <end_op>
8010105e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101061:	83 c4 10             	add    $0x10,%esp

      if(r < 0)
        break;
      if(r != n1)
80101064:	39 d8                	cmp    %ebx,%eax
80101066:	0f 85 95 00 00 00    	jne    80101101 <filewrite+0x101>
        panic("short filewrite");
      i += r;
8010106c:	01 c7                	add    %eax,%edi
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((LOGSIZE-1-1-2) / 2) * 512;
    int i = 0;
    while(i < n){
8010106e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101071:	7e 6d                	jle    801010e0 <filewrite+0xe0>
      int n1 = n - i;
80101073:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101076:	b8 00 1a 00 00       	mov    $0x1a00,%eax
8010107b:	29 fb                	sub    %edi,%ebx
8010107d:	81 fb 00 1a 00 00    	cmp    $0x1a00,%ebx
80101083:	0f 4f d8             	cmovg  %eax,%ebx
      if(n1 > max)
        n1 = max;

      begin_op();
80101086:	e8 e5 1a 00 00       	call   80102b70 <begin_op>
      ilock(f->ip);
8010108b:	83 ec 0c             	sub    $0xc,%esp
8010108e:	ff 76 10             	pushl  0x10(%esi)
80101091:	e8 fa 05 00 00       	call   80101690 <ilock>
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
80101096:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101099:	53                   	push   %ebx
8010109a:	ff 76 14             	pushl  0x14(%esi)
8010109d:	01 f8                	add    %edi,%eax
8010109f:	50                   	push   %eax
801010a0:	ff 76 10             	pushl  0x10(%esi)
801010a3:	e8 c8 09 00 00       	call   80101a70 <writei>
801010a8:	83 c4 20             	add    $0x20,%esp
801010ab:	85 c0                	test   %eax,%eax
801010ad:	7f 99                	jg     80101048 <filewrite+0x48>
        f->off += r;
      iunlock(f->ip);
801010af:	83 ec 0c             	sub    $0xc,%esp
801010b2:	ff 76 10             	pushl  0x10(%esi)
801010b5:	89 45 e0             	mov    %eax,-0x20(%ebp)
801010b8:	e8 b3 06 00 00       	call   80101770 <iunlock>
      end_op();
801010bd:	e8 1e 1b 00 00       	call   80102be0 <end_op>

      if(r < 0)
801010c2:	8b 45 e0             	mov    -0x20(%ebp),%eax
801010c5:	83 c4 10             	add    $0x10,%esp
801010c8:	85 c0                	test   %eax,%eax
801010ca:	74 98                	je     80101064 <filewrite+0x64>
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
}
801010cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        break;
      if(r != n1)
        panic("short filewrite");
      i += r;
    }
    return i == n ? n : -1;
801010cf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  panic("filewrite");
}
801010d4:	5b                   	pop    %ebx
801010d5:	5e                   	pop    %esi
801010d6:	5f                   	pop    %edi
801010d7:	5d                   	pop    %ebp
801010d8:	c3                   	ret    
801010d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        break;
      if(r != n1)
        panic("short filewrite");
      i += r;
    }
    return i == n ? n : -1;
801010e0:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
801010e3:	75 e7                	jne    801010cc <filewrite+0xcc>
  }
  panic("filewrite");
}
801010e5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010e8:	89 f8                	mov    %edi,%eax
801010ea:	5b                   	pop    %ebx
801010eb:	5e                   	pop    %esi
801010ec:	5f                   	pop    %edi
801010ed:	5d                   	pop    %ebp
801010ee:	c3                   	ret    
  int r;

  if(f->writable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return pipewrite(f->pipe, addr, n);
801010ef:	8b 46 0c             	mov    0xc(%esi),%eax
801010f2:	89 45 08             	mov    %eax,0x8(%ebp)
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
}
801010f5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010f8:	5b                   	pop    %ebx
801010f9:	5e                   	pop    %esi
801010fa:	5f                   	pop    %edi
801010fb:	5d                   	pop    %ebp
  int r;

  if(f->writable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return pipewrite(f->pipe, addr, n);
801010fc:	e9 af 22 00 00       	jmp    801033b0 <pipewrite>
      end_op();

      if(r < 0)
        break;
      if(r != n1)
        panic("short filewrite");
80101101:	83 ec 0c             	sub    $0xc,%esp
80101104:	68 8f 71 10 80       	push   $0x8010718f
80101109:	e8 62 f2 ff ff       	call   80100370 <panic>
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
8010110e:	83 ec 0c             	sub    $0xc,%esp
80101111:	68 95 71 10 80       	push   $0x80107195
80101116:	e8 55 f2 ff ff       	call   80100370 <panic>
8010111b:	66 90                	xchg   %ax,%ax
8010111d:	66 90                	xchg   %ax,%ax
8010111f:	90                   	nop

80101120 <balloc>:
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
80101120:	55                   	push   %ebp
80101121:	89 e5                	mov    %esp,%ebp
80101123:	57                   	push   %edi
80101124:	56                   	push   %esi
80101125:	53                   	push   %ebx
80101126:	83 ec 1c             	sub    $0x1c,%esp
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
80101129:	8b 0d c0 09 11 80    	mov    0x801109c0,%ecx
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
8010112f:	89 45 d8             	mov    %eax,-0x28(%ebp)
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
80101132:	85 c9                	test   %ecx,%ecx
80101134:	0f 84 85 00 00 00    	je     801011bf <balloc+0x9f>
8010113a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    bp = bread(dev, BBLOCK(b, sb));
80101141:	8b 75 dc             	mov    -0x24(%ebp),%esi
80101144:	83 ec 08             	sub    $0x8,%esp
80101147:	89 f0                	mov    %esi,%eax
80101149:	c1 f8 0c             	sar    $0xc,%eax
8010114c:	03 05 d8 09 11 80    	add    0x801109d8,%eax
80101152:	50                   	push   %eax
80101153:	ff 75 d8             	pushl  -0x28(%ebp)
80101156:	e8 75 ef ff ff       	call   801000d0 <bread>
8010115b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010115e:	a1 c0 09 11 80       	mov    0x801109c0,%eax
80101163:	83 c4 10             	add    $0x10,%esp
80101166:	89 45 e0             	mov    %eax,-0x20(%ebp)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
80101169:	31 c0                	xor    %eax,%eax
8010116b:	eb 2d                	jmp    8010119a <balloc+0x7a>
8010116d:	8d 76 00             	lea    0x0(%esi),%esi
      m = 1 << (bi % 8);
80101170:	89 c1                	mov    %eax,%ecx
80101172:	ba 01 00 00 00       	mov    $0x1,%edx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
80101177:	8b 5d e4             	mov    -0x1c(%ebp),%ebx

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
8010117a:	83 e1 07             	and    $0x7,%ecx
8010117d:	d3 e2                	shl    %cl,%edx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
8010117f:	89 c1                	mov    %eax,%ecx
80101181:	c1 f9 03             	sar    $0x3,%ecx
80101184:	0f b6 7c 0b 5c       	movzbl 0x5c(%ebx,%ecx,1),%edi
80101189:	85 d7                	test   %edx,%edi
8010118b:	74 43                	je     801011d0 <balloc+0xb0>
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
8010118d:	83 c0 01             	add    $0x1,%eax
80101190:	83 c6 01             	add    $0x1,%esi
80101193:	3d 00 10 00 00       	cmp    $0x1000,%eax
80101198:	74 05                	je     8010119f <balloc+0x7f>
8010119a:	3b 75 e0             	cmp    -0x20(%ebp),%esi
8010119d:	72 d1                	jb     80101170 <balloc+0x50>
        brelse(bp);
        bzero(dev, b + bi);
        return b + bi;
      }
    }
    brelse(bp);
8010119f:	83 ec 0c             	sub    $0xc,%esp
801011a2:	ff 75 e4             	pushl  -0x1c(%ebp)
801011a5:	e8 36 f0 ff ff       	call   801001e0 <brelse>
{
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
801011aa:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
801011b1:	83 c4 10             	add    $0x10,%esp
801011b4:	8b 45 dc             	mov    -0x24(%ebp),%eax
801011b7:	39 05 c0 09 11 80    	cmp    %eax,0x801109c0
801011bd:	77 82                	ja     80101141 <balloc+0x21>
        return b + bi;
      }
    }
    brelse(bp);
  }
  panic("balloc: out of blocks");
801011bf:	83 ec 0c             	sub    $0xc,%esp
801011c2:	68 9f 71 10 80       	push   $0x8010719f
801011c7:	e8 a4 f1 ff ff       	call   80100370 <panic>
801011cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
      if((bp->data[bi/8] & m) == 0){  // Is block free?
        bp->data[bi/8] |= m;  // Mark block in use.
801011d0:	09 fa                	or     %edi,%edx
801011d2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
        log_write(bp);
801011d5:	83 ec 0c             	sub    $0xc,%esp
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
      if((bp->data[bi/8] & m) == 0){  // Is block free?
        bp->data[bi/8] |= m;  // Mark block in use.
801011d8:	88 54 0f 5c          	mov    %dl,0x5c(%edi,%ecx,1)
        log_write(bp);
801011dc:	57                   	push   %edi
801011dd:	e8 6e 1b 00 00       	call   80102d50 <log_write>
        brelse(bp);
801011e2:	89 3c 24             	mov    %edi,(%esp)
801011e5:	e8 f6 ef ff ff       	call   801001e0 <brelse>
static void
bzero(int dev, int bno)
{
  struct buf *bp;

  bp = bread(dev, bno);
801011ea:	58                   	pop    %eax
801011eb:	5a                   	pop    %edx
801011ec:	56                   	push   %esi
801011ed:	ff 75 d8             	pushl  -0x28(%ebp)
801011f0:	e8 db ee ff ff       	call   801000d0 <bread>
801011f5:	89 c3                	mov    %eax,%ebx
  memset(bp->data, 0, BSIZE);
801011f7:	8d 40 5c             	lea    0x5c(%eax),%eax
801011fa:	83 c4 0c             	add    $0xc,%esp
801011fd:	68 00 02 00 00       	push   $0x200
80101202:	6a 00                	push   $0x0
80101204:	50                   	push   %eax
80101205:	e8 26 32 00 00       	call   80104430 <memset>
  log_write(bp);
8010120a:	89 1c 24             	mov    %ebx,(%esp)
8010120d:	e8 3e 1b 00 00       	call   80102d50 <log_write>
  brelse(bp);
80101212:	89 1c 24             	mov    %ebx,(%esp)
80101215:	e8 c6 ef ff ff       	call   801001e0 <brelse>
      }
    }
    brelse(bp);
  }
  panic("balloc: out of blocks");
}
8010121a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010121d:	89 f0                	mov    %esi,%eax
8010121f:	5b                   	pop    %ebx
80101220:	5e                   	pop    %esi
80101221:	5f                   	pop    %edi
80101222:	5d                   	pop    %ebp
80101223:	c3                   	ret    
80101224:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010122a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101230 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
80101230:	55                   	push   %ebp
80101231:	89 e5                	mov    %esp,%ebp
80101233:	57                   	push   %edi
80101234:	56                   	push   %esi
80101235:	53                   	push   %ebx
80101236:	89 c7                	mov    %eax,%edi
  struct inode *ip, *empty;

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
80101238:	31 f6                	xor    %esi,%esi
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010123a:	bb 14 0a 11 80       	mov    $0x80110a14,%ebx
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
8010123f:	83 ec 28             	sub    $0x28,%esp
80101242:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  struct inode *ip, *empty;

  acquire(&icache.lock);
80101245:	68 e0 09 11 80       	push   $0x801109e0
8010124a:	e8 71 30 00 00       	call   801042c0 <acquire>
8010124f:	83 c4 10             	add    $0x10,%esp

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101252:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101255:	eb 1b                	jmp    80101272 <iget+0x42>
80101257:	89 f6                	mov    %esi,%esi
80101259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
80101260:	85 f6                	test   %esi,%esi
80101262:	74 44                	je     801012a8 <iget+0x78>

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101264:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010126a:	81 fb 34 26 11 80    	cmp    $0x80112634,%ebx
80101270:	74 4e                	je     801012c0 <iget+0x90>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
80101272:	8b 4b 08             	mov    0x8(%ebx),%ecx
80101275:	85 c9                	test   %ecx,%ecx
80101277:	7e e7                	jle    80101260 <iget+0x30>
80101279:	39 3b                	cmp    %edi,(%ebx)
8010127b:	75 e3                	jne    80101260 <iget+0x30>
8010127d:	39 53 04             	cmp    %edx,0x4(%ebx)
80101280:	75 de                	jne    80101260 <iget+0x30>
      ip->ref++;
      release(&icache.lock);
80101282:	83 ec 0c             	sub    $0xc,%esp

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
80101285:	83 c1 01             	add    $0x1,%ecx
      release(&icache.lock);
      return ip;
80101288:	89 de                	mov    %ebx,%esi
  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
8010128a:	68 e0 09 11 80       	push   $0x801109e0

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
8010128f:	89 4b 08             	mov    %ecx,0x8(%ebx)
      release(&icache.lock);
80101292:	e8 49 31 00 00       	call   801043e0 <release>
      return ip;
80101297:	83 c4 10             	add    $0x10,%esp
  ip->ref = 1;
  ip->valid = 0;
  release(&icache.lock);

  return ip;
}
8010129a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010129d:	89 f0                	mov    %esi,%eax
8010129f:	5b                   	pop    %ebx
801012a0:	5e                   	pop    %esi
801012a1:	5f                   	pop    %edi
801012a2:	5d                   	pop    %ebp
801012a3:	c3                   	ret    
801012a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
801012a8:	85 c9                	test   %ecx,%ecx
801012aa:	0f 44 f3             	cmove  %ebx,%esi

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
801012ad:	81 c3 90 00 00 00    	add    $0x90,%ebx
801012b3:	81 fb 34 26 11 80    	cmp    $0x80112634,%ebx
801012b9:	75 b7                	jne    80101272 <iget+0x42>
801012bb:	90                   	nop
801012bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
801012c0:	85 f6                	test   %esi,%esi
801012c2:	74 2d                	je     801012f1 <iget+0xc1>
  ip = empty;
  ip->dev = dev;
  ip->inum = inum;
  ip->ref = 1;
  ip->valid = 0;
  release(&icache.lock);
801012c4:	83 ec 0c             	sub    $0xc,%esp
  // Recycle an inode cache entry.
  if(empty == 0)
    panic("iget: no inodes");

  ip = empty;
  ip->dev = dev;
801012c7:	89 3e                	mov    %edi,(%esi)
  ip->inum = inum;
801012c9:	89 56 04             	mov    %edx,0x4(%esi)
  ip->ref = 1;
801012cc:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
  ip->valid = 0;
801012d3:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
  release(&icache.lock);
801012da:	68 e0 09 11 80       	push   $0x801109e0
801012df:	e8 fc 30 00 00       	call   801043e0 <release>

  return ip;
801012e4:	83 c4 10             	add    $0x10,%esp
}
801012e7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012ea:	89 f0                	mov    %esi,%eax
801012ec:	5b                   	pop    %ebx
801012ed:	5e                   	pop    %esi
801012ee:	5f                   	pop    %edi
801012ef:	5d                   	pop    %ebp
801012f0:	c3                   	ret    
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
    panic("iget: no inodes");
801012f1:	83 ec 0c             	sub    $0xc,%esp
801012f4:	68 b5 71 10 80       	push   $0x801071b5
801012f9:	e8 72 f0 ff ff       	call   80100370 <panic>
801012fe:	66 90                	xchg   %ax,%ax

80101300 <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
80101300:	55                   	push   %ebp
80101301:	89 e5                	mov    %esp,%ebp
80101303:	57                   	push   %edi
80101304:	56                   	push   %esi
80101305:	53                   	push   %ebx
80101306:	89 c6                	mov    %eax,%esi
80101308:	83 ec 1c             	sub    $0x1c,%esp
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
8010130b:	83 fa 0b             	cmp    $0xb,%edx
8010130e:	77 18                	ja     80101328 <bmap+0x28>
80101310:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
    if((addr = ip->addrs[bn]) == 0)
80101313:	8b 43 5c             	mov    0x5c(%ebx),%eax
80101316:	85 c0                	test   %eax,%eax
80101318:	74 76                	je     80101390 <bmap+0x90>
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
}
8010131a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010131d:	5b                   	pop    %ebx
8010131e:	5e                   	pop    %esi
8010131f:	5f                   	pop    %edi
80101320:	5d                   	pop    %ebp
80101321:	c3                   	ret    
80101322:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if(bn < NDIRECT){
    if((addr = ip->addrs[bn]) == 0)
      ip->addrs[bn] = addr = balloc(ip->dev);
    return addr;
  }
  bn -= NDIRECT;
80101328:	8d 5a f4             	lea    -0xc(%edx),%ebx

  if(bn < NINDIRECT){
8010132b:	83 fb 7f             	cmp    $0x7f,%ebx
8010132e:	0f 87 83 00 00 00    	ja     801013b7 <bmap+0xb7>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
80101334:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
8010133a:	85 c0                	test   %eax,%eax
8010133c:	74 6a                	je     801013a8 <bmap+0xa8>
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
8010133e:	83 ec 08             	sub    $0x8,%esp
80101341:	50                   	push   %eax
80101342:	ff 36                	pushl  (%esi)
80101344:	e8 87 ed ff ff       	call   801000d0 <bread>
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
80101349:	8d 54 98 5c          	lea    0x5c(%eax,%ebx,4),%edx
8010134d:	83 c4 10             	add    $0x10,%esp

  if(bn < NINDIRECT){
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
80101350:	89 c7                	mov    %eax,%edi
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
80101352:	8b 1a                	mov    (%edx),%ebx
80101354:	85 db                	test   %ebx,%ebx
80101356:	75 1d                	jne    80101375 <bmap+0x75>
      a[bn] = addr = balloc(ip->dev);
80101358:	8b 06                	mov    (%esi),%eax
8010135a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010135d:	e8 be fd ff ff       	call   80101120 <balloc>
80101362:	8b 55 e4             	mov    -0x1c(%ebp),%edx
      log_write(bp);
80101365:	83 ec 0c             	sub    $0xc,%esp
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
      a[bn] = addr = balloc(ip->dev);
80101368:	89 c3                	mov    %eax,%ebx
8010136a:	89 02                	mov    %eax,(%edx)
      log_write(bp);
8010136c:	57                   	push   %edi
8010136d:	e8 de 19 00 00       	call   80102d50 <log_write>
80101372:	83 c4 10             	add    $0x10,%esp
    }
    brelse(bp);
80101375:	83 ec 0c             	sub    $0xc,%esp
80101378:	57                   	push   %edi
80101379:	e8 62 ee ff ff       	call   801001e0 <brelse>
8010137e:	83 c4 10             	add    $0x10,%esp
    return addr;
  }

  panic("bmap: out of range");
}
80101381:	8d 65 f4             	lea    -0xc(%ebp),%esp
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
      a[bn] = addr = balloc(ip->dev);
      log_write(bp);
    }
    brelse(bp);
80101384:	89 d8                	mov    %ebx,%eax
    return addr;
  }

  panic("bmap: out of range");
}
80101386:	5b                   	pop    %ebx
80101387:	5e                   	pop    %esi
80101388:	5f                   	pop    %edi
80101389:	5d                   	pop    %ebp
8010138a:	c3                   	ret    
8010138b:	90                   	nop
8010138c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
    if((addr = ip->addrs[bn]) == 0)
      ip->addrs[bn] = addr = balloc(ip->dev);
80101390:	8b 06                	mov    (%esi),%eax
80101392:	e8 89 fd ff ff       	call   80101120 <balloc>
80101397:	89 43 5c             	mov    %eax,0x5c(%ebx)
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
}
8010139a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010139d:	5b                   	pop    %ebx
8010139e:	5e                   	pop    %esi
8010139f:	5f                   	pop    %edi
801013a0:	5d                   	pop    %ebp
801013a1:	c3                   	ret    
801013a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  bn -= NDIRECT;

  if(bn < NINDIRECT){
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
801013a8:	8b 06                	mov    (%esi),%eax
801013aa:	e8 71 fd ff ff       	call   80101120 <balloc>
801013af:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
801013b5:	eb 87                	jmp    8010133e <bmap+0x3e>
    }
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
801013b7:	83 ec 0c             	sub    $0xc,%esp
801013ba:	68 c5 71 10 80       	push   $0x801071c5
801013bf:	e8 ac ef ff ff       	call   80100370 <panic>
801013c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801013ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801013d0 <readsb>:
struct superblock sb; 

// Read the super block.
void
readsb(int dev, struct superblock *sb)
{
801013d0:	55                   	push   %ebp
801013d1:	89 e5                	mov    %esp,%ebp
801013d3:	56                   	push   %esi
801013d4:	53                   	push   %ebx
801013d5:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct buf *bp;

  bp = bread(dev, 1);
801013d8:	83 ec 08             	sub    $0x8,%esp
801013db:	6a 01                	push   $0x1
801013dd:	ff 75 08             	pushl  0x8(%ebp)
801013e0:	e8 eb ec ff ff       	call   801000d0 <bread>
801013e5:	89 c3                	mov    %eax,%ebx
  memmove(sb, bp->data, sizeof(*sb));
801013e7:	8d 40 5c             	lea    0x5c(%eax),%eax
801013ea:	83 c4 0c             	add    $0xc,%esp
801013ed:	6a 1c                	push   $0x1c
801013ef:	50                   	push   %eax
801013f0:	56                   	push   %esi
801013f1:	e8 ea 30 00 00       	call   801044e0 <memmove>
  brelse(bp);
801013f6:	89 5d 08             	mov    %ebx,0x8(%ebp)
801013f9:	83 c4 10             	add    $0x10,%esp
}
801013fc:	8d 65 f8             	lea    -0x8(%ebp),%esp
801013ff:	5b                   	pop    %ebx
80101400:	5e                   	pop    %esi
80101401:	5d                   	pop    %ebp
{
  struct buf *bp;

  bp = bread(dev, 1);
  memmove(sb, bp->data, sizeof(*sb));
  brelse(bp);
80101402:	e9 d9 ed ff ff       	jmp    801001e0 <brelse>
80101407:	89 f6                	mov    %esi,%esi
80101409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101410 <bfree>:
}

// Free a disk block.
static void
bfree(int dev, uint b)
{
80101410:	55                   	push   %ebp
80101411:	89 e5                	mov    %esp,%ebp
80101413:	56                   	push   %esi
80101414:	53                   	push   %ebx
80101415:	89 d3                	mov    %edx,%ebx
80101417:	89 c6                	mov    %eax,%esi
  struct buf *bp;
  int bi, m;

  readsb(dev, &sb);
80101419:	83 ec 08             	sub    $0x8,%esp
8010141c:	68 c0 09 11 80       	push   $0x801109c0
80101421:	50                   	push   %eax
80101422:	e8 a9 ff ff ff       	call   801013d0 <readsb>
  bp = bread(dev, BBLOCK(b, sb));
80101427:	58                   	pop    %eax
80101428:	5a                   	pop    %edx
80101429:	89 da                	mov    %ebx,%edx
8010142b:	c1 ea 0c             	shr    $0xc,%edx
8010142e:	03 15 d8 09 11 80    	add    0x801109d8,%edx
80101434:	52                   	push   %edx
80101435:	56                   	push   %esi
80101436:	e8 95 ec ff ff       	call   801000d0 <bread>
  bi = b % BPB;
  m = 1 << (bi % 8);
8010143b:	89 d9                	mov    %ebx,%ecx
  if((bp->data[bi/8] & m) == 0)
8010143d:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
  int bi, m;

  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
80101443:	ba 01 00 00 00       	mov    $0x1,%edx
80101448:	83 e1 07             	and    $0x7,%ecx
  if((bp->data[bi/8] & m) == 0)
8010144b:	c1 fb 03             	sar    $0x3,%ebx
8010144e:	83 c4 10             	add    $0x10,%esp
  int bi, m;

  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
80101451:	d3 e2                	shl    %cl,%edx
  if((bp->data[bi/8] & m) == 0)
80101453:	0f b6 4c 18 5c       	movzbl 0x5c(%eax,%ebx,1),%ecx
80101458:	85 d1                	test   %edx,%ecx
8010145a:	74 27                	je     80101483 <bfree+0x73>
8010145c:	89 c6                	mov    %eax,%esi
    panic("freeing free block");
  bp->data[bi/8] &= ~m;
8010145e:	f7 d2                	not    %edx
80101460:	89 c8                	mov    %ecx,%eax
  log_write(bp);
80101462:	83 ec 0c             	sub    $0xc,%esp
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
  if((bp->data[bi/8] & m) == 0)
    panic("freeing free block");
  bp->data[bi/8] &= ~m;
80101465:	21 d0                	and    %edx,%eax
80101467:	88 44 1e 5c          	mov    %al,0x5c(%esi,%ebx,1)
  log_write(bp);
8010146b:	56                   	push   %esi
8010146c:	e8 df 18 00 00       	call   80102d50 <log_write>
  brelse(bp);
80101471:	89 34 24             	mov    %esi,(%esp)
80101474:	e8 67 ed ff ff       	call   801001e0 <brelse>
}
80101479:	83 c4 10             	add    $0x10,%esp
8010147c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010147f:	5b                   	pop    %ebx
80101480:	5e                   	pop    %esi
80101481:	5d                   	pop    %ebp
80101482:	c3                   	ret    
  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
  if((bp->data[bi/8] & m) == 0)
    panic("freeing free block");
80101483:	83 ec 0c             	sub    $0xc,%esp
80101486:	68 d8 71 10 80       	push   $0x801071d8
8010148b:	e8 e0 ee ff ff       	call   80100370 <panic>

80101490 <iinit>:
  struct inode inode[NINODE];
} icache;

void
iinit(int dev)
{
80101490:	55                   	push   %ebp
80101491:	89 e5                	mov    %esp,%ebp
80101493:	53                   	push   %ebx
80101494:	bb 20 0a 11 80       	mov    $0x80110a20,%ebx
80101499:	83 ec 0c             	sub    $0xc,%esp
  int i = 0;
  
  initlock(&icache.lock, "icache");
8010149c:	68 eb 71 10 80       	push   $0x801071eb
801014a1:	68 e0 09 11 80       	push   $0x801109e0
801014a6:	e8 15 2d 00 00       	call   801041c0 <initlock>
801014ab:	83 c4 10             	add    $0x10,%esp
801014ae:	66 90                	xchg   %ax,%ax
  for(i = 0; i < NINODE; i++) {
    initsleeplock(&icache.inode[i].lock, "inode");
801014b0:	83 ec 08             	sub    $0x8,%esp
801014b3:	68 f2 71 10 80       	push   $0x801071f2
801014b8:	53                   	push   %ebx
801014b9:	81 c3 90 00 00 00    	add    $0x90,%ebx
801014bf:	e8 ec 2b 00 00       	call   801040b0 <initsleeplock>
iinit(int dev)
{
  int i = 0;
  
  initlock(&icache.lock, "icache");
  for(i = 0; i < NINODE; i++) {
801014c4:	83 c4 10             	add    $0x10,%esp
801014c7:	81 fb 40 26 11 80    	cmp    $0x80112640,%ebx
801014cd:	75 e1                	jne    801014b0 <iinit+0x20>
    initsleeplock(&icache.inode[i].lock, "inode");
  }

  readsb(dev, &sb);
801014cf:	83 ec 08             	sub    $0x8,%esp
801014d2:	68 c0 09 11 80       	push   $0x801109c0
801014d7:	ff 75 08             	pushl  0x8(%ebp)
801014da:	e8 f1 fe ff ff       	call   801013d0 <readsb>
  cprintf("sb: size %d nblocks %d ninodes %d nlog %d logstart %d\
801014df:	ff 35 d8 09 11 80    	pushl  0x801109d8
801014e5:	ff 35 d4 09 11 80    	pushl  0x801109d4
801014eb:	ff 35 d0 09 11 80    	pushl  0x801109d0
801014f1:	ff 35 cc 09 11 80    	pushl  0x801109cc
801014f7:	ff 35 c8 09 11 80    	pushl  0x801109c8
801014fd:	ff 35 c4 09 11 80    	pushl  0x801109c4
80101503:	ff 35 c0 09 11 80    	pushl  0x801109c0
80101509:	68 58 72 10 80       	push   $0x80107258
8010150e:	e8 4d f1 ff ff       	call   80100660 <cprintf>
 inodestart %d bmap start %d\n", sb.size, sb.nblocks,
          sb.ninodes, sb.nlog, sb.logstart, sb.inodestart,
          sb.bmapstart);
}
80101513:	83 c4 30             	add    $0x30,%esp
80101516:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101519:	c9                   	leave  
8010151a:	c3                   	ret    
8010151b:	90                   	nop
8010151c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101520 <ialloc>:
// Allocate an inode on device dev.
// Mark it as allocated by  giving it type type.
// Returns an unlocked but allocated and referenced inode.
struct inode*
ialloc(uint dev, short type)
{
80101520:	55                   	push   %ebp
80101521:	89 e5                	mov    %esp,%ebp
80101523:	57                   	push   %edi
80101524:	56                   	push   %esi
80101525:	53                   	push   %ebx
80101526:	83 ec 1c             	sub    $0x1c,%esp
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
80101529:	83 3d c8 09 11 80 01 	cmpl   $0x1,0x801109c8
// Allocate an inode on device dev.
// Mark it as allocated by  giving it type type.
// Returns an unlocked but allocated and referenced inode.
struct inode*
ialloc(uint dev, short type)
{
80101530:	8b 45 0c             	mov    0xc(%ebp),%eax
80101533:	8b 75 08             	mov    0x8(%ebp),%esi
80101536:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
80101539:	0f 86 91 00 00 00    	jbe    801015d0 <ialloc+0xb0>
8010153f:	bb 01 00 00 00       	mov    $0x1,%ebx
80101544:	eb 21                	jmp    80101567 <ialloc+0x47>
80101546:	8d 76 00             	lea    0x0(%esi),%esi
80101549:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
    }
    brelse(bp);
80101550:	83 ec 0c             	sub    $0xc,%esp
{
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
80101553:	83 c3 01             	add    $0x1,%ebx
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
    }
    brelse(bp);
80101556:	57                   	push   %edi
80101557:	e8 84 ec ff ff       	call   801001e0 <brelse>
{
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
8010155c:	83 c4 10             	add    $0x10,%esp
8010155f:	39 1d c8 09 11 80    	cmp    %ebx,0x801109c8
80101565:	76 69                	jbe    801015d0 <ialloc+0xb0>
    bp = bread(dev, IBLOCK(inum, sb));
80101567:	89 d8                	mov    %ebx,%eax
80101569:	83 ec 08             	sub    $0x8,%esp
8010156c:	c1 e8 03             	shr    $0x3,%eax
8010156f:	03 05 d4 09 11 80    	add    0x801109d4,%eax
80101575:	50                   	push   %eax
80101576:	56                   	push   %esi
80101577:	e8 54 eb ff ff       	call   801000d0 <bread>
8010157c:	89 c7                	mov    %eax,%edi
    dip = (struct dinode*)bp->data + inum%IPB;
8010157e:	89 d8                	mov    %ebx,%eax
    if(dip->type == 0){  // a free inode
80101580:	83 c4 10             	add    $0x10,%esp
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
    bp = bread(dev, IBLOCK(inum, sb));
    dip = (struct dinode*)bp->data + inum%IPB;
80101583:	83 e0 07             	and    $0x7,%eax
80101586:	c1 e0 06             	shl    $0x6,%eax
80101589:	8d 4c 07 5c          	lea    0x5c(%edi,%eax,1),%ecx
    if(dip->type == 0){  // a free inode
8010158d:	66 83 39 00          	cmpw   $0x0,(%ecx)
80101591:	75 bd                	jne    80101550 <ialloc+0x30>
      memset(dip, 0, sizeof(*dip));
80101593:	83 ec 04             	sub    $0x4,%esp
80101596:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101599:	6a 40                	push   $0x40
8010159b:	6a 00                	push   $0x0
8010159d:	51                   	push   %ecx
8010159e:	e8 8d 2e 00 00       	call   80104430 <memset>
      dip->type = type;
801015a3:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
801015a7:	8b 4d e0             	mov    -0x20(%ebp),%ecx
801015aa:	66 89 01             	mov    %ax,(%ecx)
      log_write(bp);   // mark it allocated on the disk
801015ad:	89 3c 24             	mov    %edi,(%esp)
801015b0:	e8 9b 17 00 00       	call   80102d50 <log_write>
      brelse(bp);
801015b5:	89 3c 24             	mov    %edi,(%esp)
801015b8:	e8 23 ec ff ff       	call   801001e0 <brelse>
      return iget(dev, inum);
801015bd:	83 c4 10             	add    $0x10,%esp
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
}
801015c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    if(dip->type == 0){  // a free inode
      memset(dip, 0, sizeof(*dip));
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
801015c3:	89 da                	mov    %ebx,%edx
801015c5:	89 f0                	mov    %esi,%eax
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
}
801015c7:	5b                   	pop    %ebx
801015c8:	5e                   	pop    %esi
801015c9:	5f                   	pop    %edi
801015ca:	5d                   	pop    %ebp
    if(dip->type == 0){  // a free inode
      memset(dip, 0, sizeof(*dip));
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
801015cb:	e9 60 fc ff ff       	jmp    80101230 <iget>
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
801015d0:	83 ec 0c             	sub    $0xc,%esp
801015d3:	68 f8 71 10 80       	push   $0x801071f8
801015d8:	e8 93 ed ff ff       	call   80100370 <panic>
801015dd:	8d 76 00             	lea    0x0(%esi),%esi

801015e0 <iupdate>:
// Must be called after every change to an ip->xxx field
// that lives on disk, since i-node cache is write-through.
// Caller must hold ip->lock.
void
iupdate(struct inode *ip)
{
801015e0:	55                   	push   %ebp
801015e1:	89 e5                	mov    %esp,%ebp
801015e3:	56                   	push   %esi
801015e4:	53                   	push   %ebx
801015e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801015e8:	83 ec 08             	sub    $0x8,%esp
801015eb:	8b 43 04             	mov    0x4(%ebx),%eax
  dip->type = ip->type;
  dip->major = ip->major;
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801015ee:	83 c3 5c             	add    $0x5c,%ebx
iupdate(struct inode *ip)
{
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801015f1:	c1 e8 03             	shr    $0x3,%eax
801015f4:	03 05 d4 09 11 80    	add    0x801109d4,%eax
801015fa:	50                   	push   %eax
801015fb:	ff 73 a4             	pushl  -0x5c(%ebx)
801015fe:	e8 cd ea ff ff       	call   801000d0 <bread>
80101603:	89 c6                	mov    %eax,%esi
  dip = (struct dinode*)bp->data + ip->inum%IPB;
80101605:	8b 43 a8             	mov    -0x58(%ebx),%eax
  dip->type = ip->type;
80101608:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
  dip->major = ip->major;
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010160c:	83 c4 0c             	add    $0xc,%esp
{
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
  dip = (struct dinode*)bp->data + ip->inum%IPB;
8010160f:	83 e0 07             	and    $0x7,%eax
80101612:	c1 e0 06             	shl    $0x6,%eax
80101615:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
  dip->type = ip->type;
80101619:	66 89 10             	mov    %dx,(%eax)
  dip->major = ip->major;
8010161c:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
80101620:	83 c0 0c             	add    $0xc,%eax
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
  dip = (struct dinode*)bp->data + ip->inum%IPB;
  dip->type = ip->type;
  dip->major = ip->major;
80101623:	66 89 50 f6          	mov    %dx,-0xa(%eax)
  dip->minor = ip->minor;
80101627:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
8010162b:	66 89 50 f8          	mov    %dx,-0x8(%eax)
  dip->nlink = ip->nlink;
8010162f:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
80101633:	66 89 50 fa          	mov    %dx,-0x6(%eax)
  dip->size = ip->size;
80101637:	8b 53 fc             	mov    -0x4(%ebx),%edx
8010163a:	89 50 fc             	mov    %edx,-0x4(%eax)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010163d:	6a 34                	push   $0x34
8010163f:	53                   	push   %ebx
80101640:	50                   	push   %eax
80101641:	e8 9a 2e 00 00       	call   801044e0 <memmove>
  log_write(bp);
80101646:	89 34 24             	mov    %esi,(%esp)
80101649:	e8 02 17 00 00       	call   80102d50 <log_write>
  brelse(bp);
8010164e:	89 75 08             	mov    %esi,0x8(%ebp)
80101651:	83 c4 10             	add    $0x10,%esp
}
80101654:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101657:	5b                   	pop    %ebx
80101658:	5e                   	pop    %esi
80101659:	5d                   	pop    %ebp
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
  log_write(bp);
  brelse(bp);
8010165a:	e9 81 eb ff ff       	jmp    801001e0 <brelse>
8010165f:	90                   	nop

80101660 <idup>:

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
80101660:	55                   	push   %ebp
80101661:	89 e5                	mov    %esp,%ebp
80101663:	53                   	push   %ebx
80101664:	83 ec 10             	sub    $0x10,%esp
80101667:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&icache.lock);
8010166a:	68 e0 09 11 80       	push   $0x801109e0
8010166f:	e8 4c 2c 00 00       	call   801042c0 <acquire>
  ip->ref++;
80101674:	83 43 08 01          	addl   $0x1,0x8(%ebx)
  release(&icache.lock);
80101678:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
8010167f:	e8 5c 2d 00 00       	call   801043e0 <release>
  return ip;
}
80101684:	89 d8                	mov    %ebx,%eax
80101686:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101689:	c9                   	leave  
8010168a:	c3                   	ret    
8010168b:	90                   	nop
8010168c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101690 <ilock>:

// Lock the given inode.
// Reads the inode from disk if necessary.
void
ilock(struct inode *ip)
{
80101690:	55                   	push   %ebp
80101691:	89 e5                	mov    %esp,%ebp
80101693:	56                   	push   %esi
80101694:	53                   	push   %ebx
80101695:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
80101698:	85 db                	test   %ebx,%ebx
8010169a:	0f 84 b7 00 00 00    	je     80101757 <ilock+0xc7>
801016a0:	8b 53 08             	mov    0x8(%ebx),%edx
801016a3:	85 d2                	test   %edx,%edx
801016a5:	0f 8e ac 00 00 00    	jle    80101757 <ilock+0xc7>
    panic("ilock");

  acquiresleep(&ip->lock);
801016ab:	8d 43 0c             	lea    0xc(%ebx),%eax
801016ae:	83 ec 0c             	sub    $0xc,%esp
801016b1:	50                   	push   %eax
801016b2:	e8 39 2a 00 00       	call   801040f0 <acquiresleep>

  if(ip->valid == 0){
801016b7:	8b 43 4c             	mov    0x4c(%ebx),%eax
801016ba:	83 c4 10             	add    $0x10,%esp
801016bd:	85 c0                	test   %eax,%eax
801016bf:	74 0f                	je     801016d0 <ilock+0x40>
    brelse(bp);
    ip->valid = 1;
    if(ip->type == 0)
      panic("ilock: no type");
  }
}
801016c1:	8d 65 f8             	lea    -0x8(%ebp),%esp
801016c4:	5b                   	pop    %ebx
801016c5:	5e                   	pop    %esi
801016c6:	5d                   	pop    %ebp
801016c7:	c3                   	ret    
801016c8:	90                   	nop
801016c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    panic("ilock");

  acquiresleep(&ip->lock);

  if(ip->valid == 0){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801016d0:	8b 43 04             	mov    0x4(%ebx),%eax
801016d3:	83 ec 08             	sub    $0x8,%esp
801016d6:	c1 e8 03             	shr    $0x3,%eax
801016d9:	03 05 d4 09 11 80    	add    0x801109d4,%eax
801016df:	50                   	push   %eax
801016e0:	ff 33                	pushl  (%ebx)
801016e2:	e8 e9 e9 ff ff       	call   801000d0 <bread>
801016e7:	89 c6                	mov    %eax,%esi
    dip = (struct dinode*)bp->data + ip->inum%IPB;
801016e9:	8b 43 04             	mov    0x4(%ebx),%eax
    ip->type = dip->type;
    ip->major = dip->major;
    ip->minor = dip->minor;
    ip->nlink = dip->nlink;
    ip->size = dip->size;
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801016ec:	83 c4 0c             	add    $0xc,%esp

  acquiresleep(&ip->lock);

  if(ip->valid == 0){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    dip = (struct dinode*)bp->data + ip->inum%IPB;
801016ef:	83 e0 07             	and    $0x7,%eax
801016f2:	c1 e0 06             	shl    $0x6,%eax
801016f5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
    ip->type = dip->type;
801016f9:	0f b7 10             	movzwl (%eax),%edx
    ip->major = dip->major;
    ip->minor = dip->minor;
    ip->nlink = dip->nlink;
    ip->size = dip->size;
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801016fc:	83 c0 0c             	add    $0xc,%eax
  acquiresleep(&ip->lock);

  if(ip->valid == 0){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    dip = (struct dinode*)bp->data + ip->inum%IPB;
    ip->type = dip->type;
801016ff:	66 89 53 50          	mov    %dx,0x50(%ebx)
    ip->major = dip->major;
80101703:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
80101707:	66 89 53 52          	mov    %dx,0x52(%ebx)
    ip->minor = dip->minor;
8010170b:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
8010170f:	66 89 53 54          	mov    %dx,0x54(%ebx)
    ip->nlink = dip->nlink;
80101713:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
80101717:	66 89 53 56          	mov    %dx,0x56(%ebx)
    ip->size = dip->size;
8010171b:	8b 50 fc             	mov    -0x4(%eax),%edx
8010171e:	89 53 58             	mov    %edx,0x58(%ebx)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
80101721:	6a 34                	push   $0x34
80101723:	50                   	push   %eax
80101724:	8d 43 5c             	lea    0x5c(%ebx),%eax
80101727:	50                   	push   %eax
80101728:	e8 b3 2d 00 00       	call   801044e0 <memmove>
    brelse(bp);
8010172d:	89 34 24             	mov    %esi,(%esp)
80101730:	e8 ab ea ff ff       	call   801001e0 <brelse>
    ip->valid = 1;
    if(ip->type == 0)
80101735:	83 c4 10             	add    $0x10,%esp
80101738:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
    ip->minor = dip->minor;
    ip->nlink = dip->nlink;
    ip->size = dip->size;
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
    brelse(bp);
    ip->valid = 1;
8010173d:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
    if(ip->type == 0)
80101744:	0f 85 77 ff ff ff    	jne    801016c1 <ilock+0x31>
      panic("ilock: no type");
8010174a:	83 ec 0c             	sub    $0xc,%esp
8010174d:	68 10 72 10 80       	push   $0x80107210
80101752:	e8 19 ec ff ff       	call   80100370 <panic>
{
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
    panic("ilock");
80101757:	83 ec 0c             	sub    $0xc,%esp
8010175a:	68 0a 72 10 80       	push   $0x8010720a
8010175f:	e8 0c ec ff ff       	call   80100370 <panic>
80101764:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010176a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101770 <iunlock>:
}

// Unlock the given inode.
void
iunlock(struct inode *ip)
{
80101770:	55                   	push   %ebp
80101771:	89 e5                	mov    %esp,%ebp
80101773:	56                   	push   %esi
80101774:	53                   	push   %ebx
80101775:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
80101778:	85 db                	test   %ebx,%ebx
8010177a:	74 28                	je     801017a4 <iunlock+0x34>
8010177c:	8d 73 0c             	lea    0xc(%ebx),%esi
8010177f:	83 ec 0c             	sub    $0xc,%esp
80101782:	56                   	push   %esi
80101783:	e8 08 2a 00 00       	call   80104190 <holdingsleep>
80101788:	83 c4 10             	add    $0x10,%esp
8010178b:	85 c0                	test   %eax,%eax
8010178d:	74 15                	je     801017a4 <iunlock+0x34>
8010178f:	8b 43 08             	mov    0x8(%ebx),%eax
80101792:	85 c0                	test   %eax,%eax
80101794:	7e 0e                	jle    801017a4 <iunlock+0x34>
    panic("iunlock");

  releasesleep(&ip->lock);
80101796:	89 75 08             	mov    %esi,0x8(%ebp)
}
80101799:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010179c:	5b                   	pop    %ebx
8010179d:	5e                   	pop    %esi
8010179e:	5d                   	pop    %ebp
iunlock(struct inode *ip)
{
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    panic("iunlock");

  releasesleep(&ip->lock);
8010179f:	e9 ac 29 00 00       	jmp    80104150 <releasesleep>
// Unlock the given inode.
void
iunlock(struct inode *ip)
{
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    panic("iunlock");
801017a4:	83 ec 0c             	sub    $0xc,%esp
801017a7:	68 1f 72 10 80       	push   $0x8010721f
801017ac:	e8 bf eb ff ff       	call   80100370 <panic>
801017b1:	eb 0d                	jmp    801017c0 <iput>
801017b3:	90                   	nop
801017b4:	90                   	nop
801017b5:	90                   	nop
801017b6:	90                   	nop
801017b7:	90                   	nop
801017b8:	90                   	nop
801017b9:	90                   	nop
801017ba:	90                   	nop
801017bb:	90                   	nop
801017bc:	90                   	nop
801017bd:	90                   	nop
801017be:	90                   	nop
801017bf:	90                   	nop

801017c0 <iput>:
// to it, free the inode (and its content) on disk.
// All calls to iput() must be inside a transaction in
// case it has to free the inode.
void
iput(struct inode *ip)
{
801017c0:	55                   	push   %ebp
801017c1:	89 e5                	mov    %esp,%ebp
801017c3:	57                   	push   %edi
801017c4:	56                   	push   %esi
801017c5:	53                   	push   %ebx
801017c6:	83 ec 28             	sub    $0x28,%esp
801017c9:	8b 75 08             	mov    0x8(%ebp),%esi
  acquiresleep(&ip->lock);
801017cc:	8d 7e 0c             	lea    0xc(%esi),%edi
801017cf:	57                   	push   %edi
801017d0:	e8 1b 29 00 00       	call   801040f0 <acquiresleep>
  if(ip->valid && ip->nlink == 0){
801017d5:	8b 56 4c             	mov    0x4c(%esi),%edx
801017d8:	83 c4 10             	add    $0x10,%esp
801017db:	85 d2                	test   %edx,%edx
801017dd:	74 07                	je     801017e6 <iput+0x26>
801017df:	66 83 7e 56 00       	cmpw   $0x0,0x56(%esi)
801017e4:	74 32                	je     80101818 <iput+0x58>
      ip->type = 0;
      iupdate(ip);
      ip->valid = 0;
    }
  }
  releasesleep(&ip->lock);
801017e6:	83 ec 0c             	sub    $0xc,%esp
801017e9:	57                   	push   %edi
801017ea:	e8 61 29 00 00       	call   80104150 <releasesleep>

  acquire(&icache.lock);
801017ef:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
801017f6:	e8 c5 2a 00 00       	call   801042c0 <acquire>
  ip->ref--;
801017fb:	83 6e 08 01          	subl   $0x1,0x8(%esi)
  release(&icache.lock);
801017ff:	83 c4 10             	add    $0x10,%esp
80101802:	c7 45 08 e0 09 11 80 	movl   $0x801109e0,0x8(%ebp)
}
80101809:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010180c:	5b                   	pop    %ebx
8010180d:	5e                   	pop    %esi
8010180e:	5f                   	pop    %edi
8010180f:	5d                   	pop    %ebp
  }
  releasesleep(&ip->lock);

  acquire(&icache.lock);
  ip->ref--;
  release(&icache.lock);
80101810:	e9 cb 2b 00 00       	jmp    801043e0 <release>
80101815:	8d 76 00             	lea    0x0(%esi),%esi
void
iput(struct inode *ip)
{
  acquiresleep(&ip->lock);
  if(ip->valid && ip->nlink == 0){
    acquire(&icache.lock);
80101818:	83 ec 0c             	sub    $0xc,%esp
8010181b:	68 e0 09 11 80       	push   $0x801109e0
80101820:	e8 9b 2a 00 00       	call   801042c0 <acquire>
    int r = ip->ref;
80101825:	8b 5e 08             	mov    0x8(%esi),%ebx
    release(&icache.lock);
80101828:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
8010182f:	e8 ac 2b 00 00       	call   801043e0 <release>
    if(r == 1){
80101834:	83 c4 10             	add    $0x10,%esp
80101837:	83 fb 01             	cmp    $0x1,%ebx
8010183a:	75 aa                	jne    801017e6 <iput+0x26>
8010183c:	8d 8e 8c 00 00 00    	lea    0x8c(%esi),%ecx
80101842:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101845:	8d 5e 5c             	lea    0x5c(%esi),%ebx
80101848:	89 cf                	mov    %ecx,%edi
8010184a:	eb 0b                	jmp    80101857 <iput+0x97>
8010184c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101850:	83 c3 04             	add    $0x4,%ebx
{
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
80101853:	39 fb                	cmp    %edi,%ebx
80101855:	74 19                	je     80101870 <iput+0xb0>
    if(ip->addrs[i]){
80101857:	8b 13                	mov    (%ebx),%edx
80101859:	85 d2                	test   %edx,%edx
8010185b:	74 f3                	je     80101850 <iput+0x90>
      bfree(ip->dev, ip->addrs[i]);
8010185d:	8b 06                	mov    (%esi),%eax
8010185f:	e8 ac fb ff ff       	call   80101410 <bfree>
      ip->addrs[i] = 0;
80101864:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010186a:	eb e4                	jmp    80101850 <iput+0x90>
8010186c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  if(ip->addrs[NDIRECT]){
80101870:	8b 86 8c 00 00 00    	mov    0x8c(%esi),%eax
80101876:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101879:	85 c0                	test   %eax,%eax
8010187b:	75 33                	jne    801018b0 <iput+0xf0>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
  iupdate(ip);
8010187d:	83 ec 0c             	sub    $0xc,%esp
    brelse(bp);
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
80101880:	c7 46 58 00 00 00 00 	movl   $0x0,0x58(%esi)
  iupdate(ip);
80101887:	56                   	push   %esi
80101888:	e8 53 fd ff ff       	call   801015e0 <iupdate>
    int r = ip->ref;
    release(&icache.lock);
    if(r == 1){
      // inode has no links and no other references: truncate and free.
      itrunc(ip);
      ip->type = 0;
8010188d:	31 c0                	xor    %eax,%eax
8010188f:	66 89 46 50          	mov    %ax,0x50(%esi)
      iupdate(ip);
80101893:	89 34 24             	mov    %esi,(%esp)
80101896:	e8 45 fd ff ff       	call   801015e0 <iupdate>
      ip->valid = 0;
8010189b:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
801018a2:	83 c4 10             	add    $0x10,%esp
801018a5:	e9 3c ff ff ff       	jmp    801017e6 <iput+0x26>
801018aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      ip->addrs[i] = 0;
    }
  }

  if(ip->addrs[NDIRECT]){
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
801018b0:	83 ec 08             	sub    $0x8,%esp
801018b3:	50                   	push   %eax
801018b4:	ff 36                	pushl  (%esi)
801018b6:	e8 15 e8 ff ff       	call   801000d0 <bread>
801018bb:	8d 88 5c 02 00 00    	lea    0x25c(%eax),%ecx
801018c1:	89 7d e0             	mov    %edi,-0x20(%ebp)
801018c4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    a = (uint*)bp->data;
801018c7:	8d 58 5c             	lea    0x5c(%eax),%ebx
801018ca:	83 c4 10             	add    $0x10,%esp
801018cd:	89 cf                	mov    %ecx,%edi
801018cf:	eb 0e                	jmp    801018df <iput+0x11f>
801018d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801018d8:	83 c3 04             	add    $0x4,%ebx
    for(j = 0; j < NINDIRECT; j++){
801018db:	39 fb                	cmp    %edi,%ebx
801018dd:	74 0f                	je     801018ee <iput+0x12e>
      if(a[j])
801018df:	8b 13                	mov    (%ebx),%edx
801018e1:	85 d2                	test   %edx,%edx
801018e3:	74 f3                	je     801018d8 <iput+0x118>
        bfree(ip->dev, a[j]);
801018e5:	8b 06                	mov    (%esi),%eax
801018e7:	e8 24 fb ff ff       	call   80101410 <bfree>
801018ec:	eb ea                	jmp    801018d8 <iput+0x118>
    }
    brelse(bp);
801018ee:	83 ec 0c             	sub    $0xc,%esp
801018f1:	ff 75 e4             	pushl  -0x1c(%ebp)
801018f4:	8b 7d e0             	mov    -0x20(%ebp),%edi
801018f7:	e8 e4 e8 ff ff       	call   801001e0 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
801018fc:	8b 96 8c 00 00 00    	mov    0x8c(%esi),%edx
80101902:	8b 06                	mov    (%esi),%eax
80101904:	e8 07 fb ff ff       	call   80101410 <bfree>
    ip->addrs[NDIRECT] = 0;
80101909:	c7 86 8c 00 00 00 00 	movl   $0x0,0x8c(%esi)
80101910:	00 00 00 
80101913:	83 c4 10             	add    $0x10,%esp
80101916:	e9 62 ff ff ff       	jmp    8010187d <iput+0xbd>
8010191b:	90                   	nop
8010191c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101920 <iunlockput>:
}

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
80101920:	55                   	push   %ebp
80101921:	89 e5                	mov    %esp,%ebp
80101923:	53                   	push   %ebx
80101924:	83 ec 10             	sub    $0x10,%esp
80101927:	8b 5d 08             	mov    0x8(%ebp),%ebx
  iunlock(ip);
8010192a:	53                   	push   %ebx
8010192b:	e8 40 fe ff ff       	call   80101770 <iunlock>
  iput(ip);
80101930:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101933:	83 c4 10             	add    $0x10,%esp
}
80101936:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101939:	c9                   	leave  
// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
  iput(ip);
8010193a:	e9 81 fe ff ff       	jmp    801017c0 <iput>
8010193f:	90                   	nop

80101940 <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
80101940:	55                   	push   %ebp
80101941:	89 e5                	mov    %esp,%ebp
80101943:	8b 55 08             	mov    0x8(%ebp),%edx
80101946:	8b 45 0c             	mov    0xc(%ebp),%eax
  st->dev = ip->dev;
80101949:	8b 0a                	mov    (%edx),%ecx
8010194b:	89 48 04             	mov    %ecx,0x4(%eax)
  st->ino = ip->inum;
8010194e:	8b 4a 04             	mov    0x4(%edx),%ecx
80101951:	89 48 08             	mov    %ecx,0x8(%eax)
  st->type = ip->type;
80101954:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101958:	66 89 08             	mov    %cx,(%eax)
  st->nlink = ip->nlink;
8010195b:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
8010195f:	66 89 48 0c          	mov    %cx,0xc(%eax)
  st->size = ip->size;
80101963:	8b 52 58             	mov    0x58(%edx),%edx
80101966:	89 50 10             	mov    %edx,0x10(%eax)
}
80101969:	5d                   	pop    %ebp
8010196a:	c3                   	ret    
8010196b:	90                   	nop
8010196c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101970 <readi>:
//PAGEBREAK!
// Read data from inode.
// Caller must hold ip->lock.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101970:	55                   	push   %ebp
80101971:	89 e5                	mov    %esp,%ebp
80101973:	57                   	push   %edi
80101974:	56                   	push   %esi
80101975:	53                   	push   %ebx
80101976:	83 ec 1c             	sub    $0x1c,%esp
80101979:	8b 45 08             	mov    0x8(%ebp),%eax
8010197c:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010197f:	8b 75 10             	mov    0x10(%ebp),%esi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101982:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
//PAGEBREAK!
// Read data from inode.
// Caller must hold ip->lock.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101987:	89 7d e0             	mov    %edi,-0x20(%ebp)
8010198a:	8b 7d 14             	mov    0x14(%ebp),%edi
8010198d:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101990:	89 7d e4             	mov    %edi,-0x1c(%ebp)
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101993:	0f 84 a7 00 00 00    	je     80101a40 <readi+0xd0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
  }

  if(off > ip->size || off + n < off)
80101999:	8b 45 d8             	mov    -0x28(%ebp),%eax
8010199c:	8b 40 58             	mov    0x58(%eax),%eax
8010199f:	39 f0                	cmp    %esi,%eax
801019a1:	0f 82 c1 00 00 00    	jb     80101a68 <readi+0xf8>
801019a7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801019aa:	89 fa                	mov    %edi,%edx
801019ac:	01 f2                	add    %esi,%edx
801019ae:	0f 82 b4 00 00 00    	jb     80101a68 <readi+0xf8>
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
801019b4:	89 c1                	mov    %eax,%ecx
801019b6:	29 f1                	sub    %esi,%ecx
801019b8:	39 d0                	cmp    %edx,%eax
801019ba:	0f 43 cf             	cmovae %edi,%ecx

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019bd:	31 ff                	xor    %edi,%edi
801019bf:	85 c9                	test   %ecx,%ecx
  }

  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
801019c1:	89 4d e4             	mov    %ecx,-0x1c(%ebp)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019c4:	74 6d                	je     80101a33 <readi+0xc3>
801019c6:	8d 76 00             	lea    0x0(%esi),%esi
801019c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
801019d0:	8b 5d d8             	mov    -0x28(%ebp),%ebx
801019d3:	89 f2                	mov    %esi,%edx
801019d5:	c1 ea 09             	shr    $0x9,%edx
801019d8:	89 d8                	mov    %ebx,%eax
801019da:	e8 21 f9 ff ff       	call   80101300 <bmap>
801019df:	83 ec 08             	sub    $0x8,%esp
801019e2:	50                   	push   %eax
801019e3:	ff 33                	pushl  (%ebx)
    m = min(n - tot, BSIZE - off%BSIZE);
801019e5:	bb 00 02 00 00       	mov    $0x200,%ebx
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
801019ea:	e8 e1 e6 ff ff       	call   801000d0 <bread>
801019ef:	89 c2                	mov    %eax,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
801019f1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801019f4:	89 f1                	mov    %esi,%ecx
801019f6:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
801019fc:	83 c4 0c             	add    $0xc,%esp
    memmove(dst, bp->data + off%BSIZE, m);
801019ff:	89 55 dc             	mov    %edx,-0x24(%ebp)
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
80101a02:	29 cb                	sub    %ecx,%ebx
80101a04:	29 f8                	sub    %edi,%eax
80101a06:	39 c3                	cmp    %eax,%ebx
80101a08:	0f 47 d8             	cmova  %eax,%ebx
    memmove(dst, bp->data + off%BSIZE, m);
80101a0b:	8d 44 0a 5c          	lea    0x5c(%edx,%ecx,1),%eax
80101a0f:	53                   	push   %ebx
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101a10:	01 df                	add    %ebx,%edi
80101a12:	01 de                	add    %ebx,%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(dst, bp->data + off%BSIZE, m);
80101a14:	50                   	push   %eax
80101a15:	ff 75 e0             	pushl  -0x20(%ebp)
80101a18:	e8 c3 2a 00 00       	call   801044e0 <memmove>
    brelse(bp);
80101a1d:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101a20:	89 14 24             	mov    %edx,(%esp)
80101a23:	e8 b8 e7 ff ff       	call   801001e0 <brelse>
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101a28:	01 5d e0             	add    %ebx,-0x20(%ebp)
80101a2b:	83 c4 10             	add    $0x10,%esp
80101a2e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101a31:	77 9d                	ja     801019d0 <readi+0x60>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(dst, bp->data + off%BSIZE, m);
    brelse(bp);
  }
  return n;
80101a33:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
80101a36:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a39:	5b                   	pop    %ebx
80101a3a:	5e                   	pop    %esi
80101a3b:	5f                   	pop    %edi
80101a3c:	5d                   	pop    %ebp
80101a3d:	c3                   	ret    
80101a3e:	66 90                	xchg   %ax,%ax
{
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
80101a40:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101a44:	66 83 f8 09          	cmp    $0x9,%ax
80101a48:	77 1e                	ja     80101a68 <readi+0xf8>
80101a4a:	8b 04 c5 60 09 11 80 	mov    -0x7feef6a0(,%eax,8),%eax
80101a51:	85 c0                	test   %eax,%eax
80101a53:	74 13                	je     80101a68 <readi+0xf8>
      return -1;
    return devsw[ip->major].read(ip, dst, n);
80101a55:	89 7d 10             	mov    %edi,0x10(%ebp)
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(dst, bp->data + off%BSIZE, m);
    brelse(bp);
  }
  return n;
}
80101a58:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a5b:	5b                   	pop    %ebx
80101a5c:	5e                   	pop    %esi
80101a5d:	5f                   	pop    %edi
80101a5e:	5d                   	pop    %ebp
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
80101a5f:	ff e0                	jmp    *%eax
80101a61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
80101a68:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101a6d:	eb c7                	jmp    80101a36 <readi+0xc6>
80101a6f:	90                   	nop

80101a70 <writei>:
// PAGEBREAK!
// Write data to inode.
// Caller must hold ip->lock.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101a70:	55                   	push   %ebp
80101a71:	89 e5                	mov    %esp,%ebp
80101a73:	57                   	push   %edi
80101a74:	56                   	push   %esi
80101a75:	53                   	push   %ebx
80101a76:	83 ec 1c             	sub    $0x1c,%esp
80101a79:	8b 45 08             	mov    0x8(%ebp),%eax
80101a7c:	8b 75 0c             	mov    0xc(%ebp),%esi
80101a7f:	8b 7d 14             	mov    0x14(%ebp),%edi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101a82:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
// PAGEBREAK!
// Write data to inode.
// Caller must hold ip->lock.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101a87:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101a8a:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101a8d:	8b 75 10             	mov    0x10(%ebp),%esi
80101a90:	89 7d e0             	mov    %edi,-0x20(%ebp)
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101a93:	0f 84 b7 00 00 00    	je     80101b50 <writei+0xe0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
  }

  if(off > ip->size || off + n < off)
80101a99:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101a9c:	39 70 58             	cmp    %esi,0x58(%eax)
80101a9f:	0f 82 eb 00 00 00    	jb     80101b90 <writei+0x120>
80101aa5:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101aa8:	89 f8                	mov    %edi,%eax
80101aaa:	01 f0                	add    %esi,%eax
    return -1;
  if(off + n > MAXFILE*BSIZE)
80101aac:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101ab1:	0f 87 d9 00 00 00    	ja     80101b90 <writei+0x120>
80101ab7:	39 c6                	cmp    %eax,%esi
80101ab9:	0f 87 d1 00 00 00    	ja     80101b90 <writei+0x120>
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101abf:	85 ff                	test   %edi,%edi
80101ac1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101ac8:	74 78                	je     80101b42 <writei+0xd2>
80101aca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101ad0:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101ad3:	89 f2                	mov    %esi,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
80101ad5:	bb 00 02 00 00       	mov    $0x200,%ebx
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101ada:	c1 ea 09             	shr    $0x9,%edx
80101add:	89 f8                	mov    %edi,%eax
80101adf:	e8 1c f8 ff ff       	call   80101300 <bmap>
80101ae4:	83 ec 08             	sub    $0x8,%esp
80101ae7:	50                   	push   %eax
80101ae8:	ff 37                	pushl  (%edi)
80101aea:	e8 e1 e5 ff ff       	call   801000d0 <bread>
80101aef:	89 c7                	mov    %eax,%edi
    m = min(n - tot, BSIZE - off%BSIZE);
80101af1:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101af4:	2b 45 e4             	sub    -0x1c(%ebp),%eax
80101af7:	89 f1                	mov    %esi,%ecx
80101af9:	83 c4 0c             	add    $0xc,%esp
80101afc:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
80101b02:	29 cb                	sub    %ecx,%ebx
80101b04:	39 c3                	cmp    %eax,%ebx
80101b06:	0f 47 d8             	cmova  %eax,%ebx
    memmove(bp->data + off%BSIZE, src, m);
80101b09:	8d 44 0f 5c          	lea    0x5c(%edi,%ecx,1),%eax
80101b0d:	53                   	push   %ebx
80101b0e:	ff 75 dc             	pushl  -0x24(%ebp)
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101b11:	01 de                	add    %ebx,%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(bp->data + off%BSIZE, src, m);
80101b13:	50                   	push   %eax
80101b14:	e8 c7 29 00 00       	call   801044e0 <memmove>
    log_write(bp);
80101b19:	89 3c 24             	mov    %edi,(%esp)
80101b1c:	e8 2f 12 00 00       	call   80102d50 <log_write>
    brelse(bp);
80101b21:	89 3c 24             	mov    %edi,(%esp)
80101b24:	e8 b7 e6 ff ff       	call   801001e0 <brelse>
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101b29:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101b2c:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101b2f:	83 c4 10             	add    $0x10,%esp
80101b32:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101b35:	39 55 e0             	cmp    %edx,-0x20(%ebp)
80101b38:	77 96                	ja     80101ad0 <writei+0x60>
    memmove(bp->data + off%BSIZE, src, m);
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
80101b3a:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b3d:	3b 70 58             	cmp    0x58(%eax),%esi
80101b40:	77 36                	ja     80101b78 <writei+0x108>
    ip->size = off;
    iupdate(ip);
  }
  return n;
80101b42:	8b 45 e0             	mov    -0x20(%ebp),%eax
}
80101b45:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b48:	5b                   	pop    %ebx
80101b49:	5e                   	pop    %esi
80101b4a:	5f                   	pop    %edi
80101b4b:	5d                   	pop    %ebp
80101b4c:	c3                   	ret    
80101b4d:	8d 76 00             	lea    0x0(%esi),%esi
{
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
80101b50:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101b54:	66 83 f8 09          	cmp    $0x9,%ax
80101b58:	77 36                	ja     80101b90 <writei+0x120>
80101b5a:	8b 04 c5 64 09 11 80 	mov    -0x7feef69c(,%eax,8),%eax
80101b61:	85 c0                	test   %eax,%eax
80101b63:	74 2b                	je     80101b90 <writei+0x120>
      return -1;
    return devsw[ip->major].write(ip, src, n);
80101b65:	89 7d 10             	mov    %edi,0x10(%ebp)
  if(n > 0 && off > ip->size){
    ip->size = off;
    iupdate(ip);
  }
  return n;
}
80101b68:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b6b:	5b                   	pop    %ebx
80101b6c:	5e                   	pop    %esi
80101b6d:	5f                   	pop    %edi
80101b6e:	5d                   	pop    %ebp
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
80101b6f:	ff e0                	jmp    *%eax
80101b71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
    ip->size = off;
80101b78:	8b 45 d8             	mov    -0x28(%ebp),%eax
    iupdate(ip);
80101b7b:	83 ec 0c             	sub    $0xc,%esp
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
    ip->size = off;
80101b7e:	89 70 58             	mov    %esi,0x58(%eax)
    iupdate(ip);
80101b81:	50                   	push   %eax
80101b82:	e8 59 fa ff ff       	call   801015e0 <iupdate>
80101b87:	83 c4 10             	add    $0x10,%esp
80101b8a:	eb b6                	jmp    80101b42 <writei+0xd2>
80101b8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
80101b90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101b95:	eb ae                	jmp    80101b45 <writei+0xd5>
80101b97:	89 f6                	mov    %esi,%esi
80101b99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ba0 <namecmp>:
//PAGEBREAK!
// Directories

int
namecmp(const char *s, const char *t)
{
80101ba0:	55                   	push   %ebp
80101ba1:	89 e5                	mov    %esp,%ebp
80101ba3:	83 ec 0c             	sub    $0xc,%esp
  return strncmp(s, t, DIRSIZ);
80101ba6:	6a 0e                	push   $0xe
80101ba8:	ff 75 0c             	pushl  0xc(%ebp)
80101bab:	ff 75 08             	pushl  0x8(%ebp)
80101bae:	e8 ad 29 00 00       	call   80104560 <strncmp>
}
80101bb3:	c9                   	leave  
80101bb4:	c3                   	ret    
80101bb5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101bb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101bc0 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
80101bc0:	55                   	push   %ebp
80101bc1:	89 e5                	mov    %esp,%ebp
80101bc3:	57                   	push   %edi
80101bc4:	56                   	push   %esi
80101bc5:	53                   	push   %ebx
80101bc6:	83 ec 1c             	sub    $0x1c,%esp
80101bc9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
80101bcc:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101bd1:	0f 85 80 00 00 00    	jne    80101c57 <dirlookup+0x97>
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
80101bd7:	8b 53 58             	mov    0x58(%ebx),%edx
80101bda:	31 ff                	xor    %edi,%edi
80101bdc:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101bdf:	85 d2                	test   %edx,%edx
80101be1:	75 0d                	jne    80101bf0 <dirlookup+0x30>
80101be3:	eb 5b                	jmp    80101c40 <dirlookup+0x80>
80101be5:	8d 76 00             	lea    0x0(%esi),%esi
80101be8:	83 c7 10             	add    $0x10,%edi
80101beb:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101bee:	76 50                	jbe    80101c40 <dirlookup+0x80>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101bf0:	6a 10                	push   $0x10
80101bf2:	57                   	push   %edi
80101bf3:	56                   	push   %esi
80101bf4:	53                   	push   %ebx
80101bf5:	e8 76 fd ff ff       	call   80101970 <readi>
80101bfa:	83 c4 10             	add    $0x10,%esp
80101bfd:	83 f8 10             	cmp    $0x10,%eax
80101c00:	75 48                	jne    80101c4a <dirlookup+0x8a>
      panic("dirlookup read");
    if(de.inum == 0)
80101c02:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101c07:	74 df                	je     80101be8 <dirlookup+0x28>
// Directories

int
namecmp(const char *s, const char *t)
{
  return strncmp(s, t, DIRSIZ);
80101c09:	8d 45 da             	lea    -0x26(%ebp),%eax
80101c0c:	83 ec 04             	sub    $0x4,%esp
80101c0f:	6a 0e                	push   $0xe
80101c11:	50                   	push   %eax
80101c12:	ff 75 0c             	pushl  0xc(%ebp)
80101c15:	e8 46 29 00 00       	call   80104560 <strncmp>
  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlookup read");
    if(de.inum == 0)
      continue;
    if(namecmp(name, de.name) == 0){
80101c1a:	83 c4 10             	add    $0x10,%esp
80101c1d:	85 c0                	test   %eax,%eax
80101c1f:	75 c7                	jne    80101be8 <dirlookup+0x28>
      // entry matches path element
      if(poff)
80101c21:	8b 45 10             	mov    0x10(%ebp),%eax
80101c24:	85 c0                	test   %eax,%eax
80101c26:	74 05                	je     80101c2d <dirlookup+0x6d>
        *poff = off;
80101c28:	8b 45 10             	mov    0x10(%ebp),%eax
80101c2b:	89 38                	mov    %edi,(%eax)
      inum = de.inum;
      return iget(dp->dev, inum);
80101c2d:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
80101c31:	8b 03                	mov    (%ebx),%eax
80101c33:	e8 f8 f5 ff ff       	call   80101230 <iget>
    }
  }

  return 0;
}
80101c38:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c3b:	5b                   	pop    %ebx
80101c3c:	5e                   	pop    %esi
80101c3d:	5f                   	pop    %edi
80101c3e:	5d                   	pop    %ebp
80101c3f:	c3                   	ret    
80101c40:	8d 65 f4             	lea    -0xc(%ebp),%esp
      inum = de.inum;
      return iget(dp->dev, inum);
    }
  }

  return 0;
80101c43:	31 c0                	xor    %eax,%eax
}
80101c45:	5b                   	pop    %ebx
80101c46:	5e                   	pop    %esi
80101c47:	5f                   	pop    %edi
80101c48:	5d                   	pop    %ebp
80101c49:	c3                   	ret    
  if(dp->type != T_DIR)
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlookup read");
80101c4a:	83 ec 0c             	sub    $0xc,%esp
80101c4d:	68 39 72 10 80       	push   $0x80107239
80101c52:	e8 19 e7 ff ff       	call   80100370 <panic>
{
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
    panic("dirlookup not DIR");
80101c57:	83 ec 0c             	sub    $0xc,%esp
80101c5a:	68 27 72 10 80       	push   $0x80107227
80101c5f:	e8 0c e7 ff ff       	call   80100370 <panic>
80101c64:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101c6a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101c70 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101c70:	55                   	push   %ebp
80101c71:	89 e5                	mov    %esp,%ebp
80101c73:	57                   	push   %edi
80101c74:	56                   	push   %esi
80101c75:	53                   	push   %ebx
80101c76:	89 cf                	mov    %ecx,%edi
80101c78:	89 c3                	mov    %eax,%ebx
80101c7a:	83 ec 1c             	sub    $0x1c,%esp
  struct inode *ip, *next;

  if(*path == '/')
80101c7d:	80 38 2f             	cmpb   $0x2f,(%eax)
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101c80:	89 55 e0             	mov    %edx,-0x20(%ebp)
  struct inode *ip, *next;

  if(*path == '/')
80101c83:	0f 84 53 01 00 00    	je     80101ddc <namex+0x16c>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(myproc()->cwd);
80101c89:	e8 12 1b 00 00       	call   801037a0 <myproc>
// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
  acquire(&icache.lock);
80101c8e:	83 ec 0c             	sub    $0xc,%esp
  struct inode *ip, *next;

  if(*path == '/')
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(myproc()->cwd);
80101c91:	8b 70 68             	mov    0x68(%eax),%esi
// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
  acquire(&icache.lock);
80101c94:	68 e0 09 11 80       	push   $0x801109e0
80101c99:	e8 22 26 00 00       	call   801042c0 <acquire>
  ip->ref++;
80101c9e:	83 46 08 01          	addl   $0x1,0x8(%esi)
  release(&icache.lock);
80101ca2:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
80101ca9:	e8 32 27 00 00       	call   801043e0 <release>
80101cae:	83 c4 10             	add    $0x10,%esp
80101cb1:	eb 08                	jmp    80101cbb <namex+0x4b>
80101cb3:	90                   	nop
80101cb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  char *s;
  int len;

  while(*path == '/')
    path++;
80101cb8:	83 c3 01             	add    $0x1,%ebx
skipelem(char *path, char *name)
{
  char *s;
  int len;

  while(*path == '/')
80101cbb:	0f b6 03             	movzbl (%ebx),%eax
80101cbe:	3c 2f                	cmp    $0x2f,%al
80101cc0:	74 f6                	je     80101cb8 <namex+0x48>
    path++;
  if(*path == 0)
80101cc2:	84 c0                	test   %al,%al
80101cc4:	0f 84 e3 00 00 00    	je     80101dad <namex+0x13d>
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101cca:	0f b6 03             	movzbl (%ebx),%eax
80101ccd:	89 da                	mov    %ebx,%edx
80101ccf:	84 c0                	test   %al,%al
80101cd1:	0f 84 ac 00 00 00    	je     80101d83 <namex+0x113>
80101cd7:	3c 2f                	cmp    $0x2f,%al
80101cd9:	75 09                	jne    80101ce4 <namex+0x74>
80101cdb:	e9 a3 00 00 00       	jmp    80101d83 <namex+0x113>
80101ce0:	84 c0                	test   %al,%al
80101ce2:	74 0a                	je     80101cee <namex+0x7e>
    path++;
80101ce4:	83 c2 01             	add    $0x1,%edx
  while(*path == '/')
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101ce7:	0f b6 02             	movzbl (%edx),%eax
80101cea:	3c 2f                	cmp    $0x2f,%al
80101cec:	75 f2                	jne    80101ce0 <namex+0x70>
80101cee:	89 d1                	mov    %edx,%ecx
80101cf0:	29 d9                	sub    %ebx,%ecx
    path++;
  len = path - s;
  if(len >= DIRSIZ)
80101cf2:	83 f9 0d             	cmp    $0xd,%ecx
80101cf5:	0f 8e 8d 00 00 00    	jle    80101d88 <namex+0x118>
    memmove(name, s, DIRSIZ);
80101cfb:	83 ec 04             	sub    $0x4,%esp
80101cfe:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101d01:	6a 0e                	push   $0xe
80101d03:	53                   	push   %ebx
80101d04:	57                   	push   %edi
80101d05:	e8 d6 27 00 00       	call   801044e0 <memmove>
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
    path++;
80101d0a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  len = path - s;
  if(len >= DIRSIZ)
    memmove(name, s, DIRSIZ);
80101d0d:	83 c4 10             	add    $0x10,%esp
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
    path++;
80101d10:	89 d3                	mov    %edx,%ebx
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
    name[len] = 0;
  }
  while(*path == '/')
80101d12:	80 3a 2f             	cmpb   $0x2f,(%edx)
80101d15:	75 11                	jne    80101d28 <namex+0xb8>
80101d17:	89 f6                	mov    %esi,%esi
80101d19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    path++;
80101d20:	83 c3 01             	add    $0x1,%ebx
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
    name[len] = 0;
  }
  while(*path == '/')
80101d23:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101d26:	74 f8                	je     80101d20 <namex+0xb0>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(myproc()->cwd);

  while((path = skipelem(path, name)) != 0){
    ilock(ip);
80101d28:	83 ec 0c             	sub    $0xc,%esp
80101d2b:	56                   	push   %esi
80101d2c:	e8 5f f9 ff ff       	call   80101690 <ilock>
    if(ip->type != T_DIR){
80101d31:	83 c4 10             	add    $0x10,%esp
80101d34:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101d39:	0f 85 7f 00 00 00    	jne    80101dbe <namex+0x14e>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
80101d3f:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101d42:	85 d2                	test   %edx,%edx
80101d44:	74 09                	je     80101d4f <namex+0xdf>
80101d46:	80 3b 00             	cmpb   $0x0,(%ebx)
80101d49:	0f 84 a3 00 00 00    	je     80101df2 <namex+0x182>
      // Stop one level early.
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
80101d4f:	83 ec 04             	sub    $0x4,%esp
80101d52:	6a 00                	push   $0x0
80101d54:	57                   	push   %edi
80101d55:	56                   	push   %esi
80101d56:	e8 65 fe ff ff       	call   80101bc0 <dirlookup>
80101d5b:	83 c4 10             	add    $0x10,%esp
80101d5e:	85 c0                	test   %eax,%eax
80101d60:	74 5c                	je     80101dbe <namex+0x14e>

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
80101d62:	83 ec 0c             	sub    $0xc,%esp
80101d65:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101d68:	56                   	push   %esi
80101d69:	e8 02 fa ff ff       	call   80101770 <iunlock>
  iput(ip);
80101d6e:	89 34 24             	mov    %esi,(%esp)
80101d71:	e8 4a fa ff ff       	call   801017c0 <iput>
80101d76:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101d79:	83 c4 10             	add    $0x10,%esp
80101d7c:	89 c6                	mov    %eax,%esi
80101d7e:	e9 38 ff ff ff       	jmp    80101cbb <namex+0x4b>
  while(*path == '/')
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101d83:	31 c9                	xor    %ecx,%ecx
80101d85:	8d 76 00             	lea    0x0(%esi),%esi
    path++;
  len = path - s;
  if(len >= DIRSIZ)
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
80101d88:	83 ec 04             	sub    $0x4,%esp
80101d8b:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101d8e:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101d91:	51                   	push   %ecx
80101d92:	53                   	push   %ebx
80101d93:	57                   	push   %edi
80101d94:	e8 47 27 00 00       	call   801044e0 <memmove>
    name[len] = 0;
80101d99:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101d9c:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101d9f:	83 c4 10             	add    $0x10,%esp
80101da2:	c6 04 0f 00          	movb   $0x0,(%edi,%ecx,1)
80101da6:	89 d3                	mov    %edx,%ebx
80101da8:	e9 65 ff ff ff       	jmp    80101d12 <namex+0xa2>
      return 0;
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
80101dad:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101db0:	85 c0                	test   %eax,%eax
80101db2:	75 54                	jne    80101e08 <namex+0x198>
80101db4:	89 f0                	mov    %esi,%eax
    iput(ip);
    return 0;
  }
  return ip;
}
80101db6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101db9:	5b                   	pop    %ebx
80101dba:	5e                   	pop    %esi
80101dbb:	5f                   	pop    %edi
80101dbc:	5d                   	pop    %ebp
80101dbd:	c3                   	ret    

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
80101dbe:	83 ec 0c             	sub    $0xc,%esp
80101dc1:	56                   	push   %esi
80101dc2:	e8 a9 f9 ff ff       	call   80101770 <iunlock>
  iput(ip);
80101dc7:	89 34 24             	mov    %esi,(%esp)
80101dca:	e8 f1 f9 ff ff       	call   801017c0 <iput>
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
      iunlockput(ip);
      return 0;
80101dcf:	83 c4 10             	add    $0x10,%esp
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101dd2:	8d 65 f4             	lea    -0xc(%ebp),%esp
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
      iunlockput(ip);
      return 0;
80101dd5:	31 c0                	xor    %eax,%eax
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101dd7:	5b                   	pop    %ebx
80101dd8:	5e                   	pop    %esi
80101dd9:	5f                   	pop    %edi
80101dda:	5d                   	pop    %ebp
80101ddb:	c3                   	ret    
namex(char *path, int nameiparent, char *name)
{
  struct inode *ip, *next;

  if(*path == '/')
    ip = iget(ROOTDEV, ROOTINO);
80101ddc:	ba 01 00 00 00       	mov    $0x1,%edx
80101de1:	b8 01 00 00 00       	mov    $0x1,%eax
80101de6:	e8 45 f4 ff ff       	call   80101230 <iget>
80101deb:	89 c6                	mov    %eax,%esi
80101ded:	e9 c9 fe ff ff       	jmp    80101cbb <namex+0x4b>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
      // Stop one level early.
      iunlock(ip);
80101df2:	83 ec 0c             	sub    $0xc,%esp
80101df5:	56                   	push   %esi
80101df6:	e8 75 f9 ff ff       	call   80101770 <iunlock>
      return ip;
80101dfb:	83 c4 10             	add    $0x10,%esp
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101dfe:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return 0;
    }
    if(nameiparent && *path == '\0'){
      // Stop one level early.
      iunlock(ip);
      return ip;
80101e01:	89 f0                	mov    %esi,%eax
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101e03:	5b                   	pop    %ebx
80101e04:	5e                   	pop    %esi
80101e05:	5f                   	pop    %edi
80101e06:	5d                   	pop    %ebp
80101e07:	c3                   	ret    
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
    iput(ip);
80101e08:	83 ec 0c             	sub    $0xc,%esp
80101e0b:	56                   	push   %esi
80101e0c:	e8 af f9 ff ff       	call   801017c0 <iput>
    return 0;
80101e11:	83 c4 10             	add    $0x10,%esp
80101e14:	31 c0                	xor    %eax,%eax
80101e16:	eb 9e                	jmp    80101db6 <namex+0x146>
80101e18:	90                   	nop
80101e19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101e20 <dirlink>:
}

// Write a new directory entry (name, inum) into the directory dp.
int
dirlink(struct inode *dp, char *name, uint inum)
{
80101e20:	55                   	push   %ebp
80101e21:	89 e5                	mov    %esp,%ebp
80101e23:	57                   	push   %edi
80101e24:	56                   	push   %esi
80101e25:	53                   	push   %ebx
80101e26:	83 ec 20             	sub    $0x20,%esp
80101e29:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
80101e2c:	6a 00                	push   $0x0
80101e2e:	ff 75 0c             	pushl  0xc(%ebp)
80101e31:	53                   	push   %ebx
80101e32:	e8 89 fd ff ff       	call   80101bc0 <dirlookup>
80101e37:	83 c4 10             	add    $0x10,%esp
80101e3a:	85 c0                	test   %eax,%eax
80101e3c:	75 67                	jne    80101ea5 <dirlink+0x85>
    iput(ip);
    return -1;
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
80101e3e:	8b 7b 58             	mov    0x58(%ebx),%edi
80101e41:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e44:	85 ff                	test   %edi,%edi
80101e46:	74 29                	je     80101e71 <dirlink+0x51>
80101e48:	31 ff                	xor    %edi,%edi
80101e4a:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e4d:	eb 09                	jmp    80101e58 <dirlink+0x38>
80101e4f:	90                   	nop
80101e50:	83 c7 10             	add    $0x10,%edi
80101e53:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101e56:	76 19                	jbe    80101e71 <dirlink+0x51>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e58:	6a 10                	push   $0x10
80101e5a:	57                   	push   %edi
80101e5b:	56                   	push   %esi
80101e5c:	53                   	push   %ebx
80101e5d:	e8 0e fb ff ff       	call   80101970 <readi>
80101e62:	83 c4 10             	add    $0x10,%esp
80101e65:	83 f8 10             	cmp    $0x10,%eax
80101e68:	75 4e                	jne    80101eb8 <dirlink+0x98>
      panic("dirlink read");
    if(de.inum == 0)
80101e6a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101e6f:	75 df                	jne    80101e50 <dirlink+0x30>
      break;
  }

  strncpy(de.name, name, DIRSIZ);
80101e71:	8d 45 da             	lea    -0x26(%ebp),%eax
80101e74:	83 ec 04             	sub    $0x4,%esp
80101e77:	6a 0e                	push   $0xe
80101e79:	ff 75 0c             	pushl  0xc(%ebp)
80101e7c:	50                   	push   %eax
80101e7d:	e8 4e 27 00 00       	call   801045d0 <strncpy>
  de.inum = inum;
80101e82:	8b 45 10             	mov    0x10(%ebp),%eax
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e85:	6a 10                	push   $0x10
80101e87:	57                   	push   %edi
80101e88:	56                   	push   %esi
80101e89:	53                   	push   %ebx
    if(de.inum == 0)
      break;
  }

  strncpy(de.name, name, DIRSIZ);
  de.inum = inum;
80101e8a:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e8e:	e8 dd fb ff ff       	call   80101a70 <writei>
80101e93:	83 c4 20             	add    $0x20,%esp
80101e96:	83 f8 10             	cmp    $0x10,%eax
80101e99:	75 2a                	jne    80101ec5 <dirlink+0xa5>
    panic("dirlink");

  return 0;
80101e9b:	31 c0                	xor    %eax,%eax
}
80101e9d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101ea0:	5b                   	pop    %ebx
80101ea1:	5e                   	pop    %esi
80101ea2:	5f                   	pop    %edi
80101ea3:	5d                   	pop    %ebp
80101ea4:	c3                   	ret    
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
    iput(ip);
80101ea5:	83 ec 0c             	sub    $0xc,%esp
80101ea8:	50                   	push   %eax
80101ea9:	e8 12 f9 ff ff       	call   801017c0 <iput>
    return -1;
80101eae:	83 c4 10             	add    $0x10,%esp
80101eb1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101eb6:	eb e5                	jmp    80101e9d <dirlink+0x7d>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlink read");
80101eb8:	83 ec 0c             	sub    $0xc,%esp
80101ebb:	68 48 72 10 80       	push   $0x80107248
80101ec0:	e8 ab e4 ff ff       	call   80100370 <panic>
  }

  strncpy(de.name, name, DIRSIZ);
  de.inum = inum;
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("dirlink");
80101ec5:	83 ec 0c             	sub    $0xc,%esp
80101ec8:	68 46 78 10 80       	push   $0x80107846
80101ecd:	e8 9e e4 ff ff       	call   80100370 <panic>
80101ed2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101ed9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ee0 <namei>:
  return ip;
}

struct inode*
namei(char *path)
{
80101ee0:	55                   	push   %ebp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101ee1:	31 d2                	xor    %edx,%edx
  return ip;
}

struct inode*
namei(char *path)
{
80101ee3:	89 e5                	mov    %esp,%ebp
80101ee5:	83 ec 18             	sub    $0x18,%esp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101ee8:	8b 45 08             	mov    0x8(%ebp),%eax
80101eeb:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101eee:	e8 7d fd ff ff       	call   80101c70 <namex>
}
80101ef3:	c9                   	leave  
80101ef4:	c3                   	ret    
80101ef5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101ef9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101f00 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
80101f00:	55                   	push   %ebp
  return namex(path, 1, name);
80101f01:	ba 01 00 00 00       	mov    $0x1,%edx
  return namex(path, 0, name);
}

struct inode*
nameiparent(char *path, char *name)
{
80101f06:	89 e5                	mov    %esp,%ebp
  return namex(path, 1, name);
80101f08:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101f0b:	8b 45 08             	mov    0x8(%ebp),%eax
}
80101f0e:	5d                   	pop    %ebp
}

struct inode*
nameiparent(char *path, char *name)
{
  return namex(path, 1, name);
80101f0f:	e9 5c fd ff ff       	jmp    80101c70 <namex>
80101f14:	66 90                	xchg   %ax,%ax
80101f16:	66 90                	xchg   %ax,%ax
80101f18:	66 90                	xchg   %ax,%ax
80101f1a:	66 90                	xchg   %ax,%ax
80101f1c:	66 90                	xchg   %ax,%ax
80101f1e:	66 90                	xchg   %ax,%ax

80101f20 <idestart>:
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80101f20:	55                   	push   %ebp
  if(b == 0)
80101f21:	85 c0                	test   %eax,%eax
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80101f23:	89 e5                	mov    %esp,%ebp
80101f25:	56                   	push   %esi
80101f26:	53                   	push   %ebx
  if(b == 0)
80101f27:	0f 84 ad 00 00 00    	je     80101fda <idestart+0xba>
    panic("idestart");
  if(b->blockno >= FSSIZE)
80101f2d:	8b 58 08             	mov    0x8(%eax),%ebx
80101f30:	89 c1                	mov    %eax,%ecx
80101f32:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
80101f38:	0f 87 8f 00 00 00    	ja     80101fcd <idestart+0xad>
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101f3e:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101f43:	90                   	nop
80101f44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101f48:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80101f49:	83 e0 c0             	and    $0xffffffc0,%eax
80101f4c:	3c 40                	cmp    $0x40,%al
80101f4e:	75 f8                	jne    80101f48 <idestart+0x28>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80101f50:	31 f6                	xor    %esi,%esi
80101f52:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101f57:	89 f0                	mov    %esi,%eax
80101f59:	ee                   	out    %al,(%dx)
80101f5a:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101f5f:	b8 01 00 00 00       	mov    $0x1,%eax
80101f64:	ee                   	out    %al,(%dx)
80101f65:	ba f3 01 00 00       	mov    $0x1f3,%edx
80101f6a:	89 d8                	mov    %ebx,%eax
80101f6c:	ee                   	out    %al,(%dx)
80101f6d:	89 d8                	mov    %ebx,%eax
80101f6f:	ba f4 01 00 00       	mov    $0x1f4,%edx
80101f74:	c1 f8 08             	sar    $0x8,%eax
80101f77:	ee                   	out    %al,(%dx)
80101f78:	ba f5 01 00 00       	mov    $0x1f5,%edx
80101f7d:	89 f0                	mov    %esi,%eax
80101f7f:	ee                   	out    %al,(%dx)
80101f80:	0f b6 41 04          	movzbl 0x4(%ecx),%eax
80101f84:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101f89:	83 e0 01             	and    $0x1,%eax
80101f8c:	c1 e0 04             	shl    $0x4,%eax
80101f8f:	83 c8 e0             	or     $0xffffffe0,%eax
80101f92:	ee                   	out    %al,(%dx)
  outb(0x1f2, sector_per_block);  // number of sectors
  outb(0x1f3, sector & 0xff);
  outb(0x1f4, (sector >> 8) & 0xff);
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
  if(b->flags & B_DIRTY){
80101f93:	f6 01 04             	testb  $0x4,(%ecx)
80101f96:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101f9b:	75 13                	jne    80101fb0 <idestart+0x90>
80101f9d:	b8 20 00 00 00       	mov    $0x20,%eax
80101fa2:	ee                   	out    %al,(%dx)
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
  } else {
    outb(0x1f7, read_cmd);
  }
}
80101fa3:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101fa6:	5b                   	pop    %ebx
80101fa7:	5e                   	pop    %esi
80101fa8:	5d                   	pop    %ebp
80101fa9:	c3                   	ret    
80101faa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101fb0:	b8 30 00 00 00       	mov    $0x30,%eax
80101fb5:	ee                   	out    %al,(%dx)
}

static inline void
outsl(int port, const void *addr, int cnt)
{
  asm volatile("cld; rep outsl" :
80101fb6:	ba f0 01 00 00       	mov    $0x1f0,%edx
  outb(0x1f4, (sector >> 8) & 0xff);
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
  if(b->flags & B_DIRTY){
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
80101fbb:	8d 71 5c             	lea    0x5c(%ecx),%esi
80101fbe:	b9 80 00 00 00       	mov    $0x80,%ecx
80101fc3:	fc                   	cld    
80101fc4:	f3 6f                	rep outsl %ds:(%esi),(%dx)
  } else {
    outb(0x1f7, read_cmd);
  }
}
80101fc6:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101fc9:	5b                   	pop    %ebx
80101fca:	5e                   	pop    %esi
80101fcb:	5d                   	pop    %ebp
80101fcc:	c3                   	ret    
idestart(struct buf *b)
{
  if(b == 0)
    panic("idestart");
  if(b->blockno >= FSSIZE)
    panic("incorrect blockno");
80101fcd:	83 ec 0c             	sub    $0xc,%esp
80101fd0:	68 b4 72 10 80       	push   $0x801072b4
80101fd5:	e8 96 e3 ff ff       	call   80100370 <panic>
// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
  if(b == 0)
    panic("idestart");
80101fda:	83 ec 0c             	sub    $0xc,%esp
80101fdd:	68 ab 72 10 80       	push   $0x801072ab
80101fe2:	e8 89 e3 ff ff       	call   80100370 <panic>
80101fe7:	89 f6                	mov    %esi,%esi
80101fe9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ff0 <ideinit>:
  return 0;
}

void
ideinit(void)
{
80101ff0:	55                   	push   %ebp
80101ff1:	89 e5                	mov    %esp,%ebp
80101ff3:	83 ec 10             	sub    $0x10,%esp
  int i;

  initlock(&idelock, "ide");
80101ff6:	68 c6 72 10 80       	push   $0x801072c6
80101ffb:	68 80 a5 10 80       	push   $0x8010a580
80102000:	e8 bb 21 00 00       	call   801041c0 <initlock>
  ioapicenable(IRQ_IDE, ncpu - 1);
80102005:	58                   	pop    %eax
80102006:	a1 00 2d 11 80       	mov    0x80112d00,%eax
8010200b:	5a                   	pop    %edx
8010200c:	83 e8 01             	sub    $0x1,%eax
8010200f:	50                   	push   %eax
80102010:	6a 0e                	push   $0xe
80102012:	e8 a9 02 00 00       	call   801022c0 <ioapicenable>
80102017:	83 c4 10             	add    $0x10,%esp
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010201a:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010201f:	90                   	nop
80102020:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80102021:	83 e0 c0             	and    $0xffffffc0,%eax
80102024:	3c 40                	cmp    $0x40,%al
80102026:	75 f8                	jne    80102020 <ideinit+0x30>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102028:	ba f6 01 00 00       	mov    $0x1f6,%edx
8010202d:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
80102032:	ee                   	out    %al,(%dx)
80102033:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102038:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010203d:	eb 06                	jmp    80102045 <ideinit+0x55>
8010203f:	90                   	nop
  ioapicenable(IRQ_IDE, ncpu - 1);
  idewait(0);

  // Check if disk 1 is present
  outb(0x1f6, 0xe0 | (1<<4));
  for(i=0; i<1000; i++){
80102040:	83 e9 01             	sub    $0x1,%ecx
80102043:	74 0f                	je     80102054 <ideinit+0x64>
80102045:	ec                   	in     (%dx),%al
    if(inb(0x1f7) != 0){
80102046:	84 c0                	test   %al,%al
80102048:	74 f6                	je     80102040 <ideinit+0x50>
      havedisk1 = 1;
8010204a:	c7 05 60 a5 10 80 01 	movl   $0x1,0x8010a560
80102051:	00 00 00 
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102054:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102059:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
8010205e:	ee                   	out    %al,(%dx)
    }
  }

  // Switch back to disk 0.
  outb(0x1f6, 0xe0 | (0<<4));
}
8010205f:	c9                   	leave  
80102060:	c3                   	ret    
80102061:	eb 0d                	jmp    80102070 <ideintr>
80102063:	90                   	nop
80102064:	90                   	nop
80102065:	90                   	nop
80102066:	90                   	nop
80102067:	90                   	nop
80102068:	90                   	nop
80102069:	90                   	nop
8010206a:	90                   	nop
8010206b:	90                   	nop
8010206c:	90                   	nop
8010206d:	90                   	nop
8010206e:	90                   	nop
8010206f:	90                   	nop

80102070 <ideintr>:
}

// Interrupt handler.
void
ideintr(void)
{
80102070:	55                   	push   %ebp
80102071:	89 e5                	mov    %esp,%ebp
80102073:	57                   	push   %edi
80102074:	56                   	push   %esi
80102075:	53                   	push   %ebx
80102076:	83 ec 18             	sub    $0x18,%esp
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
80102079:	68 80 a5 10 80       	push   $0x8010a580
8010207e:	e8 3d 22 00 00       	call   801042c0 <acquire>

  if((b = idequeue) == 0){
80102083:	8b 1d 64 a5 10 80    	mov    0x8010a564,%ebx
80102089:	83 c4 10             	add    $0x10,%esp
8010208c:	85 db                	test   %ebx,%ebx
8010208e:	74 34                	je     801020c4 <ideintr+0x54>
    release(&idelock);
    return;
  }
  idequeue = b->qnext;
80102090:	8b 43 58             	mov    0x58(%ebx),%eax
80102093:	a3 64 a5 10 80       	mov    %eax,0x8010a564

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
80102098:	8b 33                	mov    (%ebx),%esi
8010209a:	f7 c6 04 00 00 00    	test   $0x4,%esi
801020a0:	74 3e                	je     801020e0 <ideintr+0x70>
    insl(0x1f0, b->data, BSIZE/4);

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
  b->flags &= ~B_DIRTY;
801020a2:	83 e6 fb             	and    $0xfffffffb,%esi
  wakeup(b);
801020a5:	83 ec 0c             	sub    $0xc,%esp
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
    insl(0x1f0, b->data, BSIZE/4);

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
  b->flags &= ~B_DIRTY;
801020a8:	83 ce 02             	or     $0x2,%esi
801020ab:	89 33                	mov    %esi,(%ebx)
  wakeup(b);
801020ad:	53                   	push   %ebx
801020ae:	e8 4d 1e 00 00       	call   80103f00 <wakeup>

  // Start disk on next buf in queue.
  if(idequeue != 0)
801020b3:	a1 64 a5 10 80       	mov    0x8010a564,%eax
801020b8:	83 c4 10             	add    $0x10,%esp
801020bb:	85 c0                	test   %eax,%eax
801020bd:	74 05                	je     801020c4 <ideintr+0x54>
    idestart(idequeue);
801020bf:	e8 5c fe ff ff       	call   80101f20 <idestart>

  // First queued buffer is the active request.
  acquire(&idelock);

  if((b = idequeue) == 0){
    release(&idelock);
801020c4:	83 ec 0c             	sub    $0xc,%esp
801020c7:	68 80 a5 10 80       	push   $0x8010a580
801020cc:	e8 0f 23 00 00       	call   801043e0 <release>
  // Start disk on next buf in queue.
  if(idequeue != 0)
    idestart(idequeue);

  release(&idelock);
}
801020d1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801020d4:	5b                   	pop    %ebx
801020d5:	5e                   	pop    %esi
801020d6:	5f                   	pop    %edi
801020d7:	5d                   	pop    %ebp
801020d8:	c3                   	ret    
801020d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801020e0:	ba f7 01 00 00       	mov    $0x1f7,%edx
801020e5:	8d 76 00             	lea    0x0(%esi),%esi
801020e8:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
801020e9:	89 c1                	mov    %eax,%ecx
801020eb:	83 e1 c0             	and    $0xffffffc0,%ecx
801020ee:	80 f9 40             	cmp    $0x40,%cl
801020f1:	75 f5                	jne    801020e8 <ideintr+0x78>
    ;
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
801020f3:	a8 21                	test   $0x21,%al
801020f5:	75 ab                	jne    801020a2 <ideintr+0x32>
  }
  idequeue = b->qnext;

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
    insl(0x1f0, b->data, BSIZE/4);
801020f7:	8d 7b 5c             	lea    0x5c(%ebx),%edi
}

static inline void
insl(int port, void *addr, int cnt)
{
  asm volatile("cld; rep insl" :
801020fa:	b9 80 00 00 00       	mov    $0x80,%ecx
801020ff:	ba f0 01 00 00       	mov    $0x1f0,%edx
80102104:	fc                   	cld    
80102105:	f3 6d                	rep insl (%dx),%es:(%edi)
80102107:	8b 33                	mov    (%ebx),%esi
80102109:	eb 97                	jmp    801020a2 <ideintr+0x32>
8010210b:	90                   	nop
8010210c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102110 <iderw>:
// Sync buf with disk.
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void
iderw(struct buf *b)
{
80102110:	55                   	push   %ebp
80102111:	89 e5                	mov    %esp,%ebp
80102113:	53                   	push   %ebx
80102114:	83 ec 10             	sub    $0x10,%esp
80102117:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf **pp;

  if(!holdingsleep(&b->lock))
8010211a:	8d 43 0c             	lea    0xc(%ebx),%eax
8010211d:	50                   	push   %eax
8010211e:	e8 6d 20 00 00       	call   80104190 <holdingsleep>
80102123:	83 c4 10             	add    $0x10,%esp
80102126:	85 c0                	test   %eax,%eax
80102128:	0f 84 ad 00 00 00    	je     801021db <iderw+0xcb>
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
8010212e:	8b 03                	mov    (%ebx),%eax
80102130:	83 e0 06             	and    $0x6,%eax
80102133:	83 f8 02             	cmp    $0x2,%eax
80102136:	0f 84 b9 00 00 00    	je     801021f5 <iderw+0xe5>
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
8010213c:	8b 53 04             	mov    0x4(%ebx),%edx
8010213f:	85 d2                	test   %edx,%edx
80102141:	74 0d                	je     80102150 <iderw+0x40>
80102143:	a1 60 a5 10 80       	mov    0x8010a560,%eax
80102148:	85 c0                	test   %eax,%eax
8010214a:	0f 84 98 00 00 00    	je     801021e8 <iderw+0xd8>
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock
80102150:	83 ec 0c             	sub    $0xc,%esp
80102153:	68 80 a5 10 80       	push   $0x8010a580
80102158:	e8 63 21 00 00       	call   801042c0 <acquire>

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010215d:	8b 15 64 a5 10 80    	mov    0x8010a564,%edx
80102163:	83 c4 10             	add    $0x10,%esp
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock

  // Append b to idequeue.
  b->qnext = 0;
80102166:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010216d:	85 d2                	test   %edx,%edx
8010216f:	75 09                	jne    8010217a <iderw+0x6a>
80102171:	eb 58                	jmp    801021cb <iderw+0xbb>
80102173:	90                   	nop
80102174:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102178:	89 c2                	mov    %eax,%edx
8010217a:	8b 42 58             	mov    0x58(%edx),%eax
8010217d:	85 c0                	test   %eax,%eax
8010217f:	75 f7                	jne    80102178 <iderw+0x68>
80102181:	83 c2 58             	add    $0x58,%edx
    ;
  *pp = b;
80102184:	89 1a                	mov    %ebx,(%edx)

  // Start disk if necessary.
  if(idequeue == b)
80102186:	3b 1d 64 a5 10 80    	cmp    0x8010a564,%ebx
8010218c:	74 44                	je     801021d2 <iderw+0xc2>
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
8010218e:	8b 03                	mov    (%ebx),%eax
80102190:	83 e0 06             	and    $0x6,%eax
80102193:	83 f8 02             	cmp    $0x2,%eax
80102196:	74 23                	je     801021bb <iderw+0xab>
80102198:	90                   	nop
80102199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    sleep(b, &idelock);
801021a0:	83 ec 08             	sub    $0x8,%esp
801021a3:	68 80 a5 10 80       	push   $0x8010a580
801021a8:	53                   	push   %ebx
801021a9:	e8 a2 1b 00 00       	call   80103d50 <sleep>
  // Start disk if necessary.
  if(idequeue == b)
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
801021ae:	8b 03                	mov    (%ebx),%eax
801021b0:	83 c4 10             	add    $0x10,%esp
801021b3:	83 e0 06             	and    $0x6,%eax
801021b6:	83 f8 02             	cmp    $0x2,%eax
801021b9:	75 e5                	jne    801021a0 <iderw+0x90>
    sleep(b, &idelock);
  }


  release(&idelock);
801021bb:	c7 45 08 80 a5 10 80 	movl   $0x8010a580,0x8(%ebp)
}
801021c2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801021c5:	c9                   	leave  
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
    sleep(b, &idelock);
  }


  release(&idelock);
801021c6:	e9 15 22 00 00       	jmp    801043e0 <release>

  acquire(&idelock);  //DOC:acquire-lock

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
801021cb:	ba 64 a5 10 80       	mov    $0x8010a564,%edx
801021d0:	eb b2                	jmp    80102184 <iderw+0x74>
    ;
  *pp = b;

  // Start disk if necessary.
  if(idequeue == b)
    idestart(b);
801021d2:	89 d8                	mov    %ebx,%eax
801021d4:	e8 47 fd ff ff       	call   80101f20 <idestart>
801021d9:	eb b3                	jmp    8010218e <iderw+0x7e>
iderw(struct buf *b)
{
  struct buf **pp;

  if(!holdingsleep(&b->lock))
    panic("iderw: buf not locked");
801021db:	83 ec 0c             	sub    $0xc,%esp
801021de:	68 ca 72 10 80       	push   $0x801072ca
801021e3:	e8 88 e1 ff ff       	call   80100370 <panic>
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
    panic("iderw: ide disk 1 not present");
801021e8:	83 ec 0c             	sub    $0xc,%esp
801021eb:	68 f5 72 10 80       	push   $0x801072f5
801021f0:	e8 7b e1 ff ff       	call   80100370 <panic>
  struct buf **pp;

  if(!holdingsleep(&b->lock))
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
    panic("iderw: nothing to do");
801021f5:	83 ec 0c             	sub    $0xc,%esp
801021f8:	68 e0 72 10 80       	push   $0x801072e0
801021fd:	e8 6e e1 ff ff       	call   80100370 <panic>
80102202:	66 90                	xchg   %ax,%ax
80102204:	66 90                	xchg   %ax,%ax
80102206:	66 90                	xchg   %ax,%ax
80102208:	66 90                	xchg   %ax,%ax
8010220a:	66 90                	xchg   %ax,%ax
8010220c:	66 90                	xchg   %ax,%ax
8010220e:	66 90                	xchg   %ax,%ax

80102210 <ioapicinit>:
  ioapic->data = data;
}

void
ioapicinit(void)
{
80102210:	55                   	push   %ebp
  int i, id, maxintr;

  ioapic = (volatile struct ioapic*)IOAPIC;
80102211:	c7 05 34 26 11 80 00 	movl   $0xfec00000,0x80112634
80102218:	00 c0 fe 
  ioapic->data = data;
}

void
ioapicinit(void)
{
8010221b:	89 e5                	mov    %esp,%ebp
8010221d:	56                   	push   %esi
8010221e:	53                   	push   %ebx
};

static uint
ioapicread(int reg)
{
  ioapic->reg = reg;
8010221f:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
80102226:	00 00 00 
  return ioapic->data;
80102229:	8b 15 34 26 11 80    	mov    0x80112634,%edx
8010222f:	8b 72 10             	mov    0x10(%edx),%esi
};

static uint
ioapicread(int reg)
{
  ioapic->reg = reg;
80102232:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
  return ioapic->data;
80102238:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
  int i, id, maxintr;

  ioapic = (volatile struct ioapic*)IOAPIC;
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  id = ioapicread(REG_ID) >> 24;
  if(id != ioapicid)
8010223e:	0f b6 15 60 27 11 80 	movzbl 0x80112760,%edx
ioapicinit(void)
{
  int i, id, maxintr;

  ioapic = (volatile struct ioapic*)IOAPIC;
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
80102245:	89 f0                	mov    %esi,%eax
80102247:	c1 e8 10             	shr    $0x10,%eax
8010224a:	0f b6 f0             	movzbl %al,%esi

static uint
ioapicread(int reg)
{
  ioapic->reg = reg;
  return ioapic->data;
8010224d:	8b 41 10             	mov    0x10(%ecx),%eax
  int i, id, maxintr;

  ioapic = (volatile struct ioapic*)IOAPIC;
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  id = ioapicread(REG_ID) >> 24;
  if(id != ioapicid)
80102250:	c1 e8 18             	shr    $0x18,%eax
80102253:	39 d0                	cmp    %edx,%eax
80102255:	74 16                	je     8010226d <ioapicinit+0x5d>
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");
80102257:	83 ec 0c             	sub    $0xc,%esp
8010225a:	68 14 73 10 80       	push   $0x80107314
8010225f:	e8 fc e3 ff ff       	call   80100660 <cprintf>
80102264:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
8010226a:	83 c4 10             	add    $0x10,%esp
8010226d:	83 c6 21             	add    $0x21,%esi
  ioapic->data = data;
}

void
ioapicinit(void)
{
80102270:	ba 10 00 00 00       	mov    $0x10,%edx
80102275:	b8 20 00 00 00       	mov    $0x20,%eax
8010227a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
80102280:	89 11                	mov    %edx,(%ecx)
  ioapic->data = data;
80102282:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
80102288:	89 c3                	mov    %eax,%ebx
8010228a:	81 cb 00 00 01 00    	or     $0x10000,%ebx
80102290:	83 c0 01             	add    $0x1,%eax

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
  ioapic->data = data;
80102293:	89 59 10             	mov    %ebx,0x10(%ecx)
80102296:	8d 5a 01             	lea    0x1(%edx),%ebx
80102299:	83 c2 02             	add    $0x2,%edx
  if(id != ioapicid)
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
8010229c:	39 f0                	cmp    %esi,%eax
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
8010229e:	89 19                	mov    %ebx,(%ecx)
  ioapic->data = data;
801022a0:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
801022a6:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
  if(id != ioapicid)
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
801022ad:	75 d1                	jne    80102280 <ioapicinit+0x70>
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
    ioapicwrite(REG_TABLE+2*i+1, 0);
  }
}
801022af:	8d 65 f8             	lea    -0x8(%ebp),%esp
801022b2:	5b                   	pop    %ebx
801022b3:	5e                   	pop    %esi
801022b4:	5d                   	pop    %ebp
801022b5:	c3                   	ret    
801022b6:	8d 76 00             	lea    0x0(%esi),%esi
801022b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801022c0 <ioapicenable>:

void
ioapicenable(int irq, int cpunum)
{
801022c0:	55                   	push   %ebp
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
801022c1:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
  }
}

void
ioapicenable(int irq, int cpunum)
{
801022c7:	89 e5                	mov    %esp,%ebp
801022c9:	8b 45 08             	mov    0x8(%ebp),%eax
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
801022cc:	8d 50 20             	lea    0x20(%eax),%edx
801022cf:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
801022d3:	89 01                	mov    %eax,(%ecx)
  ioapic->data = data;
801022d5:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
801022db:	83 c0 01             	add    $0x1,%eax
  ioapic->data = data;
801022de:	89 51 10             	mov    %edx,0x10(%ecx)
{
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
801022e1:	8b 55 0c             	mov    0xc(%ebp),%edx
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
801022e4:	89 01                	mov    %eax,(%ecx)
  ioapic->data = data;
801022e6:	a1 34 26 11 80       	mov    0x80112634,%eax
{
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
801022eb:	c1 e2 18             	shl    $0x18,%edx

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
  ioapic->data = data;
801022ee:	89 50 10             	mov    %edx,0x10(%eax)
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
}
801022f1:	5d                   	pop    %ebp
801022f2:	c3                   	ret    
801022f3:	66 90                	xchg   %ax,%ax
801022f5:	66 90                	xchg   %ax,%ax
801022f7:	66 90                	xchg   %ax,%ax
801022f9:	66 90                	xchg   %ax,%ax
801022fb:	66 90                	xchg   %ax,%ax
801022fd:	66 90                	xchg   %ax,%ax
801022ff:	90                   	nop

80102300 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(char *v)
{
80102300:	55                   	push   %ebp
80102301:	89 e5                	mov    %esp,%ebp
80102303:	53                   	push   %ebx
80102304:	83 ec 04             	sub    $0x4,%esp
80102307:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct run *r;

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
8010230a:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
80102310:	75 70                	jne    80102382 <kfree+0x82>
80102312:	81 fb f4 58 11 80    	cmp    $0x801158f4,%ebx
80102318:	72 68                	jb     80102382 <kfree+0x82>
8010231a:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80102320:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
80102325:	77 5b                	ja     80102382 <kfree+0x82>
    panic("kfree");

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);
80102327:	83 ec 04             	sub    $0x4,%esp
8010232a:	68 00 10 00 00       	push   $0x1000
8010232f:	6a 01                	push   $0x1
80102331:	53                   	push   %ebx
80102332:	e8 f9 20 00 00       	call   80104430 <memset>

  if(kmem.use_lock)
80102337:	8b 15 74 26 11 80    	mov    0x80112674,%edx
8010233d:	83 c4 10             	add    $0x10,%esp
80102340:	85 d2                	test   %edx,%edx
80102342:	75 2c                	jne    80102370 <kfree+0x70>
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
80102344:	a1 78 26 11 80       	mov    0x80112678,%eax
80102349:	89 03                	mov    %eax,(%ebx)
  kmem.freelist = r;
  if(kmem.use_lock)
8010234b:	a1 74 26 11 80       	mov    0x80112674,%eax

  if(kmem.use_lock)
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
  kmem.freelist = r;
80102350:	89 1d 78 26 11 80    	mov    %ebx,0x80112678
  if(kmem.use_lock)
80102356:	85 c0                	test   %eax,%eax
80102358:	75 06                	jne    80102360 <kfree+0x60>
    release(&kmem.lock);
}
8010235a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010235d:	c9                   	leave  
8010235e:	c3                   	ret    
8010235f:	90                   	nop
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
  kmem.freelist = r;
  if(kmem.use_lock)
    release(&kmem.lock);
80102360:	c7 45 08 40 26 11 80 	movl   $0x80112640,0x8(%ebp)
}
80102367:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010236a:	c9                   	leave  
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
  kmem.freelist = r;
  if(kmem.use_lock)
    release(&kmem.lock);
8010236b:	e9 70 20 00 00       	jmp    801043e0 <release>

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);

  if(kmem.use_lock)
    acquire(&kmem.lock);
80102370:	83 ec 0c             	sub    $0xc,%esp
80102373:	68 40 26 11 80       	push   $0x80112640
80102378:	e8 43 1f 00 00       	call   801042c0 <acquire>
8010237d:	83 c4 10             	add    $0x10,%esp
80102380:	eb c2                	jmp    80102344 <kfree+0x44>
kfree(char *v)
{
  struct run *r;

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
    panic("kfree");
80102382:	83 ec 0c             	sub    $0xc,%esp
80102385:	68 46 73 10 80       	push   $0x80107346
8010238a:	e8 e1 df ff ff       	call   80100370 <panic>
8010238f:	90                   	nop

80102390 <freerange>:
  kmem.use_lock = 1;
}

void
freerange(void *vstart, void *vend)
{
80102390:	55                   	push   %ebp
80102391:	89 e5                	mov    %esp,%ebp
80102393:	56                   	push   %esi
80102394:	53                   	push   %ebx
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
80102395:	8b 45 08             	mov    0x8(%ebp),%eax
  kmem.use_lock = 1;
}

void
freerange(void *vstart, void *vend)
{
80102398:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
8010239b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801023a1:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023a7:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023ad:	39 de                	cmp    %ebx,%esi
801023af:	72 23                	jb     801023d4 <freerange+0x44>
801023b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    kfree(p);
801023b8:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
801023be:	83 ec 0c             	sub    $0xc,%esp
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023c1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
801023c7:	50                   	push   %eax
801023c8:	e8 33 ff ff ff       	call   80102300 <kfree>
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023cd:	83 c4 10             	add    $0x10,%esp
801023d0:	39 f3                	cmp    %esi,%ebx
801023d2:	76 e4                	jbe    801023b8 <freerange+0x28>
    kfree(p);
}
801023d4:	8d 65 f8             	lea    -0x8(%ebp),%esp
801023d7:	5b                   	pop    %ebx
801023d8:	5e                   	pop    %esi
801023d9:	5d                   	pop    %ebp
801023da:	c3                   	ret    
801023db:	90                   	nop
801023dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801023e0 <kinit1>:
// the pages mapped by entrypgdir on free list.
// 2. main() calls kinit2() with the rest of the physical pages
// after installing a full page table that maps them on all cores.
void
kinit1(void *vstart, void *vend)
{
801023e0:	55                   	push   %ebp
801023e1:	89 e5                	mov    %esp,%ebp
801023e3:	56                   	push   %esi
801023e4:	53                   	push   %ebx
801023e5:	8b 75 0c             	mov    0xc(%ebp),%esi
  initlock(&kmem.lock, "kmem");
801023e8:	83 ec 08             	sub    $0x8,%esp
801023eb:	68 4c 73 10 80       	push   $0x8010734c
801023f0:	68 40 26 11 80       	push   $0x80112640
801023f5:	e8 c6 1d 00 00       	call   801041c0 <initlock>

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
801023fa:	8b 45 08             	mov    0x8(%ebp),%eax
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023fd:	83 c4 10             	add    $0x10,%esp
// after installing a full page table that maps them on all cores.
void
kinit1(void *vstart, void *vend)
{
  initlock(&kmem.lock, "kmem");
  kmem.use_lock = 0;
80102400:	c7 05 74 26 11 80 00 	movl   $0x0,0x80112674
80102407:	00 00 00 

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
8010240a:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102410:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102416:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010241c:	39 de                	cmp    %ebx,%esi
8010241e:	72 1c                	jb     8010243c <kinit1+0x5c>
    kfree(p);
80102420:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
80102426:	83 ec 0c             	sub    $0xc,%esp
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102429:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
8010242f:	50                   	push   %eax
80102430:	e8 cb fe ff ff       	call   80102300 <kfree>
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102435:	83 c4 10             	add    $0x10,%esp
80102438:	39 de                	cmp    %ebx,%esi
8010243a:	73 e4                	jae    80102420 <kinit1+0x40>
kinit1(void *vstart, void *vend)
{
  initlock(&kmem.lock, "kmem");
  kmem.use_lock = 0;
  freerange(vstart, vend);
}
8010243c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010243f:	5b                   	pop    %ebx
80102440:	5e                   	pop    %esi
80102441:	5d                   	pop    %ebp
80102442:	c3                   	ret    
80102443:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102450 <kinit2>:

void
kinit2(void *vstart, void *vend)
{
80102450:	55                   	push   %ebp
80102451:	89 e5                	mov    %esp,%ebp
80102453:	56                   	push   %esi
80102454:	53                   	push   %ebx

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
80102455:	8b 45 08             	mov    0x8(%ebp),%eax
  freerange(vstart, vend);
}

void
kinit2(void *vstart, void *vend)
{
80102458:	8b 75 0c             	mov    0xc(%ebp),%esi

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
8010245b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102461:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102467:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010246d:	39 de                	cmp    %ebx,%esi
8010246f:	72 23                	jb     80102494 <kinit2+0x44>
80102471:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    kfree(p);
80102478:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010247e:	83 ec 0c             	sub    $0xc,%esp
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102481:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
80102487:	50                   	push   %eax
80102488:	e8 73 fe ff ff       	call   80102300 <kfree>
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
8010248d:	83 c4 10             	add    $0x10,%esp
80102490:	39 de                	cmp    %ebx,%esi
80102492:	73 e4                	jae    80102478 <kinit2+0x28>

void
kinit2(void *vstart, void *vend)
{
  freerange(vstart, vend);
  kmem.use_lock = 1;
80102494:	c7 05 74 26 11 80 01 	movl   $0x1,0x80112674
8010249b:	00 00 00 
}
8010249e:	8d 65 f8             	lea    -0x8(%ebp),%esp
801024a1:	5b                   	pop    %ebx
801024a2:	5e                   	pop    %esi
801024a3:	5d                   	pop    %ebp
801024a4:	c3                   	ret    
801024a5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801024a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801024b0 <kalloc>:
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
char*
kalloc(void)
{
801024b0:	55                   	push   %ebp
801024b1:	89 e5                	mov    %esp,%ebp
801024b3:	53                   	push   %ebx
801024b4:	83 ec 04             	sub    $0x4,%esp
  struct run *r;

  if(kmem.use_lock)
801024b7:	a1 74 26 11 80       	mov    0x80112674,%eax
801024bc:	85 c0                	test   %eax,%eax
801024be:	75 30                	jne    801024f0 <kalloc+0x40>
    acquire(&kmem.lock);
  r = kmem.freelist;
801024c0:	8b 1d 78 26 11 80    	mov    0x80112678,%ebx
  if(r)
801024c6:	85 db                	test   %ebx,%ebx
801024c8:	74 1c                	je     801024e6 <kalloc+0x36>
    kmem.freelist = r->next;
801024ca:	8b 13                	mov    (%ebx),%edx
801024cc:	89 15 78 26 11 80    	mov    %edx,0x80112678
  if(kmem.use_lock)
801024d2:	85 c0                	test   %eax,%eax
801024d4:	74 10                	je     801024e6 <kalloc+0x36>
    release(&kmem.lock);
801024d6:	83 ec 0c             	sub    $0xc,%esp
801024d9:	68 40 26 11 80       	push   $0x80112640
801024de:	e8 fd 1e 00 00       	call   801043e0 <release>
801024e3:	83 c4 10             	add    $0x10,%esp
  return (char*)r;
}
801024e6:	89 d8                	mov    %ebx,%eax
801024e8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801024eb:	c9                   	leave  
801024ec:	c3                   	ret    
801024ed:	8d 76 00             	lea    0x0(%esi),%esi
kalloc(void)
{
  struct run *r;

  if(kmem.use_lock)
    acquire(&kmem.lock);
801024f0:	83 ec 0c             	sub    $0xc,%esp
801024f3:	68 40 26 11 80       	push   $0x80112640
801024f8:	e8 c3 1d 00 00       	call   801042c0 <acquire>
  r = kmem.freelist;
801024fd:	8b 1d 78 26 11 80    	mov    0x80112678,%ebx
  if(r)
80102503:	83 c4 10             	add    $0x10,%esp
80102506:	a1 74 26 11 80       	mov    0x80112674,%eax
8010250b:	85 db                	test   %ebx,%ebx
8010250d:	75 bb                	jne    801024ca <kalloc+0x1a>
8010250f:	eb c1                	jmp    801024d2 <kalloc+0x22>
80102511:	66 90                	xchg   %ax,%ax
80102513:	66 90                	xchg   %ax,%ax
80102515:	66 90                	xchg   %ax,%ax
80102517:	66 90                	xchg   %ax,%ax
80102519:	66 90                	xchg   %ax,%ax
8010251b:	66 90                	xchg   %ax,%ax
8010251d:	66 90                	xchg   %ax,%ax
8010251f:	90                   	nop

80102520 <kbdgetc>:
#include "defs.h"
#include "kbd.h"

int
kbdgetc(void)
{
80102520:	55                   	push   %ebp
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102521:	ba 64 00 00 00       	mov    $0x64,%edx
80102526:	89 e5                	mov    %esp,%ebp
80102528:	ec                   	in     (%dx),%al
    normalmap, shiftmap, ctlmap, ctlmap
  };
  uint st, data, c;

  st = inb(KBSTATP);
  if((st & KBS_DIB) == 0)
80102529:	a8 01                	test   $0x1,%al
8010252b:	0f 84 af 00 00 00    	je     801025e0 <kbdgetc+0xc0>
80102531:	ba 60 00 00 00       	mov    $0x60,%edx
80102536:	ec                   	in     (%dx),%al
    return -1;
  data = inb(KBDATAP);
80102537:	0f b6 d0             	movzbl %al,%edx

  if(data == 0xE0){
8010253a:	81 fa e0 00 00 00    	cmp    $0xe0,%edx
80102540:	74 7e                	je     801025c0 <kbdgetc+0xa0>
    shift |= E0ESC;
    return 0;
  } else if(data & 0x80){
80102542:	84 c0                	test   %al,%al
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
80102544:	8b 0d b4 a5 10 80    	mov    0x8010a5b4,%ecx
  data = inb(KBDATAP);

  if(data == 0xE0){
    shift |= E0ESC;
    return 0;
  } else if(data & 0x80){
8010254a:	79 24                	jns    80102570 <kbdgetc+0x50>
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
8010254c:	f6 c1 40             	test   $0x40,%cl
8010254f:	75 05                	jne    80102556 <kbdgetc+0x36>
80102551:	89 c2                	mov    %eax,%edx
80102553:	83 e2 7f             	and    $0x7f,%edx
    shift &= ~(shiftcode[data] | E0ESC);
80102556:	0f b6 82 80 74 10 80 	movzbl -0x7fef8b80(%edx),%eax
8010255d:	83 c8 40             	or     $0x40,%eax
80102560:	0f b6 c0             	movzbl %al,%eax
80102563:	f7 d0                	not    %eax
80102565:	21 c8                	and    %ecx,%eax
80102567:	a3 b4 a5 10 80       	mov    %eax,0x8010a5b4
    return 0;
8010256c:	31 c0                	xor    %eax,%eax
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
8010256e:	5d                   	pop    %ebp
8010256f:	c3                   	ret    
  } else if(data & 0x80){
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
  } else if(shift & E0ESC){
80102570:	f6 c1 40             	test   $0x40,%cl
80102573:	74 09                	je     8010257e <kbdgetc+0x5e>
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
80102575:	83 c8 80             	or     $0xffffff80,%eax
    shift &= ~E0ESC;
80102578:	83 e1 bf             	and    $0xffffffbf,%ecx
    data = (shift & E0ESC ? data : data & 0x7F);
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
  } else if(shift & E0ESC){
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
8010257b:	0f b6 d0             	movzbl %al,%edx
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
  shift ^= togglecode[data];
8010257e:	0f b6 82 80 74 10 80 	movzbl -0x7fef8b80(%edx),%eax
80102585:	09 c1                	or     %eax,%ecx
80102587:	0f b6 82 80 73 10 80 	movzbl -0x7fef8c80(%edx),%eax
8010258e:	31 c1                	xor    %eax,%ecx
  c = charcode[shift & (CTL | SHIFT)][data];
80102590:	89 c8                	mov    %ecx,%eax
    data |= 0x80;
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
  shift ^= togglecode[data];
80102592:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
  c = charcode[shift & (CTL | SHIFT)][data];
80102598:	83 e0 03             	and    $0x3,%eax
  if(shift & CAPSLOCK){
8010259b:	83 e1 08             	and    $0x8,%ecx
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
  shift ^= togglecode[data];
  c = charcode[shift & (CTL | SHIFT)][data];
8010259e:	8b 04 85 60 73 10 80 	mov    -0x7fef8ca0(,%eax,4),%eax
801025a5:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
  if(shift & CAPSLOCK){
801025a9:	74 c3                	je     8010256e <kbdgetc+0x4e>
    if('a' <= c && c <= 'z')
801025ab:	8d 50 9f             	lea    -0x61(%eax),%edx
801025ae:	83 fa 19             	cmp    $0x19,%edx
801025b1:	77 1d                	ja     801025d0 <kbdgetc+0xb0>
      c += 'A' - 'a';
801025b3:	83 e8 20             	sub    $0x20,%eax
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
801025b6:	5d                   	pop    %ebp
801025b7:	c3                   	ret    
801025b8:	90                   	nop
801025b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
  data = inb(KBDATAP);

  if(data == 0xE0){
    shift |= E0ESC;
    return 0;
801025c0:	31 c0                	xor    %eax,%eax
  if((st & KBS_DIB) == 0)
    return -1;
  data = inb(KBDATAP);

  if(data == 0xE0){
    shift |= E0ESC;
801025c2:	83 0d b4 a5 10 80 40 	orl    $0x40,0x8010a5b4
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
801025c9:	5d                   	pop    %ebp
801025ca:	c3                   	ret    
801025cb:	90                   	nop
801025cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  shift ^= togglecode[data];
  c = charcode[shift & (CTL | SHIFT)][data];
  if(shift & CAPSLOCK){
    if('a' <= c && c <= 'z')
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
801025d0:	8d 48 bf             	lea    -0x41(%eax),%ecx
      c += 'a' - 'A';
801025d3:	8d 50 20             	lea    0x20(%eax),%edx
  }
  return c;
}
801025d6:	5d                   	pop    %ebp
  c = charcode[shift & (CTL | SHIFT)][data];
  if(shift & CAPSLOCK){
    if('a' <= c && c <= 'z')
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
801025d7:	83 f9 19             	cmp    $0x19,%ecx
801025da:	0f 46 c2             	cmovbe %edx,%eax
  }
  return c;
}
801025dd:	c3                   	ret    
801025de:	66 90                	xchg   %ax,%ax
  };
  uint st, data, c;

  st = inb(KBSTATP);
  if((st & KBS_DIB) == 0)
    return -1;
801025e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
801025e5:	5d                   	pop    %ebp
801025e6:	c3                   	ret    
801025e7:	89 f6                	mov    %esi,%esi
801025e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801025f0 <kbdintr>:

void
kbdintr(void)
{
801025f0:	55                   	push   %ebp
801025f1:	89 e5                	mov    %esp,%ebp
801025f3:	83 ec 14             	sub    $0x14,%esp
  consoleintr(kbdgetc);
801025f6:	68 20 25 10 80       	push   $0x80102520
801025fb:	e8 f0 e1 ff ff       	call   801007f0 <consoleintr>
}
80102600:	83 c4 10             	add    $0x10,%esp
80102603:	c9                   	leave  
80102604:	c3                   	ret    
80102605:	66 90                	xchg   %ax,%ax
80102607:	66 90                	xchg   %ax,%ax
80102609:	66 90                	xchg   %ax,%ax
8010260b:	66 90                	xchg   %ax,%ax
8010260d:	66 90                	xchg   %ax,%ax
8010260f:	90                   	nop

80102610 <lapicinit>:
}

void
lapicinit(void)
{
  if(!lapic)
80102610:	a1 7c 26 11 80       	mov    0x8011267c,%eax
  lapic[ID];  // wait for write to finish, by reading
}

void
lapicinit(void)
{
80102615:	55                   	push   %ebp
80102616:	89 e5                	mov    %esp,%ebp
  if(!lapic)
80102618:	85 c0                	test   %eax,%eax
8010261a:	0f 84 c8 00 00 00    	je     801026e8 <lapicinit+0xd8>

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102620:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
80102627:	01 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010262a:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010262d:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102634:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102637:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010263a:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
80102641:	00 02 00 
  lapic[ID];  // wait for write to finish, by reading
80102644:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102647:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
8010264e:	96 98 00 
  lapic[ID];  // wait for write to finish, by reading
80102651:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102654:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
8010265b:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
8010265e:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102661:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
80102668:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
8010266b:	8b 50 20             	mov    0x20(%eax),%edx
  lapicw(LINT0, MASKED);
  lapicw(LINT1, MASKED);

  // Disable performance counter overflow interrupts
  // on machines that provide that interrupt entry.
  if(((lapic[VER]>>16) & 0xFF) >= 4)
8010266e:	8b 50 30             	mov    0x30(%eax),%edx
80102671:	c1 ea 10             	shr    $0x10,%edx
80102674:	80 fa 03             	cmp    $0x3,%dl
80102677:	77 77                	ja     801026f0 <lapicinit+0xe0>

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102679:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
80102680:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102683:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102686:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010268d:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102690:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102693:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010269a:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010269d:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026a0:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
801026a7:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026aa:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026ad:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
801026b4:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026b7:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026ba:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
801026c1:	85 08 00 
  lapic[ID];  // wait for write to finish, by reading
801026c4:	8b 50 20             	mov    0x20(%eax),%edx
801026c7:	89 f6                	mov    %esi,%esi
801026c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  lapicw(EOI, 0);

  // Send an Init Level De-Assert to synchronise arbitration ID's.
  lapicw(ICRHI, 0);
  lapicw(ICRLO, BCAST | INIT | LEVEL);
  while(lapic[ICRLO] & DELIVS)
801026d0:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
801026d6:	80 e6 10             	and    $0x10,%dh
801026d9:	75 f5                	jne    801026d0 <lapicinit+0xc0>

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026db:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
801026e2:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026e5:	8b 40 20             	mov    0x20(%eax),%eax
  while(lapic[ICRLO] & DELIVS)
    ;

  // Enable interrupts on the APIC (but not on the processor).
  lapicw(TPR, 0);
}
801026e8:	5d                   	pop    %ebp
801026e9:	c3                   	ret    
801026ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026f0:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
801026f7:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
801026fa:	8b 50 20             	mov    0x20(%eax),%edx
801026fd:	e9 77 ff ff ff       	jmp    80102679 <lapicinit+0x69>
80102702:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102709:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102710 <lapicid>:
}

int
lapicid(void)
{
  if (!lapic)
80102710:	a1 7c 26 11 80       	mov    0x8011267c,%eax
  lapicw(TPR, 0);
}

int
lapicid(void)
{
80102715:	55                   	push   %ebp
80102716:	89 e5                	mov    %esp,%ebp
  if (!lapic)
80102718:	85 c0                	test   %eax,%eax
8010271a:	74 0c                	je     80102728 <lapicid+0x18>
    return 0;
  return lapic[ID] >> 24;
8010271c:	8b 40 20             	mov    0x20(%eax),%eax
}
8010271f:	5d                   	pop    %ebp
int
lapicid(void)
{
  if (!lapic)
    return 0;
  return lapic[ID] >> 24;
80102720:	c1 e8 18             	shr    $0x18,%eax
}
80102723:	c3                   	ret    
80102724:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

int
lapicid(void)
{
  if (!lapic)
    return 0;
80102728:	31 c0                	xor    %eax,%eax
  return lapic[ID] >> 24;
}
8010272a:	5d                   	pop    %ebp
8010272b:	c3                   	ret    
8010272c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102730 <lapiceoi>:

// Acknowledge interrupt.
void
lapiceoi(void)
{
  if(lapic)
80102730:	a1 7c 26 11 80       	mov    0x8011267c,%eax
}

// Acknowledge interrupt.
void
lapiceoi(void)
{
80102735:	55                   	push   %ebp
80102736:	89 e5                	mov    %esp,%ebp
  if(lapic)
80102738:	85 c0                	test   %eax,%eax
8010273a:	74 0d                	je     80102749 <lapiceoi+0x19>

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010273c:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102743:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102746:	8b 40 20             	mov    0x20(%eax),%eax
void
lapiceoi(void)
{
  if(lapic)
    lapicw(EOI, 0);
}
80102749:	5d                   	pop    %ebp
8010274a:	c3                   	ret    
8010274b:	90                   	nop
8010274c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102750 <microdelay>:

// Spin for a given number of microseconds.
// On real hardware would want to tune this dynamically.
void
microdelay(int us)
{
80102750:	55                   	push   %ebp
80102751:	89 e5                	mov    %esp,%ebp
}
80102753:	5d                   	pop    %ebp
80102754:	c3                   	ret    
80102755:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102759:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102760 <lapicstartap>:

// Start additional processor running entry code at addr.
// See Appendix B of MultiProcessor Specification.
void
lapicstartap(uchar apicid, uint addr)
{
80102760:	55                   	push   %ebp
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102761:	ba 70 00 00 00       	mov    $0x70,%edx
80102766:	b8 0f 00 00 00       	mov    $0xf,%eax
8010276b:	89 e5                	mov    %esp,%ebp
8010276d:	53                   	push   %ebx
8010276e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80102771:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102774:	ee                   	out    %al,(%dx)
80102775:	ba 71 00 00 00       	mov    $0x71,%edx
8010277a:	b8 0a 00 00 00       	mov    $0xa,%eax
8010277f:	ee                   	out    %al,(%dx)
  // and the warm reset vector (DWORD based at 40:67) to point at
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
80102780:	31 c0                	xor    %eax,%eax

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102782:	c1 e3 18             	shl    $0x18,%ebx
  // and the warm reset vector (DWORD based at 40:67) to point at
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
80102785:	66 a3 67 04 00 80    	mov    %ax,0x80000467
  wrv[1] = addr >> 4;
8010278b:	89 c8                	mov    %ecx,%eax
  // when it is in the halted state due to an INIT.  So the second
  // should be ignored, but it is part of the official Intel algorithm.
  // Bochs complains about the second one.  Too bad for Bochs.
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
8010278d:	c1 e9 0c             	shr    $0xc,%ecx
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
  wrv[1] = addr >> 4;
80102790:	c1 e8 04             	shr    $0x4,%eax

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102793:	89 da                	mov    %ebx,%edx
  // when it is in the halted state due to an INIT.  So the second
  // should be ignored, but it is part of the official Intel algorithm.
  // Bochs complains about the second one.  Too bad for Bochs.
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
80102795:	80 cd 06             	or     $0x6,%ch
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
  wrv[1] = addr >> 4;
80102798:	66 a3 69 04 00 80    	mov    %ax,0x80000469

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010279e:	a1 7c 26 11 80       	mov    0x8011267c,%eax
801027a3:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
801027a9:	8b 58 20             	mov    0x20(%eax),%ebx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027ac:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
801027b3:	c5 00 00 
  lapic[ID];  // wait for write to finish, by reading
801027b6:	8b 58 20             	mov    0x20(%eax),%ebx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027b9:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
801027c0:	85 00 00 
  lapic[ID];  // wait for write to finish, by reading
801027c3:	8b 58 20             	mov    0x20(%eax),%ebx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027c6:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
801027cc:	8b 58 20             	mov    0x20(%eax),%ebx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027cf:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
801027d5:	8b 58 20             	mov    0x20(%eax),%ebx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027d8:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
801027de:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027e1:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
801027e7:	8b 40 20             	mov    0x20(%eax),%eax
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
    microdelay(200);
  }
}
801027ea:	5b                   	pop    %ebx
801027eb:	5d                   	pop    %ebp
801027ec:	c3                   	ret    
801027ed:	8d 76 00             	lea    0x0(%esi),%esi

801027f0 <cmostime>:
  r->year   = cmos_read(YEAR);
}

// qemu seems to use 24-hour GWT and the values are BCD encoded
void cmostime(struct rtcdate *r)
{
801027f0:	55                   	push   %ebp
801027f1:	ba 70 00 00 00       	mov    $0x70,%edx
801027f6:	b8 0b 00 00 00       	mov    $0xb,%eax
801027fb:	89 e5                	mov    %esp,%ebp
801027fd:	57                   	push   %edi
801027fe:	56                   	push   %esi
801027ff:	53                   	push   %ebx
80102800:	83 ec 4c             	sub    $0x4c,%esp
80102803:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102804:	ba 71 00 00 00       	mov    $0x71,%edx
80102809:	ec                   	in     (%dx),%al
8010280a:	83 e0 04             	and    $0x4,%eax
8010280d:	8d 75 d0             	lea    -0x30(%ebp),%esi
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102810:	31 db                	xor    %ebx,%ebx
80102812:	88 45 b7             	mov    %al,-0x49(%ebp)
80102815:	bf 70 00 00 00       	mov    $0x70,%edi
8010281a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102820:	89 d8                	mov    %ebx,%eax
80102822:	89 fa                	mov    %edi,%edx
80102824:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102825:	b9 71 00 00 00       	mov    $0x71,%ecx
8010282a:	89 ca                	mov    %ecx,%edx
8010282c:	ec                   	in     (%dx),%al
  return inb(CMOS_RETURN);
}

static void fill_rtcdate(struct rtcdate *r)
{
  r->second = cmos_read(SECS);
8010282d:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102830:	89 fa                	mov    %edi,%edx
80102832:	89 45 b8             	mov    %eax,-0x48(%ebp)
80102835:	b8 02 00 00 00       	mov    $0x2,%eax
8010283a:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010283b:	89 ca                	mov    %ecx,%edx
8010283d:	ec                   	in     (%dx),%al
  r->minute = cmos_read(MINS);
8010283e:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102841:	89 fa                	mov    %edi,%edx
80102843:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102846:	b8 04 00 00 00       	mov    $0x4,%eax
8010284b:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010284c:	89 ca                	mov    %ecx,%edx
8010284e:	ec                   	in     (%dx),%al
  r->hour   = cmos_read(HOURS);
8010284f:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102852:	89 fa                	mov    %edi,%edx
80102854:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102857:	b8 07 00 00 00       	mov    $0x7,%eax
8010285c:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010285d:	89 ca                	mov    %ecx,%edx
8010285f:	ec                   	in     (%dx),%al
  r->day    = cmos_read(DAY);
80102860:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102863:	89 fa                	mov    %edi,%edx
80102865:	89 45 c4             	mov    %eax,-0x3c(%ebp)
80102868:	b8 08 00 00 00       	mov    $0x8,%eax
8010286d:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010286e:	89 ca                	mov    %ecx,%edx
80102870:	ec                   	in     (%dx),%al
  r->month  = cmos_read(MONTH);
80102871:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102874:	89 fa                	mov    %edi,%edx
80102876:	89 45 c8             	mov    %eax,-0x38(%ebp)
80102879:	b8 09 00 00 00       	mov    $0x9,%eax
8010287e:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010287f:	89 ca                	mov    %ecx,%edx
80102881:	ec                   	in     (%dx),%al
  r->year   = cmos_read(YEAR);
80102882:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102885:	89 fa                	mov    %edi,%edx
80102887:	89 45 cc             	mov    %eax,-0x34(%ebp)
8010288a:	b8 0a 00 00 00       	mov    $0xa,%eax
8010288f:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102890:	89 ca                	mov    %ecx,%edx
80102892:	ec                   	in     (%dx),%al
  bcd = (sb & (1 << 2)) == 0;

  // make sure CMOS doesn't modify time while we read it
  for(;;) {
    fill_rtcdate(&t1);
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
80102893:	84 c0                	test   %al,%al
80102895:	78 89                	js     80102820 <cmostime+0x30>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102897:	89 d8                	mov    %ebx,%eax
80102899:	89 fa                	mov    %edi,%edx
8010289b:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010289c:	89 ca                	mov    %ecx,%edx
8010289e:	ec                   	in     (%dx),%al
  return inb(CMOS_RETURN);
}

static void fill_rtcdate(struct rtcdate *r)
{
  r->second = cmos_read(SECS);
8010289f:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028a2:	89 fa                	mov    %edi,%edx
801028a4:	89 45 d0             	mov    %eax,-0x30(%ebp)
801028a7:	b8 02 00 00 00       	mov    $0x2,%eax
801028ac:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028ad:	89 ca                	mov    %ecx,%edx
801028af:	ec                   	in     (%dx),%al
  r->minute = cmos_read(MINS);
801028b0:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028b3:	89 fa                	mov    %edi,%edx
801028b5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
801028b8:	b8 04 00 00 00       	mov    $0x4,%eax
801028bd:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028be:	89 ca                	mov    %ecx,%edx
801028c0:	ec                   	in     (%dx),%al
  r->hour   = cmos_read(HOURS);
801028c1:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028c4:	89 fa                	mov    %edi,%edx
801028c6:	89 45 d8             	mov    %eax,-0x28(%ebp)
801028c9:	b8 07 00 00 00       	mov    $0x7,%eax
801028ce:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028cf:	89 ca                	mov    %ecx,%edx
801028d1:	ec                   	in     (%dx),%al
  r->day    = cmos_read(DAY);
801028d2:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028d5:	89 fa                	mov    %edi,%edx
801028d7:	89 45 dc             	mov    %eax,-0x24(%ebp)
801028da:	b8 08 00 00 00       	mov    $0x8,%eax
801028df:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028e0:	89 ca                	mov    %ecx,%edx
801028e2:	ec                   	in     (%dx),%al
  r->month  = cmos_read(MONTH);
801028e3:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028e6:	89 fa                	mov    %edi,%edx
801028e8:	89 45 e0             	mov    %eax,-0x20(%ebp)
801028eb:	b8 09 00 00 00       	mov    $0x9,%eax
801028f0:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028f1:	89 ca                	mov    %ecx,%edx
801028f3:	ec                   	in     (%dx),%al
  r->year   = cmos_read(YEAR);
801028f4:	0f b6 c0             	movzbl %al,%eax
  for(;;) {
    fill_rtcdate(&t1);
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
        continue;
    fill_rtcdate(&t2);
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
801028f7:	83 ec 04             	sub    $0x4,%esp
  r->second = cmos_read(SECS);
  r->minute = cmos_read(MINS);
  r->hour   = cmos_read(HOURS);
  r->day    = cmos_read(DAY);
  r->month  = cmos_read(MONTH);
  r->year   = cmos_read(YEAR);
801028fa:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(;;) {
    fill_rtcdate(&t1);
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
        continue;
    fill_rtcdate(&t2);
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
801028fd:	8d 45 b8             	lea    -0x48(%ebp),%eax
80102900:	6a 18                	push   $0x18
80102902:	56                   	push   %esi
80102903:	50                   	push   %eax
80102904:	e8 77 1b 00 00       	call   80104480 <memcmp>
80102909:	83 c4 10             	add    $0x10,%esp
8010290c:	85 c0                	test   %eax,%eax
8010290e:	0f 85 0c ff ff ff    	jne    80102820 <cmostime+0x30>
      break;
  }

  // convert
  if(bcd) {
80102914:	80 7d b7 00          	cmpb   $0x0,-0x49(%ebp)
80102918:	75 78                	jne    80102992 <cmostime+0x1a2>
#define    CONV(x)     (t1.x = ((t1.x >> 4) * 10) + (t1.x & 0xf))
    CONV(second);
8010291a:	8b 45 b8             	mov    -0x48(%ebp),%eax
8010291d:	89 c2                	mov    %eax,%edx
8010291f:	83 e0 0f             	and    $0xf,%eax
80102922:	c1 ea 04             	shr    $0x4,%edx
80102925:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102928:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010292b:	89 45 b8             	mov    %eax,-0x48(%ebp)
    CONV(minute);
8010292e:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102931:	89 c2                	mov    %eax,%edx
80102933:	83 e0 0f             	and    $0xf,%eax
80102936:	c1 ea 04             	shr    $0x4,%edx
80102939:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010293c:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010293f:	89 45 bc             	mov    %eax,-0x44(%ebp)
    CONV(hour  );
80102942:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102945:	89 c2                	mov    %eax,%edx
80102947:	83 e0 0f             	and    $0xf,%eax
8010294a:	c1 ea 04             	shr    $0x4,%edx
8010294d:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102950:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102953:	89 45 c0             	mov    %eax,-0x40(%ebp)
    CONV(day   );
80102956:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102959:	89 c2                	mov    %eax,%edx
8010295b:	83 e0 0f             	and    $0xf,%eax
8010295e:	c1 ea 04             	shr    $0x4,%edx
80102961:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102964:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102967:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    CONV(month );
8010296a:	8b 45 c8             	mov    -0x38(%ebp),%eax
8010296d:	89 c2                	mov    %eax,%edx
8010296f:	83 e0 0f             	and    $0xf,%eax
80102972:	c1 ea 04             	shr    $0x4,%edx
80102975:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102978:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010297b:	89 45 c8             	mov    %eax,-0x38(%ebp)
    CONV(year  );
8010297e:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102981:	89 c2                	mov    %eax,%edx
80102983:	83 e0 0f             	and    $0xf,%eax
80102986:	c1 ea 04             	shr    $0x4,%edx
80102989:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010298c:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010298f:	89 45 cc             	mov    %eax,-0x34(%ebp)
#undef     CONV
  }

  *r = t1;
80102992:	8b 75 08             	mov    0x8(%ebp),%esi
80102995:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102998:	89 06                	mov    %eax,(%esi)
8010299a:	8b 45 bc             	mov    -0x44(%ebp),%eax
8010299d:	89 46 04             	mov    %eax,0x4(%esi)
801029a0:	8b 45 c0             	mov    -0x40(%ebp),%eax
801029a3:	89 46 08             	mov    %eax,0x8(%esi)
801029a6:	8b 45 c4             	mov    -0x3c(%ebp),%eax
801029a9:	89 46 0c             	mov    %eax,0xc(%esi)
801029ac:	8b 45 c8             	mov    -0x38(%ebp),%eax
801029af:	89 46 10             	mov    %eax,0x10(%esi)
801029b2:	8b 45 cc             	mov    -0x34(%ebp),%eax
801029b5:	89 46 14             	mov    %eax,0x14(%esi)
  r->year += 2000;
801029b8:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
}
801029bf:	8d 65 f4             	lea    -0xc(%ebp),%esp
801029c2:	5b                   	pop    %ebx
801029c3:	5e                   	pop    %esi
801029c4:	5f                   	pop    %edi
801029c5:	5d                   	pop    %ebp
801029c6:	c3                   	ret    
801029c7:	66 90                	xchg   %ax,%ax
801029c9:	66 90                	xchg   %ax,%ax
801029cb:	66 90                	xchg   %ax,%ax
801029cd:	66 90                	xchg   %ax,%ax
801029cf:	90                   	nop

801029d0 <install_trans>:
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
801029d0:	8b 0d c8 26 11 80    	mov    0x801126c8,%ecx
801029d6:	85 c9                	test   %ecx,%ecx
801029d8:	0f 8e 85 00 00 00    	jle    80102a63 <install_trans+0x93>
}

// Copy committed blocks from log to their home location
static void
install_trans(void)
{
801029de:	55                   	push   %ebp
801029df:	89 e5                	mov    %esp,%ebp
801029e1:	57                   	push   %edi
801029e2:	56                   	push   %esi
801029e3:	53                   	push   %ebx
801029e4:	31 db                	xor    %ebx,%ebx
801029e6:	83 ec 0c             	sub    $0xc,%esp
801029e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
801029f0:	a1 b4 26 11 80       	mov    0x801126b4,%eax
801029f5:	83 ec 08             	sub    $0x8,%esp
801029f8:	01 d8                	add    %ebx,%eax
801029fa:	83 c0 01             	add    $0x1,%eax
801029fd:	50                   	push   %eax
801029fe:	ff 35 c4 26 11 80    	pushl  0x801126c4
80102a04:	e8 c7 d6 ff ff       	call   801000d0 <bread>
80102a09:	89 c7                	mov    %eax,%edi
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102a0b:	58                   	pop    %eax
80102a0c:	5a                   	pop    %edx
80102a0d:	ff 34 9d cc 26 11 80 	pushl  -0x7feed934(,%ebx,4)
80102a14:	ff 35 c4 26 11 80    	pushl  0x801126c4
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102a1a:	83 c3 01             	add    $0x1,%ebx
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102a1d:	e8 ae d6 ff ff       	call   801000d0 <bread>
80102a22:	89 c6                	mov    %eax,%esi
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
80102a24:	8d 47 5c             	lea    0x5c(%edi),%eax
80102a27:	83 c4 0c             	add    $0xc,%esp
80102a2a:	68 00 02 00 00       	push   $0x200
80102a2f:	50                   	push   %eax
80102a30:	8d 46 5c             	lea    0x5c(%esi),%eax
80102a33:	50                   	push   %eax
80102a34:	e8 a7 1a 00 00       	call   801044e0 <memmove>
    bwrite(dbuf);  // write dst to disk
80102a39:	89 34 24             	mov    %esi,(%esp)
80102a3c:	e8 5f d7 ff ff       	call   801001a0 <bwrite>
    brelse(lbuf);
80102a41:	89 3c 24             	mov    %edi,(%esp)
80102a44:	e8 97 d7 ff ff       	call   801001e0 <brelse>
    brelse(dbuf);
80102a49:	89 34 24             	mov    %esi,(%esp)
80102a4c:	e8 8f d7 ff ff       	call   801001e0 <brelse>
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102a51:	83 c4 10             	add    $0x10,%esp
80102a54:	39 1d c8 26 11 80    	cmp    %ebx,0x801126c8
80102a5a:	7f 94                	jg     801029f0 <install_trans+0x20>
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
    bwrite(dbuf);  // write dst to disk
    brelse(lbuf);
    brelse(dbuf);
  }
}
80102a5c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102a5f:	5b                   	pop    %ebx
80102a60:	5e                   	pop    %esi
80102a61:	5f                   	pop    %edi
80102a62:	5d                   	pop    %ebp
80102a63:	f3 c3                	repz ret 
80102a65:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102a69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102a70 <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
80102a70:	55                   	push   %ebp
80102a71:	89 e5                	mov    %esp,%ebp
80102a73:	53                   	push   %ebx
80102a74:	83 ec 0c             	sub    $0xc,%esp
  struct buf *buf = bread(log.dev, log.start);
80102a77:	ff 35 b4 26 11 80    	pushl  0x801126b4
80102a7d:	ff 35 c4 26 11 80    	pushl  0x801126c4
80102a83:	e8 48 d6 ff ff       	call   801000d0 <bread>
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
80102a88:	8b 0d c8 26 11 80    	mov    0x801126c8,%ecx
  for (i = 0; i < log.lh.n; i++) {
80102a8e:	83 c4 10             	add    $0x10,%esp
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
80102a91:	89 c3                	mov    %eax,%ebx
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
  for (i = 0; i < log.lh.n; i++) {
80102a93:	85 c9                	test   %ecx,%ecx
write_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
80102a95:	89 48 5c             	mov    %ecx,0x5c(%eax)
  for (i = 0; i < log.lh.n; i++) {
80102a98:	7e 1f                	jle    80102ab9 <write_head+0x49>
80102a9a:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
80102aa1:	31 d2                	xor    %edx,%edx
80102aa3:	90                   	nop
80102aa4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    hb->block[i] = log.lh.block[i];
80102aa8:	8b 8a cc 26 11 80    	mov    -0x7feed934(%edx),%ecx
80102aae:	89 4c 13 60          	mov    %ecx,0x60(%ebx,%edx,1)
80102ab2:	83 c2 04             	add    $0x4,%edx
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
  for (i = 0; i < log.lh.n; i++) {
80102ab5:	39 c2                	cmp    %eax,%edx
80102ab7:	75 ef                	jne    80102aa8 <write_head+0x38>
    hb->block[i] = log.lh.block[i];
  }
  bwrite(buf);
80102ab9:	83 ec 0c             	sub    $0xc,%esp
80102abc:	53                   	push   %ebx
80102abd:	e8 de d6 ff ff       	call   801001a0 <bwrite>
  brelse(buf);
80102ac2:	89 1c 24             	mov    %ebx,(%esp)
80102ac5:	e8 16 d7 ff ff       	call   801001e0 <brelse>
}
80102aca:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102acd:	c9                   	leave  
80102ace:	c3                   	ret    
80102acf:	90                   	nop

80102ad0 <initlog>:
static void recover_from_log(void);
static void commit();

void
initlog(int dev)
{
80102ad0:	55                   	push   %ebp
80102ad1:	89 e5                	mov    %esp,%ebp
80102ad3:	53                   	push   %ebx
80102ad4:	83 ec 2c             	sub    $0x2c,%esp
80102ad7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if (sizeof(struct logheader) >= BSIZE)
    panic("initlog: too big logheader");

  struct superblock sb;
  initlock(&log.lock, "log");
80102ada:	68 80 75 10 80       	push   $0x80107580
80102adf:	68 80 26 11 80       	push   $0x80112680
80102ae4:	e8 d7 16 00 00       	call   801041c0 <initlock>
  readsb(dev, &sb);
80102ae9:	58                   	pop    %eax
80102aea:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102aed:	5a                   	pop    %edx
80102aee:	50                   	push   %eax
80102aef:	53                   	push   %ebx
80102af0:	e8 db e8 ff ff       	call   801013d0 <readsb>
  log.start = sb.logstart;
  log.size = sb.nlog;
80102af5:	8b 55 e8             	mov    -0x18(%ebp),%edx
    panic("initlog: too big logheader");

  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
80102af8:	8b 45 ec             	mov    -0x14(%ebp),%eax

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
80102afb:	59                   	pop    %ecx
  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
  log.size = sb.nlog;
  log.dev = dev;
80102afc:	89 1d c4 26 11 80    	mov    %ebx,0x801126c4

  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
  log.size = sb.nlog;
80102b02:	89 15 b8 26 11 80    	mov    %edx,0x801126b8
    panic("initlog: too big logheader");

  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
80102b08:	a3 b4 26 11 80       	mov    %eax,0x801126b4

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
80102b0d:	5a                   	pop    %edx
80102b0e:	50                   	push   %eax
80102b0f:	53                   	push   %ebx
80102b10:	e8 bb d5 ff ff       	call   801000d0 <bread>
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
80102b15:	8b 48 5c             	mov    0x5c(%eax),%ecx
  for (i = 0; i < log.lh.n; i++) {
80102b18:	83 c4 10             	add    $0x10,%esp
80102b1b:	85 c9                	test   %ecx,%ecx
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
80102b1d:	89 0d c8 26 11 80    	mov    %ecx,0x801126c8
  for (i = 0; i < log.lh.n; i++) {
80102b23:	7e 1c                	jle    80102b41 <initlog+0x71>
80102b25:	8d 1c 8d 00 00 00 00 	lea    0x0(,%ecx,4),%ebx
80102b2c:	31 d2                	xor    %edx,%edx
80102b2e:	66 90                	xchg   %ax,%ax
    log.lh.block[i] = lh->block[i];
80102b30:	8b 4c 10 60          	mov    0x60(%eax,%edx,1),%ecx
80102b34:	83 c2 04             	add    $0x4,%edx
80102b37:	89 8a c8 26 11 80    	mov    %ecx,-0x7feed938(%edx)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
  for (i = 0; i < log.lh.n; i++) {
80102b3d:	39 da                	cmp    %ebx,%edx
80102b3f:	75 ef                	jne    80102b30 <initlog+0x60>
    log.lh.block[i] = lh->block[i];
  }
  brelse(buf);
80102b41:	83 ec 0c             	sub    $0xc,%esp
80102b44:	50                   	push   %eax
80102b45:	e8 96 d6 ff ff       	call   801001e0 <brelse>

static void
recover_from_log(void)
{
  read_head();
  install_trans(); // if committed, copy from log to disk
80102b4a:	e8 81 fe ff ff       	call   801029d0 <install_trans>
  log.lh.n = 0;
80102b4f:	c7 05 c8 26 11 80 00 	movl   $0x0,0x801126c8
80102b56:	00 00 00 
  write_head(); // clear the log
80102b59:	e8 12 ff ff ff       	call   80102a70 <write_head>
  readsb(dev, &sb);
  log.start = sb.logstart;
  log.size = sb.nlog;
  log.dev = dev;
  recover_from_log();
}
80102b5e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102b61:	c9                   	leave  
80102b62:	c3                   	ret    
80102b63:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102b69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102b70 <begin_op>:
}

// called at the start of each FS system call.
void
begin_op(void)
{
80102b70:	55                   	push   %ebp
80102b71:	89 e5                	mov    %esp,%ebp
80102b73:	83 ec 14             	sub    $0x14,%esp
  acquire(&log.lock);
80102b76:	68 80 26 11 80       	push   $0x80112680
80102b7b:	e8 40 17 00 00       	call   801042c0 <acquire>
80102b80:	83 c4 10             	add    $0x10,%esp
80102b83:	eb 18                	jmp    80102b9d <begin_op+0x2d>
80102b85:	8d 76 00             	lea    0x0(%esi),%esi
  while(1){
    if(log.committing){
      sleep(&log, &log.lock);
80102b88:	83 ec 08             	sub    $0x8,%esp
80102b8b:	68 80 26 11 80       	push   $0x80112680
80102b90:	68 80 26 11 80       	push   $0x80112680
80102b95:	e8 b6 11 00 00       	call   80103d50 <sleep>
80102b9a:	83 c4 10             	add    $0x10,%esp
void
begin_op(void)
{
  acquire(&log.lock);
  while(1){
    if(log.committing){
80102b9d:	a1 c0 26 11 80       	mov    0x801126c0,%eax
80102ba2:	85 c0                	test   %eax,%eax
80102ba4:	75 e2                	jne    80102b88 <begin_op+0x18>
      sleep(&log, &log.lock);
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
80102ba6:	a1 bc 26 11 80       	mov    0x801126bc,%eax
80102bab:	8b 15 c8 26 11 80    	mov    0x801126c8,%edx
80102bb1:	83 c0 01             	add    $0x1,%eax
80102bb4:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102bb7:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102bba:	83 fa 1e             	cmp    $0x1e,%edx
80102bbd:	7f c9                	jg     80102b88 <begin_op+0x18>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    } else {
      log.outstanding += 1;
      release(&log.lock);
80102bbf:	83 ec 0c             	sub    $0xc,%esp
      sleep(&log, &log.lock);
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    } else {
      log.outstanding += 1;
80102bc2:	a3 bc 26 11 80       	mov    %eax,0x801126bc
      release(&log.lock);
80102bc7:	68 80 26 11 80       	push   $0x80112680
80102bcc:	e8 0f 18 00 00       	call   801043e0 <release>
      break;
    }
  }
}
80102bd1:	83 c4 10             	add    $0x10,%esp
80102bd4:	c9                   	leave  
80102bd5:	c3                   	ret    
80102bd6:	8d 76 00             	lea    0x0(%esi),%esi
80102bd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102be0 <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
80102be0:	55                   	push   %ebp
80102be1:	89 e5                	mov    %esp,%ebp
80102be3:	57                   	push   %edi
80102be4:	56                   	push   %esi
80102be5:	53                   	push   %ebx
80102be6:	83 ec 18             	sub    $0x18,%esp
  int do_commit = 0;

  acquire(&log.lock);
80102be9:	68 80 26 11 80       	push   $0x80112680
80102bee:	e8 cd 16 00 00       	call   801042c0 <acquire>
  log.outstanding -= 1;
80102bf3:	a1 bc 26 11 80       	mov    0x801126bc,%eax
  if(log.committing)
80102bf8:	8b 1d c0 26 11 80    	mov    0x801126c0,%ebx
80102bfe:	83 c4 10             	add    $0x10,%esp
end_op(void)
{
  int do_commit = 0;

  acquire(&log.lock);
  log.outstanding -= 1;
80102c01:	83 e8 01             	sub    $0x1,%eax
  if(log.committing)
80102c04:	85 db                	test   %ebx,%ebx
end_op(void)
{
  int do_commit = 0;

  acquire(&log.lock);
  log.outstanding -= 1;
80102c06:	a3 bc 26 11 80       	mov    %eax,0x801126bc
  if(log.committing)
80102c0b:	0f 85 23 01 00 00    	jne    80102d34 <end_op+0x154>
    panic("log.committing");
  if(log.outstanding == 0){
80102c11:	85 c0                	test   %eax,%eax
80102c13:	0f 85 f7 00 00 00    	jne    80102d10 <end_op+0x130>
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
  }
  release(&log.lock);
80102c19:	83 ec 0c             	sub    $0xc,%esp
  log.outstanding -= 1;
  if(log.committing)
    panic("log.committing");
  if(log.outstanding == 0){
    do_commit = 1;
    log.committing = 1;
80102c1c:	c7 05 c0 26 11 80 01 	movl   $0x1,0x801126c0
80102c23:	00 00 00 
}

static void
commit()
{
  if (log.lh.n > 0) {
80102c26:	31 db                	xor    %ebx,%ebx
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
  }
  release(&log.lock);
80102c28:	68 80 26 11 80       	push   $0x80112680
80102c2d:	e8 ae 17 00 00       	call   801043e0 <release>
}

static void
commit()
{
  if (log.lh.n > 0) {
80102c32:	8b 0d c8 26 11 80    	mov    0x801126c8,%ecx
80102c38:	83 c4 10             	add    $0x10,%esp
80102c3b:	85 c9                	test   %ecx,%ecx
80102c3d:	0f 8e 8a 00 00 00    	jle    80102ccd <end_op+0xed>
80102c43:	90                   	nop
80102c44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
write_log(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
80102c48:	a1 b4 26 11 80       	mov    0x801126b4,%eax
80102c4d:	83 ec 08             	sub    $0x8,%esp
80102c50:	01 d8                	add    %ebx,%eax
80102c52:	83 c0 01             	add    $0x1,%eax
80102c55:	50                   	push   %eax
80102c56:	ff 35 c4 26 11 80    	pushl  0x801126c4
80102c5c:	e8 6f d4 ff ff       	call   801000d0 <bread>
80102c61:	89 c6                	mov    %eax,%esi
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102c63:	58                   	pop    %eax
80102c64:	5a                   	pop    %edx
80102c65:	ff 34 9d cc 26 11 80 	pushl  -0x7feed934(,%ebx,4)
80102c6c:	ff 35 c4 26 11 80    	pushl  0x801126c4
static void
write_log(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102c72:	83 c3 01             	add    $0x1,%ebx
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102c75:	e8 56 d4 ff ff       	call   801000d0 <bread>
80102c7a:	89 c7                	mov    %eax,%edi
    memmove(to->data, from->data, BSIZE);
80102c7c:	8d 40 5c             	lea    0x5c(%eax),%eax
80102c7f:	83 c4 0c             	add    $0xc,%esp
80102c82:	68 00 02 00 00       	push   $0x200
80102c87:	50                   	push   %eax
80102c88:	8d 46 5c             	lea    0x5c(%esi),%eax
80102c8b:	50                   	push   %eax
80102c8c:	e8 4f 18 00 00       	call   801044e0 <memmove>
    bwrite(to);  // write the log
80102c91:	89 34 24             	mov    %esi,(%esp)
80102c94:	e8 07 d5 ff ff       	call   801001a0 <bwrite>
    brelse(from);
80102c99:	89 3c 24             	mov    %edi,(%esp)
80102c9c:	e8 3f d5 ff ff       	call   801001e0 <brelse>
    brelse(to);
80102ca1:	89 34 24             	mov    %esi,(%esp)
80102ca4:	e8 37 d5 ff ff       	call   801001e0 <brelse>
static void
write_log(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102ca9:	83 c4 10             	add    $0x10,%esp
80102cac:	3b 1d c8 26 11 80    	cmp    0x801126c8,%ebx
80102cb2:	7c 94                	jl     80102c48 <end_op+0x68>
static void
commit()
{
  if (log.lh.n > 0) {
    write_log();     // Write modified blocks from cache to log
    write_head();    // Write header to disk -- the real commit
80102cb4:	e8 b7 fd ff ff       	call   80102a70 <write_head>
    install_trans(); // Now install writes to home locations
80102cb9:	e8 12 fd ff ff       	call   801029d0 <install_trans>
    log.lh.n = 0;
80102cbe:	c7 05 c8 26 11 80 00 	movl   $0x0,0x801126c8
80102cc5:	00 00 00 
    write_head();    // Erase the transaction from the log
80102cc8:	e8 a3 fd ff ff       	call   80102a70 <write_head>

  if(do_commit){
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    acquire(&log.lock);
80102ccd:	83 ec 0c             	sub    $0xc,%esp
80102cd0:	68 80 26 11 80       	push   $0x80112680
80102cd5:	e8 e6 15 00 00       	call   801042c0 <acquire>
    log.committing = 0;
    wakeup(&log);
80102cda:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
  if(do_commit){
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    acquire(&log.lock);
    log.committing = 0;
80102ce1:	c7 05 c0 26 11 80 00 	movl   $0x0,0x801126c0
80102ce8:	00 00 00 
    wakeup(&log);
80102ceb:	e8 10 12 00 00       	call   80103f00 <wakeup>
    release(&log.lock);
80102cf0:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102cf7:	e8 e4 16 00 00       	call   801043e0 <release>
80102cfc:	83 c4 10             	add    $0x10,%esp
  }
}
80102cff:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102d02:	5b                   	pop    %ebx
80102d03:	5e                   	pop    %esi
80102d04:	5f                   	pop    %edi
80102d05:	5d                   	pop    %ebp
80102d06:	c3                   	ret    
80102d07:	89 f6                	mov    %esi,%esi
80102d09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    log.committing = 1;
  } else {
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
80102d10:	83 ec 0c             	sub    $0xc,%esp
80102d13:	68 80 26 11 80       	push   $0x80112680
80102d18:	e8 e3 11 00 00       	call   80103f00 <wakeup>
  }
  release(&log.lock);
80102d1d:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102d24:	e8 b7 16 00 00       	call   801043e0 <release>
80102d29:	83 c4 10             	add    $0x10,%esp
    acquire(&log.lock);
    log.committing = 0;
    wakeup(&log);
    release(&log.lock);
  }
}
80102d2c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102d2f:	5b                   	pop    %ebx
80102d30:	5e                   	pop    %esi
80102d31:	5f                   	pop    %edi
80102d32:	5d                   	pop    %ebp
80102d33:	c3                   	ret    
  int do_commit = 0;

  acquire(&log.lock);
  log.outstanding -= 1;
  if(log.committing)
    panic("log.committing");
80102d34:	83 ec 0c             	sub    $0xc,%esp
80102d37:	68 84 75 10 80       	push   $0x80107584
80102d3c:	e8 2f d6 ff ff       	call   80100370 <panic>
80102d41:	eb 0d                	jmp    80102d50 <log_write>
80102d43:	90                   	nop
80102d44:	90                   	nop
80102d45:	90                   	nop
80102d46:	90                   	nop
80102d47:	90                   	nop
80102d48:	90                   	nop
80102d49:	90                   	nop
80102d4a:	90                   	nop
80102d4b:	90                   	nop
80102d4c:	90                   	nop
80102d4d:	90                   	nop
80102d4e:	90                   	nop
80102d4f:	90                   	nop

80102d50 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
80102d50:	55                   	push   %ebp
80102d51:	89 e5                	mov    %esp,%ebp
80102d53:	53                   	push   %ebx
80102d54:	83 ec 04             	sub    $0x4,%esp
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102d57:	8b 15 c8 26 11 80    	mov    0x801126c8,%edx
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
80102d5d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102d60:	83 fa 1d             	cmp    $0x1d,%edx
80102d63:	0f 8f 97 00 00 00    	jg     80102e00 <log_write+0xb0>
80102d69:	a1 b8 26 11 80       	mov    0x801126b8,%eax
80102d6e:	83 e8 01             	sub    $0x1,%eax
80102d71:	39 c2                	cmp    %eax,%edx
80102d73:	0f 8d 87 00 00 00    	jge    80102e00 <log_write+0xb0>
    panic("too big a transaction");
  if (log.outstanding < 1)
80102d79:	a1 bc 26 11 80       	mov    0x801126bc,%eax
80102d7e:	85 c0                	test   %eax,%eax
80102d80:	0f 8e 87 00 00 00    	jle    80102e0d <log_write+0xbd>
    panic("log_write outside of trans");

  acquire(&log.lock);
80102d86:	83 ec 0c             	sub    $0xc,%esp
80102d89:	68 80 26 11 80       	push   $0x80112680
80102d8e:	e8 2d 15 00 00       	call   801042c0 <acquire>
  for (i = 0; i < log.lh.n; i++) {
80102d93:	8b 15 c8 26 11 80    	mov    0x801126c8,%edx
80102d99:	83 c4 10             	add    $0x10,%esp
80102d9c:	83 fa 00             	cmp    $0x0,%edx
80102d9f:	7e 50                	jle    80102df1 <log_write+0xa1>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102da1:	8b 4b 08             	mov    0x8(%ebx),%ecx
    panic("too big a transaction");
  if (log.outstanding < 1)
    panic("log_write outside of trans");

  acquire(&log.lock);
  for (i = 0; i < log.lh.n; i++) {
80102da4:	31 c0                	xor    %eax,%eax
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102da6:	3b 0d cc 26 11 80    	cmp    0x801126cc,%ecx
80102dac:	75 0b                	jne    80102db9 <log_write+0x69>
80102dae:	eb 38                	jmp    80102de8 <log_write+0x98>
80102db0:	39 0c 85 cc 26 11 80 	cmp    %ecx,-0x7feed934(,%eax,4)
80102db7:	74 2f                	je     80102de8 <log_write+0x98>
    panic("too big a transaction");
  if (log.outstanding < 1)
    panic("log_write outside of trans");

  acquire(&log.lock);
  for (i = 0; i < log.lh.n; i++) {
80102db9:	83 c0 01             	add    $0x1,%eax
80102dbc:	39 d0                	cmp    %edx,%eax
80102dbe:	75 f0                	jne    80102db0 <log_write+0x60>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
      break;
  }
  log.lh.block[i] = b->blockno;
80102dc0:	89 0c 95 cc 26 11 80 	mov    %ecx,-0x7feed934(,%edx,4)
  if (i == log.lh.n)
    log.lh.n++;
80102dc7:	83 c2 01             	add    $0x1,%edx
80102dca:	89 15 c8 26 11 80    	mov    %edx,0x801126c8
  b->flags |= B_DIRTY; // prevent eviction
80102dd0:	83 0b 04             	orl    $0x4,(%ebx)
  release(&log.lock);
80102dd3:	c7 45 08 80 26 11 80 	movl   $0x80112680,0x8(%ebp)
}
80102dda:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102ddd:	c9                   	leave  
  }
  log.lh.block[i] = b->blockno;
  if (i == log.lh.n)
    log.lh.n++;
  b->flags |= B_DIRTY; // prevent eviction
  release(&log.lock);
80102dde:	e9 fd 15 00 00       	jmp    801043e0 <release>
80102de3:	90                   	nop
80102de4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  acquire(&log.lock);
  for (i = 0; i < log.lh.n; i++) {
    if (log.lh.block[i] == b->blockno)   // log absorbtion
      break;
  }
  log.lh.block[i] = b->blockno;
80102de8:	89 0c 85 cc 26 11 80 	mov    %ecx,-0x7feed934(,%eax,4)
80102def:	eb df                	jmp    80102dd0 <log_write+0x80>
80102df1:	8b 43 08             	mov    0x8(%ebx),%eax
80102df4:	a3 cc 26 11 80       	mov    %eax,0x801126cc
  if (i == log.lh.n)
80102df9:	75 d5                	jne    80102dd0 <log_write+0x80>
80102dfb:	eb ca                	jmp    80102dc7 <log_write+0x77>
80102dfd:	8d 76 00             	lea    0x0(%esi),%esi
log_write(struct buf *b)
{
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
    panic("too big a transaction");
80102e00:	83 ec 0c             	sub    $0xc,%esp
80102e03:	68 93 75 10 80       	push   $0x80107593
80102e08:	e8 63 d5 ff ff       	call   80100370 <panic>
  if (log.outstanding < 1)
    panic("log_write outside of trans");
80102e0d:	83 ec 0c             	sub    $0xc,%esp
80102e10:	68 a9 75 10 80       	push   $0x801075a9
80102e15:	e8 56 d5 ff ff       	call   80100370 <panic>
80102e1a:	66 90                	xchg   %ax,%ax
80102e1c:	66 90                	xchg   %ax,%ax
80102e1e:	66 90                	xchg   %ax,%ax

80102e20 <mpmain>:
}

// Common CPU setup code.
static void
mpmain(void)
{
80102e20:	55                   	push   %ebp
80102e21:	89 e5                	mov    %esp,%ebp
80102e23:	53                   	push   %ebx
80102e24:	83 ec 04             	sub    $0x4,%esp
  cprintf("cpu%d: starting %d\n", cpuid(), cpuid());
80102e27:	e8 54 09 00 00       	call   80103780 <cpuid>
80102e2c:	89 c3                	mov    %eax,%ebx
80102e2e:	e8 4d 09 00 00       	call   80103780 <cpuid>
80102e33:	83 ec 04             	sub    $0x4,%esp
80102e36:	53                   	push   %ebx
80102e37:	50                   	push   %eax
80102e38:	68 c4 75 10 80       	push   $0x801075c4
80102e3d:	e8 1e d8 ff ff       	call   80100660 <cprintf>
  idtinit();       // load idt register
80102e42:	e8 29 29 00 00       	call   80105770 <idtinit>
  xchg(&(mycpu()->started), 1); // tell startothers() we're up
80102e47:	e8 b4 08 00 00       	call   80103700 <mycpu>
80102e4c:	89 c2                	mov    %eax,%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
80102e4e:	b8 01 00 00 00       	mov    $0x1,%eax
80102e53:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
  scheduler();     // start running processes
80102e5a:	e8 01 0c 00 00       	call   80103a60 <scheduler>
80102e5f:	90                   	nop

80102e60 <mpenter>:
}

// Other CPUs jump here from entryother.S.
static void
mpenter(void)
{
80102e60:	55                   	push   %ebp
80102e61:	89 e5                	mov    %esp,%ebp
80102e63:	83 ec 08             	sub    $0x8,%esp
  switchkvm();
80102e66:	e8 95 3a 00 00       	call   80106900 <switchkvm>
  seginit();
80102e6b:	e8 00 39 00 00       	call   80106770 <seginit>
  lapicinit();
80102e70:	e8 9b f7 ff ff       	call   80102610 <lapicinit>
  mpmain();
80102e75:	e8 a6 ff ff ff       	call   80102e20 <mpmain>
80102e7a:	66 90                	xchg   %ax,%ax
80102e7c:	66 90                	xchg   %ax,%ax
80102e7e:	66 90                	xchg   %ax,%ax

80102e80 <main>:
// Bootstrap processor starts running C code here.
// Allocate a real stack and switch to it, first
// doing some setup required for memory allocator to work.
int
main(void)
{
80102e80:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80102e84:	83 e4 f0             	and    $0xfffffff0,%esp
80102e87:	ff 71 fc             	pushl  -0x4(%ecx)
80102e8a:	55                   	push   %ebp
80102e8b:	89 e5                	mov    %esp,%ebp
80102e8d:	53                   	push   %ebx
80102e8e:	51                   	push   %ecx
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);

  for(c = cpus; c < cpus+ncpu; c++){
80102e8f:	bb 80 27 11 80       	mov    $0x80112780,%ebx
// Allocate a real stack and switch to it, first
// doing some setup required for memory allocator to work.
int
main(void)
{
  kinit1(end, P2V(4*1024*1024)); // phys page allocator
80102e94:	83 ec 08             	sub    $0x8,%esp
80102e97:	68 00 00 40 80       	push   $0x80400000
80102e9c:	68 f4 58 11 80       	push   $0x801158f4
80102ea1:	e8 3a f5 ff ff       	call   801023e0 <kinit1>
  kvmalloc();      // kernel page table
80102ea6:	e8 f5 3e 00 00       	call   80106da0 <kvmalloc>
  mpinit();        // detect other processors
80102eab:	e8 70 01 00 00       	call   80103020 <mpinit>
  lapicinit();     // interrupt controller
80102eb0:	e8 5b f7 ff ff       	call   80102610 <lapicinit>
  seginit();       // segment descriptors
80102eb5:	e8 b6 38 00 00       	call   80106770 <seginit>
  picinit();       // disable pic
80102eba:	e8 31 03 00 00       	call   801031f0 <picinit>
  ioapicinit();    // another interrupt controller
80102ebf:	e8 4c f3 ff ff       	call   80102210 <ioapicinit>
  consoleinit();   // console hardware
80102ec4:	e8 d7 da ff ff       	call   801009a0 <consoleinit>
  uartinit();      // serial port
80102ec9:	e8 02 2c 00 00       	call   80105ad0 <uartinit>
  pinit();         // process table
80102ece:	e8 0d 08 00 00       	call   801036e0 <pinit>
  shminit();       // shared memory
80102ed3:	e8 88 41 00 00       	call   80107060 <shminit>
  tvinit();        // trap vectors
80102ed8:	e8 f3 27 00 00       	call   801056d0 <tvinit>
  binit();         // buffer cache
80102edd:	e8 5e d1 ff ff       	call   80100040 <binit>
  fileinit();      // file table
80102ee2:	e8 89 de ff ff       	call   80100d70 <fileinit>
  ideinit();       // disk 
80102ee7:	e8 04 f1 ff ff       	call   80101ff0 <ideinit>

  // Write entry code to unused memory at 0x7000.
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
80102eec:	83 c4 0c             	add    $0xc,%esp
80102eef:	68 8a 00 00 00       	push   $0x8a
80102ef4:	68 8c a4 10 80       	push   $0x8010a48c
80102ef9:	68 00 70 00 80       	push   $0x80007000
80102efe:	e8 dd 15 00 00       	call   801044e0 <memmove>

  for(c = cpus; c < cpus+ncpu; c++){
80102f03:	69 05 00 2d 11 80 b0 	imul   $0xb0,0x80112d00,%eax
80102f0a:	00 00 00 
80102f0d:	83 c4 10             	add    $0x10,%esp
80102f10:	05 80 27 11 80       	add    $0x80112780,%eax
80102f15:	39 d8                	cmp    %ebx,%eax
80102f17:	76 6a                	jbe    80102f83 <main+0x103>
80102f19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(c == mycpu())  // We've started already.
80102f20:	e8 db 07 00 00       	call   80103700 <mycpu>
80102f25:	39 d8                	cmp    %ebx,%eax
80102f27:	74 41                	je     80102f6a <main+0xea>
      continue;

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
80102f29:	e8 82 f5 ff ff       	call   801024b0 <kalloc>
    *(void**)(code-4) = stack + KSTACKSIZE;
80102f2e:	05 00 10 00 00       	add    $0x1000,%eax
    *(void**)(code-8) = mpenter;
80102f33:	c7 05 f8 6f 00 80 60 	movl   $0x80102e60,0x80006ff8
80102f3a:	2e 10 80 
    *(int**)(code-12) = (void *) V2P(entrypgdir);
80102f3d:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
80102f44:	90 10 00 

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
    *(void**)(code-4) = stack + KSTACKSIZE;
80102f47:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
    *(void**)(code-8) = mpenter;
    *(int**)(code-12) = (void *) V2P(entrypgdir);

    lapicstartap(c->apicid, V2P(code));
80102f4c:	0f b6 03             	movzbl (%ebx),%eax
80102f4f:	83 ec 08             	sub    $0x8,%esp
80102f52:	68 00 70 00 00       	push   $0x7000
80102f57:	50                   	push   %eax
80102f58:	e8 03 f8 ff ff       	call   80102760 <lapicstartap>
80102f5d:	83 c4 10             	add    $0x10,%esp

    // wait for cpu to finish mpmain()
    while(c->started == 0)
80102f60:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
80102f66:	85 c0                	test   %eax,%eax
80102f68:	74 f6                	je     80102f60 <main+0xe0>
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);

  for(c = cpus; c < cpus+ncpu; c++){
80102f6a:	69 05 00 2d 11 80 b0 	imul   $0xb0,0x80112d00,%eax
80102f71:	00 00 00 
80102f74:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
80102f7a:	05 80 27 11 80       	add    $0x80112780,%eax
80102f7f:	39 c3                	cmp    %eax,%ebx
80102f81:	72 9d                	jb     80102f20 <main+0xa0>
  tvinit();        // trap vectors
  binit();         // buffer cache
  fileinit();      // file table
  ideinit();       // disk 
  startothers();   // start other processors
  kinit2(P2V(4*1024*1024), P2V(PHYSTOP)); // must come after startothers()
80102f83:	83 ec 08             	sub    $0x8,%esp
80102f86:	68 00 00 00 8e       	push   $0x8e000000
80102f8b:	68 00 00 40 80       	push   $0x80400000
80102f90:	e8 bb f4 ff ff       	call   80102450 <kinit2>
  userinit();      // first user process
80102f95:	e8 36 08 00 00       	call   801037d0 <userinit>
  mpmain();        // finish this processor's setup
80102f9a:	e8 81 fe ff ff       	call   80102e20 <mpmain>
80102f9f:	90                   	nop

80102fa0 <mpsearch1>:
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80102fa0:	55                   	push   %ebp
80102fa1:	89 e5                	mov    %esp,%ebp
80102fa3:	57                   	push   %edi
80102fa4:	56                   	push   %esi
  uchar *e, *p, *addr;

  addr = P2V(a);
80102fa5:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80102fab:	53                   	push   %ebx
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
80102fac:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80102faf:	83 ec 0c             	sub    $0xc,%esp
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
80102fb2:	39 de                	cmp    %ebx,%esi
80102fb4:	73 48                	jae    80102ffe <mpsearch1+0x5e>
80102fb6:	8d 76 00             	lea    0x0(%esi),%esi
80102fb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80102fc0:	83 ec 04             	sub    $0x4,%esp
80102fc3:	8d 7e 10             	lea    0x10(%esi),%edi
80102fc6:	6a 04                	push   $0x4
80102fc8:	68 d8 75 10 80       	push   $0x801075d8
80102fcd:	56                   	push   %esi
80102fce:	e8 ad 14 00 00       	call   80104480 <memcmp>
80102fd3:	83 c4 10             	add    $0x10,%esp
80102fd6:	85 c0                	test   %eax,%eax
80102fd8:	75 1e                	jne    80102ff8 <mpsearch1+0x58>
80102fda:	8d 7e 10             	lea    0x10(%esi),%edi
80102fdd:	89 f2                	mov    %esi,%edx
80102fdf:	31 c9                	xor    %ecx,%ecx
80102fe1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
    sum += addr[i];
80102fe8:	0f b6 02             	movzbl (%edx),%eax
80102feb:	83 c2 01             	add    $0x1,%edx
80102fee:	01 c1                	add    %eax,%ecx
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
80102ff0:	39 fa                	cmp    %edi,%edx
80102ff2:	75 f4                	jne    80102fe8 <mpsearch1+0x48>
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80102ff4:	84 c9                	test   %cl,%cl
80102ff6:	74 10                	je     80103008 <mpsearch1+0x68>
{
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
80102ff8:	39 fb                	cmp    %edi,%ebx
80102ffa:	89 fe                	mov    %edi,%esi
80102ffc:	77 c2                	ja     80102fc0 <mpsearch1+0x20>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
      return (struct mp*)p;
  return 0;
}
80102ffe:	8d 65 f4             	lea    -0xc(%ebp),%esp
  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
      return (struct mp*)p;
  return 0;
80103001:	31 c0                	xor    %eax,%eax
}
80103003:	5b                   	pop    %ebx
80103004:	5e                   	pop    %esi
80103005:	5f                   	pop    %edi
80103006:	5d                   	pop    %ebp
80103007:	c3                   	ret    
80103008:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010300b:	89 f0                	mov    %esi,%eax
8010300d:	5b                   	pop    %ebx
8010300e:	5e                   	pop    %esi
8010300f:	5f                   	pop    %edi
80103010:	5d                   	pop    %ebp
80103011:	c3                   	ret    
80103012:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103019:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103020 <mpinit>:
  return conf;
}

void
mpinit(void)
{
80103020:	55                   	push   %ebp
80103021:	89 e5                	mov    %esp,%ebp
80103023:	57                   	push   %edi
80103024:	56                   	push   %esi
80103025:	53                   	push   %ebx
80103026:	83 ec 1c             	sub    $0x1c,%esp
  uchar *bda;
  uint p;
  struct mp *mp;

  bda = (uchar *) P2V(0x400);
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
80103029:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80103030:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80103037:	c1 e0 08             	shl    $0x8,%eax
8010303a:	09 d0                	or     %edx,%eax
8010303c:	c1 e0 04             	shl    $0x4,%eax
8010303f:	85 c0                	test   %eax,%eax
80103041:	75 1b                	jne    8010305e <mpinit+0x3e>
    if((mp = mpsearch1(p, 1024)))
      return mp;
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
80103043:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
8010304a:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
80103051:	c1 e0 08             	shl    $0x8,%eax
80103054:	09 d0                	or     %edx,%eax
80103056:	c1 e0 0a             	shl    $0xa,%eax
80103059:	2d 00 04 00 00       	sub    $0x400,%eax
  uint p;
  struct mp *mp;

  bda = (uchar *) P2V(0x400);
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
    if((mp = mpsearch1(p, 1024)))
8010305e:	ba 00 04 00 00       	mov    $0x400,%edx
80103063:	e8 38 ff ff ff       	call   80102fa0 <mpsearch1>
80103068:	85 c0                	test   %eax,%eax
8010306a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010306d:	0f 84 37 01 00 00    	je     801031aa <mpinit+0x18a>
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80103073:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103076:	8b 58 04             	mov    0x4(%eax),%ebx
80103079:	85 db                	test   %ebx,%ebx
8010307b:	0f 84 43 01 00 00    	je     801031c4 <mpinit+0x1a4>
    return 0;
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
80103081:	8d b3 00 00 00 80    	lea    -0x80000000(%ebx),%esi
  if(memcmp(conf, "PCMP", 4) != 0)
80103087:	83 ec 04             	sub    $0x4,%esp
8010308a:	6a 04                	push   $0x4
8010308c:	68 dd 75 10 80       	push   $0x801075dd
80103091:	56                   	push   %esi
80103092:	e8 e9 13 00 00       	call   80104480 <memcmp>
80103097:	83 c4 10             	add    $0x10,%esp
8010309a:	85 c0                	test   %eax,%eax
8010309c:	0f 85 22 01 00 00    	jne    801031c4 <mpinit+0x1a4>
    return 0;
  if(conf->version != 1 && conf->version != 4)
801030a2:	0f b6 83 06 00 00 80 	movzbl -0x7ffffffa(%ebx),%eax
801030a9:	3c 01                	cmp    $0x1,%al
801030ab:	74 08                	je     801030b5 <mpinit+0x95>
801030ad:	3c 04                	cmp    $0x4,%al
801030af:	0f 85 0f 01 00 00    	jne    801031c4 <mpinit+0x1a4>
    return 0;
  if(sum((uchar*)conf, conf->length) != 0)
801030b5:	0f b7 bb 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edi
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
801030bc:	85 ff                	test   %edi,%edi
801030be:	74 21                	je     801030e1 <mpinit+0xc1>
801030c0:	31 d2                	xor    %edx,%edx
801030c2:	31 c0                	xor    %eax,%eax
801030c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    sum += addr[i];
801030c8:	0f b6 8c 03 00 00 00 	movzbl -0x80000000(%ebx,%eax,1),%ecx
801030cf:	80 
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
801030d0:	83 c0 01             	add    $0x1,%eax
    sum += addr[i];
801030d3:	01 ca                	add    %ecx,%edx
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
801030d5:	39 c7                	cmp    %eax,%edi
801030d7:	75 ef                	jne    801030c8 <mpinit+0xa8>
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
  if(memcmp(conf, "PCMP", 4) != 0)
    return 0;
  if(conf->version != 1 && conf->version != 4)
    return 0;
  if(sum((uchar*)conf, conf->length) != 0)
801030d9:	84 d2                	test   %dl,%dl
801030db:	0f 85 e3 00 00 00    	jne    801031c4 <mpinit+0x1a4>
  struct mp *mp;
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
801030e1:	85 f6                	test   %esi,%esi
801030e3:	0f 84 db 00 00 00    	je     801031c4 <mpinit+0x1a4>
    panic("Expect to run on an SMP");
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
801030e9:	8b 83 24 00 00 80    	mov    -0x7fffffdc(%ebx),%eax
801030ef:	a3 7c 26 11 80       	mov    %eax,0x8011267c
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801030f4:	0f b7 93 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edx
801030fb:	8d 83 2c 00 00 80    	lea    -0x7fffffd4(%ebx),%eax
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
    panic("Expect to run on an SMP");
  ismp = 1;
80103101:	bb 01 00 00 00       	mov    $0x1,%ebx
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
80103106:	01 d6                	add    %edx,%esi
80103108:	90                   	nop
80103109:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103110:	39 c6                	cmp    %eax,%esi
80103112:	76 23                	jbe    80103137 <mpinit+0x117>
80103114:	0f b6 10             	movzbl (%eax),%edx
    switch(*p){
80103117:	80 fa 04             	cmp    $0x4,%dl
8010311a:	0f 87 c0 00 00 00    	ja     801031e0 <mpinit+0x1c0>
80103120:	ff 24 95 1c 76 10 80 	jmp    *-0x7fef89e4(,%edx,4)
80103127:	89 f6                	mov    %esi,%esi
80103129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      p += sizeof(struct mpioapic);
      continue;
    case MPBUS:
    case MPIOINTR:
    case MPLINTR:
      p += 8;
80103130:	83 c0 08             	add    $0x8,%eax

  if((conf = mpconfig(&mp)) == 0)
    panic("Expect to run on an SMP");
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
80103133:	39 c6                	cmp    %eax,%esi
80103135:	77 dd                	ja     80103114 <mpinit+0xf4>
    default:
      ismp = 0;
      break;
    }
  }
  if(!ismp)
80103137:	85 db                	test   %ebx,%ebx
80103139:	0f 84 92 00 00 00    	je     801031d1 <mpinit+0x1b1>
    panic("Didn't find a suitable machine");

  if(mp->imcrp){
8010313f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103142:	80 78 0c 00          	cmpb   $0x0,0xc(%eax)
80103146:	74 15                	je     8010315d <mpinit+0x13d>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80103148:	ba 22 00 00 00       	mov    $0x22,%edx
8010314d:	b8 70 00 00 00       	mov    $0x70,%eax
80103152:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80103153:	ba 23 00 00 00       	mov    $0x23,%edx
80103158:	ec                   	in     (%dx),%al
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80103159:	83 c8 01             	or     $0x1,%eax
8010315c:	ee                   	out    %al,(%dx)
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
  }
}
8010315d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103160:	5b                   	pop    %ebx
80103161:	5e                   	pop    %esi
80103162:	5f                   	pop    %edi
80103163:	5d                   	pop    %ebp
80103164:	c3                   	ret    
80103165:	8d 76 00             	lea    0x0(%esi),%esi
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
    switch(*p){
    case MPPROC:
      proc = (struct mpproc*)p;
      if(ncpu < NCPU) {
80103168:	8b 0d 00 2d 11 80    	mov    0x80112d00,%ecx
8010316e:	83 f9 07             	cmp    $0x7,%ecx
80103171:	7f 19                	jg     8010318c <mpinit+0x16c>
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
80103173:	0f b6 50 01          	movzbl 0x1(%eax),%edx
80103177:	69 f9 b0 00 00 00    	imul   $0xb0,%ecx,%edi
        ncpu++;
8010317d:	83 c1 01             	add    $0x1,%ecx
80103180:	89 0d 00 2d 11 80    	mov    %ecx,0x80112d00
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
    switch(*p){
    case MPPROC:
      proc = (struct mpproc*)p;
      if(ncpu < NCPU) {
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
80103186:	88 97 80 27 11 80    	mov    %dl,-0x7feed880(%edi)
        ncpu++;
      }
      p += sizeof(struct mpproc);
8010318c:	83 c0 14             	add    $0x14,%eax
      continue;
8010318f:	e9 7c ff ff ff       	jmp    80103110 <mpinit+0xf0>
80103194:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    case MPIOAPIC:
      ioapic = (struct mpioapic*)p;
      ioapicid = ioapic->apicno;
80103198:	0f b6 50 01          	movzbl 0x1(%eax),%edx
      p += sizeof(struct mpioapic);
8010319c:	83 c0 08             	add    $0x8,%eax
      }
      p += sizeof(struct mpproc);
      continue;
    case MPIOAPIC:
      ioapic = (struct mpioapic*)p;
      ioapicid = ioapic->apicno;
8010319f:	88 15 60 27 11 80    	mov    %dl,0x80112760
      p += sizeof(struct mpioapic);
      continue;
801031a5:	e9 66 ff ff ff       	jmp    80103110 <mpinit+0xf0>
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
      return mp;
  }
  return mpsearch1(0xF0000, 0x10000);
801031aa:	ba 00 00 01 00       	mov    $0x10000,%edx
801031af:	b8 00 00 0f 00       	mov    $0xf0000,%eax
801031b4:	e8 e7 fd ff ff       	call   80102fa0 <mpsearch1>
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
801031b9:	85 c0                	test   %eax,%eax
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
      return mp;
  }
  return mpsearch1(0xF0000, 0x10000);
801031bb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
801031be:	0f 85 af fe ff ff    	jne    80103073 <mpinit+0x53>
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
    panic("Expect to run on an SMP");
801031c4:	83 ec 0c             	sub    $0xc,%esp
801031c7:	68 e2 75 10 80       	push   $0x801075e2
801031cc:	e8 9f d1 ff ff       	call   80100370 <panic>
      ismp = 0;
      break;
    }
  }
  if(!ismp)
    panic("Didn't find a suitable machine");
801031d1:	83 ec 0c             	sub    $0xc,%esp
801031d4:	68 fc 75 10 80       	push   $0x801075fc
801031d9:	e8 92 d1 ff ff       	call   80100370 <panic>
801031de:	66 90                	xchg   %ax,%ax
    case MPIOINTR:
    case MPLINTR:
      p += 8;
      continue;
    default:
      ismp = 0;
801031e0:	31 db                	xor    %ebx,%ebx
801031e2:	e9 30 ff ff ff       	jmp    80103117 <mpinit+0xf7>
801031e7:	66 90                	xchg   %ax,%ax
801031e9:	66 90                	xchg   %ax,%ax
801031eb:	66 90                	xchg   %ax,%ax
801031ed:	66 90                	xchg   %ax,%ax
801031ef:	90                   	nop

801031f0 <picinit>:
#define IO_PIC2         0xA0    // Slave (IRQs 8-15)

// Don't use the 8259A interrupt controllers.  Xv6 assumes SMP hardware.
void
picinit(void)
{
801031f0:	55                   	push   %ebp
801031f1:	ba 21 00 00 00       	mov    $0x21,%edx
801031f6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801031fb:	89 e5                	mov    %esp,%ebp
801031fd:	ee                   	out    %al,(%dx)
801031fe:	ba a1 00 00 00       	mov    $0xa1,%edx
80103203:	ee                   	out    %al,(%dx)
  // mask all interrupts
  outb(IO_PIC1+1, 0xFF);
  outb(IO_PIC2+1, 0xFF);
}
80103204:	5d                   	pop    %ebp
80103205:	c3                   	ret    
80103206:	66 90                	xchg   %ax,%ax
80103208:	66 90                	xchg   %ax,%ax
8010320a:	66 90                	xchg   %ax,%ax
8010320c:	66 90                	xchg   %ax,%ax
8010320e:	66 90                	xchg   %ax,%ax

80103210 <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
80103210:	55                   	push   %ebp
80103211:	89 e5                	mov    %esp,%ebp
80103213:	57                   	push   %edi
80103214:	56                   	push   %esi
80103215:	53                   	push   %ebx
80103216:	83 ec 0c             	sub    $0xc,%esp
80103219:	8b 75 08             	mov    0x8(%ebp),%esi
8010321c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  struct pipe *p;

  p = 0;
  *f0 = *f1 = 0;
8010321f:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103225:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
8010322b:	e8 60 db ff ff       	call   80100d90 <filealloc>
80103230:	85 c0                	test   %eax,%eax
80103232:	89 06                	mov    %eax,(%esi)
80103234:	0f 84 a8 00 00 00    	je     801032e2 <pipealloc+0xd2>
8010323a:	e8 51 db ff ff       	call   80100d90 <filealloc>
8010323f:	85 c0                	test   %eax,%eax
80103241:	89 03                	mov    %eax,(%ebx)
80103243:	0f 84 87 00 00 00    	je     801032d0 <pipealloc+0xc0>
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
80103249:	e8 62 f2 ff ff       	call   801024b0 <kalloc>
8010324e:	85 c0                	test   %eax,%eax
80103250:	89 c7                	mov    %eax,%edi
80103252:	0f 84 b0 00 00 00    	je     80103308 <pipealloc+0xf8>
    goto bad;
  p->readopen = 1;
  p->writeopen = 1;
  p->nwrite = 0;
  p->nread = 0;
  initlock(&p->lock, "pipe");
80103258:	83 ec 08             	sub    $0x8,%esp
  *f0 = *f1 = 0;
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
    goto bad;
  p->readopen = 1;
8010325b:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
80103262:	00 00 00 
  p->writeopen = 1;
80103265:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
8010326c:	00 00 00 
  p->nwrite = 0;
8010326f:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
80103276:	00 00 00 
  p->nread = 0;
80103279:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80103280:	00 00 00 
  initlock(&p->lock, "pipe");
80103283:	68 30 76 10 80       	push   $0x80107630
80103288:	50                   	push   %eax
80103289:	e8 32 0f 00 00       	call   801041c0 <initlock>
  (*f0)->type = FD_PIPE;
8010328e:	8b 06                	mov    (%esi),%eax
  (*f0)->pipe = p;
  (*f1)->type = FD_PIPE;
  (*f1)->readable = 0;
  (*f1)->writable = 1;
  (*f1)->pipe = p;
  return 0;
80103290:	83 c4 10             	add    $0x10,%esp
  p->readopen = 1;
  p->writeopen = 1;
  p->nwrite = 0;
  p->nread = 0;
  initlock(&p->lock, "pipe");
  (*f0)->type = FD_PIPE;
80103293:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f0)->readable = 1;
80103299:	8b 06                	mov    (%esi),%eax
8010329b:	c6 40 08 01          	movb   $0x1,0x8(%eax)
  (*f0)->writable = 0;
8010329f:	8b 06                	mov    (%esi),%eax
801032a1:	c6 40 09 00          	movb   $0x0,0x9(%eax)
  (*f0)->pipe = p;
801032a5:	8b 06                	mov    (%esi),%eax
801032a7:	89 78 0c             	mov    %edi,0xc(%eax)
  (*f1)->type = FD_PIPE;
801032aa:	8b 03                	mov    (%ebx),%eax
801032ac:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f1)->readable = 0;
801032b2:	8b 03                	mov    (%ebx),%eax
801032b4:	c6 40 08 00          	movb   $0x0,0x8(%eax)
  (*f1)->writable = 1;
801032b8:	8b 03                	mov    (%ebx),%eax
801032ba:	c6 40 09 01          	movb   $0x1,0x9(%eax)
  (*f1)->pipe = p;
801032be:	8b 03                	mov    (%ebx),%eax
801032c0:	89 78 0c             	mov    %edi,0xc(%eax)
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
}
801032c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
  (*f0)->pipe = p;
  (*f1)->type = FD_PIPE;
  (*f1)->readable = 0;
  (*f1)->writable = 1;
  (*f1)->pipe = p;
  return 0;
801032c6:	31 c0                	xor    %eax,%eax
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
}
801032c8:	5b                   	pop    %ebx
801032c9:	5e                   	pop    %esi
801032ca:	5f                   	pop    %edi
801032cb:	5d                   	pop    %ebp
801032cc:	c3                   	ret    
801032cd:	8d 76 00             	lea    0x0(%esi),%esi

//PAGEBREAK: 20
 bad:
  if(p)
    kfree((char*)p);
  if(*f0)
801032d0:	8b 06                	mov    (%esi),%eax
801032d2:	85 c0                	test   %eax,%eax
801032d4:	74 1e                	je     801032f4 <pipealloc+0xe4>
    fileclose(*f0);
801032d6:	83 ec 0c             	sub    $0xc,%esp
801032d9:	50                   	push   %eax
801032da:	e8 71 db ff ff       	call   80100e50 <fileclose>
801032df:	83 c4 10             	add    $0x10,%esp
  if(*f1)
801032e2:	8b 03                	mov    (%ebx),%eax
801032e4:	85 c0                	test   %eax,%eax
801032e6:	74 0c                	je     801032f4 <pipealloc+0xe4>
    fileclose(*f1);
801032e8:	83 ec 0c             	sub    $0xc,%esp
801032eb:	50                   	push   %eax
801032ec:	e8 5f db ff ff       	call   80100e50 <fileclose>
801032f1:	83 c4 10             	add    $0x10,%esp
  return -1;
}
801032f4:	8d 65 f4             	lea    -0xc(%ebp),%esp
    kfree((char*)p);
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
801032f7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801032fc:	5b                   	pop    %ebx
801032fd:	5e                   	pop    %esi
801032fe:	5f                   	pop    %edi
801032ff:	5d                   	pop    %ebp
80103300:	c3                   	ret    
80103301:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

//PAGEBREAK: 20
 bad:
  if(p)
    kfree((char*)p);
  if(*f0)
80103308:	8b 06                	mov    (%esi),%eax
8010330a:	85 c0                	test   %eax,%eax
8010330c:	75 c8                	jne    801032d6 <pipealloc+0xc6>
8010330e:	eb d2                	jmp    801032e2 <pipealloc+0xd2>

80103310 <pipeclose>:
  return -1;
}

void
pipeclose(struct pipe *p, int writable)
{
80103310:	55                   	push   %ebp
80103311:	89 e5                	mov    %esp,%ebp
80103313:	56                   	push   %esi
80103314:	53                   	push   %ebx
80103315:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103318:	8b 75 0c             	mov    0xc(%ebp),%esi
  acquire(&p->lock);
8010331b:	83 ec 0c             	sub    $0xc,%esp
8010331e:	53                   	push   %ebx
8010331f:	e8 9c 0f 00 00       	call   801042c0 <acquire>
  if(writable){
80103324:	83 c4 10             	add    $0x10,%esp
80103327:	85 f6                	test   %esi,%esi
80103329:	74 45                	je     80103370 <pipeclose+0x60>
    p->writeopen = 0;
    wakeup(&p->nread);
8010332b:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80103331:	83 ec 0c             	sub    $0xc,%esp
void
pipeclose(struct pipe *p, int writable)
{
  acquire(&p->lock);
  if(writable){
    p->writeopen = 0;
80103334:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
8010333b:	00 00 00 
    wakeup(&p->nread);
8010333e:	50                   	push   %eax
8010333f:	e8 bc 0b 00 00       	call   80103f00 <wakeup>
80103344:	83 c4 10             	add    $0x10,%esp
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
80103347:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
8010334d:	85 d2                	test   %edx,%edx
8010334f:	75 0a                	jne    8010335b <pipeclose+0x4b>
80103351:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
80103357:	85 c0                	test   %eax,%eax
80103359:	74 35                	je     80103390 <pipeclose+0x80>
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
8010335b:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
8010335e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103361:	5b                   	pop    %ebx
80103362:	5e                   	pop    %esi
80103363:	5d                   	pop    %ebp
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
80103364:	e9 77 10 00 00       	jmp    801043e0 <release>
80103369:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(writable){
    p->writeopen = 0;
    wakeup(&p->nread);
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
80103370:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80103376:	83 ec 0c             	sub    $0xc,%esp
  acquire(&p->lock);
  if(writable){
    p->writeopen = 0;
    wakeup(&p->nread);
  } else {
    p->readopen = 0;
80103379:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
80103380:	00 00 00 
    wakeup(&p->nwrite);
80103383:	50                   	push   %eax
80103384:	e8 77 0b 00 00       	call   80103f00 <wakeup>
80103389:	83 c4 10             	add    $0x10,%esp
8010338c:	eb b9                	jmp    80103347 <pipeclose+0x37>
8010338e:	66 90                	xchg   %ax,%ax
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
80103390:	83 ec 0c             	sub    $0xc,%esp
80103393:	53                   	push   %ebx
80103394:	e8 47 10 00 00       	call   801043e0 <release>
    kfree((char*)p);
80103399:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010339c:	83 c4 10             	add    $0x10,%esp
  } else
    release(&p->lock);
}
8010339f:	8d 65 f8             	lea    -0x8(%ebp),%esp
801033a2:	5b                   	pop    %ebx
801033a3:	5e                   	pop    %esi
801033a4:	5d                   	pop    %ebp
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
    kfree((char*)p);
801033a5:	e9 56 ef ff ff       	jmp    80102300 <kfree>
801033aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801033b0 <pipewrite>:
}

//PAGEBREAK: 40
int
pipewrite(struct pipe *p, char *addr, int n)
{
801033b0:	55                   	push   %ebp
801033b1:	89 e5                	mov    %esp,%ebp
801033b3:	57                   	push   %edi
801033b4:	56                   	push   %esi
801033b5:	53                   	push   %ebx
801033b6:	83 ec 28             	sub    $0x28,%esp
801033b9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int i;

  acquire(&p->lock);
801033bc:	53                   	push   %ebx
801033bd:	e8 fe 0e 00 00       	call   801042c0 <acquire>
  for(i = 0; i < n; i++){
801033c2:	8b 45 10             	mov    0x10(%ebp),%eax
801033c5:	83 c4 10             	add    $0x10,%esp
801033c8:	85 c0                	test   %eax,%eax
801033ca:	0f 8e b9 00 00 00    	jle    80103489 <pipewrite+0xd9>
801033d0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801033d3:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
      if(p->readopen == 0 || myproc()->killed){
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
801033d9:	8d bb 34 02 00 00    	lea    0x234(%ebx),%edi
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
801033df:	8d b3 38 02 00 00    	lea    0x238(%ebx),%esi
801033e5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
801033e8:	03 4d 10             	add    0x10(%ebp),%ecx
801033eb:	89 4d e0             	mov    %ecx,-0x20(%ebp)
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
801033ee:	8b 8b 34 02 00 00    	mov    0x234(%ebx),%ecx
801033f4:	8d 91 00 02 00 00    	lea    0x200(%ecx),%edx
801033fa:	39 d0                	cmp    %edx,%eax
801033fc:	74 38                	je     80103436 <pipewrite+0x86>
801033fe:	eb 59                	jmp    80103459 <pipewrite+0xa9>
      if(p->readopen == 0 || myproc()->killed){
80103400:	e8 9b 03 00 00       	call   801037a0 <myproc>
80103405:	8b 48 24             	mov    0x24(%eax),%ecx
80103408:	85 c9                	test   %ecx,%ecx
8010340a:	75 34                	jne    80103440 <pipewrite+0x90>
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
8010340c:	83 ec 0c             	sub    $0xc,%esp
8010340f:	57                   	push   %edi
80103410:	e8 eb 0a 00 00       	call   80103f00 <wakeup>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
80103415:	58                   	pop    %eax
80103416:	5a                   	pop    %edx
80103417:	53                   	push   %ebx
80103418:	56                   	push   %esi
80103419:	e8 32 09 00 00       	call   80103d50 <sleep>
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
8010341e:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
80103424:	8b 93 38 02 00 00    	mov    0x238(%ebx),%edx
8010342a:	83 c4 10             	add    $0x10,%esp
8010342d:	05 00 02 00 00       	add    $0x200,%eax
80103432:	39 c2                	cmp    %eax,%edx
80103434:	75 2a                	jne    80103460 <pipewrite+0xb0>
      if(p->readopen == 0 || myproc()->killed){
80103436:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
8010343c:	85 c0                	test   %eax,%eax
8010343e:	75 c0                	jne    80103400 <pipewrite+0x50>
        release(&p->lock);
80103440:	83 ec 0c             	sub    $0xc,%esp
80103443:	53                   	push   %ebx
80103444:	e8 97 0f 00 00       	call   801043e0 <release>
        return -1;
80103449:	83 c4 10             	add    $0x10,%esp
8010344c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
  release(&p->lock);
  return n;
}
80103451:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103454:	5b                   	pop    %ebx
80103455:	5e                   	pop    %esi
80103456:	5f                   	pop    %edi
80103457:	5d                   	pop    %ebp
80103458:	c3                   	ret    
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103459:	89 c2                	mov    %eax,%edx
8010345b:	90                   	nop
8010345c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        return -1;
      }
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
80103460:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103463:	8d 42 01             	lea    0x1(%edx),%eax
80103466:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
8010346a:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
80103470:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
80103476:	0f b6 09             	movzbl (%ecx),%ecx
80103479:	88 4c 13 34          	mov    %cl,0x34(%ebx,%edx,1)
8010347d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
pipewrite(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
80103480:	3b 4d e0             	cmp    -0x20(%ebp),%ecx
80103483:	0f 85 65 ff ff ff    	jne    801033ee <pipewrite+0x3e>
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
80103489:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
8010348f:	83 ec 0c             	sub    $0xc,%esp
80103492:	50                   	push   %eax
80103493:	e8 68 0a 00 00       	call   80103f00 <wakeup>
  release(&p->lock);
80103498:	89 1c 24             	mov    %ebx,(%esp)
8010349b:	e8 40 0f 00 00       	call   801043e0 <release>
  return n;
801034a0:	83 c4 10             	add    $0x10,%esp
801034a3:	8b 45 10             	mov    0x10(%ebp),%eax
801034a6:	eb a9                	jmp    80103451 <pipewrite+0xa1>
801034a8:	90                   	nop
801034a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801034b0 <piperead>:
}

int
piperead(struct pipe *p, char *addr, int n)
{
801034b0:	55                   	push   %ebp
801034b1:	89 e5                	mov    %esp,%ebp
801034b3:	57                   	push   %edi
801034b4:	56                   	push   %esi
801034b5:	53                   	push   %ebx
801034b6:	83 ec 18             	sub    $0x18,%esp
801034b9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801034bc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i;

  acquire(&p->lock);
801034bf:	53                   	push   %ebx
801034c0:	e8 fb 0d 00 00       	call   801042c0 <acquire>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
801034c5:	83 c4 10             	add    $0x10,%esp
801034c8:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
801034ce:	39 83 38 02 00 00    	cmp    %eax,0x238(%ebx)
801034d4:	75 6a                	jne    80103540 <piperead+0x90>
801034d6:	8b b3 40 02 00 00    	mov    0x240(%ebx),%esi
801034dc:	85 f6                	test   %esi,%esi
801034de:	0f 84 cc 00 00 00    	je     801035b0 <piperead+0x100>
    if(myproc()->killed){
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
801034e4:	8d b3 34 02 00 00    	lea    0x234(%ebx),%esi
801034ea:	eb 2d                	jmp    80103519 <piperead+0x69>
801034ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801034f0:	83 ec 08             	sub    $0x8,%esp
801034f3:	53                   	push   %ebx
801034f4:	56                   	push   %esi
801034f5:	e8 56 08 00 00       	call   80103d50 <sleep>
piperead(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
801034fa:	83 c4 10             	add    $0x10,%esp
801034fd:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
80103503:	39 83 34 02 00 00    	cmp    %eax,0x234(%ebx)
80103509:	75 35                	jne    80103540 <piperead+0x90>
8010350b:	8b 93 40 02 00 00    	mov    0x240(%ebx),%edx
80103511:	85 d2                	test   %edx,%edx
80103513:	0f 84 97 00 00 00    	je     801035b0 <piperead+0x100>
    if(myproc()->killed){
80103519:	e8 82 02 00 00       	call   801037a0 <myproc>
8010351e:	8b 48 24             	mov    0x24(%eax),%ecx
80103521:	85 c9                	test   %ecx,%ecx
80103523:	74 cb                	je     801034f0 <piperead+0x40>
      release(&p->lock);
80103525:	83 ec 0c             	sub    $0xc,%esp
80103528:	53                   	push   %ebx
80103529:	e8 b2 0e 00 00       	call   801043e0 <release>
      return -1;
8010352e:	83 c4 10             	add    $0x10,%esp
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
}
80103531:	8d 65 f4             	lea    -0xc(%ebp),%esp

  acquire(&p->lock);
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
    if(myproc()->killed){
      release(&p->lock);
      return -1;
80103534:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
}
80103539:	5b                   	pop    %ebx
8010353a:	5e                   	pop    %esi
8010353b:	5f                   	pop    %edi
8010353c:	5d                   	pop    %ebp
8010353d:	c3                   	ret    
8010353e:	66 90                	xchg   %ax,%ax
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103540:	8b 45 10             	mov    0x10(%ebp),%eax
80103543:	85 c0                	test   %eax,%eax
80103545:	7e 69                	jle    801035b0 <piperead+0x100>
    if(p->nread == p->nwrite)
80103547:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
8010354d:	31 c9                	xor    %ecx,%ecx
8010354f:	eb 15                	jmp    80103566 <piperead+0xb6>
80103551:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103558:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
8010355e:	3b 83 38 02 00 00    	cmp    0x238(%ebx),%eax
80103564:	74 5a                	je     801035c0 <piperead+0x110>
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
80103566:	8d 70 01             	lea    0x1(%eax),%esi
80103569:	25 ff 01 00 00       	and    $0x1ff,%eax
8010356e:	89 b3 34 02 00 00    	mov    %esi,0x234(%ebx)
80103574:	0f b6 44 03 34       	movzbl 0x34(%ebx,%eax,1),%eax
80103579:	88 04 0f             	mov    %al,(%edi,%ecx,1)
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
8010357c:	83 c1 01             	add    $0x1,%ecx
8010357f:	39 4d 10             	cmp    %ecx,0x10(%ebp)
80103582:	75 d4                	jne    80103558 <piperead+0xa8>
    if(p->nread == p->nwrite)
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
80103584:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
8010358a:	83 ec 0c             	sub    $0xc,%esp
8010358d:	50                   	push   %eax
8010358e:	e8 6d 09 00 00       	call   80103f00 <wakeup>
  release(&p->lock);
80103593:	89 1c 24             	mov    %ebx,(%esp)
80103596:	e8 45 0e 00 00       	call   801043e0 <release>
  return i;
8010359b:	8b 45 10             	mov    0x10(%ebp),%eax
8010359e:	83 c4 10             	add    $0x10,%esp
}
801035a1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801035a4:	5b                   	pop    %ebx
801035a5:	5e                   	pop    %esi
801035a6:	5f                   	pop    %edi
801035a7:	5d                   	pop    %ebp
801035a8:	c3                   	ret    
801035a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
801035b0:	c7 45 10 00 00 00 00 	movl   $0x0,0x10(%ebp)
801035b7:	eb cb                	jmp    80103584 <piperead+0xd4>
801035b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801035c0:	89 4d 10             	mov    %ecx,0x10(%ebp)
801035c3:	eb bf                	jmp    80103584 <piperead+0xd4>
801035c5:	66 90                	xchg   %ax,%ax
801035c7:	66 90                	xchg   %ax,%ax
801035c9:	66 90                	xchg   %ax,%ax
801035cb:	66 90                	xchg   %ax,%ax
801035cd:	66 90                	xchg   %ax,%ax
801035cf:	90                   	nop

801035d0 <allocproc>:
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
801035d0:	55                   	push   %ebp
801035d1:	89 e5                	mov    %esp,%ebp
801035d3:	53                   	push   %ebx
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801035d4:	bb 54 2d 11 80       	mov    $0x80112d54,%ebx
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
801035d9:	83 ec 10             	sub    $0x10,%esp
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);
801035dc:	68 20 2d 11 80       	push   $0x80112d20
801035e1:	e8 da 0c 00 00       	call   801042c0 <acquire>
801035e6:	83 c4 10             	add    $0x10,%esp
801035e9:	eb 10                	jmp    801035fb <allocproc+0x2b>
801035eb:	90                   	nop
801035ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801035f0:	83 eb 80             	sub    $0xffffff80,%ebx
801035f3:	81 fb 54 4d 11 80    	cmp    $0x80114d54,%ebx
801035f9:	74 75                	je     80103670 <allocproc+0xa0>
    if(p->state == UNUSED)
801035fb:	8b 43 0c             	mov    0xc(%ebx),%eax
801035fe:	85 c0                	test   %eax,%eax
80103600:	75 ee                	jne    801035f0 <allocproc+0x20>
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
80103602:	a1 04 a0 10 80       	mov    0x8010a004,%eax

  release(&ptable.lock);
80103607:	83 ec 0c             	sub    $0xc,%esp

  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
8010360a:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
  p->pid = nextpid++;

  release(&ptable.lock);
80103611:	68 20 2d 11 80       	push   $0x80112d20
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
80103616:	8d 50 01             	lea    0x1(%eax),%edx
80103619:	89 43 10             	mov    %eax,0x10(%ebx)
8010361c:	89 15 04 a0 10 80    	mov    %edx,0x8010a004

  release(&ptable.lock);
80103622:	e8 b9 0d 00 00       	call   801043e0 <release>

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
80103627:	e8 84 ee ff ff       	call   801024b0 <kalloc>
8010362c:	83 c4 10             	add    $0x10,%esp
8010362f:	85 c0                	test   %eax,%eax
80103631:	89 43 08             	mov    %eax,0x8(%ebx)
80103634:	74 51                	je     80103687 <allocproc+0xb7>
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
80103636:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
8010363c:	83 ec 04             	sub    $0x4,%esp
  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
8010363f:	05 9c 0f 00 00       	add    $0xf9c,%eax
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
80103644:	89 53 18             	mov    %edx,0x18(%ebx)
  p->tf = (struct trapframe*)sp;

  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;
80103647:	c7 40 14 c2 56 10 80 	movl   $0x801056c2,0x14(%eax)

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
8010364e:	6a 14                	push   $0x14
80103650:	6a 00                	push   $0x0
80103652:	50                   	push   %eax
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
80103653:	89 43 1c             	mov    %eax,0x1c(%ebx)
  memset(p->context, 0, sizeof *p->context);
80103656:	e8 d5 0d 00 00       	call   80104430 <memset>
  p->context->eip = (uint)forkret;
8010365b:	8b 43 1c             	mov    0x1c(%ebx),%eax

  return p;
8010365e:	83 c4 10             	add    $0x10,%esp
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;
80103661:	c7 40 10 90 36 10 80 	movl   $0x80103690,0x10(%eax)

  return p;
80103668:	89 d8                	mov    %ebx,%eax
}
8010366a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010366d:	c9                   	leave  
8010366e:	c3                   	ret    
8010366f:	90                   	nop

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == UNUSED)
      goto found;

  release(&ptable.lock);
80103670:	83 ec 0c             	sub    $0xc,%esp
80103673:	68 20 2d 11 80       	push   $0x80112d20
80103678:	e8 63 0d 00 00       	call   801043e0 <release>
  return 0;
8010367d:	83 c4 10             	add    $0x10,%esp
80103680:	31 c0                	xor    %eax,%eax
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;

  return p;
}
80103682:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103685:	c9                   	leave  
80103686:	c3                   	ret    

  release(&ptable.lock);

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
    p->state = UNUSED;
80103687:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return 0;
8010368e:	eb da                	jmp    8010366a <allocproc+0x9a>

80103690 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
80103690:	55                   	push   %ebp
80103691:	89 e5                	mov    %esp,%ebp
80103693:	83 ec 14             	sub    $0x14,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
80103696:	68 20 2d 11 80       	push   $0x80112d20
8010369b:	e8 40 0d 00 00       	call   801043e0 <release>

  if (first) {
801036a0:	a1 00 a0 10 80       	mov    0x8010a000,%eax
801036a5:	83 c4 10             	add    $0x10,%esp
801036a8:	85 c0                	test   %eax,%eax
801036aa:	75 04                	jne    801036b0 <forkret+0x20>
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}
801036ac:	c9                   	leave  
801036ad:	c3                   	ret    
801036ae:	66 90                	xchg   %ax,%ax
  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
    iinit(ROOTDEV);
801036b0:	83 ec 0c             	sub    $0xc,%esp

  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
801036b3:	c7 05 00 a0 10 80 00 	movl   $0x0,0x8010a000
801036ba:	00 00 00 
    iinit(ROOTDEV);
801036bd:	6a 01                	push   $0x1
801036bf:	e8 cc dd ff ff       	call   80101490 <iinit>
    initlog(ROOTDEV);
801036c4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801036cb:	e8 00 f4 ff ff       	call   80102ad0 <initlog>
801036d0:	83 c4 10             	add    $0x10,%esp
  }

  // Return to "caller", actually trapret (see allocproc).
}
801036d3:	c9                   	leave  
801036d4:	c3                   	ret    
801036d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801036d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801036e0 <pinit>:

static void wakeup1(void *chan);

void
pinit(void)
{
801036e0:	55                   	push   %ebp
801036e1:	89 e5                	mov    %esp,%ebp
801036e3:	83 ec 10             	sub    $0x10,%esp
  initlock(&ptable.lock, "ptable");
801036e6:	68 35 76 10 80       	push   $0x80107635
801036eb:	68 20 2d 11 80       	push   $0x80112d20
801036f0:	e8 cb 0a 00 00       	call   801041c0 <initlock>
}
801036f5:	83 c4 10             	add    $0x10,%esp
801036f8:	c9                   	leave  
801036f9:	c3                   	ret    
801036fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103700 <mycpu>:

// Must be called with interrupts disabled to avoid the caller being
// rescheduled between reading lapicid and running through the loop.
struct cpu*
mycpu(void)
{
80103700:	55                   	push   %ebp
80103701:	89 e5                	mov    %esp,%ebp
80103703:	56                   	push   %esi
80103704:	53                   	push   %ebx

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103705:	9c                   	pushf  
80103706:	58                   	pop    %eax
  int apicid, i;
  
  if(readeflags()&FL_IF)
80103707:	f6 c4 02             	test   $0x2,%ah
8010370a:	75 5b                	jne    80103767 <mycpu+0x67>
    panic("mycpu called with interrupts enabled\n");
  
  apicid = lapicid();
8010370c:	e8 ff ef ff ff       	call   80102710 <lapicid>
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
80103711:	8b 35 00 2d 11 80    	mov    0x80112d00,%esi
80103717:	85 f6                	test   %esi,%esi
80103719:	7e 3f                	jle    8010375a <mycpu+0x5a>
    if (cpus[i].apicid == apicid)
8010371b:	0f b6 15 80 27 11 80 	movzbl 0x80112780,%edx
80103722:	39 d0                	cmp    %edx,%eax
80103724:	74 30                	je     80103756 <mycpu+0x56>
80103726:	b9 30 28 11 80       	mov    $0x80112830,%ecx
8010372b:	31 d2                	xor    %edx,%edx
8010372d:	8d 76 00             	lea    0x0(%esi),%esi
    panic("mycpu called with interrupts enabled\n");
  
  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
80103730:	83 c2 01             	add    $0x1,%edx
80103733:	39 f2                	cmp    %esi,%edx
80103735:	74 23                	je     8010375a <mycpu+0x5a>
    if (cpus[i].apicid == apicid)
80103737:	0f b6 19             	movzbl (%ecx),%ebx
8010373a:	81 c1 b0 00 00 00    	add    $0xb0,%ecx
80103740:	39 d8                	cmp    %ebx,%eax
80103742:	75 ec                	jne    80103730 <mycpu+0x30>
      return &cpus[i];
80103744:	69 c2 b0 00 00 00    	imul   $0xb0,%edx,%eax
  }
  panic("unknown apicid\n");
}
8010374a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010374d:	5b                   	pop    %ebx
  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
    if (cpus[i].apicid == apicid)
      return &cpus[i];
8010374e:	05 80 27 11 80       	add    $0x80112780,%eax
  }
  panic("unknown apicid\n");
}
80103753:	5e                   	pop    %esi
80103754:	5d                   	pop    %ebp
80103755:	c3                   	ret    
    panic("mycpu called with interrupts enabled\n");
  
  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
80103756:	31 d2                	xor    %edx,%edx
80103758:	eb ea                	jmp    80103744 <mycpu+0x44>
    if (cpus[i].apicid == apicid)
      return &cpus[i];
  }
  panic("unknown apicid\n");
8010375a:	83 ec 0c             	sub    $0xc,%esp
8010375d:	68 3c 76 10 80       	push   $0x8010763c
80103762:	e8 09 cc ff ff       	call   80100370 <panic>
mycpu(void)
{
  int apicid, i;
  
  if(readeflags()&FL_IF)
    panic("mycpu called with interrupts enabled\n");
80103767:	83 ec 0c             	sub    $0xc,%esp
8010376a:	68 18 77 10 80       	push   $0x80107718
8010376f:	e8 fc cb ff ff       	call   80100370 <panic>
80103774:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010377a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103780 <cpuid>:
  initlock(&ptable.lock, "ptable");
}

// Must be called with interrupts disabled
int
cpuid() {
80103780:	55                   	push   %ebp
80103781:	89 e5                	mov    %esp,%ebp
80103783:	83 ec 08             	sub    $0x8,%esp
  return mycpu()-cpus;
80103786:	e8 75 ff ff ff       	call   80103700 <mycpu>
8010378b:	2d 80 27 11 80       	sub    $0x80112780,%eax
}
80103790:	c9                   	leave  
}

// Must be called with interrupts disabled
int
cpuid() {
  return mycpu()-cpus;
80103791:	c1 f8 04             	sar    $0x4,%eax
80103794:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
}
8010379a:	c3                   	ret    
8010379b:	90                   	nop
8010379c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801037a0 <myproc>:
}

// Disable interrupts so that we are not rescheduled
// while reading proc from the cpu structure
struct proc*
myproc(void) {
801037a0:	55                   	push   %ebp
801037a1:	89 e5                	mov    %esp,%ebp
801037a3:	53                   	push   %ebx
801037a4:	83 ec 04             	sub    $0x4,%esp
  struct cpu *c;
  struct proc *p;
  pushcli();
801037a7:	e8 d4 0a 00 00       	call   80104280 <pushcli>
  c = mycpu();
801037ac:	e8 4f ff ff ff       	call   80103700 <mycpu>
  p = c->proc;
801037b1:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
801037b7:	e8 b4 0b 00 00       	call   80104370 <popcli>
  return p;
}
801037bc:	83 c4 04             	add    $0x4,%esp
801037bf:	89 d8                	mov    %ebx,%eax
801037c1:	5b                   	pop    %ebx
801037c2:	5d                   	pop    %ebp
801037c3:	c3                   	ret    
801037c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801037ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801037d0 <userinit>:

//PAGEBREAK: 32
// Set up first user process.
void
userinit(void)
{
801037d0:	55                   	push   %ebp
801037d1:	89 e5                	mov    %esp,%ebp
801037d3:	53                   	push   %ebx
801037d4:	83 ec 04             	sub    $0x4,%esp
  struct proc *p;
  extern char _binary_initcode_start[], _binary_initcode_size[];

  p = allocproc();
801037d7:	e8 f4 fd ff ff       	call   801035d0 <allocproc>
801037dc:	89 c3                	mov    %eax,%ebx
  
  initproc = p;
801037de:	a3 b8 a5 10 80       	mov    %eax,0x8010a5b8
  if((p->pgdir = setupkvm()) == 0)
801037e3:	e8 38 35 00 00       	call   80106d20 <setupkvm>
801037e8:	85 c0                	test   %eax,%eax
801037ea:	89 43 04             	mov    %eax,0x4(%ebx)
801037ed:	0f 84 bd 00 00 00    	je     801038b0 <userinit+0xe0>
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
801037f3:	83 ec 04             	sub    $0x4,%esp
801037f6:	68 2c 00 00 00       	push   $0x2c
801037fb:	68 60 a4 10 80       	push   $0x8010a460
80103800:	50                   	push   %eax
80103801:	e8 2a 32 00 00       	call   80106a30 <inituvm>
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
80103806:	83 c4 0c             	add    $0xc,%esp
  
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
80103809:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
8010380f:	6a 4c                	push   $0x4c
80103811:	6a 00                	push   $0x0
80103813:	ff 73 18             	pushl  0x18(%ebx)
80103816:	e8 15 0c 00 00       	call   80104430 <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010381b:	8b 43 18             	mov    0x18(%ebx),%eax
8010381e:	ba 1b 00 00 00       	mov    $0x1b,%edx
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
80103823:	b9 23 00 00 00       	mov    $0x23,%ecx
  p->tf->ss = p->tf->ds;
  p->tf->eflags = FL_IF;
  p->tf->esp = PGSIZE;
  p->tf->eip = 0;  // beginning of initcode.S

  safestrcpy(p->name, "initcode", sizeof(p->name));
80103828:	83 c4 0c             	add    $0xc,%esp
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010382b:	66 89 50 3c          	mov    %dx,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
8010382f:	8b 43 18             	mov    0x18(%ebx),%eax
80103832:	66 89 48 2c          	mov    %cx,0x2c(%eax)
  p->tf->es = p->tf->ds;
80103836:	8b 43 18             	mov    0x18(%ebx),%eax
80103839:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
8010383d:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
80103841:	8b 43 18             	mov    0x18(%ebx),%eax
80103844:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103848:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
8010384c:	8b 43 18             	mov    0x18(%ebx),%eax
8010384f:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
80103856:	8b 43 18             	mov    0x18(%ebx),%eax
80103859:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
80103860:	8b 43 18             	mov    0x18(%ebx),%eax
80103863:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)

  safestrcpy(p->name, "initcode", sizeof(p->name));
8010386a:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010386d:	6a 10                	push   $0x10
8010386f:	68 65 76 10 80       	push   $0x80107665
80103874:	50                   	push   %eax
80103875:	e8 b6 0d 00 00       	call   80104630 <safestrcpy>
  p->cwd = namei("/");
8010387a:	c7 04 24 6e 76 10 80 	movl   $0x8010766e,(%esp)
80103881:	e8 5a e6 ff ff       	call   80101ee0 <namei>
80103886:	89 43 68             	mov    %eax,0x68(%ebx)

  // this assignment to p->state lets other cores
  // run this process. the acquire forces the above
  // writes to be visible, and the lock is also needed
  // because the assignment might not be atomic.
  acquire(&ptable.lock);
80103889:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103890:	e8 2b 0a 00 00       	call   801042c0 <acquire>

  p->state = RUNNABLE;
80103895:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)

  release(&ptable.lock);
8010389c:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
801038a3:	e8 38 0b 00 00       	call   801043e0 <release>
}
801038a8:	83 c4 10             	add    $0x10,%esp
801038ab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801038ae:	c9                   	leave  
801038af:	c3                   	ret    

  p = allocproc();
  
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
801038b0:	83 ec 0c             	sub    $0xc,%esp
801038b3:	68 4c 76 10 80       	push   $0x8010764c
801038b8:	e8 b3 ca ff ff       	call   80100370 <panic>
801038bd:	8d 76 00             	lea    0x0(%esi),%esi

801038c0 <growproc>:

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
801038c0:	55                   	push   %ebp
801038c1:	89 e5                	mov    %esp,%ebp
801038c3:	56                   	push   %esi
801038c4:	53                   	push   %ebx
801038c5:	8b 75 08             	mov    0x8(%ebp),%esi
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
801038c8:	e8 b3 09 00 00       	call   80104280 <pushcli>
  c = mycpu();
801038cd:	e8 2e fe ff ff       	call   80103700 <mycpu>
  p = c->proc;
801038d2:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
801038d8:	e8 93 0a 00 00       	call   80104370 <popcli>
{
  uint sz;
  struct proc *curproc = myproc();

  sz = curproc->sz;
  if(n > 0){
801038dd:	83 fe 00             	cmp    $0x0,%esi
growproc(int n)
{
  uint sz;
  struct proc *curproc = myproc();

  sz = curproc->sz;
801038e0:	8b 03                	mov    (%ebx),%eax
  if(n > 0){
801038e2:	7e 34                	jle    80103918 <growproc+0x58>
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
801038e4:	83 ec 04             	sub    $0x4,%esp
801038e7:	01 c6                	add    %eax,%esi
801038e9:	56                   	push   %esi
801038ea:	50                   	push   %eax
801038eb:	ff 73 04             	pushl  0x4(%ebx)
801038ee:	e8 7d 32 00 00       	call   80106b70 <allocuvm>
801038f3:	83 c4 10             	add    $0x10,%esp
801038f6:	85 c0                	test   %eax,%eax
801038f8:	74 36                	je     80103930 <growproc+0x70>
  } else if(n < 0){
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  curproc->sz = sz;
  switchuvm(curproc);
801038fa:	83 ec 0c             	sub    $0xc,%esp
      return -1;
  } else if(n < 0){
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  curproc->sz = sz;
801038fd:	89 03                	mov    %eax,(%ebx)
  switchuvm(curproc);
801038ff:	53                   	push   %ebx
80103900:	e8 1b 30 00 00       	call   80106920 <switchuvm>
  return 0;
80103905:	83 c4 10             	add    $0x10,%esp
80103908:	31 c0                	xor    %eax,%eax
}
8010390a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010390d:	5b                   	pop    %ebx
8010390e:	5e                   	pop    %esi
8010390f:	5d                   	pop    %ebp
80103910:	c3                   	ret    
80103911:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  sz = curproc->sz;
  if(n > 0){
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  } else if(n < 0){
80103918:	74 e0                	je     801038fa <growproc+0x3a>
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
8010391a:	83 ec 04             	sub    $0x4,%esp
8010391d:	01 c6                	add    %eax,%esi
8010391f:	56                   	push   %esi
80103920:	50                   	push   %eax
80103921:	ff 73 04             	pushl  0x4(%ebx)
80103924:	e8 47 33 00 00       	call   80106c70 <deallocuvm>
80103929:	83 c4 10             	add    $0x10,%esp
8010392c:	85 c0                	test   %eax,%eax
8010392e:	75 ca                	jne    801038fa <growproc+0x3a>
  struct proc *curproc = myproc();

  sz = curproc->sz;
  if(n > 0){
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
80103930:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103935:	eb d3                	jmp    8010390a <growproc+0x4a>
80103937:	89 f6                	mov    %esi,%esi
80103939:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103940 <fork>:
// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.
int
fork(void)
{
80103940:	55                   	push   %ebp
80103941:	89 e5                	mov    %esp,%ebp
80103943:	57                   	push   %edi
80103944:	56                   	push   %esi
80103945:	53                   	push   %ebx
80103946:	83 ec 1c             	sub    $0x1c,%esp
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103949:	e8 32 09 00 00       	call   80104280 <pushcli>
  c = mycpu();
8010394e:	e8 ad fd ff ff       	call   80103700 <mycpu>
  p = c->proc;
80103953:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103959:	e8 12 0a 00 00       	call   80104370 <popcli>
  int i, pid;
  struct proc *np;
  struct proc *curproc = myproc();

  // Allocate process.
  if((np = allocproc()) == 0){
8010395e:	e8 6d fc ff ff       	call   801035d0 <allocproc>
80103963:	85 c0                	test   %eax,%eax
80103965:	89 c7                	mov    %eax,%edi
80103967:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010396a:	0f 84 bd 00 00 00    	je     80103a2d <fork+0xed>
    return -1;
  }

  // Copy process state from proc.
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz, curproc->numPages)) == 0){
80103970:	83 ec 04             	sub    $0x4,%esp
80103973:	ff 73 7c             	pushl  0x7c(%ebx)
80103976:	ff 33                	pushl  (%ebx)
80103978:	ff 73 04             	pushl  0x4(%ebx)
8010397b:	e8 70 34 00 00       	call   80106df0 <copyuvm>
80103980:	83 c4 10             	add    $0x10,%esp
80103983:	85 c0                	test   %eax,%eax
80103985:	89 47 04             	mov    %eax,0x4(%edi)
80103988:	0f 84 a6 00 00 00    	je     80103a34 <fork+0xf4>
    kfree(np->kstack);
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
  np->sz = curproc->sz;
8010398e:	8b 03                	mov    (%ebx),%eax
80103990:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103993:	89 01                	mov    %eax,(%ecx)
  np->parent = curproc;
80103995:	89 59 14             	mov    %ebx,0x14(%ecx)
  *np->tf = *curproc->tf;
80103998:	89 c8                	mov    %ecx,%eax
8010399a:	8b 79 18             	mov    0x18(%ecx),%edi
8010399d:	8b 73 18             	mov    0x18(%ebx),%esi
801039a0:	b9 13 00 00 00       	mov    $0x13,%ecx
801039a5:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
801039a7:	31 f6                	xor    %esi,%esi
  np->sz = curproc->sz;
  np->parent = curproc;
  *np->tf = *curproc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;
801039a9:	8b 40 18             	mov    0x18(%eax),%eax
801039ac:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
801039b3:	90                   	nop
801039b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  for(i = 0; i < NOFILE; i++)
    if(curproc->ofile[i])
801039b8:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
801039bc:	85 c0                	test   %eax,%eax
801039be:	74 13                	je     801039d3 <fork+0x93>
      np->ofile[i] = filedup(curproc->ofile[i]);
801039c0:	83 ec 0c             	sub    $0xc,%esp
801039c3:	50                   	push   %eax
801039c4:	e8 37 d4 ff ff       	call   80100e00 <filedup>
801039c9:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801039cc:	83 c4 10             	add    $0x10,%esp
801039cf:	89 44 b2 28          	mov    %eax,0x28(%edx,%esi,4)
  *np->tf = *curproc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
801039d3:	83 c6 01             	add    $0x1,%esi
801039d6:	83 fe 10             	cmp    $0x10,%esi
801039d9:	75 dd                	jne    801039b8 <fork+0x78>
    if(curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);
801039db:	83 ec 0c             	sub    $0xc,%esp
801039de:	ff 73 68             	pushl  0x68(%ebx)

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
801039e1:	83 c3 6c             	add    $0x6c,%ebx
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
    if(curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);
801039e4:	e8 77 dc ff ff       	call   80101660 <idup>
801039e9:	8b 7d e4             	mov    -0x1c(%ebp),%edi

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
801039ec:	83 c4 0c             	add    $0xc,%esp
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
    if(curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);
801039ef:	89 47 68             	mov    %eax,0x68(%edi)

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
801039f2:	8d 47 6c             	lea    0x6c(%edi),%eax
801039f5:	6a 10                	push   $0x10
801039f7:	53                   	push   %ebx
801039f8:	50                   	push   %eax
801039f9:	e8 32 0c 00 00       	call   80104630 <safestrcpy>

  pid = np->pid;
801039fe:	8b 5f 10             	mov    0x10(%edi),%ebx

  acquire(&ptable.lock);
80103a01:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103a08:	e8 b3 08 00 00       	call   801042c0 <acquire>

  np->state = RUNNABLE;
80103a0d:	c7 47 0c 03 00 00 00 	movl   $0x3,0xc(%edi)

  release(&ptable.lock);
80103a14:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103a1b:	e8 c0 09 00 00       	call   801043e0 <release>

  return pid;
80103a20:	83 c4 10             	add    $0x10,%esp
80103a23:	89 d8                	mov    %ebx,%eax
}
80103a25:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103a28:	5b                   	pop    %ebx
80103a29:	5e                   	pop    %esi
80103a2a:	5f                   	pop    %edi
80103a2b:	5d                   	pop    %ebp
80103a2c:	c3                   	ret    
  struct proc *np;
  struct proc *curproc = myproc();

  // Allocate process.
  if((np = allocproc()) == 0){
    return -1;
80103a2d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103a32:	eb f1                	jmp    80103a25 <fork+0xe5>
  }

  // Copy process state from proc.
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz, curproc->numPages)) == 0){
    kfree(np->kstack);
80103a34:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80103a37:	83 ec 0c             	sub    $0xc,%esp
80103a3a:	ff 77 08             	pushl  0x8(%edi)
80103a3d:	e8 be e8 ff ff       	call   80102300 <kfree>
    np->kstack = 0;
80103a42:	c7 47 08 00 00 00 00 	movl   $0x0,0x8(%edi)
    np->state = UNUSED;
80103a49:	c7 47 0c 00 00 00 00 	movl   $0x0,0xc(%edi)
    return -1;
80103a50:	83 c4 10             	add    $0x10,%esp
80103a53:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103a58:	eb cb                	jmp    80103a25 <fork+0xe5>
80103a5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103a60 <scheduler>:
//  - swtch to start running that process
//  - eventually that process transfers control
//      via swtch back to the scheduler.
void
scheduler(void)
{
80103a60:	55                   	push   %ebp
80103a61:	89 e5                	mov    %esp,%ebp
80103a63:	57                   	push   %edi
80103a64:	56                   	push   %esi
80103a65:	53                   	push   %ebx
80103a66:	83 ec 0c             	sub    $0xc,%esp
  struct proc *p;
  struct cpu *c = mycpu();
80103a69:	e8 92 fc ff ff       	call   80103700 <mycpu>
80103a6e:	8d 78 04             	lea    0x4(%eax),%edi
80103a71:	89 c6                	mov    %eax,%esi
  c->proc = 0;
80103a73:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
80103a7a:	00 00 00 
80103a7d:	8d 76 00             	lea    0x0(%esi),%esi
}

static inline void
sti(void)
{
  asm volatile("sti");
80103a80:	fb                   	sti    
  for(;;){
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
80103a81:	83 ec 0c             	sub    $0xc,%esp
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103a84:	bb 54 2d 11 80       	mov    $0x80112d54,%ebx
  for(;;){
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
80103a89:	68 20 2d 11 80       	push   $0x80112d20
80103a8e:	e8 2d 08 00 00       	call   801042c0 <acquire>
80103a93:	83 c4 10             	add    $0x10,%esp
80103a96:	eb 13                	jmp    80103aab <scheduler+0x4b>
80103a98:	90                   	nop
80103a99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103aa0:	83 eb 80             	sub    $0xffffff80,%ebx
80103aa3:	81 fb 54 4d 11 80    	cmp    $0x80114d54,%ebx
80103aa9:	74 45                	je     80103af0 <scheduler+0x90>
      if(p->state != RUNNABLE)
80103aab:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
80103aaf:	75 ef                	jne    80103aa0 <scheduler+0x40>

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      c->proc = p;
      switchuvm(p);
80103ab1:	83 ec 0c             	sub    $0xc,%esp
        continue;

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      c->proc = p;
80103ab4:	89 9e ac 00 00 00    	mov    %ebx,0xac(%esi)
      switchuvm(p);
80103aba:	53                   	push   %ebx
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103abb:	83 eb 80             	sub    $0xffffff80,%ebx

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      c->proc = p;
      switchuvm(p);
80103abe:	e8 5d 2e 00 00       	call   80106920 <switchuvm>
      p->state = RUNNING;

      swtch(&(c->scheduler), p->context);
80103ac3:	58                   	pop    %eax
80103ac4:	5a                   	pop    %edx
80103ac5:	ff 73 9c             	pushl  -0x64(%ebx)
80103ac8:	57                   	push   %edi
      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      c->proc = p;
      switchuvm(p);
      p->state = RUNNING;
80103ac9:	c7 43 8c 04 00 00 00 	movl   $0x4,-0x74(%ebx)

      swtch(&(c->scheduler), p->context);
80103ad0:	e8 b6 0b 00 00       	call   8010468b <swtch>
      switchkvm();
80103ad5:	e8 26 2e 00 00       	call   80106900 <switchkvm>

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      c->proc = 0;
80103ada:	83 c4 10             	add    $0x10,%esp
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103add:	81 fb 54 4d 11 80    	cmp    $0x80114d54,%ebx
      swtch(&(c->scheduler), p->context);
      switchkvm();

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      c->proc = 0;
80103ae3:	c7 86 ac 00 00 00 00 	movl   $0x0,0xac(%esi)
80103aea:	00 00 00 
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103aed:	75 bc                	jne    80103aab <scheduler+0x4b>
80103aef:	90                   	nop

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      c->proc = 0;
    }
    release(&ptable.lock);
80103af0:	83 ec 0c             	sub    $0xc,%esp
80103af3:	68 20 2d 11 80       	push   $0x80112d20
80103af8:	e8 e3 08 00 00       	call   801043e0 <release>

  }
80103afd:	83 c4 10             	add    $0x10,%esp
80103b00:	e9 7b ff ff ff       	jmp    80103a80 <scheduler+0x20>
80103b05:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103b09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103b10 <sched>:
// be proc->intena and proc->ncli, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
80103b10:	55                   	push   %ebp
80103b11:	89 e5                	mov    %esp,%ebp
80103b13:	56                   	push   %esi
80103b14:	53                   	push   %ebx
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103b15:	e8 66 07 00 00       	call   80104280 <pushcli>
  c = mycpu();
80103b1a:	e8 e1 fb ff ff       	call   80103700 <mycpu>
  p = c->proc;
80103b1f:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103b25:	e8 46 08 00 00       	call   80104370 <popcli>
sched(void)
{
  int intena;
  struct proc *p = myproc();

  if(!holding(&ptable.lock))
80103b2a:	83 ec 0c             	sub    $0xc,%esp
80103b2d:	68 20 2d 11 80       	push   $0x80112d20
80103b32:	e8 09 07 00 00       	call   80104240 <holding>
80103b37:	83 c4 10             	add    $0x10,%esp
80103b3a:	85 c0                	test   %eax,%eax
80103b3c:	74 4f                	je     80103b8d <sched+0x7d>
    panic("sched ptable.lock");
  if(mycpu()->ncli != 1)
80103b3e:	e8 bd fb ff ff       	call   80103700 <mycpu>
80103b43:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
80103b4a:	75 68                	jne    80103bb4 <sched+0xa4>
    panic("sched locks");
  if(p->state == RUNNING)
80103b4c:	83 7b 0c 04          	cmpl   $0x4,0xc(%ebx)
80103b50:	74 55                	je     80103ba7 <sched+0x97>

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103b52:	9c                   	pushf  
80103b53:	58                   	pop    %eax
    panic("sched running");
  if(readeflags()&FL_IF)
80103b54:	f6 c4 02             	test   $0x2,%ah
80103b57:	75 41                	jne    80103b9a <sched+0x8a>
    panic("sched interruptible");
  intena = mycpu()->intena;
80103b59:	e8 a2 fb ff ff       	call   80103700 <mycpu>
  swtch(&p->context, mycpu()->scheduler);
80103b5e:	83 c3 1c             	add    $0x1c,%ebx
    panic("sched locks");
  if(p->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = mycpu()->intena;
80103b61:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
  swtch(&p->context, mycpu()->scheduler);
80103b67:	e8 94 fb ff ff       	call   80103700 <mycpu>
80103b6c:	83 ec 08             	sub    $0x8,%esp
80103b6f:	ff 70 04             	pushl  0x4(%eax)
80103b72:	53                   	push   %ebx
80103b73:	e8 13 0b 00 00       	call   8010468b <swtch>
  mycpu()->intena = intena;
80103b78:	e8 83 fb ff ff       	call   80103700 <mycpu>
}
80103b7d:	83 c4 10             	add    $0x10,%esp
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = mycpu()->intena;
  swtch(&p->context, mycpu()->scheduler);
  mycpu()->intena = intena;
80103b80:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
}
80103b86:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103b89:	5b                   	pop    %ebx
80103b8a:	5e                   	pop    %esi
80103b8b:	5d                   	pop    %ebp
80103b8c:	c3                   	ret    
{
  int intena;
  struct proc *p = myproc();

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
80103b8d:	83 ec 0c             	sub    $0xc,%esp
80103b90:	68 70 76 10 80       	push   $0x80107670
80103b95:	e8 d6 c7 ff ff       	call   80100370 <panic>
  if(mycpu()->ncli != 1)
    panic("sched locks");
  if(p->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
80103b9a:	83 ec 0c             	sub    $0xc,%esp
80103b9d:	68 9c 76 10 80       	push   $0x8010769c
80103ba2:	e8 c9 c7 ff ff       	call   80100370 <panic>
  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(mycpu()->ncli != 1)
    panic("sched locks");
  if(p->state == RUNNING)
    panic("sched running");
80103ba7:	83 ec 0c             	sub    $0xc,%esp
80103baa:	68 8e 76 10 80       	push   $0x8010768e
80103baf:	e8 bc c7 ff ff       	call   80100370 <panic>
  struct proc *p = myproc();

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(mycpu()->ncli != 1)
    panic("sched locks");
80103bb4:	83 ec 0c             	sub    $0xc,%esp
80103bb7:	68 82 76 10 80       	push   $0x80107682
80103bbc:	e8 af c7 ff ff       	call   80100370 <panic>
80103bc1:	eb 0d                	jmp    80103bd0 <exit>
80103bc3:	90                   	nop
80103bc4:	90                   	nop
80103bc5:	90                   	nop
80103bc6:	90                   	nop
80103bc7:	90                   	nop
80103bc8:	90                   	nop
80103bc9:	90                   	nop
80103bca:	90                   	nop
80103bcb:	90                   	nop
80103bcc:	90                   	nop
80103bcd:	90                   	nop
80103bce:	90                   	nop
80103bcf:	90                   	nop

80103bd0 <exit>:
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
void
exit(void)
{
80103bd0:	55                   	push   %ebp
80103bd1:	89 e5                	mov    %esp,%ebp
80103bd3:	57                   	push   %edi
80103bd4:	56                   	push   %esi
80103bd5:	53                   	push   %ebx
80103bd6:	83 ec 0c             	sub    $0xc,%esp
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103bd9:	e8 a2 06 00 00       	call   80104280 <pushcli>
  c = mycpu();
80103bde:	e8 1d fb ff ff       	call   80103700 <mycpu>
  p = c->proc;
80103be3:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103be9:	e8 82 07 00 00       	call   80104370 <popcli>
{
  struct proc *curproc = myproc();
  struct proc *p;
  int fd;

  if(curproc == initproc)
80103bee:	39 35 b8 a5 10 80    	cmp    %esi,0x8010a5b8
80103bf4:	8d 5e 28             	lea    0x28(%esi),%ebx
80103bf7:	8d 7e 68             	lea    0x68(%esi),%edi
80103bfa:	0f 84 e7 00 00 00    	je     80103ce7 <exit+0x117>
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd]){
80103c00:	8b 03                	mov    (%ebx),%eax
80103c02:	85 c0                	test   %eax,%eax
80103c04:	74 12                	je     80103c18 <exit+0x48>
      fileclose(curproc->ofile[fd]);
80103c06:	83 ec 0c             	sub    $0xc,%esp
80103c09:	50                   	push   %eax
80103c0a:	e8 41 d2 ff ff       	call   80100e50 <fileclose>
      curproc->ofile[fd] = 0;
80103c0f:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103c15:	83 c4 10             	add    $0x10,%esp
80103c18:	83 c3 04             	add    $0x4,%ebx

  if(curproc == initproc)
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
80103c1b:	39 df                	cmp    %ebx,%edi
80103c1d:	75 e1                	jne    80103c00 <exit+0x30>
      fileclose(curproc->ofile[fd]);
      curproc->ofile[fd] = 0;
    }
  }

  begin_op();
80103c1f:	e8 4c ef ff ff       	call   80102b70 <begin_op>
  iput(curproc->cwd);
80103c24:	83 ec 0c             	sub    $0xc,%esp
80103c27:	ff 76 68             	pushl  0x68(%esi)
80103c2a:	e8 91 db ff ff       	call   801017c0 <iput>
  end_op();
80103c2f:	e8 ac ef ff ff       	call   80102be0 <end_op>
  curproc->cwd = 0;
80103c34:	c7 46 68 00 00 00 00 	movl   $0x0,0x68(%esi)

  acquire(&ptable.lock);
80103c3b:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103c42:	e8 79 06 00 00       	call   801042c0 <acquire>

  // Parent might be sleeping in wait().
  wakeup1(curproc->parent);
80103c47:	8b 56 14             	mov    0x14(%esi),%edx
80103c4a:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103c4d:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
80103c52:	eb 0e                	jmp    80103c62 <exit+0x92>
80103c54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103c58:	83 e8 80             	sub    $0xffffff80,%eax
80103c5b:	3d 54 4d 11 80       	cmp    $0x80114d54,%eax
80103c60:	74 1c                	je     80103c7e <exit+0xae>
    if(p->state == SLEEPING && p->chan == chan)
80103c62:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103c66:	75 f0                	jne    80103c58 <exit+0x88>
80103c68:	3b 50 20             	cmp    0x20(%eax),%edx
80103c6b:	75 eb                	jne    80103c58 <exit+0x88>
      p->state = RUNNABLE;
80103c6d:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103c74:	83 e8 80             	sub    $0xffffff80,%eax
80103c77:	3d 54 4d 11 80       	cmp    $0x80114d54,%eax
80103c7c:	75 e4                	jne    80103c62 <exit+0x92>
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == curproc){
      p->parent = initproc;
80103c7e:	8b 0d b8 a5 10 80    	mov    0x8010a5b8,%ecx
80103c84:	ba 54 2d 11 80       	mov    $0x80112d54,%edx
80103c89:	eb 10                	jmp    80103c9b <exit+0xcb>
80103c8b:	90                   	nop
80103c8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  // Parent might be sleeping in wait().
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103c90:	83 ea 80             	sub    $0xffffff80,%edx
80103c93:	81 fa 54 4d 11 80    	cmp    $0x80114d54,%edx
80103c99:	74 33                	je     80103cce <exit+0xfe>
    if(p->parent == curproc){
80103c9b:	39 72 14             	cmp    %esi,0x14(%edx)
80103c9e:	75 f0                	jne    80103c90 <exit+0xc0>
      p->parent = initproc;
      if(p->state == ZOMBIE)
80103ca0:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == curproc){
      p->parent = initproc;
80103ca4:	89 4a 14             	mov    %ecx,0x14(%edx)
      if(p->state == ZOMBIE)
80103ca7:	75 e7                	jne    80103c90 <exit+0xc0>
80103ca9:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
80103cae:	eb 0a                	jmp    80103cba <exit+0xea>
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103cb0:	83 e8 80             	sub    $0xffffff80,%eax
80103cb3:	3d 54 4d 11 80       	cmp    $0x80114d54,%eax
80103cb8:	74 d6                	je     80103c90 <exit+0xc0>
    if(p->state == SLEEPING && p->chan == chan)
80103cba:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103cbe:	75 f0                	jne    80103cb0 <exit+0xe0>
80103cc0:	3b 48 20             	cmp    0x20(%eax),%ecx
80103cc3:	75 eb                	jne    80103cb0 <exit+0xe0>
      p->state = RUNNABLE;
80103cc5:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103ccc:	eb e2                	jmp    80103cb0 <exit+0xe0>
        wakeup1(initproc);
    }
  }

  // Jump into the scheduler, never to return.
  curproc->state = ZOMBIE;
80103cce:	c7 46 0c 05 00 00 00 	movl   $0x5,0xc(%esi)
  sched();
80103cd5:	e8 36 fe ff ff       	call   80103b10 <sched>
  panic("zombie exit");
80103cda:	83 ec 0c             	sub    $0xc,%esp
80103cdd:	68 bd 76 10 80       	push   $0x801076bd
80103ce2:	e8 89 c6 ff ff       	call   80100370 <panic>
  struct proc *curproc = myproc();
  struct proc *p;
  int fd;

  if(curproc == initproc)
    panic("init exiting");
80103ce7:	83 ec 0c             	sub    $0xc,%esp
80103cea:	68 b0 76 10 80       	push   $0x801076b0
80103cef:	e8 7c c6 ff ff       	call   80100370 <panic>
80103cf4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103cfa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103d00 <yield>:
}

// Give up the CPU for one scheduling round.
void
yield(void)
{
80103d00:	55                   	push   %ebp
80103d01:	89 e5                	mov    %esp,%ebp
80103d03:	53                   	push   %ebx
80103d04:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
80103d07:	68 20 2d 11 80       	push   $0x80112d20
80103d0c:	e8 af 05 00 00       	call   801042c0 <acquire>
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103d11:	e8 6a 05 00 00       	call   80104280 <pushcli>
  c = mycpu();
80103d16:	e8 e5 f9 ff ff       	call   80103700 <mycpu>
  p = c->proc;
80103d1b:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103d21:	e8 4a 06 00 00       	call   80104370 <popcli>
// Give up the CPU for one scheduling round.
void
yield(void)
{
  acquire(&ptable.lock);  //DOC: yieldlock
  myproc()->state = RUNNABLE;
80103d26:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  sched();
80103d2d:	e8 de fd ff ff       	call   80103b10 <sched>
  release(&ptable.lock);
80103d32:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103d39:	e8 a2 06 00 00       	call   801043e0 <release>
}
80103d3e:	83 c4 10             	add    $0x10,%esp
80103d41:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103d44:	c9                   	leave  
80103d45:	c3                   	ret    
80103d46:	8d 76 00             	lea    0x0(%esi),%esi
80103d49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103d50 <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
80103d50:	55                   	push   %ebp
80103d51:	89 e5                	mov    %esp,%ebp
80103d53:	57                   	push   %edi
80103d54:	56                   	push   %esi
80103d55:	53                   	push   %ebx
80103d56:	83 ec 0c             	sub    $0xc,%esp
80103d59:	8b 7d 08             	mov    0x8(%ebp),%edi
80103d5c:	8b 75 0c             	mov    0xc(%ebp),%esi
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103d5f:	e8 1c 05 00 00       	call   80104280 <pushcli>
  c = mycpu();
80103d64:	e8 97 f9 ff ff       	call   80103700 <mycpu>
  p = c->proc;
80103d69:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103d6f:	e8 fc 05 00 00       	call   80104370 <popcli>
void
sleep(void *chan, struct spinlock *lk)
{
  struct proc *p = myproc();
  
  if(p == 0)
80103d74:	85 db                	test   %ebx,%ebx
80103d76:	0f 84 87 00 00 00    	je     80103e03 <sleep+0xb3>
    panic("sleep");

  if(lk == 0)
80103d7c:	85 f6                	test   %esi,%esi
80103d7e:	74 76                	je     80103df6 <sleep+0xa6>
  // change p->state and then call sched.
  // Once we hold ptable.lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup runs with ptable.lock locked),
  // so it's okay to release lk.
  if(lk != &ptable.lock){  //DOC: sleeplock0
80103d80:	81 fe 20 2d 11 80    	cmp    $0x80112d20,%esi
80103d86:	74 50                	je     80103dd8 <sleep+0x88>
    acquire(&ptable.lock);  //DOC: sleeplock1
80103d88:	83 ec 0c             	sub    $0xc,%esp
80103d8b:	68 20 2d 11 80       	push   $0x80112d20
80103d90:	e8 2b 05 00 00       	call   801042c0 <acquire>
    release(lk);
80103d95:	89 34 24             	mov    %esi,(%esp)
80103d98:	e8 43 06 00 00       	call   801043e0 <release>
  }
  // Go to sleep.
  p->chan = chan;
80103d9d:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
80103da0:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)

  sched();
80103da7:	e8 64 fd ff ff       	call   80103b10 <sched>

  // Tidy up.
  p->chan = 0;
80103dac:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
80103db3:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103dba:	e8 21 06 00 00       	call   801043e0 <release>
    acquire(lk);
80103dbf:	89 75 08             	mov    %esi,0x8(%ebp)
80103dc2:	83 c4 10             	add    $0x10,%esp
  }
}
80103dc5:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103dc8:	5b                   	pop    %ebx
80103dc9:	5e                   	pop    %esi
80103dca:	5f                   	pop    %edi
80103dcb:	5d                   	pop    %ebp
  p->chan = 0;

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
80103dcc:	e9 ef 04 00 00       	jmp    801042c0 <acquire>
80103dd1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(lk != &ptable.lock){  //DOC: sleeplock0
    acquire(&ptable.lock);  //DOC: sleeplock1
    release(lk);
  }
  // Go to sleep.
  p->chan = chan;
80103dd8:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
80103ddb:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)

  sched();
80103de2:	e8 29 fd ff ff       	call   80103b10 <sched>

  // Tidy up.
  p->chan = 0;
80103de7:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
  }
}
80103dee:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103df1:	5b                   	pop    %ebx
80103df2:	5e                   	pop    %esi
80103df3:	5f                   	pop    %edi
80103df4:	5d                   	pop    %ebp
80103df5:	c3                   	ret    
  
  if(p == 0)
    panic("sleep");

  if(lk == 0)
    panic("sleep without lk");
80103df6:	83 ec 0c             	sub    $0xc,%esp
80103df9:	68 cf 76 10 80       	push   $0x801076cf
80103dfe:	e8 6d c5 ff ff       	call   80100370 <panic>
sleep(void *chan, struct spinlock *lk)
{
  struct proc *p = myproc();
  
  if(p == 0)
    panic("sleep");
80103e03:	83 ec 0c             	sub    $0xc,%esp
80103e06:	68 c9 76 10 80       	push   $0x801076c9
80103e0b:	e8 60 c5 ff ff       	call   80100370 <panic>

80103e10 <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(void)
{
80103e10:	55                   	push   %ebp
80103e11:	89 e5                	mov    %esp,%ebp
80103e13:	56                   	push   %esi
80103e14:	53                   	push   %ebx
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103e15:	e8 66 04 00 00       	call   80104280 <pushcli>
  c = mycpu();
80103e1a:	e8 e1 f8 ff ff       	call   80103700 <mycpu>
  p = c->proc;
80103e1f:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103e25:	e8 46 05 00 00       	call   80104370 <popcli>
{
  struct proc *p;
  int havekids, pid;
  struct proc *curproc = myproc();
  
  acquire(&ptable.lock);
80103e2a:	83 ec 0c             	sub    $0xc,%esp
80103e2d:	68 20 2d 11 80       	push   $0x80112d20
80103e32:	e8 89 04 00 00       	call   801042c0 <acquire>
80103e37:	83 c4 10             	add    $0x10,%esp
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
80103e3a:	31 c0                	xor    %eax,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103e3c:	bb 54 2d 11 80       	mov    $0x80112d54,%ebx
80103e41:	eb 10                	jmp    80103e53 <wait+0x43>
80103e43:	90                   	nop
80103e44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103e48:	83 eb 80             	sub    $0xffffff80,%ebx
80103e4b:	81 fb 54 4d 11 80    	cmp    $0x80114d54,%ebx
80103e51:	74 1d                	je     80103e70 <wait+0x60>
      if(p->parent != curproc)
80103e53:	39 73 14             	cmp    %esi,0x14(%ebx)
80103e56:	75 f0                	jne    80103e48 <wait+0x38>
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
80103e58:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80103e5c:	74 30                	je     80103e8e <wait+0x7e>
  
  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103e5e:	83 eb 80             	sub    $0xffffff80,%ebx
      if(p->parent != curproc)
        continue;
      havekids = 1;
80103e61:	b8 01 00 00 00       	mov    $0x1,%eax
  
  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103e66:	81 fb 54 4d 11 80    	cmp    $0x80114d54,%ebx
80103e6c:	75 e5                	jne    80103e53 <wait+0x43>
80103e6e:	66 90                	xchg   %ax,%ax
        return pid;
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
80103e70:	85 c0                	test   %eax,%eax
80103e72:	74 70                	je     80103ee4 <wait+0xd4>
80103e74:	8b 46 24             	mov    0x24(%esi),%eax
80103e77:	85 c0                	test   %eax,%eax
80103e79:	75 69                	jne    80103ee4 <wait+0xd4>
      release(&ptable.lock);
      return -1;
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
80103e7b:	83 ec 08             	sub    $0x8,%esp
80103e7e:	68 20 2d 11 80       	push   $0x80112d20
80103e83:	56                   	push   %esi
80103e84:	e8 c7 fe ff ff       	call   80103d50 <sleep>
  }
80103e89:	83 c4 10             	add    $0x10,%esp
80103e8c:	eb ac                	jmp    80103e3a <wait+0x2a>
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
80103e8e:	83 ec 0c             	sub    $0xc,%esp
80103e91:	ff 73 08             	pushl  0x8(%ebx)
      if(p->parent != curproc)
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
80103e94:	8b 73 10             	mov    0x10(%ebx),%esi
        kfree(p->kstack);
80103e97:	e8 64 e4 ff ff       	call   80102300 <kfree>
        p->kstack = 0;
        freevm(p->pgdir);
80103e9c:	5a                   	pop    %edx
80103e9d:	ff 73 04             	pushl  0x4(%ebx)
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
        p->kstack = 0;
80103ea0:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
80103ea7:	e8 f4 2d 00 00       	call   80106ca0 <freevm>
        p->pid = 0;
80103eac:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent = 0;
80103eb3:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
80103eba:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
        p->killed = 0;
80103ebe:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
        p->state = UNUSED;
80103ec5:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
80103ecc:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103ed3:	e8 08 05 00 00       	call   801043e0 <release>
        return pid;
80103ed8:	83 c4 10             	add    $0x10,%esp
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103edb:	8d 65 f8             	lea    -0x8(%ebp),%esp
        p->parent = 0;
        p->name[0] = 0;
        p->killed = 0;
        p->state = UNUSED;
        release(&ptable.lock);
        return pid;
80103ede:	89 f0                	mov    %esi,%eax
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103ee0:	5b                   	pop    %ebx
80103ee1:	5e                   	pop    %esi
80103ee2:	5d                   	pop    %ebp
80103ee3:	c3                   	ret    
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
      release(&ptable.lock);
80103ee4:	83 ec 0c             	sub    $0xc,%esp
80103ee7:	68 20 2d 11 80       	push   $0x80112d20
80103eec:	e8 ef 04 00 00       	call   801043e0 <release>
      return -1;
80103ef1:	83 c4 10             	add    $0x10,%esp
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103ef4:	8d 65 f8             	lea    -0x8(%ebp),%esp
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
      release(&ptable.lock);
      return -1;
80103ef7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103efc:	5b                   	pop    %ebx
80103efd:	5e                   	pop    %esi
80103efe:	5d                   	pop    %ebp
80103eff:	c3                   	ret    

80103f00 <wakeup>:
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
80103f00:	55                   	push   %ebp
80103f01:	89 e5                	mov    %esp,%ebp
80103f03:	53                   	push   %ebx
80103f04:	83 ec 10             	sub    $0x10,%esp
80103f07:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
80103f0a:	68 20 2d 11 80       	push   $0x80112d20
80103f0f:	e8 ac 03 00 00       	call   801042c0 <acquire>
80103f14:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103f17:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
80103f1c:	eb 0c                	jmp    80103f2a <wakeup+0x2a>
80103f1e:	66 90                	xchg   %ax,%ax
80103f20:	83 e8 80             	sub    $0xffffff80,%eax
80103f23:	3d 54 4d 11 80       	cmp    $0x80114d54,%eax
80103f28:	74 1c                	je     80103f46 <wakeup+0x46>
    if(p->state == SLEEPING && p->chan == chan)
80103f2a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103f2e:	75 f0                	jne    80103f20 <wakeup+0x20>
80103f30:	3b 58 20             	cmp    0x20(%eax),%ebx
80103f33:	75 eb                	jne    80103f20 <wakeup+0x20>
      p->state = RUNNABLE;
80103f35:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103f3c:	83 e8 80             	sub    $0xffffff80,%eax
80103f3f:	3d 54 4d 11 80       	cmp    $0x80114d54,%eax
80103f44:	75 e4                	jne    80103f2a <wakeup+0x2a>
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
80103f46:	c7 45 08 20 2d 11 80 	movl   $0x80112d20,0x8(%ebp)
}
80103f4d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103f50:	c9                   	leave  
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
80103f51:	e9 8a 04 00 00       	jmp    801043e0 <release>
80103f56:	8d 76 00             	lea    0x0(%esi),%esi
80103f59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103f60 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
80103f60:	55                   	push   %ebp
80103f61:	89 e5                	mov    %esp,%ebp
80103f63:	53                   	push   %ebx
80103f64:	83 ec 10             	sub    $0x10,%esp
80103f67:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
80103f6a:	68 20 2d 11 80       	push   $0x80112d20
80103f6f:	e8 4c 03 00 00       	call   801042c0 <acquire>
80103f74:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103f77:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
80103f7c:	eb 0c                	jmp    80103f8a <kill+0x2a>
80103f7e:	66 90                	xchg   %ax,%ax
80103f80:	83 e8 80             	sub    $0xffffff80,%eax
80103f83:	3d 54 4d 11 80       	cmp    $0x80114d54,%eax
80103f88:	74 3e                	je     80103fc8 <kill+0x68>
    if(p->pid == pid){
80103f8a:	39 58 10             	cmp    %ebx,0x10(%eax)
80103f8d:	75 f1                	jne    80103f80 <kill+0x20>
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
80103f8f:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
  struct proc *p;

  acquire(&ptable.lock);
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
80103f93:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
80103f9a:	74 1c                	je     80103fb8 <kill+0x58>
        p->state = RUNNABLE;
      release(&ptable.lock);
80103f9c:	83 ec 0c             	sub    $0xc,%esp
80103f9f:	68 20 2d 11 80       	push   $0x80112d20
80103fa4:	e8 37 04 00 00       	call   801043e0 <release>
      return 0;
80103fa9:	83 c4 10             	add    $0x10,%esp
80103fac:	31 c0                	xor    %eax,%eax
    }
  }
  release(&ptable.lock);
  return -1;
}
80103fae:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103fb1:	c9                   	leave  
80103fb2:	c3                   	ret    
80103fb3:	90                   	nop
80103fb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
        p->state = RUNNABLE;
80103fb8:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103fbf:	eb db                	jmp    80103f9c <kill+0x3c>
80103fc1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      release(&ptable.lock);
      return 0;
    }
  }
  release(&ptable.lock);
80103fc8:	83 ec 0c             	sub    $0xc,%esp
80103fcb:	68 20 2d 11 80       	push   $0x80112d20
80103fd0:	e8 0b 04 00 00       	call   801043e0 <release>
  return -1;
80103fd5:	83 c4 10             	add    $0x10,%esp
80103fd8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80103fdd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103fe0:	c9                   	leave  
80103fe1:	c3                   	ret    
80103fe2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103fe9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103ff0 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
80103ff0:	55                   	push   %ebp
80103ff1:	89 e5                	mov    %esp,%ebp
80103ff3:	57                   	push   %edi
80103ff4:	56                   	push   %esi
80103ff5:	53                   	push   %ebx
80103ff6:	8d 75 e8             	lea    -0x18(%ebp),%esi
80103ff9:	bb c0 2d 11 80       	mov    $0x80112dc0,%ebx
80103ffe:	83 ec 3c             	sub    $0x3c,%esp
80104001:	eb 24                	jmp    80104027 <procdump+0x37>
80104003:	90                   	nop
80104004:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
80104008:	83 ec 0c             	sub    $0xc,%esp
8010400b:	68 a7 7a 10 80       	push   $0x80107aa7
80104010:	e8 4b c6 ff ff       	call   80100660 <cprintf>
80104015:	83 c4 10             	add    $0x10,%esp
80104018:	83 eb 80             	sub    $0xffffff80,%ebx
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010401b:	81 fb c0 4d 11 80    	cmp    $0x80114dc0,%ebx
80104021:	0f 84 81 00 00 00    	je     801040a8 <procdump+0xb8>
    if(p->state == UNUSED)
80104027:	8b 43 a0             	mov    -0x60(%ebx),%eax
8010402a:	85 c0                	test   %eax,%eax
8010402c:	74 ea                	je     80104018 <procdump+0x28>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
8010402e:	83 f8 05             	cmp    $0x5,%eax
      state = states[p->state];
    else
      state = "???";
80104031:	ba e0 76 10 80       	mov    $0x801076e0,%edx
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80104036:	77 11                	ja     80104049 <procdump+0x59>
80104038:	8b 14 85 40 77 10 80 	mov    -0x7fef88c0(,%eax,4),%edx
      state = states[p->state];
    else
      state = "???";
8010403f:	b8 e0 76 10 80       	mov    $0x801076e0,%eax
80104044:	85 d2                	test   %edx,%edx
80104046:	0f 44 d0             	cmove  %eax,%edx
    cprintf("%d %s %s", p->pid, state, p->name);
80104049:	53                   	push   %ebx
8010404a:	52                   	push   %edx
8010404b:	ff 73 a4             	pushl  -0x5c(%ebx)
8010404e:	68 e4 76 10 80       	push   $0x801076e4
80104053:	e8 08 c6 ff ff       	call   80100660 <cprintf>
    if(p->state == SLEEPING){
80104058:	83 c4 10             	add    $0x10,%esp
8010405b:	83 7b a0 02          	cmpl   $0x2,-0x60(%ebx)
8010405f:	75 a7                	jne    80104008 <procdump+0x18>
      getcallerpcs((uint*)p->context->ebp+2, pc);
80104061:	8d 45 c0             	lea    -0x40(%ebp),%eax
80104064:	83 ec 08             	sub    $0x8,%esp
80104067:	8d 7d c0             	lea    -0x40(%ebp),%edi
8010406a:	50                   	push   %eax
8010406b:	8b 43 b0             	mov    -0x50(%ebx),%eax
8010406e:	8b 40 0c             	mov    0xc(%eax),%eax
80104071:	83 c0 08             	add    $0x8,%eax
80104074:	50                   	push   %eax
80104075:	e8 66 01 00 00       	call   801041e0 <getcallerpcs>
8010407a:	83 c4 10             	add    $0x10,%esp
8010407d:	8d 76 00             	lea    0x0(%esi),%esi
      for(i=0; i<10 && pc[i] != 0; i++)
80104080:	8b 17                	mov    (%edi),%edx
80104082:	85 d2                	test   %edx,%edx
80104084:	74 82                	je     80104008 <procdump+0x18>
        cprintf(" %p", pc[i]);
80104086:	83 ec 08             	sub    $0x8,%esp
80104089:	83 c7 04             	add    $0x4,%edi
8010408c:	52                   	push   %edx
8010408d:	68 21 71 10 80       	push   $0x80107121
80104092:	e8 c9 c5 ff ff       	call   80100660 <cprintf>
    else
      state = "???";
    cprintf("%d %s %s", p->pid, state, p->name);
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
80104097:	83 c4 10             	add    $0x10,%esp
8010409a:	39 f7                	cmp    %esi,%edi
8010409c:	75 e2                	jne    80104080 <procdump+0x90>
8010409e:	e9 65 ff ff ff       	jmp    80104008 <procdump+0x18>
801040a3:	90                   	nop
801040a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
  }
}
801040a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801040ab:	5b                   	pop    %ebx
801040ac:	5e                   	pop    %esi
801040ad:	5f                   	pop    %edi
801040ae:	5d                   	pop    %ebp
801040af:	c3                   	ret    

801040b0 <initsleeplock>:
#include "spinlock.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
801040b0:	55                   	push   %ebp
801040b1:	89 e5                	mov    %esp,%ebp
801040b3:	53                   	push   %ebx
801040b4:	83 ec 0c             	sub    $0xc,%esp
801040b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&lk->lk, "sleep lock");
801040ba:	68 58 77 10 80       	push   $0x80107758
801040bf:	8d 43 04             	lea    0x4(%ebx),%eax
801040c2:	50                   	push   %eax
801040c3:	e8 f8 00 00 00       	call   801041c0 <initlock>
  lk->name = name;
801040c8:	8b 45 0c             	mov    0xc(%ebp),%eax
  lk->locked = 0;
801040cb:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
}
801040d1:	83 c4 10             	add    $0x10,%esp
initsleeplock(struct sleeplock *lk, char *name)
{
  initlock(&lk->lk, "sleep lock");
  lk->name = name;
  lk->locked = 0;
  lk->pid = 0;
801040d4:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)

void
initsleeplock(struct sleeplock *lk, char *name)
{
  initlock(&lk->lk, "sleep lock");
  lk->name = name;
801040db:	89 43 38             	mov    %eax,0x38(%ebx)
  lk->locked = 0;
  lk->pid = 0;
}
801040de:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801040e1:	c9                   	leave  
801040e2:	c3                   	ret    
801040e3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801040e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801040f0 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
801040f0:	55                   	push   %ebp
801040f1:	89 e5                	mov    %esp,%ebp
801040f3:	56                   	push   %esi
801040f4:	53                   	push   %ebx
801040f5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
801040f8:	83 ec 0c             	sub    $0xc,%esp
801040fb:	8d 73 04             	lea    0x4(%ebx),%esi
801040fe:	56                   	push   %esi
801040ff:	e8 bc 01 00 00       	call   801042c0 <acquire>
  while (lk->locked) {
80104104:	8b 13                	mov    (%ebx),%edx
80104106:	83 c4 10             	add    $0x10,%esp
80104109:	85 d2                	test   %edx,%edx
8010410b:	74 16                	je     80104123 <acquiresleep+0x33>
8010410d:	8d 76 00             	lea    0x0(%esi),%esi
    sleep(lk, &lk->lk);
80104110:	83 ec 08             	sub    $0x8,%esp
80104113:	56                   	push   %esi
80104114:	53                   	push   %ebx
80104115:	e8 36 fc ff ff       	call   80103d50 <sleep>

void
acquiresleep(struct sleeplock *lk)
{
  acquire(&lk->lk);
  while (lk->locked) {
8010411a:	8b 03                	mov    (%ebx),%eax
8010411c:	83 c4 10             	add    $0x10,%esp
8010411f:	85 c0                	test   %eax,%eax
80104121:	75 ed                	jne    80104110 <acquiresleep+0x20>
    sleep(lk, &lk->lk);
  }
  lk->locked = 1;
80104123:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  lk->pid = myproc()->pid;
80104129:	e8 72 f6 ff ff       	call   801037a0 <myproc>
8010412e:	8b 40 10             	mov    0x10(%eax),%eax
80104131:	89 43 3c             	mov    %eax,0x3c(%ebx)
  release(&lk->lk);
80104134:	89 75 08             	mov    %esi,0x8(%ebp)
}
80104137:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010413a:	5b                   	pop    %ebx
8010413b:	5e                   	pop    %esi
8010413c:	5d                   	pop    %ebp
  while (lk->locked) {
    sleep(lk, &lk->lk);
  }
  lk->locked = 1;
  lk->pid = myproc()->pid;
  release(&lk->lk);
8010413d:	e9 9e 02 00 00       	jmp    801043e0 <release>
80104142:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104150 <releasesleep>:
}

void
releasesleep(struct sleeplock *lk)
{
80104150:	55                   	push   %ebp
80104151:	89 e5                	mov    %esp,%ebp
80104153:	56                   	push   %esi
80104154:	53                   	push   %ebx
80104155:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
80104158:	83 ec 0c             	sub    $0xc,%esp
8010415b:	8d 73 04             	lea    0x4(%ebx),%esi
8010415e:	56                   	push   %esi
8010415f:	e8 5c 01 00 00       	call   801042c0 <acquire>
  lk->locked = 0;
80104164:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
8010416a:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  wakeup(lk);
80104171:	89 1c 24             	mov    %ebx,(%esp)
80104174:	e8 87 fd ff ff       	call   80103f00 <wakeup>
  release(&lk->lk);
80104179:	89 75 08             	mov    %esi,0x8(%ebp)
8010417c:	83 c4 10             	add    $0x10,%esp
}
8010417f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104182:	5b                   	pop    %ebx
80104183:	5e                   	pop    %esi
80104184:	5d                   	pop    %ebp
{
  acquire(&lk->lk);
  lk->locked = 0;
  lk->pid = 0;
  wakeup(lk);
  release(&lk->lk);
80104185:	e9 56 02 00 00       	jmp    801043e0 <release>
8010418a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104190 <holdingsleep>:
}

int
holdingsleep(struct sleeplock *lk)
{
80104190:	55                   	push   %ebp
80104191:	89 e5                	mov    %esp,%ebp
80104193:	56                   	push   %esi
80104194:	53                   	push   %ebx
80104195:	8b 75 08             	mov    0x8(%ebp),%esi
  int r;
  
  acquire(&lk->lk);
80104198:	83 ec 0c             	sub    $0xc,%esp
8010419b:	8d 5e 04             	lea    0x4(%esi),%ebx
8010419e:	53                   	push   %ebx
8010419f:	e8 1c 01 00 00       	call   801042c0 <acquire>
  r = lk->locked;
801041a4:	8b 36                	mov    (%esi),%esi
  release(&lk->lk);
801041a6:	89 1c 24             	mov    %ebx,(%esp)
801041a9:	e8 32 02 00 00       	call   801043e0 <release>
  return r;
}
801041ae:	8d 65 f8             	lea    -0x8(%ebp),%esp
801041b1:	89 f0                	mov    %esi,%eax
801041b3:	5b                   	pop    %ebx
801041b4:	5e                   	pop    %esi
801041b5:	5d                   	pop    %ebp
801041b6:	c3                   	ret    
801041b7:	66 90                	xchg   %ax,%ax
801041b9:	66 90                	xchg   %ax,%ax
801041bb:	66 90                	xchg   %ax,%ax
801041bd:	66 90                	xchg   %ax,%ax
801041bf:	90                   	nop

801041c0 <initlock>:
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
801041c0:	55                   	push   %ebp
801041c1:	89 e5                	mov    %esp,%ebp
801041c3:	8b 45 08             	mov    0x8(%ebp),%eax
  lk->name = name;
801041c6:	8b 55 0c             	mov    0xc(%ebp),%edx
  lk->locked = 0;
801041c9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
  lk->name = name;
801041cf:	89 50 04             	mov    %edx,0x4(%eax)
  lk->locked = 0;
  lk->cpu = 0;
801041d2:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
801041d9:	5d                   	pop    %ebp
801041da:	c3                   	ret    
801041db:	90                   	nop
801041dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801041e0 <getcallerpcs>:
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
801041e0:	55                   	push   %ebp
801041e1:	89 e5                	mov    %esp,%ebp
801041e3:	53                   	push   %ebx
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
801041e4:	8b 45 08             	mov    0x8(%ebp),%eax
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
801041e7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
801041ea:	8d 50 f8             	lea    -0x8(%eax),%edx
  for(i = 0; i < 10; i++){
801041ed:	31 c0                	xor    %eax,%eax
801041ef:	90                   	nop
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
801041f0:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
801041f6:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
801041fc:	77 1a                	ja     80104218 <getcallerpcs+0x38>
      break;
    pcs[i] = ebp[1];     // saved %eip
801041fe:	8b 5a 04             	mov    0x4(%edx),%ebx
80104201:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104204:	83 c0 01             	add    $0x1,%eax
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
80104207:	8b 12                	mov    (%edx),%edx
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104209:	83 f8 0a             	cmp    $0xa,%eax
8010420c:	75 e2                	jne    801041f0 <getcallerpcs+0x10>
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
}
8010420e:	5b                   	pop    %ebx
8010420f:	5d                   	pop    %ebp
80104210:	c3                   	ret    
80104211:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
80104218:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
8010421f:	83 c0 01             	add    $0x1,%eax
80104222:	83 f8 0a             	cmp    $0xa,%eax
80104225:	74 e7                	je     8010420e <getcallerpcs+0x2e>
    pcs[i] = 0;
80104227:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
8010422e:	83 c0 01             	add    $0x1,%eax
80104231:	83 f8 0a             	cmp    $0xa,%eax
80104234:	75 e2                	jne    80104218 <getcallerpcs+0x38>
80104236:	eb d6                	jmp    8010420e <getcallerpcs+0x2e>
80104238:	90                   	nop
80104239:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104240 <holding>:
}

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
80104240:	55                   	push   %ebp
80104241:	89 e5                	mov    %esp,%ebp
80104243:	53                   	push   %ebx
80104244:	83 ec 04             	sub    $0x4,%esp
80104247:	8b 55 08             	mov    0x8(%ebp),%edx
  return lock->locked && lock->cpu == mycpu();
8010424a:	8b 02                	mov    (%edx),%eax
8010424c:	85 c0                	test   %eax,%eax
8010424e:	75 10                	jne    80104260 <holding+0x20>
}
80104250:	83 c4 04             	add    $0x4,%esp
80104253:	31 c0                	xor    %eax,%eax
80104255:	5b                   	pop    %ebx
80104256:	5d                   	pop    %ebp
80104257:	c3                   	ret    
80104258:	90                   	nop
80104259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == mycpu();
80104260:	8b 5a 08             	mov    0x8(%edx),%ebx
80104263:	e8 98 f4 ff ff       	call   80103700 <mycpu>
80104268:	39 c3                	cmp    %eax,%ebx
8010426a:	0f 94 c0             	sete   %al
}
8010426d:	83 c4 04             	add    $0x4,%esp

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == mycpu();
80104270:	0f b6 c0             	movzbl %al,%eax
}
80104273:	5b                   	pop    %ebx
80104274:	5d                   	pop    %ebp
80104275:	c3                   	ret    
80104276:	8d 76 00             	lea    0x0(%esi),%esi
80104279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104280 <pushcli>:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void
pushcli(void)
{
80104280:	55                   	push   %ebp
80104281:	89 e5                	mov    %esp,%ebp
80104283:	53                   	push   %ebx
80104284:	83 ec 04             	sub    $0x4,%esp
80104287:	9c                   	pushf  
80104288:	5b                   	pop    %ebx
}

static inline void
cli(void)
{
  asm volatile("cli");
80104289:	fa                   	cli    
  int eflags;

  eflags = readeflags();
  cli();
  if(mycpu()->ncli == 0)
8010428a:	e8 71 f4 ff ff       	call   80103700 <mycpu>
8010428f:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
80104295:	85 c0                	test   %eax,%eax
80104297:	75 11                	jne    801042aa <pushcli+0x2a>
    mycpu()->intena = eflags & FL_IF;
80104299:	81 e3 00 02 00 00    	and    $0x200,%ebx
8010429f:	e8 5c f4 ff ff       	call   80103700 <mycpu>
801042a4:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
  mycpu()->ncli += 1;
801042aa:	e8 51 f4 ff ff       	call   80103700 <mycpu>
801042af:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
}
801042b6:	83 c4 04             	add    $0x4,%esp
801042b9:	5b                   	pop    %ebx
801042ba:	5d                   	pop    %ebp
801042bb:	c3                   	ret    
801042bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801042c0 <acquire>:
// Loops (spins) until the lock is acquired.
// Holding a lock for a long time may cause
// other CPUs to waste time spinning to acquire it.
void
acquire(struct spinlock *lk)
{
801042c0:	55                   	push   %ebp
801042c1:	89 e5                	mov    %esp,%ebp
801042c3:	56                   	push   %esi
801042c4:	53                   	push   %ebx
  pushcli(); // disable interrupts to avoid deadlock.
801042c5:	e8 b6 ff ff ff       	call   80104280 <pushcli>
  if(holding(lk))
801042ca:	8b 5d 08             	mov    0x8(%ebp),%ebx

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == mycpu();
801042cd:	8b 03                	mov    (%ebx),%eax
801042cf:	85 c0                	test   %eax,%eax
801042d1:	75 7d                	jne    80104350 <acquire+0x90>
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
801042d3:	ba 01 00 00 00       	mov    $0x1,%edx
801042d8:	eb 09                	jmp    801042e3 <acquire+0x23>
801042da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801042e0:	8b 5d 08             	mov    0x8(%ebp),%ebx
801042e3:	89 d0                	mov    %edx,%eax
801042e5:	f0 87 03             	lock xchg %eax,(%ebx)
  pushcli(); // disable interrupts to avoid deadlock.
  if(holding(lk))
    panic("acquire");

  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
801042e8:	85 c0                	test   %eax,%eax
801042ea:	75 f4                	jne    801042e0 <acquire+0x20>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
801042ec:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Record info about lock acquisition for debugging.
  lk->cpu = mycpu();
801042f1:	8b 5d 08             	mov    0x8(%ebp),%ebx
801042f4:	e8 07 f4 ff ff       	call   80103700 <mycpu>
getcallerpcs(void *v, uint pcs[])
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
801042f9:	89 ea                	mov    %ebp,%edx
  // references happen after the lock is acquired.
  __sync_synchronize();

  // Record info about lock acquisition for debugging.
  lk->cpu = mycpu();
  getcallerpcs(&lk, lk->pcs);
801042fb:	8d 4b 0c             	lea    0xc(%ebx),%ecx
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();

  // Record info about lock acquisition for debugging.
  lk->cpu = mycpu();
801042fe:	89 43 08             	mov    %eax,0x8(%ebx)
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104301:	31 c0                	xor    %eax,%eax
80104303:	90                   	nop
80104304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80104308:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
8010430e:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
80104314:	77 1a                	ja     80104330 <acquire+0x70>
      break;
    pcs[i] = ebp[1];     // saved %eip
80104316:	8b 5a 04             	mov    0x4(%edx),%ebx
80104319:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
8010431c:	83 c0 01             	add    $0x1,%eax
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
8010431f:	8b 12                	mov    (%edx),%edx
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104321:	83 f8 0a             	cmp    $0xa,%eax
80104324:	75 e2                	jne    80104308 <acquire+0x48>
  __sync_synchronize();

  // Record info about lock acquisition for debugging.
  lk->cpu = mycpu();
  getcallerpcs(&lk, lk->pcs);
}
80104326:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104329:	5b                   	pop    %ebx
8010432a:	5e                   	pop    %esi
8010432b:	5d                   	pop    %ebp
8010432c:	c3                   	ret    
8010432d:	8d 76 00             	lea    0x0(%esi),%esi
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
80104330:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
80104337:	83 c0 01             	add    $0x1,%eax
8010433a:	83 f8 0a             	cmp    $0xa,%eax
8010433d:	74 e7                	je     80104326 <acquire+0x66>
    pcs[i] = 0;
8010433f:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
80104346:	83 c0 01             	add    $0x1,%eax
80104349:	83 f8 0a             	cmp    $0xa,%eax
8010434c:	75 e2                	jne    80104330 <acquire+0x70>
8010434e:	eb d6                	jmp    80104326 <acquire+0x66>

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == mycpu();
80104350:	8b 73 08             	mov    0x8(%ebx),%esi
80104353:	e8 a8 f3 ff ff       	call   80103700 <mycpu>
80104358:	39 c6                	cmp    %eax,%esi
8010435a:	0f 85 73 ff ff ff    	jne    801042d3 <acquire+0x13>
void
acquire(struct spinlock *lk)
{
  pushcli(); // disable interrupts to avoid deadlock.
  if(holding(lk))
    panic("acquire");
80104360:	83 ec 0c             	sub    $0xc,%esp
80104363:	68 63 77 10 80       	push   $0x80107763
80104368:	e8 03 c0 ff ff       	call   80100370 <panic>
8010436d:	8d 76 00             	lea    0x0(%esi),%esi

80104370 <popcli>:
  mycpu()->ncli += 1;
}

void
popcli(void)
{
80104370:	55                   	push   %ebp
80104371:	89 e5                	mov    %esp,%ebp
80104373:	83 ec 08             	sub    $0x8,%esp

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80104376:	9c                   	pushf  
80104377:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80104378:	f6 c4 02             	test   $0x2,%ah
8010437b:	75 52                	jne    801043cf <popcli+0x5f>
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
8010437d:	e8 7e f3 ff ff       	call   80103700 <mycpu>
80104382:	8b 88 a4 00 00 00    	mov    0xa4(%eax),%ecx
80104388:	8d 51 ff             	lea    -0x1(%ecx),%edx
8010438b:	85 d2                	test   %edx,%edx
8010438d:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
80104393:	78 2d                	js     801043c2 <popcli+0x52>
    panic("popcli");
  if(mycpu()->ncli == 0 && mycpu()->intena)
80104395:	e8 66 f3 ff ff       	call   80103700 <mycpu>
8010439a:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
801043a0:	85 d2                	test   %edx,%edx
801043a2:	74 0c                	je     801043b0 <popcli+0x40>
    sti();
}
801043a4:	c9                   	leave  
801043a5:	c3                   	ret    
801043a6:	8d 76 00             	lea    0x0(%esi),%esi
801043a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
    panic("popcli");
  if(mycpu()->ncli == 0 && mycpu()->intena)
801043b0:	e8 4b f3 ff ff       	call   80103700 <mycpu>
801043b5:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
801043bb:	85 c0                	test   %eax,%eax
801043bd:	74 e5                	je     801043a4 <popcli+0x34>
}

static inline void
sti(void)
{
  asm volatile("sti");
801043bf:	fb                   	sti    
    sti();
}
801043c0:	c9                   	leave  
801043c1:	c3                   	ret    
popcli(void)
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
    panic("popcli");
801043c2:	83 ec 0c             	sub    $0xc,%esp
801043c5:	68 82 77 10 80       	push   $0x80107782
801043ca:	e8 a1 bf ff ff       	call   80100370 <panic>

void
popcli(void)
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
801043cf:	83 ec 0c             	sub    $0xc,%esp
801043d2:	68 6b 77 10 80       	push   $0x8010776b
801043d7:	e8 94 bf ff ff       	call   80100370 <panic>
801043dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801043e0 <release>:
}

// Release the lock.
void
release(struct spinlock *lk)
{
801043e0:	55                   	push   %ebp
801043e1:	89 e5                	mov    %esp,%ebp
801043e3:	56                   	push   %esi
801043e4:	53                   	push   %ebx
801043e5:	8b 5d 08             	mov    0x8(%ebp),%ebx

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == mycpu();
801043e8:	8b 03                	mov    (%ebx),%eax
801043ea:	85 c0                	test   %eax,%eax
801043ec:	75 12                	jne    80104400 <release+0x20>
// Release the lock.
void
release(struct spinlock *lk)
{
  if(!holding(lk))
    panic("release");
801043ee:	83 ec 0c             	sub    $0xc,%esp
801043f1:	68 89 77 10 80       	push   $0x80107789
801043f6:	e8 75 bf ff ff       	call   80100370 <panic>
801043fb:	90                   	nop
801043fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == mycpu();
80104400:	8b 73 08             	mov    0x8(%ebx),%esi
80104403:	e8 f8 f2 ff ff       	call   80103700 <mycpu>
80104408:	39 c6                	cmp    %eax,%esi
8010440a:	75 e2                	jne    801043ee <release+0xe>
release(struct spinlock *lk)
{
  if(!holding(lk))
    panic("release");

  lk->pcs[0] = 0;
8010440c:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
  lk->cpu = 0;
80104413:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that all the stores in the critical
  // section are visible to other cores before the lock is released.
  // Both the C compiler and the hardware may re-order loads and
  // stores; __sync_synchronize() tells them both not to.
  __sync_synchronize();
8010441a:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
8010441f:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)

  popcli();
}
80104425:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104428:	5b                   	pop    %ebx
80104429:	5e                   	pop    %esi
8010442a:	5d                   	pop    %ebp
  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );

  popcli();
8010442b:	e9 40 ff ff ff       	jmp    80104370 <popcli>

80104430 <memset>:
#include "types.h"
#include "x86.h"

void*
memset(void *dst, int c, uint n)
{
80104430:	55                   	push   %ebp
80104431:	89 e5                	mov    %esp,%ebp
80104433:	57                   	push   %edi
80104434:	53                   	push   %ebx
80104435:	8b 55 08             	mov    0x8(%ebp),%edx
80104438:	8b 4d 10             	mov    0x10(%ebp),%ecx
  if ((int)dst%4 == 0 && n%4 == 0){
8010443b:	f6 c2 03             	test   $0x3,%dl
8010443e:	75 05                	jne    80104445 <memset+0x15>
80104440:	f6 c1 03             	test   $0x3,%cl
80104443:	74 13                	je     80104458 <memset+0x28>
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
80104445:	89 d7                	mov    %edx,%edi
80104447:	8b 45 0c             	mov    0xc(%ebp),%eax
8010444a:	fc                   	cld    
8010444b:	f3 aa                	rep stos %al,%es:(%edi)
    c &= 0xFF;
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
  } else
    stosb(dst, c, n);
  return dst;
}
8010444d:	5b                   	pop    %ebx
8010444e:	89 d0                	mov    %edx,%eax
80104450:	5f                   	pop    %edi
80104451:	5d                   	pop    %ebp
80104452:	c3                   	ret    
80104453:	90                   	nop
80104454:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

void*
memset(void *dst, int c, uint n)
{
  if ((int)dst%4 == 0 && n%4 == 0){
    c &= 0xFF;
80104458:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
}

static inline void
stosl(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosl" :
8010445c:	c1 e9 02             	shr    $0x2,%ecx
8010445f:	89 fb                	mov    %edi,%ebx
80104461:	89 f8                	mov    %edi,%eax
80104463:	c1 e3 18             	shl    $0x18,%ebx
80104466:	c1 e0 10             	shl    $0x10,%eax
80104469:	09 d8                	or     %ebx,%eax
8010446b:	09 f8                	or     %edi,%eax
8010446d:	c1 e7 08             	shl    $0x8,%edi
80104470:	09 f8                	or     %edi,%eax
80104472:	89 d7                	mov    %edx,%edi
80104474:	fc                   	cld    
80104475:	f3 ab                	rep stos %eax,%es:(%edi)
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
  } else
    stosb(dst, c, n);
  return dst;
}
80104477:	5b                   	pop    %ebx
80104478:	89 d0                	mov    %edx,%eax
8010447a:	5f                   	pop    %edi
8010447b:	5d                   	pop    %ebp
8010447c:	c3                   	ret    
8010447d:	8d 76 00             	lea    0x0(%esi),%esi

80104480 <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
80104480:	55                   	push   %ebp
80104481:	89 e5                	mov    %esp,%ebp
80104483:	57                   	push   %edi
80104484:	56                   	push   %esi
80104485:	8b 45 10             	mov    0x10(%ebp),%eax
80104488:	53                   	push   %ebx
80104489:	8b 75 0c             	mov    0xc(%ebp),%esi
8010448c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
8010448f:	85 c0                	test   %eax,%eax
80104491:	74 29                	je     801044bc <memcmp+0x3c>
    if(*s1 != *s2)
80104493:	0f b6 13             	movzbl (%ebx),%edx
80104496:	0f b6 0e             	movzbl (%esi),%ecx
80104499:	38 d1                	cmp    %dl,%cl
8010449b:	75 2b                	jne    801044c8 <memcmp+0x48>
8010449d:	8d 78 ff             	lea    -0x1(%eax),%edi
801044a0:	31 c0                	xor    %eax,%eax
801044a2:	eb 14                	jmp    801044b8 <memcmp+0x38>
801044a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801044a8:	0f b6 54 03 01       	movzbl 0x1(%ebx,%eax,1),%edx
801044ad:	83 c0 01             	add    $0x1,%eax
801044b0:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
801044b4:	38 ca                	cmp    %cl,%dl
801044b6:	75 10                	jne    801044c8 <memcmp+0x48>
{
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
801044b8:	39 f8                	cmp    %edi,%eax
801044ba:	75 ec                	jne    801044a8 <memcmp+0x28>
      return *s1 - *s2;
    s1++, s2++;
  }

  return 0;
}
801044bc:	5b                   	pop    %ebx
    if(*s1 != *s2)
      return *s1 - *s2;
    s1++, s2++;
  }

  return 0;
801044bd:	31 c0                	xor    %eax,%eax
}
801044bf:	5e                   	pop    %esi
801044c0:	5f                   	pop    %edi
801044c1:	5d                   	pop    %ebp
801044c2:	c3                   	ret    
801044c3:	90                   	nop
801044c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
    if(*s1 != *s2)
      return *s1 - *s2;
801044c8:	0f b6 c2             	movzbl %dl,%eax
    s1++, s2++;
  }

  return 0;
}
801044cb:	5b                   	pop    %ebx

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
    if(*s1 != *s2)
      return *s1 - *s2;
801044cc:	29 c8                	sub    %ecx,%eax
    s1++, s2++;
  }

  return 0;
}
801044ce:	5e                   	pop    %esi
801044cf:	5f                   	pop    %edi
801044d0:	5d                   	pop    %ebp
801044d1:	c3                   	ret    
801044d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801044d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801044e0 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
801044e0:	55                   	push   %ebp
801044e1:	89 e5                	mov    %esp,%ebp
801044e3:	56                   	push   %esi
801044e4:	53                   	push   %ebx
801044e5:	8b 45 08             	mov    0x8(%ebp),%eax
801044e8:	8b 75 0c             	mov    0xc(%ebp),%esi
801044eb:	8b 5d 10             	mov    0x10(%ebp),%ebx
  const char *s;
  char *d;

  s = src;
  d = dst;
  if(s < d && s + n > d){
801044ee:	39 c6                	cmp    %eax,%esi
801044f0:	73 2e                	jae    80104520 <memmove+0x40>
801044f2:	8d 0c 1e             	lea    (%esi,%ebx,1),%ecx
801044f5:	39 c8                	cmp    %ecx,%eax
801044f7:	73 27                	jae    80104520 <memmove+0x40>
    s += n;
    d += n;
    while(n-- > 0)
801044f9:	85 db                	test   %ebx,%ebx
801044fb:	8d 53 ff             	lea    -0x1(%ebx),%edx
801044fe:	74 17                	je     80104517 <memmove+0x37>
      *--d = *--s;
80104500:	29 d9                	sub    %ebx,%ecx
80104502:	89 cb                	mov    %ecx,%ebx
80104504:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104508:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
8010450c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  s = src;
  d = dst;
  if(s < d && s + n > d){
    s += n;
    d += n;
    while(n-- > 0)
8010450f:	83 ea 01             	sub    $0x1,%edx
80104512:	83 fa ff             	cmp    $0xffffffff,%edx
80104515:	75 f1                	jne    80104508 <memmove+0x28>
  } else
    while(n-- > 0)
      *d++ = *s++;

  return dst;
}
80104517:	5b                   	pop    %ebx
80104518:	5e                   	pop    %esi
80104519:	5d                   	pop    %ebp
8010451a:	c3                   	ret    
8010451b:	90                   	nop
8010451c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    s += n;
    d += n;
    while(n-- > 0)
      *--d = *--s;
  } else
    while(n-- > 0)
80104520:	31 d2                	xor    %edx,%edx
80104522:	85 db                	test   %ebx,%ebx
80104524:	74 f1                	je     80104517 <memmove+0x37>
80104526:	8d 76 00             	lea    0x0(%esi),%esi
80104529:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      *d++ = *s++;
80104530:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
80104534:	88 0c 10             	mov    %cl,(%eax,%edx,1)
80104537:	83 c2 01             	add    $0x1,%edx
    s += n;
    d += n;
    while(n-- > 0)
      *--d = *--s;
  } else
    while(n-- > 0)
8010453a:	39 d3                	cmp    %edx,%ebx
8010453c:	75 f2                	jne    80104530 <memmove+0x50>
      *d++ = *s++;

  return dst;
}
8010453e:	5b                   	pop    %ebx
8010453f:	5e                   	pop    %esi
80104540:	5d                   	pop    %ebp
80104541:	c3                   	ret    
80104542:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104549:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104550 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
80104550:	55                   	push   %ebp
80104551:	89 e5                	mov    %esp,%ebp
  return memmove(dst, src, n);
}
80104553:	5d                   	pop    %ebp

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
  return memmove(dst, src, n);
80104554:	eb 8a                	jmp    801044e0 <memmove>
80104556:	8d 76 00             	lea    0x0(%esi),%esi
80104559:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104560 <strncmp>:
}

int
strncmp(const char *p, const char *q, uint n)
{
80104560:	55                   	push   %ebp
80104561:	89 e5                	mov    %esp,%ebp
80104563:	57                   	push   %edi
80104564:	56                   	push   %esi
80104565:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104568:	53                   	push   %ebx
80104569:	8b 7d 08             	mov    0x8(%ebp),%edi
8010456c:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n > 0 && *p && *p == *q)
8010456f:	85 c9                	test   %ecx,%ecx
80104571:	74 37                	je     801045aa <strncmp+0x4a>
80104573:	0f b6 17             	movzbl (%edi),%edx
80104576:	0f b6 1e             	movzbl (%esi),%ebx
80104579:	84 d2                	test   %dl,%dl
8010457b:	74 3f                	je     801045bc <strncmp+0x5c>
8010457d:	38 d3                	cmp    %dl,%bl
8010457f:	75 3b                	jne    801045bc <strncmp+0x5c>
80104581:	8d 47 01             	lea    0x1(%edi),%eax
80104584:	01 cf                	add    %ecx,%edi
80104586:	eb 1b                	jmp    801045a3 <strncmp+0x43>
80104588:	90                   	nop
80104589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104590:	0f b6 10             	movzbl (%eax),%edx
80104593:	84 d2                	test   %dl,%dl
80104595:	74 21                	je     801045b8 <strncmp+0x58>
80104597:	0f b6 19             	movzbl (%ecx),%ebx
8010459a:	83 c0 01             	add    $0x1,%eax
8010459d:	89 ce                	mov    %ecx,%esi
8010459f:	38 da                	cmp    %bl,%dl
801045a1:	75 19                	jne    801045bc <strncmp+0x5c>
801045a3:	39 c7                	cmp    %eax,%edi
    n--, p++, q++;
801045a5:	8d 4e 01             	lea    0x1(%esi),%ecx
}

int
strncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
801045a8:	75 e6                	jne    80104590 <strncmp+0x30>
    n--, p++, q++;
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
}
801045aa:	5b                   	pop    %ebx
strncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
    n--, p++, q++;
  if(n == 0)
    return 0;
801045ab:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}
801045ad:	5e                   	pop    %esi
801045ae:	5f                   	pop    %edi
801045af:	5d                   	pop    %ebp
801045b0:	c3                   	ret    
801045b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801045b8:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
{
  while(n > 0 && *p && *p == *q)
    n--, p++, q++;
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
801045bc:	0f b6 c2             	movzbl %dl,%eax
801045bf:	29 d8                	sub    %ebx,%eax
}
801045c1:	5b                   	pop    %ebx
801045c2:	5e                   	pop    %esi
801045c3:	5f                   	pop    %edi
801045c4:	5d                   	pop    %ebp
801045c5:	c3                   	ret    
801045c6:	8d 76 00             	lea    0x0(%esi),%esi
801045c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801045d0 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
801045d0:	55                   	push   %ebp
801045d1:	89 e5                	mov    %esp,%ebp
801045d3:	56                   	push   %esi
801045d4:	53                   	push   %ebx
801045d5:	8b 45 08             	mov    0x8(%ebp),%eax
801045d8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
801045db:	8b 4d 10             	mov    0x10(%ebp),%ecx
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
801045de:	89 c2                	mov    %eax,%edx
801045e0:	eb 19                	jmp    801045fb <strncpy+0x2b>
801045e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801045e8:	83 c3 01             	add    $0x1,%ebx
801045eb:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
801045ef:	83 c2 01             	add    $0x1,%edx
801045f2:	84 c9                	test   %cl,%cl
801045f4:	88 4a ff             	mov    %cl,-0x1(%edx)
801045f7:	74 09                	je     80104602 <strncpy+0x32>
801045f9:	89 f1                	mov    %esi,%ecx
801045fb:	85 c9                	test   %ecx,%ecx
801045fd:	8d 71 ff             	lea    -0x1(%ecx),%esi
80104600:	7f e6                	jg     801045e8 <strncpy+0x18>
    ;
  while(n-- > 0)
80104602:	31 c9                	xor    %ecx,%ecx
80104604:	85 f6                	test   %esi,%esi
80104606:	7e 17                	jle    8010461f <strncpy+0x4f>
80104608:	90                   	nop
80104609:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    *s++ = 0;
80104610:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
80104614:	89 f3                	mov    %esi,%ebx
80104616:	83 c1 01             	add    $0x1,%ecx
80104619:	29 cb                	sub    %ecx,%ebx
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    ;
  while(n-- > 0)
8010461b:	85 db                	test   %ebx,%ebx
8010461d:	7f f1                	jg     80104610 <strncpy+0x40>
    *s++ = 0;
  return os;
}
8010461f:	5b                   	pop    %ebx
80104620:	5e                   	pop    %esi
80104621:	5d                   	pop    %ebp
80104622:	c3                   	ret    
80104623:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104629:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104630 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
80104630:	55                   	push   %ebp
80104631:	89 e5                	mov    %esp,%ebp
80104633:	56                   	push   %esi
80104634:	53                   	push   %ebx
80104635:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104638:	8b 45 08             	mov    0x8(%ebp),%eax
8010463b:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  if(n <= 0)
8010463e:	85 c9                	test   %ecx,%ecx
80104640:	7e 26                	jle    80104668 <safestrcpy+0x38>
80104642:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
80104646:	89 c1                	mov    %eax,%ecx
80104648:	eb 17                	jmp    80104661 <safestrcpy+0x31>
8010464a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return os;
  while(--n > 0 && (*s++ = *t++) != 0)
80104650:	83 c2 01             	add    $0x1,%edx
80104653:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
80104657:	83 c1 01             	add    $0x1,%ecx
8010465a:	84 db                	test   %bl,%bl
8010465c:	88 59 ff             	mov    %bl,-0x1(%ecx)
8010465f:	74 04                	je     80104665 <safestrcpy+0x35>
80104661:	39 f2                	cmp    %esi,%edx
80104663:	75 eb                	jne    80104650 <safestrcpy+0x20>
    ;
  *s = 0;
80104665:	c6 01 00             	movb   $0x0,(%ecx)
  return os;
}
80104668:	5b                   	pop    %ebx
80104669:	5e                   	pop    %esi
8010466a:	5d                   	pop    %ebp
8010466b:	c3                   	ret    
8010466c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104670 <strlen>:

int
strlen(const char *s)
{
80104670:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
80104671:	31 c0                	xor    %eax,%eax
  return os;
}

int
strlen(const char *s)
{
80104673:	89 e5                	mov    %esp,%ebp
80104675:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
80104678:	80 3a 00             	cmpb   $0x0,(%edx)
8010467b:	74 0c                	je     80104689 <strlen+0x19>
8010467d:	8d 76 00             	lea    0x0(%esi),%esi
80104680:	83 c0 01             	add    $0x1,%eax
80104683:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
80104687:	75 f7                	jne    80104680 <strlen+0x10>
    ;
  return n;
}
80104689:	5d                   	pop    %ebp
8010468a:	c3                   	ret    

8010468b <swtch>:
# Save current register context in old
# and then load register context from new.

.globl swtch
swtch:
  movl 4(%esp), %eax
8010468b:	8b 44 24 04          	mov    0x4(%esp),%eax
  movl 8(%esp), %edx
8010468f:	8b 54 24 08          	mov    0x8(%esp),%edx

  # Save old callee-save registers
  pushl %ebp
80104693:	55                   	push   %ebp
  pushl %ebx
80104694:	53                   	push   %ebx
  pushl %esi
80104695:	56                   	push   %esi
  pushl %edi
80104696:	57                   	push   %edi

  # Switch stacks
  movl %esp, (%eax)
80104697:	89 20                	mov    %esp,(%eax)
  movl %edx, %esp
80104699:	89 d4                	mov    %edx,%esp

  # Load new callee-save registers
  popl %edi
8010469b:	5f                   	pop    %edi
  popl %esi
8010469c:	5e                   	pop    %esi
  popl %ebx
8010469d:	5b                   	pop    %ebx
  popl %ebp
8010469e:	5d                   	pop    %ebp
  ret
8010469f:	c3                   	ret    

801046a0 <fetchint>:
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
801046a0:	55                   	push   %ebp
801046a1:	89 e5                	mov    %esp,%ebp
801046a3:	8b 45 08             	mov    0x8(%ebp),%eax
//  struct proc *curproc = myproc();

  if(addr >= STACKBOTTOM || addr+4 > STACKBOTTOM)
801046a6:	3d fb ff ff 7f       	cmp    $0x7ffffffb,%eax
801046ab:	77 13                	ja     801046c0 <fetchint+0x20>
    return -1;
  *ip = *(int*)(addr);
801046ad:	8b 10                	mov    (%eax),%edx
801046af:	8b 45 0c             	mov    0xc(%ebp),%eax
801046b2:	89 10                	mov    %edx,(%eax)
  return 0;
801046b4:	31 c0                	xor    %eax,%eax
}
801046b6:	5d                   	pop    %ebp
801046b7:	c3                   	ret    
801046b8:	90                   	nop
801046b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
fetchint(uint addr, int *ip)
{
//  struct proc *curproc = myproc();

  if(addr >= STACKBOTTOM || addr+4 > STACKBOTTOM)
    return -1;
801046c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  *ip = *(int*)(addr);
  return 0;
}
801046c5:	5d                   	pop    %ebp
801046c6:	c3                   	ret    
801046c7:	89 f6                	mov    %esi,%esi
801046c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801046d0 <fetchstr>:
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
801046d0:	55                   	push   %ebp
801046d1:	89 e5                	mov    %esp,%ebp
801046d3:	8b 55 08             	mov    0x8(%ebp),%edx
  char *s, *ep;
 // struct proc *curproc = myproc();

  if(addr >= STACKBOTTOM)
801046d6:	81 fa fe ff ff 7f    	cmp    $0x7ffffffe,%edx
801046dc:	77 21                	ja     801046ff <fetchstr+0x2f>
    return -1;
  *pp = (char*)addr;
801046de:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801046e1:	89 d0                	mov    %edx,%eax
801046e3:	89 11                	mov    %edx,(%ecx)
  ep = (char*)STACKBOTTOM;
  for(s = *pp; s < ep; s++){
    if(*s == 0)
801046e5:	80 3a 00             	cmpb   $0x0,(%edx)
801046e8:	75 0b                	jne    801046f5 <fetchstr+0x25>
801046ea:	eb 24                	jmp    80104710 <fetchstr+0x40>
801046ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801046f0:	80 38 00             	cmpb   $0x0,(%eax)
801046f3:	74 1b                	je     80104710 <fetchstr+0x40>

  if(addr >= STACKBOTTOM)
    return -1;
  *pp = (char*)addr;
  ep = (char*)STACKBOTTOM;
  for(s = *pp; s < ep; s++){
801046f5:	83 c0 01             	add    $0x1,%eax
801046f8:	3d ff ff ff 7f       	cmp    $0x7fffffff,%eax
801046fd:	75 f1                	jne    801046f0 <fetchstr+0x20>
{
  char *s, *ep;
 // struct proc *curproc = myproc();

  if(addr >= STACKBOTTOM)
    return -1;
801046ff:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  for(s = *pp; s < ep; s++){
    if(*s == 0)
      return s - *pp;
  }
  return -1;
}
80104704:	5d                   	pop    %ebp
80104705:	c3                   	ret    
80104706:	8d 76 00             	lea    0x0(%esi),%esi
80104709:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
  *pp = (char*)addr;
  ep = (char*)STACKBOTTOM;
  for(s = *pp; s < ep; s++){
    if(*s == 0)
      return s - *pp;
80104710:	29 d0                	sub    %edx,%eax
  }
  return -1;
}
80104712:	5d                   	pop    %ebp
80104713:	c3                   	ret    
80104714:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010471a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104720 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
80104720:	55                   	push   %ebp
80104721:	89 e5                	mov    %esp,%ebp
80104723:	83 ec 08             	sub    $0x8,%esp
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104726:	e8 75 f0 ff ff       	call   801037a0 <myproc>
8010472b:	8b 40 18             	mov    0x18(%eax),%eax
8010472e:	8b 55 08             	mov    0x8(%ebp),%edx
80104731:	8b 40 44             	mov    0x44(%eax),%eax
80104734:	8d 44 90 04          	lea    0x4(%eax,%edx,4),%eax
int
fetchint(uint addr, int *ip)
{
//  struct proc *curproc = myproc();

  if(addr >= STACKBOTTOM || addr+4 > STACKBOTTOM)
80104738:	3d fb ff ff 7f       	cmp    $0x7ffffffb,%eax
8010473d:	77 11                	ja     80104750 <argint+0x30>
    return -1;
  *ip = *(int*)(addr);
8010473f:	8b 10                	mov    (%eax),%edx
80104741:	8b 45 0c             	mov    0xc(%ebp),%eax
80104744:	89 10                	mov    %edx,(%eax)
  return 0;
80104746:	31 c0                	xor    %eax,%eax
// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
}
80104748:	c9                   	leave  
80104749:	c3                   	ret    
8010474a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
fetchint(uint addr, int *ip)
{
//  struct proc *curproc = myproc();

  if(addr >= STACKBOTTOM || addr+4 > STACKBOTTOM)
    return -1;
80104750:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
}
80104755:	c9                   	leave  
80104756:	c3                   	ret    
80104757:	89 f6                	mov    %esi,%esi
80104759:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104760 <argptr>:
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
80104760:	55                   	push   %ebp
80104761:	89 e5                	mov    %esp,%ebp
80104763:	53                   	push   %ebx
80104764:	83 ec 04             	sub    $0x4,%esp
80104767:	8b 5d 10             	mov    0x10(%ebp),%ebx

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
8010476a:	e8 31 f0 ff ff       	call   801037a0 <myproc>
8010476f:	8b 40 18             	mov    0x18(%eax),%eax
80104772:	8b 55 08             	mov    0x8(%ebp),%edx
80104775:	8b 40 44             	mov    0x44(%eax),%eax
80104778:	8d 54 90 04          	lea    0x4(%eax,%edx,4),%edx
{
  int i;
 // struct proc *curproc = myproc();
 
  if(argint(n, &i) < 0)
    return -1;
8010477c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
int
fetchint(uint addr, int *ip)
{
//  struct proc *curproc = myproc();

  if(addr >= STACKBOTTOM || addr+4 > STACKBOTTOM)
80104781:	81 fa fb ff ff 7f    	cmp    $0x7ffffffb,%edx
80104787:	77 19                	ja     801047a2 <argptr+0x42>
  int i;
 // struct proc *curproc = myproc();
 
  if(argint(n, &i) < 0)
    return -1;
  if(size < 0 || (uint)i >= STACKBOTTOM || (uint)i+size > STACKBOTTOM)
80104789:	85 db                	test   %ebx,%ebx
{
//  struct proc *curproc = myproc();

  if(addr >= STACKBOTTOM || addr+4 > STACKBOTTOM)
    return -1;
  *ip = *(int*)(addr);
8010478b:	8b 12                	mov    (%edx),%edx
  int i;
 // struct proc *curproc = myproc();
 
  if(argint(n, &i) < 0)
    return -1;
  if(size < 0 || (uint)i >= STACKBOTTOM || (uint)i+size > STACKBOTTOM)
8010478d:	78 13                	js     801047a2 <argptr+0x42>
8010478f:	81 fa fe ff ff 7f    	cmp    $0x7ffffffe,%edx
80104795:	77 0b                	ja     801047a2 <argptr+0x42>
80104797:	01 d3                	add    %edx,%ebx
80104799:	78 07                	js     801047a2 <argptr+0x42>
    return -1;
  *pp = (char*)i;
8010479b:	8b 45 0c             	mov    0xc(%ebp),%eax
8010479e:	89 10                	mov    %edx,(%eax)
  return 0;
801047a0:	31 c0                	xor    %eax,%eax
}
801047a2:	83 c4 04             	add    $0x4,%esp
801047a5:	5b                   	pop    %ebx
801047a6:	5d                   	pop    %ebp
801047a7:	c3                   	ret    
801047a8:	90                   	nop
801047a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801047b0 <argstr>:
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
801047b0:	55                   	push   %ebp
801047b1:	89 e5                	mov    %esp,%ebp
801047b3:	83 ec 08             	sub    $0x8,%esp

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
801047b6:	e8 e5 ef ff ff       	call   801037a0 <myproc>
801047bb:	8b 40 18             	mov    0x18(%eax),%eax
801047be:	8b 55 08             	mov    0x8(%ebp),%edx
801047c1:	8b 40 44             	mov    0x44(%eax),%eax
801047c4:	8d 44 90 04          	lea    0x4(%eax,%edx,4),%eax
int
fetchint(uint addr, int *ip)
{
//  struct proc *curproc = myproc();

  if(addr >= STACKBOTTOM || addr+4 > STACKBOTTOM)
801047c8:	3d fb ff ff 7f       	cmp    $0x7ffffffb,%eax
801047cd:	77 30                	ja     801047ff <argstr+0x4f>
    return -1;
  *ip = *(int*)(addr);
801047cf:	8b 10                	mov    (%eax),%edx
fetchstr(uint addr, char **pp)
{
  char *s, *ep;
 // struct proc *curproc = myproc();

  if(addr >= STACKBOTTOM)
801047d1:	81 fa fe ff ff 7f    	cmp    $0x7ffffffe,%edx
801047d7:	77 26                	ja     801047ff <argstr+0x4f>
    return -1;
  *pp = (char*)addr;
801047d9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  ep = (char*)STACKBOTTOM;
  for(s = *pp; s < ep; s++){
801047dc:	81 fa ff ff ff 7f    	cmp    $0x7fffffff,%edx
  char *s, *ep;
 // struct proc *curproc = myproc();

  if(addr >= STACKBOTTOM)
    return -1;
  *pp = (char*)addr;
801047e2:	89 d0                	mov    %edx,%eax
801047e4:	89 11                	mov    %edx,(%ecx)
  ep = (char*)STACKBOTTOM;
  for(s = *pp; s < ep; s++){
801047e6:	74 17                	je     801047ff <argstr+0x4f>
    if(*s == 0)
801047e8:	80 3a 00             	cmpb   $0x0,(%edx)
801047eb:	75 08                	jne    801047f5 <argstr+0x45>
801047ed:	eb 21                	jmp    80104810 <argstr+0x60>
801047ef:	90                   	nop
801047f0:	80 38 00             	cmpb   $0x0,(%eax)
801047f3:	74 1b                	je     80104810 <argstr+0x60>

  if(addr >= STACKBOTTOM)
    return -1;
  *pp = (char*)addr;
  ep = (char*)STACKBOTTOM;
  for(s = *pp; s < ep; s++){
801047f5:	83 c0 01             	add    $0x1,%eax
801047f8:	3d fe ff ff 7f       	cmp    $0x7ffffffe,%eax
801047fd:	76 f1                	jbe    801047f0 <argstr+0x40>
int
argstr(int n, char **pp)
{
  int addr;
  if(argint(n, &addr) < 0)
    return -1;
801047ff:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fetchstr(addr, pp);
}
80104804:	c9                   	leave  
80104805:	c3                   	ret    
80104806:	8d 76 00             	lea    0x0(%esi),%esi
80104809:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
  *pp = (char*)addr;
  ep = (char*)STACKBOTTOM;
  for(s = *pp; s < ep; s++){
    if(*s == 0)
      return s - *pp;
80104810:	29 d0                	sub    %edx,%eax
{
  int addr;
  if(argint(n, &addr) < 0)
    return -1;
  return fetchstr(addr, pp);
}
80104812:	c9                   	leave  
80104813:	c3                   	ret    
80104814:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010481a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104820 <syscall>:
[SYS_shm_close] sys_shm_close
};

void
syscall(void)
{
80104820:	55                   	push   %ebp
80104821:	89 e5                	mov    %esp,%ebp
80104823:	56                   	push   %esi
80104824:	53                   	push   %ebx
  int num;
  struct proc *curproc = myproc();
80104825:	e8 76 ef ff ff       	call   801037a0 <myproc>

  num = curproc->tf->eax;
8010482a:	8b 70 18             	mov    0x18(%eax),%esi

void
syscall(void)
{
  int num;
  struct proc *curproc = myproc();
8010482d:	89 c3                	mov    %eax,%ebx

  num = curproc->tf->eax;
8010482f:	8b 46 1c             	mov    0x1c(%esi),%eax
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
80104832:	8d 50 ff             	lea    -0x1(%eax),%edx
80104835:	83 fa 16             	cmp    $0x16,%edx
80104838:	77 1e                	ja     80104858 <syscall+0x38>
8010483a:	8b 14 85 c0 77 10 80 	mov    -0x7fef8840(,%eax,4),%edx
80104841:	85 d2                	test   %edx,%edx
80104843:	74 13                	je     80104858 <syscall+0x38>
    curproc->tf->eax = syscalls[num]();
80104845:	ff d2                	call   *%edx
80104847:	89 46 1c             	mov    %eax,0x1c(%esi)
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            curproc->pid, curproc->name, num);
    curproc->tf->eax = -1;
  }
}
8010484a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010484d:	5b                   	pop    %ebx
8010484e:	5e                   	pop    %esi
8010484f:	5d                   	pop    %ebp
80104850:	c3                   	ret    
80104851:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  num = curproc->tf->eax;
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    curproc->tf->eax = syscalls[num]();
  } else {
    cprintf("%d %s: unknown sys call %d\n",
80104858:	50                   	push   %eax
            curproc->pid, curproc->name, num);
80104859:	8d 43 6c             	lea    0x6c(%ebx),%eax

  num = curproc->tf->eax;
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    curproc->tf->eax = syscalls[num]();
  } else {
    cprintf("%d %s: unknown sys call %d\n",
8010485c:	50                   	push   %eax
8010485d:	ff 73 10             	pushl  0x10(%ebx)
80104860:	68 91 77 10 80       	push   $0x80107791
80104865:	e8 f6 bd ff ff       	call   80100660 <cprintf>
            curproc->pid, curproc->name, num);
    curproc->tf->eax = -1;
8010486a:	8b 43 18             	mov    0x18(%ebx),%eax
8010486d:	83 c4 10             	add    $0x10,%esp
80104870:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
  }
}
80104877:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010487a:	5b                   	pop    %ebx
8010487b:	5e                   	pop    %esi
8010487c:	5d                   	pop    %ebp
8010487d:	c3                   	ret    
8010487e:	66 90                	xchg   %ax,%ax

80104880 <create>:
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104880:	55                   	push   %ebp
80104881:	89 e5                	mov    %esp,%ebp
80104883:	57                   	push   %edi
80104884:	56                   	push   %esi
80104885:	53                   	push   %ebx
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80104886:	8d 75 da             	lea    -0x26(%ebp),%esi
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104889:	83 ec 44             	sub    $0x44,%esp
8010488c:	89 4d c0             	mov    %ecx,-0x40(%ebp)
8010488f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80104892:	56                   	push   %esi
80104893:	50                   	push   %eax
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104894:	89 55 c4             	mov    %edx,-0x3c(%ebp)
80104897:	89 4d bc             	mov    %ecx,-0x44(%ebp)
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
8010489a:	e8 61 d6 ff ff       	call   80101f00 <nameiparent>
8010489f:	83 c4 10             	add    $0x10,%esp
801048a2:	85 c0                	test   %eax,%eax
801048a4:	0f 84 f6 00 00 00    	je     801049a0 <create+0x120>
    return 0;
  ilock(dp);
801048aa:	83 ec 0c             	sub    $0xc,%esp
801048ad:	89 c7                	mov    %eax,%edi
801048af:	50                   	push   %eax
801048b0:	e8 db cd ff ff       	call   80101690 <ilock>

  if((ip = dirlookup(dp, name, &off)) != 0){
801048b5:	8d 45 d4             	lea    -0x2c(%ebp),%eax
801048b8:	83 c4 0c             	add    $0xc,%esp
801048bb:	50                   	push   %eax
801048bc:	56                   	push   %esi
801048bd:	57                   	push   %edi
801048be:	e8 fd d2 ff ff       	call   80101bc0 <dirlookup>
801048c3:	83 c4 10             	add    $0x10,%esp
801048c6:	85 c0                	test   %eax,%eax
801048c8:	89 c3                	mov    %eax,%ebx
801048ca:	74 54                	je     80104920 <create+0xa0>
    iunlockput(dp);
801048cc:	83 ec 0c             	sub    $0xc,%esp
801048cf:	57                   	push   %edi
801048d0:	e8 4b d0 ff ff       	call   80101920 <iunlockput>
    ilock(ip);
801048d5:	89 1c 24             	mov    %ebx,(%esp)
801048d8:	e8 b3 cd ff ff       	call   80101690 <ilock>
    if(type == T_FILE && ip->type == T_FILE)
801048dd:	83 c4 10             	add    $0x10,%esp
801048e0:	66 83 7d c4 02       	cmpw   $0x2,-0x3c(%ebp)
801048e5:	75 19                	jne    80104900 <create+0x80>
801048e7:	66 83 7b 50 02       	cmpw   $0x2,0x50(%ebx)
801048ec:	89 d8                	mov    %ebx,%eax
801048ee:	75 10                	jne    80104900 <create+0x80>
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
801048f0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801048f3:	5b                   	pop    %ebx
801048f4:	5e                   	pop    %esi
801048f5:	5f                   	pop    %edi
801048f6:	5d                   	pop    %ebp
801048f7:	c3                   	ret    
801048f8:	90                   	nop
801048f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if((ip = dirlookup(dp, name, &off)) != 0){
    iunlockput(dp);
    ilock(ip);
    if(type == T_FILE && ip->type == T_FILE)
      return ip;
    iunlockput(ip);
80104900:	83 ec 0c             	sub    $0xc,%esp
80104903:	53                   	push   %ebx
80104904:	e8 17 d0 ff ff       	call   80101920 <iunlockput>
    return 0;
80104909:	83 c4 10             	add    $0x10,%esp
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
8010490c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    iunlockput(dp);
    ilock(ip);
    if(type == T_FILE && ip->type == T_FILE)
      return ip;
    iunlockput(ip);
    return 0;
8010490f:	31 c0                	xor    %eax,%eax
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104911:	5b                   	pop    %ebx
80104912:	5e                   	pop    %esi
80104913:	5f                   	pop    %edi
80104914:	5d                   	pop    %ebp
80104915:	c3                   	ret    
80104916:	8d 76 00             	lea    0x0(%esi),%esi
80104919:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      return ip;
    iunlockput(ip);
    return 0;
  }

  if((ip = ialloc(dp->dev, type)) == 0)
80104920:	0f bf 45 c4          	movswl -0x3c(%ebp),%eax
80104924:	83 ec 08             	sub    $0x8,%esp
80104927:	50                   	push   %eax
80104928:	ff 37                	pushl  (%edi)
8010492a:	e8 f1 cb ff ff       	call   80101520 <ialloc>
8010492f:	83 c4 10             	add    $0x10,%esp
80104932:	85 c0                	test   %eax,%eax
80104934:	89 c3                	mov    %eax,%ebx
80104936:	0f 84 cc 00 00 00    	je     80104a08 <create+0x188>
    panic("create: ialloc");

  ilock(ip);
8010493c:	83 ec 0c             	sub    $0xc,%esp
8010493f:	50                   	push   %eax
80104940:	e8 4b cd ff ff       	call   80101690 <ilock>
  ip->major = major;
80104945:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
80104949:	66 89 43 52          	mov    %ax,0x52(%ebx)
  ip->minor = minor;
8010494d:	0f b7 45 bc          	movzwl -0x44(%ebp),%eax
80104951:	66 89 43 54          	mov    %ax,0x54(%ebx)
  ip->nlink = 1;
80104955:	b8 01 00 00 00       	mov    $0x1,%eax
8010495a:	66 89 43 56          	mov    %ax,0x56(%ebx)
  iupdate(ip);
8010495e:	89 1c 24             	mov    %ebx,(%esp)
80104961:	e8 7a cc ff ff       	call   801015e0 <iupdate>

  if(type == T_DIR){  // Create . and .. entries.
80104966:	83 c4 10             	add    $0x10,%esp
80104969:	66 83 7d c4 01       	cmpw   $0x1,-0x3c(%ebp)
8010496e:	74 40                	je     801049b0 <create+0x130>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
      panic("create dots");
  }

  if(dirlink(dp, name, ip->inum) < 0)
80104970:	83 ec 04             	sub    $0x4,%esp
80104973:	ff 73 04             	pushl  0x4(%ebx)
80104976:	56                   	push   %esi
80104977:	57                   	push   %edi
80104978:	e8 a3 d4 ff ff       	call   80101e20 <dirlink>
8010497d:	83 c4 10             	add    $0x10,%esp
80104980:	85 c0                	test   %eax,%eax
80104982:	78 77                	js     801049fb <create+0x17b>
    panic("create: dirlink");

  iunlockput(dp);
80104984:	83 ec 0c             	sub    $0xc,%esp
80104987:	57                   	push   %edi
80104988:	e8 93 cf ff ff       	call   80101920 <iunlockput>

  return ip;
8010498d:	83 c4 10             	add    $0x10,%esp
}
80104990:	8d 65 f4             	lea    -0xc(%ebp),%esp
  if(dirlink(dp, name, ip->inum) < 0)
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
80104993:	89 d8                	mov    %ebx,%eax
}
80104995:	5b                   	pop    %ebx
80104996:	5e                   	pop    %esi
80104997:	5f                   	pop    %edi
80104998:	5d                   	pop    %ebp
80104999:	c3                   	ret    
8010499a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
    return 0;
801049a0:	31 c0                	xor    %eax,%eax
801049a2:	e9 49 ff ff ff       	jmp    801048f0 <create+0x70>
801049a7:	89 f6                	mov    %esi,%esi
801049a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  ip->minor = minor;
  ip->nlink = 1;
  iupdate(ip);

  if(type == T_DIR){  // Create . and .. entries.
    dp->nlink++;  // for ".."
801049b0:	66 83 47 56 01       	addw   $0x1,0x56(%edi)
    iupdate(dp);
801049b5:	83 ec 0c             	sub    $0xc,%esp
801049b8:	57                   	push   %edi
801049b9:	e8 22 cc ff ff       	call   801015e0 <iupdate>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
801049be:	83 c4 0c             	add    $0xc,%esp
801049c1:	ff 73 04             	pushl  0x4(%ebx)
801049c4:	68 3c 78 10 80       	push   $0x8010783c
801049c9:	53                   	push   %ebx
801049ca:	e8 51 d4 ff ff       	call   80101e20 <dirlink>
801049cf:	83 c4 10             	add    $0x10,%esp
801049d2:	85 c0                	test   %eax,%eax
801049d4:	78 18                	js     801049ee <create+0x16e>
801049d6:	83 ec 04             	sub    $0x4,%esp
801049d9:	ff 77 04             	pushl  0x4(%edi)
801049dc:	68 3b 78 10 80       	push   $0x8010783b
801049e1:	53                   	push   %ebx
801049e2:	e8 39 d4 ff ff       	call   80101e20 <dirlink>
801049e7:	83 c4 10             	add    $0x10,%esp
801049ea:	85 c0                	test   %eax,%eax
801049ec:	79 82                	jns    80104970 <create+0xf0>
      panic("create dots");
801049ee:	83 ec 0c             	sub    $0xc,%esp
801049f1:	68 2f 78 10 80       	push   $0x8010782f
801049f6:	e8 75 b9 ff ff       	call   80100370 <panic>
  }

  if(dirlink(dp, name, ip->inum) < 0)
    panic("create: dirlink");
801049fb:	83 ec 0c             	sub    $0xc,%esp
801049fe:	68 3e 78 10 80       	push   $0x8010783e
80104a03:	e8 68 b9 ff ff       	call   80100370 <panic>
    iunlockput(ip);
    return 0;
  }

  if((ip = ialloc(dp->dev, type)) == 0)
    panic("create: ialloc");
80104a08:	83 ec 0c             	sub    $0xc,%esp
80104a0b:	68 20 78 10 80       	push   $0x80107820
80104a10:	e8 5b b9 ff ff       	call   80100370 <panic>
80104a15:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104a19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104a20 <argfd.constprop.0>:
#include "fcntl.h"

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
80104a20:	55                   	push   %ebp
80104a21:	89 e5                	mov    %esp,%ebp
80104a23:	56                   	push   %esi
80104a24:	53                   	push   %ebx
80104a25:	89 c6                	mov    %eax,%esi
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
80104a27:	8d 45 f4             	lea    -0xc(%ebp),%eax
#include "fcntl.h"

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
80104a2a:	89 d3                	mov    %edx,%ebx
80104a2c:	83 ec 18             	sub    $0x18,%esp
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
80104a2f:	50                   	push   %eax
80104a30:	6a 00                	push   $0x0
80104a32:	e8 e9 fc ff ff       	call   80104720 <argint>
80104a37:	83 c4 10             	add    $0x10,%esp
80104a3a:	85 c0                	test   %eax,%eax
80104a3c:	78 32                	js     80104a70 <argfd.constprop.0+0x50>
    return -1;
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
80104a3e:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104a42:	77 2c                	ja     80104a70 <argfd.constprop.0+0x50>
80104a44:	e8 57 ed ff ff       	call   801037a0 <myproc>
80104a49:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104a4c:	8b 44 90 28          	mov    0x28(%eax,%edx,4),%eax
80104a50:	85 c0                	test   %eax,%eax
80104a52:	74 1c                	je     80104a70 <argfd.constprop.0+0x50>
    return -1;
  if(pfd)
80104a54:	85 f6                	test   %esi,%esi
80104a56:	74 02                	je     80104a5a <argfd.constprop.0+0x3a>
    *pfd = fd;
80104a58:	89 16                	mov    %edx,(%esi)
  if(pf)
80104a5a:	85 db                	test   %ebx,%ebx
80104a5c:	74 22                	je     80104a80 <argfd.constprop.0+0x60>
    *pf = f;
80104a5e:	89 03                	mov    %eax,(%ebx)
  return 0;
80104a60:	31 c0                	xor    %eax,%eax
}
80104a62:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104a65:	5b                   	pop    %ebx
80104a66:	5e                   	pop    %esi
80104a67:	5d                   	pop    %ebp
80104a68:	c3                   	ret    
80104a69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104a70:	8d 65 f8             	lea    -0x8(%ebp),%esp
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    return -1;
80104a73:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if(pfd)
    *pfd = fd;
  if(pf)
    *pf = f;
  return 0;
}
80104a78:	5b                   	pop    %ebx
80104a79:	5e                   	pop    %esi
80104a7a:	5d                   	pop    %ebp
80104a7b:	c3                   	ret    
80104a7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
  if(pfd)
    *pfd = fd;
  if(pf)
    *pf = f;
  return 0;
80104a80:	31 c0                	xor    %eax,%eax
80104a82:	eb de                	jmp    80104a62 <argfd.constprop.0+0x42>
80104a84:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104a8a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104a90 <sys_dup>:
  return -1;
}

int
sys_dup(void)
{
80104a90:	55                   	push   %ebp
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
80104a91:	31 c0                	xor    %eax,%eax
  return -1;
}

int
sys_dup(void)
{
80104a93:	89 e5                	mov    %esp,%ebp
80104a95:	56                   	push   %esi
80104a96:	53                   	push   %ebx
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
80104a97:	8d 55 f4             	lea    -0xc(%ebp),%edx
  return -1;
}

int
sys_dup(void)
{
80104a9a:	83 ec 10             	sub    $0x10,%esp
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
80104a9d:	e8 7e ff ff ff       	call   80104a20 <argfd.constprop.0>
80104aa2:	85 c0                	test   %eax,%eax
80104aa4:	78 1a                	js     80104ac0 <sys_dup+0x30>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
80104aa6:	31 db                	xor    %ebx,%ebx
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
80104aa8:	8b 75 f4             	mov    -0xc(%ebp),%esi
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();
80104aab:	e8 f0 ec ff ff       	call   801037a0 <myproc>

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
80104ab0:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80104ab4:	85 d2                	test   %edx,%edx
80104ab6:	74 18                	je     80104ad0 <sys_dup+0x40>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
80104ab8:	83 c3 01             	add    $0x1,%ebx
80104abb:	83 fb 10             	cmp    $0x10,%ebx
80104abe:	75 f0                	jne    80104ab0 <sys_dup+0x20>
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
  return fd;
}
80104ac0:	8d 65 f8             	lea    -0x8(%ebp),%esp
{
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    return -1;
80104ac3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
  return fd;
}
80104ac8:	5b                   	pop    %ebx
80104ac9:	5e                   	pop    %esi
80104aca:	5d                   	pop    %ebp
80104acb:	c3                   	ret    
80104acc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
      curproc->ofile[fd] = f;
80104ad0:	89 74 98 28          	mov    %esi,0x28(%eax,%ebx,4)

  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
80104ad4:	83 ec 0c             	sub    $0xc,%esp
80104ad7:	ff 75 f4             	pushl  -0xc(%ebp)
80104ada:	e8 21 c3 ff ff       	call   80100e00 <filedup>
  return fd;
80104adf:	83 c4 10             	add    $0x10,%esp
}
80104ae2:	8d 65 f8             	lea    -0x8(%ebp),%esp
  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
  return fd;
80104ae5:	89 d8                	mov    %ebx,%eax
}
80104ae7:	5b                   	pop    %ebx
80104ae8:	5e                   	pop    %esi
80104ae9:	5d                   	pop    %ebp
80104aea:	c3                   	ret    
80104aeb:	90                   	nop
80104aec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104af0 <sys_read>:

int
sys_read(void)
{
80104af0:	55                   	push   %ebp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104af1:	31 c0                	xor    %eax,%eax
  return fd;
}

int
sys_read(void)
{
80104af3:	89 e5                	mov    %esp,%ebp
80104af5:	83 ec 18             	sub    $0x18,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104af8:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104afb:	e8 20 ff ff ff       	call   80104a20 <argfd.constprop.0>
80104b00:	85 c0                	test   %eax,%eax
80104b02:	78 4c                	js     80104b50 <sys_read+0x60>
80104b04:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104b07:	83 ec 08             	sub    $0x8,%esp
80104b0a:	50                   	push   %eax
80104b0b:	6a 02                	push   $0x2
80104b0d:	e8 0e fc ff ff       	call   80104720 <argint>
80104b12:	83 c4 10             	add    $0x10,%esp
80104b15:	85 c0                	test   %eax,%eax
80104b17:	78 37                	js     80104b50 <sys_read+0x60>
80104b19:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104b1c:	83 ec 04             	sub    $0x4,%esp
80104b1f:	ff 75 f0             	pushl  -0x10(%ebp)
80104b22:	50                   	push   %eax
80104b23:	6a 01                	push   $0x1
80104b25:	e8 36 fc ff ff       	call   80104760 <argptr>
80104b2a:	83 c4 10             	add    $0x10,%esp
80104b2d:	85 c0                	test   %eax,%eax
80104b2f:	78 1f                	js     80104b50 <sys_read+0x60>
    return -1;
  return fileread(f, p, n);
80104b31:	83 ec 04             	sub    $0x4,%esp
80104b34:	ff 75 f0             	pushl  -0x10(%ebp)
80104b37:	ff 75 f4             	pushl  -0xc(%ebp)
80104b3a:	ff 75 ec             	pushl  -0x14(%ebp)
80104b3d:	e8 2e c4 ff ff       	call   80100f70 <fileread>
80104b42:	83 c4 10             	add    $0x10,%esp
}
80104b45:	c9                   	leave  
80104b46:	c3                   	ret    
80104b47:	89 f6                	mov    %esi,%esi
80104b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
    return -1;
80104b50:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fileread(f, p, n);
}
80104b55:	c9                   	leave  
80104b56:	c3                   	ret    
80104b57:	89 f6                	mov    %esi,%esi
80104b59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104b60 <sys_write>:

int
sys_write(void)
{
80104b60:	55                   	push   %ebp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104b61:	31 c0                	xor    %eax,%eax
  return fileread(f, p, n);
}

int
sys_write(void)
{
80104b63:	89 e5                	mov    %esp,%ebp
80104b65:	83 ec 18             	sub    $0x18,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104b68:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104b6b:	e8 b0 fe ff ff       	call   80104a20 <argfd.constprop.0>
80104b70:	85 c0                	test   %eax,%eax
80104b72:	78 4c                	js     80104bc0 <sys_write+0x60>
80104b74:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104b77:	83 ec 08             	sub    $0x8,%esp
80104b7a:	50                   	push   %eax
80104b7b:	6a 02                	push   $0x2
80104b7d:	e8 9e fb ff ff       	call   80104720 <argint>
80104b82:	83 c4 10             	add    $0x10,%esp
80104b85:	85 c0                	test   %eax,%eax
80104b87:	78 37                	js     80104bc0 <sys_write+0x60>
80104b89:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104b8c:	83 ec 04             	sub    $0x4,%esp
80104b8f:	ff 75 f0             	pushl  -0x10(%ebp)
80104b92:	50                   	push   %eax
80104b93:	6a 01                	push   $0x1
80104b95:	e8 c6 fb ff ff       	call   80104760 <argptr>
80104b9a:	83 c4 10             	add    $0x10,%esp
80104b9d:	85 c0                	test   %eax,%eax
80104b9f:	78 1f                	js     80104bc0 <sys_write+0x60>
    return -1;
  return filewrite(f, p, n);
80104ba1:	83 ec 04             	sub    $0x4,%esp
80104ba4:	ff 75 f0             	pushl  -0x10(%ebp)
80104ba7:	ff 75 f4             	pushl  -0xc(%ebp)
80104baa:	ff 75 ec             	pushl  -0x14(%ebp)
80104bad:	e8 4e c4 ff ff       	call   80101000 <filewrite>
80104bb2:	83 c4 10             	add    $0x10,%esp
}
80104bb5:	c9                   	leave  
80104bb6:	c3                   	ret    
80104bb7:	89 f6                	mov    %esi,%esi
80104bb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
    return -1;
80104bc0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return filewrite(f, p, n);
}
80104bc5:	c9                   	leave  
80104bc6:	c3                   	ret    
80104bc7:	89 f6                	mov    %esi,%esi
80104bc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104bd0 <sys_close>:

int
sys_close(void)
{
80104bd0:	55                   	push   %ebp
80104bd1:	89 e5                	mov    %esp,%ebp
80104bd3:	83 ec 18             	sub    $0x18,%esp
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
80104bd6:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104bd9:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104bdc:	e8 3f fe ff ff       	call   80104a20 <argfd.constprop.0>
80104be1:	85 c0                	test   %eax,%eax
80104be3:	78 2b                	js     80104c10 <sys_close+0x40>
    return -1;
  myproc()->ofile[fd] = 0;
80104be5:	e8 b6 eb ff ff       	call   801037a0 <myproc>
80104bea:	8b 55 f0             	mov    -0x10(%ebp),%edx
  fileclose(f);
80104bed:	83 ec 0c             	sub    $0xc,%esp
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    return -1;
  myproc()->ofile[fd] = 0;
80104bf0:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80104bf7:	00 
  fileclose(f);
80104bf8:	ff 75 f4             	pushl  -0xc(%ebp)
80104bfb:	e8 50 c2 ff ff       	call   80100e50 <fileclose>
  return 0;
80104c00:	83 c4 10             	add    $0x10,%esp
80104c03:	31 c0                	xor    %eax,%eax
}
80104c05:	c9                   	leave  
80104c06:	c3                   	ret    
80104c07:	89 f6                	mov    %esi,%esi
80104c09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
{
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    return -1;
80104c10:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  myproc()->ofile[fd] = 0;
  fileclose(f);
  return 0;
}
80104c15:	c9                   	leave  
80104c16:	c3                   	ret    
80104c17:	89 f6                	mov    %esi,%esi
80104c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104c20 <sys_fstat>:

int
sys_fstat(void)
{
80104c20:	55                   	push   %ebp
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104c21:	31 c0                	xor    %eax,%eax
  return 0;
}

int
sys_fstat(void)
{
80104c23:	89 e5                	mov    %esp,%ebp
80104c25:	83 ec 18             	sub    $0x18,%esp
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104c28:	8d 55 f0             	lea    -0x10(%ebp),%edx
80104c2b:	e8 f0 fd ff ff       	call   80104a20 <argfd.constprop.0>
80104c30:	85 c0                	test   %eax,%eax
80104c32:	78 2c                	js     80104c60 <sys_fstat+0x40>
80104c34:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104c37:	83 ec 04             	sub    $0x4,%esp
80104c3a:	6a 14                	push   $0x14
80104c3c:	50                   	push   %eax
80104c3d:	6a 01                	push   $0x1
80104c3f:	e8 1c fb ff ff       	call   80104760 <argptr>
80104c44:	83 c4 10             	add    $0x10,%esp
80104c47:	85 c0                	test   %eax,%eax
80104c49:	78 15                	js     80104c60 <sys_fstat+0x40>
    return -1;
  return filestat(f, st);
80104c4b:	83 ec 08             	sub    $0x8,%esp
80104c4e:	ff 75 f4             	pushl  -0xc(%ebp)
80104c51:	ff 75 f0             	pushl  -0x10(%ebp)
80104c54:	e8 c7 c2 ff ff       	call   80100f20 <filestat>
80104c59:	83 c4 10             	add    $0x10,%esp
}
80104c5c:	c9                   	leave  
80104c5d:	c3                   	ret    
80104c5e:	66 90                	xchg   %ax,%ax
{
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
    return -1;
80104c60:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return filestat(f, st);
}
80104c65:	c9                   	leave  
80104c66:	c3                   	ret    
80104c67:	89 f6                	mov    %esi,%esi
80104c69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104c70 <sys_link>:

// Create the path new as a link to the same inode as old.
int
sys_link(void)
{
80104c70:	55                   	push   %ebp
80104c71:	89 e5                	mov    %esp,%ebp
80104c73:	57                   	push   %edi
80104c74:	56                   	push   %esi
80104c75:	53                   	push   %ebx
  char name[DIRSIZ], *new, *old;
  struct inode *dp, *ip;

  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104c76:	8d 45 d4             	lea    -0x2c(%ebp),%eax
}

// Create the path new as a link to the same inode as old.
int
sys_link(void)
{
80104c79:	83 ec 34             	sub    $0x34,%esp
  char name[DIRSIZ], *new, *old;
  struct inode *dp, *ip;

  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104c7c:	50                   	push   %eax
80104c7d:	6a 00                	push   $0x0
80104c7f:	e8 2c fb ff ff       	call   801047b0 <argstr>
80104c84:	83 c4 10             	add    $0x10,%esp
80104c87:	85 c0                	test   %eax,%eax
80104c89:	0f 88 fb 00 00 00    	js     80104d8a <sys_link+0x11a>
80104c8f:	8d 45 d0             	lea    -0x30(%ebp),%eax
80104c92:	83 ec 08             	sub    $0x8,%esp
80104c95:	50                   	push   %eax
80104c96:	6a 01                	push   $0x1
80104c98:	e8 13 fb ff ff       	call   801047b0 <argstr>
80104c9d:	83 c4 10             	add    $0x10,%esp
80104ca0:	85 c0                	test   %eax,%eax
80104ca2:	0f 88 e2 00 00 00    	js     80104d8a <sys_link+0x11a>
    return -1;

  begin_op();
80104ca8:	e8 c3 de ff ff       	call   80102b70 <begin_op>
  if((ip = namei(old)) == 0){
80104cad:	83 ec 0c             	sub    $0xc,%esp
80104cb0:	ff 75 d4             	pushl  -0x2c(%ebp)
80104cb3:	e8 28 d2 ff ff       	call   80101ee0 <namei>
80104cb8:	83 c4 10             	add    $0x10,%esp
80104cbb:	85 c0                	test   %eax,%eax
80104cbd:	89 c3                	mov    %eax,%ebx
80104cbf:	0f 84 f3 00 00 00    	je     80104db8 <sys_link+0x148>
    end_op();
    return -1;
  }

  ilock(ip);
80104cc5:	83 ec 0c             	sub    $0xc,%esp
80104cc8:	50                   	push   %eax
80104cc9:	e8 c2 c9 ff ff       	call   80101690 <ilock>
  if(ip->type == T_DIR){
80104cce:	83 c4 10             	add    $0x10,%esp
80104cd1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104cd6:	0f 84 c4 00 00 00    	je     80104da0 <sys_link+0x130>
    iunlockput(ip);
    end_op();
    return -1;
  }

  ip->nlink++;
80104cdc:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
  iupdate(ip);
80104ce1:	83 ec 0c             	sub    $0xc,%esp
  iunlock(ip);

  if((dp = nameiparent(new, name)) == 0)
80104ce4:	8d 7d da             	lea    -0x26(%ebp),%edi
    end_op();
    return -1;
  }

  ip->nlink++;
  iupdate(ip);
80104ce7:	53                   	push   %ebx
80104ce8:	e8 f3 c8 ff ff       	call   801015e0 <iupdate>
  iunlock(ip);
80104ced:	89 1c 24             	mov    %ebx,(%esp)
80104cf0:	e8 7b ca ff ff       	call   80101770 <iunlock>

  if((dp = nameiparent(new, name)) == 0)
80104cf5:	58                   	pop    %eax
80104cf6:	5a                   	pop    %edx
80104cf7:	57                   	push   %edi
80104cf8:	ff 75 d0             	pushl  -0x30(%ebp)
80104cfb:	e8 00 d2 ff ff       	call   80101f00 <nameiparent>
80104d00:	83 c4 10             	add    $0x10,%esp
80104d03:	85 c0                	test   %eax,%eax
80104d05:	89 c6                	mov    %eax,%esi
80104d07:	74 5b                	je     80104d64 <sys_link+0xf4>
    goto bad;
  ilock(dp);
80104d09:	83 ec 0c             	sub    $0xc,%esp
80104d0c:	50                   	push   %eax
80104d0d:	e8 7e c9 ff ff       	call   80101690 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
80104d12:	83 c4 10             	add    $0x10,%esp
80104d15:	8b 03                	mov    (%ebx),%eax
80104d17:	39 06                	cmp    %eax,(%esi)
80104d19:	75 3d                	jne    80104d58 <sys_link+0xe8>
80104d1b:	83 ec 04             	sub    $0x4,%esp
80104d1e:	ff 73 04             	pushl  0x4(%ebx)
80104d21:	57                   	push   %edi
80104d22:	56                   	push   %esi
80104d23:	e8 f8 d0 ff ff       	call   80101e20 <dirlink>
80104d28:	83 c4 10             	add    $0x10,%esp
80104d2b:	85 c0                	test   %eax,%eax
80104d2d:	78 29                	js     80104d58 <sys_link+0xe8>
    iunlockput(dp);
    goto bad;
  }
  iunlockput(dp);
80104d2f:	83 ec 0c             	sub    $0xc,%esp
80104d32:	56                   	push   %esi
80104d33:	e8 e8 cb ff ff       	call   80101920 <iunlockput>
  iput(ip);
80104d38:	89 1c 24             	mov    %ebx,(%esp)
80104d3b:	e8 80 ca ff ff       	call   801017c0 <iput>

  end_op();
80104d40:	e8 9b de ff ff       	call   80102be0 <end_op>

  return 0;
80104d45:	83 c4 10             	add    $0x10,%esp
80104d48:	31 c0                	xor    %eax,%eax
  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);
  end_op();
  return -1;
}
80104d4a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104d4d:	5b                   	pop    %ebx
80104d4e:	5e                   	pop    %esi
80104d4f:	5f                   	pop    %edi
80104d50:	5d                   	pop    %ebp
80104d51:	c3                   	ret    
80104d52:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  if((dp = nameiparent(new, name)) == 0)
    goto bad;
  ilock(dp);
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    iunlockput(dp);
80104d58:	83 ec 0c             	sub    $0xc,%esp
80104d5b:	56                   	push   %esi
80104d5c:	e8 bf cb ff ff       	call   80101920 <iunlockput>
    goto bad;
80104d61:	83 c4 10             	add    $0x10,%esp
  end_op();

  return 0;

bad:
  ilock(ip);
80104d64:	83 ec 0c             	sub    $0xc,%esp
80104d67:	53                   	push   %ebx
80104d68:	e8 23 c9 ff ff       	call   80101690 <ilock>
  ip->nlink--;
80104d6d:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80104d72:	89 1c 24             	mov    %ebx,(%esp)
80104d75:	e8 66 c8 ff ff       	call   801015e0 <iupdate>
  iunlockput(ip);
80104d7a:	89 1c 24             	mov    %ebx,(%esp)
80104d7d:	e8 9e cb ff ff       	call   80101920 <iunlockput>
  end_op();
80104d82:	e8 59 de ff ff       	call   80102be0 <end_op>
  return -1;
80104d87:	83 c4 10             	add    $0x10,%esp
}
80104d8a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  ilock(ip);
  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);
  end_op();
  return -1;
80104d8d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104d92:	5b                   	pop    %ebx
80104d93:	5e                   	pop    %esi
80104d94:	5f                   	pop    %edi
80104d95:	5d                   	pop    %ebp
80104d96:	c3                   	ret    
80104d97:	89 f6                	mov    %esi,%esi
80104d99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
  }

  ilock(ip);
  if(ip->type == T_DIR){
    iunlockput(ip);
80104da0:	83 ec 0c             	sub    $0xc,%esp
80104da3:	53                   	push   %ebx
80104da4:	e8 77 cb ff ff       	call   80101920 <iunlockput>
    end_op();
80104da9:	e8 32 de ff ff       	call   80102be0 <end_op>
    return -1;
80104dae:	83 c4 10             	add    $0x10,%esp
80104db1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104db6:	eb 92                	jmp    80104d4a <sys_link+0xda>
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
    return -1;

  begin_op();
  if((ip = namei(old)) == 0){
    end_op();
80104db8:	e8 23 de ff ff       	call   80102be0 <end_op>
    return -1;
80104dbd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104dc2:	eb 86                	jmp    80104d4a <sys_link+0xda>
80104dc4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104dca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104dd0 <sys_unlink>:
}

//PAGEBREAK!
int
sys_unlink(void)
{
80104dd0:	55                   	push   %ebp
80104dd1:	89 e5                	mov    %esp,%ebp
80104dd3:	57                   	push   %edi
80104dd4:	56                   	push   %esi
80104dd5:	53                   	push   %ebx
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
80104dd6:	8d 45 c0             	lea    -0x40(%ebp),%eax
}

//PAGEBREAK!
int
sys_unlink(void)
{
80104dd9:	83 ec 54             	sub    $0x54,%esp
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
80104ddc:	50                   	push   %eax
80104ddd:	6a 00                	push   $0x0
80104ddf:	e8 cc f9 ff ff       	call   801047b0 <argstr>
80104de4:	83 c4 10             	add    $0x10,%esp
80104de7:	85 c0                	test   %eax,%eax
80104de9:	0f 88 82 01 00 00    	js     80104f71 <sys_unlink+0x1a1>
    return -1;

  begin_op();
  if((dp = nameiparent(path, name)) == 0){
80104def:	8d 5d ca             	lea    -0x36(%ebp),%ebx
  uint off;

  if(argstr(0, &path) < 0)
    return -1;

  begin_op();
80104df2:	e8 79 dd ff ff       	call   80102b70 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
80104df7:	83 ec 08             	sub    $0x8,%esp
80104dfa:	53                   	push   %ebx
80104dfb:	ff 75 c0             	pushl  -0x40(%ebp)
80104dfe:	e8 fd d0 ff ff       	call   80101f00 <nameiparent>
80104e03:	83 c4 10             	add    $0x10,%esp
80104e06:	85 c0                	test   %eax,%eax
80104e08:	89 45 b4             	mov    %eax,-0x4c(%ebp)
80104e0b:	0f 84 6a 01 00 00    	je     80104f7b <sys_unlink+0x1ab>
    end_op();
    return -1;
  }

  ilock(dp);
80104e11:	8b 75 b4             	mov    -0x4c(%ebp),%esi
80104e14:	83 ec 0c             	sub    $0xc,%esp
80104e17:	56                   	push   %esi
80104e18:	e8 73 c8 ff ff       	call   80101690 <ilock>

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
80104e1d:	58                   	pop    %eax
80104e1e:	5a                   	pop    %edx
80104e1f:	68 3c 78 10 80       	push   $0x8010783c
80104e24:	53                   	push   %ebx
80104e25:	e8 76 cd ff ff       	call   80101ba0 <namecmp>
80104e2a:	83 c4 10             	add    $0x10,%esp
80104e2d:	85 c0                	test   %eax,%eax
80104e2f:	0f 84 fc 00 00 00    	je     80104f31 <sys_unlink+0x161>
80104e35:	83 ec 08             	sub    $0x8,%esp
80104e38:	68 3b 78 10 80       	push   $0x8010783b
80104e3d:	53                   	push   %ebx
80104e3e:	e8 5d cd ff ff       	call   80101ba0 <namecmp>
80104e43:	83 c4 10             	add    $0x10,%esp
80104e46:	85 c0                	test   %eax,%eax
80104e48:	0f 84 e3 00 00 00    	je     80104f31 <sys_unlink+0x161>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
80104e4e:	8d 45 c4             	lea    -0x3c(%ebp),%eax
80104e51:	83 ec 04             	sub    $0x4,%esp
80104e54:	50                   	push   %eax
80104e55:	53                   	push   %ebx
80104e56:	56                   	push   %esi
80104e57:	e8 64 cd ff ff       	call   80101bc0 <dirlookup>
80104e5c:	83 c4 10             	add    $0x10,%esp
80104e5f:	85 c0                	test   %eax,%eax
80104e61:	89 c3                	mov    %eax,%ebx
80104e63:	0f 84 c8 00 00 00    	je     80104f31 <sys_unlink+0x161>
    goto bad;
  ilock(ip);
80104e69:	83 ec 0c             	sub    $0xc,%esp
80104e6c:	50                   	push   %eax
80104e6d:	e8 1e c8 ff ff       	call   80101690 <ilock>

  if(ip->nlink < 1)
80104e72:	83 c4 10             	add    $0x10,%esp
80104e75:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80104e7a:	0f 8e 24 01 00 00    	jle    80104fa4 <sys_unlink+0x1d4>
    panic("unlink: nlink < 1");
  if(ip->type == T_DIR && !isdirempty(ip)){
80104e80:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104e85:	8d 75 d8             	lea    -0x28(%ebp),%esi
80104e88:	74 66                	je     80104ef0 <sys_unlink+0x120>
    iunlockput(ip);
    goto bad;
  }

  memset(&de, 0, sizeof(de));
80104e8a:	83 ec 04             	sub    $0x4,%esp
80104e8d:	6a 10                	push   $0x10
80104e8f:	6a 00                	push   $0x0
80104e91:	56                   	push   %esi
80104e92:	e8 99 f5 ff ff       	call   80104430 <memset>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80104e97:	6a 10                	push   $0x10
80104e99:	ff 75 c4             	pushl  -0x3c(%ebp)
80104e9c:	56                   	push   %esi
80104e9d:	ff 75 b4             	pushl  -0x4c(%ebp)
80104ea0:	e8 cb cb ff ff       	call   80101a70 <writei>
80104ea5:	83 c4 20             	add    $0x20,%esp
80104ea8:	83 f8 10             	cmp    $0x10,%eax
80104eab:	0f 85 e6 00 00 00    	jne    80104f97 <sys_unlink+0x1c7>
    panic("unlink: writei");
  if(ip->type == T_DIR){
80104eb1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104eb6:	0f 84 9c 00 00 00    	je     80104f58 <sys_unlink+0x188>
    dp->nlink--;
    iupdate(dp);
  }
  iunlockput(dp);
80104ebc:	83 ec 0c             	sub    $0xc,%esp
80104ebf:	ff 75 b4             	pushl  -0x4c(%ebp)
80104ec2:	e8 59 ca ff ff       	call   80101920 <iunlockput>

  ip->nlink--;
80104ec7:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80104ecc:	89 1c 24             	mov    %ebx,(%esp)
80104ecf:	e8 0c c7 ff ff       	call   801015e0 <iupdate>
  iunlockput(ip);
80104ed4:	89 1c 24             	mov    %ebx,(%esp)
80104ed7:	e8 44 ca ff ff       	call   80101920 <iunlockput>

  end_op();
80104edc:	e8 ff dc ff ff       	call   80102be0 <end_op>

  return 0;
80104ee1:	83 c4 10             	add    $0x10,%esp
80104ee4:	31 c0                	xor    %eax,%eax

bad:
  iunlockput(dp);
  end_op();
  return -1;
}
80104ee6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104ee9:	5b                   	pop    %ebx
80104eea:	5e                   	pop    %esi
80104eeb:	5f                   	pop    %edi
80104eec:	5d                   	pop    %ebp
80104eed:	c3                   	ret    
80104eee:	66 90                	xchg   %ax,%ax
isdirempty(struct inode *dp)
{
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
80104ef0:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80104ef4:	76 94                	jbe    80104e8a <sys_unlink+0xba>
80104ef6:	bf 20 00 00 00       	mov    $0x20,%edi
80104efb:	eb 0f                	jmp    80104f0c <sys_unlink+0x13c>
80104efd:	8d 76 00             	lea    0x0(%esi),%esi
80104f00:	83 c7 10             	add    $0x10,%edi
80104f03:	3b 7b 58             	cmp    0x58(%ebx),%edi
80104f06:	0f 83 7e ff ff ff    	jae    80104e8a <sys_unlink+0xba>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80104f0c:	6a 10                	push   $0x10
80104f0e:	57                   	push   %edi
80104f0f:	56                   	push   %esi
80104f10:	53                   	push   %ebx
80104f11:	e8 5a ca ff ff       	call   80101970 <readi>
80104f16:	83 c4 10             	add    $0x10,%esp
80104f19:	83 f8 10             	cmp    $0x10,%eax
80104f1c:	75 6c                	jne    80104f8a <sys_unlink+0x1ba>
      panic("isdirempty: readi");
    if(de.inum != 0)
80104f1e:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80104f23:	74 db                	je     80104f00 <sys_unlink+0x130>
  ilock(ip);

  if(ip->nlink < 1)
    panic("unlink: nlink < 1");
  if(ip->type == T_DIR && !isdirempty(ip)){
    iunlockput(ip);
80104f25:	83 ec 0c             	sub    $0xc,%esp
80104f28:	53                   	push   %ebx
80104f29:	e8 f2 c9 ff ff       	call   80101920 <iunlockput>
    goto bad;
80104f2e:	83 c4 10             	add    $0x10,%esp
  end_op();

  return 0;

bad:
  iunlockput(dp);
80104f31:	83 ec 0c             	sub    $0xc,%esp
80104f34:	ff 75 b4             	pushl  -0x4c(%ebp)
80104f37:	e8 e4 c9 ff ff       	call   80101920 <iunlockput>
  end_op();
80104f3c:	e8 9f dc ff ff       	call   80102be0 <end_op>
  return -1;
80104f41:	83 c4 10             	add    $0x10,%esp
}
80104f44:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;

bad:
  iunlockput(dp);
  end_op();
  return -1;
80104f47:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104f4c:	5b                   	pop    %ebx
80104f4d:	5e                   	pop    %esi
80104f4e:	5f                   	pop    %edi
80104f4f:	5d                   	pop    %ebp
80104f50:	c3                   	ret    
80104f51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
  if(ip->type == T_DIR){
    dp->nlink--;
80104f58:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    iupdate(dp);
80104f5b:	83 ec 0c             	sub    $0xc,%esp

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
  if(ip->type == T_DIR){
    dp->nlink--;
80104f5e:	66 83 68 56 01       	subw   $0x1,0x56(%eax)
    iupdate(dp);
80104f63:	50                   	push   %eax
80104f64:	e8 77 c6 ff ff       	call   801015e0 <iupdate>
80104f69:	83 c4 10             	add    $0x10,%esp
80104f6c:	e9 4b ff ff ff       	jmp    80104ebc <sys_unlink+0xec>
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
    return -1;
80104f71:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104f76:	e9 6b ff ff ff       	jmp    80104ee6 <sys_unlink+0x116>

  begin_op();
  if((dp = nameiparent(path, name)) == 0){
    end_op();
80104f7b:	e8 60 dc ff ff       	call   80102be0 <end_op>
    return -1;
80104f80:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104f85:	e9 5c ff ff ff       	jmp    80104ee6 <sys_unlink+0x116>
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("isdirempty: readi");
80104f8a:	83 ec 0c             	sub    $0xc,%esp
80104f8d:	68 60 78 10 80       	push   $0x80107860
80104f92:	e8 d9 b3 ff ff       	call   80100370 <panic>
    goto bad;
  }

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
80104f97:	83 ec 0c             	sub    $0xc,%esp
80104f9a:	68 72 78 10 80       	push   $0x80107872
80104f9f:	e8 cc b3 ff ff       	call   80100370 <panic>
  if((ip = dirlookup(dp, name, &off)) == 0)
    goto bad;
  ilock(ip);

  if(ip->nlink < 1)
    panic("unlink: nlink < 1");
80104fa4:	83 ec 0c             	sub    $0xc,%esp
80104fa7:	68 4e 78 10 80       	push   $0x8010784e
80104fac:	e8 bf b3 ff ff       	call   80100370 <panic>
80104fb1:	eb 0d                	jmp    80104fc0 <sys_open>
80104fb3:	90                   	nop
80104fb4:	90                   	nop
80104fb5:	90                   	nop
80104fb6:	90                   	nop
80104fb7:	90                   	nop
80104fb8:	90                   	nop
80104fb9:	90                   	nop
80104fba:	90                   	nop
80104fbb:	90                   	nop
80104fbc:	90                   	nop
80104fbd:	90                   	nop
80104fbe:	90                   	nop
80104fbf:	90                   	nop

80104fc0 <sys_open>:
  return ip;
}

int
sys_open(void)
{
80104fc0:	55                   	push   %ebp
80104fc1:	89 e5                	mov    %esp,%ebp
80104fc3:	57                   	push   %edi
80104fc4:	56                   	push   %esi
80104fc5:	53                   	push   %ebx
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
80104fc6:	8d 45 e0             	lea    -0x20(%ebp),%eax
  return ip;
}

int
sys_open(void)
{
80104fc9:	83 ec 24             	sub    $0x24,%esp
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
80104fcc:	50                   	push   %eax
80104fcd:	6a 00                	push   $0x0
80104fcf:	e8 dc f7 ff ff       	call   801047b0 <argstr>
80104fd4:	83 c4 10             	add    $0x10,%esp
80104fd7:	85 c0                	test   %eax,%eax
80104fd9:	0f 88 9e 00 00 00    	js     8010507d <sys_open+0xbd>
80104fdf:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80104fe2:	83 ec 08             	sub    $0x8,%esp
80104fe5:	50                   	push   %eax
80104fe6:	6a 01                	push   $0x1
80104fe8:	e8 33 f7 ff ff       	call   80104720 <argint>
80104fed:	83 c4 10             	add    $0x10,%esp
80104ff0:	85 c0                	test   %eax,%eax
80104ff2:	0f 88 85 00 00 00    	js     8010507d <sys_open+0xbd>
    return -1;

  begin_op();
80104ff8:	e8 73 db ff ff       	call   80102b70 <begin_op>

  if(omode & O_CREATE){
80104ffd:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
80105001:	0f 85 89 00 00 00    	jne    80105090 <sys_open+0xd0>
    if(ip == 0){
      end_op();
      return -1;
    }
  } else {
    if((ip = namei(path)) == 0){
80105007:	83 ec 0c             	sub    $0xc,%esp
8010500a:	ff 75 e0             	pushl  -0x20(%ebp)
8010500d:	e8 ce ce ff ff       	call   80101ee0 <namei>
80105012:	83 c4 10             	add    $0x10,%esp
80105015:	85 c0                	test   %eax,%eax
80105017:	89 c6                	mov    %eax,%esi
80105019:	0f 84 8e 00 00 00    	je     801050ad <sys_open+0xed>
      end_op();
      return -1;
    }
    ilock(ip);
8010501f:	83 ec 0c             	sub    $0xc,%esp
80105022:	50                   	push   %eax
80105023:	e8 68 c6 ff ff       	call   80101690 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
80105028:	83 c4 10             	add    $0x10,%esp
8010502b:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80105030:	0f 84 d2 00 00 00    	je     80105108 <sys_open+0x148>
      end_op();
      return -1;
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
80105036:	e8 55 bd ff ff       	call   80100d90 <filealloc>
8010503b:	85 c0                	test   %eax,%eax
8010503d:	89 c7                	mov    %eax,%edi
8010503f:	74 2b                	je     8010506c <sys_open+0xac>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
80105041:	31 db                	xor    %ebx,%ebx
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();
80105043:	e8 58 e7 ff ff       	call   801037a0 <myproc>
80105048:	90                   	nop
80105049:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
80105050:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80105054:	85 d2                	test   %edx,%edx
80105056:	74 68                	je     801050c0 <sys_open+0x100>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
80105058:	83 c3 01             	add    $0x1,%ebx
8010505b:	83 fb 10             	cmp    $0x10,%ebx
8010505e:	75 f0                	jne    80105050 <sys_open+0x90>
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    if(f)
      fileclose(f);
80105060:	83 ec 0c             	sub    $0xc,%esp
80105063:	57                   	push   %edi
80105064:	e8 e7 bd ff ff       	call   80100e50 <fileclose>
80105069:	83 c4 10             	add    $0x10,%esp
    iunlockput(ip);
8010506c:	83 ec 0c             	sub    $0xc,%esp
8010506f:	56                   	push   %esi
80105070:	e8 ab c8 ff ff       	call   80101920 <iunlockput>
    end_op();
80105075:	e8 66 db ff ff       	call   80102be0 <end_op>
    return -1;
8010507a:	83 c4 10             	add    $0x10,%esp
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  return fd;
}
8010507d:	8d 65 f4             	lea    -0xc(%ebp),%esp
  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    if(f)
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
80105080:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  return fd;
}
80105085:	5b                   	pop    %ebx
80105086:	5e                   	pop    %esi
80105087:	5f                   	pop    %edi
80105088:	5d                   	pop    %ebp
80105089:	c3                   	ret    
8010508a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;

  begin_op();

  if(omode & O_CREATE){
    ip = create(path, T_FILE, 0, 0);
80105090:	83 ec 0c             	sub    $0xc,%esp
80105093:	8b 45 e0             	mov    -0x20(%ebp),%eax
80105096:	31 c9                	xor    %ecx,%ecx
80105098:	6a 00                	push   $0x0
8010509a:	ba 02 00 00 00       	mov    $0x2,%edx
8010509f:	e8 dc f7 ff ff       	call   80104880 <create>
    if(ip == 0){
801050a4:	83 c4 10             	add    $0x10,%esp
801050a7:	85 c0                	test   %eax,%eax
    return -1;

  begin_op();

  if(omode & O_CREATE){
    ip = create(path, T_FILE, 0, 0);
801050a9:	89 c6                	mov    %eax,%esi
    if(ip == 0){
801050ab:	75 89                	jne    80105036 <sys_open+0x76>
      end_op();
801050ad:	e8 2e db ff ff       	call   80102be0 <end_op>
      return -1;
801050b2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801050b7:	eb 43                	jmp    801050fc <sys_open+0x13c>
801050b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
801050c0:	83 ec 0c             	sub    $0xc,%esp
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
      curproc->ofile[fd] = f;
801050c3:	89 7c 98 28          	mov    %edi,0x28(%eax,%ebx,4)
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
801050c7:	56                   	push   %esi
801050c8:	e8 a3 c6 ff ff       	call   80101770 <iunlock>
  end_op();
801050cd:	e8 0e db ff ff       	call   80102be0 <end_op>

  f->type = FD_INODE;
801050d2:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
801050d8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
801050db:	83 c4 10             	add    $0x10,%esp
  }
  iunlock(ip);
  end_op();

  f->type = FD_INODE;
  f->ip = ip;
801050de:	89 77 10             	mov    %esi,0x10(%edi)
  f->off = 0;
801050e1:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
  f->readable = !(omode & O_WRONLY);
801050e8:	89 d0                	mov    %edx,%eax
801050ea:	83 e0 01             	and    $0x1,%eax
801050ed:	83 f0 01             	xor    $0x1,%eax
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
801050f0:	83 e2 03             	and    $0x3,%edx
  end_op();

  f->type = FD_INODE;
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
801050f3:	88 47 08             	mov    %al,0x8(%edi)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
801050f6:	0f 95 47 09          	setne  0x9(%edi)
  return fd;
801050fa:	89 d8                	mov    %ebx,%eax
}
801050fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
801050ff:	5b                   	pop    %ebx
80105100:	5e                   	pop    %esi
80105101:	5f                   	pop    %edi
80105102:	5d                   	pop    %ebp
80105103:	c3                   	ret    
80105104:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if((ip = namei(path)) == 0){
      end_op();
      return -1;
    }
    ilock(ip);
    if(ip->type == T_DIR && omode != O_RDONLY){
80105108:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
8010510b:	85 c9                	test   %ecx,%ecx
8010510d:	0f 84 23 ff ff ff    	je     80105036 <sys_open+0x76>
80105113:	e9 54 ff ff ff       	jmp    8010506c <sys_open+0xac>
80105118:	90                   	nop
80105119:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105120 <sys_mkdir>:
  return fd;
}

int
sys_mkdir(void)
{
80105120:	55                   	push   %ebp
80105121:	89 e5                	mov    %esp,%ebp
80105123:	83 ec 18             	sub    $0x18,%esp
  char *path;
  struct inode *ip;

  begin_op();
80105126:	e8 45 da ff ff       	call   80102b70 <begin_op>
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
8010512b:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010512e:	83 ec 08             	sub    $0x8,%esp
80105131:	50                   	push   %eax
80105132:	6a 00                	push   $0x0
80105134:	e8 77 f6 ff ff       	call   801047b0 <argstr>
80105139:	83 c4 10             	add    $0x10,%esp
8010513c:	85 c0                	test   %eax,%eax
8010513e:	78 30                	js     80105170 <sys_mkdir+0x50>
80105140:	83 ec 0c             	sub    $0xc,%esp
80105143:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105146:	31 c9                	xor    %ecx,%ecx
80105148:	6a 00                	push   $0x0
8010514a:	ba 01 00 00 00       	mov    $0x1,%edx
8010514f:	e8 2c f7 ff ff       	call   80104880 <create>
80105154:	83 c4 10             	add    $0x10,%esp
80105157:	85 c0                	test   %eax,%eax
80105159:	74 15                	je     80105170 <sys_mkdir+0x50>
    end_op();
    return -1;
  }
  iunlockput(ip);
8010515b:	83 ec 0c             	sub    $0xc,%esp
8010515e:	50                   	push   %eax
8010515f:	e8 bc c7 ff ff       	call   80101920 <iunlockput>
  end_op();
80105164:	e8 77 da ff ff       	call   80102be0 <end_op>
  return 0;
80105169:	83 c4 10             	add    $0x10,%esp
8010516c:	31 c0                	xor    %eax,%eax
}
8010516e:	c9                   	leave  
8010516f:	c3                   	ret    
  char *path;
  struct inode *ip;

  begin_op();
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
    end_op();
80105170:	e8 6b da ff ff       	call   80102be0 <end_op>
    return -1;
80105175:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  iunlockput(ip);
  end_op();
  return 0;
}
8010517a:	c9                   	leave  
8010517b:	c3                   	ret    
8010517c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105180 <sys_mknod>:

int
sys_mknod(void)
{
80105180:	55                   	push   %ebp
80105181:	89 e5                	mov    %esp,%ebp
80105183:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
80105186:	e8 e5 d9 ff ff       	call   80102b70 <begin_op>
  if((argstr(0, &path)) < 0 ||
8010518b:	8d 45 ec             	lea    -0x14(%ebp),%eax
8010518e:	83 ec 08             	sub    $0x8,%esp
80105191:	50                   	push   %eax
80105192:	6a 00                	push   $0x0
80105194:	e8 17 f6 ff ff       	call   801047b0 <argstr>
80105199:	83 c4 10             	add    $0x10,%esp
8010519c:	85 c0                	test   %eax,%eax
8010519e:	78 60                	js     80105200 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
801051a0:	8d 45 f0             	lea    -0x10(%ebp),%eax
801051a3:	83 ec 08             	sub    $0x8,%esp
801051a6:	50                   	push   %eax
801051a7:	6a 01                	push   $0x1
801051a9:	e8 72 f5 ff ff       	call   80104720 <argint>
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
801051ae:	83 c4 10             	add    $0x10,%esp
801051b1:	85 c0                	test   %eax,%eax
801051b3:	78 4b                	js     80105200 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
801051b5:	8d 45 f4             	lea    -0xc(%ebp),%eax
801051b8:	83 ec 08             	sub    $0x8,%esp
801051bb:	50                   	push   %eax
801051bc:	6a 02                	push   $0x2
801051be:	e8 5d f5 ff ff       	call   80104720 <argint>
  char *path;
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
801051c3:	83 c4 10             	add    $0x10,%esp
801051c6:	85 c0                	test   %eax,%eax
801051c8:	78 36                	js     80105200 <sys_mknod+0x80>
     argint(2, &minor) < 0 ||
801051ca:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
801051ce:	83 ec 0c             	sub    $0xc,%esp
801051d1:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
801051d5:	ba 03 00 00 00       	mov    $0x3,%edx
801051da:	50                   	push   %eax
801051db:	8b 45 ec             	mov    -0x14(%ebp),%eax
801051de:	e8 9d f6 ff ff       	call   80104880 <create>
801051e3:	83 c4 10             	add    $0x10,%esp
801051e6:	85 c0                	test   %eax,%eax
801051e8:	74 16                	je     80105200 <sys_mknod+0x80>
     (ip = create(path, T_DEV, major, minor)) == 0){
    end_op();
    return -1;
  }
  iunlockput(ip);
801051ea:	83 ec 0c             	sub    $0xc,%esp
801051ed:	50                   	push   %eax
801051ee:	e8 2d c7 ff ff       	call   80101920 <iunlockput>
  end_op();
801051f3:	e8 e8 d9 ff ff       	call   80102be0 <end_op>
  return 0;
801051f8:	83 c4 10             	add    $0x10,%esp
801051fb:	31 c0                	xor    %eax,%eax
}
801051fd:	c9                   	leave  
801051fe:	c3                   	ret    
801051ff:	90                   	nop
  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
     (ip = create(path, T_DEV, major, minor)) == 0){
    end_op();
80105200:	e8 db d9 ff ff       	call   80102be0 <end_op>
    return -1;
80105205:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  iunlockput(ip);
  end_op();
  return 0;
}
8010520a:	c9                   	leave  
8010520b:	c3                   	ret    
8010520c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105210 <sys_chdir>:

int
sys_chdir(void)
{
80105210:	55                   	push   %ebp
80105211:	89 e5                	mov    %esp,%ebp
80105213:	56                   	push   %esi
80105214:	53                   	push   %ebx
80105215:	83 ec 10             	sub    $0x10,%esp
  char *path;
  struct inode *ip;
  struct proc *curproc = myproc();
80105218:	e8 83 e5 ff ff       	call   801037a0 <myproc>
8010521d:	89 c6                	mov    %eax,%esi
  
  begin_op();
8010521f:	e8 4c d9 ff ff       	call   80102b70 <begin_op>
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
80105224:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105227:	83 ec 08             	sub    $0x8,%esp
8010522a:	50                   	push   %eax
8010522b:	6a 00                	push   $0x0
8010522d:	e8 7e f5 ff ff       	call   801047b0 <argstr>
80105232:	83 c4 10             	add    $0x10,%esp
80105235:	85 c0                	test   %eax,%eax
80105237:	78 77                	js     801052b0 <sys_chdir+0xa0>
80105239:	83 ec 0c             	sub    $0xc,%esp
8010523c:	ff 75 f4             	pushl  -0xc(%ebp)
8010523f:	e8 9c cc ff ff       	call   80101ee0 <namei>
80105244:	83 c4 10             	add    $0x10,%esp
80105247:	85 c0                	test   %eax,%eax
80105249:	89 c3                	mov    %eax,%ebx
8010524b:	74 63                	je     801052b0 <sys_chdir+0xa0>
    end_op();
    return -1;
  }
  ilock(ip);
8010524d:	83 ec 0c             	sub    $0xc,%esp
80105250:	50                   	push   %eax
80105251:	e8 3a c4 ff ff       	call   80101690 <ilock>
  if(ip->type != T_DIR){
80105256:	83 c4 10             	add    $0x10,%esp
80105259:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
8010525e:	75 30                	jne    80105290 <sys_chdir+0x80>
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
80105260:	83 ec 0c             	sub    $0xc,%esp
80105263:	53                   	push   %ebx
80105264:	e8 07 c5 ff ff       	call   80101770 <iunlock>
  iput(curproc->cwd);
80105269:	58                   	pop    %eax
8010526a:	ff 76 68             	pushl  0x68(%esi)
8010526d:	e8 4e c5 ff ff       	call   801017c0 <iput>
  end_op();
80105272:	e8 69 d9 ff ff       	call   80102be0 <end_op>
  curproc->cwd = ip;
80105277:	89 5e 68             	mov    %ebx,0x68(%esi)
  return 0;
8010527a:	83 c4 10             	add    $0x10,%esp
8010527d:	31 c0                	xor    %eax,%eax
}
8010527f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105282:	5b                   	pop    %ebx
80105283:	5e                   	pop    %esi
80105284:	5d                   	pop    %ebp
80105285:	c3                   	ret    
80105286:	8d 76 00             	lea    0x0(%esi),%esi
80105289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    end_op();
    return -1;
  }
  ilock(ip);
  if(ip->type != T_DIR){
    iunlockput(ip);
80105290:	83 ec 0c             	sub    $0xc,%esp
80105293:	53                   	push   %ebx
80105294:	e8 87 c6 ff ff       	call   80101920 <iunlockput>
    end_op();
80105299:	e8 42 d9 ff ff       	call   80102be0 <end_op>
    return -1;
8010529e:	83 c4 10             	add    $0x10,%esp
801052a1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801052a6:	eb d7                	jmp    8010527f <sys_chdir+0x6f>
801052a8:	90                   	nop
801052a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  struct inode *ip;
  struct proc *curproc = myproc();
  
  begin_op();
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
    end_op();
801052b0:	e8 2b d9 ff ff       	call   80102be0 <end_op>
    return -1;
801052b5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801052ba:	eb c3                	jmp    8010527f <sys_chdir+0x6f>
801052bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801052c0 <sys_exec>:
  return 0;
}

int
sys_exec(void)
{
801052c0:	55                   	push   %ebp
801052c1:	89 e5                	mov    %esp,%ebp
801052c3:	57                   	push   %edi
801052c4:	56                   	push   %esi
801052c5:	53                   	push   %ebx
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
801052c6:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
  return 0;
}

int
sys_exec(void)
{
801052cc:	81 ec a4 00 00 00    	sub    $0xa4,%esp
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
801052d2:	50                   	push   %eax
801052d3:	6a 00                	push   $0x0
801052d5:	e8 d6 f4 ff ff       	call   801047b0 <argstr>
801052da:	83 c4 10             	add    $0x10,%esp
801052dd:	85 c0                	test   %eax,%eax
801052df:	78 7f                	js     80105360 <sys_exec+0xa0>
801052e1:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
801052e7:	83 ec 08             	sub    $0x8,%esp
801052ea:	50                   	push   %eax
801052eb:	6a 01                	push   $0x1
801052ed:	e8 2e f4 ff ff       	call   80104720 <argint>
801052f2:	83 c4 10             	add    $0x10,%esp
801052f5:	85 c0                	test   %eax,%eax
801052f7:	78 67                	js     80105360 <sys_exec+0xa0>
    return -1;
  }
  memset(argv, 0, sizeof(argv));
801052f9:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
801052ff:	83 ec 04             	sub    $0x4,%esp
80105302:	8d b5 68 ff ff ff    	lea    -0x98(%ebp),%esi
80105308:	68 80 00 00 00       	push   $0x80
8010530d:	6a 00                	push   $0x0
8010530f:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
80105315:	50                   	push   %eax
80105316:	31 db                	xor    %ebx,%ebx
80105318:	e8 13 f1 ff ff       	call   80104430 <memset>
8010531d:	83 c4 10             	add    $0x10,%esp
  for(i=0;; i++){
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
80105320:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
80105326:	83 ec 08             	sub    $0x8,%esp
80105329:	57                   	push   %edi
8010532a:	8d 04 98             	lea    (%eax,%ebx,4),%eax
8010532d:	50                   	push   %eax
8010532e:	e8 6d f3 ff ff       	call   801046a0 <fetchint>
80105333:	83 c4 10             	add    $0x10,%esp
80105336:	85 c0                	test   %eax,%eax
80105338:	78 26                	js     80105360 <sys_exec+0xa0>
      return -1;
    if(uarg == 0){
8010533a:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
80105340:	85 c0                	test   %eax,%eax
80105342:	74 2c                	je     80105370 <sys_exec+0xb0>
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
80105344:	83 ec 08             	sub    $0x8,%esp
80105347:	56                   	push   %esi
80105348:	50                   	push   %eax
80105349:	e8 82 f3 ff ff       	call   801046d0 <fetchstr>
8010534e:	83 c4 10             	add    $0x10,%esp
80105351:	85 c0                	test   %eax,%eax
80105353:	78 0b                	js     80105360 <sys_exec+0xa0>

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
  }
  memset(argv, 0, sizeof(argv));
  for(i=0;; i++){
80105355:	83 c3 01             	add    $0x1,%ebx
80105358:	83 c6 04             	add    $0x4,%esi
    if(i >= NELEM(argv))
8010535b:	83 fb 20             	cmp    $0x20,%ebx
8010535e:	75 c0                	jne    80105320 <sys_exec+0x60>
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
}
80105360:	8d 65 f4             	lea    -0xc(%ebp),%esp
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
80105363:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
}
80105368:	5b                   	pop    %ebx
80105369:	5e                   	pop    %esi
8010536a:	5f                   	pop    %edi
8010536b:	5d                   	pop    %ebp
8010536c:	c3                   	ret    
8010536d:	8d 76 00             	lea    0x0(%esi),%esi
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
80105370:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
80105376:	83 ec 08             	sub    $0x8,%esp
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
      return -1;
    if(uarg == 0){
      argv[i] = 0;
80105379:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
80105380:	00 00 00 00 
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
80105384:	50                   	push   %eax
80105385:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
8010538b:	e8 60 b6 ff ff       	call   801009f0 <exec>
80105390:	83 c4 10             	add    $0x10,%esp
}
80105393:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105396:	5b                   	pop    %ebx
80105397:	5e                   	pop    %esi
80105398:	5f                   	pop    %edi
80105399:	5d                   	pop    %ebp
8010539a:	c3                   	ret    
8010539b:	90                   	nop
8010539c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801053a0 <sys_pipe>:

int
sys_pipe(void)
{
801053a0:	55                   	push   %ebp
801053a1:	89 e5                	mov    %esp,%ebp
801053a3:	57                   	push   %edi
801053a4:	56                   	push   %esi
801053a5:	53                   	push   %ebx
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
801053a6:	8d 45 dc             	lea    -0x24(%ebp),%eax
  return exec(path, argv);
}

int
sys_pipe(void)
{
801053a9:	83 ec 20             	sub    $0x20,%esp
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
801053ac:	6a 08                	push   $0x8
801053ae:	50                   	push   %eax
801053af:	6a 00                	push   $0x0
801053b1:	e8 aa f3 ff ff       	call   80104760 <argptr>
801053b6:	83 c4 10             	add    $0x10,%esp
801053b9:	85 c0                	test   %eax,%eax
801053bb:	78 4a                	js     80105407 <sys_pipe+0x67>
    return -1;
  if(pipealloc(&rf, &wf) < 0)
801053bd:	8d 45 e4             	lea    -0x1c(%ebp),%eax
801053c0:	83 ec 08             	sub    $0x8,%esp
801053c3:	50                   	push   %eax
801053c4:	8d 45 e0             	lea    -0x20(%ebp),%eax
801053c7:	50                   	push   %eax
801053c8:	e8 43 de ff ff       	call   80103210 <pipealloc>
801053cd:	83 c4 10             	add    $0x10,%esp
801053d0:	85 c0                	test   %eax,%eax
801053d2:	78 33                	js     80105407 <sys_pipe+0x67>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
801053d4:	31 db                	xor    %ebx,%ebx
  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
    return -1;
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
801053d6:	8b 7d e0             	mov    -0x20(%ebp),%edi
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();
801053d9:	e8 c2 e3 ff ff       	call   801037a0 <myproc>
801053de:	66 90                	xchg   %ax,%ax

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
801053e0:	8b 74 98 28          	mov    0x28(%eax,%ebx,4),%esi
801053e4:	85 f6                	test   %esi,%esi
801053e6:	74 30                	je     80105418 <sys_pipe+0x78>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
801053e8:	83 c3 01             	add    $0x1,%ebx
801053eb:	83 fb 10             	cmp    $0x10,%ebx
801053ee:	75 f0                	jne    801053e0 <sys_pipe+0x40>
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      myproc()->ofile[fd0] = 0;
    fileclose(rf);
801053f0:	83 ec 0c             	sub    $0xc,%esp
801053f3:	ff 75 e0             	pushl  -0x20(%ebp)
801053f6:	e8 55 ba ff ff       	call   80100e50 <fileclose>
    fileclose(wf);
801053fb:	58                   	pop    %eax
801053fc:	ff 75 e4             	pushl  -0x1c(%ebp)
801053ff:	e8 4c ba ff ff       	call   80100e50 <fileclose>
    return -1;
80105404:	83 c4 10             	add    $0x10,%esp
  }
  fd[0] = fd0;
  fd[1] = fd1;
  return 0;
}
80105407:	8d 65 f4             	lea    -0xc(%ebp),%esp
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      myproc()->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
8010540a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  fd[0] = fd0;
  fd[1] = fd1;
  return 0;
}
8010540f:	5b                   	pop    %ebx
80105410:	5e                   	pop    %esi
80105411:	5f                   	pop    %edi
80105412:	5d                   	pop    %ebp
80105413:	c3                   	ret    
80105414:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
      curproc->ofile[fd] = f;
80105418:	8d 73 08             	lea    0x8(%ebx),%esi
8010541b:	89 7c b0 08          	mov    %edi,0x8(%eax,%esi,4)
  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
    return -1;
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
8010541f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();
80105422:	e8 79 e3 ff ff       	call   801037a0 <myproc>

  for(fd = 0; fd < NOFILE; fd++){
80105427:	31 d2                	xor    %edx,%edx
80105429:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(curproc->ofile[fd] == 0){
80105430:	8b 4c 90 28          	mov    0x28(%eax,%edx,4),%ecx
80105434:	85 c9                	test   %ecx,%ecx
80105436:	74 18                	je     80105450 <sys_pipe+0xb0>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
80105438:	83 c2 01             	add    $0x1,%edx
8010543b:	83 fa 10             	cmp    $0x10,%edx
8010543e:	75 f0                	jne    80105430 <sys_pipe+0x90>
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      myproc()->ofile[fd0] = 0;
80105440:	e8 5b e3 ff ff       	call   801037a0 <myproc>
80105445:	c7 44 b0 08 00 00 00 	movl   $0x0,0x8(%eax,%esi,4)
8010544c:	00 
8010544d:	eb a1                	jmp    801053f0 <sys_pipe+0x50>
8010544f:	90                   	nop
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
      curproc->ofile[fd] = f;
80105450:	89 7c 90 28          	mov    %edi,0x28(%eax,%edx,4)
      myproc()->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
80105454:	8b 45 dc             	mov    -0x24(%ebp),%eax
80105457:	89 18                	mov    %ebx,(%eax)
  fd[1] = fd1;
80105459:	8b 45 dc             	mov    -0x24(%ebp),%eax
8010545c:	89 50 04             	mov    %edx,0x4(%eax)
  return 0;
}
8010545f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
  fd[1] = fd1;
  return 0;
80105462:	31 c0                	xor    %eax,%eax
}
80105464:	5b                   	pop    %ebx
80105465:	5e                   	pop    %esi
80105466:	5f                   	pop    %edi
80105467:	5d                   	pop    %ebp
80105468:	c3                   	ret    
80105469:	66 90                	xchg   %ax,%ax
8010546b:	66 90                	xchg   %ax,%ax
8010546d:	66 90                	xchg   %ax,%ax
8010546f:	90                   	nop

80105470 <sys_shm_open>:
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"

int sys_shm_open(void) {
80105470:	55                   	push   %ebp
80105471:	89 e5                	mov    %esp,%ebp
80105473:	83 ec 20             	sub    $0x20,%esp
  int id;
  char **pointer;

  if(argint(0, &id) < 0)
80105476:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105479:	50                   	push   %eax
8010547a:	6a 00                	push   $0x0
8010547c:	e8 9f f2 ff ff       	call   80104720 <argint>
80105481:	83 c4 10             	add    $0x10,%esp
80105484:	85 c0                	test   %eax,%eax
80105486:	78 30                	js     801054b8 <sys_shm_open+0x48>
    return -1;

  if(argptr(1, (char **) (&pointer),4)<0)
80105488:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010548b:	83 ec 04             	sub    $0x4,%esp
8010548e:	6a 04                	push   $0x4
80105490:	50                   	push   %eax
80105491:	6a 01                	push   $0x1
80105493:	e8 c8 f2 ff ff       	call   80104760 <argptr>
80105498:	83 c4 10             	add    $0x10,%esp
8010549b:	85 c0                	test   %eax,%eax
8010549d:	78 19                	js     801054b8 <sys_shm_open+0x48>
    return -1;
  return shm_open(id, pointer);
8010549f:	83 ec 08             	sub    $0x8,%esp
801054a2:	ff 75 f4             	pushl  -0xc(%ebp)
801054a5:	ff 75 f0             	pushl  -0x10(%ebp)
801054a8:	e8 13 1c 00 00       	call   801070c0 <shm_open>
801054ad:	83 c4 10             	add    $0x10,%esp
}
801054b0:	c9                   	leave  
801054b1:	c3                   	ret    
801054b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
int sys_shm_open(void) {
  int id;
  char **pointer;

  if(argint(0, &id) < 0)
    return -1;
801054b8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

  if(argptr(1, (char **) (&pointer),4)<0)
    return -1;
  return shm_open(id, pointer);
}
801054bd:	c9                   	leave  
801054be:	c3                   	ret    
801054bf:	90                   	nop

801054c0 <sys_shm_close>:

int sys_shm_close(void) {
801054c0:	55                   	push   %ebp
801054c1:	89 e5                	mov    %esp,%ebp
801054c3:	83 ec 20             	sub    $0x20,%esp
  int id;

  if(argint(0, &id) < 0)
801054c6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801054c9:	50                   	push   %eax
801054ca:	6a 00                	push   $0x0
801054cc:	e8 4f f2 ff ff       	call   80104720 <argint>
801054d1:	83 c4 10             	add    $0x10,%esp
801054d4:	85 c0                	test   %eax,%eax
801054d6:	78 18                	js     801054f0 <sys_shm_close+0x30>
    return -1;

  
  return shm_close(id);
801054d8:	83 ec 0c             	sub    $0xc,%esp
801054db:	ff 75 f4             	pushl  -0xc(%ebp)
801054de:	e8 ed 1b 00 00       	call   801070d0 <shm_close>
801054e3:	83 c4 10             	add    $0x10,%esp
}
801054e6:	c9                   	leave  
801054e7:	c3                   	ret    
801054e8:	90                   	nop
801054e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

int sys_shm_close(void) {
  int id;

  if(argint(0, &id) < 0)
    return -1;
801054f0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

  
  return shm_close(id);
}
801054f5:	c9                   	leave  
801054f6:	c3                   	ret    
801054f7:	89 f6                	mov    %esi,%esi
801054f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105500 <sys_fork>:

int
sys_fork(void)
{
80105500:	55                   	push   %ebp
80105501:	89 e5                	mov    %esp,%ebp
  return fork();
}
80105503:	5d                   	pop    %ebp
}

int
sys_fork(void)
{
  return fork();
80105504:	e9 37 e4 ff ff       	jmp    80103940 <fork>
80105509:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105510 <sys_exit>:
}

int
sys_exit(void)
{
80105510:	55                   	push   %ebp
80105511:	89 e5                	mov    %esp,%ebp
80105513:	83 ec 08             	sub    $0x8,%esp
  exit();
80105516:	e8 b5 e6 ff ff       	call   80103bd0 <exit>
  return 0;  // not reached
}
8010551b:	31 c0                	xor    %eax,%eax
8010551d:	c9                   	leave  
8010551e:	c3                   	ret    
8010551f:	90                   	nop

80105520 <sys_wait>:

int
sys_wait(void)
{
80105520:	55                   	push   %ebp
80105521:	89 e5                	mov    %esp,%ebp
  return wait();
}
80105523:	5d                   	pop    %ebp
}

int
sys_wait(void)
{
  return wait();
80105524:	e9 e7 e8 ff ff       	jmp    80103e10 <wait>
80105529:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105530 <sys_kill>:
}

int
sys_kill(void)
{
80105530:	55                   	push   %ebp
80105531:	89 e5                	mov    %esp,%ebp
80105533:	83 ec 20             	sub    $0x20,%esp
  int pid;

  if(argint(0, &pid) < 0)
80105536:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105539:	50                   	push   %eax
8010553a:	6a 00                	push   $0x0
8010553c:	e8 df f1 ff ff       	call   80104720 <argint>
80105541:	83 c4 10             	add    $0x10,%esp
80105544:	85 c0                	test   %eax,%eax
80105546:	78 18                	js     80105560 <sys_kill+0x30>
    return -1;
  return kill(pid);
80105548:	83 ec 0c             	sub    $0xc,%esp
8010554b:	ff 75 f4             	pushl  -0xc(%ebp)
8010554e:	e8 0d ea ff ff       	call   80103f60 <kill>
80105553:	83 c4 10             	add    $0x10,%esp
}
80105556:	c9                   	leave  
80105557:	c3                   	ret    
80105558:	90                   	nop
80105559:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
80105560:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return kill(pid);
}
80105565:	c9                   	leave  
80105566:	c3                   	ret    
80105567:	89 f6                	mov    %esi,%esi
80105569:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105570 <sys_getpid>:

int
sys_getpid(void)
{
80105570:	55                   	push   %ebp
80105571:	89 e5                	mov    %esp,%ebp
80105573:	83 ec 08             	sub    $0x8,%esp
  return myproc()->pid;
80105576:	e8 25 e2 ff ff       	call   801037a0 <myproc>
8010557b:	8b 40 10             	mov    0x10(%eax),%eax
}
8010557e:	c9                   	leave  
8010557f:	c3                   	ret    

80105580 <sys_sbrk>:

int
sys_sbrk(void)
{
80105580:	55                   	push   %ebp
80105581:	89 e5                	mov    %esp,%ebp
80105583:	53                   	push   %ebx
  int addr;
  int n;

  if(argint(0, &n) < 0)
80105584:	8d 45 f4             	lea    -0xc(%ebp),%eax
  return myproc()->pid;
}

int
sys_sbrk(void)
{
80105587:	83 ec 1c             	sub    $0x1c,%esp
  int addr;
  int n;

  if(argint(0, &n) < 0)
8010558a:	50                   	push   %eax
8010558b:	6a 00                	push   $0x0
8010558d:	e8 8e f1 ff ff       	call   80104720 <argint>
80105592:	83 c4 10             	add    $0x10,%esp
80105595:	85 c0                	test   %eax,%eax
80105597:	78 27                	js     801055c0 <sys_sbrk+0x40>
    return -1;
  addr = myproc()->sz;
80105599:	e8 02 e2 ff ff       	call   801037a0 <myproc>
  if(growproc(n) < 0)
8010559e:	83 ec 0c             	sub    $0xc,%esp
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = myproc()->sz;
801055a1:	8b 18                	mov    (%eax),%ebx
  if(growproc(n) < 0)
801055a3:	ff 75 f4             	pushl  -0xc(%ebp)
801055a6:	e8 15 e3 ff ff       	call   801038c0 <growproc>
801055ab:	83 c4 10             	add    $0x10,%esp
801055ae:	85 c0                	test   %eax,%eax
801055b0:	78 0e                	js     801055c0 <sys_sbrk+0x40>
    return -1;
  return addr;
801055b2:	89 d8                	mov    %ebx,%eax
}
801055b4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801055b7:	c9                   	leave  
801055b8:	c3                   	ret    
801055b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
801055c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801055c5:	eb ed                	jmp    801055b4 <sys_sbrk+0x34>
801055c7:	89 f6                	mov    %esi,%esi
801055c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801055d0 <sys_sleep>:
  return addr;
}

int
sys_sleep(void)
{
801055d0:	55                   	push   %ebp
801055d1:	89 e5                	mov    %esp,%ebp
801055d3:	53                   	push   %ebx
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
801055d4:	8d 45 f4             	lea    -0xc(%ebp),%eax
  return addr;
}

int
sys_sleep(void)
{
801055d7:	83 ec 1c             	sub    $0x1c,%esp
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
801055da:	50                   	push   %eax
801055db:	6a 00                	push   $0x0
801055dd:	e8 3e f1 ff ff       	call   80104720 <argint>
801055e2:	83 c4 10             	add    $0x10,%esp
801055e5:	85 c0                	test   %eax,%eax
801055e7:	0f 88 8a 00 00 00    	js     80105677 <sys_sleep+0xa7>
    return -1;
  acquire(&tickslock);
801055ed:	83 ec 0c             	sub    $0xc,%esp
801055f0:	68 60 4d 11 80       	push   $0x80114d60
801055f5:	e8 c6 ec ff ff       	call   801042c0 <acquire>
  ticks0 = ticks;
  while(ticks - ticks0 < n){
801055fa:	8b 55 f4             	mov    -0xc(%ebp),%edx
801055fd:	83 c4 10             	add    $0x10,%esp
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
80105600:	8b 1d a0 55 11 80    	mov    0x801155a0,%ebx
  while(ticks - ticks0 < n){
80105606:	85 d2                	test   %edx,%edx
80105608:	75 27                	jne    80105631 <sys_sleep+0x61>
8010560a:	eb 54                	jmp    80105660 <sys_sleep+0x90>
8010560c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
80105610:	83 ec 08             	sub    $0x8,%esp
80105613:	68 60 4d 11 80       	push   $0x80114d60
80105618:	68 a0 55 11 80       	push   $0x801155a0
8010561d:	e8 2e e7 ff ff       	call   80103d50 <sleep>

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
80105622:	a1 a0 55 11 80       	mov    0x801155a0,%eax
80105627:	83 c4 10             	add    $0x10,%esp
8010562a:	29 d8                	sub    %ebx,%eax
8010562c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
8010562f:	73 2f                	jae    80105660 <sys_sleep+0x90>
    if(myproc()->killed){
80105631:	e8 6a e1 ff ff       	call   801037a0 <myproc>
80105636:	8b 40 24             	mov    0x24(%eax),%eax
80105639:	85 c0                	test   %eax,%eax
8010563b:	74 d3                	je     80105610 <sys_sleep+0x40>
      release(&tickslock);
8010563d:	83 ec 0c             	sub    $0xc,%esp
80105640:	68 60 4d 11 80       	push   $0x80114d60
80105645:	e8 96 ed ff ff       	call   801043e0 <release>
      return -1;
8010564a:	83 c4 10             	add    $0x10,%esp
8010564d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}
80105652:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105655:	c9                   	leave  
80105656:	c3                   	ret    
80105657:	89 f6                	mov    %esi,%esi
80105659:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
80105660:	83 ec 0c             	sub    $0xc,%esp
80105663:	68 60 4d 11 80       	push   $0x80114d60
80105668:	e8 73 ed ff ff       	call   801043e0 <release>
  return 0;
8010566d:	83 c4 10             	add    $0x10,%esp
80105670:	31 c0                	xor    %eax,%eax
}
80105672:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105675:	c9                   	leave  
80105676:	c3                   	ret    
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
80105677:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010567c:	eb d4                	jmp    80105652 <sys_sleep+0x82>
8010567e:	66 90                	xchg   %ax,%ax

80105680 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
80105680:	55                   	push   %ebp
80105681:	89 e5                	mov    %esp,%ebp
80105683:	53                   	push   %ebx
80105684:	83 ec 10             	sub    $0x10,%esp
  uint xticks;

  acquire(&tickslock);
80105687:	68 60 4d 11 80       	push   $0x80114d60
8010568c:	e8 2f ec ff ff       	call   801042c0 <acquire>
  xticks = ticks;
80105691:	8b 1d a0 55 11 80    	mov    0x801155a0,%ebx
  release(&tickslock);
80105697:	c7 04 24 60 4d 11 80 	movl   $0x80114d60,(%esp)
8010569e:	e8 3d ed ff ff       	call   801043e0 <release>
  return xticks;
}
801056a3:	89 d8                	mov    %ebx,%eax
801056a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801056a8:	c9                   	leave  
801056a9:	c3                   	ret    

801056aa <alltraps>:

  # vectors.S sends all traps here.
.globl alltraps
alltraps:
  # Build trap frame.
  pushl %ds
801056aa:	1e                   	push   %ds
  pushl %es
801056ab:	06                   	push   %es
  pushl %fs
801056ac:	0f a0                	push   %fs
  pushl %gs
801056ae:	0f a8                	push   %gs
  pushal
801056b0:	60                   	pusha  
  
  # Set up data segments.
  movw $(SEG_KDATA<<3), %ax
801056b1:	66 b8 10 00          	mov    $0x10,%ax
  movw %ax, %ds
801056b5:	8e d8                	mov    %eax,%ds
  movw %ax, %es
801056b7:	8e c0                	mov    %eax,%es

  # Call trap(tf), where tf=%esp
  pushl %esp
801056b9:	54                   	push   %esp
  call trap
801056ba:	e8 e1 00 00 00       	call   801057a0 <trap>
  addl $4, %esp
801056bf:	83 c4 04             	add    $0x4,%esp

801056c2 <trapret>:

  # Return falls through to trapret...
.globl trapret
trapret:
  popal
801056c2:	61                   	popa   
  popl %gs
801056c3:	0f a9                	pop    %gs
  popl %fs
801056c5:	0f a1                	pop    %fs
  popl %es
801056c7:	07                   	pop    %es
  popl %ds
801056c8:	1f                   	pop    %ds
  addl $0x8, %esp  # trapno and errcode
801056c9:	83 c4 08             	add    $0x8,%esp
  iret
801056cc:	cf                   	iret   
801056cd:	66 90                	xchg   %ax,%ax
801056cf:	90                   	nop

801056d0 <tvinit>:
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
801056d0:	31 c0                	xor    %eax,%eax
801056d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
801056d8:	8b 14 85 08 a0 10 80 	mov    -0x7fef5ff8(,%eax,4),%edx
801056df:	b9 08 00 00 00       	mov    $0x8,%ecx
801056e4:	c6 04 c5 a4 4d 11 80 	movb   $0x0,-0x7feeb25c(,%eax,8)
801056eb:	00 
801056ec:	66 89 0c c5 a2 4d 11 	mov    %cx,-0x7feeb25e(,%eax,8)
801056f3:	80 
801056f4:	c6 04 c5 a5 4d 11 80 	movb   $0x8e,-0x7feeb25b(,%eax,8)
801056fb:	8e 
801056fc:	66 89 14 c5 a0 4d 11 	mov    %dx,-0x7feeb260(,%eax,8)
80105703:	80 
80105704:	c1 ea 10             	shr    $0x10,%edx
80105707:	66 89 14 c5 a6 4d 11 	mov    %dx,-0x7feeb25a(,%eax,8)
8010570e:	80 
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
8010570f:	83 c0 01             	add    $0x1,%eax
80105712:	3d 00 01 00 00       	cmp    $0x100,%eax
80105717:	75 bf                	jne    801056d8 <tvinit+0x8>
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
80105719:	55                   	push   %ebp
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
8010571a:	ba 08 00 00 00       	mov    $0x8,%edx
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
8010571f:	89 e5                	mov    %esp,%ebp
80105721:	83 ec 10             	sub    $0x10,%esp
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105724:	a1 08 a1 10 80       	mov    0x8010a108,%eax

  initlock(&tickslock, "time");
80105729:	68 81 78 10 80       	push   $0x80107881
8010572e:	68 60 4d 11 80       	push   $0x80114d60
{
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105733:	66 89 15 a2 4f 11 80 	mov    %dx,0x80114fa2
8010573a:	c6 05 a4 4f 11 80 00 	movb   $0x0,0x80114fa4
80105741:	66 a3 a0 4f 11 80    	mov    %ax,0x80114fa0
80105747:	c1 e8 10             	shr    $0x10,%eax
8010574a:	c6 05 a5 4f 11 80 ef 	movb   $0xef,0x80114fa5
80105751:	66 a3 a6 4f 11 80    	mov    %ax,0x80114fa6

  initlock(&tickslock, "time");
80105757:	e8 64 ea ff ff       	call   801041c0 <initlock>
}
8010575c:	83 c4 10             	add    $0x10,%esp
8010575f:	c9                   	leave  
80105760:	c3                   	ret    
80105761:	eb 0d                	jmp    80105770 <idtinit>
80105763:	90                   	nop
80105764:	90                   	nop
80105765:	90                   	nop
80105766:	90                   	nop
80105767:	90                   	nop
80105768:	90                   	nop
80105769:	90                   	nop
8010576a:	90                   	nop
8010576b:	90                   	nop
8010576c:	90                   	nop
8010576d:	90                   	nop
8010576e:	90                   	nop
8010576f:	90                   	nop

80105770 <idtinit>:

void
idtinit(void)
{
80105770:	55                   	push   %ebp
static inline void
lidt(struct gatedesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
80105771:	b8 ff 07 00 00       	mov    $0x7ff,%eax
80105776:	89 e5                	mov    %esp,%ebp
80105778:	83 ec 10             	sub    $0x10,%esp
8010577b:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
8010577f:	b8 a0 4d 11 80       	mov    $0x80114da0,%eax
80105784:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
80105788:	c1 e8 10             	shr    $0x10,%eax
8010578b:	66 89 45 fe          	mov    %ax,-0x2(%ebp)

  asm volatile("lidt (%0)" : : "r" (pd));
8010578f:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105792:	0f 01 18             	lidtl  (%eax)
  lidt(idt, sizeof(idt));
}
80105795:	c9                   	leave  
80105796:	c3                   	ret    
80105797:	89 f6                	mov    %esi,%esi
80105799:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801057a0 <trap>:

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
801057a0:	55                   	push   %ebp
801057a1:	89 e5                	mov    %esp,%ebp
801057a3:	57                   	push   %edi
801057a4:	56                   	push   %esi
801057a5:	53                   	push   %ebx
801057a6:	83 ec 1c             	sub    $0x1c,%esp
801057a9:	8b 7d 08             	mov    0x8(%ebp),%edi
  if(tf->trapno == T_SYSCALL){
801057ac:	8b 47 30             	mov    0x30(%edi),%eax
801057af:	83 f8 40             	cmp    $0x40,%eax
801057b2:	0f 84 f8 01 00 00    	je     801059b0 <trap+0x210>
    if(myproc()->killed)
      exit();
    return;
  }

  switch(tf->trapno){
801057b8:	83 e8 0e             	sub    $0xe,%eax
801057bb:	83 f8 31             	cmp    $0x31,%eax
801057be:	77 10                	ja     801057d0 <trap+0x30>
801057c0:	ff 24 85 28 79 10 80 	jmp    *-0x7fef86d8(,%eax,4)
801057c7:	89 f6                	mov    %esi,%esi
801057c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
       
     }
     break;
  //PAGEBREAK: 13
  default:
    if(myproc() == 0 || (tf->cs&3) == 0){
801057d0:	e8 cb df ff ff       	call   801037a0 <myproc>
801057d5:	85 c0                	test   %eax,%eax
801057d7:	0f 84 47 02 00 00    	je     80105a24 <trap+0x284>
801057dd:	f6 47 3c 03          	testb  $0x3,0x3c(%edi)
801057e1:	0f 84 3d 02 00 00    	je     80105a24 <trap+0x284>

static inline uint
rcr2(void)
{
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
801057e7:	0f 20 d1             	mov    %cr2,%ecx
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
801057ea:	8b 57 38             	mov    0x38(%edi),%edx
801057ed:	89 4d d8             	mov    %ecx,-0x28(%ebp)
801057f0:	89 55 dc             	mov    %edx,-0x24(%ebp)
801057f3:	e8 88 df ff ff       	call   80103780 <cpuid>
801057f8:	8b 77 34             	mov    0x34(%edi),%esi
801057fb:	8b 5f 30             	mov    0x30(%edi),%ebx
801057fe:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
80105801:	e8 9a df ff ff       	call   801037a0 <myproc>
80105806:	89 45 e0             	mov    %eax,-0x20(%ebp)
80105809:	e8 92 df ff ff       	call   801037a0 <myproc>
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
8010580e:	8b 4d d8             	mov    -0x28(%ebp),%ecx
80105811:	8b 55 dc             	mov    -0x24(%ebp),%edx
80105814:	51                   	push   %ecx
80105815:	52                   	push   %edx
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
80105816:	8b 55 e0             	mov    -0x20(%ebp),%edx
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105819:	ff 75 e4             	pushl  -0x1c(%ebp)
8010581c:	56                   	push   %esi
8010581d:	53                   	push   %ebx
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
8010581e:	83 c2 6c             	add    $0x6c,%edx
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105821:	52                   	push   %edx
80105822:	ff 70 10             	pushl  0x10(%eax)
80105825:	68 e4 78 10 80       	push   $0x801078e4
8010582a:	e8 31 ae ff ff       	call   80100660 <cprintf>
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
            tf->err, cpuid(), tf->eip, rcr2());
    myproc()->killed = 1;
8010582f:	83 c4 20             	add    $0x20,%esp
80105832:	e8 69 df ff ff       	call   801037a0 <myproc>
80105837:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
8010583e:	66 90                	xchg   %ax,%ax
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105840:	e8 5b df ff ff       	call   801037a0 <myproc>
80105845:	85 c0                	test   %eax,%eax
80105847:	74 0c                	je     80105855 <trap+0xb5>
80105849:	e8 52 df ff ff       	call   801037a0 <myproc>
8010584e:	8b 50 24             	mov    0x24(%eax),%edx
80105851:	85 d2                	test   %edx,%edx
80105853:	75 4b                	jne    801058a0 <trap+0x100>
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(myproc() && myproc()->state == RUNNING &&
80105855:	e8 46 df ff ff       	call   801037a0 <myproc>
8010585a:	85 c0                	test   %eax,%eax
8010585c:	74 0b                	je     80105869 <trap+0xc9>
8010585e:	e8 3d df ff ff       	call   801037a0 <myproc>
80105863:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80105867:	74 4f                	je     801058b8 <trap+0x118>
     tf->trapno == T_IRQ0+IRQ_TIMER)
    yield();

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105869:	e8 32 df ff ff       	call   801037a0 <myproc>
8010586e:	85 c0                	test   %eax,%eax
80105870:	74 1d                	je     8010588f <trap+0xef>
80105872:	e8 29 df ff ff       	call   801037a0 <myproc>
80105877:	8b 40 24             	mov    0x24(%eax),%eax
8010587a:	85 c0                	test   %eax,%eax
8010587c:	74 11                	je     8010588f <trap+0xef>
8010587e:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105882:	83 e0 03             	and    $0x3,%eax
80105885:	66 83 f8 03          	cmp    $0x3,%ax
80105889:	0f 84 4a 01 00 00    	je     801059d9 <trap+0x239>
    exit();
}
8010588f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105892:	5b                   	pop    %ebx
80105893:	5e                   	pop    %esi
80105894:	5f                   	pop    %edi
80105895:	5d                   	pop    %ebp
80105896:	c3                   	ret    
80105897:	89 f6                	mov    %esi,%esi
80105899:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
801058a0:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
801058a4:	83 e0 03             	and    $0x3,%eax
801058a7:	66 83 f8 03          	cmp    $0x3,%ax
801058ab:	75 a8                	jne    80105855 <trap+0xb5>
    exit();
801058ad:	e8 1e e3 ff ff       	call   80103bd0 <exit>
801058b2:	eb a1                	jmp    80105855 <trap+0xb5>
801058b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(myproc() && myproc()->state == RUNNING &&
801058b8:	83 7f 30 20          	cmpl   $0x20,0x30(%edi)
801058bc:	75 ab                	jne    80105869 <trap+0xc9>
     tf->trapno == T_IRQ0+IRQ_TIMER)
    yield();
801058be:	e8 3d e4 ff ff       	call   80103d00 <yield>
801058c3:	eb a4                	jmp    80105869 <trap+0xc9>
801058c5:	8d 76 00             	lea    0x0(%esi),%esi
801058c8:	0f 20 d3             	mov    %cr2,%ebx
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
            cpuid(), tf->cs, tf->eip);
    lapiceoi();
    break;
  case T_PGFLT:
    if(rcr2() >= PGROUNDDOWN(STACKBOTTOM - myproc()->numPages*PGSIZE - 1)){
801058cb:	e8 d0 de ff ff       	call   801037a0 <myproc>
801058d0:	8b 40 7c             	mov    0x7c(%eax),%eax
801058d3:	be fe ff ff 7f       	mov    $0x7ffffffe,%esi
801058d8:	89 f1                	mov    %esi,%ecx
801058da:	c1 e0 0c             	shl    $0xc,%eax
801058dd:	29 c1                	sub    %eax,%ecx
801058df:	89 c8                	mov    %ecx,%eax
801058e1:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801058e6:	39 d8                	cmp    %ebx,%eax
801058e8:	0f 87 52 ff ff ff    	ja     80105840 <trap+0xa0>
	allocuvm(myproc()->pgdir, PGROUNDDOWN(STACKBOTTOM - myproc()->numPages*PGSIZE - 1), STACKBOTTOM - myproc()->numPages*PGSIZE - 1);
801058ee:	e8 ad de ff ff       	call   801037a0 <myproc>
801058f3:	8b 40 7c             	mov    0x7c(%eax),%eax
801058f6:	89 f3                	mov    %esi,%ebx
801058f8:	c1 e0 0c             	shl    $0xc,%eax
801058fb:	29 c3                	sub    %eax,%ebx
801058fd:	e8 9e de ff ff       	call   801037a0 <myproc>
80105902:	8b 40 7c             	mov    0x7c(%eax),%eax
80105905:	c1 e0 0c             	shl    $0xc,%eax
80105908:	29 c6                	sub    %eax,%esi
8010590a:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
80105910:	e8 8b de ff ff       	call   801037a0 <myproc>
80105915:	83 ec 04             	sub    $0x4,%esp
80105918:	53                   	push   %ebx
80105919:	56                   	push   %esi
8010591a:	ff 70 04             	pushl  0x4(%eax)
8010591d:	e8 4e 12 00 00       	call   80106b70 <allocuvm>
       myproc()->numPages++;
80105922:	e8 79 de ff ff       	call   801037a0 <myproc>
80105927:	83 c4 10             	add    $0x10,%esp
8010592a:	83 40 7c 01          	addl   $0x1,0x7c(%eax)
8010592e:	e9 0d ff ff ff       	jmp    80105840 <trap+0xa0>
80105933:	90                   	nop
80105934:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return;
  }

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpuid() == 0){
80105938:	e8 43 de ff ff       	call   80103780 <cpuid>
8010593d:	85 c0                	test   %eax,%eax
8010593f:	0f 84 ab 00 00 00    	je     801059f0 <trap+0x250>
    }
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE:
    ideintr();
    lapiceoi();
80105945:	e8 e6 cd ff ff       	call   80102730 <lapiceoi>
    break;
8010594a:	e9 f1 fe ff ff       	jmp    80105840 <trap+0xa0>
8010594f:	90                   	nop
  case T_IRQ0 + IRQ_IDE+1:
    // Bochs generates spurious IDE1 interrupts.
    break;
  case T_IRQ0 + IRQ_KBD:
    kbdintr();
80105950:	e8 9b cc ff ff       	call   801025f0 <kbdintr>
    lapiceoi();
80105955:	e8 d6 cd ff ff       	call   80102730 <lapiceoi>
    break;
8010595a:	e9 e1 fe ff ff       	jmp    80105840 <trap+0xa0>
8010595f:	90                   	nop
  case T_IRQ0 + IRQ_COM1:
    uartintr();
80105960:	e8 5b 02 00 00       	call   80105bc0 <uartintr>
    lapiceoi();
80105965:	e8 c6 cd ff ff       	call   80102730 <lapiceoi>
    break;
8010596a:	e9 d1 fe ff ff       	jmp    80105840 <trap+0xa0>
8010596f:	90                   	nop
  case T_IRQ0 + 7:
  case T_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80105970:	0f b7 5f 3c          	movzwl 0x3c(%edi),%ebx
80105974:	8b 77 38             	mov    0x38(%edi),%esi
80105977:	e8 04 de ff ff       	call   80103780 <cpuid>
8010597c:	56                   	push   %esi
8010597d:	53                   	push   %ebx
8010597e:	50                   	push   %eax
8010597f:	68 8c 78 10 80       	push   $0x8010788c
80105984:	e8 d7 ac ff ff       	call   80100660 <cprintf>
            cpuid(), tf->cs, tf->eip);
    lapiceoi();
80105989:	e8 a2 cd ff ff       	call   80102730 <lapiceoi>
    break;
8010598e:	83 c4 10             	add    $0x10,%esp
80105991:	e9 aa fe ff ff       	jmp    80105840 <trap+0xa0>
80105996:	8d 76 00             	lea    0x0(%esi),%esi
80105999:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      release(&tickslock);
    }
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE:
    ideintr();
801059a0:	e8 cb c6 ff ff       	call   80102070 <ideintr>
801059a5:	eb 9e                	jmp    80105945 <trap+0x1a5>
801059a7:	89 f6                	mov    %esi,%esi
801059a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(myproc()->killed)
801059b0:	e8 eb dd ff ff       	call   801037a0 <myproc>
801059b5:	8b 58 24             	mov    0x24(%eax),%ebx
801059b8:	85 db                	test   %ebx,%ebx
801059ba:	75 2c                	jne    801059e8 <trap+0x248>
      exit();
    myproc()->tf = tf;
801059bc:	e8 df dd ff ff       	call   801037a0 <myproc>
801059c1:	89 78 18             	mov    %edi,0x18(%eax)
    syscall();
801059c4:	e8 57 ee ff ff       	call   80104820 <syscall>
    if(myproc()->killed)
801059c9:	e8 d2 dd ff ff       	call   801037a0 <myproc>
801059ce:	8b 48 24             	mov    0x24(%eax),%ecx
801059d1:	85 c9                	test   %ecx,%ecx
801059d3:	0f 84 b6 fe ff ff    	je     8010588f <trap+0xef>
    yield();

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
    exit();
}
801059d9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801059dc:	5b                   	pop    %ebx
801059dd:	5e                   	pop    %esi
801059de:	5f                   	pop    %edi
801059df:	5d                   	pop    %ebp
    if(myproc()->killed)
      exit();
    myproc()->tf = tf;
    syscall();
    if(myproc()->killed)
      exit();
801059e0:	e9 eb e1 ff ff       	jmp    80103bd0 <exit>
801059e5:	8d 76 00             	lea    0x0(%esi),%esi
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(myproc()->killed)
      exit();
801059e8:	e8 e3 e1 ff ff       	call   80103bd0 <exit>
801059ed:	eb cd                	jmp    801059bc <trap+0x21c>
801059ef:	90                   	nop
  }

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpuid() == 0){
      acquire(&tickslock);
801059f0:	83 ec 0c             	sub    $0xc,%esp
801059f3:	68 60 4d 11 80       	push   $0x80114d60
801059f8:	e8 c3 e8 ff ff       	call   801042c0 <acquire>
      ticks++;
      wakeup(&ticks);
801059fd:	c7 04 24 a0 55 11 80 	movl   $0x801155a0,(%esp)

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpuid() == 0){
      acquire(&tickslock);
      ticks++;
80105a04:	83 05 a0 55 11 80 01 	addl   $0x1,0x801155a0
      wakeup(&ticks);
80105a0b:	e8 f0 e4 ff ff       	call   80103f00 <wakeup>
      release(&tickslock);
80105a10:	c7 04 24 60 4d 11 80 	movl   $0x80114d60,(%esp)
80105a17:	e8 c4 e9 ff ff       	call   801043e0 <release>
80105a1c:	83 c4 10             	add    $0x10,%esp
80105a1f:	e9 21 ff ff ff       	jmp    80105945 <trap+0x1a5>
80105a24:	0f 20 d6             	mov    %cr2,%esi
     break;
  //PAGEBREAK: 13
  default:
    if(myproc() == 0 || (tf->cs&3) == 0){
      // In kernel, it must be our mistake.
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
80105a27:	8b 5f 38             	mov    0x38(%edi),%ebx
80105a2a:	e8 51 dd ff ff       	call   80103780 <cpuid>
80105a2f:	83 ec 0c             	sub    $0xc,%esp
80105a32:	56                   	push   %esi
80105a33:	53                   	push   %ebx
80105a34:	50                   	push   %eax
80105a35:	ff 77 30             	pushl  0x30(%edi)
80105a38:	68 b0 78 10 80       	push   $0x801078b0
80105a3d:	e8 1e ac ff ff       	call   80100660 <cprintf>
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
80105a42:	83 c4 14             	add    $0x14,%esp
80105a45:	68 86 78 10 80       	push   $0x80107886
80105a4a:	e8 21 a9 ff ff       	call   80100370 <panic>
80105a4f:	90                   	nop

80105a50 <uartgetc>:
}

static int
uartgetc(void)
{
  if(!uart)
80105a50:	a1 bc a5 10 80       	mov    0x8010a5bc,%eax
  outb(COM1+0, c);
}

static int
uartgetc(void)
{
80105a55:	55                   	push   %ebp
80105a56:	89 e5                	mov    %esp,%ebp
  if(!uart)
80105a58:	85 c0                	test   %eax,%eax
80105a5a:	74 1c                	je     80105a78 <uartgetc+0x28>
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105a5c:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105a61:	ec                   	in     (%dx),%al
    return -1;
  if(!(inb(COM1+5) & 0x01))
80105a62:	a8 01                	test   $0x1,%al
80105a64:	74 12                	je     80105a78 <uartgetc+0x28>
80105a66:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105a6b:	ec                   	in     (%dx),%al
    return -1;
  return inb(COM1+0);
80105a6c:	0f b6 c0             	movzbl %al,%eax
}
80105a6f:	5d                   	pop    %ebp
80105a70:	c3                   	ret    
80105a71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

static int
uartgetc(void)
{
  if(!uart)
    return -1;
80105a78:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if(!(inb(COM1+5) & 0x01))
    return -1;
  return inb(COM1+0);
}
80105a7d:	5d                   	pop    %ebp
80105a7e:	c3                   	ret    
80105a7f:	90                   	nop

80105a80 <uartputc.part.0>:
  for(p="xv6...\n"; *p; p++)
    uartputc(*p);
}

void
uartputc(int c)
80105a80:	55                   	push   %ebp
80105a81:	89 e5                	mov    %esp,%ebp
80105a83:	57                   	push   %edi
80105a84:	56                   	push   %esi
80105a85:	53                   	push   %ebx
80105a86:	89 c7                	mov    %eax,%edi
80105a88:	bb 80 00 00 00       	mov    $0x80,%ebx
80105a8d:	be fd 03 00 00       	mov    $0x3fd,%esi
80105a92:	83 ec 0c             	sub    $0xc,%esp
80105a95:	eb 1b                	jmp    80105ab2 <uartputc.part.0+0x32>
80105a97:	89 f6                	mov    %esi,%esi
80105a99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  int i;

  if(!uart)
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
    microdelay(10);
80105aa0:	83 ec 0c             	sub    $0xc,%esp
80105aa3:	6a 0a                	push   $0xa
80105aa5:	e8 a6 cc ff ff       	call   80102750 <microdelay>
{
  int i;

  if(!uart)
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
80105aaa:	83 c4 10             	add    $0x10,%esp
80105aad:	83 eb 01             	sub    $0x1,%ebx
80105ab0:	74 07                	je     80105ab9 <uartputc.part.0+0x39>
80105ab2:	89 f2                	mov    %esi,%edx
80105ab4:	ec                   	in     (%dx),%al
80105ab5:	a8 20                	test   $0x20,%al
80105ab7:	74 e7                	je     80105aa0 <uartputc.part.0+0x20>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80105ab9:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105abe:	89 f8                	mov    %edi,%eax
80105ac0:	ee                   	out    %al,(%dx)
    microdelay(10);
  outb(COM1+0, c);
}
80105ac1:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105ac4:	5b                   	pop    %ebx
80105ac5:	5e                   	pop    %esi
80105ac6:	5f                   	pop    %edi
80105ac7:	5d                   	pop    %ebp
80105ac8:	c3                   	ret    
80105ac9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105ad0 <uartinit>:

static int uart;    // is there a uart?

void
uartinit(void)
{
80105ad0:	55                   	push   %ebp
80105ad1:	31 c9                	xor    %ecx,%ecx
80105ad3:	89 c8                	mov    %ecx,%eax
80105ad5:	89 e5                	mov    %esp,%ebp
80105ad7:	57                   	push   %edi
80105ad8:	56                   	push   %esi
80105ad9:	53                   	push   %ebx
80105ada:	bb fa 03 00 00       	mov    $0x3fa,%ebx
80105adf:	89 da                	mov    %ebx,%edx
80105ae1:	83 ec 0c             	sub    $0xc,%esp
80105ae4:	ee                   	out    %al,(%dx)
80105ae5:	bf fb 03 00 00       	mov    $0x3fb,%edi
80105aea:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80105aef:	89 fa                	mov    %edi,%edx
80105af1:	ee                   	out    %al,(%dx)
80105af2:	b8 0c 00 00 00       	mov    $0xc,%eax
80105af7:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105afc:	ee                   	out    %al,(%dx)
80105afd:	be f9 03 00 00       	mov    $0x3f9,%esi
80105b02:	89 c8                	mov    %ecx,%eax
80105b04:	89 f2                	mov    %esi,%edx
80105b06:	ee                   	out    %al,(%dx)
80105b07:	b8 03 00 00 00       	mov    $0x3,%eax
80105b0c:	89 fa                	mov    %edi,%edx
80105b0e:	ee                   	out    %al,(%dx)
80105b0f:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105b14:	89 c8                	mov    %ecx,%eax
80105b16:	ee                   	out    %al,(%dx)
80105b17:	b8 01 00 00 00       	mov    $0x1,%eax
80105b1c:	89 f2                	mov    %esi,%edx
80105b1e:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105b1f:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105b24:	ec                   	in     (%dx),%al
  outb(COM1+3, 0x03);    // Lock divisor, 8 data bits.
  outb(COM1+4, 0);
  outb(COM1+1, 0x01);    // Enable receive interrupts.

  // If status is 0xFF, no serial port.
  if(inb(COM1+5) == 0xFF)
80105b25:	3c ff                	cmp    $0xff,%al
80105b27:	74 5a                	je     80105b83 <uartinit+0xb3>
    return;
  uart = 1;
80105b29:	c7 05 bc a5 10 80 01 	movl   $0x1,0x8010a5bc
80105b30:	00 00 00 
80105b33:	89 da                	mov    %ebx,%edx
80105b35:	ec                   	in     (%dx),%al
80105b36:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105b3b:	ec                   	in     (%dx),%al

  // Acknowledge pre-existing interrupt conditions;
  // enable interrupts.
  inb(COM1+2);
  inb(COM1+0);
  ioapicenable(IRQ_COM1, 0);
80105b3c:	83 ec 08             	sub    $0x8,%esp
80105b3f:	bb f0 79 10 80       	mov    $0x801079f0,%ebx
80105b44:	6a 00                	push   $0x0
80105b46:	6a 04                	push   $0x4
80105b48:	e8 73 c7 ff ff       	call   801022c0 <ioapicenable>
80105b4d:	83 c4 10             	add    $0x10,%esp
80105b50:	b8 78 00 00 00       	mov    $0x78,%eax
80105b55:	eb 13                	jmp    80105b6a <uartinit+0x9a>
80105b57:	89 f6                	mov    %esi,%esi
80105b59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
80105b60:	83 c3 01             	add    $0x1,%ebx
80105b63:	0f be 03             	movsbl (%ebx),%eax
80105b66:	84 c0                	test   %al,%al
80105b68:	74 19                	je     80105b83 <uartinit+0xb3>
void
uartputc(int c)
{
  int i;

  if(!uart)
80105b6a:	8b 15 bc a5 10 80    	mov    0x8010a5bc,%edx
80105b70:	85 d2                	test   %edx,%edx
80105b72:	74 ec                	je     80105b60 <uartinit+0x90>
  inb(COM1+2);
  inb(COM1+0);
  ioapicenable(IRQ_COM1, 0);

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
80105b74:	83 c3 01             	add    $0x1,%ebx
80105b77:	e8 04 ff ff ff       	call   80105a80 <uartputc.part.0>
80105b7c:	0f be 03             	movsbl (%ebx),%eax
80105b7f:	84 c0                	test   %al,%al
80105b81:	75 e7                	jne    80105b6a <uartinit+0x9a>
    uartputc(*p);
}
80105b83:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105b86:	5b                   	pop    %ebx
80105b87:	5e                   	pop    %esi
80105b88:	5f                   	pop    %edi
80105b89:	5d                   	pop    %ebp
80105b8a:	c3                   	ret    
80105b8b:	90                   	nop
80105b8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105b90 <uartputc>:
void
uartputc(int c)
{
  int i;

  if(!uart)
80105b90:	8b 15 bc a5 10 80    	mov    0x8010a5bc,%edx
    uartputc(*p);
}

void
uartputc(int c)
{
80105b96:	55                   	push   %ebp
80105b97:	89 e5                	mov    %esp,%ebp
  int i;

  if(!uart)
80105b99:	85 d2                	test   %edx,%edx
    uartputc(*p);
}

void
uartputc(int c)
{
80105b9b:	8b 45 08             	mov    0x8(%ebp),%eax
  int i;

  if(!uart)
80105b9e:	74 10                	je     80105bb0 <uartputc+0x20>
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
    microdelay(10);
  outb(COM1+0, c);
}
80105ba0:	5d                   	pop    %ebp
80105ba1:	e9 da fe ff ff       	jmp    80105a80 <uartputc.part.0>
80105ba6:	8d 76 00             	lea    0x0(%esi),%esi
80105ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105bb0:	5d                   	pop    %ebp
80105bb1:	c3                   	ret    
80105bb2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105bb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105bc0 <uartintr>:
  return inb(COM1+0);
}

void
uartintr(void)
{
80105bc0:	55                   	push   %ebp
80105bc1:	89 e5                	mov    %esp,%ebp
80105bc3:	83 ec 14             	sub    $0x14,%esp
  consoleintr(uartgetc);
80105bc6:	68 50 5a 10 80       	push   $0x80105a50
80105bcb:	e8 20 ac ff ff       	call   801007f0 <consoleintr>
}
80105bd0:	83 c4 10             	add    $0x10,%esp
80105bd3:	c9                   	leave  
80105bd4:	c3                   	ret    

80105bd5 <vector0>:
# generated by vectors.pl - do not edit
# handlers
.globl alltraps
.globl vector0
vector0:
  pushl $0
80105bd5:	6a 00                	push   $0x0
  pushl $0
80105bd7:	6a 00                	push   $0x0
  jmp alltraps
80105bd9:	e9 cc fa ff ff       	jmp    801056aa <alltraps>

80105bde <vector1>:
.globl vector1
vector1:
  pushl $0
80105bde:	6a 00                	push   $0x0
  pushl $1
80105be0:	6a 01                	push   $0x1
  jmp alltraps
80105be2:	e9 c3 fa ff ff       	jmp    801056aa <alltraps>

80105be7 <vector2>:
.globl vector2
vector2:
  pushl $0
80105be7:	6a 00                	push   $0x0
  pushl $2
80105be9:	6a 02                	push   $0x2
  jmp alltraps
80105beb:	e9 ba fa ff ff       	jmp    801056aa <alltraps>

80105bf0 <vector3>:
.globl vector3
vector3:
  pushl $0
80105bf0:	6a 00                	push   $0x0
  pushl $3
80105bf2:	6a 03                	push   $0x3
  jmp alltraps
80105bf4:	e9 b1 fa ff ff       	jmp    801056aa <alltraps>

80105bf9 <vector4>:
.globl vector4
vector4:
  pushl $0
80105bf9:	6a 00                	push   $0x0
  pushl $4
80105bfb:	6a 04                	push   $0x4
  jmp alltraps
80105bfd:	e9 a8 fa ff ff       	jmp    801056aa <alltraps>

80105c02 <vector5>:
.globl vector5
vector5:
  pushl $0
80105c02:	6a 00                	push   $0x0
  pushl $5
80105c04:	6a 05                	push   $0x5
  jmp alltraps
80105c06:	e9 9f fa ff ff       	jmp    801056aa <alltraps>

80105c0b <vector6>:
.globl vector6
vector6:
  pushl $0
80105c0b:	6a 00                	push   $0x0
  pushl $6
80105c0d:	6a 06                	push   $0x6
  jmp alltraps
80105c0f:	e9 96 fa ff ff       	jmp    801056aa <alltraps>

80105c14 <vector7>:
.globl vector7
vector7:
  pushl $0
80105c14:	6a 00                	push   $0x0
  pushl $7
80105c16:	6a 07                	push   $0x7
  jmp alltraps
80105c18:	e9 8d fa ff ff       	jmp    801056aa <alltraps>

80105c1d <vector8>:
.globl vector8
vector8:
  pushl $8
80105c1d:	6a 08                	push   $0x8
  jmp alltraps
80105c1f:	e9 86 fa ff ff       	jmp    801056aa <alltraps>

80105c24 <vector9>:
.globl vector9
vector9:
  pushl $0
80105c24:	6a 00                	push   $0x0
  pushl $9
80105c26:	6a 09                	push   $0x9
  jmp alltraps
80105c28:	e9 7d fa ff ff       	jmp    801056aa <alltraps>

80105c2d <vector10>:
.globl vector10
vector10:
  pushl $10
80105c2d:	6a 0a                	push   $0xa
  jmp alltraps
80105c2f:	e9 76 fa ff ff       	jmp    801056aa <alltraps>

80105c34 <vector11>:
.globl vector11
vector11:
  pushl $11
80105c34:	6a 0b                	push   $0xb
  jmp alltraps
80105c36:	e9 6f fa ff ff       	jmp    801056aa <alltraps>

80105c3b <vector12>:
.globl vector12
vector12:
  pushl $12
80105c3b:	6a 0c                	push   $0xc
  jmp alltraps
80105c3d:	e9 68 fa ff ff       	jmp    801056aa <alltraps>

80105c42 <vector13>:
.globl vector13
vector13:
  pushl $13
80105c42:	6a 0d                	push   $0xd
  jmp alltraps
80105c44:	e9 61 fa ff ff       	jmp    801056aa <alltraps>

80105c49 <vector14>:
.globl vector14
vector14:
  pushl $14
80105c49:	6a 0e                	push   $0xe
  jmp alltraps
80105c4b:	e9 5a fa ff ff       	jmp    801056aa <alltraps>

80105c50 <vector15>:
.globl vector15
vector15:
  pushl $0
80105c50:	6a 00                	push   $0x0
  pushl $15
80105c52:	6a 0f                	push   $0xf
  jmp alltraps
80105c54:	e9 51 fa ff ff       	jmp    801056aa <alltraps>

80105c59 <vector16>:
.globl vector16
vector16:
  pushl $0
80105c59:	6a 00                	push   $0x0
  pushl $16
80105c5b:	6a 10                	push   $0x10
  jmp alltraps
80105c5d:	e9 48 fa ff ff       	jmp    801056aa <alltraps>

80105c62 <vector17>:
.globl vector17
vector17:
  pushl $17
80105c62:	6a 11                	push   $0x11
  jmp alltraps
80105c64:	e9 41 fa ff ff       	jmp    801056aa <alltraps>

80105c69 <vector18>:
.globl vector18
vector18:
  pushl $0
80105c69:	6a 00                	push   $0x0
  pushl $18
80105c6b:	6a 12                	push   $0x12
  jmp alltraps
80105c6d:	e9 38 fa ff ff       	jmp    801056aa <alltraps>

80105c72 <vector19>:
.globl vector19
vector19:
  pushl $0
80105c72:	6a 00                	push   $0x0
  pushl $19
80105c74:	6a 13                	push   $0x13
  jmp alltraps
80105c76:	e9 2f fa ff ff       	jmp    801056aa <alltraps>

80105c7b <vector20>:
.globl vector20
vector20:
  pushl $0
80105c7b:	6a 00                	push   $0x0
  pushl $20
80105c7d:	6a 14                	push   $0x14
  jmp alltraps
80105c7f:	e9 26 fa ff ff       	jmp    801056aa <alltraps>

80105c84 <vector21>:
.globl vector21
vector21:
  pushl $0
80105c84:	6a 00                	push   $0x0
  pushl $21
80105c86:	6a 15                	push   $0x15
  jmp alltraps
80105c88:	e9 1d fa ff ff       	jmp    801056aa <alltraps>

80105c8d <vector22>:
.globl vector22
vector22:
  pushl $0
80105c8d:	6a 00                	push   $0x0
  pushl $22
80105c8f:	6a 16                	push   $0x16
  jmp alltraps
80105c91:	e9 14 fa ff ff       	jmp    801056aa <alltraps>

80105c96 <vector23>:
.globl vector23
vector23:
  pushl $0
80105c96:	6a 00                	push   $0x0
  pushl $23
80105c98:	6a 17                	push   $0x17
  jmp alltraps
80105c9a:	e9 0b fa ff ff       	jmp    801056aa <alltraps>

80105c9f <vector24>:
.globl vector24
vector24:
  pushl $0
80105c9f:	6a 00                	push   $0x0
  pushl $24
80105ca1:	6a 18                	push   $0x18
  jmp alltraps
80105ca3:	e9 02 fa ff ff       	jmp    801056aa <alltraps>

80105ca8 <vector25>:
.globl vector25
vector25:
  pushl $0
80105ca8:	6a 00                	push   $0x0
  pushl $25
80105caa:	6a 19                	push   $0x19
  jmp alltraps
80105cac:	e9 f9 f9 ff ff       	jmp    801056aa <alltraps>

80105cb1 <vector26>:
.globl vector26
vector26:
  pushl $0
80105cb1:	6a 00                	push   $0x0
  pushl $26
80105cb3:	6a 1a                	push   $0x1a
  jmp alltraps
80105cb5:	e9 f0 f9 ff ff       	jmp    801056aa <alltraps>

80105cba <vector27>:
.globl vector27
vector27:
  pushl $0
80105cba:	6a 00                	push   $0x0
  pushl $27
80105cbc:	6a 1b                	push   $0x1b
  jmp alltraps
80105cbe:	e9 e7 f9 ff ff       	jmp    801056aa <alltraps>

80105cc3 <vector28>:
.globl vector28
vector28:
  pushl $0
80105cc3:	6a 00                	push   $0x0
  pushl $28
80105cc5:	6a 1c                	push   $0x1c
  jmp alltraps
80105cc7:	e9 de f9 ff ff       	jmp    801056aa <alltraps>

80105ccc <vector29>:
.globl vector29
vector29:
  pushl $0
80105ccc:	6a 00                	push   $0x0
  pushl $29
80105cce:	6a 1d                	push   $0x1d
  jmp alltraps
80105cd0:	e9 d5 f9 ff ff       	jmp    801056aa <alltraps>

80105cd5 <vector30>:
.globl vector30
vector30:
  pushl $0
80105cd5:	6a 00                	push   $0x0
  pushl $30
80105cd7:	6a 1e                	push   $0x1e
  jmp alltraps
80105cd9:	e9 cc f9 ff ff       	jmp    801056aa <alltraps>

80105cde <vector31>:
.globl vector31
vector31:
  pushl $0
80105cde:	6a 00                	push   $0x0
  pushl $31
80105ce0:	6a 1f                	push   $0x1f
  jmp alltraps
80105ce2:	e9 c3 f9 ff ff       	jmp    801056aa <alltraps>

80105ce7 <vector32>:
.globl vector32
vector32:
  pushl $0
80105ce7:	6a 00                	push   $0x0
  pushl $32
80105ce9:	6a 20                	push   $0x20
  jmp alltraps
80105ceb:	e9 ba f9 ff ff       	jmp    801056aa <alltraps>

80105cf0 <vector33>:
.globl vector33
vector33:
  pushl $0
80105cf0:	6a 00                	push   $0x0
  pushl $33
80105cf2:	6a 21                	push   $0x21
  jmp alltraps
80105cf4:	e9 b1 f9 ff ff       	jmp    801056aa <alltraps>

80105cf9 <vector34>:
.globl vector34
vector34:
  pushl $0
80105cf9:	6a 00                	push   $0x0
  pushl $34
80105cfb:	6a 22                	push   $0x22
  jmp alltraps
80105cfd:	e9 a8 f9 ff ff       	jmp    801056aa <alltraps>

80105d02 <vector35>:
.globl vector35
vector35:
  pushl $0
80105d02:	6a 00                	push   $0x0
  pushl $35
80105d04:	6a 23                	push   $0x23
  jmp alltraps
80105d06:	e9 9f f9 ff ff       	jmp    801056aa <alltraps>

80105d0b <vector36>:
.globl vector36
vector36:
  pushl $0
80105d0b:	6a 00                	push   $0x0
  pushl $36
80105d0d:	6a 24                	push   $0x24
  jmp alltraps
80105d0f:	e9 96 f9 ff ff       	jmp    801056aa <alltraps>

80105d14 <vector37>:
.globl vector37
vector37:
  pushl $0
80105d14:	6a 00                	push   $0x0
  pushl $37
80105d16:	6a 25                	push   $0x25
  jmp alltraps
80105d18:	e9 8d f9 ff ff       	jmp    801056aa <alltraps>

80105d1d <vector38>:
.globl vector38
vector38:
  pushl $0
80105d1d:	6a 00                	push   $0x0
  pushl $38
80105d1f:	6a 26                	push   $0x26
  jmp alltraps
80105d21:	e9 84 f9 ff ff       	jmp    801056aa <alltraps>

80105d26 <vector39>:
.globl vector39
vector39:
  pushl $0
80105d26:	6a 00                	push   $0x0
  pushl $39
80105d28:	6a 27                	push   $0x27
  jmp alltraps
80105d2a:	e9 7b f9 ff ff       	jmp    801056aa <alltraps>

80105d2f <vector40>:
.globl vector40
vector40:
  pushl $0
80105d2f:	6a 00                	push   $0x0
  pushl $40
80105d31:	6a 28                	push   $0x28
  jmp alltraps
80105d33:	e9 72 f9 ff ff       	jmp    801056aa <alltraps>

80105d38 <vector41>:
.globl vector41
vector41:
  pushl $0
80105d38:	6a 00                	push   $0x0
  pushl $41
80105d3a:	6a 29                	push   $0x29
  jmp alltraps
80105d3c:	e9 69 f9 ff ff       	jmp    801056aa <alltraps>

80105d41 <vector42>:
.globl vector42
vector42:
  pushl $0
80105d41:	6a 00                	push   $0x0
  pushl $42
80105d43:	6a 2a                	push   $0x2a
  jmp alltraps
80105d45:	e9 60 f9 ff ff       	jmp    801056aa <alltraps>

80105d4a <vector43>:
.globl vector43
vector43:
  pushl $0
80105d4a:	6a 00                	push   $0x0
  pushl $43
80105d4c:	6a 2b                	push   $0x2b
  jmp alltraps
80105d4e:	e9 57 f9 ff ff       	jmp    801056aa <alltraps>

80105d53 <vector44>:
.globl vector44
vector44:
  pushl $0
80105d53:	6a 00                	push   $0x0
  pushl $44
80105d55:	6a 2c                	push   $0x2c
  jmp alltraps
80105d57:	e9 4e f9 ff ff       	jmp    801056aa <alltraps>

80105d5c <vector45>:
.globl vector45
vector45:
  pushl $0
80105d5c:	6a 00                	push   $0x0
  pushl $45
80105d5e:	6a 2d                	push   $0x2d
  jmp alltraps
80105d60:	e9 45 f9 ff ff       	jmp    801056aa <alltraps>

80105d65 <vector46>:
.globl vector46
vector46:
  pushl $0
80105d65:	6a 00                	push   $0x0
  pushl $46
80105d67:	6a 2e                	push   $0x2e
  jmp alltraps
80105d69:	e9 3c f9 ff ff       	jmp    801056aa <alltraps>

80105d6e <vector47>:
.globl vector47
vector47:
  pushl $0
80105d6e:	6a 00                	push   $0x0
  pushl $47
80105d70:	6a 2f                	push   $0x2f
  jmp alltraps
80105d72:	e9 33 f9 ff ff       	jmp    801056aa <alltraps>

80105d77 <vector48>:
.globl vector48
vector48:
  pushl $0
80105d77:	6a 00                	push   $0x0
  pushl $48
80105d79:	6a 30                	push   $0x30
  jmp alltraps
80105d7b:	e9 2a f9 ff ff       	jmp    801056aa <alltraps>

80105d80 <vector49>:
.globl vector49
vector49:
  pushl $0
80105d80:	6a 00                	push   $0x0
  pushl $49
80105d82:	6a 31                	push   $0x31
  jmp alltraps
80105d84:	e9 21 f9 ff ff       	jmp    801056aa <alltraps>

80105d89 <vector50>:
.globl vector50
vector50:
  pushl $0
80105d89:	6a 00                	push   $0x0
  pushl $50
80105d8b:	6a 32                	push   $0x32
  jmp alltraps
80105d8d:	e9 18 f9 ff ff       	jmp    801056aa <alltraps>

80105d92 <vector51>:
.globl vector51
vector51:
  pushl $0
80105d92:	6a 00                	push   $0x0
  pushl $51
80105d94:	6a 33                	push   $0x33
  jmp alltraps
80105d96:	e9 0f f9 ff ff       	jmp    801056aa <alltraps>

80105d9b <vector52>:
.globl vector52
vector52:
  pushl $0
80105d9b:	6a 00                	push   $0x0
  pushl $52
80105d9d:	6a 34                	push   $0x34
  jmp alltraps
80105d9f:	e9 06 f9 ff ff       	jmp    801056aa <alltraps>

80105da4 <vector53>:
.globl vector53
vector53:
  pushl $0
80105da4:	6a 00                	push   $0x0
  pushl $53
80105da6:	6a 35                	push   $0x35
  jmp alltraps
80105da8:	e9 fd f8 ff ff       	jmp    801056aa <alltraps>

80105dad <vector54>:
.globl vector54
vector54:
  pushl $0
80105dad:	6a 00                	push   $0x0
  pushl $54
80105daf:	6a 36                	push   $0x36
  jmp alltraps
80105db1:	e9 f4 f8 ff ff       	jmp    801056aa <alltraps>

80105db6 <vector55>:
.globl vector55
vector55:
  pushl $0
80105db6:	6a 00                	push   $0x0
  pushl $55
80105db8:	6a 37                	push   $0x37
  jmp alltraps
80105dba:	e9 eb f8 ff ff       	jmp    801056aa <alltraps>

80105dbf <vector56>:
.globl vector56
vector56:
  pushl $0
80105dbf:	6a 00                	push   $0x0
  pushl $56
80105dc1:	6a 38                	push   $0x38
  jmp alltraps
80105dc3:	e9 e2 f8 ff ff       	jmp    801056aa <alltraps>

80105dc8 <vector57>:
.globl vector57
vector57:
  pushl $0
80105dc8:	6a 00                	push   $0x0
  pushl $57
80105dca:	6a 39                	push   $0x39
  jmp alltraps
80105dcc:	e9 d9 f8 ff ff       	jmp    801056aa <alltraps>

80105dd1 <vector58>:
.globl vector58
vector58:
  pushl $0
80105dd1:	6a 00                	push   $0x0
  pushl $58
80105dd3:	6a 3a                	push   $0x3a
  jmp alltraps
80105dd5:	e9 d0 f8 ff ff       	jmp    801056aa <alltraps>

80105dda <vector59>:
.globl vector59
vector59:
  pushl $0
80105dda:	6a 00                	push   $0x0
  pushl $59
80105ddc:	6a 3b                	push   $0x3b
  jmp alltraps
80105dde:	e9 c7 f8 ff ff       	jmp    801056aa <alltraps>

80105de3 <vector60>:
.globl vector60
vector60:
  pushl $0
80105de3:	6a 00                	push   $0x0
  pushl $60
80105de5:	6a 3c                	push   $0x3c
  jmp alltraps
80105de7:	e9 be f8 ff ff       	jmp    801056aa <alltraps>

80105dec <vector61>:
.globl vector61
vector61:
  pushl $0
80105dec:	6a 00                	push   $0x0
  pushl $61
80105dee:	6a 3d                	push   $0x3d
  jmp alltraps
80105df0:	e9 b5 f8 ff ff       	jmp    801056aa <alltraps>

80105df5 <vector62>:
.globl vector62
vector62:
  pushl $0
80105df5:	6a 00                	push   $0x0
  pushl $62
80105df7:	6a 3e                	push   $0x3e
  jmp alltraps
80105df9:	e9 ac f8 ff ff       	jmp    801056aa <alltraps>

80105dfe <vector63>:
.globl vector63
vector63:
  pushl $0
80105dfe:	6a 00                	push   $0x0
  pushl $63
80105e00:	6a 3f                	push   $0x3f
  jmp alltraps
80105e02:	e9 a3 f8 ff ff       	jmp    801056aa <alltraps>

80105e07 <vector64>:
.globl vector64
vector64:
  pushl $0
80105e07:	6a 00                	push   $0x0
  pushl $64
80105e09:	6a 40                	push   $0x40
  jmp alltraps
80105e0b:	e9 9a f8 ff ff       	jmp    801056aa <alltraps>

80105e10 <vector65>:
.globl vector65
vector65:
  pushl $0
80105e10:	6a 00                	push   $0x0
  pushl $65
80105e12:	6a 41                	push   $0x41
  jmp alltraps
80105e14:	e9 91 f8 ff ff       	jmp    801056aa <alltraps>

80105e19 <vector66>:
.globl vector66
vector66:
  pushl $0
80105e19:	6a 00                	push   $0x0
  pushl $66
80105e1b:	6a 42                	push   $0x42
  jmp alltraps
80105e1d:	e9 88 f8 ff ff       	jmp    801056aa <alltraps>

80105e22 <vector67>:
.globl vector67
vector67:
  pushl $0
80105e22:	6a 00                	push   $0x0
  pushl $67
80105e24:	6a 43                	push   $0x43
  jmp alltraps
80105e26:	e9 7f f8 ff ff       	jmp    801056aa <alltraps>

80105e2b <vector68>:
.globl vector68
vector68:
  pushl $0
80105e2b:	6a 00                	push   $0x0
  pushl $68
80105e2d:	6a 44                	push   $0x44
  jmp alltraps
80105e2f:	e9 76 f8 ff ff       	jmp    801056aa <alltraps>

80105e34 <vector69>:
.globl vector69
vector69:
  pushl $0
80105e34:	6a 00                	push   $0x0
  pushl $69
80105e36:	6a 45                	push   $0x45
  jmp alltraps
80105e38:	e9 6d f8 ff ff       	jmp    801056aa <alltraps>

80105e3d <vector70>:
.globl vector70
vector70:
  pushl $0
80105e3d:	6a 00                	push   $0x0
  pushl $70
80105e3f:	6a 46                	push   $0x46
  jmp alltraps
80105e41:	e9 64 f8 ff ff       	jmp    801056aa <alltraps>

80105e46 <vector71>:
.globl vector71
vector71:
  pushl $0
80105e46:	6a 00                	push   $0x0
  pushl $71
80105e48:	6a 47                	push   $0x47
  jmp alltraps
80105e4a:	e9 5b f8 ff ff       	jmp    801056aa <alltraps>

80105e4f <vector72>:
.globl vector72
vector72:
  pushl $0
80105e4f:	6a 00                	push   $0x0
  pushl $72
80105e51:	6a 48                	push   $0x48
  jmp alltraps
80105e53:	e9 52 f8 ff ff       	jmp    801056aa <alltraps>

80105e58 <vector73>:
.globl vector73
vector73:
  pushl $0
80105e58:	6a 00                	push   $0x0
  pushl $73
80105e5a:	6a 49                	push   $0x49
  jmp alltraps
80105e5c:	e9 49 f8 ff ff       	jmp    801056aa <alltraps>

80105e61 <vector74>:
.globl vector74
vector74:
  pushl $0
80105e61:	6a 00                	push   $0x0
  pushl $74
80105e63:	6a 4a                	push   $0x4a
  jmp alltraps
80105e65:	e9 40 f8 ff ff       	jmp    801056aa <alltraps>

80105e6a <vector75>:
.globl vector75
vector75:
  pushl $0
80105e6a:	6a 00                	push   $0x0
  pushl $75
80105e6c:	6a 4b                	push   $0x4b
  jmp alltraps
80105e6e:	e9 37 f8 ff ff       	jmp    801056aa <alltraps>

80105e73 <vector76>:
.globl vector76
vector76:
  pushl $0
80105e73:	6a 00                	push   $0x0
  pushl $76
80105e75:	6a 4c                	push   $0x4c
  jmp alltraps
80105e77:	e9 2e f8 ff ff       	jmp    801056aa <alltraps>

80105e7c <vector77>:
.globl vector77
vector77:
  pushl $0
80105e7c:	6a 00                	push   $0x0
  pushl $77
80105e7e:	6a 4d                	push   $0x4d
  jmp alltraps
80105e80:	e9 25 f8 ff ff       	jmp    801056aa <alltraps>

80105e85 <vector78>:
.globl vector78
vector78:
  pushl $0
80105e85:	6a 00                	push   $0x0
  pushl $78
80105e87:	6a 4e                	push   $0x4e
  jmp alltraps
80105e89:	e9 1c f8 ff ff       	jmp    801056aa <alltraps>

80105e8e <vector79>:
.globl vector79
vector79:
  pushl $0
80105e8e:	6a 00                	push   $0x0
  pushl $79
80105e90:	6a 4f                	push   $0x4f
  jmp alltraps
80105e92:	e9 13 f8 ff ff       	jmp    801056aa <alltraps>

80105e97 <vector80>:
.globl vector80
vector80:
  pushl $0
80105e97:	6a 00                	push   $0x0
  pushl $80
80105e99:	6a 50                	push   $0x50
  jmp alltraps
80105e9b:	e9 0a f8 ff ff       	jmp    801056aa <alltraps>

80105ea0 <vector81>:
.globl vector81
vector81:
  pushl $0
80105ea0:	6a 00                	push   $0x0
  pushl $81
80105ea2:	6a 51                	push   $0x51
  jmp alltraps
80105ea4:	e9 01 f8 ff ff       	jmp    801056aa <alltraps>

80105ea9 <vector82>:
.globl vector82
vector82:
  pushl $0
80105ea9:	6a 00                	push   $0x0
  pushl $82
80105eab:	6a 52                	push   $0x52
  jmp alltraps
80105ead:	e9 f8 f7 ff ff       	jmp    801056aa <alltraps>

80105eb2 <vector83>:
.globl vector83
vector83:
  pushl $0
80105eb2:	6a 00                	push   $0x0
  pushl $83
80105eb4:	6a 53                	push   $0x53
  jmp alltraps
80105eb6:	e9 ef f7 ff ff       	jmp    801056aa <alltraps>

80105ebb <vector84>:
.globl vector84
vector84:
  pushl $0
80105ebb:	6a 00                	push   $0x0
  pushl $84
80105ebd:	6a 54                	push   $0x54
  jmp alltraps
80105ebf:	e9 e6 f7 ff ff       	jmp    801056aa <alltraps>

80105ec4 <vector85>:
.globl vector85
vector85:
  pushl $0
80105ec4:	6a 00                	push   $0x0
  pushl $85
80105ec6:	6a 55                	push   $0x55
  jmp alltraps
80105ec8:	e9 dd f7 ff ff       	jmp    801056aa <alltraps>

80105ecd <vector86>:
.globl vector86
vector86:
  pushl $0
80105ecd:	6a 00                	push   $0x0
  pushl $86
80105ecf:	6a 56                	push   $0x56
  jmp alltraps
80105ed1:	e9 d4 f7 ff ff       	jmp    801056aa <alltraps>

80105ed6 <vector87>:
.globl vector87
vector87:
  pushl $0
80105ed6:	6a 00                	push   $0x0
  pushl $87
80105ed8:	6a 57                	push   $0x57
  jmp alltraps
80105eda:	e9 cb f7 ff ff       	jmp    801056aa <alltraps>

80105edf <vector88>:
.globl vector88
vector88:
  pushl $0
80105edf:	6a 00                	push   $0x0
  pushl $88
80105ee1:	6a 58                	push   $0x58
  jmp alltraps
80105ee3:	e9 c2 f7 ff ff       	jmp    801056aa <alltraps>

80105ee8 <vector89>:
.globl vector89
vector89:
  pushl $0
80105ee8:	6a 00                	push   $0x0
  pushl $89
80105eea:	6a 59                	push   $0x59
  jmp alltraps
80105eec:	e9 b9 f7 ff ff       	jmp    801056aa <alltraps>

80105ef1 <vector90>:
.globl vector90
vector90:
  pushl $0
80105ef1:	6a 00                	push   $0x0
  pushl $90
80105ef3:	6a 5a                	push   $0x5a
  jmp alltraps
80105ef5:	e9 b0 f7 ff ff       	jmp    801056aa <alltraps>

80105efa <vector91>:
.globl vector91
vector91:
  pushl $0
80105efa:	6a 00                	push   $0x0
  pushl $91
80105efc:	6a 5b                	push   $0x5b
  jmp alltraps
80105efe:	e9 a7 f7 ff ff       	jmp    801056aa <alltraps>

80105f03 <vector92>:
.globl vector92
vector92:
  pushl $0
80105f03:	6a 00                	push   $0x0
  pushl $92
80105f05:	6a 5c                	push   $0x5c
  jmp alltraps
80105f07:	e9 9e f7 ff ff       	jmp    801056aa <alltraps>

80105f0c <vector93>:
.globl vector93
vector93:
  pushl $0
80105f0c:	6a 00                	push   $0x0
  pushl $93
80105f0e:	6a 5d                	push   $0x5d
  jmp alltraps
80105f10:	e9 95 f7 ff ff       	jmp    801056aa <alltraps>

80105f15 <vector94>:
.globl vector94
vector94:
  pushl $0
80105f15:	6a 00                	push   $0x0
  pushl $94
80105f17:	6a 5e                	push   $0x5e
  jmp alltraps
80105f19:	e9 8c f7 ff ff       	jmp    801056aa <alltraps>

80105f1e <vector95>:
.globl vector95
vector95:
  pushl $0
80105f1e:	6a 00                	push   $0x0
  pushl $95
80105f20:	6a 5f                	push   $0x5f
  jmp alltraps
80105f22:	e9 83 f7 ff ff       	jmp    801056aa <alltraps>

80105f27 <vector96>:
.globl vector96
vector96:
  pushl $0
80105f27:	6a 00                	push   $0x0
  pushl $96
80105f29:	6a 60                	push   $0x60
  jmp alltraps
80105f2b:	e9 7a f7 ff ff       	jmp    801056aa <alltraps>

80105f30 <vector97>:
.globl vector97
vector97:
  pushl $0
80105f30:	6a 00                	push   $0x0
  pushl $97
80105f32:	6a 61                	push   $0x61
  jmp alltraps
80105f34:	e9 71 f7 ff ff       	jmp    801056aa <alltraps>

80105f39 <vector98>:
.globl vector98
vector98:
  pushl $0
80105f39:	6a 00                	push   $0x0
  pushl $98
80105f3b:	6a 62                	push   $0x62
  jmp alltraps
80105f3d:	e9 68 f7 ff ff       	jmp    801056aa <alltraps>

80105f42 <vector99>:
.globl vector99
vector99:
  pushl $0
80105f42:	6a 00                	push   $0x0
  pushl $99
80105f44:	6a 63                	push   $0x63
  jmp alltraps
80105f46:	e9 5f f7 ff ff       	jmp    801056aa <alltraps>

80105f4b <vector100>:
.globl vector100
vector100:
  pushl $0
80105f4b:	6a 00                	push   $0x0
  pushl $100
80105f4d:	6a 64                	push   $0x64
  jmp alltraps
80105f4f:	e9 56 f7 ff ff       	jmp    801056aa <alltraps>

80105f54 <vector101>:
.globl vector101
vector101:
  pushl $0
80105f54:	6a 00                	push   $0x0
  pushl $101
80105f56:	6a 65                	push   $0x65
  jmp alltraps
80105f58:	e9 4d f7 ff ff       	jmp    801056aa <alltraps>

80105f5d <vector102>:
.globl vector102
vector102:
  pushl $0
80105f5d:	6a 00                	push   $0x0
  pushl $102
80105f5f:	6a 66                	push   $0x66
  jmp alltraps
80105f61:	e9 44 f7 ff ff       	jmp    801056aa <alltraps>

80105f66 <vector103>:
.globl vector103
vector103:
  pushl $0
80105f66:	6a 00                	push   $0x0
  pushl $103
80105f68:	6a 67                	push   $0x67
  jmp alltraps
80105f6a:	e9 3b f7 ff ff       	jmp    801056aa <alltraps>

80105f6f <vector104>:
.globl vector104
vector104:
  pushl $0
80105f6f:	6a 00                	push   $0x0
  pushl $104
80105f71:	6a 68                	push   $0x68
  jmp alltraps
80105f73:	e9 32 f7 ff ff       	jmp    801056aa <alltraps>

80105f78 <vector105>:
.globl vector105
vector105:
  pushl $0
80105f78:	6a 00                	push   $0x0
  pushl $105
80105f7a:	6a 69                	push   $0x69
  jmp alltraps
80105f7c:	e9 29 f7 ff ff       	jmp    801056aa <alltraps>

80105f81 <vector106>:
.globl vector106
vector106:
  pushl $0
80105f81:	6a 00                	push   $0x0
  pushl $106
80105f83:	6a 6a                	push   $0x6a
  jmp alltraps
80105f85:	e9 20 f7 ff ff       	jmp    801056aa <alltraps>

80105f8a <vector107>:
.globl vector107
vector107:
  pushl $0
80105f8a:	6a 00                	push   $0x0
  pushl $107
80105f8c:	6a 6b                	push   $0x6b
  jmp alltraps
80105f8e:	e9 17 f7 ff ff       	jmp    801056aa <alltraps>

80105f93 <vector108>:
.globl vector108
vector108:
  pushl $0
80105f93:	6a 00                	push   $0x0
  pushl $108
80105f95:	6a 6c                	push   $0x6c
  jmp alltraps
80105f97:	e9 0e f7 ff ff       	jmp    801056aa <alltraps>

80105f9c <vector109>:
.globl vector109
vector109:
  pushl $0
80105f9c:	6a 00                	push   $0x0
  pushl $109
80105f9e:	6a 6d                	push   $0x6d
  jmp alltraps
80105fa0:	e9 05 f7 ff ff       	jmp    801056aa <alltraps>

80105fa5 <vector110>:
.globl vector110
vector110:
  pushl $0
80105fa5:	6a 00                	push   $0x0
  pushl $110
80105fa7:	6a 6e                	push   $0x6e
  jmp alltraps
80105fa9:	e9 fc f6 ff ff       	jmp    801056aa <alltraps>

80105fae <vector111>:
.globl vector111
vector111:
  pushl $0
80105fae:	6a 00                	push   $0x0
  pushl $111
80105fb0:	6a 6f                	push   $0x6f
  jmp alltraps
80105fb2:	e9 f3 f6 ff ff       	jmp    801056aa <alltraps>

80105fb7 <vector112>:
.globl vector112
vector112:
  pushl $0
80105fb7:	6a 00                	push   $0x0
  pushl $112
80105fb9:	6a 70                	push   $0x70
  jmp alltraps
80105fbb:	e9 ea f6 ff ff       	jmp    801056aa <alltraps>

80105fc0 <vector113>:
.globl vector113
vector113:
  pushl $0
80105fc0:	6a 00                	push   $0x0
  pushl $113
80105fc2:	6a 71                	push   $0x71
  jmp alltraps
80105fc4:	e9 e1 f6 ff ff       	jmp    801056aa <alltraps>

80105fc9 <vector114>:
.globl vector114
vector114:
  pushl $0
80105fc9:	6a 00                	push   $0x0
  pushl $114
80105fcb:	6a 72                	push   $0x72
  jmp alltraps
80105fcd:	e9 d8 f6 ff ff       	jmp    801056aa <alltraps>

80105fd2 <vector115>:
.globl vector115
vector115:
  pushl $0
80105fd2:	6a 00                	push   $0x0
  pushl $115
80105fd4:	6a 73                	push   $0x73
  jmp alltraps
80105fd6:	e9 cf f6 ff ff       	jmp    801056aa <alltraps>

80105fdb <vector116>:
.globl vector116
vector116:
  pushl $0
80105fdb:	6a 00                	push   $0x0
  pushl $116
80105fdd:	6a 74                	push   $0x74
  jmp alltraps
80105fdf:	e9 c6 f6 ff ff       	jmp    801056aa <alltraps>

80105fe4 <vector117>:
.globl vector117
vector117:
  pushl $0
80105fe4:	6a 00                	push   $0x0
  pushl $117
80105fe6:	6a 75                	push   $0x75
  jmp alltraps
80105fe8:	e9 bd f6 ff ff       	jmp    801056aa <alltraps>

80105fed <vector118>:
.globl vector118
vector118:
  pushl $0
80105fed:	6a 00                	push   $0x0
  pushl $118
80105fef:	6a 76                	push   $0x76
  jmp alltraps
80105ff1:	e9 b4 f6 ff ff       	jmp    801056aa <alltraps>

80105ff6 <vector119>:
.globl vector119
vector119:
  pushl $0
80105ff6:	6a 00                	push   $0x0
  pushl $119
80105ff8:	6a 77                	push   $0x77
  jmp alltraps
80105ffa:	e9 ab f6 ff ff       	jmp    801056aa <alltraps>

80105fff <vector120>:
.globl vector120
vector120:
  pushl $0
80105fff:	6a 00                	push   $0x0
  pushl $120
80106001:	6a 78                	push   $0x78
  jmp alltraps
80106003:	e9 a2 f6 ff ff       	jmp    801056aa <alltraps>

80106008 <vector121>:
.globl vector121
vector121:
  pushl $0
80106008:	6a 00                	push   $0x0
  pushl $121
8010600a:	6a 79                	push   $0x79
  jmp alltraps
8010600c:	e9 99 f6 ff ff       	jmp    801056aa <alltraps>

80106011 <vector122>:
.globl vector122
vector122:
  pushl $0
80106011:	6a 00                	push   $0x0
  pushl $122
80106013:	6a 7a                	push   $0x7a
  jmp alltraps
80106015:	e9 90 f6 ff ff       	jmp    801056aa <alltraps>

8010601a <vector123>:
.globl vector123
vector123:
  pushl $0
8010601a:	6a 00                	push   $0x0
  pushl $123
8010601c:	6a 7b                	push   $0x7b
  jmp alltraps
8010601e:	e9 87 f6 ff ff       	jmp    801056aa <alltraps>

80106023 <vector124>:
.globl vector124
vector124:
  pushl $0
80106023:	6a 00                	push   $0x0
  pushl $124
80106025:	6a 7c                	push   $0x7c
  jmp alltraps
80106027:	e9 7e f6 ff ff       	jmp    801056aa <alltraps>

8010602c <vector125>:
.globl vector125
vector125:
  pushl $0
8010602c:	6a 00                	push   $0x0
  pushl $125
8010602e:	6a 7d                	push   $0x7d
  jmp alltraps
80106030:	e9 75 f6 ff ff       	jmp    801056aa <alltraps>

80106035 <vector126>:
.globl vector126
vector126:
  pushl $0
80106035:	6a 00                	push   $0x0
  pushl $126
80106037:	6a 7e                	push   $0x7e
  jmp alltraps
80106039:	e9 6c f6 ff ff       	jmp    801056aa <alltraps>

8010603e <vector127>:
.globl vector127
vector127:
  pushl $0
8010603e:	6a 00                	push   $0x0
  pushl $127
80106040:	6a 7f                	push   $0x7f
  jmp alltraps
80106042:	e9 63 f6 ff ff       	jmp    801056aa <alltraps>

80106047 <vector128>:
.globl vector128
vector128:
  pushl $0
80106047:	6a 00                	push   $0x0
  pushl $128
80106049:	68 80 00 00 00       	push   $0x80
  jmp alltraps
8010604e:	e9 57 f6 ff ff       	jmp    801056aa <alltraps>

80106053 <vector129>:
.globl vector129
vector129:
  pushl $0
80106053:	6a 00                	push   $0x0
  pushl $129
80106055:	68 81 00 00 00       	push   $0x81
  jmp alltraps
8010605a:	e9 4b f6 ff ff       	jmp    801056aa <alltraps>

8010605f <vector130>:
.globl vector130
vector130:
  pushl $0
8010605f:	6a 00                	push   $0x0
  pushl $130
80106061:	68 82 00 00 00       	push   $0x82
  jmp alltraps
80106066:	e9 3f f6 ff ff       	jmp    801056aa <alltraps>

8010606b <vector131>:
.globl vector131
vector131:
  pushl $0
8010606b:	6a 00                	push   $0x0
  pushl $131
8010606d:	68 83 00 00 00       	push   $0x83
  jmp alltraps
80106072:	e9 33 f6 ff ff       	jmp    801056aa <alltraps>

80106077 <vector132>:
.globl vector132
vector132:
  pushl $0
80106077:	6a 00                	push   $0x0
  pushl $132
80106079:	68 84 00 00 00       	push   $0x84
  jmp alltraps
8010607e:	e9 27 f6 ff ff       	jmp    801056aa <alltraps>

80106083 <vector133>:
.globl vector133
vector133:
  pushl $0
80106083:	6a 00                	push   $0x0
  pushl $133
80106085:	68 85 00 00 00       	push   $0x85
  jmp alltraps
8010608a:	e9 1b f6 ff ff       	jmp    801056aa <alltraps>

8010608f <vector134>:
.globl vector134
vector134:
  pushl $0
8010608f:	6a 00                	push   $0x0
  pushl $134
80106091:	68 86 00 00 00       	push   $0x86
  jmp alltraps
80106096:	e9 0f f6 ff ff       	jmp    801056aa <alltraps>

8010609b <vector135>:
.globl vector135
vector135:
  pushl $0
8010609b:	6a 00                	push   $0x0
  pushl $135
8010609d:	68 87 00 00 00       	push   $0x87
  jmp alltraps
801060a2:	e9 03 f6 ff ff       	jmp    801056aa <alltraps>

801060a7 <vector136>:
.globl vector136
vector136:
  pushl $0
801060a7:	6a 00                	push   $0x0
  pushl $136
801060a9:	68 88 00 00 00       	push   $0x88
  jmp alltraps
801060ae:	e9 f7 f5 ff ff       	jmp    801056aa <alltraps>

801060b3 <vector137>:
.globl vector137
vector137:
  pushl $0
801060b3:	6a 00                	push   $0x0
  pushl $137
801060b5:	68 89 00 00 00       	push   $0x89
  jmp alltraps
801060ba:	e9 eb f5 ff ff       	jmp    801056aa <alltraps>

801060bf <vector138>:
.globl vector138
vector138:
  pushl $0
801060bf:	6a 00                	push   $0x0
  pushl $138
801060c1:	68 8a 00 00 00       	push   $0x8a
  jmp alltraps
801060c6:	e9 df f5 ff ff       	jmp    801056aa <alltraps>

801060cb <vector139>:
.globl vector139
vector139:
  pushl $0
801060cb:	6a 00                	push   $0x0
  pushl $139
801060cd:	68 8b 00 00 00       	push   $0x8b
  jmp alltraps
801060d2:	e9 d3 f5 ff ff       	jmp    801056aa <alltraps>

801060d7 <vector140>:
.globl vector140
vector140:
  pushl $0
801060d7:	6a 00                	push   $0x0
  pushl $140
801060d9:	68 8c 00 00 00       	push   $0x8c
  jmp alltraps
801060de:	e9 c7 f5 ff ff       	jmp    801056aa <alltraps>

801060e3 <vector141>:
.globl vector141
vector141:
  pushl $0
801060e3:	6a 00                	push   $0x0
  pushl $141
801060e5:	68 8d 00 00 00       	push   $0x8d
  jmp alltraps
801060ea:	e9 bb f5 ff ff       	jmp    801056aa <alltraps>

801060ef <vector142>:
.globl vector142
vector142:
  pushl $0
801060ef:	6a 00                	push   $0x0
  pushl $142
801060f1:	68 8e 00 00 00       	push   $0x8e
  jmp alltraps
801060f6:	e9 af f5 ff ff       	jmp    801056aa <alltraps>

801060fb <vector143>:
.globl vector143
vector143:
  pushl $0
801060fb:	6a 00                	push   $0x0
  pushl $143
801060fd:	68 8f 00 00 00       	push   $0x8f
  jmp alltraps
80106102:	e9 a3 f5 ff ff       	jmp    801056aa <alltraps>

80106107 <vector144>:
.globl vector144
vector144:
  pushl $0
80106107:	6a 00                	push   $0x0
  pushl $144
80106109:	68 90 00 00 00       	push   $0x90
  jmp alltraps
8010610e:	e9 97 f5 ff ff       	jmp    801056aa <alltraps>

80106113 <vector145>:
.globl vector145
vector145:
  pushl $0
80106113:	6a 00                	push   $0x0
  pushl $145
80106115:	68 91 00 00 00       	push   $0x91
  jmp alltraps
8010611a:	e9 8b f5 ff ff       	jmp    801056aa <alltraps>

8010611f <vector146>:
.globl vector146
vector146:
  pushl $0
8010611f:	6a 00                	push   $0x0
  pushl $146
80106121:	68 92 00 00 00       	push   $0x92
  jmp alltraps
80106126:	e9 7f f5 ff ff       	jmp    801056aa <alltraps>

8010612b <vector147>:
.globl vector147
vector147:
  pushl $0
8010612b:	6a 00                	push   $0x0
  pushl $147
8010612d:	68 93 00 00 00       	push   $0x93
  jmp alltraps
80106132:	e9 73 f5 ff ff       	jmp    801056aa <alltraps>

80106137 <vector148>:
.globl vector148
vector148:
  pushl $0
80106137:	6a 00                	push   $0x0
  pushl $148
80106139:	68 94 00 00 00       	push   $0x94
  jmp alltraps
8010613e:	e9 67 f5 ff ff       	jmp    801056aa <alltraps>

80106143 <vector149>:
.globl vector149
vector149:
  pushl $0
80106143:	6a 00                	push   $0x0
  pushl $149
80106145:	68 95 00 00 00       	push   $0x95
  jmp alltraps
8010614a:	e9 5b f5 ff ff       	jmp    801056aa <alltraps>

8010614f <vector150>:
.globl vector150
vector150:
  pushl $0
8010614f:	6a 00                	push   $0x0
  pushl $150
80106151:	68 96 00 00 00       	push   $0x96
  jmp alltraps
80106156:	e9 4f f5 ff ff       	jmp    801056aa <alltraps>

8010615b <vector151>:
.globl vector151
vector151:
  pushl $0
8010615b:	6a 00                	push   $0x0
  pushl $151
8010615d:	68 97 00 00 00       	push   $0x97
  jmp alltraps
80106162:	e9 43 f5 ff ff       	jmp    801056aa <alltraps>

80106167 <vector152>:
.globl vector152
vector152:
  pushl $0
80106167:	6a 00                	push   $0x0
  pushl $152
80106169:	68 98 00 00 00       	push   $0x98
  jmp alltraps
8010616e:	e9 37 f5 ff ff       	jmp    801056aa <alltraps>

80106173 <vector153>:
.globl vector153
vector153:
  pushl $0
80106173:	6a 00                	push   $0x0
  pushl $153
80106175:	68 99 00 00 00       	push   $0x99
  jmp alltraps
8010617a:	e9 2b f5 ff ff       	jmp    801056aa <alltraps>

8010617f <vector154>:
.globl vector154
vector154:
  pushl $0
8010617f:	6a 00                	push   $0x0
  pushl $154
80106181:	68 9a 00 00 00       	push   $0x9a
  jmp alltraps
80106186:	e9 1f f5 ff ff       	jmp    801056aa <alltraps>

8010618b <vector155>:
.globl vector155
vector155:
  pushl $0
8010618b:	6a 00                	push   $0x0
  pushl $155
8010618d:	68 9b 00 00 00       	push   $0x9b
  jmp alltraps
80106192:	e9 13 f5 ff ff       	jmp    801056aa <alltraps>

80106197 <vector156>:
.globl vector156
vector156:
  pushl $0
80106197:	6a 00                	push   $0x0
  pushl $156
80106199:	68 9c 00 00 00       	push   $0x9c
  jmp alltraps
8010619e:	e9 07 f5 ff ff       	jmp    801056aa <alltraps>

801061a3 <vector157>:
.globl vector157
vector157:
  pushl $0
801061a3:	6a 00                	push   $0x0
  pushl $157
801061a5:	68 9d 00 00 00       	push   $0x9d
  jmp alltraps
801061aa:	e9 fb f4 ff ff       	jmp    801056aa <alltraps>

801061af <vector158>:
.globl vector158
vector158:
  pushl $0
801061af:	6a 00                	push   $0x0
  pushl $158
801061b1:	68 9e 00 00 00       	push   $0x9e
  jmp alltraps
801061b6:	e9 ef f4 ff ff       	jmp    801056aa <alltraps>

801061bb <vector159>:
.globl vector159
vector159:
  pushl $0
801061bb:	6a 00                	push   $0x0
  pushl $159
801061bd:	68 9f 00 00 00       	push   $0x9f
  jmp alltraps
801061c2:	e9 e3 f4 ff ff       	jmp    801056aa <alltraps>

801061c7 <vector160>:
.globl vector160
vector160:
  pushl $0
801061c7:	6a 00                	push   $0x0
  pushl $160
801061c9:	68 a0 00 00 00       	push   $0xa0
  jmp alltraps
801061ce:	e9 d7 f4 ff ff       	jmp    801056aa <alltraps>

801061d3 <vector161>:
.globl vector161
vector161:
  pushl $0
801061d3:	6a 00                	push   $0x0
  pushl $161
801061d5:	68 a1 00 00 00       	push   $0xa1
  jmp alltraps
801061da:	e9 cb f4 ff ff       	jmp    801056aa <alltraps>

801061df <vector162>:
.globl vector162
vector162:
  pushl $0
801061df:	6a 00                	push   $0x0
  pushl $162
801061e1:	68 a2 00 00 00       	push   $0xa2
  jmp alltraps
801061e6:	e9 bf f4 ff ff       	jmp    801056aa <alltraps>

801061eb <vector163>:
.globl vector163
vector163:
  pushl $0
801061eb:	6a 00                	push   $0x0
  pushl $163
801061ed:	68 a3 00 00 00       	push   $0xa3
  jmp alltraps
801061f2:	e9 b3 f4 ff ff       	jmp    801056aa <alltraps>

801061f7 <vector164>:
.globl vector164
vector164:
  pushl $0
801061f7:	6a 00                	push   $0x0
  pushl $164
801061f9:	68 a4 00 00 00       	push   $0xa4
  jmp alltraps
801061fe:	e9 a7 f4 ff ff       	jmp    801056aa <alltraps>

80106203 <vector165>:
.globl vector165
vector165:
  pushl $0
80106203:	6a 00                	push   $0x0
  pushl $165
80106205:	68 a5 00 00 00       	push   $0xa5
  jmp alltraps
8010620a:	e9 9b f4 ff ff       	jmp    801056aa <alltraps>

8010620f <vector166>:
.globl vector166
vector166:
  pushl $0
8010620f:	6a 00                	push   $0x0
  pushl $166
80106211:	68 a6 00 00 00       	push   $0xa6
  jmp alltraps
80106216:	e9 8f f4 ff ff       	jmp    801056aa <alltraps>

8010621b <vector167>:
.globl vector167
vector167:
  pushl $0
8010621b:	6a 00                	push   $0x0
  pushl $167
8010621d:	68 a7 00 00 00       	push   $0xa7
  jmp alltraps
80106222:	e9 83 f4 ff ff       	jmp    801056aa <alltraps>

80106227 <vector168>:
.globl vector168
vector168:
  pushl $0
80106227:	6a 00                	push   $0x0
  pushl $168
80106229:	68 a8 00 00 00       	push   $0xa8
  jmp alltraps
8010622e:	e9 77 f4 ff ff       	jmp    801056aa <alltraps>

80106233 <vector169>:
.globl vector169
vector169:
  pushl $0
80106233:	6a 00                	push   $0x0
  pushl $169
80106235:	68 a9 00 00 00       	push   $0xa9
  jmp alltraps
8010623a:	e9 6b f4 ff ff       	jmp    801056aa <alltraps>

8010623f <vector170>:
.globl vector170
vector170:
  pushl $0
8010623f:	6a 00                	push   $0x0
  pushl $170
80106241:	68 aa 00 00 00       	push   $0xaa
  jmp alltraps
80106246:	e9 5f f4 ff ff       	jmp    801056aa <alltraps>

8010624b <vector171>:
.globl vector171
vector171:
  pushl $0
8010624b:	6a 00                	push   $0x0
  pushl $171
8010624d:	68 ab 00 00 00       	push   $0xab
  jmp alltraps
80106252:	e9 53 f4 ff ff       	jmp    801056aa <alltraps>

80106257 <vector172>:
.globl vector172
vector172:
  pushl $0
80106257:	6a 00                	push   $0x0
  pushl $172
80106259:	68 ac 00 00 00       	push   $0xac
  jmp alltraps
8010625e:	e9 47 f4 ff ff       	jmp    801056aa <alltraps>

80106263 <vector173>:
.globl vector173
vector173:
  pushl $0
80106263:	6a 00                	push   $0x0
  pushl $173
80106265:	68 ad 00 00 00       	push   $0xad
  jmp alltraps
8010626a:	e9 3b f4 ff ff       	jmp    801056aa <alltraps>

8010626f <vector174>:
.globl vector174
vector174:
  pushl $0
8010626f:	6a 00                	push   $0x0
  pushl $174
80106271:	68 ae 00 00 00       	push   $0xae
  jmp alltraps
80106276:	e9 2f f4 ff ff       	jmp    801056aa <alltraps>

8010627b <vector175>:
.globl vector175
vector175:
  pushl $0
8010627b:	6a 00                	push   $0x0
  pushl $175
8010627d:	68 af 00 00 00       	push   $0xaf
  jmp alltraps
80106282:	e9 23 f4 ff ff       	jmp    801056aa <alltraps>

80106287 <vector176>:
.globl vector176
vector176:
  pushl $0
80106287:	6a 00                	push   $0x0
  pushl $176
80106289:	68 b0 00 00 00       	push   $0xb0
  jmp alltraps
8010628e:	e9 17 f4 ff ff       	jmp    801056aa <alltraps>

80106293 <vector177>:
.globl vector177
vector177:
  pushl $0
80106293:	6a 00                	push   $0x0
  pushl $177
80106295:	68 b1 00 00 00       	push   $0xb1
  jmp alltraps
8010629a:	e9 0b f4 ff ff       	jmp    801056aa <alltraps>

8010629f <vector178>:
.globl vector178
vector178:
  pushl $0
8010629f:	6a 00                	push   $0x0
  pushl $178
801062a1:	68 b2 00 00 00       	push   $0xb2
  jmp alltraps
801062a6:	e9 ff f3 ff ff       	jmp    801056aa <alltraps>

801062ab <vector179>:
.globl vector179
vector179:
  pushl $0
801062ab:	6a 00                	push   $0x0
  pushl $179
801062ad:	68 b3 00 00 00       	push   $0xb3
  jmp alltraps
801062b2:	e9 f3 f3 ff ff       	jmp    801056aa <alltraps>

801062b7 <vector180>:
.globl vector180
vector180:
  pushl $0
801062b7:	6a 00                	push   $0x0
  pushl $180
801062b9:	68 b4 00 00 00       	push   $0xb4
  jmp alltraps
801062be:	e9 e7 f3 ff ff       	jmp    801056aa <alltraps>

801062c3 <vector181>:
.globl vector181
vector181:
  pushl $0
801062c3:	6a 00                	push   $0x0
  pushl $181
801062c5:	68 b5 00 00 00       	push   $0xb5
  jmp alltraps
801062ca:	e9 db f3 ff ff       	jmp    801056aa <alltraps>

801062cf <vector182>:
.globl vector182
vector182:
  pushl $0
801062cf:	6a 00                	push   $0x0
  pushl $182
801062d1:	68 b6 00 00 00       	push   $0xb6
  jmp alltraps
801062d6:	e9 cf f3 ff ff       	jmp    801056aa <alltraps>

801062db <vector183>:
.globl vector183
vector183:
  pushl $0
801062db:	6a 00                	push   $0x0
  pushl $183
801062dd:	68 b7 00 00 00       	push   $0xb7
  jmp alltraps
801062e2:	e9 c3 f3 ff ff       	jmp    801056aa <alltraps>

801062e7 <vector184>:
.globl vector184
vector184:
  pushl $0
801062e7:	6a 00                	push   $0x0
  pushl $184
801062e9:	68 b8 00 00 00       	push   $0xb8
  jmp alltraps
801062ee:	e9 b7 f3 ff ff       	jmp    801056aa <alltraps>

801062f3 <vector185>:
.globl vector185
vector185:
  pushl $0
801062f3:	6a 00                	push   $0x0
  pushl $185
801062f5:	68 b9 00 00 00       	push   $0xb9
  jmp alltraps
801062fa:	e9 ab f3 ff ff       	jmp    801056aa <alltraps>

801062ff <vector186>:
.globl vector186
vector186:
  pushl $0
801062ff:	6a 00                	push   $0x0
  pushl $186
80106301:	68 ba 00 00 00       	push   $0xba
  jmp alltraps
80106306:	e9 9f f3 ff ff       	jmp    801056aa <alltraps>

8010630b <vector187>:
.globl vector187
vector187:
  pushl $0
8010630b:	6a 00                	push   $0x0
  pushl $187
8010630d:	68 bb 00 00 00       	push   $0xbb
  jmp alltraps
80106312:	e9 93 f3 ff ff       	jmp    801056aa <alltraps>

80106317 <vector188>:
.globl vector188
vector188:
  pushl $0
80106317:	6a 00                	push   $0x0
  pushl $188
80106319:	68 bc 00 00 00       	push   $0xbc
  jmp alltraps
8010631e:	e9 87 f3 ff ff       	jmp    801056aa <alltraps>

80106323 <vector189>:
.globl vector189
vector189:
  pushl $0
80106323:	6a 00                	push   $0x0
  pushl $189
80106325:	68 bd 00 00 00       	push   $0xbd
  jmp alltraps
8010632a:	e9 7b f3 ff ff       	jmp    801056aa <alltraps>

8010632f <vector190>:
.globl vector190
vector190:
  pushl $0
8010632f:	6a 00                	push   $0x0
  pushl $190
80106331:	68 be 00 00 00       	push   $0xbe
  jmp alltraps
80106336:	e9 6f f3 ff ff       	jmp    801056aa <alltraps>

8010633b <vector191>:
.globl vector191
vector191:
  pushl $0
8010633b:	6a 00                	push   $0x0
  pushl $191
8010633d:	68 bf 00 00 00       	push   $0xbf
  jmp alltraps
80106342:	e9 63 f3 ff ff       	jmp    801056aa <alltraps>

80106347 <vector192>:
.globl vector192
vector192:
  pushl $0
80106347:	6a 00                	push   $0x0
  pushl $192
80106349:	68 c0 00 00 00       	push   $0xc0
  jmp alltraps
8010634e:	e9 57 f3 ff ff       	jmp    801056aa <alltraps>

80106353 <vector193>:
.globl vector193
vector193:
  pushl $0
80106353:	6a 00                	push   $0x0
  pushl $193
80106355:	68 c1 00 00 00       	push   $0xc1
  jmp alltraps
8010635a:	e9 4b f3 ff ff       	jmp    801056aa <alltraps>

8010635f <vector194>:
.globl vector194
vector194:
  pushl $0
8010635f:	6a 00                	push   $0x0
  pushl $194
80106361:	68 c2 00 00 00       	push   $0xc2
  jmp alltraps
80106366:	e9 3f f3 ff ff       	jmp    801056aa <alltraps>

8010636b <vector195>:
.globl vector195
vector195:
  pushl $0
8010636b:	6a 00                	push   $0x0
  pushl $195
8010636d:	68 c3 00 00 00       	push   $0xc3
  jmp alltraps
80106372:	e9 33 f3 ff ff       	jmp    801056aa <alltraps>

80106377 <vector196>:
.globl vector196
vector196:
  pushl $0
80106377:	6a 00                	push   $0x0
  pushl $196
80106379:	68 c4 00 00 00       	push   $0xc4
  jmp alltraps
8010637e:	e9 27 f3 ff ff       	jmp    801056aa <alltraps>

80106383 <vector197>:
.globl vector197
vector197:
  pushl $0
80106383:	6a 00                	push   $0x0
  pushl $197
80106385:	68 c5 00 00 00       	push   $0xc5
  jmp alltraps
8010638a:	e9 1b f3 ff ff       	jmp    801056aa <alltraps>

8010638f <vector198>:
.globl vector198
vector198:
  pushl $0
8010638f:	6a 00                	push   $0x0
  pushl $198
80106391:	68 c6 00 00 00       	push   $0xc6
  jmp alltraps
80106396:	e9 0f f3 ff ff       	jmp    801056aa <alltraps>

8010639b <vector199>:
.globl vector199
vector199:
  pushl $0
8010639b:	6a 00                	push   $0x0
  pushl $199
8010639d:	68 c7 00 00 00       	push   $0xc7
  jmp alltraps
801063a2:	e9 03 f3 ff ff       	jmp    801056aa <alltraps>

801063a7 <vector200>:
.globl vector200
vector200:
  pushl $0
801063a7:	6a 00                	push   $0x0
  pushl $200
801063a9:	68 c8 00 00 00       	push   $0xc8
  jmp alltraps
801063ae:	e9 f7 f2 ff ff       	jmp    801056aa <alltraps>

801063b3 <vector201>:
.globl vector201
vector201:
  pushl $0
801063b3:	6a 00                	push   $0x0
  pushl $201
801063b5:	68 c9 00 00 00       	push   $0xc9
  jmp alltraps
801063ba:	e9 eb f2 ff ff       	jmp    801056aa <alltraps>

801063bf <vector202>:
.globl vector202
vector202:
  pushl $0
801063bf:	6a 00                	push   $0x0
  pushl $202
801063c1:	68 ca 00 00 00       	push   $0xca
  jmp alltraps
801063c6:	e9 df f2 ff ff       	jmp    801056aa <alltraps>

801063cb <vector203>:
.globl vector203
vector203:
  pushl $0
801063cb:	6a 00                	push   $0x0
  pushl $203
801063cd:	68 cb 00 00 00       	push   $0xcb
  jmp alltraps
801063d2:	e9 d3 f2 ff ff       	jmp    801056aa <alltraps>

801063d7 <vector204>:
.globl vector204
vector204:
  pushl $0
801063d7:	6a 00                	push   $0x0
  pushl $204
801063d9:	68 cc 00 00 00       	push   $0xcc
  jmp alltraps
801063de:	e9 c7 f2 ff ff       	jmp    801056aa <alltraps>

801063e3 <vector205>:
.globl vector205
vector205:
  pushl $0
801063e3:	6a 00                	push   $0x0
  pushl $205
801063e5:	68 cd 00 00 00       	push   $0xcd
  jmp alltraps
801063ea:	e9 bb f2 ff ff       	jmp    801056aa <alltraps>

801063ef <vector206>:
.globl vector206
vector206:
  pushl $0
801063ef:	6a 00                	push   $0x0
  pushl $206
801063f1:	68 ce 00 00 00       	push   $0xce
  jmp alltraps
801063f6:	e9 af f2 ff ff       	jmp    801056aa <alltraps>

801063fb <vector207>:
.globl vector207
vector207:
  pushl $0
801063fb:	6a 00                	push   $0x0
  pushl $207
801063fd:	68 cf 00 00 00       	push   $0xcf
  jmp alltraps
80106402:	e9 a3 f2 ff ff       	jmp    801056aa <alltraps>

80106407 <vector208>:
.globl vector208
vector208:
  pushl $0
80106407:	6a 00                	push   $0x0
  pushl $208
80106409:	68 d0 00 00 00       	push   $0xd0
  jmp alltraps
8010640e:	e9 97 f2 ff ff       	jmp    801056aa <alltraps>

80106413 <vector209>:
.globl vector209
vector209:
  pushl $0
80106413:	6a 00                	push   $0x0
  pushl $209
80106415:	68 d1 00 00 00       	push   $0xd1
  jmp alltraps
8010641a:	e9 8b f2 ff ff       	jmp    801056aa <alltraps>

8010641f <vector210>:
.globl vector210
vector210:
  pushl $0
8010641f:	6a 00                	push   $0x0
  pushl $210
80106421:	68 d2 00 00 00       	push   $0xd2
  jmp alltraps
80106426:	e9 7f f2 ff ff       	jmp    801056aa <alltraps>

8010642b <vector211>:
.globl vector211
vector211:
  pushl $0
8010642b:	6a 00                	push   $0x0
  pushl $211
8010642d:	68 d3 00 00 00       	push   $0xd3
  jmp alltraps
80106432:	e9 73 f2 ff ff       	jmp    801056aa <alltraps>

80106437 <vector212>:
.globl vector212
vector212:
  pushl $0
80106437:	6a 00                	push   $0x0
  pushl $212
80106439:	68 d4 00 00 00       	push   $0xd4
  jmp alltraps
8010643e:	e9 67 f2 ff ff       	jmp    801056aa <alltraps>

80106443 <vector213>:
.globl vector213
vector213:
  pushl $0
80106443:	6a 00                	push   $0x0
  pushl $213
80106445:	68 d5 00 00 00       	push   $0xd5
  jmp alltraps
8010644a:	e9 5b f2 ff ff       	jmp    801056aa <alltraps>

8010644f <vector214>:
.globl vector214
vector214:
  pushl $0
8010644f:	6a 00                	push   $0x0
  pushl $214
80106451:	68 d6 00 00 00       	push   $0xd6
  jmp alltraps
80106456:	e9 4f f2 ff ff       	jmp    801056aa <alltraps>

8010645b <vector215>:
.globl vector215
vector215:
  pushl $0
8010645b:	6a 00                	push   $0x0
  pushl $215
8010645d:	68 d7 00 00 00       	push   $0xd7
  jmp alltraps
80106462:	e9 43 f2 ff ff       	jmp    801056aa <alltraps>

80106467 <vector216>:
.globl vector216
vector216:
  pushl $0
80106467:	6a 00                	push   $0x0
  pushl $216
80106469:	68 d8 00 00 00       	push   $0xd8
  jmp alltraps
8010646e:	e9 37 f2 ff ff       	jmp    801056aa <alltraps>

80106473 <vector217>:
.globl vector217
vector217:
  pushl $0
80106473:	6a 00                	push   $0x0
  pushl $217
80106475:	68 d9 00 00 00       	push   $0xd9
  jmp alltraps
8010647a:	e9 2b f2 ff ff       	jmp    801056aa <alltraps>

8010647f <vector218>:
.globl vector218
vector218:
  pushl $0
8010647f:	6a 00                	push   $0x0
  pushl $218
80106481:	68 da 00 00 00       	push   $0xda
  jmp alltraps
80106486:	e9 1f f2 ff ff       	jmp    801056aa <alltraps>

8010648b <vector219>:
.globl vector219
vector219:
  pushl $0
8010648b:	6a 00                	push   $0x0
  pushl $219
8010648d:	68 db 00 00 00       	push   $0xdb
  jmp alltraps
80106492:	e9 13 f2 ff ff       	jmp    801056aa <alltraps>

80106497 <vector220>:
.globl vector220
vector220:
  pushl $0
80106497:	6a 00                	push   $0x0
  pushl $220
80106499:	68 dc 00 00 00       	push   $0xdc
  jmp alltraps
8010649e:	e9 07 f2 ff ff       	jmp    801056aa <alltraps>

801064a3 <vector221>:
.globl vector221
vector221:
  pushl $0
801064a3:	6a 00                	push   $0x0
  pushl $221
801064a5:	68 dd 00 00 00       	push   $0xdd
  jmp alltraps
801064aa:	e9 fb f1 ff ff       	jmp    801056aa <alltraps>

801064af <vector222>:
.globl vector222
vector222:
  pushl $0
801064af:	6a 00                	push   $0x0
  pushl $222
801064b1:	68 de 00 00 00       	push   $0xde
  jmp alltraps
801064b6:	e9 ef f1 ff ff       	jmp    801056aa <alltraps>

801064bb <vector223>:
.globl vector223
vector223:
  pushl $0
801064bb:	6a 00                	push   $0x0
  pushl $223
801064bd:	68 df 00 00 00       	push   $0xdf
  jmp alltraps
801064c2:	e9 e3 f1 ff ff       	jmp    801056aa <alltraps>

801064c7 <vector224>:
.globl vector224
vector224:
  pushl $0
801064c7:	6a 00                	push   $0x0
  pushl $224
801064c9:	68 e0 00 00 00       	push   $0xe0
  jmp alltraps
801064ce:	e9 d7 f1 ff ff       	jmp    801056aa <alltraps>

801064d3 <vector225>:
.globl vector225
vector225:
  pushl $0
801064d3:	6a 00                	push   $0x0
  pushl $225
801064d5:	68 e1 00 00 00       	push   $0xe1
  jmp alltraps
801064da:	e9 cb f1 ff ff       	jmp    801056aa <alltraps>

801064df <vector226>:
.globl vector226
vector226:
  pushl $0
801064df:	6a 00                	push   $0x0
  pushl $226
801064e1:	68 e2 00 00 00       	push   $0xe2
  jmp alltraps
801064e6:	e9 bf f1 ff ff       	jmp    801056aa <alltraps>

801064eb <vector227>:
.globl vector227
vector227:
  pushl $0
801064eb:	6a 00                	push   $0x0
  pushl $227
801064ed:	68 e3 00 00 00       	push   $0xe3
  jmp alltraps
801064f2:	e9 b3 f1 ff ff       	jmp    801056aa <alltraps>

801064f7 <vector228>:
.globl vector228
vector228:
  pushl $0
801064f7:	6a 00                	push   $0x0
  pushl $228
801064f9:	68 e4 00 00 00       	push   $0xe4
  jmp alltraps
801064fe:	e9 a7 f1 ff ff       	jmp    801056aa <alltraps>

80106503 <vector229>:
.globl vector229
vector229:
  pushl $0
80106503:	6a 00                	push   $0x0
  pushl $229
80106505:	68 e5 00 00 00       	push   $0xe5
  jmp alltraps
8010650a:	e9 9b f1 ff ff       	jmp    801056aa <alltraps>

8010650f <vector230>:
.globl vector230
vector230:
  pushl $0
8010650f:	6a 00                	push   $0x0
  pushl $230
80106511:	68 e6 00 00 00       	push   $0xe6
  jmp alltraps
80106516:	e9 8f f1 ff ff       	jmp    801056aa <alltraps>

8010651b <vector231>:
.globl vector231
vector231:
  pushl $0
8010651b:	6a 00                	push   $0x0
  pushl $231
8010651d:	68 e7 00 00 00       	push   $0xe7
  jmp alltraps
80106522:	e9 83 f1 ff ff       	jmp    801056aa <alltraps>

80106527 <vector232>:
.globl vector232
vector232:
  pushl $0
80106527:	6a 00                	push   $0x0
  pushl $232
80106529:	68 e8 00 00 00       	push   $0xe8
  jmp alltraps
8010652e:	e9 77 f1 ff ff       	jmp    801056aa <alltraps>

80106533 <vector233>:
.globl vector233
vector233:
  pushl $0
80106533:	6a 00                	push   $0x0
  pushl $233
80106535:	68 e9 00 00 00       	push   $0xe9
  jmp alltraps
8010653a:	e9 6b f1 ff ff       	jmp    801056aa <alltraps>

8010653f <vector234>:
.globl vector234
vector234:
  pushl $0
8010653f:	6a 00                	push   $0x0
  pushl $234
80106541:	68 ea 00 00 00       	push   $0xea
  jmp alltraps
80106546:	e9 5f f1 ff ff       	jmp    801056aa <alltraps>

8010654b <vector235>:
.globl vector235
vector235:
  pushl $0
8010654b:	6a 00                	push   $0x0
  pushl $235
8010654d:	68 eb 00 00 00       	push   $0xeb
  jmp alltraps
80106552:	e9 53 f1 ff ff       	jmp    801056aa <alltraps>

80106557 <vector236>:
.globl vector236
vector236:
  pushl $0
80106557:	6a 00                	push   $0x0
  pushl $236
80106559:	68 ec 00 00 00       	push   $0xec
  jmp alltraps
8010655e:	e9 47 f1 ff ff       	jmp    801056aa <alltraps>

80106563 <vector237>:
.globl vector237
vector237:
  pushl $0
80106563:	6a 00                	push   $0x0
  pushl $237
80106565:	68 ed 00 00 00       	push   $0xed
  jmp alltraps
8010656a:	e9 3b f1 ff ff       	jmp    801056aa <alltraps>

8010656f <vector238>:
.globl vector238
vector238:
  pushl $0
8010656f:	6a 00                	push   $0x0
  pushl $238
80106571:	68 ee 00 00 00       	push   $0xee
  jmp alltraps
80106576:	e9 2f f1 ff ff       	jmp    801056aa <alltraps>

8010657b <vector239>:
.globl vector239
vector239:
  pushl $0
8010657b:	6a 00                	push   $0x0
  pushl $239
8010657d:	68 ef 00 00 00       	push   $0xef
  jmp alltraps
80106582:	e9 23 f1 ff ff       	jmp    801056aa <alltraps>

80106587 <vector240>:
.globl vector240
vector240:
  pushl $0
80106587:	6a 00                	push   $0x0
  pushl $240
80106589:	68 f0 00 00 00       	push   $0xf0
  jmp alltraps
8010658e:	e9 17 f1 ff ff       	jmp    801056aa <alltraps>

80106593 <vector241>:
.globl vector241
vector241:
  pushl $0
80106593:	6a 00                	push   $0x0
  pushl $241
80106595:	68 f1 00 00 00       	push   $0xf1
  jmp alltraps
8010659a:	e9 0b f1 ff ff       	jmp    801056aa <alltraps>

8010659f <vector242>:
.globl vector242
vector242:
  pushl $0
8010659f:	6a 00                	push   $0x0
  pushl $242
801065a1:	68 f2 00 00 00       	push   $0xf2
  jmp alltraps
801065a6:	e9 ff f0 ff ff       	jmp    801056aa <alltraps>

801065ab <vector243>:
.globl vector243
vector243:
  pushl $0
801065ab:	6a 00                	push   $0x0
  pushl $243
801065ad:	68 f3 00 00 00       	push   $0xf3
  jmp alltraps
801065b2:	e9 f3 f0 ff ff       	jmp    801056aa <alltraps>

801065b7 <vector244>:
.globl vector244
vector244:
  pushl $0
801065b7:	6a 00                	push   $0x0
  pushl $244
801065b9:	68 f4 00 00 00       	push   $0xf4
  jmp alltraps
801065be:	e9 e7 f0 ff ff       	jmp    801056aa <alltraps>

801065c3 <vector245>:
.globl vector245
vector245:
  pushl $0
801065c3:	6a 00                	push   $0x0
  pushl $245
801065c5:	68 f5 00 00 00       	push   $0xf5
  jmp alltraps
801065ca:	e9 db f0 ff ff       	jmp    801056aa <alltraps>

801065cf <vector246>:
.globl vector246
vector246:
  pushl $0
801065cf:	6a 00                	push   $0x0
  pushl $246
801065d1:	68 f6 00 00 00       	push   $0xf6
  jmp alltraps
801065d6:	e9 cf f0 ff ff       	jmp    801056aa <alltraps>

801065db <vector247>:
.globl vector247
vector247:
  pushl $0
801065db:	6a 00                	push   $0x0
  pushl $247
801065dd:	68 f7 00 00 00       	push   $0xf7
  jmp alltraps
801065e2:	e9 c3 f0 ff ff       	jmp    801056aa <alltraps>

801065e7 <vector248>:
.globl vector248
vector248:
  pushl $0
801065e7:	6a 00                	push   $0x0
  pushl $248
801065e9:	68 f8 00 00 00       	push   $0xf8
  jmp alltraps
801065ee:	e9 b7 f0 ff ff       	jmp    801056aa <alltraps>

801065f3 <vector249>:
.globl vector249
vector249:
  pushl $0
801065f3:	6a 00                	push   $0x0
  pushl $249
801065f5:	68 f9 00 00 00       	push   $0xf9
  jmp alltraps
801065fa:	e9 ab f0 ff ff       	jmp    801056aa <alltraps>

801065ff <vector250>:
.globl vector250
vector250:
  pushl $0
801065ff:	6a 00                	push   $0x0
  pushl $250
80106601:	68 fa 00 00 00       	push   $0xfa
  jmp alltraps
80106606:	e9 9f f0 ff ff       	jmp    801056aa <alltraps>

8010660b <vector251>:
.globl vector251
vector251:
  pushl $0
8010660b:	6a 00                	push   $0x0
  pushl $251
8010660d:	68 fb 00 00 00       	push   $0xfb
  jmp alltraps
80106612:	e9 93 f0 ff ff       	jmp    801056aa <alltraps>

80106617 <vector252>:
.globl vector252
vector252:
  pushl $0
80106617:	6a 00                	push   $0x0
  pushl $252
80106619:	68 fc 00 00 00       	push   $0xfc
  jmp alltraps
8010661e:	e9 87 f0 ff ff       	jmp    801056aa <alltraps>

80106623 <vector253>:
.globl vector253
vector253:
  pushl $0
80106623:	6a 00                	push   $0x0
  pushl $253
80106625:	68 fd 00 00 00       	push   $0xfd
  jmp alltraps
8010662a:	e9 7b f0 ff ff       	jmp    801056aa <alltraps>

8010662f <vector254>:
.globl vector254
vector254:
  pushl $0
8010662f:	6a 00                	push   $0x0
  pushl $254
80106631:	68 fe 00 00 00       	push   $0xfe
  jmp alltraps
80106636:	e9 6f f0 ff ff       	jmp    801056aa <alltraps>

8010663b <vector255>:
.globl vector255
vector255:
  pushl $0
8010663b:	6a 00                	push   $0x0
  pushl $255
8010663d:	68 ff 00 00 00       	push   $0xff
  jmp alltraps
80106642:	e9 63 f0 ff ff       	jmp    801056aa <alltraps>
80106647:	66 90                	xchg   %ax,%ax
80106649:	66 90                	xchg   %ax,%ax
8010664b:	66 90                	xchg   %ax,%ax
8010664d:	66 90                	xchg   %ax,%ax
8010664f:	90                   	nop

80106650 <walkpgdir>:
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
80106650:	55                   	push   %ebp
80106651:	89 e5                	mov    %esp,%ebp
80106653:	57                   	push   %edi
80106654:	56                   	push   %esi
80106655:	53                   	push   %ebx
80106656:	89 d3                	mov    %edx,%ebx
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
80106658:	c1 ea 16             	shr    $0x16,%edx
8010665b:	8d 3c 90             	lea    (%eax,%edx,4),%edi
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
8010665e:	83 ec 0c             	sub    $0xc,%esp
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
80106661:	8b 07                	mov    (%edi),%eax
80106663:	a8 01                	test   $0x1,%al
80106665:	74 29                	je     80106690 <walkpgdir+0x40>
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
80106667:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010666c:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
}
80106672:	8d 65 f4             	lea    -0xc(%ebp),%esp
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
80106675:	c1 eb 0a             	shr    $0xa,%ebx
80106678:	81 e3 fc 0f 00 00    	and    $0xffc,%ebx
8010667e:	8d 04 1e             	lea    (%esi,%ebx,1),%eax
}
80106681:	5b                   	pop    %ebx
80106682:	5e                   	pop    %esi
80106683:	5f                   	pop    %edi
80106684:	5d                   	pop    %ebp
80106685:	c3                   	ret    
80106686:	8d 76 00             	lea    0x0(%esi),%esi
80106689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
80106690:	85 c9                	test   %ecx,%ecx
80106692:	74 2c                	je     801066c0 <walkpgdir+0x70>
80106694:	e8 17 be ff ff       	call   801024b0 <kalloc>
80106699:	85 c0                	test   %eax,%eax
8010669b:	89 c6                	mov    %eax,%esi
8010669d:	74 21                	je     801066c0 <walkpgdir+0x70>
      return 0;
    // Make sure all those PTE_P bits are zero.
    memset(pgtab, 0, PGSIZE);
8010669f:	83 ec 04             	sub    $0x4,%esp
801066a2:	68 00 10 00 00       	push   $0x1000
801066a7:	6a 00                	push   $0x0
801066a9:	50                   	push   %eax
801066aa:	e8 81 dd ff ff       	call   80104430 <memset>
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
801066af:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
801066b5:	83 c4 10             	add    $0x10,%esp
801066b8:	83 c8 07             	or     $0x7,%eax
801066bb:	89 07                	mov    %eax,(%edi)
801066bd:	eb b3                	jmp    80106672 <walkpgdir+0x22>
801066bf:	90                   	nop
  }
  return &pgtab[PTX(va)];
}
801066c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
      return 0;
801066c3:	31 c0                	xor    %eax,%eax
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
}
801066c5:	5b                   	pop    %ebx
801066c6:	5e                   	pop    %esi
801066c7:	5f                   	pop    %edi
801066c8:	5d                   	pop    %ebp
801066c9:	c3                   	ret    
801066ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801066d0 <deallocuvm.part.0>:
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
801066d0:	55                   	push   %ebp
801066d1:	89 e5                	mov    %esp,%ebp
801066d3:	57                   	push   %edi
801066d4:	56                   	push   %esi
801066d5:	53                   	push   %ebx
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
801066d6:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
801066dc:	89 c7                	mov    %eax,%edi
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
801066de:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
801066e4:	83 ec 1c             	sub    $0x1c,%esp
801066e7:	89 4d e0             	mov    %ecx,-0x20(%ebp)

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
801066ea:	39 d3                	cmp    %edx,%ebx
801066ec:	73 66                	jae    80106754 <deallocuvm.part.0+0x84>
801066ee:	89 d6                	mov    %edx,%esi
801066f0:	eb 3d                	jmp    8010672f <deallocuvm.part.0+0x5f>
801066f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    pte = walkpgdir(pgdir, (char*)a, 0);
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
801066f8:	8b 10                	mov    (%eax),%edx
801066fa:	f6 c2 01             	test   $0x1,%dl
801066fd:	74 26                	je     80106725 <deallocuvm.part.0+0x55>
      pa = PTE_ADDR(*pte);
      if(pa == 0)
801066ff:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80106705:	74 58                	je     8010675f <deallocuvm.part.0+0x8f>
        panic("kfree");
      char *v = P2V(pa);
      kfree(v);
80106707:	83 ec 0c             	sub    $0xc,%esp
8010670a:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80106710:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106713:	52                   	push   %edx
80106714:	e8 e7 bb ff ff       	call   80102300 <kfree>
      *pte = 0;
80106719:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010671c:	83 c4 10             	add    $0x10,%esp
8010671f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
80106725:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010672b:	39 f3                	cmp    %esi,%ebx
8010672d:	73 25                	jae    80106754 <deallocuvm.part.0+0x84>
    pte = walkpgdir(pgdir, (char*)a, 0);
8010672f:	31 c9                	xor    %ecx,%ecx
80106731:	89 da                	mov    %ebx,%edx
80106733:	89 f8                	mov    %edi,%eax
80106735:	e8 16 ff ff ff       	call   80106650 <walkpgdir>
    if(!pte)
8010673a:	85 c0                	test   %eax,%eax
8010673c:	75 ba                	jne    801066f8 <deallocuvm.part.0+0x28>
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
8010673e:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
80106744:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
8010674a:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106750:	39 f3                	cmp    %esi,%ebx
80106752:	72 db                	jb     8010672f <deallocuvm.part.0+0x5f>
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
}
80106754:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106757:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010675a:	5b                   	pop    %ebx
8010675b:	5e                   	pop    %esi
8010675c:	5f                   	pop    %edi
8010675d:	5d                   	pop    %ebp
8010675e:	c3                   	ret    
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
      pa = PTE_ADDR(*pte);
      if(pa == 0)
        panic("kfree");
8010675f:	83 ec 0c             	sub    $0xc,%esp
80106762:	68 46 73 10 80       	push   $0x80107346
80106767:	e8 04 9c ff ff       	call   80100370 <panic>
8010676c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106770 <seginit>:

// Set up CPU's kernel segment descriptors.
// Run once on entry on each CPU.
void
seginit(void)
{
80106770:	55                   	push   %ebp
80106771:	89 e5                	mov    %esp,%ebp
80106773:	83 ec 18             	sub    $0x18,%esp

  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpuid()];
80106776:	e8 05 d0 ff ff       	call   80103780 <cpuid>
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
8010677b:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
80106781:	31 c9                	xor    %ecx,%ecx
80106783:	ba ff ff ff ff       	mov    $0xffffffff,%edx
80106788:	66 89 90 f8 27 11 80 	mov    %dx,-0x7feed808(%eax)
8010678f:	66 89 88 fa 27 11 80 	mov    %cx,-0x7feed806(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106796:	ba ff ff ff ff       	mov    $0xffffffff,%edx
8010679b:	31 c9                	xor    %ecx,%ecx
8010679d:	66 89 90 00 28 11 80 	mov    %dx,-0x7feed800(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
801067a4:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpuid()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
801067a9:	66 89 88 02 28 11 80 	mov    %cx,-0x7feed7fe(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
801067b0:	31 c9                	xor    %ecx,%ecx
801067b2:	66 89 90 08 28 11 80 	mov    %dx,-0x7feed7f8(%eax)
801067b9:	66 89 88 0a 28 11 80 	mov    %cx,-0x7feed7f6(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
801067c0:	ba ff ff ff ff       	mov    $0xffffffff,%edx
801067c5:	31 c9                	xor    %ecx,%ecx
801067c7:	66 89 90 10 28 11 80 	mov    %dx,-0x7feed7f0(%eax)
  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpuid()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
801067ce:	c6 80 fc 27 11 80 00 	movb   $0x0,-0x7feed804(%eax)
static inline void
lgdt(struct segdesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
801067d5:	ba 2f 00 00 00       	mov    $0x2f,%edx
801067da:	c6 80 fd 27 11 80 9a 	movb   $0x9a,-0x7feed803(%eax)
801067e1:	c6 80 fe 27 11 80 cf 	movb   $0xcf,-0x7feed802(%eax)
801067e8:	c6 80 ff 27 11 80 00 	movb   $0x0,-0x7feed801(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
801067ef:	c6 80 04 28 11 80 00 	movb   $0x0,-0x7feed7fc(%eax)
801067f6:	c6 80 05 28 11 80 92 	movb   $0x92,-0x7feed7fb(%eax)
801067fd:	c6 80 06 28 11 80 cf 	movb   $0xcf,-0x7feed7fa(%eax)
80106804:	c6 80 07 28 11 80 00 	movb   $0x0,-0x7feed7f9(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
8010680b:	c6 80 0c 28 11 80 00 	movb   $0x0,-0x7feed7f4(%eax)
80106812:	c6 80 0d 28 11 80 fa 	movb   $0xfa,-0x7feed7f3(%eax)
80106819:	c6 80 0e 28 11 80 cf 	movb   $0xcf,-0x7feed7f2(%eax)
80106820:	c6 80 0f 28 11 80 00 	movb   $0x0,-0x7feed7f1(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106827:	66 89 88 12 28 11 80 	mov    %cx,-0x7feed7ee(%eax)
8010682e:	c6 80 14 28 11 80 00 	movb   $0x0,-0x7feed7ec(%eax)
80106835:	c6 80 15 28 11 80 f2 	movb   $0xf2,-0x7feed7eb(%eax)
8010683c:	c6 80 16 28 11 80 cf 	movb   $0xcf,-0x7feed7ea(%eax)
80106843:	c6 80 17 28 11 80 00 	movb   $0x0,-0x7feed7e9(%eax)
  lgdt(c->gdt, sizeof(c->gdt));
8010684a:	05 f0 27 11 80       	add    $0x801127f0,%eax
8010684f:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  pd[1] = (uint)p;
80106853:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  pd[2] = (uint)p >> 16;
80106857:	c1 e8 10             	shr    $0x10,%eax
8010685a:	66 89 45 f6          	mov    %ax,-0xa(%ebp)

  asm volatile("lgdt (%0)" : : "r" (pd));
8010685e:	8d 45 f2             	lea    -0xe(%ebp),%eax
80106861:	0f 01 10             	lgdtl  (%eax)
}
80106864:	c9                   	leave  
80106865:	c3                   	ret    
80106866:	8d 76 00             	lea    0x0(%esi),%esi
80106869:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106870 <mappages>:
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
80106870:	55                   	push   %ebp
80106871:	89 e5                	mov    %esp,%ebp
80106873:	57                   	push   %edi
80106874:	56                   	push   %esi
80106875:	53                   	push   %ebx
80106876:	83 ec 1c             	sub    $0x1c,%esp
80106879:	8b 45 0c             	mov    0xc(%ebp),%eax
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
8010687c:	8b 55 10             	mov    0x10(%ebp),%edx
8010687f:	8b 7d 14             	mov    0x14(%ebp),%edi
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
80106882:	89 c3                	mov    %eax,%ebx
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80106884:	8d 44 10 ff          	lea    -0x1(%eax,%edx,1),%eax
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
80106888:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
8010688e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106893:	29 df                	sub    %ebx,%edi
80106895:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
80106898:	8b 45 18             	mov    0x18(%ebp),%eax
8010689b:	83 c8 01             	or     $0x1,%eax
8010689e:	89 45 e0             	mov    %eax,-0x20(%ebp)
801068a1:	eb 1a                	jmp    801068bd <mappages+0x4d>
801068a3:	90                   	nop
801068a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
801068a8:	f6 00 01             	testb  $0x1,(%eax)
801068ab:	75 3d                	jne    801068ea <mappages+0x7a>
      panic("remap");
    *pte = pa | perm | PTE_P;
801068ad:	0b 75 e0             	or     -0x20(%ebp),%esi
    if(a == last)
801068b0:	3b 5d e4             	cmp    -0x1c(%ebp),%ebx
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
801068b3:	89 30                	mov    %esi,(%eax)
    if(a == last)
801068b5:	74 29                	je     801068e0 <mappages+0x70>
      break;
    a += PGSIZE;
801068b7:	81 c3 00 10 00 00    	add    $0x1000,%ebx
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
801068bd:	8b 45 08             	mov    0x8(%ebp),%eax
801068c0:	b9 01 00 00 00       	mov    $0x1,%ecx
801068c5:	89 da                	mov    %ebx,%edx
801068c7:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
801068ca:	e8 81 fd ff ff       	call   80106650 <walkpgdir>
801068cf:	85 c0                	test   %eax,%eax
801068d1:	75 d5                	jne    801068a8 <mappages+0x38>
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
}
801068d3:	8d 65 f4             	lea    -0xc(%ebp),%esp

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
801068d6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
}
801068db:	5b                   	pop    %ebx
801068dc:	5e                   	pop    %esi
801068dd:	5f                   	pop    %edi
801068de:	5d                   	pop    %ebp
801068df:	c3                   	ret    
801068e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    if(a == last)
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
801068e3:	31 c0                	xor    %eax,%eax
}
801068e5:	5b                   	pop    %ebx
801068e6:	5e                   	pop    %esi
801068e7:	5f                   	pop    %edi
801068e8:	5d                   	pop    %ebp
801068e9:	c3                   	ret    
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
801068ea:	83 ec 0c             	sub    $0xc,%esp
801068ed:	68 f8 79 10 80       	push   $0x801079f8
801068f2:	e8 79 9a ff ff       	call   80100370 <panic>
801068f7:	89 f6                	mov    %esi,%esi
801068f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106900 <switchkvm>:
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106900:	a1 a4 55 11 80       	mov    0x801155a4,%eax

// Switch h/w page table register to the kernel-only page table,
// for when no process is running.
void
switchkvm(void)
{
80106905:	55                   	push   %ebp
80106906:	89 e5                	mov    %esp,%ebp
80106908:	05 00 00 00 80       	add    $0x80000000,%eax
8010690d:	0f 22 d8             	mov    %eax,%cr3
  lcr3(V2P(kpgdir));   // switch to the kernel page table
}
80106910:	5d                   	pop    %ebp
80106911:	c3                   	ret    
80106912:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106919:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106920 <switchuvm>:

// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
80106920:	55                   	push   %ebp
80106921:	89 e5                	mov    %esp,%ebp
80106923:	57                   	push   %edi
80106924:	56                   	push   %esi
80106925:	53                   	push   %ebx
80106926:	83 ec 1c             	sub    $0x1c,%esp
80106929:	8b 75 08             	mov    0x8(%ebp),%esi
  if(p == 0)
8010692c:	85 f6                	test   %esi,%esi
8010692e:	0f 84 cd 00 00 00    	je     80106a01 <switchuvm+0xe1>
    panic("switchuvm: no process");
  if(p->kstack == 0)
80106934:	8b 46 08             	mov    0x8(%esi),%eax
80106937:	85 c0                	test   %eax,%eax
80106939:	0f 84 dc 00 00 00    	je     80106a1b <switchuvm+0xfb>
    panic("switchuvm: no kstack");
  if(p->pgdir == 0)
8010693f:	8b 7e 04             	mov    0x4(%esi),%edi
80106942:	85 ff                	test   %edi,%edi
80106944:	0f 84 c4 00 00 00    	je     80106a0e <switchuvm+0xee>
    panic("switchuvm: no pgdir");

  pushcli();
8010694a:	e8 31 d9 ff ff       	call   80104280 <pushcli>
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
8010694f:	e8 ac cd ff ff       	call   80103700 <mycpu>
80106954:	89 c3                	mov    %eax,%ebx
80106956:	e8 a5 cd ff ff       	call   80103700 <mycpu>
8010695b:	89 c7                	mov    %eax,%edi
8010695d:	e8 9e cd ff ff       	call   80103700 <mycpu>
80106962:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106965:	83 c7 08             	add    $0x8,%edi
80106968:	e8 93 cd ff ff       	call   80103700 <mycpu>
8010696d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106970:	83 c0 08             	add    $0x8,%eax
80106973:	ba 67 00 00 00       	mov    $0x67,%edx
80106978:	c1 e8 18             	shr    $0x18,%eax
8010697b:	66 89 93 98 00 00 00 	mov    %dx,0x98(%ebx)
80106982:	66 89 bb 9a 00 00 00 	mov    %di,0x9a(%ebx)
80106989:	c6 83 9d 00 00 00 99 	movb   $0x99,0x9d(%ebx)
80106990:	c6 83 9e 00 00 00 40 	movb   $0x40,0x9e(%ebx)
80106997:	83 c1 08             	add    $0x8,%ecx
8010699a:	88 83 9f 00 00 00    	mov    %al,0x9f(%ebx)
801069a0:	c1 e9 10             	shr    $0x10,%ecx
801069a3:	88 8b 9c 00 00 00    	mov    %cl,0x9c(%ebx)
  mycpu()->gdt[SEG_TSS].s = 0;
  mycpu()->ts.ss0 = SEG_KDATA << 3;
  mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  mycpu()->ts.iomb = (ushort) 0xFFFF;
801069a9:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
    panic("switchuvm: no pgdir");

  pushcli();
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
                                sizeof(mycpu()->ts)-1, 0);
  mycpu()->gdt[SEG_TSS].s = 0;
801069ae:	e8 4d cd ff ff       	call   80103700 <mycpu>
801069b3:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
  mycpu()->ts.ss0 = SEG_KDATA << 3;
801069ba:	e8 41 cd ff ff       	call   80103700 <mycpu>
801069bf:	b9 10 00 00 00       	mov    $0x10,%ecx
801069c4:	66 89 48 10          	mov    %cx,0x10(%eax)
  mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
801069c8:	e8 33 cd ff ff       	call   80103700 <mycpu>
801069cd:	8b 56 08             	mov    0x8(%esi),%edx
801069d0:	8d 8a 00 10 00 00    	lea    0x1000(%edx),%ecx
801069d6:	89 48 0c             	mov    %ecx,0xc(%eax)
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  mycpu()->ts.iomb = (ushort) 0xFFFF;
801069d9:	e8 22 cd ff ff       	call   80103700 <mycpu>
801069de:	66 89 58 6e          	mov    %bx,0x6e(%eax)
}

static inline void
ltr(ushort sel)
{
  asm volatile("ltr %0" : : "r" (sel));
801069e2:	b8 28 00 00 00       	mov    $0x28,%eax
801069e7:	0f 00 d8             	ltr    %ax
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
801069ea:	8b 46 04             	mov    0x4(%esi),%eax
801069ed:	05 00 00 00 80       	add    $0x80000000,%eax
801069f2:	0f 22 d8             	mov    %eax,%cr3
  ltr(SEG_TSS << 3);
  lcr3(V2P(p->pgdir));  // switch to process's address space
  popcli();
}
801069f5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801069f8:	5b                   	pop    %ebx
801069f9:	5e                   	pop    %esi
801069fa:	5f                   	pop    %edi
801069fb:	5d                   	pop    %ebp
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  mycpu()->ts.iomb = (ushort) 0xFFFF;
  ltr(SEG_TSS << 3);
  lcr3(V2P(p->pgdir));  // switch to process's address space
  popcli();
801069fc:	e9 6f d9 ff ff       	jmp    80104370 <popcli>
// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
  if(p == 0)
    panic("switchuvm: no process");
80106a01:	83 ec 0c             	sub    $0xc,%esp
80106a04:	68 fe 79 10 80       	push   $0x801079fe
80106a09:	e8 62 99 ff ff       	call   80100370 <panic>
  if(p->kstack == 0)
    panic("switchuvm: no kstack");
  if(p->pgdir == 0)
    panic("switchuvm: no pgdir");
80106a0e:	83 ec 0c             	sub    $0xc,%esp
80106a11:	68 29 7a 10 80       	push   $0x80107a29
80106a16:	e8 55 99 ff ff       	call   80100370 <panic>
switchuvm(struct proc *p)
{
  if(p == 0)
    panic("switchuvm: no process");
  if(p->kstack == 0)
    panic("switchuvm: no kstack");
80106a1b:	83 ec 0c             	sub    $0xc,%esp
80106a1e:	68 14 7a 10 80       	push   $0x80107a14
80106a23:	e8 48 99 ff ff       	call   80100370 <panic>
80106a28:	90                   	nop
80106a29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106a30 <inituvm>:

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
80106a30:	55                   	push   %ebp
80106a31:	89 e5                	mov    %esp,%ebp
80106a33:	57                   	push   %edi
80106a34:	56                   	push   %esi
80106a35:	53                   	push   %ebx
80106a36:	83 ec 1c             	sub    $0x1c,%esp
80106a39:	8b 75 10             	mov    0x10(%ebp),%esi
80106a3c:	8b 55 08             	mov    0x8(%ebp),%edx
80106a3f:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *mem;

  if(sz >= PGSIZE)
80106a42:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106a48:	77 50                	ja     80106a9a <inituvm+0x6a>
80106a4a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    panic("inituvm: more than a page");
  mem = kalloc();
80106a4d:	e8 5e ba ff ff       	call   801024b0 <kalloc>
  memset(mem, 0, PGSIZE);
80106a52:	83 ec 04             	sub    $0x4,%esp
{
  char *mem;

  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();
80106a55:	89 c3                	mov    %eax,%ebx
  memset(mem, 0, PGSIZE);
80106a57:	68 00 10 00 00       	push   $0x1000
80106a5c:	6a 00                	push   $0x0
80106a5e:	50                   	push   %eax
80106a5f:	e8 cc d9 ff ff       	call   80104430 <memset>
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
80106a64:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80106a67:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106a6d:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
80106a74:	50                   	push   %eax
80106a75:	68 00 10 00 00       	push   $0x1000
80106a7a:	6a 00                	push   $0x0
80106a7c:	52                   	push   %edx
80106a7d:	e8 ee fd ff ff       	call   80106870 <mappages>
  memmove(mem, init, sz);
80106a82:	89 75 10             	mov    %esi,0x10(%ebp)
80106a85:	89 7d 0c             	mov    %edi,0xc(%ebp)
80106a88:	83 c4 20             	add    $0x20,%esp
80106a8b:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
80106a8e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106a91:	5b                   	pop    %ebx
80106a92:	5e                   	pop    %esi
80106a93:	5f                   	pop    %edi
80106a94:	5d                   	pop    %ebp
  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();
  memset(mem, 0, PGSIZE);
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
  memmove(mem, init, sz);
80106a95:	e9 46 da ff ff       	jmp    801044e0 <memmove>
inituvm(pde_t *pgdir, char *init, uint sz)
{
  char *mem;

  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
80106a9a:	83 ec 0c             	sub    $0xc,%esp
80106a9d:	68 3d 7a 10 80       	push   $0x80107a3d
80106aa2:	e8 c9 98 ff ff       	call   80100370 <panic>
80106aa7:	89 f6                	mov    %esi,%esi
80106aa9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106ab0 <loaduvm>:

// Load a program segment into pgdir.  addr must be page-aligned
// and the pages from addr to addr+sz must already be mapped.
int
loaduvm(pde_t *pgdir, char *addr, struct inode *ip, uint offset, uint sz)
{
80106ab0:	55                   	push   %ebp
80106ab1:	89 e5                	mov    %esp,%ebp
80106ab3:	57                   	push   %edi
80106ab4:	56                   	push   %esi
80106ab5:	53                   	push   %ebx
80106ab6:	83 ec 0c             	sub    $0xc,%esp
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
80106ab9:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
80106ac0:	0f 85 91 00 00 00    	jne    80106b57 <loaduvm+0xa7>
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
80106ac6:	8b 75 18             	mov    0x18(%ebp),%esi
80106ac9:	31 db                	xor    %ebx,%ebx
80106acb:	85 f6                	test   %esi,%esi
80106acd:	75 1a                	jne    80106ae9 <loaduvm+0x39>
80106acf:	eb 6f                	jmp    80106b40 <loaduvm+0x90>
80106ad1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106ad8:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106ade:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80106ae4:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80106ae7:	76 57                	jbe    80106b40 <loaduvm+0x90>
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
80106ae9:	8b 55 0c             	mov    0xc(%ebp),%edx
80106aec:	8b 45 08             	mov    0x8(%ebp),%eax
80106aef:	31 c9                	xor    %ecx,%ecx
80106af1:	01 da                	add    %ebx,%edx
80106af3:	e8 58 fb ff ff       	call   80106650 <walkpgdir>
80106af8:	85 c0                	test   %eax,%eax
80106afa:	74 4e                	je     80106b4a <loaduvm+0x9a>
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
80106afc:	8b 00                	mov    (%eax),%eax
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106afe:	8b 4d 14             	mov    0x14(%ebp),%ecx
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
    if(sz - i < PGSIZE)
80106b01:	bf 00 10 00 00       	mov    $0x1000,%edi
  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
80106b06:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    if(sz - i < PGSIZE)
80106b0b:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106b11:	0f 46 fe             	cmovbe %esi,%edi
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106b14:	01 d9                	add    %ebx,%ecx
80106b16:	05 00 00 00 80       	add    $0x80000000,%eax
80106b1b:	57                   	push   %edi
80106b1c:	51                   	push   %ecx
80106b1d:	50                   	push   %eax
80106b1e:	ff 75 10             	pushl  0x10(%ebp)
80106b21:	e8 4a ae ff ff       	call   80101970 <readi>
80106b26:	83 c4 10             	add    $0x10,%esp
80106b29:	39 c7                	cmp    %eax,%edi
80106b2b:	74 ab                	je     80106ad8 <loaduvm+0x28>
      return -1;
  }
  return 0;
}
80106b2d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
      return -1;
80106b30:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  return 0;
}
80106b35:	5b                   	pop    %ebx
80106b36:	5e                   	pop    %esi
80106b37:	5f                   	pop    %edi
80106b38:	5d                   	pop    %ebp
80106b39:	c3                   	ret    
80106b3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106b40:	8d 65 f4             	lea    -0xc(%ebp),%esp
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
      return -1;
  }
  return 0;
80106b43:	31 c0                	xor    %eax,%eax
}
80106b45:	5b                   	pop    %ebx
80106b46:	5e                   	pop    %esi
80106b47:	5f                   	pop    %edi
80106b48:	5d                   	pop    %ebp
80106b49:	c3                   	ret    

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
80106b4a:	83 ec 0c             	sub    $0xc,%esp
80106b4d:	68 57 7a 10 80       	push   $0x80107a57
80106b52:	e8 19 98 ff ff       	call   80100370 <panic>
{
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
80106b57:	83 ec 0c             	sub    $0xc,%esp
80106b5a:	68 f8 7a 10 80       	push   $0x80107af8
80106b5f:	e8 0c 98 ff ff       	call   80100370 <panic>
80106b64:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106b6a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106b70 <allocuvm>:

// Allocate page tables and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
int
allocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
80106b70:	55                   	push   %ebp
80106b71:	89 e5                	mov    %esp,%ebp
80106b73:	57                   	push   %edi
80106b74:	56                   	push   %esi
80106b75:	53                   	push   %ebx
80106b76:	83 ec 0c             	sub    $0xc,%esp
80106b79:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
80106b7c:	85 ff                	test   %edi,%edi
80106b7e:	0f 88 ca 00 00 00    	js     80106c4e <allocuvm+0xde>
    return 0;
  if(newsz < oldsz)
80106b84:	3b 7d 0c             	cmp    0xc(%ebp),%edi
    return oldsz;
80106b87:	8b 45 0c             	mov    0xc(%ebp),%eax
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
    return 0;
  if(newsz < oldsz)
80106b8a:	0f 82 84 00 00 00    	jb     80106c14 <allocuvm+0xa4>
    return oldsz;

  a = PGROUNDUP(oldsz);
80106b90:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80106b96:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a < newsz; a += PGSIZE){
80106b9c:	39 df                	cmp    %ebx,%edi
80106b9e:	77 45                	ja     80106be5 <allocuvm+0x75>
80106ba0:	e9 bb 00 00 00       	jmp    80106c60 <allocuvm+0xf0>
80106ba5:	8d 76 00             	lea    0x0(%esi),%esi
    if(mem == 0){
      cprintf("allocuvm out of memory\n");
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
    }
    memset(mem, 0, PGSIZE);
80106ba8:	83 ec 04             	sub    $0x4,%esp
80106bab:	68 00 10 00 00       	push   $0x1000
80106bb0:	6a 00                	push   $0x0
80106bb2:	50                   	push   %eax
80106bb3:	e8 78 d8 ff ff       	call   80104430 <memset>
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
80106bb8:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106bbe:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
80106bc5:	50                   	push   %eax
80106bc6:	68 00 10 00 00       	push   $0x1000
80106bcb:	53                   	push   %ebx
80106bcc:	ff 75 08             	pushl  0x8(%ebp)
80106bcf:	e8 9c fc ff ff       	call   80106870 <mappages>
80106bd4:	83 c4 20             	add    $0x20,%esp
80106bd7:	85 c0                	test   %eax,%eax
80106bd9:	78 45                	js     80106c20 <allocuvm+0xb0>
    return 0;
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
80106bdb:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106be1:	39 df                	cmp    %ebx,%edi
80106be3:	76 7b                	jbe    80106c60 <allocuvm+0xf0>
    mem = kalloc();
80106be5:	e8 c6 b8 ff ff       	call   801024b0 <kalloc>
    if(mem == 0){
80106bea:	85 c0                	test   %eax,%eax
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
    mem = kalloc();
80106bec:	89 c6                	mov    %eax,%esi
    if(mem == 0){
80106bee:	75 b8                	jne    80106ba8 <allocuvm+0x38>
      cprintf("allocuvm out of memory\n");
80106bf0:	83 ec 0c             	sub    $0xc,%esp
80106bf3:	68 75 7a 10 80       	push   $0x80107a75
80106bf8:	e8 63 9a ff ff       	call   80100660 <cprintf>
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80106bfd:	83 c4 10             	add    $0x10,%esp
80106c00:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106c03:	76 49                	jbe    80106c4e <allocuvm+0xde>
80106c05:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106c08:	8b 45 08             	mov    0x8(%ebp),%eax
80106c0b:	89 fa                	mov    %edi,%edx
80106c0d:	e8 be fa ff ff       	call   801066d0 <deallocuvm.part.0>
  for(; a < newsz; a += PGSIZE){
    mem = kalloc();
    if(mem == 0){
      cprintf("allocuvm out of memory\n");
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
80106c12:	31 c0                	xor    %eax,%eax
      kfree(mem);
      return 0;
    }
  }
  return newsz;
}
80106c14:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106c17:	5b                   	pop    %ebx
80106c18:	5e                   	pop    %esi
80106c19:	5f                   	pop    %edi
80106c1a:	5d                   	pop    %ebp
80106c1b:	c3                   	ret    
80106c1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
    }
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
80106c20:	83 ec 0c             	sub    $0xc,%esp
80106c23:	68 8d 7a 10 80       	push   $0x80107a8d
80106c28:	e8 33 9a ff ff       	call   80100660 <cprintf>
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80106c2d:	83 c4 10             	add    $0x10,%esp
80106c30:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106c33:	76 0d                	jbe    80106c42 <allocuvm+0xd2>
80106c35:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106c38:	8b 45 08             	mov    0x8(%ebp),%eax
80106c3b:	89 fa                	mov    %edi,%edx
80106c3d:	e8 8e fa ff ff       	call   801066d0 <deallocuvm.part.0>
    }
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
      deallocuvm(pgdir, newsz, oldsz);
      kfree(mem);
80106c42:	83 ec 0c             	sub    $0xc,%esp
80106c45:	56                   	push   %esi
80106c46:	e8 b5 b6 ff ff       	call   80102300 <kfree>
      return 0;
80106c4b:	83 c4 10             	add    $0x10,%esp
    }
  }
  return newsz;
}
80106c4e:	8d 65 f4             	lea    -0xc(%ebp),%esp
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
      deallocuvm(pgdir, newsz, oldsz);
      kfree(mem);
      return 0;
80106c51:	31 c0                	xor    %eax,%eax
    }
  }
  return newsz;
}
80106c53:	5b                   	pop    %ebx
80106c54:	5e                   	pop    %esi
80106c55:	5f                   	pop    %edi
80106c56:	5d                   	pop    %ebp
80106c57:	c3                   	ret    
80106c58:	90                   	nop
80106c59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106c60:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
80106c63:	89 f8                	mov    %edi,%eax
      kfree(mem);
      return 0;
    }
  }
  return newsz;
}
80106c65:	5b                   	pop    %ebx
80106c66:	5e                   	pop    %esi
80106c67:	5f                   	pop    %edi
80106c68:	5d                   	pop    %ebp
80106c69:	c3                   	ret    
80106c6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106c70 <deallocuvm>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
80106c70:	55                   	push   %ebp
80106c71:	89 e5                	mov    %esp,%ebp
80106c73:	8b 55 0c             	mov    0xc(%ebp),%edx
80106c76:	8b 4d 10             	mov    0x10(%ebp),%ecx
80106c79:	8b 45 08             	mov    0x8(%ebp),%eax
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80106c7c:	39 d1                	cmp    %edx,%ecx
80106c7e:	73 10                	jae    80106c90 <deallocuvm+0x20>
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
}
80106c80:	5d                   	pop    %ebp
80106c81:	e9 4a fa ff ff       	jmp    801066d0 <deallocuvm.part.0>
80106c86:	8d 76 00             	lea    0x0(%esi),%esi
80106c89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106c90:	89 d0                	mov    %edx,%eax
80106c92:	5d                   	pop    %ebp
80106c93:	c3                   	ret    
80106c94:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106c9a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106ca0 <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
80106ca0:	55                   	push   %ebp
80106ca1:	89 e5                	mov    %esp,%ebp
80106ca3:	57                   	push   %edi
80106ca4:	56                   	push   %esi
80106ca5:	53                   	push   %ebx
80106ca6:	83 ec 0c             	sub    $0xc,%esp
80106ca9:	8b 75 08             	mov    0x8(%ebp),%esi
  uint i;

  if(pgdir == 0)
80106cac:	85 f6                	test   %esi,%esi
80106cae:	74 59                	je     80106d09 <freevm+0x69>
80106cb0:	31 c9                	xor    %ecx,%ecx
80106cb2:	ba 00 00 00 80       	mov    $0x80000000,%edx
80106cb7:	89 f0                	mov    %esi,%eax
80106cb9:	e8 12 fa ff ff       	call   801066d0 <deallocuvm.part.0>
80106cbe:	89 f3                	mov    %esi,%ebx
80106cc0:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80106cc6:	eb 0f                	jmp    80106cd7 <freevm+0x37>
80106cc8:	90                   	nop
80106cc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106cd0:	83 c3 04             	add    $0x4,%ebx
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80106cd3:	39 fb                	cmp    %edi,%ebx
80106cd5:	74 23                	je     80106cfa <freevm+0x5a>
    if(pgdir[i] & PTE_P){
80106cd7:	8b 03                	mov    (%ebx),%eax
80106cd9:	a8 01                	test   $0x1,%al
80106cdb:	74 f3                	je     80106cd0 <freevm+0x30>
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
80106cdd:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106ce2:	83 ec 0c             	sub    $0xc,%esp
80106ce5:	83 c3 04             	add    $0x4,%ebx
80106ce8:	05 00 00 00 80       	add    $0x80000000,%eax
80106ced:	50                   	push   %eax
80106cee:	e8 0d b6 ff ff       	call   80102300 <kfree>
80106cf3:	83 c4 10             	add    $0x10,%esp
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80106cf6:	39 fb                	cmp    %edi,%ebx
80106cf8:	75 dd                	jne    80106cd7 <freevm+0x37>
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
80106cfa:	89 75 08             	mov    %esi,0x8(%ebp)
}
80106cfd:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106d00:	5b                   	pop    %ebx
80106d01:	5e                   	pop    %esi
80106d02:	5f                   	pop    %edi
80106d03:	5d                   	pop    %ebp
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
80106d04:	e9 f7 b5 ff ff       	jmp    80102300 <kfree>
freevm(pde_t *pgdir)
{
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
80106d09:	83 ec 0c             	sub    $0xc,%esp
80106d0c:	68 a9 7a 10 80       	push   $0x80107aa9
80106d11:	e8 5a 96 ff ff       	call   80100370 <panic>
80106d16:	8d 76 00             	lea    0x0(%esi),%esi
80106d19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106d20 <setupkvm>:
};

// Set up kernel part of a page table.
pde_t*
setupkvm(void)
{
80106d20:	55                   	push   %ebp
80106d21:	89 e5                	mov    %esp,%ebp
80106d23:	56                   	push   %esi
80106d24:	53                   	push   %ebx
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
80106d25:	e8 86 b7 ff ff       	call   801024b0 <kalloc>
80106d2a:	85 c0                	test   %eax,%eax
80106d2c:	74 6a                	je     80106d98 <setupkvm+0x78>
    return 0;
  memset(pgdir, 0, PGSIZE);
80106d2e:	83 ec 04             	sub    $0x4,%esp
80106d31:	89 c6                	mov    %eax,%esi
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106d33:	bb 20 a4 10 80       	mov    $0x8010a420,%ebx
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
80106d38:	68 00 10 00 00       	push   $0x1000
80106d3d:	6a 00                	push   $0x0
80106d3f:	50                   	push   %eax
80106d40:	e8 eb d6 ff ff       	call   80104430 <memset>
80106d45:	83 c4 10             	add    $0x10,%esp
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
80106d48:	8b 43 04             	mov    0x4(%ebx),%eax
80106d4b:	8b 53 08             	mov    0x8(%ebx),%edx
80106d4e:	83 ec 0c             	sub    $0xc,%esp
80106d51:	ff 73 0c             	pushl  0xc(%ebx)
80106d54:	29 c2                	sub    %eax,%edx
80106d56:	50                   	push   %eax
80106d57:	52                   	push   %edx
80106d58:	ff 33                	pushl  (%ebx)
80106d5a:	56                   	push   %esi
80106d5b:	e8 10 fb ff ff       	call   80106870 <mappages>
80106d60:	83 c4 20             	add    $0x20,%esp
80106d63:	85 c0                	test   %eax,%eax
80106d65:	78 19                	js     80106d80 <setupkvm+0x60>
  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106d67:	83 c3 10             	add    $0x10,%ebx
80106d6a:	81 fb 60 a4 10 80    	cmp    $0x8010a460,%ebx
80106d70:	75 d6                	jne    80106d48 <setupkvm+0x28>
80106d72:	89 f0                	mov    %esi,%eax
                (uint)k->phys_start, k->perm) < 0) {
      freevm(pgdir);
      return 0;
    }
  return pgdir;
}
80106d74:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106d77:	5b                   	pop    %ebx
80106d78:	5e                   	pop    %esi
80106d79:	5d                   	pop    %ebp
80106d7a:	c3                   	ret    
80106d7b:	90                   	nop
80106d7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
                (uint)k->phys_start, k->perm) < 0) {
      freevm(pgdir);
80106d80:	83 ec 0c             	sub    $0xc,%esp
80106d83:	56                   	push   %esi
80106d84:	e8 17 ff ff ff       	call   80106ca0 <freevm>
      return 0;
80106d89:	83 c4 10             	add    $0x10,%esp
    }
  return pgdir;
}
80106d8c:	8d 65 f8             	lea    -0x8(%ebp),%esp
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
                (uint)k->phys_start, k->perm) < 0) {
      freevm(pgdir);
      return 0;
80106d8f:	31 c0                	xor    %eax,%eax
    }
  return pgdir;
}
80106d91:	5b                   	pop    %ebx
80106d92:	5e                   	pop    %esi
80106d93:	5d                   	pop    %ebp
80106d94:	c3                   	ret    
80106d95:	8d 76 00             	lea    0x0(%esi),%esi
{
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
80106d98:	31 c0                	xor    %eax,%eax
80106d9a:	eb d8                	jmp    80106d74 <setupkvm+0x54>
80106d9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106da0 <kvmalloc>:

// Allocate one page table for the machine for the kernel address
// space for scheduler processes.
void
kvmalloc(void)
{
80106da0:	55                   	push   %ebp
80106da1:	89 e5                	mov    %esp,%ebp
80106da3:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
80106da6:	e8 75 ff ff ff       	call   80106d20 <setupkvm>
80106dab:	a3 a4 55 11 80       	mov    %eax,0x801155a4
80106db0:	05 00 00 00 80       	add    $0x80000000,%eax
80106db5:	0f 22 d8             	mov    %eax,%cr3
  switchkvm();
}
80106db8:	c9                   	leave  
80106db9:	c3                   	ret    
80106dba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106dc0 <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80106dc0:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106dc1:	31 c9                	xor    %ecx,%ecx

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80106dc3:	89 e5                	mov    %esp,%ebp
80106dc5:	83 ec 08             	sub    $0x8,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106dc8:	8b 55 0c             	mov    0xc(%ebp),%edx
80106dcb:	8b 45 08             	mov    0x8(%ebp),%eax
80106dce:	e8 7d f8 ff ff       	call   80106650 <walkpgdir>
  if(pte == 0)
80106dd3:	85 c0                	test   %eax,%eax
80106dd5:	74 05                	je     80106ddc <clearpteu+0x1c>
    panic("clearpteu");
  *pte &= ~PTE_U;
80106dd7:	83 20 fb             	andl   $0xfffffffb,(%eax)
}
80106dda:	c9                   	leave  
80106ddb:	c3                   	ret    
{
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
  if(pte == 0)
    panic("clearpteu");
80106ddc:	83 ec 0c             	sub    $0xc,%esp
80106ddf:	68 ba 7a 10 80       	push   $0x80107aba
80106de4:	e8 87 95 ff ff       	call   80100370 <panic>
80106de9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106df0 <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz, uint numPages)
{
80106df0:	55                   	push   %ebp
80106df1:	89 e5                	mov    %esp,%ebp
80106df3:	57                   	push   %edi
80106df4:	56                   	push   %esi
80106df5:	53                   	push   %ebx
80106df6:	83 ec 1c             	sub    $0x1c,%esp
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
80106df9:	e8 22 ff ff ff       	call   80106d20 <setupkvm>
80106dfe:	85 c0                	test   %eax,%eax
80106e00:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106e03:	0f 84 4b 01 00 00    	je     80106f54 <copyuvm+0x164>
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80106e09:	8b 5d 0c             	mov    0xc(%ebp),%ebx
80106e0c:	85 db                	test   %ebx,%ebx
80106e0e:	0f 84 a4 00 00 00    	je     80106eb8 <copyuvm+0xc8>
80106e14:	31 f6                	xor    %esi,%esi
80106e16:	eb 48                	jmp    80106e60 <copyuvm+0x70>
80106e18:	90                   	nop
80106e19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
80106e20:	83 ec 04             	sub    $0x4,%esp
80106e23:	81 c7 00 00 00 80    	add    $0x80000000,%edi
80106e29:	68 00 10 00 00       	push   $0x1000
80106e2e:	57                   	push   %edi
80106e2f:	50                   	push   %eax
80106e30:	e8 ab d6 ff ff       	call   801044e0 <memmove>
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0)
80106e35:	5a                   	pop    %edx
80106e36:	8d 93 00 00 00 80    	lea    -0x80000000(%ebx),%edx
80106e3c:	ff 75 e4             	pushl  -0x1c(%ebp)
80106e3f:	52                   	push   %edx
80106e40:	68 00 10 00 00       	push   $0x1000
80106e45:	56                   	push   %esi
80106e46:	ff 75 e0             	pushl  -0x20(%ebp)
80106e49:	e8 22 fa ff ff       	call   80106870 <mappages>
80106e4e:	83 c4 20             	add    $0x20,%esp
80106e51:	85 c0                	test   %eax,%eax
80106e53:	78 46                	js     80106e9b <copyuvm+0xab>
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80106e55:	81 c6 00 10 00 00    	add    $0x1000,%esi
80106e5b:	39 75 0c             	cmp    %esi,0xc(%ebp)
80106e5e:	76 58                	jbe    80106eb8 <copyuvm+0xc8>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
80106e60:	8b 45 08             	mov    0x8(%ebp),%eax
80106e63:	31 c9                	xor    %ecx,%ecx
80106e65:	89 f2                	mov    %esi,%edx
80106e67:	e8 e4 f7 ff ff       	call   80106650 <walkpgdir>
80106e6c:	85 c0                	test   %eax,%eax
80106e6e:	0f 84 f4 00 00 00    	je     80106f68 <copyuvm+0x178>
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
80106e74:	8b 18                	mov    (%eax),%ebx
80106e76:	f6 c3 01             	test   $0x1,%bl
80106e79:	0f 84 dc 00 00 00    	je     80106f5b <copyuvm+0x16b>
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80106e7f:	89 df                	mov    %ebx,%edi
    flags = PTE_FLAGS(*pte);
80106e81:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
80106e87:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80106e8a:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
80106e90:	e8 1b b6 ff ff       	call   801024b0 <kalloc>
80106e95:	85 c0                	test   %eax,%eax
80106e97:	89 c3                	mov    %eax,%ebx
80106e99:	75 85                	jne    80106e20 <copyuvm+0x30>
  }

  return d;

bad:
  freevm(d);
80106e9b:	83 ec 0c             	sub    $0xc,%esp
80106e9e:	ff 75 e0             	pushl  -0x20(%ebp)
80106ea1:	e8 fa fd ff ff       	call   80106ca0 <freevm>
  return 0;
80106ea6:	83 c4 10             	add    $0x10,%esp
80106ea9:	31 c0                	xor    %eax,%eax
}
80106eab:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106eae:	5b                   	pop    %ebx
80106eaf:	5e                   	pop    %esi
80106eb0:	5f                   	pop    %edi
80106eb1:	5d                   	pop    %ebp
80106eb2:	c3                   	ret    
80106eb3:	90                   	nop
80106eb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0)
      goto bad;
  }
 // uint temp = STACKBOTTOM - PGSIZE + 1;
  
 for(i = STACKBOTTOM - PGSIZE + 1; numPages > 0; i -= PGSIZE, numPages--){
80106eb8:	8b 4d 10             	mov    0x10(%ebp),%ecx
80106ebb:	85 c9                	test   %ecx,%ecx
80106ebd:	0f 84 86 00 00 00    	je     80106f49 <copyuvm+0x159>
80106ec3:	be 00 f0 ff 7f       	mov    $0x7ffff000,%esi
80106ec8:	eb 47                	jmp    80106f11 <copyuvm+0x121>
80106eca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
80106ed0:	83 ec 04             	sub    $0x4,%esp
80106ed3:	81 c7 00 00 00 80    	add    $0x80000000,%edi
80106ed9:	68 00 10 00 00       	push   $0x1000
80106ede:	57                   	push   %edi
80106edf:	50                   	push   %eax
80106ee0:	e8 fb d5 ff ff       	call   801044e0 <memmove>
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0)
80106ee5:	58                   	pop    %eax
80106ee6:	8d 93 00 00 00 80    	lea    -0x80000000(%ebx),%edx
80106eec:	ff 75 e4             	pushl  -0x1c(%ebp)
80106eef:	52                   	push   %edx
80106ef0:	68 00 10 00 00       	push   $0x1000
80106ef5:	56                   	push   %esi
80106ef6:	ff 75 e0             	pushl  -0x20(%ebp)
80106ef9:	e8 72 f9 ff ff       	call   80106870 <mappages>
80106efe:	83 c4 20             	add    $0x20,%esp
80106f01:	85 c0                	test   %eax,%eax
80106f03:	78 96                	js     80106e9b <copyuvm+0xab>
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0)
      goto bad;
  }
 // uint temp = STACKBOTTOM - PGSIZE + 1;
  
 for(i = STACKBOTTOM - PGSIZE + 1; numPages > 0; i -= PGSIZE, numPages--){
80106f05:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80106f0b:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
80106f0f:	74 38                	je     80106f49 <copyuvm+0x159>
   if((pte = walkpgdir(pgdir, (void *)i, 0)) == 0)
80106f11:	8b 45 08             	mov    0x8(%ebp),%eax
80106f14:	31 c9                	xor    %ecx,%ecx
80106f16:	89 f2                	mov    %esi,%edx
80106f18:	e8 33 f7 ff ff       	call   80106650 <walkpgdir>
80106f1d:	85 c0                	test   %eax,%eax
80106f1f:	74 47                	je     80106f68 <copyuvm+0x178>
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
80106f21:	8b 18                	mov    (%eax),%ebx
80106f23:	f6 c3 01             	test   $0x1,%bl
80106f26:	74 33                	je     80106f5b <copyuvm+0x16b>
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80106f28:	89 df                	mov    %ebx,%edi
    flags = PTE_FLAGS(*pte);
80106f2a:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
80106f30:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
 for(i = STACKBOTTOM - PGSIZE + 1; numPages > 0; i -= PGSIZE, numPages--){
   if((pte = walkpgdir(pgdir, (void *)i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80106f33:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
80106f39:	e8 72 b5 ff ff       	call   801024b0 <kalloc>
80106f3e:	85 c0                	test   %eax,%eax
80106f40:	89 c3                	mov    %eax,%ebx
80106f42:	75 8c                	jne    80106ed0 <copyuvm+0xe0>
80106f44:	e9 52 ff ff ff       	jmp    80106e9b <copyuvm+0xab>
80106f49:	8b 45 e0             	mov    -0x20(%ebp),%eax
  return d;

bad:
  freevm(d);
  return 0;
}
80106f4c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106f4f:	5b                   	pop    %ebx
80106f50:	5e                   	pop    %esi
80106f51:	5f                   	pop    %edi
80106f52:	5d                   	pop    %ebp
80106f53:	c3                   	ret    
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
80106f54:	31 c0                	xor    %eax,%eax
80106f56:	e9 50 ff ff ff       	jmp    80106eab <copyuvm+0xbb>
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
80106f5b:	83 ec 0c             	sub    $0xc,%esp
80106f5e:	68 de 7a 10 80       	push   $0x80107ade
80106f63:	e8 08 94 ff ff       	call   80100370 <panic>

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
80106f68:	83 ec 0c             	sub    $0xc,%esp
80106f6b:	68 c4 7a 10 80       	push   $0x80107ac4
80106f70:	e8 fb 93 ff ff       	call   80100370 <panic>
80106f75:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106f79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106f80 <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80106f80:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106f81:	31 c9                	xor    %ecx,%ecx

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80106f83:	89 e5                	mov    %esp,%ebp
80106f85:	83 ec 08             	sub    $0x8,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106f88:	8b 55 0c             	mov    0xc(%ebp),%edx
80106f8b:	8b 45 08             	mov    0x8(%ebp),%eax
80106f8e:	e8 bd f6 ff ff       	call   80106650 <walkpgdir>
  if((*pte & PTE_P) == 0)
80106f93:	8b 00                	mov    (%eax),%eax
    return 0;
  if((*pte & PTE_U) == 0)
80106f95:	89 c2                	mov    %eax,%edx
80106f97:	83 e2 05             	and    $0x5,%edx
80106f9a:	83 fa 05             	cmp    $0x5,%edx
80106f9d:	75 11                	jne    80106fb0 <uva2ka+0x30>
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
80106f9f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
}
80106fa4:	c9                   	leave  
  pte = walkpgdir(pgdir, uva, 0);
  if((*pte & PTE_P) == 0)
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
80106fa5:	05 00 00 00 80       	add    $0x80000000,%eax
}
80106faa:	c3                   	ret    
80106fab:	90                   	nop
80106fac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  pte = walkpgdir(pgdir, uva, 0);
  if((*pte & PTE_P) == 0)
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
80106fb0:	31 c0                	xor    %eax,%eax
  return (char*)P2V(PTE_ADDR(*pte));
}
80106fb2:	c9                   	leave  
80106fb3:	c3                   	ret    
80106fb4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106fba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106fc0 <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
80106fc0:	55                   	push   %ebp
80106fc1:	89 e5                	mov    %esp,%ebp
80106fc3:	57                   	push   %edi
80106fc4:	56                   	push   %esi
80106fc5:	53                   	push   %ebx
80106fc6:	83 ec 1c             	sub    $0x1c,%esp
80106fc9:	8b 5d 14             	mov    0x14(%ebp),%ebx
80106fcc:	8b 55 0c             	mov    0xc(%ebp),%edx
80106fcf:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80106fd2:	85 db                	test   %ebx,%ebx
80106fd4:	75 40                	jne    80107016 <copyout+0x56>
80106fd6:	eb 70                	jmp    80107048 <copyout+0x88>
80106fd8:	90                   	nop
80106fd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
80106fe0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80106fe3:	89 f1                	mov    %esi,%ecx
80106fe5:	29 d1                	sub    %edx,%ecx
80106fe7:	81 c1 00 10 00 00    	add    $0x1000,%ecx
80106fed:	39 d9                	cmp    %ebx,%ecx
80106fef:	0f 47 cb             	cmova  %ebx,%ecx
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
80106ff2:	29 f2                	sub    %esi,%edx
80106ff4:	83 ec 04             	sub    $0x4,%esp
80106ff7:	01 d0                	add    %edx,%eax
80106ff9:	51                   	push   %ecx
80106ffa:	57                   	push   %edi
80106ffb:	50                   	push   %eax
80106ffc:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80106fff:	e8 dc d4 ff ff       	call   801044e0 <memmove>
    len -= n;
    buf += n;
80107004:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
{
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80107007:	83 c4 10             	add    $0x10,%esp
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
8010700a:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
    n = PGSIZE - (va - va0);
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
80107010:	01 cf                	add    %ecx,%edi
{
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80107012:	29 cb                	sub    %ecx,%ebx
80107014:	74 32                	je     80107048 <copyout+0x88>
    va0 = (uint)PGROUNDDOWN(va);
80107016:	89 d6                	mov    %edx,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
80107018:	83 ec 08             	sub    $0x8,%esp
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
8010701b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010701e:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
80107024:	56                   	push   %esi
80107025:	ff 75 08             	pushl  0x8(%ebp)
80107028:	e8 53 ff ff ff       	call   80106f80 <uva2ka>
    if(pa0 == 0)
8010702d:	83 c4 10             	add    $0x10,%esp
80107030:	85 c0                	test   %eax,%eax
80107032:	75 ac                	jne    80106fe0 <copyout+0x20>
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
}
80107034:	8d 65 f4             	lea    -0xc(%ebp),%esp
  buf = (char*)p;
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
80107037:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
}
8010703c:	5b                   	pop    %ebx
8010703d:	5e                   	pop    %esi
8010703e:	5f                   	pop    %edi
8010703f:	5d                   	pop    %ebp
80107040:	c3                   	ret    
80107041:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107048:	8d 65 f4             	lea    -0xc(%ebp),%esp
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
8010704b:	31 c0                	xor    %eax,%eax
}
8010704d:	5b                   	pop    %ebx
8010704e:	5e                   	pop    %esi
8010704f:	5f                   	pop    %edi
80107050:	5d                   	pop    %ebp
80107051:	c3                   	ret    
80107052:	66 90                	xchg   %ax,%ax
80107054:	66 90                	xchg   %ax,%ax
80107056:	66 90                	xchg   %ax,%ax
80107058:	66 90                	xchg   %ax,%ax
8010705a:	66 90                	xchg   %ax,%ax
8010705c:	66 90                	xchg   %ax,%ax
8010705e:	66 90                	xchg   %ax,%ax

80107060 <shminit>:
    char *frame;
    int refcnt;
  } shm_pages[64];
} shm_table;

void shminit() {
80107060:	55                   	push   %ebp
80107061:	89 e5                	mov    %esp,%ebp
80107063:	83 ec 10             	sub    $0x10,%esp
  int i;
  initlock(&(shm_table.lock), "SHM lock");
80107066:	68 1c 7b 10 80       	push   $0x80107b1c
8010706b:	68 c0 55 11 80       	push   $0x801155c0
80107070:	e8 4b d1 ff ff       	call   801041c0 <initlock>
  acquire(&(shm_table.lock));
80107075:	c7 04 24 c0 55 11 80 	movl   $0x801155c0,(%esp)
8010707c:	e8 3f d2 ff ff       	call   801042c0 <acquire>
80107081:	b8 f4 55 11 80       	mov    $0x801155f4,%eax
80107086:	83 c4 10             	add    $0x10,%esp
80107089:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for (i = 0; i< 64; i++) {
    shm_table.shm_pages[i].id =0;
80107090:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    shm_table.shm_pages[i].frame =0;
80107096:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
8010709d:	83 c0 0c             	add    $0xc,%eax
    shm_table.shm_pages[i].refcnt =0;
801070a0:	c7 40 fc 00 00 00 00 	movl   $0x0,-0x4(%eax)

void shminit() {
  int i;
  initlock(&(shm_table.lock), "SHM lock");
  acquire(&(shm_table.lock));
  for (i = 0; i< 64; i++) {
801070a7:	3d f4 58 11 80       	cmp    $0x801158f4,%eax
801070ac:	75 e2                	jne    80107090 <shminit+0x30>
    shm_table.shm_pages[i].id =0;
    shm_table.shm_pages[i].frame =0;
    shm_table.shm_pages[i].refcnt =0;
  }
  release(&(shm_table.lock));
801070ae:	83 ec 0c             	sub    $0xc,%esp
801070b1:	68 c0 55 11 80       	push   $0x801155c0
801070b6:	e8 25 d3 ff ff       	call   801043e0 <release>
}
801070bb:	83 c4 10             	add    $0x10,%esp
801070be:	c9                   	leave  
801070bf:	c3                   	ret    

801070c0 <shm_open>:

int shm_open(int id, char **pointer) {
801070c0:	55                   	push   %ebp




return 0; //added to remove compiler warning -- you should decide what to return
}
801070c1:	31 c0                	xor    %eax,%eax
    shm_table.shm_pages[i].refcnt =0;
  }
  release(&(shm_table.lock));
}

int shm_open(int id, char **pointer) {
801070c3:	89 e5                	mov    %esp,%ebp




return 0; //added to remove compiler warning -- you should decide what to return
}
801070c5:	5d                   	pop    %ebp
801070c6:	c3                   	ret    
801070c7:	89 f6                	mov    %esi,%esi
801070c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801070d0 <shm_close>:


int shm_close(int id) {
801070d0:	55                   	push   %ebp




return 0; //added to remove compiler warning -- you should decide what to return
}
801070d1:	31 c0                	xor    %eax,%eax

return 0; //added to remove compiler warning -- you should decide what to return
}


int shm_close(int id) {
801070d3:	89 e5                	mov    %esp,%ebp




return 0; //added to remove compiler warning -- you should decide what to return
}
801070d5:	5d                   	pop    %ebp
801070d6:	c3                   	ret    
