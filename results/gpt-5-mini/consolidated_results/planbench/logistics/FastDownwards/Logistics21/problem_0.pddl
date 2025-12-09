(define (problem integrated_transport_problem)
  (:domain integrated_transport)

  (:objects
    ; packages
    package_0 package_1 - package

    ; vehicles
    truck_0 - truck
    plane_0 - airplane

    ; locations
    location_0_0 location_0_1 location_0_2 location_1_0 - location
  )

  (:init
    ;; location types
    (road_loc location_0_0)
    (road_loc location_0_1)
    (road_loc location_0_2)
    (airport_loc location_0_1)  ; location_0_1 is both a road location and an airport (local airport accessible by truck)
    (airport_loc location_1_0)

    ;; road connectivity (bidirectional)
    (road_connected location_0_1 location_0_0)
    (road_connected location_0_0 location_0_1)
    (road_connected location_0_1 location_0_2)
    (road_connected location_0_2 location_0_1)

    ;; air connectivity (bidirectional)
    (air_connected location_1_0 location_0_1)
    (air_connected location_0_1 location_1_0)

    ;; initial positions of vehicles
    (attruck truck_0 location_0_1)
    (atplane plane_0 location_1_0)

    ;; initial package locations
    (atpkg package_0 location_0_0)
    (atpkg package_1 location_1_0)
  )

  (:goal (and
           (atpkg package_0 location_0_2)
           (atpkg package_1 location_0_0)
         ))
)