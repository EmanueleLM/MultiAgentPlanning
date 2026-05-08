(define (problem orchestrated-swap)
  (:domain logistics_orchestrated)
  (:objects
    package_0 package_1 - package
    truck_0 - truck
    plane_0 - airplane
    location_1_0 location_1_1 - location
  )

  (:init
    ;; initial placements of vehicles
    (at-truck truck_0 location_1_0)
    (at-plane plane_0 location_1_1)

    ;; initial placements of packages
    (at-pkg package_0 location_1_0)
    (at-pkg package_1 location_1_1)

    ;; both packages start free (not in any vehicle)
    (free package_0)
    (free package_1)

    ;; explicit bidirectional road connectivity between the two locations
    (road-connected location_1_0 location_1_1)
    (road-connected location_1_1 location_1_0)

    ;; explicit bidirectional air connectivity between the two locations
    (air-connected location_1_0 location_1_1)
    (air-connected location_1_1 location_1_0)
  )

  ;; Goal: package_0 must end at location_1_1 and package_1 must end at location_1_0
  (:goal (and
    (at-pkg package_0 location_1_1)
    (at-pkg package_1 location_1_0)
  ))
)