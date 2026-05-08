(define (problem deliver-pallets)
  (:domain drivers-hoists-orchestration)
  (:objects
    d1 d2 - driver
    v1 v2 - vehicle
    h1 h2 - hoist
    p1 p2 - item
    depot siteA siteB - location
  )

  (:init
    ;; Locations of vehicles, drivers, hoists, and items
    (at-vehicle v1 depot)
    (at-vehicle v2 depot)

    (driver-at d1 depot)
    (driver-at d2 depot)

    (at-hoist h1 depot)
    (at-hoist h2 depot)

    (at-item p1 depot)
    (at-item p2 depot)

    ;; Assignments
    (assigned d1 v1)
    (assigned d2 v2)

    (assigned-item p1 v1)
    (assigned-item p2 v2)

    ;; Destinations
    (destination p1 siteA)
    (destination p2 siteB)

    ;; Hoist availability and calibration state (calibration required before use)
    (hoist-available h1)
    (hoist-available h2)
    ;; hoist-calibrated facts are absent initially (require calibration)

    ;; Vehicles require loading before they can depart
    (loading-required v1)
    (loading-required v2)
  )

  (:goal (and
    ;; Both items must be placed at their destination locations and marked delivered.
    (delivered p1)
    (delivered p2)
    (at-item p1 siteA)
    (at-item p2 siteB)
  ))
)