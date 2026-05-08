(define (problem logistics_instance)
  (:domain logistics_multiagent)
  (:objects
    ; entities (packages and vehicles) as entities
    package_0 package_1 package_2 - entity
    truck_0 truck_1 plane_0 - entity

    ; places
    location_0_0 location_0_1 airport_0
    location_1_0 location_1_1 airport_1 - place

    ; cities
    city_0 city_1 - city
  )

  (:init
    ; classify airports
    (is-airport airport_0)
    (is-airport airport_1)

    ; map places to cities
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city airport_0 city_0)

    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)
    (in-city airport_1 city_1)

    ; initial positions of vehicles
    (at truck_0 location_0_0)
    (at truck_1 location_1_1)
    (at plane_0 airport_0)

    ; mark vehicle types
    (is-truck truck_0)
    (is-truck truck_1)
    (is-plane plane_0)

    ; initial positions of packages (public environment information)
    (at package_0 location_0_0)
    (at package_1 airport_0)
    (at package_2 location_1_1)

    ; road connectivity (truck/driving) - bidirectional roads explicitly listed
    (road location_0_0 location_0_1)
    (road location_0_1 location_0_0)

    (road location_0_0 airport_0)
    (road airport_0 location_0_0)

    (road location_1_1 location_1_0)
    (road location_1_0 location_1_1)

    (road location_1_1 airport_1)
    (road airport_1 location_1_1)

    ; air routes between airports (bidirectional where both directions listed)
    (air-route airport_0 airport_1)
    (air-route airport_1 airport_0)
  )

  (:goal (and
    (at package_0 location_0_1)
    (at package_1 location_1_1)
    (at package_2 location_1_0)
  ))
)