(define (problem sokoban-instance)
  (:domain sokoban)

  (:objects
    player - player_t
    box - box_t
    pos_1 pos_2 pos_3 pos_4 pos_5 - pos_t
  )

  (:init
    (at_player pos_5)
    (at_box box pos_2)
    (is_goal pos_1)
    (adjacent pos_1 pos_2)
    (adjacent pos_2 pos_3)
    (adjacent pos_3 pos_4)
    (adjacent pos_4 pos_5)
    (is_empty pos_1)
    (is_empty pos_3)
    (is_empty pos_4)
  )

  (:goal
    (at_box box pos_1)
  )
)