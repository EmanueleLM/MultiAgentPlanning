(define (problem depots-13)
  (:domain depots)
  (:objects
    depot0 depot1 depot2 - place
    distributor0 - place
    crate0 crate1 crate2 - crate
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    truck0 truck1 truck2 - truck
  )
  (:init
    ; Initial locations of hoists
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ; Initial locations of pallets
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ; Initial locations of trucks
    (at truck0 depot2)
    (at truck1 distributor0)
    (at truck2 distributor0)

    ; Initial locations of crates
    (at crate0 depot2)
    (at crate1 depot0)
    (at crate2 depot1)

    ; Initial availability of hoists
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ; Initial 'clear' status for crates (nothing on top of them)
    (clear crate0)
    (clear crate1)
    (clear crate2)

    ; Initial 'clear' status for pallets and 'on' relations
    ; crate0 is on pallet2, so pallet2 is NOT clear
    (on crate0 pallet2)
    (not (clear pallet2))

    ; crate1 is on pallet0, so pallet0 is NOT clear
    (on crate1 pallet0)
    (not (clear pallet0))

    ; crate2 is on pallet1, so pallet1 is NOT clear
    (on crate2 pallet1)
    (not (clear pallet1))

    ; pallet3 is clear (explicitly stated, nothing on it)
    (clear pallet3)
  )
  (:goal (and
    (on crate0 pallet1)
    (on crate2 crate0)
  ))