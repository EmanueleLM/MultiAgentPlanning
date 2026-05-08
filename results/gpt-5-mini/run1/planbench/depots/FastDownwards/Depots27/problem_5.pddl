(define (problem depots27-problem)
  (:domain depots27)

  (:objects
    ;; places
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    ;; supports: pallets, trucks, crates
    pallet0 pallet1 pallet2 pallet3 - pallet
    truck0 truck1 truck2 - truck
    crate0 crate1 crate2 - crate

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist
  )

  (:init
    ;; supports located at places (pallets and trucks)
    (at_support pallet0 depot0)
    (at_support pallet1 depot1)
    (at_support pallet2 depot2)
    (at_support pallet3 distributor0)

    (at_support truck0 depot0)
    (at_support truck1 depot0)
    (at_support truck2 depot1)

    ;; crates initially located at places (also represented by their being on supports)
    (at_support crate0 depot0)
    (at_support crate1 depot0)
    (at_support crate2 depot1)

    ;; hoists located and available
    (at_hoist hoist0 depot0)
    (at_hoist hoist1 depot1)
    (at_hoist hoist2 depot2)
    (at_hoist hoist3 distributor0)

    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    ;; initial stacking: crate0 on pallet0, crate1 on crate0, crate2 on pallet1
    (on crate0 pallet0)
    (on crate1 crate0)
    (on crate2 pallet1)

    ;; clear/top facts: crate1 and crate2 are clear; pallet2 and pallet3 are clear
    (clear crate1)
    (clear crate2)
    (clear pallet2)
    (clear pallet3)
  )

  (:goal (and
    (on crate0 pallet3)
    (on crate1 pallet0)
  ))
)