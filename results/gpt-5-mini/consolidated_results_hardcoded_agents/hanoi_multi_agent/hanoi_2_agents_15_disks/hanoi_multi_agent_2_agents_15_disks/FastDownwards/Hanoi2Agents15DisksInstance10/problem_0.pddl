(define (problem two-agent-hanoi-15)
  (:domain multi-agent-hanoi)
  (:objects
    A B C D E F G H I J K L M N O - disk
    peg1 peg2 peg3 - peg
  )

  (:init
    ;; Initial tower on peg1 top-to-bottom: A (top), B, C, D, E, F, G, H, I, J, K, L, M, N, O (bottom on peg1)
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

    ;; Clear places: A is top of the left stack initially; peg2 and peg3 are empty
    (clear A)
    (clear peg2)
    (clear peg3)

    ;; Agent move permissions derived from agent proposals / private info:
    ;; agent_1 provided moves for A, B, C => permit agent_1 to move disks A, B, C only
    (can-move-agent1 A)
    (can-move-agent1 B)
    (can-move-agent1 C)

    ;; agent_2 said they cannot move right now because disks I-O are covered; this statement
    ;; implies agent_2 is responsible for the larger disks I..O (but initially blocked).
    (can-move-agent2 I)
    (can-move-agent2 J)
    (can-move-agent2 K)
    (can-move-agent2 L)
    (can-move-agent2 M)
    (can-move-agent2 N)
    (can-move-agent2 O)

    ;; Size relations: smaller X Y when X is physically smaller than Y.
    ;; A < B < C < D < E < F < G < H < I < J < K < L < M < N < O
    ;; List all ordered pairs where first is smaller than second
    ;; Pairs for A
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller A G) (smaller A H) (smaller A I) (smaller A J) (smaller A K)
    (smaller A L) (smaller A M) (smaller A N) (smaller A O)

    ;; Pairs for B
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller B H) (smaller B I) (smaller B J) (smaller B K) (smaller B L)
    (smaller B M) (smaller B N) (smaller B O)

    ;; Pairs for C
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H)
    (smaller C I) (smaller C J) (smaller C K) (smaller C L) (smaller C M)
    (smaller C N) (smaller C O)

    ;; Pairs for D
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I)
    (smaller D J) (smaller D K) (smaller D L) (smaller D M) (smaller D N)
    (smaller D O)

    ;; Pairs for E
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller E K) (smaller E L) (smaller E M) (smaller E N) (smaller E O)

    ;; Pairs for F
    (smaller F G) (smaller F H) (smaller F I) (smaller F J) (smaller F K)
    (smaller F L) (smaller F M) (smaller F N) (smaller F O)

    ;; Pairs for G
    (smaller G H) (smaller G I) (smaller G J) (smaller G K) (smaller G L)
    (smaller G M) (smaller G N) (smaller G O)

    ;; Pairs for H
    (smaller H I) (smaller H J) (smaller H K) (smaller H L) (smaller H M)
    (smaller H N) (smaller H O)

    ;; Pairs for I
    (smaller I J) (smaller I K) (smaller I L) (smaller I M) (smaller I N)
    (smaller I O)

    ;; Pairs for J
    (smaller J K) (smaller J L) (smaller J M) (smaller J N) (smaller J O)

    ;; Pairs for K
    (smaller K L) (smaller K M) (smaller K N) (smaller K O)

    ;; Pairs for L
    (smaller L M) (smaller L N) (smaller L O)

    ;; Pairs for M
    (smaller M N) (smaller M O)

    ;; Pairs for N
    (smaller N O)
  )

  ;; Goal: left peg (peg1) should have top-to-bottom D..O
  ;; Middle peg (peg2) should have top-to-bottom B (single disk)
  ;; Right peg (peg3) should have top-to-bottom A, C (A on C, C on peg3)
  (:goal (and
    ;; Left peg stack D (top) to O (bottom)
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

    ;; Middle peg has B (top)
    (on B peg2)

    ;; Right peg has A on C, C on peg3 (top-to-bottom A, C)
    (on A C)
    (on C peg3)
  ))
)