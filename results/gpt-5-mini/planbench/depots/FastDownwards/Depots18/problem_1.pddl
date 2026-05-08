(define (problem depots18-problem)
  (:domain depots_hoist)

  (:objects
    ;; places
    depot0 depot1 depot2 distributor0

    ;; pallets and crates (no typing used in this problem file)
    pallet0 pallet1 pallet2 pallet3
    crate0 crate1 crate2

    ;; trucks
    truck0 truck1 truck2

    ;; hoists
    hoist0 hoist1 hoist2 hoist3
  )

  (:init
    ;; locations of pallets
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; initial stacking: crates on pallets (and crates are at the same places as those pallets)
    (on crate0 pallet1)
    (at crate0 depot1)
    (clear crate0)

    (on crate1 pallet0)
    (at crate1 depot0)
    (clear crate1)

    (on crate2 pallet3)
    (at crate2 distributor0)
    (clear crate2)

    ;; pallet clearness: pallet2 is empty / clear; pallets 0,1,3 have crates on them so are not listed as clear
    (clear pallet2)

    ;; hoist positions and availability
    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)

    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; trucks locations
    (at-truck truck0 depot0)
    (at-truck truck1 depot0)
    (at-truck truck2 distributor0)
  )

  (:goal
    (and
      (on crate0 crate2)
      (on crate1 pallet2)
      (on crate2 pallet3)
    )
  )
)