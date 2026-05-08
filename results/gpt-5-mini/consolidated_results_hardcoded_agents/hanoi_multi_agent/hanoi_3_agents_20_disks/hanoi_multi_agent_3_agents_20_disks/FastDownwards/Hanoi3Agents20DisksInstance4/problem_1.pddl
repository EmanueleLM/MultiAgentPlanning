(define (problem hanoi-20-multi)
  (:domain hanoi-multi-agent)

  (:objects
    pegLeft pegMiddle pegRight - peg

    A B C D E F G - agent1-disk
    H I J K L M N - agent2-disk
    O P Q R S T - agent3-disk
  )

  (:init
    ;; Initial stack on pegLeft: top->bottom A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T
    (on A B) (on B C) (on C D) (on D E) (on E F) (on F G) (on G H) (on H I) (on I J) (on J K)
    (on K L) (on L M) (on M N) (on N O) (on O P) (on P Q) (on Q R) (on R S) (on S T) (on T pegLeft)

    ;; Pegs pegMiddle and pegRight are empty; top disk A is clear
    (clear A)
    (clear pegMiddle)
    (clear pegRight)

    ;; Size relations: disk smaller than any larger disk (transitive ordering by labels)
    ;; A smaller than B..T
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller A H) (smaller A I) (smaller A J) (smaller A K) (smaller A L) (smaller A M)
    (smaller A N) (smaller A O) (smaller A P) (smaller A Q) (smaller A R) (smaller A S)
    (smaller A T)
    ;; B smaller than C..T
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H)
    (smaller B I) (smaller B J) (smaller B K) (smaller B L) (smaller B M) (smaller B N)
    (smaller B O) (smaller B P) (smaller B Q) (smaller B R) (smaller B S) (smaller B T)
    ;; C
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I)
    (smaller C J) (smaller C K) (smaller C L) (smaller C M) (smaller C N) (smaller C O)
    (smaller C P) (smaller C Q) (smaller C R) (smaller C S) (smaller C T)
    ;; D
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    (smaller D K) (smaller D L) (smaller D M) (smaller D N) (smaller D O) (smaller D P)
    (smaller D Q) (smaller D R) (smaller D S) (smaller D T)
    ;; E
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J) (smaller E K)
    (smaller E L) (smaller E M) (smaller E N) (smaller E O) (smaller E P) (smaller E Q)
    (smaller E R) (smaller E S) (smaller E T)
    ;; F
    (smaller F G) (smaller F H) (smaller F I) (smaller F J) (smaller F K) (smaller F L)
    (smaller F M) (smaller F N) (smaller F O) (smaller F P) (smaller F Q) (smaller F R)
    (smaller F S) (smaller F T)
    ;; G
    (smaller G H) (smaller G I) (smaller G J) (smaller G K) (smaller G L) (smaller G M)
    (smaller G N) (smaller G O) (smaller G P) (smaller G Q) (smaller G R) (smaller G S)
    (smaller G T)
    ;; H
    (smaller H I) (smaller H J) (smaller H K) (smaller H L) (smaller H M) (smaller H N)
    (smaller H O) (smaller H P) (smaller H Q) (smaller H R) (smaller H S) (smaller H T)
    ;; I
    (smaller I J) (smaller I K) (smaller I L) (smaller I M) (smaller I N) (smaller I O)
    (smaller I P) (smaller I Q) (smaller I R) (smaller I S) (smaller I T)
    ;; J
    (smaller J K) (smaller J L) (smaller J M) (smaller J N) (smaller J O) (smaller J P)
    (smaller J Q) (smaller J R) (smaller J S) (smaller J T)
    ;; K
    (smaller K L) (smaller K M) (smaller K N) (smaller K O) (smaller K P) (smaller K Q)
    (smaller K R) (smaller K S) (smaller K T)
    ;; L
    (smaller L M) (smaller L N) (smaller L O) (smaller L P) (smaller L Q) (smaller L R)
    (smaller L S) (smaller L T)
    ;; M
    (smaller M N) (smaller M O) (smaller M P) (smaller M Q) (smaller M R) (smaller M S)
    (smaller M T)
    ;; N
    (smaller N O) (smaller N P) (smaller N Q) (smaller N R) (smaller N S) (smaller N T)
    ;; O
    (smaller O P) (smaller O Q) (smaller O R) (smaller O S) (smaller O T)
    ;; P
    (smaller P Q) (smaller P R) (smaller P S) (smaller P T)
    ;; Q
    (smaller Q R) (smaller Q S) (smaller Q T)
    ;; R
    (smaller R S) (smaller R T)
    ;; S
    (smaller S T)

    ;; Disks are smaller than pegs (allow moving onto empty peg)
    (smaller A pegLeft) (smaller A pegMiddle) (smaller A pegRight)
    (smaller B pegLeft) (smaller B pegMiddle) (smaller B pegRight)
    (smaller C pegLeft) (smaller C pegMiddle) (smaller C pegRight)
    (smaller D pegLeft) (smaller D pegMiddle) (smaller D pegRight)
    (smaller E pegLeft) (smaller E pegMiddle) (smaller E pegRight)
    (smaller F pegLeft) (smaller F pegMiddle) (smaller F pegRight)
    (smaller G pegLeft) (smaller G pegMiddle) (smaller G pegRight)
    (smaller H pegLeft) (smaller H pegMiddle) (smaller H pegRight)
    (smaller I pegLeft) (smaller I pegMiddle) (smaller I pegRight)
    (smaller J pegLeft) (smaller J pegMiddle) (smaller J pegRight)
    (smaller K pegLeft) (smaller K pegMiddle) (smaller K pegRight)
    (smaller L pegLeft) (smaller L pegMiddle) (smaller L pegRight)
    (smaller M pegLeft) (smaller M pegMiddle) (smaller M pegRight)
    (smaller N pegLeft) (smaller N pegMiddle) (smaller N pegRight)
    (smaller O pegLeft) (smaller O pegMiddle) (smaller O pegRight)
    (smaller P pegLeft) (smaller P pegMiddle) (smaller P pegRight)
    (smaller Q pegLeft) (smaller Q pegMiddle) (smaller Q pegRight)
    (smaller R pegLeft) (smaller R pegMiddle) (smaller R pegRight)
    (smaller S pegLeft) (smaller S pegMiddle) (smaller S pegRight)
    (smaller T pegLeft) (smaller T pegMiddle) (smaller T pegRight)
  )

  (:goal (and
    ;; Goal stacks:
    ;; Left peg (top->bottom): E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T
    (on E F) (on F G) (on G H) (on H I) (on I J) (on J K) (on K L) (on L M)
    (on M N) (on N O) (on O P) (on P Q) (on Q R) (on R S) (on S T) (on T pegLeft)

    ;; Middle peg: A (top only)
    (on A pegMiddle)

    ;; Right peg (top->bottom): B, C, D
    (on B C) (on C D) (on D pegRight)
  ))
)