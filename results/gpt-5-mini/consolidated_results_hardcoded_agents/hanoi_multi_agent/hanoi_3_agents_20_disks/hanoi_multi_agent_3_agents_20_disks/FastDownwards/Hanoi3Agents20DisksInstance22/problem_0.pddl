(define (problem hanoi_20_3agent)
  (:domain hanoi_multiagent)
  (:objects
    A B C D E F G - disk_a
    H I J K L M N - disk_b
    O P Q R S T - disk_c
    peg_left peg_mid peg_right - peg
  )

  (:init
    ;; Initial "on" stack: top->bottom on left peg: A,B,C,...,T
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
    (on O P)
    (on P Q)
    (on Q R)
    (on R S)
    (on S T)
    (on T peg_left)

    ;; Initially, only the topmost disk and the two empty pegs are clear
    (clear A)
    (clear peg_mid)
    (clear peg_right)

    ;; Size ordering among disks (A smallest .. T largest)
    ;; A < B .. < T
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller A G) (smaller A H) (smaller A I) (smaller A J) (smaller A K)
    (smaller A L) (smaller A M) (smaller A N) (smaller A O) (smaller A P)
    (smaller A Q) (smaller A R) (smaller A S) (smaller A T)

    ;; B < C..T
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller B H) (smaller B I) (smaller B J) (smaller B K) (smaller B L)
    (smaller B M) (smaller B N) (smaller B O) (smaller B P) (smaller B Q)
    (smaller B R) (smaller B S) (smaller B T)

    ;; C < D..T
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H)
    (smaller C I) (smaller C J) (smaller C K) (smaller C L) (smaller C M)
    (smaller C N) (smaller C O) (smaller C P) (smaller C Q) (smaller C R)
    (smaller C S) (smaller C T)

    ;; D < E..T
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I)
    (smaller D J) (smaller D K) (smaller D L) (smaller D M) (smaller D N)
    (smaller D O) (smaller D P) (smaller D Q) (smaller D R) (smaller D S)
    (smaller D T)

    ;; E < F..T
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller E K) (smaller E L) (smaller E M) (smaller E N) (smaller E O)
    (smaller E P) (smaller E Q) (smaller E R) (smaller E S) (smaller E T)

    ;; F < G..T
    (smaller F G) (smaller F H) (smaller F I) (smaller F J) (smaller F K)
    (smaller F L) (smaller F M) (smaller F N) (smaller F O) (smaller F P)
    (smaller F Q) (smaller F R) (smaller F S) (smaller F T)

    ;; G < H..T
    (smaller G H) (smaller G I) (smaller G J) (smaller G K) (smaller G L)
    (smaller G M) (smaller G N) (smaller G O) (smaller G P) (smaller G Q)
    (smaller G R) (smaller G S) (smaller G T)

    ;; H < I..T
    (smaller H I) (smaller H J) (smaller H K) (smaller H L) (smaller H M)
    (smaller H N) (smaller H O) (smaller H P) (smaller H Q) (smaller H R)
    (smaller H S) (smaller H T)

    ;; I < J..T
    (smaller I J) (smaller I K) (smaller I L) (smaller I M) (smaller I N)
    (smaller I O) (smaller I P) (smaller I Q) (smaller I R) (smaller I S)
    (smaller I T)

    ;; J < K..T
    (smaller J K) (smaller J L) (smaller J M) (smaller J N) (smaller J O)
    (smaller J P) (smaller J Q) (smaller J R) (smaller J S) (smaller J T)

    ;; K < L..T
    (smaller K L) (smaller K M) (smaller K N) (smaller K O) (smaller K P)
    (smaller K Q) (smaller K R) (smaller K S) (smaller K T)

    ;; L < M..T
    (smaller L M) (smaller L N) (smaller L O) (smaller L P) (smaller L Q)
    (smaller L R) (smaller L S) (smaller L T)

    ;; M < N..T
    (smaller M N) (smaller M O) (smaller M P) (smaller M Q) (smaller M R)
    (smaller M S) (smaller M T)

    ;; N < O..T
    (smaller N O) (smaller N P) (smaller N Q) (smaller N R) (smaller N S)
    (smaller N T)

    ;; O < P..T
    (smaller O P) (smaller O Q) (smaller O R) (smaller O S) (smaller O T)

    ;; P < Q..T
    (smaller P Q) (smaller P R) (smaller P S) (smaller P T)

    ;; Q < R..T
    (smaller Q R) (smaller Q S) (smaller Q T)

    ;; R < S,T
    (smaller R S) (smaller R T)

    ;; S < T
    (smaller S T)

    ;; All disks are considered smaller than the pegs (pegs act as bottoms)
    (smaller A peg_left) (smaller A peg_mid) (smaller A peg_right)
    (smaller B peg_left) (smaller B peg_mid) (smaller B peg_right)
    (smaller C peg_left) (smaller C peg_mid) (smaller C peg_right)
    (smaller D peg_left) (smaller D peg_mid) (smaller D peg_right)
    (smaller E peg_left) (smaller E peg_mid) (smaller E peg_right)
    (smaller F peg_left) (smaller F peg_mid) (smaller F peg_right)
    (smaller G peg_left) (smaller G peg_mid) (smaller G peg_right)
    (smaller H peg_left) (smaller H peg_mid) (smaller H peg_right)
    (smaller I peg_left) (smaller I peg_mid) (smaller I peg_right)
    (smaller J peg_left) (smaller J peg_mid) (smaller J peg_right)
    (smaller K peg_left) (smaller K peg_mid) (smaller K peg_right)
    (smaller L peg_left) (smaller L peg_mid) (smaller L peg_right)
    (smaller M peg_left) (smaller M peg_mid) (smaller M peg_right)
    (smaller N peg_left) (smaller N peg_mid) (smaller N peg_right)
    (smaller O peg_left) (smaller O peg_mid) (smaller O peg_right)
    (smaller P peg_left) (smaller P peg_mid) (smaller P peg_right)
    (smaller Q peg_left) (smaller Q peg_mid) (smaller Q peg_right)
    (smaller R peg_left) (smaller R peg_mid) (smaller R peg_right)
    (smaller S peg_left) (smaller S peg_mid) (smaller S peg_right)
    (smaller T peg_left) (smaller T peg_mid) (smaller T peg_right)
  )

  (:goal (and
    ;; Left peg final stack (top->bottom): A, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T
    (on A E)
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
    (on O P)
    (on P Q)
    (on Q R)
    (on R S)
    (on S T)
    (on T peg_left)

    ;; Middle peg final stack (top->bottom): B, C, D
    (on B C)
    (on C D)
    (on D peg_mid)

    ;; Right peg empty (no disk directly on peg_right)
    (clear peg_right)
  ))
)