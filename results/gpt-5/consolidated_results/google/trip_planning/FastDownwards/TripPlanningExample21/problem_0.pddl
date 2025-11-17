(define (problem trip10-instance)
  (:domain trip10)
  (:objects
    venice rome florence - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )
  (:init
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)

    (at d1 rome)
    (visited rome)

    (direct rome rome)
    (direct florence florence)
    (direct venice venice)

    (direct rome florence)
    (direct florence rome)

    (direct florence venice)
    (direct venice florence)

    (direct rome venice)
    (direct venice rome)
  )
  (:goal (and
    (visited rome)
    (visited florence)
    (visited venice)
    (at d5 venice)
    (at d6 venice)
    (at d7 venice)
    (at d8 venice)
    (at d9 venice)
    (at d10 venice)
  ))
)