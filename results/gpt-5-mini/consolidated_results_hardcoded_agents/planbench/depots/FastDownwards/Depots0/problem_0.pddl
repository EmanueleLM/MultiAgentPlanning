(define (problem move-crates-to-pallets)
  (:domain multiagent-transport)

  (:objects
    crate1 crate2 - crate
    pallet1 pallet3 - pallet
    truck1 - vehicle
    driver1 - driver
    hoist1 - hoist
    locA locB locC - location
  )

  (:init
    ;; initial locations
    (at crate1 locA)
    (at crate2 locB)

    (at pallet1 locB)
    (at pallet3 locC)

    (at truck1 locA)
    (at driver1 locA)

    ;; hoist is attached to truck and initially free
    (hoist-attached hoist1 truck1)
    (hoist-free hoist1)
  )

  (:goal (and
    ;; mandated terminal conditions
    (on crate1 pallet1)
    (on crate2 pallet3)
  ))
)