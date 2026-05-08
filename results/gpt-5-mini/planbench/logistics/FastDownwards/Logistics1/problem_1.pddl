(define (problem logistics1-problem)
  (:domain logistics1)

  (:objects
    ;; packages
    package_0 package_1 - package

    ;; trucks (one per city as described)
    truck_0 truck_1 - truck

    ;; airplanes
    airplane_0 - airplane

    ;; locations (each city has one airport; here both locations are airports)
    location_0_0 location_1_0 - location

    ;; cities
    city_0 city_1 - city
  )

  (:init
    ;; airports (according to the human specification)
    (airport location_0_0)
    (airport location_1_0)

    ;; vehicle initial locations
    (truck-at truck_0 location_0_0)
    (truck-at truck_1 location_1_0)
    (airplane-at airplane_0 location_1_0)

    ;; package initial locations (as given)
    (package-at package_0 location_1_0)
    (package-at package_1 location_0_0)

    ;; which city each location belongs to
    (located-in-city location_0_0 city_0)
    (located-in-city location_1_0 city_1)
  )

  (:goal
    (and
      (package-at package_0 location_1_0)
      (package-at package_1 location_1_0)
    )
  )
)