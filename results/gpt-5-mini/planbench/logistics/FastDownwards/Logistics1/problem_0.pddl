(define (problem transport_problem)
  (:domain transport_domain)

  (:objects
    ;; packages
    package_0 package_1 - package

    ;; vehicles
    truck_0 - truck
    airplane_0 - airplane

    ;; locations: city 0 and city 1, each with an airport location and a local location
    location_0_0 location_0_airport location_1_0 location_1_airport - location

    ;; cities
    city_0 city_1 - city
  )

  (:init
    ;; package initial locations (public information)
    (package-at package_0 location_0_0)
    (package-at package_1 location_0_airport)

    ;; vehicle initial locations
    (truck-at truck_0 location_0_0)
    (airplane-at airplane_0 location_0_airport)

    ;; city membership for locations
    (located-in-city location_0_0 city_0)
    (located-in-city location_0_airport city_0)
    (located-in-city location_1_0 city_1)
    (located-in-city location_1_airport city_1)

    ;; designate airport locations
    (airport location_0_airport)
    (airport location_1_airport)

    ;; road connectivity (roads are bidirectional; both directions enumerated)
    (road-connected location_0_0 location_0_airport)
    (road-connected location_0_airport location_0_0)
    (road-connected location_1_airport location_1_0)
    (road-connected location_1_0 location_1_airport)

    ;; Note: airplanes may only fly between airport locations; flights are allowed implicitly by action
    ;; (no explicit flight graph is required beyond airport predicate)
  )

  (:goal
    (and
      ;; Global hard goal: both packages must be at location_1_0
      (package-at package_0 location_1_0)
      (package-at package_1 location_1_0)
    )
  )
)