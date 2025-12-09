(define (problem deliver_packages)
  (:domain transport_combined)
  (:objects
    package_0 package_1 package_2 package_3 - package
    truck_0 truck_1 - truck
    airplane_0 - airplane
    location_0_0 location_0_1 location_1_0 location_1_1 - location
    city_0 city_1 - city
    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 stage_6 stage_7 - stage
  )
  (:init
    (stage stage_0)
    (stage stage_1)
    (stage stage_2)
    (stage stage_3)
    (stage stage_4)
    (stage stage_5)
    (stage stage_6)
    (stage stage_7)

    (succ stage_0 stage_1)
    (succ stage_1 stage_2)
    (succ stage_2 stage_3)
    (succ stage_3 stage_4)
    (succ stage_4 stage_5)
    (succ stage_5 stage_6)
    (succ stage_6 stage_7)

    (current stage_0)

    (at airplane_0 location_1_0)
    (at truck_0 location_0_0)
    (at truck_1 location_1_1)

    (at package_0 location_1_0)
    (at package_1 location_1_1)
    (at package_2 location_0_0)
    (at package_3 location_0_1)

    (free package_0)
    (free package_1)
    (free package_2)
    (free package_3)

    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)

    (airport location_0_0)
    (airport location_1_0)
  )
  (:goal (and
    (at package_0 location_0_1)
    (at package_1 location_0_1)
    (at package_2 location_1_0)
    (at package_3 location_1_0)
  ))
)