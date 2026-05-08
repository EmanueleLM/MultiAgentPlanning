(define (problem orchestrator_problem)
  (:domain logistics13)

  (:objects
    ;; trucks (one per city)
    truck_0 truck_1 - truck

    ;; airplanes
    airplane_0 airplane_1 - airplane

    ;; packages
    package_0 package_1 package_2 - package

    ;; locations
    location_0_0 location_0_1 location_1_0 location_1_1 - location

    ;; cities
    city_0 city_1 - city
  )

  (:init
    ;; City membership of locations
    (in_city location_0_0 city_0)
    (in_city location_0_1 city_0)
    (in_city location_1_0 city_1)
    (in_city location_1_1 city_1)

    ;; Airports (exactly the ones stated)
    (airport location_0_0)
    (airport location_1_0)

    ;; Initial vehicle positions (from the human statement)
    (at_truck truck_0 location_0_0)
    (at_truck truck_1 location_1_1)

    (at_plane airplane_0 location_1_0)
    (at_plane airplane_1 location_0_0)

    ;; Initial package positions
    (p_at package_0 location_1_0)
    (p_at package_1 location_1_1)
    (p_at package_2 location_0_0)

    ;; Airplanes initially free to carry one package
    (plane_free airplane_0)
    (plane_free airplane_1)
  )

  (:goal (and
    (p_at package_0 location_0_1)
    (p_at package_1 location_0_1)
    (p_at package_2 location_0_1)
  ))
)