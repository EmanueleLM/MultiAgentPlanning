(define (problem multi-logistics-problem)
  (:domain logistics-multiagent)
  (:objects
    package_0 package_1 package_2 package_3 - package
    truck_0 - truck
    airplane_0 - airplane
    location_0_0 location_0_1 location_1_0 location_1_1 - location
  )

  (:init
    ;; Initial locations of packages
    (at package_0 location_0_0)
    (at package_1 location_0_0)
    (at package_2 location_1_1)
    (at package_3 location_1_1)

    ;; Initial vehicle locations
    (at truck_0 location_0_0)
    (at airplane_0 location_1_1)

    ;; Connectivity: explicit bidirectional links
    (road-connected location_0_0 location_0_1)
    (road-connected location_0_1 location_0_0)

    (air-connected location_1_1 location_1_0)
    (air-connected location_1_0 location_1_1)
  )

  (:goal (and
    (at package_0 location_0_1)
    (at package_1 location_0_1)
    (at package_2 location_1_0)
    (at package_3 location_1_0)
  ))
)