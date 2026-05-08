(define (problem Hanoi3Agents20DisksInstance11)
  (:domain hanoi-3agents-20)
  (:objects
    left middle right - peg
    A B C D E F G H I J K L M N O P Q R S T - disk
  )

  (:init
    ; initial direct-support relations (top->bottom chain on left)
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
    (on T left)

    ; clear facts: only top disk A is clear and empty pegs middle/right are clear
    (clear A)
    (clear middle)
    (clear right)

    ; agent movement permissions (private capabilities made public for planner)
    (can_move_agent1 A) (can_move_agent1 B) (can_move_agent1 C) (can_move_agent1 D)
    (can_move_agent1 E) (can_move_agent1 F) (can_move_agent1 G)

    (can_move_agent2 H) (can_move_agent2 I) (can_move_agent2 J) (can_move_agent2 K)
    (can_move_agent2 L) (can_move_agent2 M) (can_move_agent2 N)

    (can_move_agent3 O) (can_move_agent3 P) (can_move_agent3 Q) (can_move_agent3 R)
    (can_move_agent3 S) (can_move_agent3 T)

    ; Legal stacking onto pegs (any disk may be placed onto any peg)
    (can_stack A left) (can_stack A middle) (can_stack A right)
    (can_stack B left) (can_stack B middle) (can_stack B right)
    (can_stack C left) (can_stack C middle) (can_stack C right)
    (can_stack D left) (can_stack D middle) (can_stack D right)
    (can_stack E left) (can_stack E middle) (can_stack E right)
    (can_stack F left) (can_stack F middle) (can_stack F right)
    (can_stack G left) (can_stack G middle) (can_stack G right)
    (can_stack H left) (can_stack H middle) (can_stack H right)
    (can_stack I left) (can_stack I middle) (can_stack I right)
    (can_stack J left) (can_stack J middle) (can_stack J right)
    (can_stack K left) (can_stack K middle) (can_stack K right)
    (can_stack L left) (can_stack L middle) (can_stack L right)
    (can_stack M left) (can_stack M middle) (can_stack M right)
    (can_stack N left) (can_stack N middle) (can_stack N right)
    (can_stack O left) (can_stack O middle) (can_stack O right)
    (can_stack P left) (can_stack P middle) (can_stack P right)
    (can_stack Q left) (can_stack Q middle) (can_stack Q right)
    (can_stack R left) (can_stack R middle) (can_stack R right)
    (can_stack S left) (can_stack S middle) (can_stack S right)
    (can_stack T left) (can_stack T middle) (can_stack T right)

    ; Legal stacking disk-on-disk where smaller disk may be placed on any larger disk
    ; A can be placed on any of B..T
    (can_stack A B) (can_stack A C) (can_stack A D) (can_stack A E) (can_stack A F)
    (can_stack A G) (can_stack A H) (can_stack A I) (can_stack A J) (can_stack A K)
    (can_stack A L) (can_stack A M) (can_stack A N) (can_stack A O) (can_stack A P)
    (can_stack A Q) (can_stack A R) (can_stack A S) (can_stack A T)

    ; B can be placed on C..T
    (can_stack B C) (can_stack B D) (can_stack B E) (can_stack B F)
    (can_stack B G) (can_stack B H) (can_stack B I) (can_stack B J) (can_stack B K)
    (can_stack B L) (can_stack B M) (can_stack B N) (can_stack B O) (can_stack B P)
    (can_stack B Q) (can_stack B R) (can_stack B S) (can_stack B T)

    ; C on D..T
    (can_stack C D) (can_stack C E) (can_stack C F) (can_stack C G)
    (can_stack C H) (can_stack C I) (can_stack C J) (can_stack C K) (can_stack C L)
    (can_stack C M) (can_stack C N) (can_stack C O) (can_stack C P) (can_stack C Q)
    (can_stack C R) (can_stack C S) (can_stack C T)

    ; D on E..T
    (can_stack D E) (can_stack D F) (can_stack D G) (can_stack D H)
    (can_stack D I) (can_stack D J) (can_stack D K) (can_stack D L) (can_stack D M)
    (can_stack D N) (can_stack D O) (can_stack D P) (can_stack D Q) (can_stack D R)
    (can_stack D S) (can_stack D T)

    ; E on F..T
    (can_stack E F) (can_stack E G) (can_stack E H) (can_stack E I)
    (can_stack E J) (can_stack E K) (can_stack E L) (can_stack E M) (can_stack E N)
    (can_stack E O) (can_stack E P) (can_stack E Q) (can_stack E R) (can_stack E S)
    (can_stack E T)

    ; F on G..T
    (can_stack F G) (can_stack F H) (can_stack F I) (can_stack F J)
    (can_stack F K) (can_stack F L) (can_stack F M) (can_stack F N) (can_stack F O)
    (can_stack F P) (can_stack F Q) (can_stack F R) (can_stack F S) (can_stack F T)

    ; G on H..T
    (can_stack G H) (can_stack G I) (can_stack G J) (can_stack G K)
    (can_stack G L) (can_stack G M) (can_stack G N) (can_stack G O) (can_stack G P)
    (can_stack G Q) (can_stack G R) (can_stack G S) (can_stack G T)

    ; H on I..T
    (can_stack H I) (can_stack H J) (can_stack H K) (can_stack H L)
    (can_stack H M) (can_stack H N) (can_stack H O) (can_stack H P) (can_stack H Q)
    (can_stack H R) (can_stack H S) (can_stack H T)

    ; I on J..T
    (can_stack I J) (can_stack I K) (can_stack I L) (can_stack I M)
    (can_stack I N) (can_stack I O) (can_stack I P) (can_stack I Q) (can_stack I R)
    (can_stack I S) (can_stack I T)

    ; J on K..T
    (can_stack J K) (can_stack J L) (can_stack J M) (can_stack J N)
    (can_stack J O) (can_stack J P) (can_stack J Q) (can_stack J R) (can_stack J S)
    (can_stack J T)

    ; K on L..T
    (can_stack K L) (can_stack K M) (can_stack K N) (can_stack K O)
    (can_stack K P) (can_stack K Q) (can_stack K R) (can_stack K S) (can_stack K T)

    ; L on M..T
    (can_stack L M) (can_stack L N) (can_stack L O) (can_stack L P)
    (can_stack L Q) (can_stack L R) (can_stack L S) (can_stack L T)

    ; M on N..T
    (can_stack M N) (can_stack M O) (can_stack M P) (can_stack M Q)
    (can_stack M R) (can_stack M S) (can_stack M T)

    ; N on O..T
    (can_stack N O) (can_stack N P) (can_stack N Q) (can_stack N R)
    (can_stack N S) (can_stack N T)

    ; O on P..T
    (can_stack O P) (can_stack O Q) (can_stack O R) (can_stack O S)
    (can_stack O T)

    ; P on Q..T
    (can_stack P Q) (can_stack P R) (can_stack P S) (can_stack P T)

    ; Q on R..T
    (can_stack Q R) (can_stack Q S) (can_stack Q T)

    ; R on S..T
    (can_stack R S) (can_stack R T)

    ; S on T
    (can_stack S T)
  )

  (:goal (and
    ;; Left peg must have (top->bottom) A, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T
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
    (on O P)
    (on P Q)
    (on Q R)
    (on R S)
    (on S T)
    (on T left)

    ;; Middle peg holds disk C (top->bottom C)
    (on C middle)

    ;; Right peg holds disk B (top->bottom B)
    (on B right)
  ))
)