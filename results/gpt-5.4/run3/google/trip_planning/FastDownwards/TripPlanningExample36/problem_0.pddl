(define (problem trip_13_days_three_cities_instance)
  (:domain trip_13_days_three_cities)

  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
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
    (next_day d9 d10)
    (next_day d10 d11)
    (next_day d11 d12)
    (next_day d12 d13)

    (florence_count_0)
    (munich_count_0)
    (warsaw_count_0)
  )

  (:goal
    (and
      (assigned d13)
      (current_day d13)
      (florence_done)
      (munich_done)
      (warsaw_done)
    )
  )
)