(define (problem deliver-package-0)
  (:domain logistics-multi-agent)
  (:objects
    ;; Trucks
    truck_0 truck_1 - truck
    ;; Airplanes
    airplane_0 - airplane
    ;; Packages
    package_0 - package
    ;; Locations (with airport semantics encoded below)
    location_0_0 location_0_1 location_1_0 location_1_1 - location
    ;; Cities
    city_0 city_1 - city
  )

  (:init
    ;; Location -> City membership
    (LocationInCity location_0_0 city_0)
    (LocationInCity location_0_1 city_0)
    (LocationInCity location_1_0 city_1)
    (LocationInCity location_1_1 city_1)

    ;; Airports (airport locations)
    (IsAirport location_0_0)
    (IsAirport location_1_0)

    ;; Truck city assignment (static: exactly one truck per city as provided)
    (TruckInCity truck_0 city_0)
    (TruckInCity truck_1 city_1)

    ;; Initial physical locations
    (At truck_0 location_0_0)
    (At truck_1 location_1_0)
    (At airplane_0 location_1_0)
    (At package_0 location_1_0)
  )

  ;; Goal: package_0 must end at location_1_1 (non-airport location in city_1).
  (:goal (At package_0 location_1_1))
)