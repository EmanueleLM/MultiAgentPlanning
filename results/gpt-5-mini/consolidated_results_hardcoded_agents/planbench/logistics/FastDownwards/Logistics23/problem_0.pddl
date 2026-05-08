(define (problem transport_problem)
  (:domain transport_domain)
  (:objects
    truck_0 - truck
    airplane_0 - airplane
    package_0 package_1 - package
    location_1_0 location_1_1 - location
  )

  (:init
    ;; initial package locations (start positions)
    (at-package package_0 location_1_0)
    (at-package package_1 location_1_1)

    ;; packages are initially available (not loaded)
    (available package_0)
    (available package_1)

    ;; vehicle initial locations
    (at-truck truck_0 location_1_0)
    (at-plane airplane_0 location_1_1)

    ;; connectivity: only provide the explicit routes that exist in this environment
    ;; truck can drive between the two locations (both directions)
    (road location_1_0 location_1_1)
    (road location_1_1 location_1_0)

    ;; airplane can fly between the two locations (both directions)
    (air-route location_1_0 location_1_1)
    (air-route location_1_1 location_1_0)
  )

  (:goal
    (and
      ;; specified terminal conditions: package_0 must end at location_1_1,
      ;; package_1 must end at location_1_0
      (at-package package_0 location_1_1)
      (at-package package_1 location_1_0)
    )
  )
)