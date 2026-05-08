(define (problem logistics-instance-1)
  (:domain logistics-orchestrated)

  (:objects
    truck1 - truck
    plane1 - airplane
    pkg1 pkg2 - package

    locA1 airportA locB1 airportB - location

    cityA cityB - city
  )

  (:init
    ;; City declarations
    (city cityA)
    (city cityB)

    ;; Location -> city membership
    (in-city locA1 cityA)
    (in-city airportA cityA)
    (in-city locB1 cityB)
    (in-city airportB cityB)

    ;; Airports
    (airport airportA)
    (airport airportB)

    ;; Initial vehicle positions
    (truck-at truck1 locA1)
    (plane-at plane1 airportA)

    ;; Initial package locations
    (package-at pkg1 locA1)
    (package-at pkg2 airportA)
  )

  ;; Goals: all packages must be at their required destination locations.
  (:goal
    (and
      (package-at pkg1 locB1)
      (package-at pkg2 locA1)
    )
  )
)