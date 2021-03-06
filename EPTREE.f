C               PROGRAM TO ENUMERATE PHYSICAL TREES
C
C               NUMBER (I) WILL CONTAIN THE NUMBER OF PHYSICAL TREES
C               WITH N+1 VERTICES (I.E. N EDGES)
C               M = MAXIMAL NUMBER OF EDGES
      INTEGER STACK(7,100),NUMBER(40)
      READ(8,1000) M
      DO 10 I=1,M
  10  NUMBER(I)=0
C               
C               DEFINE FIRST CLASS OF PHYSICAL TREES
C               
      STACK(1,1)=2
      STACK(2,1)=0
      STACK(3,1)=0
      STACK(4,1)=0
C               
C               ELEMENT 5: NUMBER OF TREES IN THIS CLASS
C               
      STACK(5,1)=1
C               
C               ELEMENT 6: MARK TO NOTICE UP TO WHICH DEGREE THIS CLASS
C                          IS USED TO GENERATE NEW CLASSES
      STACK(6,1)=0
C               
C               NUMBER OF EDGES OF TREES IN THIS CLASS
C               
      STACK(7,1)=1
C               
      ISTACK=1
      NUMBER(1)=1
  20  IF(ISTACK.EQ.0) GOTO 50
      DO 30 I=1,7
  30  STACK(I,ISTACK+1)=STACK(I,ISTACK)
      IF(STACK(6,ISTACK).EQ.3) GOTO 40
      STACK(6,ISTACK)=STACK(6,ISTACK)+1
      STACK(1,ISTACK+1)=STACK(1,ISTACK)+1
      N=STACK(6,ISTACK)
      IF(STACK(N,ISTACK).EQ.0) GOTO 20
      STACK(N,ISTACK+1)=STACK(N,ISTACK+1)-1
      STACK(N+1,ISTACK+1)=STACK(N+1,ISTACK+1)+1
      STACK(5,ISTACK+1)=STACK(N,ISTACK)*STACK(5,ISTACK)
      STACK(6,ISTACK+1)=0
      STACK(7,ISTACK+1)=STACK(7,ISTACK)+1
      NUMBER(STACK(7,ISTACK+1))=NUMBER(STACK(7,ISTACK+1))
     *                         +STACK(5,ISTACK+1)
      IF(STACK(7,ISTACK+1).EQ.M) GOTO 20
      ISTACK=ISTACK+1
      GOTO 20
  40  ISTACK=ISTACK-1
      GOTO 20
  50  WRITE(9,1010) (NUMBER(I),I=1,M)
      STOP
 1000 FORMAT(I2)
 1010 FORMAT(50(5I16))
      END
