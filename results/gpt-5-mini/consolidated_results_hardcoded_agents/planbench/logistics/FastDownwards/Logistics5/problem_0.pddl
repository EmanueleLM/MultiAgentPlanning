(define (problem move_package_0_to_location_1_0)
  (:domain logistics_multiagent)

  (:objects
    ;; Cities
    city_0 city_1 - city
    ;; Locations
    location_0_0 location_0_1 location_1_0 location_1_1 - location
    ;; Trucks
    truck_0 truck_1 - truck
    ;; Airplanes
    airplane_0 - airplane
    ;; Packages
    package_0 - package
  )

  (:init
    ;; Static facts: location to city
    (location_in_city location_0_0 city_0)
    (location_in_city location_0_1 city_0)
    (location_in_city location_1_0 city_1)
    (location_in_city location_1_1 city_1)

    ;; Airports
    (airport location_0_0)
    (airport location_1_0)

    ;; Truck assignments (one truck per city as given)
    (truck_assigned_to truck_0 city_0)
    (truck_assigned_to truck_1 city_1)

    ;; Initial dynamic locations
    (at_truck truck_0 location_0_0)
    (at_truck truck_1 location_1_1)
    (at_airplane airplane_0 location_0_0)

    ;; Package initial location (package_0 at location_0_1)
    (at_pkg package_0 location_0_1)
  )

  (:goal (and
    ;; Terminal condition mandated by the global objective:
    (at_pkg package_0 location_1_0)
  ))
)