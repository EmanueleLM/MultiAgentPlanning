(define (problem meeting_planning_problem)
  (:domain meeting_planning)
  (:objects
    richmond_district north_beach - location
    t0 t1 t2 t3 t4 - time
  )
  (:init
    (at richmond_district)
    (current_time t0)
    (is_richmond richmond_district)
    (is_north_beach north_beach)
    (is_t0 t0)
    (is_t1 t1)
    (is_t2 t2)
    (is_t3 t3)
    (next_time t1 t2) ; Wait at North Beach from arrival (09:17) until John arrives (15:15)
    (next_time t3 t4) ; Wait at North Beach from meeting end (16:30) until John leaves (17:15)
  )
  (:goal (met_john))
)