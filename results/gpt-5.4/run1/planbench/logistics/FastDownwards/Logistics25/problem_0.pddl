(define (problem logistics_problem_instance)
  (:domain logistics_instance)

  (:objects
    city_0 city_1 - city

    location_0_0 location_0_1 location_0_2
    location_1_0 location_1_1 location_1_2 - location

    truck_0 truck_1 - truck
    airplane_0 - airplane

    package_0 package_1 package_2 - package
  )

  (:init
    (airport location_0_0)
    (airport location_1_0)

    (different_city city_0 city_1)
    (different_city city_1 city_0)

    (in_city location_0_0 city_0)
    (in_city location_0_1 city_0)
    (in_city location_0_2 city_0)
    (in_city location_1_0 city_1)
    (in_city location_1_1 city_1)
    (in_city location_1_2 city_1)

    (at_airplane airplane_0 location_1_0)
    (at_pkg package_0 location_1_2)
    (at_pkg package_1 location_0_2)
    (at_pkg package_2 location_0_2)
    (at_truck truck_0 location_0_1)
    (at_truck truck_1 location_1_1)
  )

  (:goal
    (and
      (at_pkg package_0 location_0_0)
      (at_pkg package_1 location_1_1)
      (at_pkg package_2 location_1_2)
    )
  )
)