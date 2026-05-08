(define (problem depots49)
  (:domain depots_instance)

  (:objects
    ;; places
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; surfaces: pallets and crates
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; pallets at places
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; crates at places
    (at crate0 depot0)
    (at crate1 depot1)
    (at crate2 depot1)

    ;; stacking: on relations (crate2 on crate1, crate1 on pallet1, crate0 on pallet0)
    (on crate0 pallet0)
    (on crate1 pallet1)
    (on crate2 crate1)

    ;; clear surfaces / crates (top free). crate1 is not clear because crate2 is on it.
    (clear crate0)
    (clear crate2)
    (clear pallet2)
    (clear pallet3)

    ;; trucks at places
    (truck_at truck0 depot2)
    (truck_at truck1 depot2)
    (truck_at truck2 depot1)

    ;; hoists at places
    (hoist_at hoist0 depot0)
    (hoist_at hoist1 depot1)
    (hoist_at hoist2 depot2)
    (hoist_at hoist3 distributor0)

    ;; hoist availability
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