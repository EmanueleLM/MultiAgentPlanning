(define (problem tripplanningexample33)
  (:domain trip-planning-example33)
  (:objects
    krakow rome barcelona - city
    d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
    dc0 dc1 dc2 dc3 dc4 dc5 dc6 dc7 - day_count
  )
  (:init
    ; Initial location (arbitrarily chosen, as not specified in problem)
    (at krakow)
    ; Initial day
    (current_day d0)
    ; Day progression
    (next_day d0 d1) (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5)
    (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9) (next_day d9 d10)
    (next_day d10 d11) (next_day d11 d12) (next_day d12 d13)

    ; Flight connections (symmetric)
    (has_flight barcelona krakow)
    (has_flight krakow barcelona)
    (has_flight rome barcelona)
    (has_flight barcelona rome)

    ; Initial stay counts (0 days spent in each city)
    (days_spent_in krakow dc0)
    (days_spent_in rome dc0)
    (days_spent_in barcelona dc0)

    ; Stay count progressions (up to max needed for Barcelona)
    (next_day_count dc0 dc1)
    (next_day_count dc1 dc2)
    (next_day_count dc2 dc3)
    (next_day_count dc3 dc4)
    (next_day_count dc4 dc5)
    (next_day_count dc5 dc6)
    (next_day_count dc6 dc7)

    ; Friend meeting possible days
    (can_meet_friend_on_day d10)
    (can_meet_friend_on_day d11)
    (can_meet_friend_on_day d12)
    (can_meet_friend_on_day d13)
  )
  (:goal (and
    (current_day d13)
    (days_spent_in krakow dc4)
    (days_spent_in rome dc4)
    (days_spent_in barcelona dc7)
    (friend_met)
  ))
)