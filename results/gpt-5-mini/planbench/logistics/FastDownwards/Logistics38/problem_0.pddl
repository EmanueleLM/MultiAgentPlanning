(define (problem jack_instance)
  (:domain jack_of_all_trades)

  (:objects
    city_0 city_1 - city
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location
    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane
    package_0 package_1 package_2 package_3 package_4 package_5 - package
  )

  (:init
    ;; airports
    (airport location_0_0)
    (airport location_1_0)

    ;; airplanes initial locations
    (at airplane_0 location_0_0)
    (at airplane_1 location_1_0)

    ;; trucks initial locations
    (at truck_0 location_0_0)
    (at truck_1 location_1_1)

    ;; packages initial locations
    (at package_0 location_1_0)
    (at package_1 location_1_1)
    (at package_2 location_1_2)
    (at package_3 location_1_1)
    (at package_4 location_0_1)
    (at package_5 location_0_1)

    ;; location -> city membership
    (loc_in_city location_0_0 city_0)
    (loc_in_city location_0_1 city_0)
    (loc_in_city location_0_2 city_0)
    (loc_in_city location_1_0 city_1)
    (loc_in_city location_1_1 city_1)
    (loc_in_city location_1_2 city_1)

    ;; truck city assignment (one truck per city)
    (truck_in_city truck_0 city_0)
    (truck_in_city truck_1 city_1)
  )

  (:goal (and
    (at package_0 location_0_0)
    (at package_1 location_1_1)
    (at package_2 location_0_2)
    (at package_3 location_0_0)
    (at package_4 location_1_0)
    (at package_5 location_0_1)
  ))
)