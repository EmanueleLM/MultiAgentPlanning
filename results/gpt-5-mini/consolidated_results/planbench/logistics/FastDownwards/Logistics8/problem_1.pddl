(define (problem logistics-instance)
  (:domain logistics)

  (:objects
    ;; vehicles
    truck_0 truck_1 - truck
    airplane_0 - plane

    ;; packages
    package_0 package_1 - package

    ;; locations
    location_0_0 location_0_1 location_1_0 location_1_1 - location

    ;; cities (used only for modeling; connectivity encoded explicitly)
    city_0 city_1 - city

    ;; discrete stages
    day0 day1 day2 - day
  )

  (:init
    ;; airports (one per city as stated)
    (airport location_0_0)
    (airport location_1_0)

    ;; initial locations of vehicles
    (at truck_0 location_0_0)
    (at truck_1 location_1_1)
    (at airplane_0 location_0_0)

    ;; initial package locations
    (at package_0 location_0_0)
    (at package_1 location_0_0)

    ;; truck connectivity: any two locations in the same city are directly reachable.
    ;; city_0 locations
    (same-city location_0_0 location_0_1)
    (same-city location_0_1 location_0_0)
    ;; city_1 locations
    (same-city location_1_0 location_1_1)
    (same-city location_1_1 location_1_0)

    ;; air connectivity between airports (cities connected)
    (air-connected location_0_0 location_1_0)
    (air-connected location_1_0 location_0_0)

    ;; stage ordering
    (succ day0 day1)
    (succ day1 day2)

    ;; starting stage
    (now day0)
  )

  (:goal (and
    ;; mandated final stage (planner must reach final stage explicitly)
    (now day2)

    ;; delivery goals: both packages at location_0_1
    (at package_0 location_0_1)
    (at package_1 location_0_1)
  ))
)