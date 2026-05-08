(define (problem transport_problem)
  (:domain transport_domain)

  (:objects
    package_0 package_1 - package
    location_0_0 location_0_1 location_0_2 - location
    truck_1 - truck
    plane_1 - airplane
  )

  (:init
    ;; Package initial locations
    (package-at package_0 location_0_0)
    (package-at package_1 location_0_2)

    ;; Vehicle initial locations
    (vehicle-at truck_1 location_0_1)
    (vehicle-at plane_1 location_0_0)

    ;; Vehicles start empty (capacity 1 enforced by empty predicate)
    (empty truck_1)
    (empty plane_1)

    ;; Airports: only some locations are airports (plane may only load/unload/fly between airports)
    (airport location_0_0)
    (airport location_0_2)

    ;; Road connectivity (bidirectional explicitly stated)
    (road location_0_0 location_0_1)
    (road location_0_1 location_0_0)
    (road location_0_1 location_0_2)
    (road location_0_2 location_0_1)
  )

  (:goal (and
    (package-at package_0 location_0_2)
    (package-at package_1 location_0_0)
  ))
)