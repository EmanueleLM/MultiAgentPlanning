(define (problem hanoi20-multiagent)
  (:domain hanoi_multiagent)
  (:objects
    A B C D E F G H I J K L M N O P Q R S T - disk
    left middle right - peg
  )

  (:init
    ;; initial stack: left peg top-to-bottom A B C D E F G H I J K L M N O P Q R S T
    ;; We use the common "on" representation where each disk is on the place immediately under it.
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
    (on T left)

    ;; top-of-peg/disk clear flags: only top objects are clear
    (clear A)
    (clear middle)
    (clear right)
    ;; disks B..T are not listed as clear (implicitly false)

    ;; Agent permission sets (exclusive)
    ;; agent_1 may only move A B C D E F G
    (agent1_allowed A) (agent1_allowed B) (agent1_allowed C) (agent1_allowed D)
    (agent1_allowed E) (agent1_allowed F) (agent1_allowed G)
    ;; agent_2 may only move H I J K L M N
    (agent2_allowed H) (agent2_allowed I) (agent2_allowed J) (agent2_allowed K)
    (agent2_allowed L) (agent2_allowed M) (agent2_allowed N)
    ;; agent_3 may only move O P Q R S T
    (agent3_allowed O) (agent3_allowed P) (agent3_allowed Q) (agent3_allowed R)
    (agent3_allowed S) (agent3_allowed T)

    ;; size ordering: smaller X Y means X is strictly smaller than Y
    ;; A smallest, T largest. We enumerate all ordered pairs (i<j).
    ;; A smaller than B..T
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller A H) (smaller A I) (smaller A J) (smaller A K) (smaller A L) (smaller A M)
    (smaller A N) (smaller A O) (smaller A P) (smaller A Q) (smaller A R) (smaller A S) (smaller A T)
    ;; B smaller than C..T
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller B H) (smaller B I) (smaller B J) (smaller B K) (smaller B L) (smaller B M)
    (smaller B N) (smaller B O) (smaller B P) (smaller B Q) (smaller B R) (smaller B S) (smaller B T)
    ;; C smaller than D..T
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller C H) (smaller C I) (smaller C J) (smaller C K) (smaller C L) (smaller C M)
    (smaller C N) (smaller C O) (smaller C P) (smaller C Q) (smaller C R) (smaller C S) (smaller C T)
    ;; D smaller than E..T
    (smaller D E) (smaller D F) (smaller D G)
    (smaller D H) (smaller D I) (smaller D J) (smaller D K) (smaller D L) (smaller D M)
    (smaller D N) (smaller D O) (smaller D P) (smaller D Q) (smaller D R) (smaller D S) (smaller D T)
    ;; E smaller than F..T
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J) (smaller E K)
    (smaller E L) (smaller E M) (smaller E N) (smaller E O) (smaller E P) (smaller E Q)
    (smaller E R) (smaller E S) (smaller E T)
    ;; F smaller than G..T
    (smaller F G) (smaller F H) (smaller F I) (smaller F J) (smaller F K) (smaller F L)
    (smaller F M) (smaller F N) (smaller F O) (smaller F P) (smaller F Q) (smaller F R)
    (smaller F S) (smaller F T)
    ;; G smaller than H..T
    (smaller G H) (smaller G I) (smaller G J) (smaller G K) (smaller G L) (smaller G M)
    (smaller G N) (smaller G O) (smaller G P) (smaller G Q) (smaller G R) (smaller G S) (smaller G T)
    ;; H smaller than I..T
    (smaller H I) (smaller H J) (smaller H K) (smaller H L) (smaller H M) (smaller H N)
    (smaller H O) (smaller H P) (smaller H Q) (smaller H R) (smaller H S) (smaller H T)
    ;; I smaller than J..T
    (smaller I J) (smaller I K) (smaller I L) (smaller I M) (smaller I N) (smaller I O)
    (smaller I P) (smaller I Q) (smaller I R) (smaller I S) (smaller I T)
    ;; J smaller than K..T
    (smaller J K) (smaller J L) (smaller J M) (smaller J N) (smaller J O) (smaller J P)
    (smaller J Q) (smaller J R) (smaller J S) (smaller J T)
    ;; K smaller than L..T
    (smaller K L) (smaller K M) (smaller K N) (smaller K O) (smaller K P) (smaller K Q)
    (smaller K R) (smaller K S) (smaller K T)
    ;; L smaller than M..T
    (smaller L M) (smaller L N) (smaller L O) (smaller L P) (smaller L Q) (smaller L R)
    (smaller L S) (smaller L T)
    ;; M smaller than N..T
    (smaller M N) (smaller M O) (smaller M P) (smaller M Q) (smaller M R) (smaller M S) (smaller M T)
    ;; N smaller than O..T
    (smaller N O) (smaller N P) (smaller N Q) (smaller N R) (smaller N S) (smaller N T)
    ;; O smaller than P..T
    (smaller O P) (smaller O Q) (smaller O R) (smaller O S) (smaller O T)
    ;; P smaller than Q..T
    (smaller P Q) (smaller P R) (smaller P S) (smaller P T)
    ;; Q smaller than R..T
    (smaller Q R) (smaller Q S) (smaller Q T)
    ;; R smaller than S..T
    (smaller R S) (smaller R T)
    ;; S smaller than T
    (smaller S T)
  )

  (:goal
    (and
      ;; Goal configuration:
      ;; left peg top-to-bottom A B E F G H I J K L M N O P Q R S T
      ;; middle peg top-to-bottom C D
      ;; right peg empty

      ;; left chain: A on B, B on E, E on F, F on G, ..., S on T, T on left
      (on A B)
      (on B E)
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
      (on T left)

      ;; middle chain: C on D, D on middle
      (on C D)
      (on D middle)

      ;; right must be empty: nothing on right (represented by no disk directly on right).
      ;; To ensure right is empty we assert that no disk is on right as direct support.
      ;; In STRIPS-style goal we assert clear right to require nothing on top of right (and since no disk supports on right).
      (clear right)

      ;; make explicit the tops are clear as expected
      (clear A)
      (clear C)
    )
  )
)