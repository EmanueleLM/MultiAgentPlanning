(define (problem deliver-pkg1-city2)
  (:domain transport-multiagent)
  (:objects
    truck1 - truck
    plane1 - airplane
    city1 city2 airport1 airport2 - location
    pkg1 - package
  )

  (:init
    ; location typing
    (city city1)
    (city city2)
    (airport airport1)
    (airport airport2)

    ; initial vehicle positions
    (at truck1 city1)
    (at plane1 airport1)

    ; initial package position: in city1 (needs to go to city2)
    (at-pkg pkg1 city1)

    ; both vehicles start empty
    (empty truck1)
    (empty plane1)

    ; road connectivity (bidirectional explicitized)
    (road-connected city1 airport1)
    (road-connected airport1 city1)
    (road-connected airport2 city2)
    (road-connected city2 airport2)

    ; air routes (bidirectional)
    (air-route airport1 airport2)
    (air-route airport2 airport1)
  )

  (:goal (and
    ; Terminal condition: package must be at city2
    (at-pkg pkg1 city2)
  ))