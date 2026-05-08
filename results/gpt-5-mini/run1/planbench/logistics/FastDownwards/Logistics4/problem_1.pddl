(define (problem deliver-package-0)
  (:domain logistics-multi-agent)
  (:objects
    ;; Trucks
    truck_0 truck_1 - truck
    ;; Airplanes
    airplane_0 - airplane
    ;; Packages
    package_0 - package
    ;; Locations
    location_0_0 location_0_1 location_1_0 location_1_1 - location
    ;; Cities
    city_0 city_1 - city
  )

  (:init
    ;; Location -> City membership
    (location_in_city location_0_0 city_0)
    (location_in_city location_0_1 city_0)
    (location_in_city location_1_0 city_1)
    (location_in_city location_1_1 city_1)

    ;; Airports
    (is_airport location_0_0)
    (is_airport location_1_0)

    ;; Truck assignment to city (one truck per city as given)
    (truck_in_city truck_0 city_0)
    (truck_in_city truck_1 city_1)

    ;; Initial positions
    (truck_at truck_0 location_0_0)
    (truck_at truck_1 location_1_0)
    (plane_at airplane_0 location_1_0)
    (pkg_at package_0 location_1_0)
  )

  (:goal (pkg_at package_0 location_1_1))
)