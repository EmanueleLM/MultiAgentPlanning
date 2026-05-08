(define (problem meet_sarah_problem)
  (:domain meeting_planning)
  (:objects
    me sarah - person
    richmond_district bayview - location
    t_0900 t_0926 t_1415 t_1500 - time
  )
  (:init
    (at me richmond_district)
    (time_at t_0900)
    ;; Travel from Richmond District to Bayview (26 minutes)
    (can_travel richmond_district bayview t_0900 t_0926)
    ;; Wait at Bayview from 09:26 until Sarah's arrival at 14:15
    (can_wait t_0926 t_1415)
    ;; Meet Sarah at Bayview for 45 minutes (14:15 to 15:00)
    ;; Sarah is available from 14:15 to 17:30
    (can_meet me sarah bayview t_1415 t_1500)
  )
  (:goal (has_met me sarah))
)