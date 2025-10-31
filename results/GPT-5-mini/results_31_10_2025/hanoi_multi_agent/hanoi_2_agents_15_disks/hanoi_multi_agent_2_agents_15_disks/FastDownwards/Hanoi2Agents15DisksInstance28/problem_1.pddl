(define (problem Hanoi2Agents15DisksInstance28)
  (:domain hanoi-two-agent-15)
  (:objects
    left middle right - place
    A B C D E F G H I J K L M N O - disk
  )

  (:init
    ;; agent ownership
    (agent1 A) (agent1 B) (agent1 C) (agent1 D) (agent1 E) (agent1 F) (agent1 G) (agent1 H)
    (agent2 I) (agent2 J) (agent2 K) (agent2 L) (agent2 M) (agent2 N) (agent2 O)

    ;; initial immediate support relations (top->bottom on left peg: A,B,C,D,E,F,G,H,I,J,K,L,M,N,O)
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

    ;; clear facts: top of each stack / empty pegs; initially A is top, middle and right empty
    (clear A)
    (clear middle)
    (clear right)

    ;; size ordering (static): A < B < C < ... < O
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

  (:goal
    (and
      ;; left peg (top->bottom): A, C, F, G, H, I, J, K, L, M, N, O
      (on A C)
      (on C F)
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

      ;; middle peg: D
      (on D middle)

      ;; right peg (top->bottom): B, E
      (on B E)
      (on E right)
    )
  )
)