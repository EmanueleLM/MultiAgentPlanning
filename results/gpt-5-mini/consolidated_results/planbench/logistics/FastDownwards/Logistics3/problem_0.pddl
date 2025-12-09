(define (problem city-logistics-instance)
  (:domain city-logistics)

  ;; Objects declaration (typed)
  (:objects
    city_0 city_1 - city
    location_0_0 location_1_0 - location
    truck_0 - truck
    truck_1 - truck
    airplane_0 airplane_1 - airplane
    package_0 package_1 - package
  )

  (:init
    ;; City membership of locations (static)
    (in-city location_0_0 city_0)
    (in-city location_1_0 city_1)

    ;; Airport membership
    (airport location_0_0)
    (airport location_1_0)

    ;; Connectivity: air routes (explicit, symmetric facts provided)
    (air-route location_0_0 location_1_0)
    (air-route location_1_0 location_0_0)

    ;; Note: No truck-connected facts are provided for any distinct locations.
    ;; Per the model, each city contains a single location, so no intra-city truck moves exist.

    ;; Initial positions
    (at-airplane airplane_0 location_0_0)
    (at-airplane airplane_1 location_0_0)
    (at-truck truck_0 location_0_0)
    (at-truck truck_1 location_1_0)
    (at-package package_0 location_1_0)
    (at-package package_1 location_1_0)
  )

  (:goal (and
    (at-package package_0 location_1_0)
    (at-package package_1 location_0_0)
  ))
)