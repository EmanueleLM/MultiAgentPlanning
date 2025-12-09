(define (problem deliver-package-0)
  (:domain logistics-multiagent)

  (:objects
    city_0 city_1 - city

    location_0_0 location_0_1 location_0_2
    location_1_0 location_1_1 location_1_2 - location

    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane

    package_0 - package

    time_0 time_1 time_2 time_3 time_4 time_5 time_6 time_7 time_8 time_9 - time
  )

  (:init
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_0_2 city_0)

    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)
    (in-city location_1_2 city_1)

    (airport location_0_0)
    (airport location_1_0)

    (at-truck truck_0 location_0_1)
    (at-truck truck_1 location_1_0)

    (at-plane airplane_0 location_0_0)
    (at-plane airplane_1 location_1_0)

    (at-pkg package_0 location_1_1)

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
      (at-pkg package_0 location_1_2)
    )
  )
)