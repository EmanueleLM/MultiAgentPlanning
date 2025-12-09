(define (problem deliver_packages)
  (:domain transport_combined)
  (:objects
    package_0 package_1 package_2 package_3 - package
    truck_0 - truck
    airplane_0 - airplane
    location_0_0 location_0_1 location_1_0 location_1_1 - location
  )
  (:init
    ;; Vehicles initial locations
    (at truck_0 location_0_0)
    (at airplane_0 location_1_1)

    ;; Packages initial locations and free status
    (at package_0 location_0_0)
    (free package_0)

    (at package_1 location_1_1)
    (free package_1)

    (at package_2 location_0_1)
    (free package_2)

    (at package_3 location_1_1)
    (free package_3)

    ;; No package is in any vehicle initially (explicitly ensure none of the in predicates hold)
    ;; (No additional facts required because by default predicates are false unless stated.)
  )
  (:goal
    (and
      (at package_0 location_0_1)
      (at package_1 location_0_1)
      (at package_2 location_1_0)
      (at package_3 location_1_0)
    )
  )
)