(define (problem transport_problem)
  (:domain transport_domain)

  (:objects
    truck_1 - truck
    plane_1 - airplane
    package_0 package_1 package_2 - package
    location_1_0 location_1_1 - location
    airport_1 - airport
  )

  (:init
    ;; Road connectivity (explicit; only the provided links are available)
    (road location_1_0 location_1_1)
    (road location_1_1 location_1_0)

    ;; No air routes are specified (plane actions exist in domain but no routes are available).
    ;; If there were airports connected, there would be air-route facts here, but none are given.

    ;; Initial positions
    (at-truck truck_1 location_1_0)
    (at-plane plane_1 airport_1)

    ;; Packages initial locations (all are on ground locations as specified)
    (at-package package_0 location_1_0)
    (at-package package_1 location_1_0)
    (at-package package_2 location_1_1)
  )

  ;; Goals: explicitly require each package to be at its designated final ground location.
  (:goal (and
    (at-package package_0 location_1_1)
    (at-package package_1 location_1_1)
    (at-package package_2 location_1_0)
  ))
)