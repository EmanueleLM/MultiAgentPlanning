(define (problem hanoi_20_multiagent)
  (:domain hanoi_multiagent)
  (:objects
    A B C D E F G H I J K L M N O P Q R S T - disk
    left middle right - peg
  )

  (:init
    ;; support chain (top->bottom on left): A on B, B on C, ... S on T, T on left
    (support A B)
    (support B C)
    (support C D)
    (support D E)
    (support E F)
    (support F G)
    (support G H)
    (support H I)
    (support I J)
    (support J K)
    (support K L)
    (support L M)
    (support M N)
    (support N O)
    (support O P)
    (support P Q)
    (support Q R)
    (support R S)
    (support S T)
    (support T left)

    ;; initial top and empty pegs
    (top left A)
    (empty middle)
    (empty right)

    ;; agent move permissions
    (can_move_agent1 A)
    (can_move_agent1 B)
    (can_move_agent1 C)
    (can_move_agent1 D)
    (can_move_agent1 E)
    (can_move_agent1 F)
    (can_move_agent1 G)

    (can_move_agent2 H)
    (can_move_agent2 I)
    (can_move_agent2 J)
    (can_move_agent2 K)
    (can_move_agent2 L)
    (can_move_agent2 M)
    (can_move_agent2 N)

    (can_move_agent3 O)
    (can_move_agent3 P)
    (can_move_agent3 Q)
    (can_move_agent3 R)
    (can_move_agent3 S)
    (can_move_agent3 T)

    ;; size relations (only those needed for this problem's moves)
    (smaller A B)
    (smaller A C)

    ;; Note: other pairwise 'smaller' relations can be added if a general solver run requires them.
  )

  ;; Goal: left peg top->bottom D..T, middle peg B, right peg top->bottom A,C
  ;; That corresponds to supports:
  ;; left: D on E, E on F, ..., S on T, T on left, and top(left)=D
  ;; middle: B on middle, top(middle)=B
  ;; right: A on C, C on right, top(right)=A

  (:goal (and
    ;; left chain
    (support D E)
    (support E F)
    (support F G)
    (support G H)
    (support H I)
    (support I J)
    (support J K)
    (support K L)
    (support L M)
    (support M N)
    (support N O)
    (support O P)
    (support P Q)
    (support Q R)
    (support R S)
    (support S T)
    (support T left)
    (top left D)

    ;; middle
    (support B middle)
    (top middle B)

    ;; right
    (support A C)
    (support C right)
    (top right A)
  ))
)