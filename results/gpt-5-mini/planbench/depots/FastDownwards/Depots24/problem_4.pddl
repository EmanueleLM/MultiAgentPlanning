(define (problem logistics-instance-0)
  (:domain logistics-stacking)

  (:objects
    depot0 depot1 depot2 distributor0 - place

    truck0 truck1 truck2 - truck

    hoist0 hoist1 hoist2 hoist3 - hoist

    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; trucks
    (at-truck truck0 depot2)
    (at-truck truck1 depot0)
    (at-truck truck2 depot2)

    ;; hoists and availability
    (at-hoist hoist0 depot0)
    (hoist-available hoist0)

    (at-hoist hoist1 depot1)
    (hoist-available hoist1)

    (at-hoist hoist2 depot2)
    (hoist-available hoist2)

    (at-hoist hoist3 distributor0)
    (hoist-available hoist3)

    ;; pallets at places
    (at-surface pallet0 depot0)
    (at-surface pallet1 depot1)
    (at-surface pallet2 depot2)
    (at-surface pallet3 distributor0)

    ;; crates resting on pallets and at places
    (on crate0 pallet0)
    (at-surface crate0 depot0)
    (clear crate0)

    (on crate1 pallet3)
    (at-surface crate1 distributor0)
    (clear crate1)

    (on crate2 pallet2)
    (at-surface crate2 depot2)
    (clear crate2)

    ;; free surfaces
    (clear pallet1)
  )

  (:goal (and
           (on crate0 crate2)
           (on crate1 pallet2)
           (on crate2 pallet0)
         )
  )
)