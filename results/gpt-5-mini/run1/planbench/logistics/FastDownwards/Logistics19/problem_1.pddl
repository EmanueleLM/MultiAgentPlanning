(define (problem orchestrator_problem)
  (:domain orchestrator_domain)

  ;; Objects from the human specification
  (:objects
    package_0 - package
    truck_0 truck_1 - truck
    airplane_0 - airplane
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location
  )

  ;; Assumptions (explicit comments):
  ;; - Each city has three locations as given. same_city relations are provided explicitly below.
  ;; - Airports are: location_0_0 (city_0) and location_1_0 (city_1).
  ;; - Trucks cannot leave their city: enforced by same_city precondition on drive_truck.
  ;; - Airplanes only operate between airports: enforced by airport preconditions on fly/load/unload.
  ;; - Capacity is unbounded for this instance (no numeric fluents).

  (:init
    ;; package initial location
    (package_at package_0 location_1_0)

    ;; truck initial locations
    (truck_at truck_0 location_0_0)
    (truck_at truck_1 location_1_2)

    ;; airplane initial location
    (airplane_at airplane_0 location_0_0)

    ;; airports
    (airport location_0_0)
    (airport location_1_0)

    ;; same_city relations for city_0 (explicit both directions)
    (same_city location_0_0 location_0_1)
    (same_city location_0_1 location_0_0)
    (same_city location_0_0 location_0_2)
    (same_city location_0_2 location_0_0)
    (same_city location_0_1 location_0_2)
    (same_city location_0_2 location_0_1)

    ;; same_city relations for city_1 (explicit both directions)
    (same_city location_1_0 location_1_1)
    (same_city location_1_1 location_1_0)
    (same_city location_1_0 location_1_2)
    (same_city location_1_2 location_1_0)
    (same_city location_1_1 location_1_2)
    (same_city location_1_2 location_1_1)
  )

  (:goal (and
    (package_at package_0 location_1_1)
  ))
)