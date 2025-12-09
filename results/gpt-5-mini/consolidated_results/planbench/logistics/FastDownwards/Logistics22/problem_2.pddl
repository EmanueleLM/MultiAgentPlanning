(define (problem multi_modal_problem)
  (:domain multi_modal_transport)

  (:objects
    ;; locations
    location_0_0 location_0_1 location_0_2 - location
    location_1_0 location_1_1 location_1_2 - location

    ;; vehicles (typed)
    truck_0 truck_1 - truck
    airplane_0 - airplane

    ;; packages
    package_0 package_1 - package

    ;; cities
    city_0 city_1 - city
  )

  (:init
    ;; Airports (one per city)
    (airport location_0_0)
    (airport location_1_0)

    ;; Location -> city membership
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_0_2 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)
    (in-city location_1_2 city_1)

    ;; Initial vehicle positions
    (at airplane_0 location_1_0)
    (at truck_0 location_0_2)
    (at truck_1 location_1_2)

    ;; Initial package positions
    (at-package package_0 location_0_1)
    (at-package package_1 location_1_2)
  )

  (:goal
    (and
      (at-package package_0 location_0_2)
      (at-package package_1 location_1_0)
    )
  )
)