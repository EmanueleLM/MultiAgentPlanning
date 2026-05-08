(define (problem european_trip_9_days_instance_problem)
  (:domain european_trip_9_days_instance)

  (:objects
    frankfurt florence valencia - city

    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day

    fr0 fr1 fr2 fr3 fr4 fr5 - fr_count
    fl0 fl1 fl2 fl3 fl4 - fl_count
    va0 va1 va2 - va_count
  )

  (:init
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)

    (direct_flight frankfurt florence)
    (direct_flight florence frankfurt)
    (direct_flight frankfurt valencia)
    (direct_flight valencia frankfurt)

    (start_choice_open)

    (fr_rank fr0)
    (fr_next fr0 fr1)
    (fr_next fr1 fr2)
    (fr_next fr2 fr3)
    (fr_next fr3 fr4)
    (fr_next fr4 fr5)

    (fl_rank fl0)
    (fl_next fl0 fl1)
    (fl_next fl1 fl2)
    (fl_next fl2 fl3)
    (fl_next fl3 fl4)

    (va_rank va0)
    (va_next va0 va1)
    (va_next va1 va2)
  )

  (:goal
    (and
      (assigned d1)
      (assigned d2)
      (assigned d3)
      (assigned d4)
      (assigned d5)
      (assigned d6)
      (assigned d7)
      (assigned d8)
      (assigned d9)

      (valencia_window_satisfied)

      (fr_rank fr5)
      (fl_rank fl4)
      (va_rank va2)
    )
  )
)