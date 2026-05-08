(define (problem hanoi-20-multiagent)
  (:domain hanoi-multiagent)
  (:objects
    A B C D E F G H I J K L M N O P Q R S T - disk
    left middle right - peg
    agent_1 agent_2 - agent
  )

  (:init
    ;; initial stack on left: top A on B, B on C, ..., S on T, and T on left-peg
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-disk F G)
    (on-disk G H)
    (on-disk H I)
    (on-disk I J)
    (on-disk J K)
    (on-disk K L)
    (on-disk L M)
    (on-disk M N)
    (on-disk N O)
    (on-disk O P)
    (on-disk P Q)
    (on-disk Q R)
    (on-disk R S)
    (on-disk S T)
    (on-peg T left)

    ;; clear facts: only the top disk A is clear; middle and right pegs are empty
    (clear-disk A)
    (clear-peg middle)
    (clear-peg right)

    ;; agent permissions: agent_1 may move; agent_2 is not granted permission (so cannot move)
    (can-move agent_1)

    ;; size ordering: smaller X Y when X is strictly smaller (earlier letter is smaller)
    ;; A < B..T
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
  )

  (:goal
    (and
      ;; final stack on right: T on right-peg, S on T, R on S, ..., B on C, A on B
      (on-peg T right)
      (on-disk S T)
      (on-disk R S)
      (on-disk Q R)
      (on-disk P Q)
      (on-disk O P)
      (on-disk N O)
      (on-disk M N)
      (on-disk L M)
      (on-disk K L)
      (on-disk J K)
      (on-disk I J)
      (on-disk H I)
      (on-disk G H)
      (on-disk F G)
      (on-disk E F)
      (on-disk D E)
      (on-disk C D)
      (on-disk B C)
      (on-disk A B)
      ;; top disk clear
      (clear-disk A)
    )
  )
)