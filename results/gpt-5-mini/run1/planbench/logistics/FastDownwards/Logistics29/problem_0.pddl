(define (problem logistics_instance)
  (:domain logistics_combined)

  (:objects
    ; cities
    city_0 city_1 - city

    ; locations
    location_0_0 location_0_1 location_0_2
    location_1_0 location_1_1 location_1_2 - location

    ; trucks and airplanes and packages (note: truck/airplane are subtypes of entity)
    truck_0 truck_1 - truck
    airplane_0 - airplane

    package_0 package_1 package_2 package_3 - package
  )

  (:init
    ; --- location -> city membership (canonical in_city)
    (in_city location_0_0 city_0)
    (in_city location_0_1 city_0)
    (in_city location_0_2 city_0)

    (in_city location_1_0 city_1)
    (in_city location_1_1 city_1)
    (in_city location_1_2 city_1)

    ; --- same_city relations (explicitly enumerated for correctness)
    ; city_0 pairs
    (same_city location_0_0 location_0_0)
    (same_city location_0_0 location_0_1)
    (same_city location_0_0 location_0_2)
    (same_city location_0_1 location_0_0)
    (same_city location_0_1 location_0_1)
    (same_city location_0_1 location_0_2)
    (same_city location_0_2 location_0_0)
    (same_city location_0_2 location_0_1)
    (same_city location_0_2 location_0_2)

    ; city_1 pairs
    (same_city location_1_0 location_1_0)
    (same_city location_1_0 location_1_1)
    (same_city location_1_0 location_1_2)
    (same_city location_1_1 location_1_0)
    (same_city location_1_1 location_1_1)
    (same_city location_1_1 location_1_2)
    (same_city location_1_2 location_1_0)
    (same_city location_1_2 location_1_1)
    (same_city location_1_2 location_1_2)

    ; --- airports
    (airport location_0_0)
    (airport location_1_0)

    ; --- static vehicle typing and city binding (truck-city binding enforced)
    (is_truck truck_0)
    (is_truck truck_1)
    (is_airplane airplane_0)

    (city_of truck_0 city_0)
    (city_of truck_1 city_1)
    ; airplanes are not bound to a home city by city_of in this instance (no city_of airplane_0 entry)

    ; --- initial at(...) facts for vehicles and packages
    (at airplane_0 location_1_0)

    (at package_0 location_0_1)
    (at package_1 location_1_0)
    (at package_2 location_0_1)
    (at package_3 location_0_0)

    (at truck_0 location_0_0)
    (at truck_1 location_1_2)

    ; --- package bookkeeping: free indicates package currently on ground (not in any vehicle)
    (free package_0)
    (free package_1)
    (free package_2)
    (free package_3)

    ; Note: No (in package ...) facts initially (no packages inside vehicles)
    ; The following implicit invariants are satisfied by these initial facts:
    ; - Each location belongs to exactly one city (enforced by in_city facts).
    ; - Each city has exactly one airport set above.
    ; - Each truck is associated with its city via city_of, and initial at(...) is in that city.
  )

  (:goal (and
    (at package_0 location_1_2)
    (at package_1 location_0_1)
    (at package_2 location_1_2)
    (at package_3 location_0_2)
  ))