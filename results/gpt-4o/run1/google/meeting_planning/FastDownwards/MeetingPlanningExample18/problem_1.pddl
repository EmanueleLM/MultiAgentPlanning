(define (problem meet_friends_instance)
  (:domain meet_friends)

  (:objects
    marina_district - location
    richmond_district - location
    betty - person
    you - person
    start - time_point
    meet_betty_start - time_point
    meet_betty_end - time_point
  )

  (:init
    (at you marina_district)
    (meeting_possible meet_betty_start)
    (time_before meet_betty_start meet_betty_end)
  )

  (:goal (and
    (met_betty)
  ))
)