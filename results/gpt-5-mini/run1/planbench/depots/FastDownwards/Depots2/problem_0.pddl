(define (problem depot-problem)
  (:domain depot-domain)
  (:objects
    driver1 - driver
    hoistop1 - hoist_op
    manager1 - manager
    auditor1 - auditor

    crate1 crate2 - crate
    pallet0 pallet3 - pallet

    storage hoist_area - location
  )

  (:init
    ;; crate initial locations
    (at crate1 storage)
    (at crate2 storage)

    ;; pallet initial locations and emptiness
    (pallet_at pallet0 storage)
    (pallet_at pallet3 storage)
    (empty_pallet pallet0)
    (empty_pallet pallet3)

    ;; resource availability
    (hoist_free)
    (manager_available manager1)
    (driver_available driver1)
    (auditor_available auditor1)
  )

  ;; Mandated terminal conditions: crate1 on pallet0 and crate2 on pallet3.
  (:goal (and
    (crate_on_pallet crate1 pallet0)
    (crate_on_pallet crate2 pallet3)
  ))
)