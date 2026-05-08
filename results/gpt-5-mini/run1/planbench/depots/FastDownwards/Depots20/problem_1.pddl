(define (problem depots20-problem)
  (:domain depots20)
  (:objects
    ;; crates
    crate0 crate1 crate2 - crate

    ;; pallets
    pallet0 pallet1 pallet2 pallet3 - pallet

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; places (depots and distributor)
    depot0 depot1 depot2 distributor0 - place
  )

  (:init
    ;; initial crate positions and stacking (crate at place and on pallet)
    (crate_at crate0 depot1)
    (on crate0 pallet1)

    (crate_at crate1 depot2)
    (on crate1 pallet2)

    (crate_at crate2 depot0)
    (on crate2 pallet0)

    ;; pallets locations
    (pallet_at pallet0 depot0)
    (pallet_at pallet1 depot1)
    (pallet_at pallet2 depot2)
    (pallet_at pallet3 distributor0)

    ;; clearances: crates have nothing on top; only pallet3 is empty initially
    (clear_crate crate0)
    (clear_crate crate1)
    (clear_crate crate2)
    (clear_pallet pallet3)

    ;; hoists at places and available
    (hoist_at hoist0 depot0)
    (hoist_at hoist1 depot1)
    (hoist_at hoist2 depot2)
    (hoist_at hoist3 distributor0)

    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    ;; trucks at places
    (truck_at truck0 depot1)
    (truck_at truck1 depot2)
    (truck_at truck2 distributor0)
  )

  (:goal
    (and
      (on crate0 pallet2)
      (on crate1 pallet1)
      (on crate2 pallet0)
    )
  )
)