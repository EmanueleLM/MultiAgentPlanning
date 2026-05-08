(define (problem logistics-problem)
  (:domain logistics)

  ;;; Initial facts are taken from the human statement:
  ;;; - Two cities: city_0, city_1.
  ;;; - Two locations: location_0_0 in city_0 (airport), location_1_0 in city_1 (airport).
  ;;; - Trucks: truck_0 at location_0_0 (city_0), truck_1 at location_1_0 (city_1).
  ;;; - Airplanes: airplane_0 and airplane_1 both at location_1_0 (airport of city_1).
  ;;; - Package: package_0 at location_1_0.
  ;;; - Airlinks exist between the two airports (both directions) so airplanes can fly between them.

  (:objects
    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane
    package_0 - package
    location_0_0 location_1_0 - location
    city_0 city_1 - city
  )

  (:init
    ;; package and vehicle positions
    (at-package package_0 location_1_0)

    (at-truck truck_0 location_0_0)
    (at-truck truck_1 location_1_0)

    (at-airplane airplane_0 location_1_0)
    (at-airplane airplane_1 location_1_0)

    ;; location -> city membership
    (in-city location_0_0 city_0)
    (in-city location_1_0 city_1)

    ;; airports
    (airport location_0_0)
    (airport location_1_0)

    ;; air connectivity (both directions)
    (airlink location_1_0 location_0_0)
    (airlink location_0_0 location_1_0)
  )

  (:goal
    (and
      (at-package package_0 location_0_0)
    )
  )
)