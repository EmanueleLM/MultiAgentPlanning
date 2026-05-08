; Problem preface / modeling decisions included above in the file header comments.
; The initial facts below include the declarative assertions provided in the input:
;   - uniqueness_of_truck_per_city
;   - each_city_has_exactly_one_airport
; These are included as static facts (no dynamics change them).

(define (problem logistics-instance)
  (:domain truck_airplane_logistics)

  (:objects
    ;; cities
    city_0 city_1 - city

    ;; locations: declared as airport locations (subtype airport_location)
    location_0_0 location_1_0 - airport_location

    ;; vehicles
    truck_0 truck_1 - truck
    airplane_0 - airplane

    ;; packages
    package_0 package_1 - package
  )

  (:init
    ;; airport flags
    (airport location_0_0)
    (airport location_1_0)

    ;; location -> city membership
    (location_in_city location_0_0 city_0)
    (location_in_city location_1_0 city_1)

    ;; connectivity: flights available between these two airports (direction: city_1 -> city_0)
    ;; This enables the airplane to carry cargo from location_1_0 to location_0_0.
    (flight_conn location_1_0 location_0_0)

    ;; initial at-positions (objects are vehicles or packages)
    (at airplane_0 location_1_0)
    (at package_0 location_1_0)
    (at package_1 location_1_0)
    (at truck_0 location_0_0)
    (at truck_1 location_1_0)

    ;; declarative invariants provided by the input (kept as static facts)
    (uniqueness_of_truck_per_city)
    (each_city_has_exactly_one_airport)
  )

  (:goal
    (and
      (at package_0 location_0_0)
      (at package_1 location_0_0)
    )
  )
)