(define (problem logistics_mixed_problem)
  (:domain logistics_mixed)
  (:objects
    truck_0 - truck
    plane_0 - plane
    package_0 package_1 - package
    location_1_0 location_1_1 - location
  )

  (:init
    ; initial locations of vehicles
    (at_truck truck_0 location_1_0)
    (at_plane plane_0 location_1_1)

    ; initial package locations (chosen to require transport)
    (at_pkg package_0 location_1_0)
    (at_pkg package_1 location_1_1)

    ; both locations are airports (allowing airplane operations at both)
    (airport location_1_0)
    (airport location_1_1)

    ; bidirectional road connectivity (explicit)
    (road location_1_0 location_1_1)
    (road location_1_1 location_1_0)

    ; bidirectional air connectivity (explicit)
    (air_conn location_1_0 location_1_1)
    (air_conn location_1_1 location_1_0)
  )

  (:goal
    (and
      (at_pkg package_0 location_1_1)
      (at_pkg package_1 location_1_0)
    )
  )
)