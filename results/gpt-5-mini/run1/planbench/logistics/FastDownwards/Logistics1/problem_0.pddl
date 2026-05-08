(define (problem transport_problem)
  (:domain transport_domain)

  (:objects
    ;; packages
    package_0 package_1 - package

    ;; agents
    truck_0 - truck
    plane_0 - airplane

    ;; locations (explicitly enumerated)
    location_0_0 airport_0_0 airport_1_0 location_1_0 - location

    ;; cities
    city_0 city_1 - city
  )

  (:init
    ;; initial package locations (public information)
    (at package_0 location_0_0)
    (at package_1 location_0_0)

    ;; vehicle initial locations (public information)
    (truck-at truck_0 location_0_0)
    (airplane-at plane_0 airport_0_0)

    ;; airport designations
    (is-airport airport_0_0)
    (is-airport airport_1_0)

    ;; city membership of locations
    (located-in-city location_0_0 city_0)
    (located-in-city airport_0_0 city_0)

    (located-in-city airport_1_0 city_1)
    (located-in-city location_1_0 city_1)

    ;; road connections (truck can drive between these locations)
    ;; explicitly provided directed edges; both directions where travel allowed
    (road location_0_0 airport_0_0)
    (road airport_0_0 location_0_0)

    (road airport_1_0 location_1_0)
    (road location_1_0 airport_1_0)

    ;; flight routes between airports (directed where flights are possible)
    (flight-route airport_0_0 airport_1_0)
    (flight-route airport_1_0 airport_0_0)
  )

  ;; Global goal: both packages must be at location_1_0
  (:goal (and
    (at package_0 location_1_0)
    (at package_1 location_1_0)
  ))
)