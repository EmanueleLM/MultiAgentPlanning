(define (problem tripplanningexample33)
  (:domain trip-planning-example33)
  (:objects
    krakow rome barcelona - city
    d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
    k_c0 k_c1 k_c2 k_c3 k_c4 - krakow_stay_counter
    r_c0 r_c1 r_c2 r_c3 r_c4 - rome_stay_counter
    b_c0 b_c1 b_c2 b_c3 b_c4 b_c5 b_c6 b_c7 - barcelona_stay_counter
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

    ; Initial stay counts (0 days spent)
    (has_krakow_stay_count k_c0)
    (has_rome_stay_count r_c0)
    (has_barcelona_stay_count b_c0)

    ; Stay count progressions for Krakow (4 days required)
    (next_krakow_stay k_c0 k_c1)
    (next_krakow_stay k_c1 k_c2)
    (next_krakow_stay k_c2 k_c3)
    (next_krakow_stay k_c3 k_c4)

    ; Stay count progressions for Rome (4 days required)
    (next_rome_stay r_c0 r_c1)
    (next_rome_stay r_c1 r_c2)
    (next_rome_stay r_c2 r_c3)
    (next_rome_stay r_c3 r_c4)

    ; Stay count progressions for Barcelona (7 days required)
    (next_barcelona_stay b_c0 b_c1)
    (next_barcelona_stay b_c1 b_c2)
    (next_barcelona_stay b_c2 b_c3)
    (next_barcelona_stay b_c3 b_c4)
    (next_barcelona_stay b_c4 b_c5)
    (next_barcelona_stay b_c5 b_c6)
    (next_barcelona_stay b_c6 b_c7)

    ; Friend meeting possible days
    (can_meet_friend_on_day d10)
    (can_meet_friend_on_day d11)
    (can_meet_friend_on_day d12)
    (can_meet_friend_on_day d13)
  )
  (:goal (and
    (current_day d13)
    (has_krakow_stay_count k_c4)
    (has_rome_stay_count r_c4)
    (has_barcelona_stay_count b_c7)
    (friend_met)
  ))
)