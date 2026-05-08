(define (problem deliver-crates)
  (:domain multiagent-hoist-truck)

  (:objects
    depot0 depot1 depot2 distributor0 - place

    truck0 truck1 truck2 - truck

    hoist0 hoist1 hoist2 hoist3 - hoist

    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; roads: fully connected (directed)
    (road depot0 depot1)
    (road depot0 depot2)
    (road depot0 distributor0)
    (road depot1 depot0)
    (road depot1 depot2)
    (road depot1 distributor0)
    (road depot2 depot0)
    (road depot2 depot1)
    (road depot2 distributor0)
    (road distributor0 depot0)
    (road distributor0 depot1)
    (road distributor0 depot2)

    ;; truck initial locations
    (at-truck truck0 depot0)
    (at-truck truck1 depot0)
    (at-truck truck2 depot1)

    ;; hoist locations and availability
    (at-hoist hoist0 depot0)
    (hoist-available hoist0)
    (at-hoist hoist1 depot1)
    (hoist-available hoist1)
    (at-hoist hoist2 depot2)
    (hoist-available hoist2)
    (at-hoist hoist3 distributor0)
    (hoist-available hoist3)

    ;; pallets location and clear status
    (pallet-at pallet0 depot0)
    (clear pallet0)
    (pallet-at pallet1 depot1)
    (clear pallet1)
    (pallet-at pallet2 depot2)
    (clear pallet2)
    (pallet-at pallet3 distributor0)
    ;; pallet3 is occupied in the stack below, so no (clear pallet3)

    ;; crate stack at distributor0:
    ;; pallet3 <- crate0 <- crate1 <- crate2  (crate2 is top and clear)
    (crate-at crate0 distributor0)
    (on crate0 pallet3)

    (crate-at crate1 distributor0)
    (on crate1 crate0)

    (crate-at crate2 distributor0)
    (on crate2 crate1)
    (clear crate2)

    ;; hoist-busy tokens: no hoist busy anywhere initially
    (no-hoist-busy depot0)
    (no-hoist-busy depot1)
    (no-hoist-busy depot2)
    (no-hoist-busy distributor0)
  )

  (:goal (and
    (on crate1 pallet1)
    (on crate2 pallet2)
  ))