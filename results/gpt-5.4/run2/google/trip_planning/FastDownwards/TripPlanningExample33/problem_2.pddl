(define (problem european_trip_instance)
  (:domain european_trip_13_days)

  (:objects
    barcelona krakow rome - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
  )

  (:init
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

    (flight barcelona krakow)
    (flight krakow barcelona)
    (flight rome barcelona)
    (flight barcelona rome)

    (meeting_window d10)
    (meeting_window d11)
    (meeting_window d12)
    (meeting_window d13)
  )

  (:goal
    (and
      (current_day d13)
      (need_barcelona_1)
      (need_barcelona_2)
      (need_barcelona_3)
      (need_barcelona_4)
      (need_barcelona_5)
      (need_barcelona_6)
      (need_barcelona_7)
      (need_krakow_1)
      (need_krakow_2)
      (need_krakow_3)
      (need_krakow_4)
      (need_rome_1)
      (need_rome_2)
      (need_rome_3)
      (need_rome_4)
      (met_friend)
    )
  )
)