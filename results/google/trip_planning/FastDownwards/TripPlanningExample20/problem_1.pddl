(define (problem trip-planning-example20)
  (:domain trip-planning-domain)
  (:objects
    istanbul budapest dubrovnik - city
  )
  (:init
    (at dubrovnik)

    (direct istanbul budapest)
    (direct budapest istanbul)
    (direct dubrovnik istanbul)

    (= (day) 0)
    (= (shortfall istanbul) 5)
    (= (shortfall budapest) 6)
    (= (shortfall dubrovnik) 3)
    (= (total-cost) 0)
  )
  (:goal (and
    (= (day) 12)
    (visited istanbul)
    (visited budapest)
    (visited dubrovnik)
    (settled istanbul)
    (settled budapest)
    (settled dubrovnik)
  ))
  (:metric (minimize (total-cost)))
)