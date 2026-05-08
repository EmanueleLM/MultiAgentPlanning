(define (problem TripPlanningExample36)
  (:domain trip-planning)
  (:objects
    florence munich warsaw - city
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 - time_point
  )
  (:init
    (at florence) ; Starting location, assuming Florence as first mentioned city
    (current_time t0)
    (next_time t0 t1)
    (next_time t1 t2)
    (next_time t2 t3)
    (next_time t3 t4)
    (next_time t4 t5)
    (next_time t5 t6)
    (next_time t6 t7)
    (next_time t7 t8)
    (next_time t8 t9)
    (next_time t9 t10)
    (next_time t10 t11)
    (next_time t11 t12)
    (next_time t12 t13)

    ;; Direct flight connections
    (connected florence munich)
    (connected florence warsaw)
    (connected munich florence)
    (connected munich warsaw)
    (connected warsaw florence)
    (connected warsaw munich)

    (= (total-cost) 0)
  )
  (:goal (and
    (current_time t13) ; Total trip duration is 13 days
    (florence_day_completed_1)
    (florence_day_completed_2)
    (warsaw_day_completed_1)
    (warsaw_day_completed_2)
    (warsaw_day_completed_3)
    (warsaw_day_completed_4)
    (warsaw_day_completed_5)
    (warsaw_day_completed_6)
    (warsaw_day_completed_7)
    (munich_day_completed_1)
    (munich_day_completed_2)
    (munich_day_completed_3)
    (munich_day_completed_4)
    (munich_day_completed_5)
    (munich_day_completed_6)
  ))
  (:metric minimize (total-cost))
)