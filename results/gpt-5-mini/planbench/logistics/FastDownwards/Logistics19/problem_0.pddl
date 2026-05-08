(define (problem orchestrator_problem)
  (:domain orchestration_domain)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Assumptions (explicit; these are comments only and NOT part of the state):
  ; - Trucks cannot leave their assigned city: enforced by requiring truck_in_city and location_in_city
  ;   in truck actions' preconditions.
  ; - Airports are ordinary locations but airplane actions require the airport predicate.
  ; - drive_edge and flight_edge encode allowed movement; they are static and provided below.
  ; - No numeric capacities are provided in the public instance; default is unlimited capacity.
  ; - The required final condition is that package_0 be at location_1_1 (on the ground).
  ; - The intended feasible action sequence for this instance is:
  ;     1) truck_DRIVE truck_1 location_1_2 -> location_1_0
  ;     2) truck_LOAD  truck_1 package_0 at location_1_0
  ;     3) truck_DRIVE truck_1 location_1_0 -> location_1_1
  ;     4) truck_UNLOAD truck_1 package_0 at location_1_1
  ;   The domain preconditions enforce the required ordering (truck must be at pickup location to load, etc.).
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (:objects
    ; trucks
    truck_1 - truck

    ; airplanes (not required for the minimal plan but provided per agents' declarations)
    airplane_0 - airplane

    ; packages
    package_0 - package

    ; locations (including airports)
    location_0_0 location_1_0 location_1_1 location_1_2 - location

    ; cities
    city_0 city_1 - city
  )

  (:init
    ;; package initial location (given)
    (at_pkg package_0 location_1_0)

    ;; truck initial location (given)
    (at_truck truck_1 location_1_2)

    ;; airplane initial location (not required but provided)
    (at_plane airplane_0 location_0_0)

    ;; city membership facts (explicit)
    (location_in_city location_1_0 city_1)
    (location_in_city location_1_1 city_1)
    (location_in_city location_1_2 city_1)
    (location_in_city location_0_0 city_0)

    (truck_in_city truck_1 city_1)

    ;; airports (explicit)
    (airport location_1_0)
    (airport location_0_0)

    ;; drive connectivity (static). These edges encode allowed intra-city drives.
    ;; The plan uses: location_1_2 -> location_1_0, then location_1_0 -> location_1_1
    (drive_edge location_1_2 location_1_0)
    (drive_edge location_1_0 location_1_1)

    ;; flight connectivity (static). Provided for completeness per airplane description.
    (flight_edge location_0_0 location_1_0)
    (flight_edge location_1_0 location_0_0)
  )

  (:goal
    (and
      ;; mandated terminal condition: package_0 on the ground at location_1_1
      (at_pkg package_0 location_1_1)
    )
  )
)