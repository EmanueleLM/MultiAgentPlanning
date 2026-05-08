(define (problem move_crates_problem)
  (:domain multiagent_hoist_truck)
  (:objects
    ;; places
    depot0 depot1 depot2 distributor0 - place

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; pallets
    pallet0 pallet1 pallet2 pallet3 - pallet

    ;; crates
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

    ;; pallet locations and clear status
    (pallet_at pallet0 depot0)
    (clear_pallet pallet0)
    (pallet_at pallet1 depot1)
    ;; pallet1 holds crate1 -> not clear
    (pallet_at pallet2 depot2)
    (clear_pallet pallet2)
    (pallet_at pallet3 distributor0)
    ;; pallet3 holds crate0 -> not clear

    ;; crate initial positions and stacking (crate_at implied by being on something)
    (crate_at crate0 distributor0)
    (on_pallet crate0 pallet3)
    ;; crate0 not clear because crate2 is on it

    (crate_at crate2 distributor0)
    (on_crate crate2 crate0)
    (clear_crate crate2)

    (crate_at crate1 depot1)
    (on_pallet crate1 pallet1)
    (clear_crate crate1)
  )
  (:goal (and
    (on_pallet crate0 pallet2)
    (on_pallet crate1 pallet0)
    (on_crate crate2 crate1)
  ))
)