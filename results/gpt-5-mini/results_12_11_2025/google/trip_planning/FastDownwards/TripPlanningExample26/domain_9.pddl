(define (domain trip-planning-domain)
  (:requirements :typing :strips :negative-preconditions)
  (:types city day)

  (:predicates
    (city_on_day ?c - city ?d - day)
    (assigned ?d - day)
    (direct_flight ?c1 - city ?c2 - city)
    (next ?d1 - day ?d2 - day)
  )

  ;; Assign Porto contiguous block d1..d5 (5 days)
  (:action assign_porto_block
    :parameters ()
    :precondition (and
      (not (assigned d1)) (not (assigned d2)) (not (assigned d3))
      (not (assigned d4)) (not (assigned d5))
      (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5)
    )
    :effect (and
      (city_on_day porto d1) (city_on_day porto d2) (city_on_day porto d3)
      (city_on_day porto d4) (city_on_day porto d5)
      (assigned d1) (assigned d2) (assigned d3) (assigned d4) (assigned d5)
    )
  )

  ;; Assign Berlin contiguous block d6..d11 (6 days); requires Porto at d5 and a direct flight Porto->Berlin
  (:action assign_berlin_block
    :parameters ()
    :precondition (and
      (city_on_day porto d5)
      (direct_flight porto berlin)
      (next d5 d6)
      (not (assigned d6)) (not (assigned d7)) (not (assigned d8))
      (not (assigned d9)) (not (assigned d10)) (not (assigned d11))
      (next d6 d7) (next d7 d8) (next d8 d9) (next d9 d10) (next d10 d11)
    )
    :effect (and
      (city_on_day berlin d6) (city_on_day berlin d7) (city_on_day berlin d8)
      (city_on_day berlin d9) (city_on_day berlin d10) (city_on_day berlin d11)
      (assigned d6) (assigned d7) (assigned d8)
      (assigned d9) (assigned d10) (assigned d11)
    )
  )

  ;; Assign Reykjavik contiguous block d12..d16 (5 days); requires Berlin at d11 and a direct flight Berlin->Reykjavik
  (:action assign_reykjavik_block
    :parameters ()
    :precondition (and
      (city_on_day berlin d11)
      (direct_flight berlin reykjavik)
      (next d11 d12)
      (not (assigned d12)) (not (assigned d13)) (not (assigned d14))
      (not (assigned d15)) (not (assigned d16))
      (next d12 d13) (next d13 d14) (next d14 d15) (next d15 d16)
    )
    :effect (and
      (city_on_day reykjavik d12) (city_on_day reykjavik d13)
      (city_on_day reykjavik d14) (city_on_day reykjavik d15)
      (city_on_day reykjavik d16)
      (assigned d12) (assigned d13) (assigned d14) (assigned d15) (assigned d16)
    )
  )
)