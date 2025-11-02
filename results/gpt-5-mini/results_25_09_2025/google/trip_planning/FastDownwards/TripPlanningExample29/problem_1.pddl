(define (problem trip10)
  (:domain trip_planning)
  (:objects
    krakow frankfurt dubrovnik - city
    krakow_agent dubrovnik_agent frankfurt_agent - agent
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
  )
  (:init
    (in dubrovnik)
    (at-day d1)
    (direct-flight frankfurt krakow)
    (direct-flight krakow frankfurt)
    (direct-flight dubrovnik frankfurt)
    (direct-flight frankfurt dubrovnik)
    (can-advance d1 d6)
    (can-advance d6 d9)
    (can-advance d9 d11)
  )
  (:goal (and
    (visited dubrovnik)
    (visited frankfurt)
    (visited krakow)
    (at-day d11)
  ))
  (:metric minimize (total-cost))
)