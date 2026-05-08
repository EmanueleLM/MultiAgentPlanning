(define (problem multiagent_transport_problem)
  (:domain multiagent_transport)

  (:objects
    ;; vehicles
    truck_0 - truck
    plane_0 - plane

    ;; packages
    package_0 package_1 - package

    ;; locations: indexed as in the specification
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 - location
  )

  (:init
    ;; initial vehicle positions
    (at truck_0 location_0_0)
    (at plane_0 location_1_1)

    ;; initial package positions (packages start on the ground at their source locations)
    (at-pkg package_0 location_0_0)
    (at-pkg package_1 location_1_1)

    ;; both vehicles initially free (capacity enforced as exactly 1 by free/not-free toggling)
    (free truck_0)
    (free plane_0)

    ;; road connectivity for the truck's region (explicit, bidirectional)
    (road-connect location_0_0 location_0_1)
    (road-connect location_0_1 location_0_0)
    (road-connect location_0_1 location_0_2)
    (road-connect location_0_2 location_0_1)

    ;; air connectivity for the plane's region (explicit, bidirectional)
    (air-connect location_1_1 location_1_0)
    (air-connect location_1_0 location_1_1)
  )

  (:goal (and
    ;; mandated terminal conditions
    (at-pkg package_0 location_0_2)
    (at-pkg package_1 location_1_0)
  ))
)