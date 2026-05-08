(define (problem logistics_problem)
  (:domain logistics_combined)

  (:objects
    ; cities
    city_0 city_1 - city

    ; locations (all are entities as well)
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location

    ; vehicles
    truck_0 truck_1 - truck
    airplane_0 - airplane

    ; packages
    package_0 package_1 package_2 package_3 - package
  )

  (:init
    ; airport flags (canonicalized)
    (airport location_0_0)
    (airport location_1_0)

    ; in_city membership for locations
    (in_city location_0_0 city_0)
    (in_city location_0_1 city_0)
    (in_city location_0_2 city_0)
    (in_city location_1_0 city_1)
    (in_city location_1_1 city_1)
    (in_city location_1_2 city_1)

    ; in_city membership for trucks (each truck assigned to exactly one city)
    (in_city truck_0 city_0)
    (in_city truck_1 city_1)

    ; initial positions (unique for each entity)
    (at truck_0 location_0_0)
    (at truck_1 location_1_2)
    (at airplane_0 location_1_0)

    (at package_0 location_0_1)
    (at package_1 location_1_0)
    (at package_2 location_0_1)
    (at package_3 location_0_0)

    ; capacity bookkeeping: conservative choice capacity = 1 for each vehicle (safe default)
    (capacity-free truck_0)
    (capacity-free truck_1)
    (capacity-free airplane_0)

    ; package exclusivity bookkeeping: all packages initially free (i.e., at locations, not in any vehicle)
    (pkg-free package_0)
    (pkg-free package_1)
    (pkg-free package_2)
    (pkg-free package_3)

    ; explicit city-difference facts for required inequality checks (two-city model)
    (city-different city_0 city_1)
    (city-different city_1 city_0)
  )

  (:goal (and
    (at package_0 location_1_2)
    (at package_1 location_0_1)
    (at package_2 location_1_2)
    (at package_3 location_0_2)
  ))
)