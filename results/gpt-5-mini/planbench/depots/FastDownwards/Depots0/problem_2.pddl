(define (problem Depots0)
  (:domain depots)

  (:objects
    ;; places
    depot0 depot1 depot2 distributor0 - place

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; surfaces: pallets and crates
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; surfaces locations (pallets)
    (at-surface pallet0 depot0)
    (at-surface pallet1 depot1)
    (at-surface pallet2 depot2)
    (at-surface pallet3 distributor0)

    ;; crates are also surfaces and placed at their places
    (at-surface crate0 depot1)
    (at-surface crate1 depot1)
    (at-surface crate2 depot0)

    ;; stacking relations (directly on)
    (on crate0 pallet1)
    (on crate1 crate0)
    (on crate2 pallet0)

    ;; clear surfaces (nothing on top)
    (clear crate1)
    (clear crate2)
    (clear pallet2)
    (clear pallet3)

    ;; hoist and truck locations and availability
    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)

    (hoist-free hoist0)
    (hoist-free hoist1)
    (hoist-free hoist2)
    (hoist-free hoist3)

    (at-truck truck0 depot1)
    (at-truck truck1 depot1)
    (at-truck truck2 distributor0)
  )

  (:goal (and
           (on crate1 pallet1)
           (on crate2 pallet3)
         ))
)