(define (problem logistics-instance-1)
  (:domain logistics-lite)

  ;; Objects in the world
  (:objects
    package_0 package_1 package_2 - package
    truck_0 - truck
    plane_0 - plane
    location_1_0 location_1_1 - location
  )

  ;; Initial state: explicit facts only (no invented resources beyond these)
  (:init
    ;; vehicle initial positions
    (truck-at truck_0 location_1_0)
    (plane-at plane_0 location_1_1)

    ;; package initial positions
    (package-at package_0 location_1_0)
    (package-at package_1 location_1_0)
    (package-at package_2 location_1_1)

    ;; connectivity (explicit, bidirectional where declared)
    (road location_1_0 location_1_1)
    (road location_1_1 location_1_0)
    (air-route location_1_0 location_1_1)
    (air-route location_1_1 location_1_0)
  )

  ;; Goals: final required terminal conditions (hard constraints)
  (:goal (and
    (package-at package_0 location_1_1)
    (package-at package_1 location_1_1)
    (package-at package_2 location_1_0)
  ))
)