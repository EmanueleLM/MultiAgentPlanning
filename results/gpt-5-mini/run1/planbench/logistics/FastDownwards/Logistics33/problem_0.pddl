(define (problem jack_of_all_trades_instance)
  (:domain jack_of_all_trades)
  (:objects
    package_0 package_1 package_2 package_3 package_4 - package
    truck_0 truck_1 - truck
    airplane_0 - airplane
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location
    city_0 city_1 - city
  )

  (:init
    ;; airports
    (airport location_0_0)
    (airport location_1_0)

    ;; airplane location
    (airplaneat airplane_0 location_0_0)

    ;; trucks locations
    (truckat truck_0 location_0_2)
    (truckat truck_1 location_1_1)

    ;; package locations (none are in vehicles initially)
    (at package_0 location_0_1)
    (at package_1 location_1_0)
    (at package_2 location_1_0)
    (at package_3 location_0_0)
    (at package_4 location_1_2)

    ;; location in city assignments (static)
    (locationin location_0_0 city_0)
    (locationin location_0_1 city_0)
    (locationin location_0_2 city_0)
    (locationin location_1_0 city_1)
    (locationin location_1_1 city_1)
    (locationin location_1_2 city_1)
  )

  (:goal (and
    (at package_0 location_0_1)
    (at package_1 location_0_1)
    (at package_2 location_0_0)
    (at package_3 location_0_0)
    (at package_4 location_1_0)
  ))
)