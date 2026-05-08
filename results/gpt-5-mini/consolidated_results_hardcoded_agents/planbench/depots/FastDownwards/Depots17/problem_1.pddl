(define (problem depots17-problem)
  (:domain depots17)
  (:objects
    ; places
    depot0 depot1 depot2 distributor0 - place

    ; pallets and crates (pallet and crate are subtypes of surface)
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    ; hoists and trucks
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
  )

  (:init
    ; place facts for pallets
    (at-surface pallet0 depot0)
    (at-surface pallet1 depot1)
    (at-surface pallet2 depot2)
    (at-surface pallet3 distributor0)

    ; place facts for crates (crate is at a place and possibly on a surface)
    (at-surface crate0 distributor0)
    (at-surface crate1 distributor0)
    (at-surface crate2 depot1)

    ; stacking relationships (crate on surface)
    (on crate0 pallet3)
    (on crate1 crate0)
    (on crate2 pallet1)

    ; clear/top status as given
    (clear crate1)
    (clear crate2)
    (clear pallet0)
    (clear pallet2)

    ; hoist locations and availability
    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)
    (hoist-available hoist0)
    (hoist-available hoist1)
    (hoist-available hoist2)
    (hoist-available hoist3)

    ; truck locations
    (at-truck truck0 distributor0)
    (at-truck truck1 depot2)
    (at-truck truck2 distributor0)
  )

  (:goal (and
    (on crate0 pallet0)
    (on crate1 pallet2)
    (on crate2 pallet3)
  ))
)