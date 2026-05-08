(define (problem deliver-package-0)
  (:domain logistics-multiagent)

  (:objects
    ;; Cities
    city_0 city_1 - city

    ;; Locations: three per city as specified
    location_0_0 location_0_1 location_0_2
    location_1_0 location_1_1 location_1_2 - location

    ;; Vehicles
    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane

    ;; Package
    package_0 - package

    ;; Discrete ordered stages (time steps). A conservative horizon is provided.
    time_0 time_1 time_2 time_3 time_4 time_5 time_6 time_7 time_8 time_9 - time
  )

  (:init
    ;; City membership of locations
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_0_2 city_0)

    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)
    (in-city location_1_2 city_1)

    ;; Airports
    (airport location_0_0)
    (airport location_1_0)

    ;; Initial positions (all at the initial stage)
    (at truck_0 location_0_1)
    (at truck_1 location_1_0)

    (at airplane_0 location_0_0)
    (at airplane_1 location_1_0)

    (at-pkg package_0 location_1_1)

    ;; Stage ordering and initial current stage
    (stage time_0) (stage time_1) (stage time_2) (stage time_3) (stage time_4)
    (stage time_5) (stage time_6) (stage time_7) (stage time_8) (stage time_9)

    (succ time_0 time_1)
    (succ time_1 time_2)
    (succ time_2 time_3)
    (succ time_3 time_4)
    (succ time_4 time_5)
    (succ time_5 time_6)
    (succ time_6 time_7)
    (succ time_7 time_8)
    (succ time_8 time_9)

    (current-stage time_0)
  )

  (:goal
    (and
      ;; Terminal condition required: package_0 at location_1_2
      (at-pkg package_0 location_1_2)
    )
  )
)