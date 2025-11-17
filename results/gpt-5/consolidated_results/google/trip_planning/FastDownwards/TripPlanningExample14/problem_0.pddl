(define (problem audited-itinerary-instance)
  (:domain itinerary-10days)
  (:objects
    lyon frankfurt krakow - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )
  (:init
    ; start in Lyon on day 1
    (at lyon)
    (current d1)

    ; flight graph (bidirectional direct flights)
    (edge lyon frankfurt)
    (edge frankfurt lyon)
    (edge frankfurt krakow)
    (edge krakow frankfurt)

    ; 10 discrete days with successor relation (self-loop on d10 to allow assigning day 10)
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)
    (next d10 d10)
  )

  ; Soft preference notes (treated here as strict itinerary constraints via goals):
  ; - Maximize Lyon days (target 7): infeasible; achieved 6 (days 1–6). Preference violated (nearest-feasible).
  ; - Frankfurt for 2 days: infeasible if maximizing Lyon; achieved 1 (day 7). Preference violated (nearest-feasible).
  ; - Krakow 3 days aligned with show (days 8–10): achieved. Preference met.

  (:goal
    (and
      ; allocate all 10 days exactly once
      (assigned d1)
      (assigned d2)
      (assigned d3)
      (assigned d4)
      (assigned d5)
      (assigned d6)
      (assigned d7)
      (assigned d8)
      (assigned d9)
      (assigned d10)

      ; explicit audited target itinerary (unique up to action choices)
      (on d1 lyon)
      (on d2 lyon)
      (on d3 lyon)
      (on d4 lyon)
      (on d5 lyon)
      (on d6 lyon)
      (on d7 frankfurt)
      (on d8 krakow)
      (on d9 krakow)
      (on d10 krakow)

      ; visit-all-three-cities hard constraint
      (visited lyon)
      (visited frankfurt)
      (visited krakow)

      ; attendance in Krakow on days 8, 9, and 10
      (attend_d8)
      (attend_d9)
      (attend_d10)
    )
  )
)