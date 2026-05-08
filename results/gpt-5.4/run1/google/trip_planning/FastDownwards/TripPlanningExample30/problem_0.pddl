(define (problem european_trip_instance)
  (:domain european_trip_14_days)

  (:objects
    istanbul tallinn zurich - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 - day
    c0 c1 c2 c3 c4 c5 c6 c7 - count
  )

  (:init
    (current_day d1)
    (start_unchosen)

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

    (show_day d1)
    (show_day d2)
    (show_day d3)
    (show_day d4)
    (show_day d5)
    (show_day d6)
    (show_day d7)

    (direct istanbul tallinn)
    (direct istanbul zurich)
    (direct tallinn zurich)
    (direct tallinn istanbul)
    (direct zurich tallinn)
    (direct zurich istanbul)

    (count_istanbul c0)
    (count_tallinn c0)
    (count_zurich c0)

    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)
    (next_count c5 c6)
    (next_count c6 c7)
  )

  (:goal
    (and
      (finished)
      (count_istanbul c5)
      (count_tallinn c4)
      (count_zurich c7)
      (spent d1 zurich)
      (spent d2 zurich)
      (spent d3 zurich)
      (spent d4 zurich)
      (spent d5 zurich)
      (spent d6 zurich)
      (spent d7 zurich)
    )
  )
)