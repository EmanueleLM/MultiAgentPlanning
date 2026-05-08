(define (problem logistics28-problem)
  (:domain logistics28)

  (:objects
    city_0 city_1 - city
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location
    truck_0 truck_1 - truck
    airplane_0 - airplane
    package_0 package_1 package_2 package_3 - package
  )

  (:init
    (loc_in_city location_0_0 city_0)
    (loc_in_city location_0_1 city_0)
    (loc_in_city location_0_2 city_0)
    (loc_in_city location_1_0 city_1)
    (loc_in_city location_1_1 city_1)
    (loc_in_city location_1_2 city_1)

    (same_city location_0_0 location_0_0)
    (same_city location_0_0 location_0_1)
    (same_city location_0_0 location_0_2)
    (same_city location_0_1 location_0_0)
    (same_city location_0_1 location_0_1)
    (same_city location_0_1 location_0_2)
    (same_city location_0_2 location_0_0)
    (same_city location_0_2 location_0_1)
    (same_city location_0_2 location_0_2)

    (same_city location_1_0 location_1_0)
    (same_city location_1_0 location_1_1)
    (same_city location_1_0 location_1_2)
    (same_city location_1_1 location_1_0)
    (same_city location_1_1 location_1_1)
    (same_city location_1_1 location_1_2)
    (same_city location_1_2 location_1_0)
    (same_city location_1_2 location_1_1)
    (same_city location_1_2 location_1_2)

    (diff_city location_0_0 location_1_0)
    (diff_city location_1_0 location_0_0)

    (airport location_0_0)
    (airport location_1_0)

    (truck_at truck_0 location_0_1)
    (truck_at truck_1 location_1_1)
    (plane_at airplane_0 location_1_0)

    (pkg_at package_0 location_1_2)
    (pkg_at package_1 location_0_0)
    (pkg_at package_2 location_0_2)
    (pkg_at package_3 location_1_1)
  )

  (:goal
    (and
      (pkg_at package_0 location_1_1)
      (pkg_at package_1 location_1_0)
      (pkg_at package_2 location_0_0)
      (pkg_at package_3 location_0_2)
    )
  )
)