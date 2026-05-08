(define (problem logistics_instance)
  (:domain logistics_combined)

  (:objects
    ; cities
    city_0 city_1 - city

    ; locations
    location_0_0 location_0_1 location_0_2
    location_1_0 location_1_1 location_1_2 - location

    ; vehicles and packages
    truck_0 truck_1 - truck
    airplane_0 - airplane

    package_0 package_1 package_2 package_3 - package
  )

  (:init
    ; location -> city membership
    (in_city location_0_0 city_0)
    (in_city location_0_1 city_0)
    (in_city location_0_2 city_0)

    (in_city location_1_0 city_1)
    (in_city location_1_1 city_1)
    (in_city location_1_2 city_1)

    ; airports
    (airport location_0_0)
    (airport location_1_0)

    ; trucks: city binding (each truck belongs to its city)
    (city_of truck_0 city_0)
    (city_of truck_1 city_1)

    ; initial locations of vehicles
    (at_plane airplane_0 location_1_0)

    (at_truck truck_0 location_0_0)
    (at_truck truck_1 location_1_2)

    ; initial package ground locations
    (at_pkg package_0 location_0_1)
    (at_pkg package_1 location_1_0)
    (at_pkg package_2 location_0_1)
    (at_pkg package_3 location_0_0)

    ; all packages start free (on ground)
    (free package_0)
    (free package_1)
    (free package_2)
    (free package_3)
  )

  (:goal (and
    (at_pkg package_0 location_1_2)
    (at_pkg package_1 location_0_1)
    (at_pkg package_2 location_1_2)
    (at_pkg package_3 location_0_2)
  ))
)