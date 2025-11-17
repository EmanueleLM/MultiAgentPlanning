(define (problem hanoi-3peg-20-instance0)
  (:domain hanoi-3peg-20)
  (:objects
    A B C D E F G H I J K L M N O P Q R S T - disk
    left middle right - peg
  )
  (:init
    ; Agent ownership (annotations only, not used by the solver):
    ; agent_1: A B C D E F G
    ; agent_2: H I J K L M N
    ; agent_3: O P Q R S T

    ; Peg inequality
    (diff left middle) (diff left right)
    (diff middle left) (diff middle right)
    (diff right left)  (diff right middle)

    ; Size ordering (smaller A..T)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J) (smaller A K) (smaller A L) (smaller A M) (smaller A N) (smaller A O) (smaller A P) (smaller A Q) (smaller A R) (smaller A S) (smaller A T)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J) (smaller B K) (smaller B L) (smaller B M) (smaller B N) (smaller B O) (smaller B P) (smaller B Q) (smaller B R) (smaller B S) (smaller B T)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J) (smaller C K) (smaller C L) (smaller C M) (smaller C N) (smaller C O) (smaller C P) (smaller C Q) (smaller C R) (smaller C S) (smaller C T)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J) (smaller D K) (smaller D L) (smaller D M) (smaller D N) (smaller D O) (smaller D P) (smaller D Q) (smaller D R) (smaller D S) (smaller D T)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J) (smaller E K) (smaller E L) (smaller E M) (smaller E N) (smaller E O) (smaller E P) (smaller E Q) (smaller E R) (smaller E S) (smaller E T)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J) (smaller F K) (smaller F L) (smaller F M) (smaller F N) (smaller F O) (smaller F P) (smaller F Q) (smaller F R) (smaller F S) (smaller F T)
    (smaller G H) (smaller G I) (smaller G J) (smaller G K) (smaller G L) (smaller G M) (smaller G N) (smaller G O) (smaller G P) (smaller G Q) (smaller G R) (smaller G S) (smaller G T)
    (smaller H I) (smaller H J) (smaller H K) (smaller H L) (smaller H M) (smaller H N) (smaller H O) (smaller H P) (smaller H Q) (smaller H R) (smaller H S) (smaller H T)
    (smaller I J) (smaller I K) (smaller I L) (smaller I M) (smaller I N) (smaller I O) (smaller I P) (smaller I Q) (smaller I R) (smaller I S) (smaller I T)
    (smaller J K) (smaller J L) (smaller J M) (smaller J N) (smaller J O) (smaller J P) (smaller J Q) (smaller J R) (smaller J S) (smaller J T)
    (smaller K L) (smaller K M) (smaller K N) (smaller K O) (smaller K P) (smaller K Q) (smaller K R) (smaller K S) (smaller K T)
    (smaller L M) (smaller L N) (smaller L O) (smaller L P) (smaller L Q) (smaller L R) (smaller L S) (smaller L T)
    (smaller M N) (smaller M O) (smaller M P) (smaller M Q) (smaller M R) (smaller M S) (smaller M T)
    (smaller N O) (smaller N P) (smaller N Q) (smaller N R) (smaller N S) (smaller N T)
    (smaller O P) (smaller O Q) (smaller O R) (smaller O S) (smaller O T)
    (smaller P Q) (smaller P R) (smaller P S) (smaller P T)
    (smaller Q R) (smaller Q S) (smaller Q T)
    (smaller R S) (smaller R T)
    (smaller S T)

    ; Initial configuration: all disks on left (A top ... T bottom)
    (top left A)
    (clear A)
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J K)
    (on K L)
    (on L M)
    (on M N)
    (on N O)
    (on O P)
    (on P Q)
    (on Q R)
    (on R S)
    (on S T)
    (on-peg T left)

    (empty middle)
    (empty right)
  )

  (:goal
    (and
      ; Goal stacks:
      ; left: C (top), then E F G H I J K L M N O P Q R S T (bottom)
      (top left C)
      (clear C)
      (on C E)
      (on E F)
      (on F G)
      (on G H)
      (on H I)
      (on I J)
      (on J K)
      (on K L)
      (on L M)
      (on M N)
      (on N O)
      (on O P)
      (on P Q)
      (on Q R)
      (on R S)
      (on S T)
      (on-peg T left)

      ; middle: B alone
      (top middle B)
      (clear B)
      (on-peg B middle)

      ; right: A on D
      (top right A)
      (clear A)
      (on A D)
      (on-peg D right)
    )
  )

  ; Optional: audited plan as comments (each line corresponds to one primitive move)
  ; 1  agent_1: move disk A from left to middle
  ; 2  agent_1: move disk B from left to right
  ; 3  agent_1: move disk A from middle to right
  ; 4  agent_1: move disk C from left to middle
  ; 5  agent_1: move disk A from right to left
  ; 6  agent_1: move disk B from right to middle
  ; 7  agent_1: move disk A from left to middle
  ; 8  agent_1: move disk D from left to right
  ; 9  agent_1: move disk A from middle to left
  ; 10 agent_1: move disk B from middle to right
  ; 11 agent_1: move disk A from left to right
  ; 12 agent_1: move disk C from middle to left
  ; 13 agent_1: move disk A from right to left
  ; 14 agent_1: move disk B from right to middle
  ; 15 agent_1: move disk A from left to right
)