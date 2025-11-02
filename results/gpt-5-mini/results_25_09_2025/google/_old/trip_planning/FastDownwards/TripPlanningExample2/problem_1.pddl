(define (problem integrated-trip-problem)
  (:domain integrated-trip-domain)

  (:objects
    reykjavik vienna venice - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
    r1 r2 - rreq
    v1 v2 v3 v4 v5 v6 v7 - vreq
  )

  (:init
    ;; consecutive day relations
    (consecutive d1 d2)
    (consecutive d2 d3)
    (consecutive d3 d4)
    (consecutive d4 d5)
    (consecutive d5 d6)
    (consecutive d6 d7)
    (consecutive d7 d8)
    (consecutive d8 d9)
    (consecutive d9 d10)
    (consecutive d10 d11)

    ;; direct flights (only direct flights are allowed)
    (direct reykjavik vienna)
    (direct vienna reykjavik)
    (direct vienna venice)
    (direct venice vienna)

    ;; Mark the Reykjavik city
    (is-reykjavik reykjavik)

    ;; Wedding-window days (day 8..11 inclusive)
    (wedding-day d8)
    (wedding-day d9)
    (wedding-day d10)
    (wedding-day d11)

    ;; Reykjavik requirement tokens available (2 days)
    (rreq-available r1)
    (rreq-available r2)

    ;; Vienna requirement tokens available (7 days)
    (vreq-available v1) (vreq-available v2) (vreq-available v3)
    (vreq-available v4) (vreq-available v5) (vreq-available v6) (vreq-available v7)

    ;; initial total cost
    (= (total-cost) 0)
  )

  (:goal (and
    ;; All days assigned
    (assigned d1) (assigned d2) (assigned d3) (assigned d4) (assigned d5)
    (assigned d6) (assigned d7) (assigned d8) (assigned d9) (assigned d10) (assigned d11)

    ;; Reykjavik requirement satisfied (both Reykjavik tokens used)
    (rreq-used r1) (rreq-used r2)

    ;; Vienna requirement satisfied (all 7 Vienna tokens used)
    (vreq-used v1) (vreq-used v2) (vreq-used v3)
    (vreq-used v4) (vreq-used v5) (vreq-used v6) (vreq-used v7)

    ;; Wedding attendance
    (wedding-attended)
  ))

  (:metric minimize (total-cost))
)