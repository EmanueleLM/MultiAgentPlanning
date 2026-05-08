(define (problem depots29_problem)
  (:domain depots29)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
  )
  (:init
    ; All places are directly connected to each other
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

    ; Initial locations of trucks and hoists
    (at_place truck0 depot0)
    (at_place truck1 depot1)
    (at_place truck2 depot2)
    (at_place hoist0 depot0)
    (at_place hoist1 depot1)
    (at_place hoist2 depot2)
    (at_place hoist3 distributor0)

    ; Initial locations of pallets and crates (when resting on a surface)
    (at_surface pallet0 depot0)
    (at_surface pallet1 depot1)
    (at_surface pallet2 depot2)
    (at_surface pallet3 distributor0)
    (at_surface crate0 distributor0)
    (at_surface crate1 depot0)
    (at_surface crate2 depot0)

    ; Initial hoist availability
    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    ; Initial clear status of crates and pallets
    (clear crate0)
    (clear crate2)
    (clear pallet1)
    (clear pallet2)
    ; The following are implicitly NOT clear due to 'on' relations:
    ; (not (clear pallet3)) because crate0 is on it.
    ; (not (clear pallet0)) because crate1 is on it.
    ; (not (clear crate1)) because crate2 is on it.

    ; Initial 'on' relations (stacking)
    (on crate0 pallet3)
    (on crate1 pallet0)
    (on crate2 crate1)
  )
  (:goal (and
    (on crate1 pallet1)
    (on crate2 pallet2)
  ))
)