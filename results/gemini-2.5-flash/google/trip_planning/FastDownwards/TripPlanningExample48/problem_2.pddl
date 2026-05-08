(define (problem tripplanningexample48)
  (:domain trip_planning)
  (:objects
    ; city objects are now constants in the domain, not here
    d0 d1 d2 d3 d4 - day
  )
  (:init
    (at_city manchester) ; Assuming start in Manchester
    (current_day d0)
    (next_day d0 d1)
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)

    ; Flight paths
    (flight split geneva)
    (flight geneva split)
    (flight manchester split)
    (flight manchester geneva)
    (flight geneva manchester)
  )
  (:goal (and
    (current_day d4)
    (visited_split_day_2)
    (visited_manchester_day_2)
    (visited_geneva_day_2)
    (met_friend_in_split)
  ))
)