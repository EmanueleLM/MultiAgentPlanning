(define (problem hanoi15_agents_problem)
  (:domain hanoi_multiagent)
  (:objects
    A B C D E F G H I J K L M N O - disk
    left middle right - peg
  )

  (:init
    ;; initial positions: all disks on left (top to bottom A..O)
    (on A left) (on B left) (on C left) (on D left) (on E left)
    (on F left) (on G left) (on H left) (on I left) (on J left)
    (on K left) (on L left) (on M left) (on N left) (on O left)

    ;; Disk size ordering: explicitly list all pairs smaller < larger
    ;; A is smaller than B..O
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller A G) (smaller A H) (smaller A I) (smaller A J) (smaller A K)
    (smaller A L) (smaller A M) (smaller A N) (smaller A O)
    ;; B is smaller than C..O
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller B H) (smaller B I) (smaller B J) (smaller B K) (smaller B L)
    (smaller B M) (smaller B N) (smaller B O)
    ;; C < D..O
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H)
    (smaller C I) (smaller C J) (smaller C K) (smaller C L) (smaller C M)
    (smaller C N) (smaller C O)
    ;; D < E..O
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I)
    (smaller D J) (smaller D K) (smaller D L) (smaller D M) (smaller D N)
    (smaller D O)
    ;; E < F..O
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller E K) (smaller E L) (smaller E M) (smaller E N) (smaller E O)
    ;; F < G..O
    (smaller F G) (smaller F H) (smaller F I) (smaller F J) (smaller F K)
    (smaller F L) (smaller F M) (smaller F N) (smaller F O)
    ;; G < H..O
    (smaller G H) (smaller G I) (smaller G J) (smaller G K) (smaller G L)
    (smaller G M) (smaller G N) (smaller G O)
    ;; H < I..O
    (smaller H I) (smaller H J) (smaller H K) (smaller H L) (smaller H M)
    (smaller H N) (smaller H O)
    ;; I < J..O
    (smaller I J) (smaller I K) (smaller I L) (smaller I M) (smaller I N)
    (smaller I O)
    ;; J < K..O
    (smaller J K) (smaller J L) (smaller J M) (smaller J N) (smaller J O)
    ;; K < L..O
    (smaller K L) (smaller K M) (smaller K N) (smaller K O)
    ;; L < M..O
    (smaller L M) (smaller L N) (smaller L O)
    ;; M < N,O
    (smaller M N) (smaller M O)
    ;; N < O
    (smaller N O)

    ;; Note: agent2-enabled and agent3-enabled are intentionally NOT in the init.
    ;; This enforces the agents' proposals that agent_2 and agent_3 will not perform moves now.
  )

  (:goal (and
    ;; final required peg assignments (stack order implied by size constraints and legality of moves)
    ;; Left peg (top to bottom): F G H I J K L M N O  --> modelled as these disks on left
    (on F left) (on G left) (on H left) (on I left) (on J left)
    (on K left) (on L left) (on M left) (on N left) (on O left)

    ;; Middle peg (top to bottom): A E  --> modelled as A and E on middle
    (on A middle) (on E middle)

    ;; Right peg (top to bottom): B C D --> modelled as B, C, D on right
    (on B right) (on C right) (on D right)
  ))

)