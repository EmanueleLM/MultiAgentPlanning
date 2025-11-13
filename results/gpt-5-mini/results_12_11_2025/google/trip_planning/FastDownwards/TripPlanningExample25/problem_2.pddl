(define (problem itinerary-problem)
  (:domain itinerary)
  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
    valencia lyon split - city
  )
  (:init
    ;; Initial day marker
    (today d1)

    ;; Successor links to enforce contiguous day progression
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)
    (next d10 d11)
    (next d11 d12)
    (next d12 d13)
    (next d13 d14)
    (next d14 d15)
    (next d15 d16)

    ;; Direct-flight adjacency (symmetric/bidirectional as provided)
    (flight valencia lyon)
    (flight lyon valencia)
    (flight lyon split)
    (flight split lyon)
  )

  ;; Goal: enforce exact day-by-day occupancy so that durations and the show window are honored.
  ;; Days 1-5: Valencia (5 contiguous days)
  ;; Days 6-9: Lyon (4 days — adjusted from preferred 6 to satisfy hard constraints)
  ;; Days 10-16: Split (7 contiguous days covering the show)
  (:goal
    (and
      ;; Valencia days 1-5
      (at-day d1 valencia)
      (at-day d2 valencia)
      (at-day d3 valencia)
      (at-day d4 valencia)
      (at-day d5 valencia)

      ;; Lyon days 6-9
      (at-day d6 lyon)
      (at-day d7 lyon)
      (at-day d8 lyon)
      (at-day d9 lyon)

      ;; Split days 10-16 (inclusive)
      (at-day d10 split)
      (at-day d11 split)
      (at-day d12 split)
      (at-day d13 split)
      (at-day d14 split)
      (at-day d15 split)
      (at-day d16 split)
    )
  )
)