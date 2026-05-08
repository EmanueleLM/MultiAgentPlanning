(define (problem move-crates)
  (:domain hoist-logistics)

  (:objects
    ; places and subtypes
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    ; trucks
    truck0 truck1 truck2 - truck

    ; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ; surfaces: pallets and crates are surfaces
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    ; Note: crate objects are of type crate which is a subtype of surface in the domain typing
  )

  (:init
    ; place locations for trucks
    (at-truck truck0 depot0)
    (at-truck truck1 depot0)
    (at-truck truck2 depot2)

    ; place locations for hoists
    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)

    ; place locations for pallets and crate-surfaces
    (at-surface pallet0 depot0)
    (at-surface pallet1 depot1)
    (at-surface pallet2 depot2)
    (at-surface pallet3 distributor0)

    ; crates that also function as surfaces must have at-surface facts when they are present (they inherit place from what they're on)
    (at-surface crate0 distributor0)

    ; on-relations (crate placements)
    (on crate0 pallet3)    ; crate0 sits on pallet3 at distributor0
    (on crate2 crate0)     ; crate2 sits on top of crate0 at distributor0
    (on crate1 pallet1)    ; crate1 sits on pallet1 at depot1

    ; clear predicate: surface or crate has nothing on top
    (clear pallet0)
    (clear pallet2)
    (clear crate2)
    (clear crate1)

    ; surfaces that are occupied are not clear (explicitly absent)
    ; (clear pallet3) is not set because pallet3 has crate0 on it
    ; (clear crate0) is not set because crate2 is on it
    ; (clear pallet1) is not set because crate1 is on it

    ; hoist availability tokens (maintained by actions)
    (hoist-free hoist0)
    (hoist-free hoist1)
    (hoist-free hoist2)
    (hoist-free hoist3)

    ; connectivity: assumption — depots and distributors are fully connected
    ; explicit symmetric connections between all places (excluding identity)
    (connected depot0 depot1)
    (connected depot1 depot0)
    (connected depot0 depot2)
    (connected depot2 depot0)
    (connected depot0 distributor0)
    (connected distributor0 depot0)

    (connected depot1 depot2)
    (connected depot2 depot1)
    (connected depot1 distributor0)
    (connected distributor0 depot1)

    (connected depot2 distributor0)
    (connected distributor0 depot2)
  )

  (:goal (and
    ; final mandated placements (hard constraints)
    (on crate0 pallet2)   ; crate0 must be on pallet2 at depot2
    (on crate1 pallet0)   ; crate1 must be on pallet0 at depot0
    (on crate2 crate1)    ; crate2 must be on crate1 at depot0
  ))