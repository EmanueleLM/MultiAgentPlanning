(define (problem hanoi-multiagent-problem)
  (:domain hanoi-multiagent)

  (:objects
    A B C D E F G H I J - small
    K L M N O P Q R S T - large
    base-left base-middle base-right - disk
    left middle right - peg
  )

  (:init
    ;; initial immediate-above chain on the left peg (top-to-bottom A .. T then base-left)
    (above A B)
    (above B C)
    (above C D)
    (above D E)
    (above E F)
    (above F G)
    (above G H)
    (above H I)
    (above I J)
    (above J K)
    (above K L)
    (above L M)
    (above M N)
    (above N O)
    (above O P)
    (above P Q)
    (above Q R)
    (above R S)
    (above S T)
    (above T base-left)

    ;; initial top-of-peg facts
    (top A left)
    (top base-middle middle)
    (top base-right right)

    ;; size ordering: every smaller relation required to enforce legality of moves
    ;; A smaller than B..T and base sentinels
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J) (smaller A K) (smaller A L) (smaller A M) (smaller A N) (smaller A O) (smaller A P) (smaller A Q) (smaller A R) (smaller A S) (smaller A T)
    (smaller A base-left) (smaller A base-middle) (smaller A base-right)

    ;; B smaller than C..T and bases
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J) (smaller B K) (smaller B L) (smaller B M) (smaller B N) (smaller B O) (smaller B P) (smaller B Q) (smaller B R) (smaller B S) (smaller B T)
    (smaller B base-left) (smaller B base-middle) (smaller B base-right)

    ;; C smaller than D..T and bases
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J) (smaller C K) (smaller C L) (smaller C M) (smaller C N) (smaller C O) (smaller C P) (smaller C Q) (smaller C R) (smaller C S) (smaller C T)
    (smaller C base-left) (smaller C base-middle) (smaller C base-right)

    ;; D smaller than E..T and bases
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J) (smaller D K) (smaller D L) (smaller D M) (smaller D N) (smaller D O) (smaller D P) (smaller D Q) (smaller D R) (smaller D S) (smaller D T)
    (smaller D base-left) (smaller D base-middle) (smaller D base-right)

    ;; E smaller than F..T and bases
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J) (smaller E K) (smaller E L) (smaller E M) (smaller E N) (smaller E O) (smaller E P) (smaller E Q) (smaller E R) (smaller E S) (smaller E T)
    (smaller E base-left) (smaller E base-middle) (smaller E base-right)

    ;; F smaller than G..T and bases
    (smaller F G) (smaller F H) (smaller F I) (smaller F J) (smaller F K) (smaller F L) (smaller F M) (smaller F N) (smaller F O) (smaller F P) (smaller F Q) (smaller F R) (smaller F S) (smaller F T)
    (smaller F base-left) (smaller F base-middle) (smaller F base-right)

    ;; G smaller than H..T and bases
    (smaller G H) (smaller G I) (smaller G J) (smaller G K) (smaller G L) (smaller G M) (smaller G N) (smaller G O) (smaller G P) (smaller G Q) (smaller G R) (smaller G S) (smaller G T)
    (smaller G base-left) (smaller G base-middle) (smaller G base-right)

    ;; H smaller than I..T and bases
    (smaller H I) (smaller H J) (smaller H K) (smaller H L) (smaller H M) (smaller H N) (smaller H O) (smaller H P) (smaller H Q) (smaller H R) (smaller H S) (smaller H T)
    (smaller H base-left) (smaller H base-middle) (smaller H base-right)

    ;; I smaller than J..T and bases
    (smaller I J) (smaller I K) (smaller I L) (smaller I M) (smaller I N) (smaller I O) (smaller I P) (smaller I Q) (smaller I R) (smaller I S) (smaller I T)
    (smaller I base-left) (smaller I base-middle) (smaller I base-right)

    ;; J smaller than K..T and bases
    (smaller J K) (smaller J L) (smaller J M) (smaller J N) (smaller J O) (smaller J P) (smaller J Q) (smaller J R) (smaller J S) (smaller J T)
    (smaller J base-left) (smaller J base-middle) (smaller J base-right)

    ;; K smaller than L..T and bases
    (smaller K L) (smaller K M) (smaller K N) (smaller K O) (smaller K P) (smaller K Q) (smaller K R) (smaller K S) (smaller K T)
    (smaller K base-left) (smaller K base-middle) (smaller K base-right)

    ;; L smaller than M..T and bases
    (smaller L M) (smaller L N) (smaller L O) (smaller L P) (smaller L Q) (smaller L R) (smaller L S) (smaller L T)
    (smaller L base-left) (smaller L base-middle) (smaller L base-right)

    ;; M smaller than N..T and bases
    (smaller M N) (smaller M O) (smaller M P) (smaller M Q) (smaller M R) (smaller M S) (smaller M T)
    (smaller M base-left) (smaller M base-middle) (smaller M base-right)

    ;; N smaller than O..T and bases
    (smaller N O) (smaller N P) (smaller N Q) (smaller N R) (smaller N S) (smaller N T)
    (smaller N base-left) (smaller N base-middle) (smaller N base-right)

    ;; O smaller than P..T and bases
    (smaller O P) (smaller O Q) (smaller O R) (smaller O S) (smaller O T)
    (smaller O base-left) (smaller O base-middle) (smaller O base-right)

    ;; P smaller than Q..T and bases
    (smaller P Q) (smaller P R) (smaller P S) (smaller P T)
    (smaller P base-left) (smaller P base-middle) (smaller P base-right)

    ;; Q smaller than R..T and bases
    (smaller Q R) (smaller Q S) (smaller Q T)
    (smaller Q base-left) (smaller Q base-middle) (smaller Q base-right)

    ;; R smaller than S,T and bases
    (smaller R S) (smaller R T)
    (smaller R base-left) (smaller R base-middle) (smaller R base-right)

    ;; S smaller than T and bases
    (smaller S T)
    (smaller S base-left) (smaller S base-middle) (smaller S base-right)

    ;; T smaller than base sentinels
    (smaller T base-left) (smaller T base-middle) (smaller T base-right)
  )

  (:goal
    (and
      ;; Final left peg top-to-bottom: A E F G H I J K L M N O P Q R S T (then base-left)
      (top A left)
      (above A E)
      (above E F)
      (above F G)
      (above G H)
      (above H I)
      (above I J)
      (above J K)
      (above K L)
      (above L M)
      (above M N)
      (above N O)
      (above O P)
      (above P Q)
      (above Q R)
      (above R S)
      (above S T)
      (above T base-left)

      ;; Middle peg: D alone (on top of base-middle)
      (top D middle)
      (above D base-middle)

      ;; Right peg top-to-bottom: B C (then base-right)
      (top B right)
      (above B C)
      (above C base-right)
    )
  )
)