(define (problem move-packages-instance)
  (:domain air-truck-logistics)

  (:objects
    city_0 city_1 - city
    location_0_0 location_1_0 - location

    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane

    package_0 package_1 - package
  )

  (:init
    ;; city/location membership
    (in location_0_0 city_0)
    (in location_1_0 city_1)

    ;; airports
    (airport location_0_0)
    (airport location_1_0)

    ;; explicit airport connections (bidirectional per instance)
    (airport_connection location_0_0 location_1_0)
    (airport_connection location_1_0 location_0_0)

    ;; Truck connectivity:
    ;; Given exactly one location per city, there are no nontrivial inter-location truck edges.
    ;; No connected_truck facts (non-reflexive) are asserted for this instance,
    ;; so trucks cannot drive to a different location in another city.
    ;; (If reflexive connected_truck facts are desired, add them here; they are omitted intentionally.)

    ;; initial vehicle locations (vehicles are at airports / local locations)
    (at_vehicle airplane_0 location_0_0)
    (at_vehicle airplane_1 location_0_0)
    (at_vehicle truck_0 location_0_0)
    (at_vehicle truck_1 location_1_0)

    ;; initial package locations (packages are at locations, not in vehicles)
    (at_package package_0 location_1_0)
    (at_package package_1 location_1_0)

    ;; No package is initially in any vehicle (in_vehicle facts omitted).
  )

  (:goal (and
    ;; package_0 remains at location_1_0
    (at_package package_0 location_1_0)
    ;; package_1 must be at location_0_0
    (at_package package_1 location_0_0)
  ))
)