(define (problem plan_meetings)
  (:domain meeting_planning)
  (:objects
    chinatown marina_district - location
    t900 t912 t1057 t1500 - time
  )
  (:init
    (at chinatown)
    (current_time t900)
    (can_travel chinatown marina_district t900 t912)
    (can_meet_stephanie marina_district t912 t1057)
  )
  (:goal (and (met_stephanie)))
)