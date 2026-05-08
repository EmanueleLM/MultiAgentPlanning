(define (problem logistics-instance-0)
  (:domain logistics-multi-agent)

  (:objects
    ;; trucks and planes (agent vehicles)
    truck_0 - truck
    plane_1 - plane

    ;; packages
    package_0 package_1 - package

    ;; locations: region 0 (locations with prefix location_0_*) and region 1 (location_1_*)
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 - location
  )

  (:init
    ;; initial locations of vehicles
    (at truck_0 location_0_0)
    (at plane_1 location_1_1)

    ;; vehicles start empty (capacity 1 enforced by 'free')
    (free truck_0)
    (free plane_1)

    ;; initial locations of packages
    (at package_0 location_0_0)
    (at package_1 location_1_1)

    ;; road connectivity for trucks (bidirectional explicit)
    (road location_0_0 location_0_1)
    (road location_0_1 location_0_0)
    (road location_0_1 location_0_2)
    (road location_0_2 location_0_1)

    ;; air routes for planes (bidirectional explicit)
    (airroute location_1_1 location_1_0)
    (airroute location_1_0 location_1_1)
  )

  (:goal
    (and
      ;; mandated terminal conditions
      (at package_0 location_0_2)
      (at package_1 location_1_0)
    )
  )
)