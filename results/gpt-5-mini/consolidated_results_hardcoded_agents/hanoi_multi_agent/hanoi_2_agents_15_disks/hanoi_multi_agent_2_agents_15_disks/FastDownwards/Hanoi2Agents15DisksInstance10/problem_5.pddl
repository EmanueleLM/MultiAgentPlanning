(define (problem two-agent-hanoi-15)
  (:domain multi-agent-hanoi)
  (:objects
    A B C D E F G H I J K L M N O - disk
    peg1 peg2 peg3 - peg
  )

  (:init
    ;; stack on peg1 from top A down to O
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
    (on O peg1)

    ;; clear top and empty pegs
    (clear A)
    (clear peg2)
    (clear peg3)

    ;; agent move permissions
    (can-move-agent1 A) (can-move-agent1 B) (can-move-agent1 C)
    (can-move-agent1 D) (can-move-agent1 E) (can-move-agent1 F)
    (can-move-agent1 G) (can-move-agent1 H)

    (can-move-agent2 I) (can-move-agent2 J) (can-move-agent2 K)
    (can-move-agent2 L) (can-move-agent2 M) (can-move-agent2 N)
    (can-move-agent2 O)

    ;; size ordering: smaller X Y means X is smaller than Y
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
  )

  (:goal (and
    ;; left peg (peg1) should have stack D (top) ... O (bottom)
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
    (on O peg1)

    ;; middle peg peg2 has B (alone)
    (on B peg2)

    ;; right peg peg3 has C (below) with A on top
    (on A C)
    (on C peg3)
  )))