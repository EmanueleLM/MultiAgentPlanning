(define (problem logistics9-problem)
  (:domain logistics9)
  (:objects
    city_0 city_1 - city
    location_0_0 location_0_1 location_1_0 location_1_1 - location
    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane
    package_0 package_1 - package
  )

  (:init
    (= (total-cost) 0)

    ; City-location relationships
    (is-city-loc location_0_0 city_0)
    (is-city-loc location_0_1 city_0)
    (is-city-loc location_1_0 city_1)
    (is-city-loc location_1_1 city_1)

    ; Airport locations
    (is-airport location_0_0)
    (is-airport location_1_0)

    ; Vehicle city assignments (only for trucks, as airplanes fly between cities)
    (vehicle-city truck_0 city_0)
    (vehicle-city truck_1 city_1)

    ; Initial vehicle positions
    (at truck_0 location_0_0)
    (at truck_1 location_1_0)
    (at airplane_0 location_1_0)
    (at airplane_1 location_0_0)

    ; Initial package positions
    (at package_0 location_0_0)
    (at package_1 location_1_1)
  )

  (:goal
    (and (at package_0 location_0_1)
         (at package_1 location_1_0))
  )

  (:metric minimize (total-cost))