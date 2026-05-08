(define (problem logistics-instance-1)
  (:domain logistics-ns)

  ;; Objects: trucks, planes, packages, locations, cities
  (:objects
    truck1 - truck
    plane1 - plane

    pkg1 pkg2 - package

    a1_airport a2_loc a3_loc b1_airport b2_loc - location

    cityA cityB - city
  )

  (:init
    ;; type declarations (informational, also used if domain included them as predicates)
    (truck truck1)
    (plane plane1)
    (package pkg1)
    (package pkg2)
    (location a1_airport)
    (location a2_loc)
    (location a3_loc)
    (location b1_airport)
    (location b2_loc)
    (city cityA)
    (city cityB)

    ;; airport classification
    (airport a1_airport)
    (airport b1_airport)

    ;; location -> city membership
    (in-city a1_airport cityA)
    (in-city a2_loc cityA)
    (in-city a3_loc cityA)
    (in-city b1_airport cityB)
    (in-city b2_loc cityB)

    ;; initial positions of vehicles
    (at-truck truck1 a2_loc)
    (at-plane plane1 a1_airport)

    ;; initial package locations (not in any vehicle)
    (at-pack pkg1 a2_loc)      ;; pkg1 starts in cityA at location a2_loc; goal is b2_loc (cityB)
    (at-pack pkg2 a1_airport)  ;; pkg2 starts at airport in cityA; goal is a3_loc (cityA)
  )

  ;; Goals: every mandated terminal condition (packages delivered to their target locations)
  (:goal (and
    (at-pack pkg1 b2_loc)
    (at-pack pkg2 a3_loc)
  ))
)