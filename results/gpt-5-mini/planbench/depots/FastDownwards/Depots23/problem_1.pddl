(define (problem depots23-prob)
  (:domain depots23)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
  )

  (:init
    ; places of pallets
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ; initial crate locations (also stacked)
    (at crate0 depot0)
    (at crate1 depot0)
    (at crate2 distributor0)

    ; stacking relationships
    (on crate0 pallet0)
    (on crate1 crate0)
    (on crate2 pallet3)

    ; truck locations
    (at_truck truck0 distributor0)
    (at_truck truck1 depot1)
    (at_truck truck2 distributor0)

    ; hoist locations
    (hoist_at hoist0 depot0)
    (hoist_at hoist1 depot1)
    (hoist_at hoist2 depot2)
    (hoist_at hoist3 distributor0)

    ; hoist availability
    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    ; clear surfaces (nothing on them)
    (clear crate1)
    (clear crate2)
    (clear pallet1)
    (clear pallet2)

    ; Note: crate0 and pallet0 and pallet3 are not listed as clear (they have crates on them)
  )

  (:goal (and
    (on crate0 pallet2)
    (on crate1 crate0)
    (on crate2 pallet0)
  ))
)