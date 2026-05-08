(define (problem sokoban-instance)
  (:domain sokoban)

  (:objects
    player - player_t
    box - box_t
    pos_0 pos_1 pos_2 pos_3 pos_4 pos_5 pos_6 pos_7 pos_8 pos_9 pos_10 pos_11 - pos_t
  )

  (:init
    (at_player pos_11)
    (at_box box pos_5)
    (is_goal pos_1)
    (adjacent pos_0 pos_1) ; adjacency relation in a single row, linear order
    (adjacent pos_1 pos_2)
    (adjacent pos_2 pos_3)
    (adjacent pos_3 pos_4)
    (adjacent pos_4 pos_5)
    (adjacent pos_5 pos_6)
    (adjacent pos_6 pos_7)
    (adjacent pos_7 pos_8)
    (adjacent pos_8 pos_9)
    (adjacent pos_9 pos_10)
    (adjacent pos_10 pos_11)
    (empty pos_0)
    (empty pos_1)
    (empty pos_2)
    (empty pos_3)
    (empty pos_4)
    (empty pos_6)
    (empty pos_7)
    (empty pos_8)
    (empty pos_9)
    (empty pos_10)
    (empty pos_11)
  )

  (:goal
    (at_box box pos_1)
  )
)