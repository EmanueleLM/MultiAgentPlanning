(define (problem logistics-multi-problem)
  (:domain logistics-multiagent)
  (:objects
    ;; cities
    city_0 city_1
    ;; locations (two per city; airports are specified below)
    location_0_0 location_0_1 location_1_0 location_1_1
    ;; trucks
    truck_0 truck_1
    ;; airplane
    airplane_0
    ;; packages
    package_0
  )
  (:init
    ;; Locations -> cities
    (in_city location_0_0 city_0)
    (in_city location_0_1 city_0)
    (in_city location_1_0 city_1)
    (in_city location_1_1 city_1)

    ;; Airports
    (is_airport location_0_0)
    (is_airport location_1_0)

    ;; Truck assignments and initial positions
    (truck_in_city truck_0 city_0)
    (truck_in_city truck_1 city_1)
    (at truck_0 location_0_0)
    (at truck_1 location_1_0)

    ;; Airplane initial position
    (at airplane_0 location_1_0)

    ;; Package initial state: at airport location_1_0 in city_1 and free (not in any vehicle)
    (at package_0 location_1_0)
    (free package_0)
  )
  (:goal (and
    ;; Mandated terminal condition: package_0 must be at location_1_1 (in city_1)
    (at package_0 location_1_1)
  ))
)