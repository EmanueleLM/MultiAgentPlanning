(define (problem european_trip_13_days_min_init_problem)
  (:domain european_trip_13_days_min_init)

  (:objects
    reykjavik milan split - city
    mi_stay rk_stay sp_stay - stay_need
    sm_flight mr_flight rm_flight - flight_need
    split_window finished - split_need
  )

  (:init
    (at split)
    (need_open sm_flight)
    (sp_left_3)
    (mi_left_7)
    (rk_left_5)
    (remaining_after_1)
  )

  (:goal
    (and
      (need_done sm_flight)
      (need_done mi_stay)
      (need_done mr_flight)
      (need_done rk_stay)
      (need_done rm_flight)
      (need_done sp_stay)
      (need_done split_window)
      (need_done finished))
  )
)