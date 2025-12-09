(define (problem logistics17-prob)
  (:domain logistics17)
  (:objects
    ; packages
    package_0 package_1 package_2 package_3 - package
    ; trucks
    truck_0 truck_1 - truck
    ; airplanes
    airplane_0 airplane_1 - airplane
    ; locations
    location_0_0 location_0_1 location_1_0 location_1_1 - location
    ; cities
    city_0 city_1 - city
  )

  (:init
    ; airports
    (airport location_0_0)
    (airport location_1_0)

    ; airplane initial locations
    (at-airplane airplane_0 location_1_0)
    (at-airplane airplane_1 location_1_0)

    ; package initial locations
    (at-package package_0 location_0_1)
    (at-package package_1 location_1_1)
    (at-package package_2 location_1_0)
    (at-package package_3 location_1_1)

    ; truck initial locations
    (at-truck truck_0 location_0_1)
    (at-truck truck_1 location_1_1)

    ; locations-in-city facts
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)
  )

  (:goal (and
    (at-package package_0 location_0_0)
    (at-package package_1 location_1_0)
    (at-package package_2 location_0_1)
    (at-package package_3 location_1_1)
  ))
)