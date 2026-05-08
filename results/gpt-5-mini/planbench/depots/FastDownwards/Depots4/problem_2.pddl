(define (problem depots4-instance)
  (:domain depots-hoist-truck)

  (:objects
    ;; places
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    ;; pallets and crates
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    ;; hoists and trucks
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
  )

  (:init
    ;; place positions of pallets
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; initial crate placements (both at-place and stacked relations)
    (at crate0 depot0)
    (on crate0 pallet0)

    (at crate1 depot0)
    (on crate1 crate0)

    (at crate2 depot1)
    (on crate2 pallet1)

    ;; clear facts (only those explicitly given)
    (clear crate1)
    (clear crate2)
    (clear pallet2)
    (clear pallet3)

    ;; hoist locations and availability
    (hoist_at hoist0 depot0)
    (hoist_at hoist1 depot1)
    (hoist_at hoist2 depot2)
    (hoist_at hoist3 distributor0)
    (hoist_free hoist0)
    (hoist_free hoist1)
    (hoist_free hoist2)
    (hoist_free hoist3)

    ;; truck locations
    (truck_at truck0 depot2)
    (truck_at truck1 depot1)
    (truck_at truck2 depot2)

    ;; connectivity: trucks can drive between any two distinct places (explicit)
    (connected depot0 depot1)
    (connected depot0 depot2)
    (connected depot0 distributor0)
    (connected depot1 depot0)
    (connected depot1 depot2)
    (connected depot1 distributor0)
    (connected depot2 depot0)
    (connected depot2 depot1)
    (connected depot2 distributor0)
    (connected distributor0 depot0)
    (connected distributor0 depot1)
    (connected distributor0 depot2)
  )

  (:goal (and
    (on crate0 pallet1)
    (on crate1 crate0)
    (on crate2 pallet0)
  ))
)