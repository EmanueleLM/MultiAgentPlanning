(define (problem Hanoi3Agents15DisksInstance12)
  (:domain hanoi_multiagent)

  (:objects
    A B C D E F G H I J K L M N O - disk
    pegL pegM pegR - peg
  )

  (:init
    ;; initial stack on left, top->bottom: A,B,C,D,E,F,G,H,I,J,K,L,M,N,O
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
    (on O pegL)

    ;; top supports are clear: top disk A, and empty pegs pegM and pegR
    (clear A)
    (clear pegM)
    (clear pegR)

    ;; agent move permissions
    (can_move_agent1 A)
    (can_move_agent1 B)
    (can_move_agent1 C)
    (can_move_agent1 D)
    (can_move_agent1 E)

    (can_move_agent2 F)
    (can_move_agent2 G)
    (can_move_agent2 H)
    (can_move_agent2 I)
    (can_move_agent2 J)

    (can_move_agent3 K)
    (can_move_agent3 L)
    (can_move_agent3 M)
    (can_move_agent3 N)
    (can_move_agent3 O)

    ;; size relations (smaller x y means x is smaller than y)
    ;; A smaller than B..O
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J) (smaller A K) (smaller A L) (smaller A M) (smaller A N) (smaller A O)
    ;; B smaller than C..O
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J) (smaller B K) (smaller B L) (smaller B M) (smaller B N) (smaller B O)
    ;; C smaller than D..O
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J) (smaller C K) (smaller C L) (smaller C M) (smaller C N) (smaller C O)
    ;; D smaller than E..O
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J) (smaller D K) (smaller D L) (smaller D M) (smaller D N) (smaller D O)
    ;; E smaller than F..O
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J) (smaller E K) (smaller E L) (smaller E M) (smaller E N) (smaller E O)
    ;; F smaller than G..O
    (smaller F G) (smaller F H) (smaller F I) (smaller F J) (smaller F K) (smaller F L) (smaller F M) (smaller F N) (smaller F O)
    ;; G smaller than H..O
    (smaller G H) (smaller G I) (smaller G J) (smaller G K) (smaller G L) (smaller G M) (smaller G N) (smaller G O)
    ;; H smaller than I..O
    (smaller H I) (smaller H J) (smaller H K) (smaller H L) (smaller H M) (smaller H N) (smaller H O)
    ;; I smaller than J..O
    (smaller I J) (smaller I K) (smaller I L) (smaller I M) (smaller I N) (smaller I O)
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

  (:goal
    (and
      ;; Left peg (top-to-bottom): C, E, F, G, H, I, J, K, L, M, N, O
      (on C E)
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
      (on O pegL)

      ;; Middle peg (top-to-bottom): A, D
      (on A D)
      (on D pegM)

      ;; Right peg (top-to-bottom): B
      (on B pegR)
    )
  )
)