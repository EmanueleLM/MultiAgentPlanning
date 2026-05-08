(define (problem tripplanningexample30)
  (:domain european_trip_14_days)

  (:objects
    istanbul tallinn zurich - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 - day
    c0 c1 c2 c3 c4 c5 c6 c7 - staycount
  )

  (:init
    (at zurich)
    (current_day d1)

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

    (direct istanbul tallinn)
    (direct istanbul zurich)
    (direct tallinn zurich)
    (direct tallinn istanbul)
    (direct zurich tallinn)
    (direct zurich istanbul)

    (show_day d1)
    (show_day d2)
    (show_day d3)
    (show_day d4)
    (show_day d5)
    (show_day d6)
    (show_day d7)

    (istanbul_count c0)
    (tallinn_count c0)
    (zurich_count c0)

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
      (visited_istanbul)
      (visited_tallinn)
      (visited_zurich)
      (istanbul_count c5)
      (tallinn_count c4)
      (zurich_count c7)
      (show_attended d1)
      (show_attended d2)
      (show_attended d3)
      (show_attended d4)
      (show_attended d5)
      (show_attended d6)
      (show_attended d7)
    )
  )
)