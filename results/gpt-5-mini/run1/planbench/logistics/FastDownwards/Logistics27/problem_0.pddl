(define (problem transport-problem)
  (:domain transport-domain)

  ;; Objects in the world
  (:objects
    package_0 package_1 package_2 - package
    truck_1 plane_1 - vehicle
    location_1_0 location_1_1 - location
  )

  ;; Initial state: positions of packages and vehicles, classifiers, airports.
  (:init
    ;; Classify vehicles
    (truck truck_1)
    (airplane plane_1)

    ;; Mark both locations as valid locations
    (location location_1_0)
    (location location_1_1)

    ;; Mark both locations as airports so airplanes may operate there.
    ;; (This is explicit rather than inventing intermediary infrastructure;
    ;;  it constrains plane actions to these declared airport locations.)
    (airport location_1_0)
    (airport location_1_1)

    ;; Initial vehicle positions
    (vehicle-at truck_1 location_1_0)
    (vehicle-at plane_1 location_1_1)

    ;; Initial package positions:
    ;; - package_0 and package_1 start at location_1_0 and should end at location_1_1
    ;; - package_2 starts at location_1_1 and should end at location_1_0
    (at package_0 location_1_0)
    (at package_1 location_1_0)
    (at package_2 location_1_1)
  )

  ;; Goal: final required package locations (hard constraints).
  (:goal
    (and
      (at package_0 location_1_1)
      (at package_1 location_1_1)
      (at package_2 location_1_0)
    )
  )
)