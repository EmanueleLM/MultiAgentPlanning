(define (problem integrated-trip-problem)
  (:domain integrated-trip-domain)

  (:objects
    berlin munich dubrovnik - city
    d1 d2 d3 d4 d5 d6 d7 d8 - day
  )

  (:init
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5)
    (next d5 d6) (next d6 d7) (next d7 d8)

    (direct-flight munich dubrovnik)
    (direct-flight dubrovnik munich)
    (direct-flight berlin munich)
    (direct-flight munich berlin)

    (is-berlin berlin)

    (is-day1 d1)
    (is-day4 d4)

    (at berlin d1)
  )

  (:goal
    (and
      (attended-day1)
      (attended-day4)
      ;; Reconciled allocation fitting 8 days:
      ;; Berlin on days d1, d2, d4 (3 days, including conferences d1 and d4)
      (at berlin d2)
      (at berlin d4)
      ;; Munich on days d3, d5, d6 (3 days)
      (at munich d3)
      (at munich d5)
      (at munich d6)
      ;; Dubrovnik on days d7, d8 (2 days)
      (at dubrovnik d7)
      (at dubrovnik d8)
    )
  )
)