(define (problem transport-instance)
  (:domain transport-audit)

  (:objects
    ;; packages
    package_0 - package

    ;; trucks
    truck_0 truck_1 - truck

    ;; airplanes
    airplane_0 - airplane

    ;; locations
    location_0_0 location_0_1 location_0_2
    location_1_0 location_1_1 location_1_2 - location

    ;; cities
    city_0 city_1 - city
  )

  (:init
    ;; type assertions (auditable)
    (is_package package_0)
    (is_truck truck_0)
    (is_truck truck_1)
    (is_airplane airplane_0)

    (is_location location_0_0) (is_location location_0_1) (is_location location_0_2)
    (is_location location_1_0) (is_location location_1_1) (is_location location_1_2)
    (is_city city_0) (is_city city_1)

    ;; city membership of locations (static)
    (in_city location_0_0 city_0)
    (in_city location_0_1 city_0)
    (in_city location_0_2 city_0)

    (in_city location_1_0 city_1)
    (in_city location_1_1 city_1)
    (in_city location_1_2 city_1)

    ;; airports (exactly one per city as public info)
    (is_airport location_0_0)
    (is_airport location_1_0)

    ;; trucks assigned to cities (one per city as public info)
    (belongs_to_city truck_0 city_0)
    (belongs_to_city truck_1 city_1)

    ;; initial locations of vehicles and package
    (truck_at truck_0 location_0_2)
    (truck_at truck_1 location_1_0)

    (airplane_at airplane_0 location_1_0)

    (at_pkg package_0 location_0_1)

    ;; No locks or reservations held initially - they must be acquired in plans when needed.
    ;; (locked_pkg ...) absent means unlocked
    ;; (reserved_truck ...) absent means not reserved
  )

  (:goal (and
           ;; global goal: package_0 delivered to location_1_2
           (at_pkg package_0 location_1_2)
         ))
)