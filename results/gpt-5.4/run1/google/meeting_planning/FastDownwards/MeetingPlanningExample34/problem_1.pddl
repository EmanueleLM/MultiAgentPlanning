(define (problem san_francisco_thomas_meeting_instance)
  (:domain san_francisco_thomas_meeting)

  (:objects
    bayview - location
    thomas - person
    t0900 t0923 t1215 t1530 t1715 - timepoint
  )

  (:init
    (at bayview)
    (current_time t0900)

    (connected bayview pacific_heights)
    (connected pacific_heights bayview)

    (next_time t0900 t0923)
    (next_time t0923 t1215)
    (next_time t1215 t1530)
    (next_time t1530 t1715)

    (travel_departure bayview pacific_heights t0900)
    (travel_arrival bayview pacific_heights t0923)

    (available thomas t1215 t1715)

    (meeting_start_option thomas t1530)
    (meeting_end_option thomas t1715)
  )

  (:goal
    (and
      (met_required thomas)
      (at pacific_heights)
      (current_time t1715)
    )
  )
)