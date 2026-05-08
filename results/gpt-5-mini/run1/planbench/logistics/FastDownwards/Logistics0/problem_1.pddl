(define (problem logistics0-prob)
  (:domain logistics0)

  ; Note: The problem statement specifies two cities (city_0, city_1),
  ; two locations (location_0_0 is airport of city_0, location_1_0 is airport of city_1),
  ; two airplanes (airplane_0, airplane_1), two trucks (truck_0 in city_0, truck_1 in city_1),
  ; one package (package_0 at location_1_0). Trucks may drive between any two locations that
  ; share the same city; no explicit road facts are needed because drive-truck checks the in-city relation.
  ; This PDDL makes the minimal assumptions encoded above exactly as predicates.
  ;

  (:objects
    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane
    package_0 - package
    location_0_0 location_1_0 - location
    city_0 city_1 - city
  )

  (:init
    ;; airports
    (airport location_0_0)
    (airport location_1_0)

    ;; location -> city mapping
    (in-city location_0_0 city_0)
    (in-city location_1_0 city_1)

    ;; initial vehicle and package positions (as given)
    (at-airplane airplane_0 location_1_0)
    (at-airplane airplane_1 location_1_0)

    (at-package package_0 location_1_0)

    (at-truck truck_0 location_0_0)
    (at-truck truck_1 location_1_0)
  )

  (:goal (and
    (at-package package_0 location_0_0)
  ))
)