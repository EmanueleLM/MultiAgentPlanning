(define (problem tripplanningexample30)
  (:domain europe_trip_14days_instance)

  (:objects
    istanbul tallinn zurich - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day
  )

  (:init
    (at zurich)
    (visited zurich)
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
    (next_day d14 d15)

    (show_day d1)
    (show_day d2)
    (show_day d3)
    (show_day d4)
    (show_day d5)
    (show_day d6)
    (show_day d7)

    (flight istanbul tallinn)
    (flight istanbul zurich)
    (flight tallinn zurich)
    (flight tallinn istanbul)
    (flight zurich tallinn)
    (flight zurich istanbul)
  )

  (:goal
    (and
      (current_day d15)
      (at zurich)
      (visited istanbul)
      (visited tallinn)
      (visited zurich)
    )
  )
)