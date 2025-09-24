(define (problem combined-trip-venice-dubrovnik-istanbul)
  (:domain integrated-trip-planning)
  (:objects
    traveler - traveler
    venice dubrovnik istanbul - city
    d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - daycount
  )
  (:init
    (at traveler dubrovnik)
    (visited dubrovnik)
    (direct dubrovnik venice)
    (direct dubrovnik istanbul)
    (dayleft d11)
    (next d11 d10)
    (next d10 d9)
    (next d9 d8)
    (next d8 d7)
    (next d7 d6)
    (next d6 d5)
    (next d5 d4)
    (next d4 d3)
    (next d3 d2)
    (next d2 d1)
    (next d1 d0)
    (preferred venice d6)
    (preferred dubrovnik d4)
    (preferred istanbul d3)
  )

  (:goal (and
    (visited venice)
    (visited dubrovnik)
    (visited istanbul)
    (dayleft d0)
  ))

  (:metric minimize (total-cost))
)