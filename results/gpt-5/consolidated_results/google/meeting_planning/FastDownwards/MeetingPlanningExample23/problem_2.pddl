(define (problem meetingplanningexample23)
  (:domain meetingplanningexample23-classical)
  (:objects
    bayview russian_hill - location
    t540 t1027 t1050 t1125 - timepoint
    john - person
  )
  (:init
    (at bayview)
    (known_location bayview)
    (known_location russian_hill)
    (john_at russian_hill)
    (time_at t540)

    (allow_wait bayview t540 t1027)
    (allow_travel bayview russian_hill t1027 t1050)
    (allow_meet russian_hill t1050 t1125)

    (= (total-cost) 0)
  )
  (:goal (and
    (met_john)
  ))
  (:metric minimize (total-cost))
)