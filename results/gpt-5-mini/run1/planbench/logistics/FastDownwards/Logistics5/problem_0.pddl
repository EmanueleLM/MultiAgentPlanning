(define (problem logistics_multiagent_problem)
  (:domain logistics_multiagent)
  (:objects
    city_0 city_1 - city
    location_0_0 location_0_1 location_1_0 location_1_1 - location
    truck_0 truck_1 - truck
    airplane_0 - airplane
    package_0 - package
  )
  (:init
    ; Location -> city assignments (I1)
    (location_in_city location_0_0 city_0)
    (location_in_city location_0_1 city_0)
    (location_in_city location_1_0 city_1)
    (location_in_city location_1_1 city_1)

    ; Airport markers (I6) and airplane initial location
    (airport location_0_0)
    (airport location_1_0)

    ; Truck assignments (I2) and initial truck locations (I3, I5)
    (truck_assigned_to truck_0 city_0)
    (truck_assigned_to truck_1 city_1)
    (truck_at truck_0 location_0_0)
    (truck_at truck_1 location_1_1)

    ; Airplane initial location (airport)
    (airplane_at airplane_0 location_0_0)

    ; Package initial placement (exclusive: package_at means not in any vehicle initially)
    (package_at package_0 location_0_1)
  )
  (:goal (and
    (package_at package_0 location_1_0)
  ))
)