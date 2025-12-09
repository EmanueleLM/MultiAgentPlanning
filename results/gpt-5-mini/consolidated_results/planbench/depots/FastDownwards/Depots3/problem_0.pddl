(define (problem depot-hoist-truck-problem)
  (:domain depot-hoist-truck)

  (:objects
    ;; places
    depot0 depot1 depot2 distributor0 - place

    ;; surfaces / pallets (fixed to places)
    pallet0 pallet1 pallet2 pallet3 - surface

    ;; crates
    crate0 crate1 crate2 - crate

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist
  )

  (:init
    ;; surfaces fixed at places
    (at-surface pallet0 depot0)
    (at-surface pallet1 depot1)
    (at-surface pallet2 depot2)
    (at-surface pallet3 distributor0)

    ;; crates on surfaces and crates clear
    (on crate0 pallet2)
    (at-surface pallet2 depot2) ; redundant with above but explicit
    (clear-crate crate0)

    (on crate1 pallet3)
    (at-surface pallet3 distributor0)
    (clear-crate crate1)

    (on crate2 pallet1)
    (at-surface pallet1 depot1)
    (clear-crate crate2)

    ;; surfaces clear semantics: a surface is clear iff no crate on it.
    ;; pallet0 currently empty
    (clear-surface pallet0)
    ;; pallets with crates are not clear (we represent that by omitting clear-surface for them)
    ;; thus pallet1, pallet2, pallet3 are not clear in init

    ;; trucks at places
    (at-truck truck0 depot1)
    (at-truck truck1 depot1)
    (at-truck truck2 depot1)

    ;; hoists at places and available
    (at-hoist hoist0 depot0)
    (available hoist0)

    (at-hoist hoist1 depot1)
    (available hoist1)

    (at-hoist hoist2 depot2)
    (available hoist2)

    (at-hoist hoist3 distributor0)
    (available hoist3)

    ;; connectivity: fully connected (directed) road network between all distinct places
    (connected depot0 depot1) (connected depot1 depot0)
    (connected depot0 depot2) (connected depot2 depot0)
    (connected depot0 distributor0) (connected distributor0 depot0)
    (connected depot1 depot2) (connected depot2 depot1)
    (connected depot1 distributor0) (connected distributor0 depot1)
    (connected depot2 distributor0) (connected distributor0 depot2)
  )

  (:goal (and
    ;; final placement requirements: crates on target pallets
    (on crate0 pallet0)
    (on crate1 pallet1)
    (on crate2 pallet3)
  ))
)