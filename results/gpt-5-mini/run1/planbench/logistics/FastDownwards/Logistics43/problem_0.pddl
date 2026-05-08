(define (problem jack_instance_0)
  (:domain jack_of_all_trades_transport_instance)
  (:objects
    location_0_0 location_1_0 location_2_0 - location
    city_0 city_1 city_2 - city
    airplane_0 airplane_1 - airplane
    truck_0 truck_1 truck_2 - truck
    package_0 - package
  )
  (:init
    ;; airports
    (airport location_0_0)
    (airport location_1_0)
    (airport location_2_0)

    ;; airplanes at locations
    (at airplane_0 location_2_0)
    (at airplane_1 location_0_0)

    ;; package locations
    (at package_0 location_0_0)

    ;; trucks at locations
    (at truck_0 location_0_0)
    (at truck_1 location_1_0)
    (at truck_2 location_2_0)

    ;; location -> city membership (static)
    (in_city location_0_0 city_0)
    (in_city location_1_0 city_1)
    (in_city location_2_0 city_2)
  )
  (:goal (and (at package_0 location_1_0)))
)