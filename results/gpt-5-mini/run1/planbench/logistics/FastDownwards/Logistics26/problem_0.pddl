(define (problem multi_modal_transport_problem)
  (:domain multi_modal_transport)

  (:objects
    ; cities
    city_0 city_1 - city

    ; locations: each city has three named locations
    location_0_0 location_0_1 location_0_2
    location_1_0 location_1_1 location_1_2 - location

    ; packages
    package_0 package_1 package_2 - package

    ; trucks (operate within a single city)
    truck_0 truck_1 - truck

    ; airplanes (operate between airports in different cities)
    airplane_0 airplane_1 - airplane
  )

  (:init
    ; Airports
    (airport location_0_0)
    (airport location_1_0)

    ; Initial vehicle locations
    (at airplane_0 location_1_0)
    (at airplane_1 location_0_0)
    (at truck_0 location_0_1)
    (at truck_1 location_1_1)

    ; Initial package locations
    (at_pkg package_0 location_1_2)
    (at_pkg package_1 location_0_2)
    (at_pkg package_2 location_0_2)

    ; Location to city membership facts
    (loc_in_city location_0_0 city_0)
    (loc_in_city location_0_1 city_0)
    (loc_in_city location_0_2 city_0)
    (loc_in_city location_1_0 city_1)
    (loc_in_city location_1_1 city_1)
    (loc_in_city location_1_2 city_1)
  )

  (:goal (and
    (at_pkg package_0 location_0_0)
    (at_pkg package_1 location_1_1)
    (at_pkg package_2 location_1_2)
  ))
)