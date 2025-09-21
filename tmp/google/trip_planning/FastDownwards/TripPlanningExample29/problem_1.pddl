(define (problem integrated-trip-fd)
  (:domain integrated_trip_fd)

  (:objects
    frankfurt krakow dubrovnik - city
    d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
    k0 k1 k2 k3 k4 k5 k6 k7 k8 k9 k10 - kcount
    f0 f1 f2 f3 - fcount
  )

  (:init
    ;; direct flights (public information)
    (direct frankfurt krakow)
    (direct krakow frankfurt)
    (direct dubrovnik frankfurt)
    (direct frankfurt dubrovnik)

    ;; city marker
    (is-dubrovnik dubrovnik)

    ;; wedding info
    (wedding-in krakow)

    ;; control flag
    (unstarted)

    ;; day chain and initial day = d0
    (day d0)
    (next d0 d1)
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)

    ;; krakow count chain and initial k0
    (krakow-count k0)
    (next-k k0 k1)
    (next-k k1 k2)
    (next-k k2 k3)
    (next-k k3 k4)
    (next-k k4 k5)
    (next-k k5 k6)
    (next-k k6 k7)
    (next-k k7 k8)
    (next-k k8 k9)
    (next-k k9 k10)

    ;; frankfurt count chain and initial f0
    (frankfurt-count f0)
    (next-f f0 f1)
    (next-f f1 f2)
    (next-f f2 f3)

    ;; total-cost starts at 0 (planner may use it)
    (= (total-cost) 0)
  )

  (:goal (and
    ;; visit all three cities
    (visited frankfurt)
    (visited krakow)
    (visited dubrovnik)

    ;; final day must be d10
    (day d10)

    ;; frankfurt must have exactly 3 stay-days (f3)
    (frankfurt-count f3)

    ;; krakow must have at least 2 days: accept k2..k10
    (or
      (krakow-count k2)
      (krakow-count k3)
      (krakow-count k4)
      (krakow-count k5)
      (krakow-count k6)
      (krakow-count k7)
      (krakow-count k8)
      (krakow-count k9)
      (krakow-count k10)
    )

    ;; wedding must be held
    (wedding-held)
  ))

  ;; No metric specified here; planner may minimize total-cost if configured to do so.
)