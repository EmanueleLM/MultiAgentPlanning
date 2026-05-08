(define (problem transport_problem)
  (:domain multi_transport)

  (:objects
    ;; cities
    city_0 city_1 - city

    ;; locations: two per city as specified
    location_0_0 location_0_1 location_1_0 location_1_1 - location

    ;; vehicles: exactly one truck per city and two airplanes
    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane

    ;; declare vehicles also as vehicles for typing compatibility
    v_truck_0 v_truck_1 - vehicle
    v_plane_0 v_plane_1 - vehicle

    ;; packages
    package_0 package_1 package_2 - package
  )

  (:init
    ;; Map vehicle objects to the vehicle supertype instances for predicates:
    ;; We use the typed objects directly in actions. To allow "at-veh" with trucks and airplanes,
    ;; we assert their membership by duplicating as vehicle-typed objects.
    ;; (Some planners accept subtype usage directly; to be explicit we use vehicle-typed aliases.)
    ;; Place the vehicle-typed aliases at the same locations as their typed counterparts.
    ;; Link: we will treat truck_0 and v_truck_0 as distinct objects in the problem,
    ;; but actions are typed to accept truck and airplane; this explicit duplication avoids relying
    ;; on advanced type polymorphism in the solver. To keep predicates simple, we will use the
    ;; vehicle-typed aliases in at-veh facts, and actions will be applied to the corresponding
    ;; vehicle-typed objects (truck and airplane objects are available for parameter typing).
    ;; NOTE: FastDownward supports subtypes, but this explicit vehicle aliasing ensures clarity.

    ;; Vehicles initial positions (use vehicle-typed aliases in at-veh)
    (at-veh truck_0 location_0_0)
    (at-veh truck_1 location_1_1)
    (at-veh airplane_0 location_1_0)
    (at-veh airplane_1 location_0_0)

    ;; Packages initial locations (not in any vehicle)
    (at-pkg package_0 location_1_0)
    (at-pkg package_1 location_1_1)
    (at-pkg package_2 location_0_0)

    ;; City membership for each location
    (loc-in-city location_0_0 city_0)
    (loc-in-city location_0_1 city_0)
    (loc-in-city location_1_0 city_1)
    (loc-in-city location_1_1 city_1)

    ;; same-city relation: symmetric pairs for locations belonging to the same city.
    ;; city_0 pairs
    (same-city location_0_0 location_0_0)
    (same-city location_0_0 location_0_1)
    (same-city location_0_1 location_0_0)
    (same-city location_0_1 location_0_1)

    ;; city_1 pairs
    (same-city location_1_0 location_1_0)
    (same-city location_1_0 location_1_1)
    (same-city location_1_1 location_1_0)
    (same-city location_1_1 location_1_1)

    ;; Airport designation: specified airports
    (airport location_0_0)
    (airport location_1_0)
  )

  (:goal
    (and
      ;; All packages must be physically at the destination location_0_1
      (at-pkg package_0 location_0_1)
      (at-pkg package_1 location_0_1)
      (at-pkg package_2 location_0_1)
    )
  )
)