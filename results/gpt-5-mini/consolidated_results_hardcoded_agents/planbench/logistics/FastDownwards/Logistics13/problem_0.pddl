(define (problem transport_problem)
  (:domain multi_transport)

  (:objects
    truck_0 - truck
    airplane_0 - airplane
    package_0 package_1 package_2 - package
    location_0_1 location_1_1 location_2_1 location_3_1 - location
  )

  (:init
    ;; Vehicles initial positions
    (at-veh truck_0 location_1_1)
    (at-veh airplane_0 location_0_1)

    ;; Packages initial locations (not in any vehicle)
    (at-pkg package_0 location_1_1)
    (at-pkg package_1 location_2_1)
    (at-pkg package_2 location_3_1)
    (free package_0)
    (free package_1)
    (free package_2)

    ;; Road connectivity (bidirectional edges explicitly enumerated)
    (road-connected location_1_1 location_0_1)
    (road-connected location_0_1 location_1_1)
    (road-connected location_2_1 location_0_1)
    (road-connected location_0_1 location_2_1)
    (road-connected location_3_1 location_0_1)
    (road-connected location_0_1 location_3_1)
    ;; Additional road links to allow truck traversal among non-goal nodes via the hub
    (road-connected location_1_1 location_2_1)
    (road-connected location_2_1 location_1_1)
    (road-connected location_2_1 location_3_1)
    (road-connected location_3_1 location_2_1)

    ;; Air connectivity (air routes between airports)
    (air-connected location_0_1 location_2_1)
    (air-connected location_2_1 location_0_1)

    ;; Airport designation: plane operations only at airports
    (airport location_0_1)
    ;; other locations are implicitly non-airports (no (airport ...) fact)
  )

  (:goal
    (and
      ;; All packages must be physically at the destination location_0_1
      (at-pkg package_0 location_0_1)
      (at-pkg package_1 location_0_1)
      (at-pkg package_2 location_0_1)

      ;; Auditor-required terminal condition: packages must not be inside any vehicle
      (free package_0)
      (free package_1)
      (free package_2)
    )
  )
)