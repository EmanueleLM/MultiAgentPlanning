(define (problem logistics_instance_problem)
  (:domain logistics_instance)

  (:objects
    city_0 city_1 city_2 - city
    location_0_0 location_1_0 location_2_0 - location
    airplane_0 airplane_1 airplane_2 - airplane
    truck_0 truck_1 truck_2 - truck
    package_0 - package
  )

  (:init
    (airport location_0_0)
    (airport location_1_0)
    (airport location_2_0)

    (at airplane_0 location_0_0)
    (at airplane_1 location_1_0)
    (at airplane_2 location_2_0)

    (at truck_0 location_0_0)
    (at truck_1 location_1_0)
    (at truck_2 location_2_0)

    (at package_0 location_2_0)

    (in_city location_0_0 city_0)
    (in_city location_1_0 city_1)
    (in_city location_2_0 city_2)

    (truck_in_city truck_0 city_0)
    (truck_in_city truck_1 city_1)
    (truck_in_city truck_2 city_2)

    (road location_0_0 location_0_0 city_0)
    (road location_1_0 location_1_0 city_1)
    (road location_2_0 location_2_0 city_2)

    (air_link location_0_0 location_1_0)
    (air_link location_0_0 location_2_0)
    (air_link location_1_0 location_0_0)
    (air_link location_1_0 location_2_0)
    (air_link location_2_0 location_0_0)
    (air_link location_2_0 location_1_0)
  )

  (:goal
    (and
      (at package_0 location_1_0)
    )
  )
)