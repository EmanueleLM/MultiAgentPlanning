(define (problem hanoi15-multiagent)
  (:domain hanoi-multiagent)
  (:objects
    agent_1 agent_2 - agent
    A B C D E F G H I J K L M N O - disk
    left middle right - peg
  )

  (:init
    ;; Initial stack on left: top->bottom A,B,C,D,E,F,G,H,I,J,K,L,M,N,O
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

    ;; Pegs middle and right are empty
    (clear A)
    (clear middle)
    (clear right)

    ;; Agent move capabilities (hard constraints)
    ;; agent_1 may move A through H
    (can-move agent_1 A)
    (can-move agent_1 B)
    (can-move agent_1 C)
    (can-move agent_1 D)
    (can-move agent_1 E)
    (can-move agent_1 F)
    (can-move agent_1 G)
    (can-move agent_1 H)

    ;; agent_2 may move I through O
    (can-move agent_2 I)
    (can-move agent_2 J)
    (can-move agent_2 K)
    (can-move agent_2 L)
    (can-move agent_2 M)
    (can-move agent_2 N)
    (can-move agent_2 O)

    ;; Size relations: a disk is smaller than any peg (so moving onto an empty peg allowed),
    ;; and smaller than any larger disk. We enumerate all necessary static pairs.

    ;; Disk-to-peg (every disk smaller than each peg)
    (smaller A left) (smaller A middle) (smaller A right)
    (smaller B left) (smaller B middle) (smaller B right)
    (smaller C left) (smaller C middle) (smaller C right)
    (smaller D left) (smaller D middle) (smaller D right)
    (smaller E left) (smaller E middle) (smaller E right)
    (smaller F left) (smaller F middle) (smaller F right)
    (smaller G left) (smaller G middle) (smaller G right)
    (smaller H left) (smaller H middle) (smaller H right)
    (smaller I left) (smaller I middle) (smaller I right)
    (smaller J left) (smaller J middle) (smaller J right)
    (smaller K left) (smaller K middle) (smaller K right)
    (smaller L left) (smaller L middle) (smaller L right)
    (smaller M left) (smaller M middle) (smaller M right)
    (smaller N left) (smaller N middle) (smaller N right)
    (smaller O left) (smaller O middle) (smaller O right)

    ;; Disk-to-disk relations (A < B < C < ... < O)
    ;; A smaller than B..O
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
    ;; Goal stacks:
    ;; left peg top->bottom A,D,E,F,G,H,I,J,K,L,M,N,O
    (on A D)
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

    ;; middle peg top->bottom B,C
    (on B C)
    (on C middle)

    ;; right peg empty (expressed by being clear)
    (clear right)

    ;; top disks are clear
    (clear A)
    (clear B)
  ))
)