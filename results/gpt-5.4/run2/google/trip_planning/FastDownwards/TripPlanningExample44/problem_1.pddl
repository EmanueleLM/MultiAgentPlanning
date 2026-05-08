(define (problem trip_planning_example44_problem)
  (:domain trip_planning_example44)

  (:objects
    rome lyon zurich - city

    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9
    day_10 day_11 day_12 day_13 day_14 day_15 day_16 day_17 day_18 - day

    c0 c1 c2 c3 c4 c5 c6 c7 - count
  )

  (:init
    (at rome)
    (current_day day_1)

    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)
    (next_day day_9 day_10)
    (next_day day_10 day_11)
    (next_day day_11 day_12)
    (next_day day_12 day_13)
    (next_day day_13 day_14)
    (next_day day_14 day_15)
    (next_day day_15 day_16)
    (next_day day_16 day_17)
    (next_day day_17 day_18)

    (direct_flight rome lyon)
    (direct_flight lyon rome)
    (direct_flight rome zurich)
    (direct_flight zurich rome)

    (remaining_rome c6)
    (remaining_lyon c6)
    (remaining_zurich c7)

    (decrement c7 c6)
    (decrement c6 c5)
    (decrement c5 c4)
    (decrement c4 c3)
    (decrement c3 c2)
    (decrement c2 c1)
    (decrement c1 c0)

    (wedding_window day_1)
    (wedding_window day_2)
    (wedding_window day_3)
    (wedding_window day_4)
    (wedding_window day_5)
    (wedding_window day_6)
    (wedding_window day_7)
  )

  (:goal
    (and
      (current_day day_18)
      (day_used day_1)
      (day_used day_2)
      (day_used day_3)
      (day_used day_4)
      (day_used day_5)
      (day_used day_6)
      (day_used day_7)
      (day_used day_8)
      (day_used day_9)
      (day_used day_10)
      (day_used day_11)
      (day_used day_12)
      (day_used day_13)
      (day_used day_14)
      (day_used day_15)
      (day_used day_16)
      (day_used day_17)
      (remaining_rome c0)
      (remaining_lyon c0)
      (remaining_zurich c0)
      (wedding_attended))
  )
)