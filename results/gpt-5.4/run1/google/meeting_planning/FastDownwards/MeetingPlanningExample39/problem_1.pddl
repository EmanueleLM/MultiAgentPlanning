(define (problem meet_stephanie_instance)
  (:domain meet_stephanie_san_francisco)

  (:objects
    fishermans_wharf nob_hill - location
    stephanie - person
    t0900 t1634 t1645 t1845 t2145 - timepoint
  )

  (:init
    (at fishermans_wharf)
    (current_time t0900)

    (connected fishermans_wharf nob_hill)
    (connected nob_hill fishermans_wharf)

    (travel_departure fishermans_wharf nob_hill t1634 t1645)

    (next_time t0900 t1634)
    (next_time t1634 t1645)
    (next_time t1645 t1845)
    (next_time t1845 t2145)

    (person_at stephanie nob_hill)

    (available_start stephanie t1645)
    (available_end stephanie t2145)

    (minimum_meeting_interval stephanie t1645 t1845)
  )

  (:goal
    (and
      (met_minimum stephanie)
      (at nob_hill)
      (current_time t1845)
      (not (meeting stephanie))
    )
  )
)