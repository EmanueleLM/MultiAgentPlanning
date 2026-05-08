(define (problem logistics-audit-problem)
  (:domain logistics-audit)

  (:objects
    truck1 truck2 - truck
    plane1 - airplane
    pkgA pkgB - package
    depot - location
    airportA airportB - airport
    city1 city2 - city
    phase1 phase2 phase3 - phase
  )

  (:init
    (at-truck truck1 depot)
    (at-truck truck2 airportB)
    (at-plane plane1 airportA)

    (at-pkg pkgA depot)
    (at-pkg pkgB depot)

    (dest pkgA city1)
    (dest pkgB city2)

    (road depot airportA)
    (road airportA depot)
    (road airportB city1)
    (road city1 airportB)
    (road airportB city2)
    (road city2 airportB)

    (air-route airportA airportB)
    (air-route airportB airportA)

    (phase phase1)
    (phase phase2)
    (phase phase3)
  )

  (:goal
    (and
      (at-pkg pkgA city1)
      (at-pkg pkgB city2)
      (phase-done phase1)
      (phase-done phase2)
      (phase-done phase3)
    )
  )
)