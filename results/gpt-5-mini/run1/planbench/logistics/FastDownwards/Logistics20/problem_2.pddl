(define (problem move-package-0)
  (:domain logistics20)

  (:objects
    city_0 city_1 - city

    location_0_0 location_0_1 location_0_2
    location_1_0 location_1_1 location_1_2 - location

    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane

    package_0 - package
  )

  (:init
    ;; city membership
    (loc_in_city location_0_0 city_0)
    (loc_in_city location_0_1 city_0)
    (loc_in_city location_0_2 city_0)

    (loc_in_city location_1_0 city_1)
    (loc_in_city location_1_1 city_1)
    (loc_in_city location_1_2 city_1)

    ;; airports
    (airport location_0_0)
    (airport location_1_0)

    ;; road connectivity: fully connected within each city (both directions)
    (connected_road location_0_0 location_0_1)
    (connected_road location_0_0 location_0_2)
    (connected_road location_0_1 location_0_0)
    (connected_road location_0_1 location_0_2)
    (connected_road location_0_2 location_0_0)
    (connected_road location_0_2 location_0_1)

    (connected_road location_1_0 location_1_1)
    (connected_road location_1_0 location_1_2)
    (connected_road location_1_1 location_1_0)
    (connected_road location_1_1 location_1_2)
    (connected_road location_1_2 location_1_0)
    (connected_road location_1_2 location_1_1)

    ;; air connectivity between airports (both directions)
    (connected_air location_0_0 location_1_0)
    (connected_air location_1_0 location_0_0)

    ;; initial vehicle positions
    (plane_at airplane_0 location_0_0)
    (plane_at airplane_1 location_1_0)

    (truck_at truck_0 location_0_1)
    (truck_at truck_1 location_1_0)

    ;; package initial location
    (at package_0 location_1_1)
  )

  (:goal (and
    (at package_0 location_1_2)
  ))
)