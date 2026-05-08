(define (problem depots46_problem)
  (:domain depots46)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
  )

  (:init
    ;; crates at places (resting on surfaces)
    (at_crate crate0 depot0)
    (at_crate crate1 depot2)
    (at_crate crate2 depot1)

    ;; pallets at places
    (at_pallet pallet0 depot0)
    (at_pallet pallet1 depot1)
    (at_pallet pallet2 depot2)
    (at_pallet pallet3 distributor0)

    ;; hoists at places
    (at_hoist hoist0 depot0)
    (at_hoist hoist1 depot1)
    (at_hoist hoist2 depot2)
    (at_hoist hoist3 distributor0)

    ;; trucks at places
    (at_truck truck0 depot0)
    (at_truck truck1 depot2)
    (at_truck truck2 depot2)

    ;; hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; clear facts (explicit from statement)
    (clear crate0)
    (clear crate1)
    (clear crate2)
    (clear pallet3)

    ;; stacking (on relations)
    (on crate0 pallet0)
    (on crate1 pallet2)
    (on crate2 pallet1)
  )

  (:goal (and
    (on crate0 pallet0)
    (on crate1 pallet3)
    (on crate2 pallet2)
  ))
)