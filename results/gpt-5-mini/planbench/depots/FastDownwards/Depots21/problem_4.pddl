(define (problem move_crates_problem)
  (:domain multiagent_hoist_truck)
  (:objects
    ;; places
    depot0 depot1 depot2 distributor0 - place

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; pallets (surfaces)
    pallet0 pallet1 pallet2 pallet3 - pallet

    ;; crates (also surfaces)
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; truck initial locations
    (truck_at truck0 depot0)
    (truck_at truck1 depot0)
    (truck_at truck2 depot2)

    ;; hoist initial locations and availability
    (hoist_at hoist0 depot0)
    (hoist_available hoist0)
    (hoist_at hoist1 depot1)
    (hoist_available hoist1)
    (hoist_at hoist2 depot2)
    (hoist_available hoist2)
    (hoist_at hoist3 distributor0)
    (hoist_available hoist3)

    ;; pallet locations (surfaces)
    (surface_at pallet0 depot0)
    (surface_at pallet1 depot1)
    (surface_at pallet2 depot2)
    (surface_at pallet3 distributor0)

    ;; crate positions and stacking (crate_at gives place; on gives surface)
    (crate_at crate0 distributor0)
    (on crate0 pallet3)
    (surface_at crate0 distributor0)

    (crate_at crate2 distributor0)
    (on crate2 crate0)
    (surface_at crate2 distributor0)

    (crate_at crate1 depot1)
    (on crate1 pallet1)
    (surface_at crate1 depot1)

    ;; clear surfaces as given: pallet0, pallet2, crate1, crate2 are clear
    (clear pallet0)
    (clear pallet2)
    (clear crate1)
    (clear crate2)
  )

  (:goal (and
    (on crate0 pallet2)
    (on crate1 pallet0)
    (on crate2 crate1)
  ))
)