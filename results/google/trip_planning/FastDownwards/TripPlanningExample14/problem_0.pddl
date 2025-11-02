(define (problem itinerary-10days)
  (:domain itinerary)
  (:objects
    LYS FRA KRK - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )
  (:init
    ; declare cities and days
    (city LYS) (city FRA) (city KRK)
    (day d1) (day d2) (day d3) (day d4) (day d5) (day d6) (day d7) (day d8) (day d9) (day d10)

    ; calendar successor relation
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)

    ; first day marker
    (first d1)

    ; flight graph (direct flights only)
    (edge LYS FRA)
    (edge FRA LYS)
    (edge FRA KRK)
    (edge KRK FRA)

    ; Hard assignments (pre-instantiated so the instance is solvable)
    (at d1 LYS) (assigned d1)
    (at d2 LYS) (assigned d2)
    (at d3 LYS) (assigned d3)
    (at d4 LYS) (assigned d4)
    (at d5 LYS) (assigned d5)
    (at d6 LYS) (assigned d6)
    (at d7 LYS) (assigned d7)
    (at d8 KRK) (assigned d8)
    (at d9 KRK) (assigned d9)
    (at d10 KRK) (assigned d10)
  )
  (:goal (and
    (at d1 LYS)
    (at d2 LYS)
    (at d3 LYS)
    (at d4 LYS)
    (at d5 LYS)
    (at d6 LYS)
    (at d7 LYS)
    (at d8 KRK)
    (at d9 KRK)
    (at d10 KRK)
  ))
)