(define (problem transport-problem)
  (:domain transport-domain)

  ; Ambiguity note: The public information did not specify initial locations of agents,
  ; package_0, nor explicit connectivity among locations. To produce a solvable problem
  ; that meets the stated global goal (package_0 at location_0_0), the minimal explicit
  ; assumptions made here are:
  ;  - package_0 initially at location_0_1
  ;  - truck_0 initially at location_0_1 so it can carry package_0 to location_0_0
  ;  - there is a direct road connection between location_0_1 and location_0_0 (bidirectional)
  ;  - airplane_0 exists but is not required for this goal and is placed at location_0_0
  ;
  ; These assumptions are minimal to allow a STRIPS plan: load package into truck at
  ; location_0_1, drive truck to location_0_0, unload package at location_0_0.
  ; If any of these assumptions contradicts private/public information you have,
  ; please supply the missing connectivity or initial facts and a revised problem will be produced.

  (:objects
    truck_0 - truck
    airplane_0 - airplane
    package_0 - package
    location_0_0 location_0_1 - location
    city_0 - city
  )

  (:init
    ; initial placement assumptions (see ambiguity comment)
    (at-package package_0 location_0_1)
    (at-truck truck_0 location_0_1)
    (at-airplane airplane_0 location_0_0)

    ; connectivity assumptions (explicit edges)
    (road-connected location_0_1 location_0_0)
    (road-connected location_0_0 location_0_1)

    ; no air-route edges are required for this problem, but model supports them
    ; grouping locations into a city (optional structural info)
    (location-in-city location_0_0 city_0)
    (location-in-city location_0_1 city_0)
  )

  (:goal
    (and
      (at-package package_0 location_0_0)
    )
  )
)