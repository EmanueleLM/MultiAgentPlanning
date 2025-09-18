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

    (connected munich dubrovnik)
    (connected dubrovnik munich)
    (connected berlin munich)
    (connected munich berlin)

    (flight munich dubrovnik)
    (flight dubrovnik munich)
    (flight berlin munich)
    (flight munich berlin)

    (is-dubrovnik dubrovnik)
    (is-berlin berlin)
    (is-munich munich)

    (is-day1 d1)
    (is-day4 d4)

    (at berlin d1)
  )

  (:goal
    (and
      (attended-day1)
      (attended-day4)
      (at munich d2)
      (at munich d3)
      (at munich d5)
      (at dubrovnik d6)
      (at dubrovnik d7)
      (at dubrovnik d8)
    )
  )
)