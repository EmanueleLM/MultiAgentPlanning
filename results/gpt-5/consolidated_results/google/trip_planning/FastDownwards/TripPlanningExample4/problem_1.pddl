(define (problem trip-planning-example4-problem)
  (:domain trip-planning-example4)
  (:objects
    seville munich tallinn - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - day
  )
  (:init
    ; direct-flight adjacency (undirected)
    (adjacent seville munich)
    (adjacent munich seville)
    (adjacent munich tallinn)
    (adjacent tallinn munich)

    ; day successors
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5)
    (next d5 d6) (next d6 d7) (next d7 d8) (next d8 d9)
    (next d9 d10) (next d10 d11) (next d11 d12)

    ; start at day 1 in the first city of the audited order
    (at seville d1)
    (daycur d1)
  )
  (:goal (and
    ; audited day-by-day city assignments ensuring exactly one city per day
    (at seville d1)
    (at seville d2)
    (at seville d3)
    (at seville d4)
    (at seville d5)
    (at seville d6)
    (at seville d7)
    (at munich d8)
    (at munich d9)
    (at munich d10)
    (at tallinn d11)
    (at tallinn d12)

    ; ensure the 12-day horizon is completed
    (daycur d12)
  ))
)