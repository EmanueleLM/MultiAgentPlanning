(define (problem move-package-0)
  (:domain logistics-multiagent)

  (:objects
    ; Cities
    city_0 city_1 - city

    ; Locations (airports are locations too)
    location_0_1 - location
    airport_0 - location
    airport_1 - location
    location_1_2 - location

    ; Vehicles
    truck_0 truck_1 - truck
    plane_0 - airplane

    ; Package
    package_0 - package
  )

  (:init
    ; City membership for locations
    (loc-in-city location_0_1 city_0)
    (loc-in-city airport_0 city_0)
    (loc-in-city airport_1 city_1)
    (loc-in-city location_1_2 city_1)

    ; Define which locations are airports
    (airport airport_0)
    (airport airport_1)

    ; Road connectivity (symmetric edges declared explicitly)
    (connected-road location_0_1 airport_0)
    (connected-road airport_0 location_0_1)
    (connected-road airport_1 location_1_2)
    (connected-road location_1_2 airport_1)

    ; Air connectivity between airports (symmetric)
    (connected-air airport_0 airport_1)
    (connected-air airport_1 airport_0)

    ; Initial vehicle positions
    (truck-at truck_0 location_0_1)  ; truck in origin city near package
    (truck-at truck_1 airport_1)     ; truck in destination city at its airport
    (plane-at plane_0 airport_0)     ; plane at origin airport

    ; Package initial condition
    (at package_0 location_0_1)
    (free package_0)
  )

  ; The required terminal condition: package_0 must be at location_1_2
  (:goal (and
    (at package_0 location_1_2)
  ))
)