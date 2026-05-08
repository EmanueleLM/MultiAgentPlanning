(define (problem trip_example)
  (:domain trip_planning)
  (:objects
    split manchester riga - city
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - step
    n0 n1 n2 n3 n4 n5 n6 n7 - count
  )
  (:init
    (ready)
    (current_step t0)
    (stay_count split n0)
    (stay_count manchester n0)
    (stay_count riga n0)

    ;; Temporal sequence for the 15-day limit
    (next_step t0 t1)
    (next_step t1 t2)
    (next_step t2 t3)
    (next_step t3 t4)
    (next_step t4 t5)
    (next_step t5 t6)
    (next_step t6 t7)
    (next_step t7 t8)
    (next_step t8 t9)
    (next_step t9 t10)
    (next_step t10 t11)
    (next_step t11 t12)
    (next_step t12 t13)
    (next_step t13 t14)
    (next_step t14 t15)

    ;; Counting sequence for stay requirements
    (next_count n0 n1)
    (next_count n1 n2)
    (next_count n2 n3)
    (next_count n3 n4)
    (next_count n4 n5)
    (next_count n5 n6)
    (next_count n6 n7)

    ;; Flight connectivity based on the problem description
    (can_fly riga manchester)
    (can_fly manchester riga)
    (can_fly manchester split)
  )
  (:goal
    (and
      ;; 6 days in Split
      (stay_count split n6)
      ;; 4 days in Manchester
      (stay_count manchester n4)
      ;; 7 days in Riga
      (stay_count riga n7)
      ;; Total trip duration of 15 days
      (current_step t15)
    )
  )
)