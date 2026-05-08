(define (problem move_crates_problem)
  (:domain multiagent_hoist_truck)
  (:objects
    ;; places
    depot0 depot1 depot2 - depot
    distributor0 - distributor

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
    (at pallet0 depot0)
    (clear pallet0)
    (at pallet1 depot1)
    ;; pallet1 initially holds crate1, so not clear (no clear predicate)
    (at pallet2 depot2)
    (clear pallet2)
    (at pallet3 distributor0)
    ;; pallet3 not clear because crate0 is on it

    ;; crate initial positions and stacking
    (at crate0 distributor0)
    (on crate0 pallet3)
    ;; crate0 not clear (crate2 on it)

    (at crate2 distributor0)
    (on crate2 crate0)
    (clear crate2)

    (at crate1 depot1)
    (on crate1 pallet1)
    (clear crate1)

    ;; No crates in trucks or held by hoists initially
  )
  (:goal (and
    ;; final required placements:
    ;; crate0 on pallet2 at depot2
    (on crate0 pallet2)
    (at crate0 depot2)

    ;; crate1 on pallet0 at depot0
    (on crate1 pallet0)
    (at crate1 depot0)

    ;; crate2 on crate1 at depot0
    (on crate2 crate1)
    (at crate2 depot0)
  ))
)