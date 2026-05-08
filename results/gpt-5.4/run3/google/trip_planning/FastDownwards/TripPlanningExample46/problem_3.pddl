(define (problem trip_planning_example46_instance)
  (:domain trip_planning_example46)

  (:objects
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
  )

  (:init
    (current day_1)
    (at stockholm)

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

    (direct manchester seville)
    (direct seville manchester)
    (direct stockholm manchester)
    (direct manchester stockholm)

    (need_visit_seville_5)
    (need_visit_manchester_5)
    (need_visit_stockholm_3)
  )

  (:goal
    (and
      (finished)
      (need_visit_seville_0)
      (need_visit_manchester_0)
      (need_visit_stockholm_0)
      (visited day_1 stockholm)
      (visited day_3 stockholm)
    )
  )
)