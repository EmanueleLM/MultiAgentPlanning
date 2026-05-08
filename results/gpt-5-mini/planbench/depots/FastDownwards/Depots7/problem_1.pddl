(define (problem depots-instance-7)
  (:domain depots)

  (:objects
    ;; places
    depot0 depot1 depot2 distributor0 - place

    ;; pallets
    pallet0 pallet1 pallet2 pallet3 - pallet

    ;; crates
    crate0 crate1 crate2 - crate

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; trucks
    truck0 truck1 truck2 - truck
  )

  (:init
    ;; pallet locations
    (pallet_at pallet0 depot0)
    (pallet_at pallet1 depot1)
    (pallet_at pallet2 depot2)
    (pallet_at pallet3 distributor0)

    ;; crate initial support relationships (and crate at corresponding place)
    (on_pallet crate0 pallet1)
    (crate_at crate0 depot1)

    (on_pallet crate1 pallet3)
    (crate_at crate1 distributor0)

    (on_pallet crate2 pallet0)
    (crate_at crate2 depot0)

    ;; clear predicates: crates have nothing on top initially
    (clear_crate crate0)
    (clear_crate crate1)
    (clear_crate crate2)

    ;; pallet2 is empty on top initially; others are occupied
    (clear_pallet pallet2)

    ;; hoist locations and availability
    (hoist_at hoist0 depot0)
    (hoist_at hoist1 depot1)
    (hoist_at hoist2 depot2)
    (hoist_at hoist3 distributor0)

    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    ;; truck initial locations
    (truck_at truck0 depot0)
    (truck_at truck1 distributor0)
    (truck_at truck2 depot1)
  )

  (:goal (and
    ;; goal: crate0 on pallet3, crate1 on crate2, crate2 on pallet1
    (on_pallet crate0 pallet3)
    (on_crate crate1 crate2)
    (on_pallet crate2 pallet1)
  ))
)