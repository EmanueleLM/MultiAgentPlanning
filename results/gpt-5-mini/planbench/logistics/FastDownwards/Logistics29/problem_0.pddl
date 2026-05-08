(define (problem logistics_problem)
  (:domain logistics_orchestrated)

  (:objects
    ;; cities
    city_0 city_1 - city

    ;; locations
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location

    ;; trucks
    truck_0 truck_1 - truck

    ;; airplane
    airplane_0 - airplane

    ;; packages
    package_0 package_1 package_2 package_3 - package
  )

  (:init
    ;; Type convenience facts
    (IsTruck truck_0)
    (IsTruck truck_1)
    (IsAirplane airplane_0)

    ;; Location -> City membership (InCity facts)
    (InCity location_0_0 city_0)
    (InCity location_0_1 city_0)
    (InCity location_0_2 city_0)
    (InCity location_1_0 city_1)
    (InCity location_1_1 city_1)
    (InCity location_1_2 city_1)

    ;; Airports (exactly one per city, as required)
    (Airport location_0_0)
    (Airport location_1_0)

    ;; Exactly-one truck per city (AssignedTruck facts)
    (AssignedTruck city_0 truck_0)
    (AssignedTruck city_1 truck_1)

    ;; Initial At facts for vehicles
    (At truck_0 location_0_0)
    (At truck_1 location_1_2)
    (At airplane_0 location_1_0)

    ;; Initial At facts for packages (every package starts at exactly one location and Free)
    (At package_0 location_0_1)
    (At package_1 location_1_0)
    (At package_2 location_0_1)
    (At package_3 location_0_0)

    (Free package_0)
    (Free package_1)
    (Free package_2)
    (Free package_3)

    ;; DifferentCity facts (explicitly enumerate distinct city pairs for airplane preconditions)
    (DifferentCity city_0 city_1)
    (DifferentCity city_1 city_0)
  )

  (:goal
    (and
      ;; Global goal: final package locations as mandated
      (At package_0 location_1_2)
      (At package_1 location_0_1)
      (At package_2 location_1_2)
      (At package_3 location_0_2)
    )
  )
)