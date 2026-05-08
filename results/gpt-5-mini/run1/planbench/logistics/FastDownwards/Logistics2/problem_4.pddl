(define (problem logistics_instance)
  (:domain logistics_multiagent)

  ;; Resolutions applied:
  ;; - Airports are linked to their cities via (airport_for <location> <city>).
  ;; - Inter-city flights require source and destination airports to belong to different cities.
  ;; - Truck driving requires both locations to be in the same city.
  ;; - No explicit capacity constraints are modeled (matches the original specification).

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

    ;; airport markers and airport->city links
    (is_airport location_0_0)
    (is_airport location_1_0)
    (airport_for location_0_0 city_0)
    (airport_for location_1_0 city_1)

    ;; vehicles initial locations
    (at_plane airplane_0 location_1_0)
    (at_truck truck_0 location_0_0)
    (at_truck truck_1 location_1_0)

    ;; packages initial locations (not in any vehicle)
    (at_pkg package_0 location_1_0)
    (at_pkg package_1 location_1_0)
  )

  (:goal (and
    (at_pkg package_0 location_0_0)
    (at_pkg package_1 location_0_0)
  ))
)