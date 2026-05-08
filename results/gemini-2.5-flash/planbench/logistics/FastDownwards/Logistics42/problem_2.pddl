(define (problem logistics_problem_42)
  (:domain logistics_domain)
  (:objects
    package_0 - package
    truck_0 - truck
    truck_1 - truck
    truck_2 - truck
    airplane_0 - airplane
    location_0_0 location_1_0 location_2_0 - location
    city_0 city_1 city_2 - city
  )
  (:init
    (is_airport location_0_0)
    (is_airport location_1_0)
    (is_airport location_2_0)

    (at_vehicle airplane_0 location_2_0)
    (at_package package_0 location_0_0)
    (at_vehicle truck_0 location_0_0)
    (at_vehicle truck_1 location_1_0)
    (at_vehicle truck_2 location_2_0)

    (loc_in_city location_0_0 city_0)
    (loc_in_city location_1_0 city_1)
    (loc_in_city location_2_0 city_2)
  )
  (:goal (at_package package_0 location_1_0))