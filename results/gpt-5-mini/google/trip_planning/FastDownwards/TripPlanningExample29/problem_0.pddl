(define (problem trip-problem)
  (:domain trip)

  (:objects
    dub fra krk - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )

  (:init
    ;; day objects (optional explicit typing)
    (day d1) (day d2) (day d3) (day d4) (day d5)
    (day d6) (day d7) (day d8) (day d9) (day d10)

    ;; day ordering
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5) (next d5 d6)
    (next d6 d7) (next d7 d8) (next d8 d9) (next d9 d10)

    ;; cities and direct flight connectivity (bidirectional facts)
    (city dub) (city fra) (city krk)
    (direct dub fra) (direct fra dub)
    (direct fra krk) (direct krk fra)

    ;; initial assignment according to the strict-feasible "Max-Dubrovnik" itinerary:
    ;; Days 1-5: Dubrovnik (non-travel)
    ;; Day 6: travel DUB->FRA (in-transit)
    ;; Day 7: Frankfurt (non-travel)
    ;; Day 8: travel FRA->KRK (in-transit)
    ;; Days 9-10: Krakow (non-travel)
    ;;
    ;; To enforce strict semantics and prevent double-counting, we model days as either
    ;; has-location (non-travel) or in-transit (travel), and we require every day to be assigned.

    ;; initial day1 presence and assigned
    (has-location dub d1)
    (assigned d1)

    ;; free = available to be consumed by actions; day1 already assigned so not free
    (free d2) (free d3) (free d4) (free d5)
    (free d6) (free d7) (free d8) (free d9) (free d10)
  )

  (:goal
    (and
      ;; require every day to be assigned (so stays + travel days cover all 10 days)
      (assigned d1) (assigned d2) (assigned d3) (assigned d4) (assigned d5)
      (assigned d6) (assigned d7) (assigned d8) (assigned d9) (assigned d10)

      ;; enforce the exact, temporally-consistent itinerary chosen under strict semantics:
      ;; contiguous Dubrovnik block (days 1-5)
      (has-location dub d1) (has-location dub d2) (has-location dub d3)
      (has-location dub d4) (has-location dub d5)

      ;; travel day 6 is an in-transit day (DUB -> FRA)
      (in-transit d6)

      ;; Frankfurt presence on day 7 (single non-travel Frankfurt day)
      (has-location fra d7)

      ;; travel day 8 is in-transit (FRA -> KRK)
      (in-transit d8)

      ;; Krakow on days 9-10; wedding must be attended on day 9 (non-travel)
      (has-location krk d9)
      (has-location krk d10)
    )
  )
)