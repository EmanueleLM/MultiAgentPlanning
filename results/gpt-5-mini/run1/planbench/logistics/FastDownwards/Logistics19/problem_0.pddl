(define (problem orchestrator_problem)
  (:domain orchestrator_domain)

  ;; Objects present in the public information
  (:objects
    package_0 - package
    truck_1 - truck
    ;; No airplane objects were explicitly provided by the public inputs; airplane actions remain in the domain
    location_0_0 location_1_0 location_1_1 location_1_2 - location
    city_0 city_1 - city
  )

  ;; Comments: explicit minimal assumptions (must be preserved by the planner)
  ;; Assumptions:
  ;; 1. truck_1 is assigned to city_1 and operates only inside city_1.
  ;; 2. Airports: location_0_0 is the airport for city_0; location_1_0 is the airport for city_1.
  ;; 3. There are no airplane objects available initially (no airplanes were provided). Airplane actions exist in the domain but cannot be applied without airplane objects.
  ;; 4. Trucks have sufficient capacity for the relevant package(s) (capacity is not modeled numerically).
  ;; 5. The global invariant must hold in the initial state: each package is exactly in one place representation (here package_0 is at a location).
  ;; 6. same_city is provided pairwise (both directions) for all locations in city_1 to enforce intra-city driving constraints.

  (:init
    ;; Package initial location (given)
    (package_at package_0 location_1_0)

    ;; Truck initial location and assignment (given)
    (truck_at truck_1 location_1_2)
    (truck_of_city truck_1 city_1)

    ;; Airport facts (given)
    (airport location_0_0)
    (airport location_1_0)

    ;; same_city relations (explicitly both directions to avoid relying on symmetry)
    ;; city_1 locations: location_1_0 (airport), location_1_1 (goal location), location_1_2 (truck start)
    (same_city location_1_0 location_1_1)
    (same_city location_1_1 location_1_0)
    (same_city location_1_0 location_1_2)
    (same_city location_1_2 location_1_0)
    (same_city location_1_1 location_1_2)
    (same_city location_1_2 location_1_1)

    ;; city declarations (optional classification)
    (city city_0)
    (city city_1)
  )

  ;; Goal: place package_0 at location_1_1 (hard constraint)
  (:goal (and
    (package_at package_0 location_1_1)
  ))
)