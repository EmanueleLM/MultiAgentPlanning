(define (problem move-crates-to-target-pallets)
  (:domain hoist-truck-multiagent)

  (:objects
    depot0 depot1 depot2 distributor0 - place
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    crate0 crate1 crate2 - crate
    pallet0 pallet1 pallet2 pallet3 - pallet
  )

  (:init
    ;; places are connected by roads (trucks can drive between any two)
    (road depot0 depot1) (road depot1 depot0)
    (road depot0 depot2) (road depot2 depot0)
    (road depot0 distributor0) (road distributor0 depot0)
    (road depot1 depot2) (road depot2 depot1)
    (road depot1 distributor0) (road distributor0 depot1)
    (road depot2 distributor0) (road distributor0 depot2)

    ;; initial locations
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    (at truck0 depot0)
    (at truck1 depot0)
    (at truck2 depot1)

    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; clear status: top-of-stack objects and empty pallets listed as clear
    (clear pallet0)
    (clear pallet1)
    (clear pallet2)
    (clear crate2)   ;; crate2 is on top of the stack at distributor0

    ;; crate positions and stacking
    (at crate0 distributor0)
    (at crate1 distributor0)
    (at crate2 distributor0)

    (on crate0 pallet3)
    (on crate1 crate0)
    (on crate2 crate1)
  )

  (:goal (and
    (on crate1 pallet1)
    (on crate2 pallet2)
  ))
)