(define (problem tripplanningexample31)
  (:domain european_trip_10_days_instance)

  (:objects
    frankfurt reykjavik split - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
  )

  (:init
    (at frankfurt)
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

    (direct frankfurt reykjavik)
    (direct reykjavik frankfurt)
    (direct split frankfurt)
    (direct frankfurt split)

    (workshop_day d8)
    (workshop_day d9)
    (workshop_day d10)
  )

  (:goal
    (and
      (current_day d11)
      (attended_workshop)

      (stayed frankfurt d1)
      (stayed frankfurt d2)

      (stayed split d3)
      (stayed split d4)
      (stayed split d5)
      (stayed split d6)
      (stayed split d7)
      (stayed split d8)
      (stayed split d9)

      (stayed reykjavik d10)
    )
  )
)