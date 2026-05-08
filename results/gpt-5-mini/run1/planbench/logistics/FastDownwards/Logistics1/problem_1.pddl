(define (problem transport_problem)
  (:domain transport_domain)

  (:objects
    ;; packages
    package_0 package_1 - package

    ;; trucks (one per city)
    truck_0 truck_1 - truck

    ;; airplane(s)
    airplane_0 - airplane

    ;; locations (airports in the two cities)
    location_0_0 location_1_0 - location

    ;; cities
    city_0 city_1 - city
  )

  (:init
    ;; airport designations (public information)
    (is-airport location_0_0)
    (is-airport location_1_0)

    ;; initial package locations (public information)
    ;; human statement: package_0 is at location_1_0, package_1 is at location_0_0
    (at package_0 location_1_0)
    (at package_1 location_0_0)

    ;; vehicle initial locations (public information)
    (truck-at truck_0 location_0_0)
    (truck-at truck_1 location_1_0)
    (airplane-at airplane_0 location_1_0)

    ;; city membership of locations (public information)
    (located-in-city location_0_0 city_0)
    (located-in-city location_1_0 city_1)

    ;; flight routes between the two airports (bidirectional as specified)
    (flight-route location_0_0 location_1_0)
    (flight-route location_1_0 location_0_0)

    ;; road connectivity within cities (explicit; here each city has a single airport-location,
    ;; so no inter-location roads are needed for this instance; kept empty intentionally)
  )

  ;; Goal: both packages at location_1_0
  (:goal (and
    (at package_0 location_1_0)
    (at package_1 location_1_0)
  ))
)