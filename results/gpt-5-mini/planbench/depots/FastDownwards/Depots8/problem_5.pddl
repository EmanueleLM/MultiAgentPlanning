(define (problem depots8-instance)
  (:domain depots-hoist)

  (:objects
    ;; places
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; pallets and crates (all surfaces)
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; pallets located at places (ground surfaces)
    (at-surface pallet0 depot0)
    (at-surface pallet1 depot1)
    (at-surface pallet2 depot2)
    (at-surface pallet3 distributor0)

    ;; crates explicitly located at places (consistent with stacking facts)
    (at-surface crate0 depot1)   ;; crate0 on pallet1 at depot1
    (at-surface crate1 distributor0) ;; crate1 on pallet3 at distributor0
    (at-surface crate2 depot1)   ;; crate2 on crate0 at depot1

    ;; stacking relations (direct on)
    (on crate0 pallet1)
    (on crate2 crate0)
    (on crate1 pallet3)

    ;; trucks initial locations
    (at-truck truck0 depot1)
    (at-truck truck1 depot2)
    (at-truck truck2 distributor0)

    ;; hoists initial locations
    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)

    ;; hoist availability
    (hoist-free hoist0)
    (hoist-free hoist1)
    (hoist-free hoist2)
    (hoist-free hoist3)

    ;; clear surfaces as stated in the problem
    (clear crate1)
    (clear crate2)
    (clear pallet0)
    (clear pallet2)
  )

  (:goal (and
    (on crate0 pallet0)
    (on crate2 pallet1)
  ))
)