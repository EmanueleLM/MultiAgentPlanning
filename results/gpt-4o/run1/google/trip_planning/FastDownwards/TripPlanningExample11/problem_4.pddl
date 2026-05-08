(define (problem revised_travel_plan_instance)
  (:domain revised_travel_plan)
  (:objects
    vienna vilnius valencia - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 day_15 - time
  )
  (:init
    (at vienna day_1)
    (has_flight vienna valencia)
    (has_flight vilnius vienna)
    ; Setup time sequence
    (next day_1 day_2)
    (next day_2 day_3)
    (next day_3 day_4)
    (next day_4 day_5)
    (next day_5 day_6)
    (next day_6 day_7)
    (next day_7 day_8)
    (next day_8 day_9)
    (next day_9 day_10)
    (next day_10 day_11)
    (next day_11 day_12)
    (next day_12 day_13)
    (next day_13 day_14)
    (next day_14 day_15)
    ; Conference time during the trip
    (conference valencia day_9)
    (conference valencia day_15)
  )
  (:goal (and
    (at valencia day_15) ; Ensure end trip
    (at valencia day_9)
  ))
)