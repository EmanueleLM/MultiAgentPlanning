(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades_transport)

  (:objects
    city_0 city_1 city_2 - city
    location_0_0 location_1_0 location_2_0 - location
    truck_0 truck_1 truck_2 - truck
    airplane_0 airplane_1 - airplane
    package_0 - package
  )

  (:init
    ;; airports
    (airport location_0_0)
    (airport location_1_0)
    (airport location_2_0)

    ;; airplanes initial locations
    (at-plane airplane_0 location_0_0)
    (at-plane airplane_1 location_1_0)

    ;; packages initial locations
    (at-package package_0 location_2_0)

    ;; trucks initial locations
    (at-truck truck_0 location_0_0)
    (at-truck truck_1 location_1_0)
    (at-truck truck_2 location_2_0)

    ;; location belongs to city
    (in-city location_0_0 city_0)
    (in-city location_1_0 city_1)
    (in-city location_2_0 city_2)

    ;; truck assigned to city (static)
    (truck-city truck_0 city_0)
    (truck-city truck_1 city_1)
    (truck-city truck_2 city_2)
  )

  (:goal (and
    (at-package package_0 location_1_0)
  ))
)