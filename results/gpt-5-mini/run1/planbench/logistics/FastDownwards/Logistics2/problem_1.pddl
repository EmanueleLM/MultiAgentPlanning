(define (problem logistics_instance)
  (:domain logistics_multiagent)

  (:objects
    ; cities
    city_0 city_1 - city

    ; locations (airports typed as airport)
    location_0_0 location_1_0 - airport

    ; vehicles
    truck_0 truck_1 - truck
    airplane_0 - airplane

    ; packages
    package_0 package_1 - package
  )

  (:init
    ; location-city membership
    (in_city location_0_0 city_0)
    (in_city location_1_0 city_1)

    ; airport marker (consistent with typing)
    (is_airport location_0_0)
    (is_airport location_1_0)

    ; vehicle initial locations
    (at_veh airplane_0 location_1_0)
    (at_veh truck_0 location_0_0)
    (at_veh truck_1 location_1_0)

    ; packages start at location_1_0
    (at_pkg package_0 location_1_0)
    (at_pkg package_1 location_1_0)

    ; explicit different-city facts for the two airports (both directions)
    (different_city location_0_0 location_1_0)
    (different_city location_1_0 location_0_0)
  )

  (:goal (and
    (at_pkg package_0 location_0_0)
    (at_pkg package_1 location_0_0)
  ))
)