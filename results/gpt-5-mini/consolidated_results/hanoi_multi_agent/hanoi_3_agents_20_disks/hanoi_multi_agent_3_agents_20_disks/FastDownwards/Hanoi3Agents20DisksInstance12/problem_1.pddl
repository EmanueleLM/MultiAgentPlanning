(define (problem hanoi20-multiagent-instance12)
  (:domain hanoi_multiagent_ordered)
  (:objects
    A B C D E F G H I J K L M N O P Q R S T - disk
    left middle right - peg
    left middle right A B C D E F G H I J K L M N O P Q R S T - place
    step1 step2 step3 step4 step5 step6 step7 step8 step9 step10 step11 step12 - step
  )

  (:init
    ;; initial stack: left peg top-to-bottom A B C D E F G H I J K L M N O P Q R S T
    ;; each disk is "on" the place immediately under it
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

    ;; top-of-peg/disk clear flags
    (clear A)
    (clear middle)
    (clear right)
    ;; other clear facts (for disks B..T) are false by omission

    ;; Agent permission sets (exclusive)
    (agent1_allowed A) (agent1_allowed B) (agent1_allowed C) (agent1_allowed D)
    (agent1_allowed E) (agent1_allowed F) (agent1_allowed G)
    (agent2_allowed H) (agent2_allowed I) (agent2_allowed J) (agent2_allowed K)
    (agent2_allowed L) (agent2_allowed M) (agent2_allowed N)
    (agent3_allowed O) (agent3_allowed P) (agent3_allowed Q) (agent3_allowed R)
    (agent3_allowed S) (agent3_allowed T)

    ;; size ordering: smaller X Y means X is strictly smaller than Y
    ;; A smallest, T largest. Enumerate all i<j pairs
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller A H) (smaller A I) (smaller A J) (smaller A K) (smaller A L) (smaller A M)
    (smaller A N) (smaller A O) (smaller A P) (smaller A Q) (smaller A R) (smaller A S) (smaller A T)

    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller B H) (smaller B I) (smaller B J) (smaller B K) (smaller B L) (smaller B M)
    (smaller B N) (smaller B O) (smaller B P) (smaller B Q) (smaller B R) (smaller B S) (smaller B T)

    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller C H) (smaller C I) (smaller C J) (smaller C K) (smaller C L) (smaller C M)
    (smaller C N) (smaller C O) (smaller C P) (smaller C Q) (smaller C R) (smaller C S) (smaller C T)

    (smaller D E) (smaller D F) (smaller D G)
    (smaller D H) (smaller D I) (smaller D J) (smaller D K) (smaller D L) (smaller D M)
    (smaller D N) (smaller D O) (smaller D P) (smaller D Q) (smaller D R) (smaller D S) (smaller D T)

    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J) (smaller E K)
    (smaller E L) (smaller E M) (smaller E N) (smaller E O) (smaller E P) (smaller E Q)
    (smaller E R) (smaller E S) (smaller E T)

    (smaller F G) (smaller F H) (smaller F I) (smaller F J) (smaller F K) (smaller F L)
    (smaller F M) (smaller F N) (smaller F O) (smaller F P) (smaller F Q) (smaller F R)
    (smaller F S) (smaller F T)

    (smaller G H) (smaller G I) (smaller G J) (smaller G K) (smaller G L) (smaller G M)
    (smaller G N) (smaller G O) (smaller G P) (smaller G Q) (smaller G R) (smaller G S) (smaller G T)

    (smaller H I) (smaller H J) (smaller H K) (smaller H L) (smaller H M) (smaller H N)
    (smaller H O) (smaller H P) (smaller H Q) (smaller H R) (smaller H S) (smaller H T)

    (smaller I J) (smaller I K) (smaller I L) (smaller I M) (smaller I N) (smaller I O)
    (smaller I P) (smaller I Q) (smaller I R) (smaller I S) (smaller I T)

    (smaller J K) (smaller J L) (smaller J M) (smaller J N) (smaller J O) (smaller J P)
    (smaller J Q) (smaller J R) (smaller J S) (smaller J T)

    (smaller K L) (smaller K M) (smaller K N) (smaller K O) (smaller K P) (smaller K Q)
    (smaller K R) (smaller K S) (smaller K T)

    (smaller L M) (smaller L N) (smaller L O) (smaller L P) (smaller L Q) (smaller L R)
    (smaller L S) (smaller L T)

    (smaller M N) (smaller M O) (smaller M P) (smaller M Q) (smaller M R) (smaller M S) (smaller M T)

    (smaller N O) (smaller N P) (smaller N Q) (smaller N R) (smaller N S) (smaller N T)

    (smaller O P) (smaller O Q) (smaller O R) (smaller O S) (smaller O T)

    (smaller P Q) (smaller P R) (smaller P S) (smaller P T)
    (smaller Q R) (smaller Q S) (smaller Q T)
    (smaller R S) (smaller R T)
    (smaller S T)

    ;; sequencing: allow only the planned ordered moves
    (ready step1)
  )

  (:goal
    (and
      ;; goal configuration:
      ;; left peg top-to-bottom A B E F G H I J K L M N O P Q R S T
      ;; middle peg top-to-bottom C D
      ;; right peg empty

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

      (on C D)
      (on D middle)

      ;; ensure right is empty by requiring it clear
      (clear right)

      ;; top-of-pegs/disks as required
      (clear A)
      (clear C)
    )
  )
)