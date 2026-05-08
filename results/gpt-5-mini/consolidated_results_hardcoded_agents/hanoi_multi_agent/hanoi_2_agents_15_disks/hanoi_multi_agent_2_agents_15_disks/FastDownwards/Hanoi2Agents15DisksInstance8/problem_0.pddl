(define (problem hanoi_15_multiagent)
  (:domain hanoi_multiagent)

  (:objects
    A B C D E F G H I J K L M N O - disk
    left middle right - peg
  )

  (:init
    ;; initial stack on left: top A, then B, ..., bottom O
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
    (on O left)

    ;; clear/top markers: A is top on left; middle and right pegs are empty
    (clear A)
    (clear middle)
    (clear right)

    ;; agent permissions
    (allowed_agent1 A) (allowed_agent1 B) (allowed_agent1 C) (allowed_agent1 D)
    (allowed_agent1 E) (allowed_agent1 F) (allowed_agent1 G) (allowed_agent1 H)

    (allowed_agent2 I) (allowed_agent2 J) (allowed_agent2 K) (allowed_agent2 L)
    (allowed_agent2 M) (allowed_agent2 N) (allowed_agent2 O)

    ;; size ordering: smaller X Y when X is smaller than Y
    ;; A smaller than all that follow
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J) (smaller A K) (smaller A L) (smaller A M) (smaller A N) (smaller A O)
    ;; B smaller than all after
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J) (smaller B K) (smaller B L) (smaller B M) (smaller B N) (smaller B O)
    ;; C
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J) (smaller C K) (smaller C L) (smaller C M) (smaller C N) (smaller C O)
    ;; D
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J) (smaller D K) (smaller D L) (smaller D M) (smaller D N) (smaller D O)
    ;; E
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J) (smaller E K) (smaller E L) (smaller E M) (smaller E N) (smaller E O)
    ;; F
    (smaller F G) (smaller F H) (smaller F I) (smaller F J) (smaller F K) (smaller F L) (smaller F M) (smaller F N) (smaller F O)
    ;; G
    (smaller G H) (smaller G I) (smaller G J) (smaller G K) (smaller G L) (smaller G M) (smaller G N) (smaller G O)
    ;; H
    (smaller H I) (smaller H J) (smaller H K) (smaller H L) (smaller H M) (smaller H N) (smaller H O)
    ;; I
    (smaller I J) (smaller I K) (smaller I L) (smaller I M) (smaller I N) (smaller I O)
    ;; J
    (smaller J K) (smaller J L) (smaller J M) (smaller J N) (smaller J O)
    ;; K
    (smaller K L) (smaller K M) (smaller K N) (smaller K O)
    ;; L
    (smaller L M) (smaller L N) (smaller L O)
    ;; M
    (smaller M N) (smaller M O)
    ;; N
    (smaller N O)
  )

  (:goal
    (and
      ;; left peg top->bottom: B F G H I J K L M N O
      (on B F) (on F G) (on G H) (on H I) (on I J) (on J K) (on K L) (on L M) (on M N) (on N O) (on O left)

      ;; middle peg top->bottom: A D
      (on A D) (on D middle)

      ;; right peg top->bottom: C E
      (on C E) (on E right)
    )
  )
)