(define (problem logistics25-problem)
  (:domain logistics25)

  (:objects
    ;; packages
    package_0 package_1 package_2 - package

    ;; trucks and airplane
    truck_0 truck_1 - truck
    airplane_0 - airplane

    ;; cities
    city_0 city_1 - city

    ;; locations (each city has exactly three locations)
    location_0_0 location_0_1 location_0_2
    location_1_0 location_1_1 location_1_2 - location
  )

  (:init
    ;; airports
    (airport location_0_0)
    (airport location_1_0)

    ;; location -> city mapping
    (loc_in_city location_0_0 city_0)
    (loc_in_city location_0_1 city_0)
    (loc_in_city location_0_2 city_0)
    (loc_in_city location_1_0 city_1)
    (loc_in_city location_1_1 city_1)
    (loc_in_city location_1_2 city_1)

    ;; initial vehicle positions
    (plane_at airplane_0 location_1_0)
    (truck_at truck_0 location_0_1)
    (truck_at truck_1 location_1_1)

    ;; initial package locations
    (package_at package_0 location_1_2)
    (package_at package_1 location_0_2)
    (package_at package_2 location_0_2)
  )

  (:goal
    (and
      (package_at package_0 location_0_0)
      (package_at package_1 location_1_1)
      (package_at package_2 location_1_2)
    )
  )
)