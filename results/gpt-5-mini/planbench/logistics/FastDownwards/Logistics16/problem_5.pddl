(define (problem logistics16-problem)
  (:domain logistics16)

  (:objects
    city_0 city_1 - city
    location_0_0 location_0_1 location_1_0 location_1_1 - location
    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane
    package_0 package_1 package_2 package_3 - package
  )

  (:init
    ;; airports
    (airport location_0_0)
    (airport location_1_0)

    ;; location -> city assignments
    (in_city location_0_0 city_0)
    (in_city location_0_1 city_0)
    (in_city location_1_0 city_1)
    (in_city location_1_1 city_1)

    ;; truck -> city assignments (one truck per city)
    (truck_in_city truck_0 city_0)
    (truck_in_city truck_1 city_1)

    ;; initial vehicle positions
    (at airplane_0 location_0_0)
    (at airplane_1 location_0_0)
    (at truck_0 location_0_1)
    (at truck_1 location_1_1)

    ;; initial package positions
    (at_package package_0 location_1_1)
    (at_package package_1 location_1_0)
    (at_package package_2 location_1_1)
    (at_package package_3 location_0_0)
  )

  (:goal (and
    (at_package package_0 location_0_0)
    (at_package package_1 location_1_1)
    (at_package package_2 location_0_1)
    (at_package package_3 location_1_1)
  ))
)