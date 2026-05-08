(define (problem logistics-audit-problem)
  (:domain logistics-audit)

  (:objects
    ; vehicles / agents
    truck1 truck2 - truck
    plane1 - airplane

    ; packages
    pkgA pkgB - package

    ; locations
    depot airportA airportB city1 city2 - location
    ; subtype declarations are handled in the domain typing - we repeat names as locations
    ; but need airport and city typed for actions that require those types:
    airportA airportB - airport
    city1 city2 - city

    ; phases
    phase1 phase2 phase3 - phase
  )

  (:init
    ; initial positions
    (at-truck truck1 depot)
    (at-truck truck2 airportB)
    (at-plane plane1 airportA)

    ; packages start at depot
    (at-pkg pkgA depot)
    (at-pkg pkgB depot)

    ; delivery intents (final destinations)
    (dest pkgA city1)
    (dest pkgB city2)

    ; topology - roads (truck connectivity)
    (road depot airportA)
    (road airportA depot)
    (road airportB city1)
    (road city1 airportB)
    (road airportB city2)
    (road city2 airportB)

    ; flight routes (air connectivity)
    (air-route airportA airportB)
    (air-route airportB airportA)

    ; phases exist but none are done initially
    (phase phase1)
    (phase phase2)
    (phase phase3)
  )

  (:goal
    (and
      ; All packages at final destination cities.
      (at-pkg pkgA city1)
      (at-pkg pkgB city2)

      ; All audit phases are explicitly completed.
      (phase-done phase1)
      (phase-done phase2)
      (phase-done phase3)
    )
  )
)