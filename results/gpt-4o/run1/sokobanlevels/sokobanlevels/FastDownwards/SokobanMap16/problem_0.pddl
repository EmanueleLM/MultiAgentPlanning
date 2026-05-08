(define (problem sokoban_problem)
  (:domain sokoban)
  (:objects
    player - entity
    box - entity
    location_0_0 location_0_1 location_0_2
    location_1_0 location_1_1 location_1_2
    location_49_0 location_49_1 location_49_2
    location_50_0 location_50_1 location_50_2
    location_51_0 location_51_1 location_51_2 - location
  )
  (:init
    (at player location_50_1)
    (at box location_49_1)
    (goal_at location_1_1)
    (accessible location_0_1)
    (accessible location_1_1)
    (accessible location_49_1)
    (accessible location_50_1)
    (adjacent location_50_1 location_49_1)
    ;; Additional accessible and adjacent predicates should be filled here to match the Sokoban map.
    ;; For simplicity, these predicates define how locations are inter-connected except walls.
  )
  (:goal
    (at box location_1_1)
  )
)