(define (problem deliver_package0)
  (:domain transport_multiagent)

  (:objects
    ;; cities
    city_0 city_1 - city

    ;; locations
    location_0_0 location_0_1 location_1_0 location_1_1 - location

    ;; vehicles
    truck_0 truck_1 - truck
    airplane_0 - airplane
    ;; vehicle supertype objects are represented by their subtypes; in_pkg uses vehicle type

    ;; packages
    package_0 - package
  )

  (:init
    ;; --- static membership and airports (from public information)
    (in_city location_0_0 city_0)
    (in_city location_0_1 city_0)
    (in_city location_1_0 city_1)
    (in_city location_1_1 city_1)

    (airport location_0_0)
    (airport location_1_0)

    ;; --- static same_city / diff_city relations (explicitly enumerated from in_city)
    ;; same city pairs (city_0)
    (same_city location_0_0 location_0_0)
    (same_city location_0_0 location_0_1)
    (same_city location_0_1 location_0_0)
    (same_city location_0_1 location_0_1)
    ;; same city pairs (city_1)
    (same_city location_1_0 location_1_0)
    (same_city location_1_0 location_1_1)
    (same_city location_1_1 location_1_0)
    (same_city location_1_1 location_1_1)

    ;; diff city pairs (all cross-city ordered pairs)
    (diff_city location_0_0 location_1_0)
    (diff_city location_0_0 location_1_1)
    (diff_city location_0_1 location_1_0)
    (diff_city location_0_1 location_1_1)
    (diff_city location_1_0 location_0_0)
    (diff_city location_1_0 location_0_1)
    (diff_city location_1_1 location_0_0)
    (diff_city location_1_1 location_0_1)

    ;; --- assigned trucks to cities (static metadata; each city has exactly one truck)
    (assigned_to truck_0 city_0)
    (assigned_to truck_1 city_1)

    ;; --- initial dynamic state (locations of trucks, airplane, and package)
    (at_truck truck_0 location_0_0)
    (at_truck truck_1 location_1_1)

    (at_airplane airplane_0 location_0_0)

    (at_pkg package_0 location_0_1)
  )

  (:goal (and
    (at_pkg package_0 location_1_0)
  ))
)