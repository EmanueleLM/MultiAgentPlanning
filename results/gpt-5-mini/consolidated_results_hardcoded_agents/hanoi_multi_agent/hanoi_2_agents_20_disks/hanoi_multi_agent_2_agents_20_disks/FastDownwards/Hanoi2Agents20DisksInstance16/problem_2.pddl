(define (problem Hanoi2Agents20DisksInstance16)
  (:domain hanoi_multi_agent_2agents_20disks)
  (:objects
    A B C D E F G H I J K L M N O P Q R S T - disk
    left middle right - peg
    agent_1 agent_2 orchestrator - agent
  )

  (:init
    ;; Initial stack on left peg top-to-bottom: A B C D E F G H I J K L M N O P Q R S T
    (on A left)
    (on B A)
    (on C B)
    (on D C)
    (on E D)
    (on F E)
    (on G F)
    (on H G)
    (on I H)
    (on J I)
    (on K J)
    (on L K)
    (on M L)
    (on N M)
    (on O N)
    (on P O)
    (on Q P)
    (on R Q)
    (on S R)
    (on T S)

    ;; Clear predicates: top-most disk A is clear; middle and right pegs are empty
    (clear A)
    (clear middle)
    (clear right)

    ;; Agent move permissions
    (agent1_disk A)
    (agent1_disk B)
    (agent1_disk C)
    (agent1_disk D)
    (agent1_disk E)
    (agent1_disk F)
    (agent1_disk G)
    (agent1_disk H)
    (agent1_disk I)
    (agent1_disk J)

    (agent2_disk K)
    (agent2_disk L)
    (agent2_disk M)
    (agent2_disk N)
    (agent2_disk O)
    (agent2_disk P)
    (agent2_disk Q)
    (agent2_disk R)
    (agent2_disk S)
    (agent2_disk T)

    ;; Size ordering: 'smaller x y' if x is smaller than y (A < B < ... < T)
    ;; A smaller than all others
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J) (smaller A K) (smaller A L) (smaller A M) (smaller A N) (smaller A O) (smaller A P) (smaller A Q) (smaller A R) (smaller A S) (smaller A T)
    ;; B smaller than those after it
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J) (smaller B K) (smaller B L) (smaller B M) (smaller B N) (smaller B O) (smaller B P) (smaller B Q) (smaller B R) (smaller B S) (smaller B T)
    ;; C
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J) (smaller C K) (smaller C L) (smaller C M) (smaller C N) (smaller C O) (smaller C P) (smaller C Q) (smaller C R) (smaller C S) (smaller C T)
    ;; D
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J) (smaller D K) (smaller D L) (smaller D M) (smaller D N) (smaller D O) (smaller D P) (smaller D Q) (smaller D R) (smaller D S) (smaller D T)
    ;; E
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J) (smaller E K) (smaller E L) (smaller E M) (smaller E N) (smaller E O) (smaller E P) (smaller E Q) (smaller E R) (smaller E S) (smaller E T)
    ;; F
    (smaller F G) (smaller F H) (smaller F I) (smaller F J) (smaller F K) (smaller F L) (smaller F M) (smaller F N) (smaller F O) (smaller F P) (smaller F Q) (smaller F R) (smaller F S) (smaller F T)
    ;; G
    (smaller G H) (smaller G I) (smaller G J) (smaller G K) (smaller G L) (smaller G M) (smaller G N) (smaller G O) (smaller G P) (smaller G Q) (smaller G R) (smaller G S) (smaller G T)
    ;; H
    (smaller H I) (smaller H J) (smaller H K) (smaller H L) (smaller H M) (smaller H N) (smaller H O) (smaller H P) (smaller H Q) (smaller H R) (smaller H S) (smaller H T)
    ;; I
    (smaller I J) (smaller I K) (smaller I L) (smaller I M) (smaller I N) (smaller I O) (smaller I P) (smaller I Q) (smaller I R) (smaller I S) (smaller I T)
    ;; J
    (smaller J K) (smaller J L) (smaller J M) (smaller J N) (smaller J O) (smaller J P) (smaller J Q) (smaller J R) (smaller J S) (smaller J T)
    ;; K
    (smaller K L) (smaller K M) (smaller K N) (smaller K O) (smaller K P) (smaller K Q) (smaller K R) (smaller K S) (smaller K T)
    ;; L
    (smaller L M) (smaller L N) (smaller L O) (smaller L P) (smaller L Q) (smaller L R) (smaller L S) (smaller L T)
    ;; M
    (smaller M N) (smaller M O) (smaller M P) (smaller M Q) (smaller M R) (smaller M S) (smaller M T)
    ;; N
    (smaller N O) (smaller N P) (smaller N Q) (smaller N R) (smaller N S) (smaller N T)
    ;; O
    (smaller O P) (smaller O Q) (smaller O R) (smaller O S) (smaller O T)
    ;; P
    (smaller P Q) (smaller P R) (smaller P S) (smaller P T)
    ;; Q
    (smaller Q R) (smaller Q S) (smaller Q T)
    ;; R
    (smaller R S) (smaller R T)
    ;; S
    (smaller S T)
  )

  (:goal (and
    ;; Left peg final stack top-to-bottom: B C E F G H I J K L M N O P Q R S T
    (on B left)
    (on C B)
    (on E C)
    (on F E)
    (on G F)
    (on H G)
    (on I H)
    (on J I)
    (on K J)
    (on L K)
    (on M L)
    (on N M)
    (on O N)
    (on P O)
    (on Q P)
    (on R Q)
    (on S R)
    (on T S)

    ;; Right peg final stack top-to-bottom: A D (A on top of D)
    (on A right)
    (on D A)

    ;; Middle peg empty
    (clear middle)

    ;; Tops of piles should be clear
    (clear B)
    (clear A)
  ))
)