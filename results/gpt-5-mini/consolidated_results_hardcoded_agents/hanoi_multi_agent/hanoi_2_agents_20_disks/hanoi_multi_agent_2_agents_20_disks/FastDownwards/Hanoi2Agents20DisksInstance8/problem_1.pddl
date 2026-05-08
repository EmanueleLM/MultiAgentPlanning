(define (problem hanoi_coop_2agents20_problem)
  (:domain hanoi_coop_2agents20)

  (:objects
    A B C D E F G H I J K L M N O P Q R S T - disk
    left middle right - peg
  )

  (:init
    ;; initial stack on left, top->bottom: A B C D E F G H I J K L M N O P Q R S T
    (on_disk A B)
    (on_disk B C)
    (on_disk C D)
    (on_disk D E)
    (on_disk E F)
    (on_disk F G)
    (on_disk G H)
    (on_disk H I)
    (on_disk I J)
    (on_disk J K)
    (on_disk K L)
    (on_disk L M)
    (on_disk M N)
    (on_disk N O)
    (on_disk O P)
    (on_disk P Q)
    (on_disk Q R)
    (on_disk R S)
    (on_disk S T)
    (on_peg T left)

    ;; clear facts: top disk A is clear, other disks with something on them are not clear
    (clear_disk A)

    ;; middle and right pegs empty initially
    (clear_peg middle)
    (clear_peg right)

    ;; disk size ordering: declare smaller facts for all strict pairs (A < B < ... < T)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J) (smaller A K) (smaller A L) (smaller A M) (smaller A N) (smaller A O) (smaller A P) (smaller A Q) (smaller A R) (smaller A S) (smaller A T)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J) (smaller B K) (smaller B L) (smaller B M) (smaller B N) (smaller B O) (smaller B P) (smaller B Q) (smaller B R) (smaller B S) (smaller B T)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J) (smaller C K) (smaller C L) (smaller C M) (smaller C N) (smaller C O) (smaller C P) (smaller C Q) (smaller C R) (smaller C S) (smaller C T)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J) (smaller D K) (smaller D L) (smaller D M) (smaller D N) (smaller D O) (smaller D P) (smaller D Q) (smaller D R) (smaller D S) (smaller D T)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J) (smaller E K) (smaller E L) (smaller E M) (smaller E N) (smaller E O) (smaller E P) (smaller E Q) (smaller E R) (smaller E S) (smaller E T)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J) (smaller F K) (smaller F L) (smaller F M) (smaller F N) (smaller F O) (smaller F P) (smaller F Q) (smaller F R) (smaller F S) (smaller F T)
    (smaller G H) (smaller G I) (smaller G J) (smaller G K) (smaller G L) (smaller G M) (smaller G N) (smaller G O) (smaller G P) (smaller G Q) (smaller G R) (smaller G S) (smaller G T)
    (smaller H I) (smaller H J) (smaller H K) (smaller H L) (smaller H M) (smaller H N) (smaller H O) (smaller H P) (smaller H Q) (smaller H R) (smaller H S) (smaller H T)
    (smaller I J) (smaller I K) (smaller I L) (smaller I M) (smaller I N) (smaller I O) (smaller I P) (smaller I Q) (smaller I R) (smaller I S) (smaller I T)
    (smaller J K) (smaller J L) (smaller J M) (smaller J N) (smaller J O) (smaller J P) (smaller J Q) (smaller J R) (smaller J S) (smaller J T)
    (smaller K L) (smaller K M) (smaller K N) (smaller K O) (smaller K P) (smaller K Q) (smaller K R) (smaller K S) (smaller K T)
    (smaller L M) (smaller L N) (smaller L O) (smaller L P) (smaller L Q) (smaller L R) (smaller L S) (smaller L T)
    (smaller M N) (smaller M O) (smaller M P) (smaller M Q) (smaller M R) (smaller M S) (smaller M T)
    (smaller N O) (smaller N P) (smaller N Q) (smaller N R) (smaller N S) (smaller N T)
    (smaller O P) (smaller O Q) (smaller O R) (smaller O S) (smaller O T)
    (smaller P Q) (smaller P R) (smaller P S) (smaller P T)
    (smaller Q R) (smaller Q S) (smaller Q T)
    (smaller R S) (smaller R T)
    (smaller S T)

    ;; agent permissions: agent_1 can move A..J, agent_2 can move K..T
    (allowed_agent_1 A) (allowed_agent_1 B) (allowed_agent_1 C) (allowed_agent_1 D) (allowed_agent_1 E) (allowed_agent_1 F) (allowed_agent_1 G) (allowed_agent_1 H) (allowed_agent_1 I) (allowed_agent_1 J)
    (allowed_agent_2 K) (allowed_agent_2 L) (allowed_agent_2 M) (allowed_agent_2 N) (allowed_agent_2 O) (allowed_agent_2 P) (allowed_agent_2 Q) (allowed_agent_2 R) (allowed_agent_2 S) (allowed_agent_2 T)
  )

  (:goal (and
    ;; left peg final stack top->bottom: A, C, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T
    (on_disk A C)
    (on_disk C E)
    (on_disk E F)
    (on_disk F G)
    (on_disk G H)
    (on_disk H I)
    (on_disk I J)
    (on_disk J K)
    (on_disk K L)
    (on_disk L M)
    (on_disk M N)
    (on_disk N O)
    (on_disk O P)
    (on_disk P Q)
    (on_disk Q R)
    (on_disk R S)
    (on_disk S T)
    (on_peg T left)

    ;; middle peg has D
    (on_peg D middle)

    ;; right peg has B
    (on_peg B right)
  ))
)