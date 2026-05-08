(define (problem meeting_planning_instance)
  (:domain meeting_planning)

  (:objects
    marina_district - location
    richmond_district - location
    betty - person
    you - person
    arrival_time - time_point
    meet_betty_start - time_point
    meet_betty_end - time_point
  )

  (:init
    (at you marina_district)
    (can_move marina_district richmond_district)
    (can_move richmond_district marina_district)
    (planned_time arrival_time)
    (time_before meet_betty_start meet_betty_end)
    (time_before arrival_time meet_betty_start)
  )
  
  (:goal (and
    (met_betty)
  ))
)