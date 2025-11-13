(define (problem TripPlanningExample17)
  (:domain trip-itinerary)
  (:objects
    ; cities
    copenhagen vienna lyon - city
    ; days
    D1 D2 D3 D4 D5 D6 D7 D8 D9 D10 D11 - day
    ; Copenhagen quota tokens: 4 (to make total Copenhagen days = 1 (D1) + 4 = 5)
    c1 c2 c3 c4 - ctoken
    ; Vienna preference tokens (target 4)
    v1 v2 v3 v4 - vtoken
    ; Lyon preference tokens (target 4)
    l1 l2 l3 l4 - ltoken
  )
  (:init
    ; day succession
    (succ D1 D2)
    (succ D2 D3)
    (succ D3 D4)
    (succ D4 D5)
    (succ D5 D6)
    (succ D6 D7)
    (succ D7 D8)
    (succ D8 D9)
    (succ D9 D10)
    (succ D10 D11)
    (last D11)

    ; start state: D1 in Copenhagen for the conference
    (assigned D1)
    (at D1 copenhagen)

    ; direct-flight connectivity (undirected via two directed facts)
    (connected copenhagen vienna)
    (connected vienna copenhagen)
    (connected vienna lyon)
    (connected lyon vienna)

    ; Copenhagen day-quota tokens (for D2..D11 assignments to Copenhagen)
    (available-ctoken c1)
    (available-ctoken c2)
    (available-ctoken c3)
    (available-ctoken c4)

    ; Preference tokens (4 each for Vienna and Lyon)
    (available-vtoken v1)
    (available-vtoken v2)
    (available-vtoken v3)
    (available-vtoken v4)

    (available-ltoken l1)
    (available-ltoken l2)
    (available-ltoken l3)
    (available-ltoken l4)

    (= (total-cost) 0)
  )
  (:goal
    (and
      ; Full 11-day schedule completed and closed for settlement actions
      (finished)

      ; Must be in Copenhagen on the conference day D5
      (at D5 copenhagen)

      ; Enforce exactly 5 total days in Copenhagen:
      ; consume all 4 Copenhagen tokens (beyond D1)
      (not (available-ctoken c1))
      (not (available-ctoken c2))
      (not (available-ctoken c3))
      (not (available-ctoken c4))

      ; Require all Vienna/Lyon tokens to be cleared
      ; (matched to actual days or paid as shortfall at cost)
      (not (available-vtoken v1))
      (not (available-vtoken v2))
      (not (available-vtoken v3))
      (not (available-vtoken v4))

      (not (available-ltoken l1))
      (not (available-ltoken l2))
      (not (available-ltoken l3))
      (not (available-ltoken l4))
    )
  )
  (:metric minimize (total-cost))
)