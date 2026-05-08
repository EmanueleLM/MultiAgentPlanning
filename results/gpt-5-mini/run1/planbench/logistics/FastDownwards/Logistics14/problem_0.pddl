(define (problem multiagent_transport_problem)
  (:domain multiagent_transport_domain)

  (:objects
    ;; Packages
    package_0 package_1 package_2 package_3 - package

    ;; Vehicles / agents
    truck_0 - truck
    airplane_0 - airplane

    ;; Locations
    location_0_0 location_0_1 location_1_0 location_1_1 - location
  )

  (:init
    ;; Initial vehicle positions
    (truck-at truck_0 location_0_0)
    (plane-at airplane_0 location_1_1)

    ;; Initial package positions
    ;; Packages 0 and 1 start where truck is and must be delivered to location_0_1
    (package-at package_0 location_0_0)
    (package-at package_1 location_0_0)

    ;; Packages 2 and 3 start where airplane is and must be delivered to location_1_0
    (package-at package_2 location_1_1)
    (package-at package_3 location_1_1)

    ;; Road connectivity for truck (bidirectional edges must be provided explicitly)
    (road location_0_0 location_0_1)
    (road location_0_1 location_0_0)

    ;; Flight routes for airplane (bidirectional)
    (flight-route location_1_1 location_1_0)
    (flight-route location_1_0 location_1_1)
  )

  (:goal
    (and
      ;; Global terminal conditions as required
      (package-at package_0 location_0_1)
      (package-at package_1 location_0_1)
      (package-at package_2 location_1_0)
      (package-at package_3 location_1_0)
    )
  )
)