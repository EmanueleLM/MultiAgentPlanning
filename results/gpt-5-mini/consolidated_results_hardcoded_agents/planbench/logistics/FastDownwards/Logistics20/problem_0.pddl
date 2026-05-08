(define (problem deliver-package-0)
  (:domain logistics-multiagent)

  (:objects
    ;; Cities
    city_0 city_1 - city

    ;; Locations (explicit airports included)
    location_0_0 location_0_airport location_1_airport location_1_2 - location

    ;; Vehicles
    truck_0 truck_1 - truck
    plane_0 - airplane

    ;; Package
    package_0 - package
  )

  (:init
    ;; City membership
    (in-city location_0_0 city_0)
    (in-city location_0_airport city_0)
    (in-city location_1_airport city_1)
    (in-city location_1_2 city_1)

    ;; Airports
    (airport location_0_airport)
    (airport location_1_airport)

    ;; Roads (truck movement constrained to these connections)
    (road-connected location_0_0 location_0_airport)
    (road-connected location_0_airport location_0_0)
    (road-connected location_1_airport location_1_2)
    (road-connected location_1_2 location_1_airport)

    ;; Flight routes (airplane routes between airports)
    (flight-route location_0_airport location_1_airport)
    (flight-route location_1_airport location_0_airport)

    ;; Initial positions
    (at package_0 location_0_0)
    (free package_0)

    (at truck_0 location_0_0)         ;; truck in origin city to pick up package
    (at truck_1 location_1_airport)   ;; truck in destination city to move package from airport to final loc

    (at plane_0 location_0_airport)   ;; airplane located at origin airport
  )

  (:goal
    (and
      (at package_0 location_1_2)
    )
  )
)