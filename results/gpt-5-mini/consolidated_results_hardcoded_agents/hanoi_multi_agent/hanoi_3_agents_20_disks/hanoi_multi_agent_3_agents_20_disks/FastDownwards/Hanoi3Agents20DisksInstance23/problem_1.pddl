(define (problem Hanoi3Agents20DisksInstance23)
  (:domain hanoi_multiagent)

  (:objects
    A B C D E F G H I J K L M N O P Q R S T - disk
    left middle right - peg
    agent_1 agent_2 agent_3 - agent
  )

  (:init
    ;; initial "on" relations (top -> bottom on left peg: A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T)
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
    (on P O)
    (on Q P)
    (on R Q)
    (on S R)
    (on T S)

    ;; clear facts: only the top disk of the initial left stack and empty pegs are clear
    (clear A)
    (clear middle)
    (clear right)

    ;; size ordering facts (static) A < B < C < ... < T
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller A H) (smaller A I) (smaller A J) (smaller A K) (smaller A L) (smaller A M)
    (smaller A N) (smaller A O) (smaller A P) (smaller A Q) (smaller A R) (smaller A S) (smaller A T)

    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller B H) (smaller B I) (smaller B J) (smaller B K) (smaller B L) (smaller B M)
    (smaller B N) (smaller B O) (smaller B P) (smaller B Q) (smaller B R) (smaller B S) (smaller B T)

    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller C H) (smaller C I) (smaller C J) (smaller C K) (smaller C L) (smaller C M)
    (smaller C N) (smaller C O) (smaller C P) (smaller C Q) (smaller C R) (smaller C S) (smaller C T)

    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    (smaller D K) (smaller D L) (smaller D M) (smaller D N) (smaller D O) (smaller D P)
    (smaller D Q) (smaller D R) (smaller D S) (smaller D T)

    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J) (smaller E K)
    (smaller E L) (smaller E M) (smaller E N) (smaller E O) (smaller E P) (smaller E Q)
    (smaller E R) (smaller E S) (smaller E T)

    (smaller F G) (smaller F H) (smaller F I) (smaller F J) (smaller F K) (smaller F L)
    (smaller F M) (smaller F N) (smaller F O) (smaller F P) (smaller F Q) (smaller F R)
    (smaller F S) (smaller F T)

    (smaller G H) (smaller G I) (smaller G J) (smaller G K) (smaller G L) (smaller G M)
    (smaller G N) (smaller G O) (smaller G P) (smaller G Q) (smaller G R) (smaller G S)
    (smaller G T)

    (smaller H I) (smaller H J) (smaller H K) (smaller H L) (smaller H M) (smaller H N)
    (smaller H O) (smaller H P) (smaller H Q) (smaller H R) (smaller H S) (smaller H T)

    (smaller I J) (smaller I K) (smaller I L) (smaller I M) (smaller I N) (smaller I O)
    (smaller I P) (smaller I Q) (smaller I R) (smaller I S) (smaller I T)

    (smaller J K) (smaller J L) (smaller J M) (smaller J N) (smaller J O) (smaller J P)
    (smaller J Q) (smaller J R) (smaller J S) (smaller J T)

    (smaller K L) (smaller K M) (smaller K N) (smaller K O) (smaller K P) (smaller K Q)
    (smaller K R) (smaller K S) (smaller K T)

    (smaller L M) (smaller L N) (smaller L O) (smaller L P) (smaller L Q) (smaller L R)
    (smaller L S) (smaller L T)

    (smaller M N) (smaller M O) (smaller M P) (smaller M Q) (smaller M R) (smaller M S)
    (smaller M T)

    (smaller N O) (smaller N P) (smaller N Q) (smaller N R) (smaller N S) (smaller N T)

    (smaller O P) (smaller O Q) (smaller O R) (smaller O S) (smaller O T)

    (smaller P Q) (smaller P R) (smaller P S) (smaller P T)

    (smaller Q R) (smaller Q S) (smaller Q T)

    (smaller R S) (smaller R T)

    (smaller S T)

    ;; agent capabilities
    (agent-can-move agent_1 A) (agent-can-move agent_1 B) (agent-can-move agent_1 C)
    (agent-can-move agent_1 D) (agent-can-move agent_1 E) (agent-can-move agent_1 F)
    (agent-can-move agent_1 G)

    (agent-can-move agent_2 H) (agent-can-move agent_2 I) (agent-can-move agent_2 J)
    (agent-can-move agent_2 K) (agent-can-move agent_2 L) (agent-can-move agent_2 M)
    (agent-can-move agent_2 N)

    (agent-can-move agent_3 O) (agent-can-move agent_3 P) (agent-can-move agent_3 Q)
    (agent-can-move agent_3 R) (agent-can-move agent_3 S) (agent-can-move agent_3 T)

    ;; can-place facts: disk may be placed on any peg
    (can-place A left) (can-place A middle) (can-place A right)
    (can-place B left) (can-place B middle) (can-place B right)
    (can-place C left) (can-place C middle) (can-place C right)
    (can-place D left) (can-place D middle) (can-place D right)
    (can-place E left) (can-place E middle) (can-place E right)
    (can-place F left) (can-place F middle) (can-place F right)
    (can-place G left) (can-place G middle) (can-place G right)
    (can-place H left) (can-place H middle) (can-place H right)
    (can-place I left) (can-place I middle) (can-place I right)
    (can-place J left) (can-place J middle) (can-place J right)
    (can-place K left) (can-place K middle) (can-place K right)
    (can-place L left) (can-place L middle) (can-place L right)
    (can-place M left) (can-place M middle) (can-place M right)
    (can-place N left) (can-place N middle) (can-place N right)
    (can-place O left) (can-place O middle) (can-place O right)
    (can-place P left) (can-place P middle) (can-place P right)
    (can-place Q left) (can-place Q middle) (can-place Q right)
    (can-place R left) (can-place R middle) (can-place R right)
    (can-place S left) (can-place S middle) (can-place S right)
    (can-place T left) (can-place T middle) (can-place T right)

    ;; can-place disk on a larger disk (consistent with smaller facts)
    ;; A can be placed on any disk larger than A
    (can-place A B) (can-place A C) (can-place A D) (can-place A E) (can-place A F) (can-place A G)
    (can-place A H) (can-place A I) (can-place A J) (can-place A K) (can-place A L) (can-place A M)
    (can-place A N) (can-place A O) (can-place A P) (can-place A Q) (can-place A R) (can-place A S) (can-place A T)

    ;; B on larger
    (can-place B C) (can-place B D) (can-place B E) (can-place B F) (can-place B G)
    (can-place B H) (can-place B I) (can-place B J) (can-place B K) (can-place B L) (can-place B M)
    (can-place B N) (can-place B O) (can-place B P) (can-place B Q) (can-place B R) (can-place B S) (can-place B T)

    ;; C on larger
    (can-place C D) (can-place C E) (can-place C F) (can-place C G)
    (can-place C H) (can-place C I) (can-place C J) (can-place C K) (can-place C L) (can-place C M)
    (can-place C N) (can-place C O) (can-place C P) (can-place C Q) (can-place C R) (can-place C S) (can-place C T)

    ;; D on larger
    (can-place D E) (can-place D F) (can-place D G) (can-place D H) (can-place D I) (can-place D J)
    (can-place D K) (can-place D L) (can-place D M) (can-place D N) (can-place D O) (can-place D P)
    (can-place D Q) (can-place D R) (can-place D S) (can-place D T)

    ;; E on larger
    (can-place E F) (can-place E G) (can-place E H) (can-place E I) (can-place E J) (can-place E K)
    (can-place E L) (can-place E M) (can-place E N) (can-place E O) (can-place E P) (can-place E Q)
    (can-place E R) (can-place E S) (can-place E T)

    ;; F on larger
    (can-place F G) (can-place F H) (can-place F I) (can-place F J) (can-place F K) (can-place F L)
    (can-place F M) (can-place F N) (can-place F O) (can-place F P) (can-place F Q) (can-place F R)
    (can-place F S) (can-place F T)

    ;; G on larger
    (can-place G H) (can-place G I) (can-place G J) (can-place G K) (can-place G L) (can-place G M)
    (can-place G N) (can-place G O) (can-place G P) (can-place G Q) (can-place G R) (can-place G S)
    (can-place G T)

    ;; H on larger
    (can-place H I) (can-place H J) (can-place H K) (can-place H L) (can-place H M) (can-place H N)
    (can-place H O) (can-place H P) (can-place H Q) (can-place H R) (can-place H S) (can-place H T)

    ;; I on larger
    (can-place I J) (can-place I K) (can-place I L) (can-place I M) (can-place I N) (can-place I O)
    (can-place I P) (can-place I Q) (can-place I R) (can-place I S) (can-place I T)

    ;; J on larger
    (can-place J K) (can-place J L) (can-place J M) (can-place J N) (can-place J O) (can-place J P)
    (can-place J Q) (can-place J R) (can-place J S) (can-place J T)

    ;; K on larger
    (can-place K L) (can-place K M) (can-place K N) (can-place K O) (can-place K P) (can-place K Q)
    (can-place K R) (can-place K S) (can-place K T)

    ;; L on larger
    (can-place L M) (can-place L N) (can-place L O) (can-place L P) (can-place L Q) (can-place L R)
    (can-place L S) (can-place L T)

    ;; M on larger
    (can-place M N) (can-place M O) (can-place M P) (can-place M Q) (can-place M R) (can-place M S)
    (can-place M T)

    ;; N on larger
    (can-place N O) (can-place N P) (can-place N Q) (can-place N R) (can-place N S) (can-place N T)

    ;; O on larger
    (can-place O P) (can-place O Q) (can-place O R) (can-place O S) (can-place O T)

    ;; P on larger
    (can-place P Q) (can-place P R) (can-place P S) (can-place P T)

    ;; Q on larger
    (can-place Q R) (can-place Q S) (can-place Q T)

    ;; R on larger
    (can-place R S) (can-place R T)

    ;; S on larger
    (can-place S T)
  )

  (:goal
    (and
      ;; Left peg goal stack (top -> bottom): B, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T
      (on B left)
      (on E B) (on F E) (on G F) (on H G) (on I H) (on J I) (on K J) (on L K)
      (on M L) (on N M) (on O N) (on P O) (on Q P) (on R Q) (on S R) (on T S)

      ;; Middle peg: A on middle
      (on A middle)

      ;; Right peg: C on top of D
      (on C right)
      (on D C)
    )
  )
)