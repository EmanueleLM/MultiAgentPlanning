(define (problem san_francisco_day_meeting_instance)
  (:domain san_francisco_day_meeting)

  (:objects
    marina_district mission_district - location
    stephanie - person
    t0 t1 t2 t3 t4 t5 t6 - timepoint
  )

  (:init
    (at marina_district)
    (at_time t0)

    (next t0 t1)
    (next t1 t2)
    (next t2 t3)
    (next t3 t4)
    (next t4 t5)
    (next t5 t6)

    (travel_edge marina_district mission_district t0 t1)
    (travel_edge marina_district mission_district t2 t3)

    (available stephanie t4 t5)
    (available stephanie t5 t6)
  )

  (:goal
    (and
      (met_segment_2)
      (at_time t6)
      (at mission_district)
    )
  )
)