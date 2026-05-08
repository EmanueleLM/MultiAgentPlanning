(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    location_goal location_box location_player - cell
    player1 - entity
    box1 - entity
  )
  
  (:init
    (at player1 location_player)
    (at box1 location_box)
    (goal location_goal)
    (cell_empty location_goal)
    ; Define adjacencies to traverse the map correctly
    (adjacent location_player location_box)
    (adjacent location_box location_goal)
  )
  
  (:goal
    (at box1 location_goal)
  )
)