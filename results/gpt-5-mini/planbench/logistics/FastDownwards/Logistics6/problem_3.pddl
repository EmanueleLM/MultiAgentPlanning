(define (problem transport_problem)
  (:domain transport_domain)
  (:objects
    package_0 - package
    location_0_0 location_0_1 location_1_0 location_1_1 - location
  )
  (:init
    (airport location_0_0)
    (airport location_1_0)
    (at-airplane airplane_0 location_1_0)
    (at-airplane airplane_1 location_0_0)
    (at-truck truck_0 location_0_0)
    (at-truck truck_1 location_1_1)
    (at-package package_0 location_1_1)
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)
  )
  (:goal
    (and
      (at-package package_0 location_0_0)
    )
  )
)