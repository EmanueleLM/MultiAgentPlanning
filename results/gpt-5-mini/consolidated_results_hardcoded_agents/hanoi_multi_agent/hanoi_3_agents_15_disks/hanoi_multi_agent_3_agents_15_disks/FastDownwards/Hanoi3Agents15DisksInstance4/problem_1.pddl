(define (problem hanoi-15-multiagent-instance4)
  (:domain hanoi-multiagent)
  (:objects
    ;; peg bases represented as special disks (always larger than real disks)
    pegLeftBase pegMiddleBase pegRightBase - peg_base

    ;; movable disks, typed by agent permission sets
    A B C D E - disk_a_e
    F G H I J - disk_f_j
    K L M N O - disk_k_o
  )

  (:init
    ;; initial stack on left peg base (top -> bottom): A, B, C, D, E, F, G, H, I, J, K, L, M, N, O
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
    (on O pegLeftBase)

    ;; peg bases middle and right start empty (no disk on them) => they are clear
    (clear pegLeftBase)    ;; peg base has no disk on top below O initially? pegLeftBase has O on it so not clear; keep consistency: pegLeftBase has O on it, so not clear -- remove this line
    ;; Correction: pegLeftBase has O on it, so it is not clear. Only pegs without disks are clear:
    ;; (clear pegLeftBase) omitted
    (clear pegMiddleBase)
    (clear pegRightBase)

    ;; top disk A is clear (no disk on top of it)
    (clear A)
    ;; other disks are not listed as clear initially (they have disks above them)

    ;; static size relations: smaller X Y when X is smaller than Y
    ;; A < B..O
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J) (smaller A K) (smaller A L) (smaller A M) (smaller A N) (smaller A O) (smaller A pegLeftBase) (smaller A pegMiddleBase) (smaller A pegRightBase)
    ;; B < C..O and pegs
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J) (smaller B K) (smaller B L) (smaller B M) (smaller B N) (smaller B O) (smaller B pegLeftBase) (smaller B pegMiddleBase) (smaller B pegRightBase)
    ;; C < D..O and pegs
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J) (smaller C K) (smaller C L) (smaller C M) (smaller C N) (smaller C O) (smaller C pegLeftBase) (smaller C pegMiddleBase) (smaller C pegRightBase)
    ;; D < E..O and pegs
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J) (smaller D K) (smaller D L) (smaller D M) (smaller D N) (smaller D O) (smaller D pegLeftBase) (smaller D pegMiddleBase) (smaller D pegRightBase)
    ;; E < F..O and pegs
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J) (smaller E K) (smaller E L) (smaller E M) (smaller E N) (smaller E O) (smaller E pegLeftBase) (smaller E pegMiddleBase) (smaller E pegRightBase)
    ;; F < G..O and pegs
    (smaller F G) (smaller F H) (smaller F I) (smaller F J) (smaller F K) (smaller F L) (smaller F M) (smaller F N) (smaller F O) (smaller F pegLeftBase) (smaller F pegMiddleBase) (smaller F pegRightBase)
    ;; G < H..O and pegs
    (smaller G H) (smaller G I) (smaller G J) (smaller G K) (smaller G L) (smaller G M) (smaller G N) (smaller G O) (smaller G pegLeftBase) (smaller G pegMiddleBase) (smaller G pegRightBase)
    ;; H < I..O and pegs
    (smaller H I) (smaller H J) (smaller H K) (smaller H L) (smaller H M) (smaller H N) (smaller H O) (smaller H pegLeftBase) (smaller H pegMiddleBase) (smaller H pegRightBase)
    ;; I < J..O and pegs
    (smaller I J) (smaller I K) (smaller I L) (smaller I M) (smaller I N) (smaller I O) (smaller I pegLeftBase) (smaller I pegMiddleBase) (smaller I pegRightBase)
    ;; J < K..O and pegs
    (smaller J K) (smaller J L) (smaller J M) (smaller J N) (smaller J O) (smaller J pegLeftBase) (smaller J pegMiddleBase) (smaller J pegRightBase)
    ;; K < L..O and pegs
    (smaller K L) (smaller K M) (smaller K N) (smaller K O) (smaller K pegLeftBase) (smaller K pegMiddleBase) (smaller K pegRightBase)
    ;; L < M..O and pegs
    (smaller L M) (smaller L N) (smaller L O) (smaller L pegLeftBase) (smaller L pegMiddleBase) (smaller L pegRightBase)
    ;; M < N,O and pegs
    (smaller M N) (smaller M O) (smaller M pegLeftBase) (smaller M pegMiddleBase) (smaller M pegRightBase)
    ;; N < O and pegs
    (smaller N O) (smaller N pegLeftBase) (smaller N pegMiddleBase) (smaller N pegRightBase)
    ;; O < peg bases (peg bases are larger than all real disks)
    (smaller O pegLeftBase) (smaller O pegMiddleBase) (smaller O pegRightBase)
  )

  (:goal (and
    ;; left peg should hold, top->bottom: D, E, F, G, H, I, J, K, L, M, N, O
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
    (on O pegLeftBase)

    ;; middle peg should hold top A
    (on A pegMiddleBase)

    ;; right peg should hold top->bottom B, C
    (on B C)
    (on C pegRightBase)
  ))
)