(define (problem depots12)
  (:domain depots-instance)

  (:objects
    ;; places
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; pallets and crates
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; trucks locations
    (at truck0 depot1)
    (at truck1 depot0)
    (at truck2 depot1)

    ;; hoists locations
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ;; pallets locations
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; crates locations (redundant with on facts but consistent)
    (at crate0 depot2)
    (at crate1 distributor0)
    (at crate2 distributor0)

    ;; stacking (which implies places above)
    (on crate0 pallet2)
    (on crate1 pallet3)
    (on crate2 crate1)

    ;; clear surfaces / crates (those that have nothing on them)
    (clear crate0)
    (clear crate2)
    (clear pallet0)
    (clear pallet1)

    ;; hoist availability
    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)
  )

  (:goal (and
    (on crate0 crate1)
    (on crate1 pallet3)
    (on crate2 pallet1)
  ))
)