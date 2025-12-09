(define (problem deliver_packages)
  (:domain transport_combined)
  (:objects
    package_0 package_1 package_2 package_3 - package
    truck_0 truck_1 - truck
    airplane_0 - airplane
    location_0_0 location_0_1 location_1_0 location_1_1 - location
    city_0 city_1 - city
  )
  (:init
    ;; Vehicles initial locations
    (at airplane_0 location_1_0)
    (at truck_0 location_0_0)
    (at truck_1 location_1_1)

    ;; Packages initial locations
    (at package_0 location_1_0)
    (at package_1 location_1_1)
    (at package_2 location_0_0)
    (at package_3 location_0_1)

    ;; Packages are initially not in any vehicle
    (free package_0)
    (free package_1)
    (free package_2)
    (free package_3)

    ;; Location to city mapping
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)

    ;; Airports
    (airport location_0_0)
    (airport location_1_0)
  )
  (:goal (and
    (at package_0 location_0_1)
    (at package_1 location_0_1)
    (at package_2 location_1_0)
    (at package_3 location_1_0)
  ))
)