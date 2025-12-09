(define (problem logistics7-problem)
  (:domain logistics7)
  (:objects
    truck_0 truck_1 - truck
    airplane_0 - airplane
    package_0 package_1 - package
    location_0_0 location_0_1 location_1_0 location_1_1 - location
    city_0 city_1 - city
    step0 step1 step2 step3 step4 - step
  )
  (:init
    (airport location_0_0)
    (airport location_1_0)
    (at-airplane airplane_0 location_1_0)
    (at-package package_0 location_1_1)
    (at-package package_1 location_0_0)
    (at-truck truck_0 location_0_0)
    (at-truck truck_1 location_1_1)
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)
    (succ step0 step1)
    (succ step1 step2)
    (succ step2 step3)
    (succ step3 step4)
    (at-step step0)
  )
  (:goal (and
    (at-package package_0 location_1_0)
    (at-package package_1 location_0_0)
  ))
)