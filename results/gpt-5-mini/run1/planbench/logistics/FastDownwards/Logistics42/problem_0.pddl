(define (problem transport_instance)
  (:domain jack_of_all_trades_transport)

  (:objects
    package_0 - package
    truck_0 truck_1 truck_2 - truck
    airplane_0 - airplane
    location_0_0 location_1_0 location_2_0 - location
    city_0 city_1 city_2 - city
  )

  (:init
    ;; airports
    (is_airport location_0_0)
    (is_airport location_1_0)
    (is_airport location_2_0)

    ;; airplane location
    (airplane_at airplane_0 location_2_0)

    ;; package initial location and free status
    (at package_0 location_0_0)
    (free package_0)

    ;; trucks initial locations
    (truck_at truck_0 location_0_0)
    (truck_at truck_1 location_1_0)
    (truck_at truck_2 location_2_0)

    ;; location -> city membership
    (in_city location_0_0 city_0)
    (in_city location_1_0 city_1)
    (in_city location_2_0 city_2)
  )

  (:goal (and
    (at package_0 location_1_0)
  ))
)