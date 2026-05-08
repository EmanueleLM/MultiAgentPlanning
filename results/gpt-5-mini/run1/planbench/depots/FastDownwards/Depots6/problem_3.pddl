(define (problem depots6-problem)
  (:domain depots6)
  (:objects
    ;; places
    depot0 depot1 depot2 distributor0 - place

    ;; surfaces: pallets and crates
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    ;; hoists and trucks
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
  )

  (:init
    ;; hoist locations
    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)

    ;; truck locations
    (at-truck truck0 distributor0)
    (at-truck truck1 distributor0)
    (at-truck truck2 depot2)

    ;; surface locations (pallets and crates)
    (at-surface pallet0 depot0)
    (at-surface pallet1 depot1)
    (at-surface pallet2 depot2)
    (at-surface pallet3 distributor0)

    (at-surface crate0 depot2)
    (at-surface crate1 depot0)
    (at-surface crate2 depot0)

    ;; stacking relations
    (on crate0 pallet2)
    (on crate1 pallet0)
    (on crate2 crate1)

    ;; hoist availability
    (hoist-available hoist0)
    (hoist-available hoist1)
    (hoist-available hoist2)
    (hoist-available hoist3)

    ;; clear surfaces (nothing on top)
    (clear crate0)
    (clear crate2)
    (clear pallet1)
    (clear pallet3)
  )

  (:goal (and
    (on crate0 crate2)
    (on crate1 pallet2)
    (on crate2 pallet1)
  ))
)