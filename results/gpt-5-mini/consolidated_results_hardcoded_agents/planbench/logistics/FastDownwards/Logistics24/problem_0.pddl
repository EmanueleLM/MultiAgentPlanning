(define (problem logistics_orchestrated_problem)
  (:domain logistics_orchestrated)

  (:objects
    ; Packages
    package_0 package_1 package_2 - package

    ; Trucks
    truck_0 truck_1 - truck

    ; Airplanes
    airplane_0 - airplane

    ; Locations (names chosen to match the user's goal naming)
    location_0_0 location_0_1 location_1_0 location_1_2 - location

    ; Cities
    city_0 city_1 - city
  )

  (:init
    ; Location to city mapping
    (loc-in-city location_0_0 city_0)
    (loc-in-city location_0_1 city_0)
    (loc-in-city location_1_0 city_1)
    (loc-in-city location_1_2 city_1)

    ; Airports
    (airport location_0_1)
    (airport location_1_2)

    ; Vehicle initial positions
    (at-truck truck_0 location_0_0)
    (at-truck truck_1 location_1_0)
    (at-airplane airplane_0 location_0_1)

    ; Packages initial positions (exact initial facts)
    (at-package package_0 location_0_0)
    (at-package package_1 location_0_0)
    (at-package package_2 location_0_1)
  )

  (:goal (and
    ; Required terminal conditions
    (at-package package_0 location_1_0)
    (at-package package_1 location_1_0)
    (at-package package_2 location_1_2)
  ))
)