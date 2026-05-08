(define (problem europe_trip_14days_instance_problem)
  (:domain europe_trip_14days_instance)

  (:objects
    istanbul tallinn zurich - city

    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 done - day

    i5 i4 i3 i2 i1 i0 - ist_counter
    t4 t3 t2 t1 t0 - tal_counter
    z7 z6 z5 z4 z3 z2 z1 z0 - zur_counter
  )

  (:init
    (current_day d1)
    (at zurich)

    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)
    (next_day d9 d10)
    (next_day d10 d11)
    (next_day d11 d12)
    (next_day d12 d13)
    (next_day d13 d14)
    (next_day d14 done)

    (show_day d1)
    (show_day d2)
    (show_day d3)
    (show_day d4)
    (show_day d5)
    (show_day d6)
    (show_day d7)

    (direct_flight istanbul tallinn)
    (direct_flight istanbul zurich)
    (direct_flight tallinn zurich)
    (direct_flight tallinn istanbul)
    (direct_flight zurich istanbul)
    (direct_flight zurich tallinn)

    (remaining_istanbul i5)
    (next_istanbul i5 i4)
    (next_istanbul i4 i3)
    (next_istanbul i3 i2)
    (next_istanbul i2 i1)
    (next_istanbul i1 i0)

    (remaining_tallinn t4)
    (next_tallinn t4 t3)
    (next_tallinn t3 t2)
    (next_tallinn t2 t1)
    (next_tallinn t1 t0)

    (remaining_zurich z7)
    (next_zurich z7 z6)
    (next_zurich z6 z5)
    (next_zurich z5 z4)
    (next_zurich z4 z3)
    (next_zurich z3 z2)
    (next_zurich z2 z1)
    (next_zurich z1 z0)
  )

  (:goal
    (and
      (current_day done)
      (remaining_istanbul i0)
      (remaining_tallinn t0)
      (remaining_zurich z0)
    )
  )
)