(define (problem logistics36-problem)
  (:domain logistics36)
  (:objects
    airplane_0 - airplane
    package_0 package_1 package_2 package_3 package_4 package_5 - package
    truck_0 truck_1 - truck
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location
    city_0 city_1 - city
  )
  (:init
    (is-airport location_0_0)
    (is-airport location_1_0)
    (at-airplane airplane_0 location_1_0)
    (at-package package_0 location_1_1)
    (at-package package_1 location_0_2)
    (at-package package_2 location_0_2)
    (at-package package_3 location_0_2)
    (at-package package_4 location_1_2)
    (at-package package_5 location_1_1)
    (at-truck truck_0 location_0_2)
    (at-truck truck_1 location_1_0)
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_0_2 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)
    (in-city location_1_2 city_1)
  )
  (:goal (and
    (at-package package_0 location_0_0)
    (at-package package_1 location_1_0)
    (at-package package_2 location_1_0)
    (at-package package_3 location_0_2)
    (at-package package_4 location_1_2)
    (at-package package_5 location_1_0)
  ))
)