(define (problem logistics_instance)
  (:domain logistics_multiagent)

  ;; Notes / resolutions:
  ;; - Airports are explicitly marked with (is_airport ...).
  ;; - Inter-city flight permissibility is expressed by explicit (different_city ...) facts in init.
  ;; - Truck driving is allowed only between locations that share the same city (checked by in_city).
  ;; - No vehicle capacity constraints are specified in the original instance; thus vehicles are modeled with unbounded capacity (as in the provided facts/actions).

  (:objects
    city_0 city_1 - city

    location_0_0 location_1_0 - location

    truck_0 truck_1 - truck
    airplane_0 - airplane

    package_0 package_1 - package
  )

  (:init
    ;; location -> city membership
    (in_city location_0_0 city_0)
    (in_city location_1_0 city_1)

    ;; airport markers
    (is_airport location_0_0)
    (is_airport location_1_0)

    ;; vehicles initial locations
    (at_plane airplane_0 location_1_0)
    (at_truck truck_0 location_0_0)
    (at_truck truck_1 location_1_0)

    ;; packages initial locations (not in any vehicle)
    (at_pkg package_0 location_1_0)
    (at_pkg package_1 location_1_0)

    ;; explicit different-city facts for the two airports (both directions)
    (different_city location_0_0 location_1_0)
    (different_city location_1_0 location_0_0)
  )

  (:goal (and
    (at_pkg package_0 location_0_0)
    (at_pkg package_1 location_0_0)
  ))
)