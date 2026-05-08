(define (problem move-packages-instance)
  (:domain logistics3)

  (:objects
    city_0 city_1 - city
    location_0_0 location_1_0 - location

    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane

    package_0 package_1 - package
  )

  (:init
    ;; location membership
    (in location_0_0 city_0)
    (in location_1_0 city_1)

    ;; airports
    (airport location_0_0)
    (airport location_1_0)

    ;; explicit airport connections (bidirectional)
    (airport_connection location_0_0 location_1_0)
    (airport_connection location_1_0 location_0_0)

    ;; initial vehicle locations
    (at_vehicle airplane_0 location_0_0)
    (at_vehicle airplane_1 location_0_0)
    (at_vehicle truck_0 location_0_0)
    (at_vehicle truck_1 location_1_0)

    ;; initial package locations
    (at_package package_0 location_1_0)
    (at_package package_1 location_1_0)
  )

  (:goal (and
    (at_package package_0 location_1_0)
    (at_package package_1 location_0_0)
  ))
)