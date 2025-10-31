(define (problem hanoi3agents15disksinstance3)
  (:domain hanoi3agents15)
  (:objects
    a b c d e f g h i j k l m n o - disk
    left middle right - peg
  )
  (:init
    (at a left) (at b left) (at c left) (at d left) (at e left)
    (at f left) (at g left) (at h left) (at i left) (at j left)
    (at k left) (at l left) (at m left) (at n left) (at o left)
    (top a left)
    (empty middle)
    (empty right)
    (can_move_agent1 a) (can_move_agent1 b) (can_move_agent1 c) (can_move_agent1 d) (can_move_agent1 e)
    (can_move_agent2 f) (can_move_agent2 g) (can_move_agent2 h) (can_move_agent2 i) (can_move_agent2 j)
    (can_move_agent3 k) (can_move_agent3 l) (can_move_agent3 m) (can_move_agent3 n) (can_move_agent3 o)
  )
  (:goal (and
    (at a right)
    (at b left) (at c left) (at d left) (at e left)
    (at f left) (at g left) (at h left) (at i left) (at j left)
    (at k left) (at l left) (at m left) (at n left) (at o left)
    (empty middle)
  ))
)