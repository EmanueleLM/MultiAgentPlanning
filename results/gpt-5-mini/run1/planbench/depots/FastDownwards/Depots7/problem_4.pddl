(define (problem depots7-problem)
  (:domain depots7)
  (:objects
    depot0 depot1 depot2 distributor0 - place

    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
  )

  (:init
    ;; locations of supports (pallets)
    (support_at pallet0 depot0)
    (support_at pallet1 depot1)
    (support_at pallet2 depot2)
    (support_at pallet3 distributor0)

    ;; crates stacked on supports initially
    (on crate0 pallet1)
    (on crate1 pallet3)
    (on crate2 pallet0)

    ;; clear flags: crates have nothing on them initially
    (clear_crate crate0)
    (clear_crate crate1)
    (clear_crate crate2)

    ;; clear supports: only pallet2 is empty initially
    (clear_support pallet2)
    ;; pallet0, pallet1, pallet3 are occupied by crates -> not declared clear

    ;; hoists locations and availability
    (hoist_at hoist0 depot0)
    (hoist_at hoist1 depot1)
    (hoist_at hoist2 depot2)
    (hoist_at hoist3 distributor0)

    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    ;; trucks locations
    (truck_at truck0 depot0)
    (truck_at truck1 distributor0)
    (truck_at truck2 depot1)
  )

  (:goal (and
    (on crate0 pallet3)
    (on crate1 crate2)
    (on crate2 pallet1)
  ))
)