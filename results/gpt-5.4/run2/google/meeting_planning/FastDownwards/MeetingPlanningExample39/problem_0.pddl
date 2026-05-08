(define (problem san_francisco_day_meeting_instance)
  (:domain san_francisco_day_meeting)

  (:objects
    fishermans_wharf nob_hill - location
    stephanie - person
    t0900 t1634 t1645 t1845 t2145 - timepoint
  )

  (:init
    (at fishermans_wharf)
    (current_time t0900)

    (wait_link t0900 t1634)

    (travel_link fishermans_wharf nob_hill t1634 t1645)

    (friend_at stephanie nob_hill)
    (available_start stephanie t1645)
    (available_end stephanie t2145)

    (meeting_duration t1645 t1845)
  )

  (:goal
    (and
      (met_minimum stephanie)
      (at nob_hill)
      (current_time t1845)
    )
  )
)