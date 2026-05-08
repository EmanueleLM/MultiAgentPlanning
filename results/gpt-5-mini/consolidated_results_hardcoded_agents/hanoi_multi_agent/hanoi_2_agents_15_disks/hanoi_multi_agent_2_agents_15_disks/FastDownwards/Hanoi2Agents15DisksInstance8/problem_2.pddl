(define (problem Hanoi2Agents15DisksInstance8)
  (:domain hanoi_multi_agent)

  (:objects
    A B C D E F G H I J K L M N O
    left middle right
  )

  (:init
    ;; Initial stack on left: top -> bottom A B C D E F G H I J K L M N O
    (on A left)
    (on B A)
    (on C B)
    (on D C)
    (on E D)
    (on F E)
    (on G F)
    (on H G)
    (on I H)
    (on J I)
    (on K J)
    (on L K)
    (on M L)
    (on N M)
    (on O N)

    ;; clear predicates: only top disk A is clear, middle and right pegs are clear
    (clear A)
    (clear middle)
    (clear right)

    ;; agent permissions
    (allowed_agent1 A)
    (allowed_agent1 B)
    (allowed_agent1 C)
    (allowed_agent1 D)
    (allowed_agent1 E)
    (allowed_agent1 F)
    (allowed_agent1 G)
    (allowed_agent1 H)

    (allowed_agent2 I)
    (allowed_agent2 J)
    (allowed_agent2 K)
    (allowed_agent2 L)
    (allowed_agent2 M)
    (allowed_agent2 N)
    (allowed_agent2 O)

    ;; size ordering: smaller X Y when X is strictly smaller than Y (A < B < ... < O)
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

  (:goal (and
    ;; Left peg goal: top->bottom B F G H I J K L M N O
    (on B left)
    (on F B)
    (on G F)
    (on H G)
    (on I H)
    (on J I)
    (on K J)
    (on L K)
    (on M L)
    (on N M)
    (on O N)

    ;; Middle peg goal: top->bottom A D
    (on A middle)
    (on D A)

    ;; Right peg goal: top->bottom C E
    (on C right)
    (on E C)
  ))
)