(define (problem combined-trip-venice-dubrovnik-istanbul)
  (:domain integrated-trip-planning)
  (:objects
    traveler - traveler
    venice dubrovnik istanbul - city
  )
  (:init
    ;; Starting location: Dubrovnik
    (at traveler dubrovnik)
    (visited dubrovnik)

    ;; Known direct flights (as provided by the agents)
    (direct dubrovnik venice)
    (direct dubrovnik istanbul)

    ;; Total available days
    (= (days-left) 11)

    ;; Preferred stays (informational, not enforced)
    (= (preferred-days venice) 6)
    (= (preferred-days dubrovnik) 4)
    (= (preferred-days istanbul) 3)
  )

  ;; Global goal: visit all three cities and use exactly the total available days
  (:goal (and
    (visited venice)
    (visited dubrovnik)
    (visited istanbul)
    (= (days-left) 0)
  ))
)