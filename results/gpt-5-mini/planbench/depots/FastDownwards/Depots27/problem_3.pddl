(define (problem depots27_problem)
  (:domain depots_hoist_truck)

  (:objects
    depot0 depot1 depot2 distributor0 - location
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
  )

  (:init
    ;; trucks locations
    (truck_at truck0 depot0)
    (truck_at truck1 depot0)
    (truck_at truck2 depot1)

    ;; hoists locations and availability
    (hoist_at hoist0 depot0)
    (hoist_at hoist1 depot1)
    (hoist_at hoist2 depot2)
    (hoist_at hoist3 distributor0)
    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    ;; pallets locations
    (pallet_at pallet0 depot0)
    (pallet_at pallet1 depot1)
    (pallet_at pallet2 depot2)
    (pallet_at pallet3 distributor0)

    ;; crates location (crates are 'at' the place where their supporting surface is)
    (crate_at crate0 depot0)
    (crate_at crate1 depot0)
    (crate_at crate2 depot1)

    ;; stacking relations (initial supports)
    (on_pallet crate0 pallet0)
    (on_crate crate1 crate0)
    (on_pallet crate2 pallet1)

    ;; clear predicates (top elements and empty pallets)
    (clear_crate crate1)
    (clear_crate crate2)
    (clear_pallet pallet2)
    (clear_pallet pallet3)
  )

  (:goal (and
    (on_pallet crate0 pallet3)
    (on_pallet crate1 pallet0)
  ))
)