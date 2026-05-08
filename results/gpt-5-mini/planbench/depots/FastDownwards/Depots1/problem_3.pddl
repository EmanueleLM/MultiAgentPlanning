(define (problem depots1)
  (:domain depots1)

  (:objects
    depot0 depot1 depot2 distributor0 - place
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
  )

  (:init
    ;; locations of hoists and trucks
    (at_hoist hoist0 depot0)
    (at_hoist hoist1 depot1)
    (at_hoist hoist2 depot2)
    (at_hoist hoist3 distributor0)

    (at_truck truck0 depot0)
    (at_truck truck1 depot1)
    (at_truck truck2 depot0)

    ;; surfaces at places (pallets)
    (at_place pallet0 depot0)
    (at_place pallet1 depot1)
    (at_place pallet2 depot2)
    (at_place pallet3 distributor0)

    ;; crates also at places (and stacked)
    (at_place crate0 depot0)
    (at_place crate1 depot0)
    (at_place crate2 depot2)

    ;; stacking relations (initial)
    (on crate0 pallet0)
    (on crate1 crate0)
    (on crate2 pallet2)

    ;; hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; clear-top facts (explicit)
    (clear crate1)
    (clear crate2)
    (clear pallet1)
    (clear pallet3)
  )

  (:goal (and
    (on crate0 pallet3)
    (on crate1 pallet0)
    (on crate2 crate0)
  ))
)