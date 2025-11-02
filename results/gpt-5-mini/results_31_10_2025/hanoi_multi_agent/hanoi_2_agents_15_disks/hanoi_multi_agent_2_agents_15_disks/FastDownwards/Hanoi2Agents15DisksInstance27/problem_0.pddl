(define (problem hanoi_problem)
  (:domain hanoi_domain)
  (:objects
    A B C D E F G H I J K L M N O - disk
    left middle right - peg
  )

  (:init
    ;; Initial stack top-to-bottom on left: A (top), B, C, D, E, F, G, H, I, J, K, L, M, N, O (bottom)
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

    ;; clear: top disk and empty pegs
    (clear A)
    (clear middle)
    (clear right)

    ;; Agent permissions
    (allowed-by-agent1 A)
    (allowed-by-agent1 B)
    (allowed-by-agent1 C)
    (allowed-by-agent1 D)
    (allowed-by-agent1 E)
    (allowed-by-agent1 F)
    (allowed-by-agent1 G)
    (allowed-by-agent1 H)

    (allowed-by-agent2 I)
    (allowed-by-agent2 J)
    (allowed-by-agent2 K)
    (allowed-by-agent2 L)
    (allowed-by-agent2 M)
    (allowed-by-agent2 N)
    (allowed-by-agent2 O)

    ;; Size ordering: smaller X Y means X is strictly smaller than Y.
    ;; A smaller than all B..O
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller A G) (smaller A H) (smaller A I) (smaller A J) (smaller A K)
    (smaller A L) (smaller A M) (smaller A N) (smaller A O)

    ;; B smaller than C..O
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller B H) (smaller B I) (smaller B J) (smaller B K) (smaller B L)
    (smaller B M) (smaller B N) (smaller B O)

    ;; C smaller than D..O
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H)
    (smaller C I) (smaller C J) (smaller C K) (smaller C L) (smaller C M)
    (smaller C N) (smaller C O)

    ;; D smaller than E..O
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I)
    (smaller D J) (smaller D K) (smaller D L) (smaller D M) (smaller D N)
    (smaller D O)

    ;; E smaller than F..O
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller E K) (smaller E L) (smaller E M) (smaller E N) (smaller E O)

    ;; F smaller than G..O
    (smaller F G) (smaller F H) (smaller F I) (smaller F J) (smaller F K)
    (smaller F L) (smaller F M) (smaller F N) (smaller F O)

    ;; G smaller than H..O
    (smaller G H) (smaller G I) (smaller G J) (smaller G K) (smaller G L)
    (smaller G M) (smaller G N) (smaller G O)

    ;; H smaller than I..O
    (smaller H I) (smaller H J) (smaller H K) (smaller H L) (smaller H M)
    (smaller H N) (smaller H O)

    ;; I smaller than J..O
    (smaller I J) (smaller I K) (smaller I L) (smaller I M) (smaller I N)
    (smaller I O)

    ;; J smaller than K..O
    (smaller J K) (smaller J L) (smaller J M) (smaller J N) (smaller J O)

    ;; K smaller than L..O
    (smaller K L) (smaller K M) (smaller K N) (smaller K O)

    ;; L smaller than M..O
    (smaller L M) (smaller L N) (smaller L O)

    ;; M smaller than N..O
    (smaller M N) (smaller M O)

    ;; N smaller than O
    (smaller N O)
  )

  (:goal (and
    ;; Left peg stack top-to-bottom: A, B, F, G, H, I, J, K, L, M, N, O
    (on A B)
    (on B F)
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

    ;; Middle peg: E solitary
    (on E middle)

    ;; Right peg top-to-bottom: C, D
    (on C D)
    (on D right)
  ))
)