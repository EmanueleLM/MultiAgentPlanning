(define (problem integrated-trip-problem)
  (:domain integrated-trip)
  (:objects
    frankfurt bucharest stuttgart - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )

  (:init
    ;; available direct flights (symmetric where given)
    (direct bucharest frankfurt)
    (direct frankfurt bucharest)
    (direct frankfurt stuttgart)
    (direct stuttgart frankfurt)

    ;; day succession relations
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5)
    (next d5 d6) (next d6 d7) (next d7 d8) (next d8 d9) (next d9 d10)

    ;; initial counts
    (= (days-spent-frankfurt) 0)
    (= (days-spent-bucharest) 0)
    (= (days-spent-stuttgart) 0)
  )

  (:goal (and
    ;; 10-day itinerary: each day must be assigned (ensures a full 10-day schedule)
    (assigned d1) (assigned d2) (assigned d3) (assigned d4) (assigned d5)
    (assigned d6) (assigned d7) (assigned d8) (assigned d9) (assigned d10)

    ;; must spend at least 3 days in Frankfurt
    (>= (days-spent-frankfurt) 3)
    ;; must spend at least 3 days in Bucharest
    (>= (days-spent-bucharest) 3)

    ;; must attend/workshop by being in Stuttgart on some day between day 5 and day 10 (inclusive)
    (or (at stuttgart d5) (at stuttgart d6) (at stuttgart d7) (at stuttgart d8) (at stuttgart d9) (at stuttgart d10))
  ))
)