(define (problem transport_instance_0)
  (:domain jack_of_all_trades_transport)

  (:objects
    package_0 - package
    truck_0 truck_1 truck_2 - truck
    airplane_0 airplane_1 airplane_2 - airplane
    location_0_0 location_1_0 location_2_0 - location
    city_0 city_1 city_2 - city
  )

  (:init
    ;; airports
    (airport location_0_0)
    (airport location_1_0)
    (airport location_2_0)

    ;; airplanes at locations
    (at-airplane airplane_0 location_0_0)
    (at-airplane airplane_1 location_1_0)
    (at-airplane airplane_2 location_2_0)

    ;; packages at locations
    (at-package package_0 location_2_0)

    ;; trucks at locations
    (at-truck truck_0 location_0_0)
    (at-truck truck_1 location_1_0)
    (at-truck truck_2 location_2_0)

    ;; location -> city assignments
    (in-city location_0_0 city_0)
    (in-city location_1_0 city_1)
    (in-city location_2_0 city_2)
  )

  (:goal (and
    (at-package package_0 location_1_0)
  ))
)