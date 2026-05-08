(define (problem logistics_problem)
  (:domain logistics_combined)

  (:objects
    ; cities
    city_0 city_1 - city

    ; locations
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location

    ; vehicles
    truck_0 truck_1 - truck
    airplane_0 - airplane

    ; packages
    package_0 package_1 package_2 package_3 - package
  )

  (:init
    ; airports
    (airport location_0_0)
    (airport location_1_0)

    ; location -> city membership
    (in_city location_0_0 city_0)
    (in_city location_0_1 city_0)
    (in_city location_0_2 city_0)
    (in_city location_1_0 city_1)
    (in_city location_1_1 city_1)
    (in_city location_1_2 city_1)

    ; initial vehicle positions
    (at-airplane airplane_0 location_1_0)
    (at-truck truck_0 location_0_0)
    (at-truck truck_1 location_1_2)

    ; initial package locations (packages are at locations and free)
    (at-p package_0 location_0_1)
    (free package_0)

    (at-p package_1 location_1_0)
    (free package_1)

    (at-p package_2 location_0_1)
    (free package_2)

    (at-p package_3 location_0_0)
    (free package_3)

    ; explicit cross-city facts to require flights between different cities
    (diff-city city_0 city_1)
    (diff-city city_1 city_0)
  )

  (:goal (and
    (at-p package_0 location_1_2)
    (at-p package_1 location_0_1)
    (at-p package_2 location_1_2)
    (at-p package_3 location_0_2)
  ))
)