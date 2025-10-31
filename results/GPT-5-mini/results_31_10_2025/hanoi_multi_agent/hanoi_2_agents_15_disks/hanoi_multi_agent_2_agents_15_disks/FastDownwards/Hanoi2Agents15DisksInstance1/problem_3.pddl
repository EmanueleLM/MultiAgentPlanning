(define (problem Hanoi2Agents15DisksInstance1_problem)
  (:domain hanoi_2agents_fixed_sequence)

  (:objects
    left middle right - peg
    A B C D E F G H I J K L M N O - disk
  )

  (:init
    (on A left) (on B left) (on C left) (on D left) (on E left)
    (on F left) (on G left) (on H left) (on I left) (on J left)
    (on K left) (on L left) (on M left) (on N left) (on O left)

    (above A B) (above B C) (above C D) (above D E) (above E F)
    (above F G) (above G H) (above H I) (above I J) (above J K)
    (above K L) (above L M) (above M N) (above N O)

    (clear A)

    (empty middle)
    (empty right)

    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller A G) (smaller A H) (smaller A I) (smaller A J) (smaller A K)
    (smaller A L) (smaller A M) (smaller A N) (smaller A O)

    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller B H) (smaller B I) (smaller B J) (smaller B K) (smaller B L)
    (smaller B M) (smaller B N) (smaller B O)

    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H)
    (smaller C I) (smaller C J) (smaller C K) (smaller C L) (smaller C M)
    (smaller C N) (smaller C O)

    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I)
    (smaller D J) (smaller D K) (smaller D L) (smaller D M) (smaller D N)
    (smaller D O)

    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller E K) (smaller E L) (smaller E M) (smaller E N) (smaller E O)

    (smaller F G) (smaller F H) (smaller F I) (smaller F J) (smaller F K)
    (smaller F L) (smaller F M) (smaller F N) (smaller F O)

    (smaller G H) (smaller G I) (smaller G J) (smaller G K) (smaller G L)
    (smaller G M) (smaller G N) (smaller G O)

    (smaller H I) (smaller H J) (smaller H K) (smaller H L) (smaller H M)
    (smaller H N) (smaller H O)

    (smaller I J) (smaller I K) (smaller I L) (smaller I M) (smaller I N)
    (smaller I O)

    (smaller J K) (smaller J L) (smaller J M) (smaller J N) (smaller J O)

    (smaller K L) (smaller K M) (smaller K N) (smaller K O)

    (smaller L M) (smaller L N) (smaller L O)

    (smaller M N) (smaller M O)

    (smaller N O)

    ;; agent availability constraints
    (agent1 A) (agent1 B) (agent1 C) (agent1 D) (agent1 E) (agent1 F) (agent1 G) (agent1 H)
    (agent2 I) (agent2 J) (agent2 K) (agent2 L) (agent2 M) (agent2 N) (agent2 O)
  )

  (:goal (and
    (on B left) (on E left) (on F left) (on G left) (on H left)
    (on I left) (on J left) (on K left) (on L left) (on M left)
    (on N left) (on O left)

    (above B E) (above E F) (above F G) (above G H) (above H I)
    (above I J) (above J K) (above K L) (above L M) (above M N)
    (above N O)

    (on D middle)

    (on A right) (on C right)
    (above A C)
  ))