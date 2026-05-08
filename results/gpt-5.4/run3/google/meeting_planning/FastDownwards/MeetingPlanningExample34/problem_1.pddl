(define (problem san_francisco_day_meeting_instance)
  (:domain san_francisco_day_meeting)

  (:objects
    bayview pacific_heights - location
    thomas - person
    t900 t923 t1215 t1400 t1715 - time
  )

  (:init
    (at bayview)
    (current_time t900)

    (next_time t923 t1215)
    (next_time t1215 t1400)
    (next_time t1400 t1715)

    (person_at thomas pacific_heights)
    (available thomas t1215 t1715)

    (travel_edge bayview pacific_heights t900 t923)

    (meeting_block thomas pacific_heights t1215 t1400)
  )

  (:goal
    (and
      (met_minimum thomas)
      (at pacific_heights)
      (current_time t1400)
    )
  )
)