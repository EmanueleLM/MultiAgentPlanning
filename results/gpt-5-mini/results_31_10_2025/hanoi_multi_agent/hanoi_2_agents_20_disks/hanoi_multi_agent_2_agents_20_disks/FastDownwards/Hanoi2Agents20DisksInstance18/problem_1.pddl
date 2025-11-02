(define (problem Hanoi2Agents20DisksInstance18)
  (:domain hanoi-2agents-20)

  (:objects
    A B C D E F G H I J K L M N O P Q R S T - disk
    left middle right - peg
  )

  (:init
    ;; agent permissions
    (can_move_a1 A) (can_move_a1 B) (can_move_a1 C) (can_move_a1 D) (can_move_a1 E)
    (can_move_a1 F) (can_move_a1 G) (can_move_a1 H) (can_move_a1 I) (can_move_a1 J)
    (can_move_a2 K) (can_move_a2 L) (can_move_a2 M) (can_move_a2 N) (can_move_a2 O)
    (can_move_a2 P) (can_move_a2 Q) (can_move_a2 R) (can_move_a2 S) (can_move_a2 T)

    ;; initial top and supports (initial left peg stack top->bottom: A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T)
    (top A left)
    (support_disk A B)
    (support_disk B C)
    (support_disk C D)
    (support_disk D E)
    (support_disk E F)
    (support_disk F G)
    (support_disk G H)
    (support_disk H I)
    (support_disk I J)
    (support_disk J K)
    (support_disk K L)
    (support_disk L M)
    (support_disk M N)
    (support_disk N O)
    (support_disk O P)
    (support_disk P Q)
    (support_disk Q R)
    (support_disk R S)
    (support_disk S T)
    (support_peg T left)

    ;; other pegs empty initially
    (empty middle)
    (empty right)

    ;; smaller relations (A is smallest, T largest). include all pairs where first is smaller than second
    ;; A smaller than B..T
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J) (smaller A K) (smaller A L) (smaller A M) (smaller A N) (smaller A O) (smaller A P) (smaller A Q) (smaller A R) (smaller A S) (smaller A T)
    ;; B smaller than C..T
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J) (smaller B K) (smaller B L) (smaller B M) (smaller B N) (smaller B O) (smaller B P) (smaller B Q) (smaller B R) (smaller B S) (smaller B T)
    ;; C smaller than D..T
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J) (smaller C K) (smaller C L) (smaller C M) (smaller C N) (smaller C O) (smaller C P) (smaller C Q) (smaller C R) (smaller C S) (smaller C T)
    ;; D smaller than E..T
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J) (smaller D K) (smaller D L) (smaller D M) (smaller D N) (smaller D O) (smaller D P) (smaller D Q) (smaller D R) (smaller D S) (smaller D T)
    ;; E smaller than F..T
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J) (smaller E K) (smaller E L) (smaller E M) (smaller E N) (smaller E O) (smaller E P) (smaller E Q) (smaller E R) (smaller E S) (smaller E T)
    ;; F smaller than G..T
    (smaller F G) (smaller F H) (smaller F I) (smaller F J) (smaller F K) (smaller F L) (smaller F M) (smaller F N) (smaller F O) (smaller F P) (smaller F Q) (smaller F R) (smaller F S) (smaller F T)
    ;; G smaller than H..T
    (smaller G H) (smaller G I) (smaller G J) (smaller G K) (smaller G L) (smaller G M) (smaller G N) (smaller G O) (smaller G P) (smaller G Q) (smaller G R) (smaller G S) (smaller G T)
    ;; H smaller than I..T
    (smaller H I) (smaller H J) (smaller H K) (smaller H L) (smaller H M) (smaller H N) (smaller H O) (smaller H P) (smaller H Q) (smaller H R) (smaller H S) (smaller H T)
    ;; I smaller than J..T
    (smaller I J) (smaller I K) (smaller I L) (smaller I M) (smaller I N) (smaller I O) (smaller I P) (smaller I Q) (smaller I R) (smaller I S) (smaller I T)
    ;; J smaller than K..T
    (smaller J K) (smaller J L) (smaller J M) (smaller J N) (smaller J O) (smaller J P) (smaller J Q) (smaller J R) (smaller J S) (smaller J T)
    ;; K smaller than L..T
    (smaller K L) (smaller K M) (smaller K N) (smaller K O) (smaller K P) (smaller K Q) (smaller K R) (smaller K S) (smaller K T)
    ;; L smaller than M..T
    (smaller L M) (smaller L N) (smaller L O) (smaller L P) (smaller L Q) (smaller L R) (smaller L S) (smaller L T)
    ;; M smaller than N..T
    (smaller M N) (smaller M O) (smaller M P) (smaller M Q) (smaller M R) (smaller M S) (smaller M T)
    ;; N smaller than O..T
    (smaller N O) (smaller N P) (smaller N Q) (smaller N R) (smaller N S) (smaller N T)
    ;; O smaller than P..T
    (smaller O P) (smaller O Q) (smaller O R) (smaller O S) (smaller O T)
    ;; P smaller than Q..T
    (smaller P Q) (smaller P R) (smaller P S) (smaller P T)
    ;; Q smaller than R..T
    (smaller Q R) (smaller Q S) (smaller Q T)
    ;; R smaller than S..T
    (smaller R S) (smaller R T)
    ;; S smaller than T
    (smaller S T)
  )

  (:goal
    (and
      ;; final top disks on pegs
      (top D left)
      (top C middle)
      (top A right)

      ;; final immediate supports for moved disks
      (support_disk A B)     ; A on B
      (support_peg B right)  ; B on right peg
      (support_peg C middle) ; C on middle peg

      ;; ensure previous supports under B and C have been changed (negations ensure they are no longer supporting them)
      (not (support_disk B C))
      (not (support_disk C D))

      ;; ensure the rest of the stack below D remains in original immediate-support chain
      (support_disk D E)
      (support_disk E F)
      (support_disk F G)
      (support_disk G H)
      (support_disk H I)
      (support_disk I J)
      (support_disk J K)
      (support_disk K L)
      (support_disk L M)
      (support_disk M N)
      (support_disk N O)
      (support_disk O P)
      (support_disk P Q)
      (support_disk Q R)
      (support_disk R S)
      (support_disk S T)
      (support_peg T left)
    )
  )
)