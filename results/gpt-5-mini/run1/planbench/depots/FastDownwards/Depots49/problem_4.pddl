(define (problem depots49)
  (:domain depots49)

  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    hoist0 hoist1 hoist2 hoist3 - hoist

    truck0 truck1 truck2 - truck

    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; pallets and crates located at places
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    (at crate0 depot0)
    (at crate1 depot1)
    (at crate2 depot1)

    ;; stacking relations
    (on crate0 pallet0)
    (on crate1 pallet1)
    (on crate2 crate1)

    ;; clear surfaces / crates (only those explicitly clear)
    (clear crate0)
    (clear crate2)
    (clear pallet2)
    (clear pallet3)

    ;; trucks locations
    (truck_at truck0 depot2)
    (truck_at truck1 depot2)
    (truck_at truck2 depot1)

    ;; hoists location and availability
    (hoist_at hoist0 depot0)
    (hoist_at hoist1 depot1)
    (hoist_at hoist2 depot2)
    (hoist_at hoist3 distributor0)

    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)
  )

  (:goal (and
    (on crate0 pallet2)
    (on crate2 pallet0)
  ))
)