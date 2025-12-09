(define (problem logistics_problem)
  (:domain logistics_combined)

  (:objects
    ; cities
    city_0 city_1 - city

    ; locations
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location

    ; vehicles
    truck_0 truck_1 - truck
    airplane_0 - airplane

    ; packages
    package_0 package_1 package_2 package_3 - package
  )

  (:init
    ; airport locations
    (airport location_0_0)
    (airport location_1_0)

    ; location -> city membership
    (in_city location_0_0 city_0)
    (in_city location_0_1 city_0)
    (in_city location_0_2 city_0)
    (in_city location_1_0 city_1)
    (in_city location_1_1 city_1)
    (in_city location_1_2 city_1)

    ; assign trucks to their city (trucks operate only inside their city)
    (in_city location_0_0 city_0) ; redundant but explicit that location_0_0 in city_0
    ; (truck membership to city is not a separate predicate; truck movements are constrained by drive preconditions
    ;  which require the locations be in the same city. We will place each truck initially at a location of its city.)
    
    ; initial positions
    (at airplane_0 location_1_0)
    (at package_0 location_0_1)
    (at package_1 location_1_0)
    (at package_2 location_0_1)
    (at package_3 location_0_0)
    (at truck_0 location_0_0)
    (at truck_1 location_1_2)

    ; explicit city-difference facts for cross-city flight preconditions
    (city-different city_0 city_1)
    (city-different city_1 city_0)
  )

  (:goal (and
    (at package_0 location_1_2)
    (at package_1 location_0_1)
    (at package_2 location_1_2)
    (at package_3 location_0_2)
  ))
)