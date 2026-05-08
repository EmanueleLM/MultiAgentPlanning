(define (problem european_trip_9_days_instance_problem)
  (:domain european_trip_9_days_instance)

  (:objects
    oslo dublin valencia - city

    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day

    oslo_0 oslo_1 oslo_2 oslo_3 - oslo_count
    dublin_0 dublin_1 dublin_2 dublin_3 - dublin_count
    valencia_0 valencia_1 valencia_2 valencia_3 valencia_4 valencia_5 - valencia_count
  )

  (:init
    (current_day d1)
    (last_day d9)
    (start_pending)

    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)

    (direct_flight oslo dublin)
    (direct_flight dublin oslo)
    (direct_flight dublin valencia)
    (direct_flight valencia dublin)

    (window_day d5)
    (window_day d6)
    (window_day d7)
    (window_day d8)
    (window_day d9)

    (oslo_progress oslo_0)
    (dublin_progress dublin_0)
    (valencia_progress valencia_0)

    (oslo_step oslo_0 oslo_1)
    (oslo_step oslo_1 oslo_2)
    (oslo_step oslo_2 oslo_3)

    (dublin_step dublin_0 dublin_1)
    (dublin_step dublin_1 dublin_2)
    (dublin_step dublin_2 dublin_3)

    (valencia_step valencia_0 valencia_1)
    (valencia_step valencia_1 valencia_2)
    (valencia_step valencia_2 valencia_3)
    (valencia_step valencia_3 valencia_4)
    (valencia_step valencia_4 valencia_5)
  )

  (:goal
    (and
      (trip_complete)
      (oslo_progress oslo_3)
      (dublin_progress dublin_3)
      (valencia_progress valencia_5)
      (valencia_window_satisfied)
    )
  )
)