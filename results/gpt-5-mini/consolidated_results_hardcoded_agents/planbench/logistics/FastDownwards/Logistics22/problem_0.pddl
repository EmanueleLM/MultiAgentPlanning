(define (problem multi_modal_problem)
  (:domain multi_modal_transport)

  (:objects
    ;; locations in region 0 (road network)
    location_0_0 location_0_1 location_0_2 - location
    ;; locations in region 1 (air network)
    location_1_0 location_1_1 - location

    ;; vehicles
    truck_0 - truck
    plane_1 - airplane

    ;; packages
    package_0 package_1 - package
  )

  (:init
    ;; Initial vehicle positions
    (at-vehicle truck_0 location_0_0)
    (at-vehicle plane_1 location_1_1)

    ;; Initial package positions
    (at-package package_0 location_0_0)
    (at-package package_1 location_1_1)

    ;; Road connectivity (bidirectional explicit)
    (road-connected location_0_0 location_0_1)
    (road-connected location_0_1 location_0_0)
    (road-connected location_0_1 location_0_2)
    (road-connected location_0_2 location_0_1)

    ;; Air connectivity (bidirectional explicit)
    (air-connected location_1_1 location_1_0)
    (air-connected location_1_0 location_1_1)
  )

  (:goal
    (and
      ;; Mandated terminal conditions:
      (at-package package_0 location_0_2)
      (at-package package_1 location_1_0)
    )
  )
)