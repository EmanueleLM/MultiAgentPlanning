(define (problem trip-11days)
  (:domain itinerary-domain)
  (:objects
    reykjavik vienna venice - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
  )
  (:init
    ;; day progression
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5) (next d5 d6)
    (next d6 d7) (next d7 d8) (next d8 d9) (next d9 d10) (next d10 d11)

    ;; available direct flights (only these may be used)
    (flight reykjavik vienna) (flight vienna reykjavik)
    (flight vienna venice) (flight venice vienna)

    ;; starting location: earliest feasible start in Reykjavik (per Reykjavik preference)
    (at reykjavik d1)
  )

  ;; Goal: produce an 11-day itinerary that:
  ;; - stays in Reykjavik exactly on days 1-2 (preferred 2 days)
  ;; - stays in Vienna for the intermediate segment (days 3-7)
  ;; - stays in Venice exactly on days 8-11 (preferred 4 days AND attend wedding in day 8-11)
  ;; This plan uses only the declared direct flights and fits the 11-day trip.
  (:goal (and
    ;; Reykjavik stay (2 days)
    (at reykjavik d1) (at reykjavik d2)

    ;; Vienna stay (remaining middle days to fit total 11-day plan)
    (at vienna d3) (at vienna d4) (at vienna d5) (at vienna d6) (at vienna d7)

    ;; Venice stay including wedding window (days 8-11 inclusive)
    (at venice d8) (at venice d9) (at venice d10) (at venice d11)
  ))
)