(define (problem Hanoi3Agents20DisksInstance1-problem)
  (:domain hanoi-20-agents)
  (:objects
    agent_1 agent_2 agent_3 - agent
    A B C D E F G H I J K L M N O P Q R S T - disk
    left middle right - peg
  )
  ; Plan hint (total order):
  ; 1) agent_1: move disk A from left to right
  ; 2) agent_1: move disk B from left to middle
  ; 3) agent_1: move disk A from right to middle
  (:init
    ; pegs initially empty/occupied
    (clear middle)
    (clear right)

    ; initial stack: all disks on left, top-to-bottom A..T
    (on A left)
    (on B left)
    (on C left)
    (on D left)
    (on E left)
    (on F left)
    (on G left)
    (on H left)
    (on I left)
    (on J left)
    (on K left)
    (on L left)
    (on M left)
    (on N left)
    (on O left)
    (on P left)
    (on Q left)
    (on R left)
    (on S left)
    (on T left)

    ; adjacency chain on left
    (below A B)
    (below B C)
    (below C D)
    (below D E)
    (below E F)
    (below F G)
    (below G H)
    (below H I)
    (below I J)
    (below J K)
    (below K L)
    (below L M)
    (below M N)
    (below N O)
    (below O P)
    (below P Q)
    (below Q R)
    (below R S)
    (below S T)
    (support T left)

    ; only A is initially top
    (top A)

    ; agent controls
    (controls agent_1 A)
    (controls agent_1 B)
    (controls agent_1 C)
    (controls agent_1 D)
    (controls agent_1 E)
    (controls agent_1 F)
    (controls agent_1 G)

    (controls agent_2 H)
    (controls agent_2 I)
    (controls agent_2 J)
    (controls agent_2 K)
    (controls agent_2 L)
    (controls agent_2 M)
    (controls agent_2 N)

    (controls agent_3 O)
    (controls agent_3 P)
    (controls agent_3 Q)
    (controls agent_3 R)
    (controls agent_3 S)
    (controls agent_3 T)

    ; size order (smaller X Y means X is smaller than Y)
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
  )
  (:goal
    (and
      ; Goal configuration:
      ; left peg: top-to-bottom C..T
      (on C left) (on D left) (on E left) (on F left) (on G left)
      (on H left) (on I left) (on J left) (on K left) (on L left)
      (on M left) (on N left) (on O left) (on P left) (on Q left)
      (on R left) (on S left) (on T left)

      (below C D)
      (below D E)
      (below E F)
      (below F G)
      (below G H)
      (below H I)
      (below I J)
      (below J K)
      (below K L)
      (below L M)
      (below M N)
      (below N O)
      (below O P)
      (below P Q)
      (below Q R)
      (below R S)
      (below S T)
      (support T left)
      (top C)

      ; middle peg: top-to-bottom A, B
      (on A middle)
      (on B middle)
      (below A B)
      (support B middle)
      (top A)

      ; right peg empty
      (clear right)
    )
  )
)