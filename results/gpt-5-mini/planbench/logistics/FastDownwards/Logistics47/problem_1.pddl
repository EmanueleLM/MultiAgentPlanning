(define (problem logistics47_instance)
  (:domain logistics47)

  (:objects
    ;; locations
    location_0_0 location_1_0 location_2_0 - location
    ;; cities
    city_0 city_1 city_2 - city
    ;; trucks
    truck_0 truck_1 truck_2 - truck
    ;; airplanes
    airplane_0 - airplane
    ;; packages
    package_0 package_1 - package
  )

  (:init
    ;; airports
    (airport location_0_0)
    (airport location_1_0)
    (airport location_2_0)

    ;; location to city mapping
    (in_city location_0_0 city_0)
    (in_city location_1_0 city_1)
    (in_city location_2_0 city_2)

    ;; initial locations of vehicles and packages
    (at_airplane airplane_0 location_1_0)
    (at_package package_0 location_1_0)
    (at_package package_1 location_2_0)
    (at_truck truck_0 location_0_0)
    (at_truck truck_1 location_1_0)
    (at_truck truck_2 location_2_0)
  )

  (:goal (and
    (at_package package_0 location_2_0)
    (at_package package_1 location_0_0)
  ))
)