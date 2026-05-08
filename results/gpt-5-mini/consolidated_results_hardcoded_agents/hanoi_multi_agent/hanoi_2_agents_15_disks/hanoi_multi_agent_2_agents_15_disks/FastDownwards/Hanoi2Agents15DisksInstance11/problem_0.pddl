(define (problem cooperative-hanoi-problem)
  (:domain cooperative-hanoi)
  (:objects
    A B C D E F G H I J K L M N O - disk
    left middle right - peg
    agent1 agent2 - agent
  )

  (:init
    ;; Initial stacking on left peg top-to-bottom: A,B,C,D,E,F,G,H,I,J,K,L,M,N,O
    ;; Represented as on-disk relations top-to-bottom A on B, B on C, ..., N on O, O on left peg
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-disk F G)
    (on-disk G H)
    (on-disk H I)
    (on-disk I J)
    (on-disk J K)
    (on-disk K L)
    (on-disk L M)
    (on-disk M N)
    (on-disk N O)
    (on-peg O left)

    ;; Peg clear statuses: left has O on it (not clear), middle and right empty (clear)
    (clear-peg middle)
    (clear-peg right)
    ;; left is not clear -> omit clear-peg left

    ;; Disk clear statuses: only A is top-most initially
    (clear-disk A)
    ;; other disks are not clear initially

    ;; Agent move permissions: derived from agents' allowed disks (do not invent additional capabilities)
    ;; agent1 allowed to move disks A,B,C,D,E (as provided by the move list)
    (agent-can-move agent1 A)
    (agent-can-move agent1 B)
    (agent-can-move agent1 C)
    (agent-can-move agent1 D)
    (agent-can-move agent1 E)

    ;; agent2 allowed disks I,J,K,L,M,N,O (but none of these are top initially, so agent2 will have no legal move at start)
    (agent-can-move agent2 I)
    (agent-can-move agent2 J)
    (agent-can-move agent2 K)
    (agent-can-move agent2 L)
    (agent-can-move agent2 M)
    (agent-can-move agent2 N)
    (agent-can-move agent2 O)

    ;; Size ordering: A < B < C < D < E < F < G < H < I < J < K < L < M < N < O
    ;; We enumerate all pairwise smaller facts for strict ordering (transitive comparisons encoded explicitly)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J) (smaller A K) (smaller A L) (smaller A M) (smaller A N) (smaller A O)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J) (smaller B K) (smaller B L) (smaller B M) (smaller B N) (smaller B O)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J) (smaller C K) (smaller C L) (smaller C M) (smaller C N) (smaller C O)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J) (smaller D K) (smaller D L) (smaller D M) (smaller D N) (smaller D O)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J) (smaller E K) (smaller E L) (smaller E M) (smaller E N) (smaller E O)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J) (smaller F K) (smaller F L) (smaller F M) (smaller F N) (smaller F O)
    (smaller G H) (smaller G I) (smaller G J) (smaller G K) (smaller G L) (smaller G M) (smaller G N) (smaller G O)
    (smaller H I) (smaller H J) (smaller H K) (smaller H L) (smaller H M) (smaller H N) (smaller H O)
    (smaller I J) (smaller I K) (smaller I L) (smaller I M) (smaller I N) (smaller I O)
    (smaller J K) (smaller J L) (smaller J M) (smaller J N) (smaller J O)
    (smaller K L) (smaller K M) (smaller K N) (smaller K O)
    (smaller L M) (smaller L N) (smaller L O)
    (smaller M N) (smaller M O)
    (smaller N O)
  )

  (:goal (and
    ;; Goal stacking as specified:
    ;; Left peg top-to-bottom: B,F,G,H,I,J,K,L,M,N,O
    (on-disk B F)
    (on-disk F G)
    (on-disk G H)
    (on-disk H I)
    (on-disk I J)
    (on-disk J K)
    (on-disk K L)
    (on-disk L M)
    (on-disk M N)
    (on-disk N O)
    (on-peg O left)

    ;; Middle peg top-to-bottom: A,D
    (on-disk A D)
    (on-peg D middle)

    ;; Right peg top-to-bottom: C,E
    (on-disk C E)
    (on-peg E right)
  ))
)