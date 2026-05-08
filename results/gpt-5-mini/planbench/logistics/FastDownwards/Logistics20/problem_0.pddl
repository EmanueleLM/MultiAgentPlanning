(define (problem deliver-package-0)
  (:domain logistics-multiagent)

  ;; Objects: one city, three locations (origin, airport, destination), one truck, one airplane, one package
  (:objects
    city_1 - city
    location_1_1 location_1_airport location_1_2 - location
    truck_1 - truck
    airplane_1 - airplane
    package_0 - package
  )

  ;; Initial state:
  ;; - Package starts at location_1_1
  ;; - Truck starts at location_1_1 (can carry package by loading)
  ;; - Airplane is at the airport location (airplane actions available if needed)
  ;; - location_1_airport is an airport
  ;; - Roads connect origin -> airport and airport -> destination (bidirectional roads included explicitly)
  ;; - No flight routes are declared (so flying is not usable unless routes are added)
  ;; - All locations are in city_1
  (:init
    (at-package package_0 location_1_1)
    (at-truck truck_1 location_1_1)
    (at-plane airplane_1 location_1_airport)
    (airport location_1_airport)

    ;; Roads (explicit connectivity). Both directions given so drive can move either way.
    (road location_1_1 location_1_airport)
    (road location_1_airport location_1_1)
    (road location_1_airport location_1_2)
    (road location_1_2 location_1_airport)

    ;; No flight routes declared between airports in this initial state.
    ;; (flight-route ...) would have to be added explicitly to enable fly actions.

    ;; Location to city mapping
    (in-city location_1_1 city_1)
    (in-city location_1_airport city_1)
    (in-city location_1_2 city_1)
  )

  ;; Goal: package_0 must be at location_1_2 and not inside any vehicle
  (:goal
    (and
      (at-package package_0 location_1_2)
      (not (in-truck package_0 truck_1))
      (not (in-plane package_0 airplane_1))
    )
  )
)