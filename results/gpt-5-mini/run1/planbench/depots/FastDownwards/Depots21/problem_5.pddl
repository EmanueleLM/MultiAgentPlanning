(define (problem move-crates)
  (:domain hoist-logistics)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist

    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; trucks at places
    (at-truck truck0 depot0)
    (at-truck truck1 depot0)
    (at-truck truck2 depot2)

    ;; hoists at places
    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)

    ;; surfaces (pallets) at places
    (at-surface pallet0 depot0)
    (at-surface pallet1 depot1)
    (at-surface pallet2 depot2)
    (at-surface pallet3 distributor0)

    ;; crates' initial support relations and explicit location facts (as given)
    (on crate0 pallet3)
    (at-surface crate0 distributor0)

    (on crate1 pallet1)
    (at-surface crate1 depot1)

    (on crate2 crate0)
    (at-surface crate2 distributor0)

    ;; clear surfaces (those without anything on top initially)
    (clear pallet0)
    (clear pallet2)
    (clear crate1)
    (clear crate2)

    ;; hoists available
    (hoist-free hoist0)
    (hoist-free hoist1)
    (hoist-free hoist2)
    (hoist-free hoist3)
  )

  (:goal (and
    (on crate0 pallet2)
    (on crate1 pallet0)
    (on crate2 crate1)
  ))
)