(define (problem Hanoi3Agents15DisksInstance3)
  (:domain Hanoi3Agents15)
  (:objects
    A B C D E F G H I J K L M N O - disk
    left middle right - peg
  )
  (:init
    (at A left) (at B left) (at C left) (at D left) (at E left)
    (at F left) (at G left) (at H left) (at I left) (at J left)
    (at K left) (at L left) (at M left) (at N left) (at O left)
    (top A left)
    (empty middle)
    (empty right)
    (can_move_agent1 A) (can_move_agent1 B) (can_move_agent1 C) (can_move_agent1 D) (can_move_agent1 E)
    (can_move_agent2 F) (can_move_agent2 G) (can_move_agent2 H) (can_move_agent2 I) (can_move_agent2 J)
    (can_move_agent3 K) (can_move_agent3 L) (can_move_agent3 M) (can_move_agent3 N) (can_move_agent3 O)
  )
  (:goal (and
    (at A right)
    (at B left) (at C left) (at D left) (at E left)
    (at F left) (at G left) (at H left) (at I left) (at J left)
    (at K left) (at L left) (at M left) (at N left) (at O left)
    (empty middle)
  ))
)