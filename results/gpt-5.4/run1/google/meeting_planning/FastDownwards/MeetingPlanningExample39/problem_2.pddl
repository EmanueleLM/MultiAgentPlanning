(define (problem meet_stephanie_instance)
  (:domain meet_stephanie_san_francisco)

  (:objects
    fishermans_wharf nob_hill - location
    t0900 t1634 t1645 t1845 t2145 - timepoint
  )

  (:init
    (at fishermans_wharf)
    (current_time t0900)

    (next_time t0900 t1634)
    (next_time t1634 t1645)
    (next_time t1645 t1845)
    (next_time t1845 t2145)

    (travel_edge fishermans_wharf nob_hill t1634 t1645)
    (travel_edge nob_hill fishermans_wharf t0900 t0911)

    (stephanie_available t1645)
    (stephanie_available t1845)
    (stephanie_available t2145)
  )

  (:goal
    (and
      (met_stephanie_minimum)
      (at nob_hill)
      (current_time t1845)
    )
  )
)