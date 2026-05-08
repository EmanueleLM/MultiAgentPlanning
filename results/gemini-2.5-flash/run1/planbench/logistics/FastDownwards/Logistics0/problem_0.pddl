(define (problem package-delivery-integrated)
  (:domain integrated-logistics)
  (:objects
    package_0 - package
    location_0_0 location_1_0 - location
    city_0 city_1 - city
    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane
  )

  (:init
    ;; Initial locations for packages
    (at package_0 location_1_0)

    ;; Initial locations for trucks
    (at truck_0 location_0_0)
    (at truck_1 location_1_0)

    ;; Initial locations for airplanes
    (at airplane_0 location_1_0)
    (at airplane_1 location_1_0)

    ;; City assignments for locations
    (in-city location_0_0 city_0)
    (in-city location_1_0 city_1)

    ;; Truck assignment to cities for ground operations
    (assigned-to truck_0 city_0)
    (assigned-to truck_1 city_1)

    ;; Designate airports
    (is-airport location_0_0)
    (is-airport location_1_0)

    ;; Ground connections within cities
    ;; The problem specifies: "All locations within a single city are directly connected".
    ;; However, in this problem instance, location_0_0 is the only explicit location
    ;; in city_0, and location_1_0 is the only explicit location in city_1.
    ;; The 'drive-truck' action requires movement between distinct locations
    ;; (not (= ?from ?to)). Therefore, no (ground-connected ...) facts for distinct
    ;; locations within a single city can be asserted here, as there are no such pairs.
  )

  (:goal
    (at package_0 location_0_0)
  )
)