(define (problem logistics16-problem)
  (:domain logistics16)

  (:objects
    ;; packages
    package_0 package_1 package_2 package_3 - package

    ;; trucks (one per city)
    truck_0 truck_1 - truck

    ;; airplanes
    airplane_0 airplane_1 - airplane

    ;; locations
    location_0_0 location_0_1 location_1_0 location_1_1 - location

    ;; cities
    city_0 city_1 - city
  )

  (:init
    ;; airports
    (is-airport location_0_0)
    (is-airport location_1_0)

    ;; location -> city membership
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)

    ;; initial vehicle positions
    (at-airplane airplane_0 location_0_0)
    (at-airplane airplane_1 location_0_0)

    (at-truck truck_0 location_0_1)
    (at-truck truck_1 location_1_1)

    ;; initial package positions
    (at package_0 location_1_1)
    (at package_1 location_1_0)
    (at package_2 location_1_1)
    (at package_3 location_0_0)
  )

  (:goal (and
    ;; desired package final locations
    (at package_0 location_0_0)
    (at package_1 location_1_1)
    (at package_2 location_0_1)
    (at package_3 location_1_1)
  ))
)