(define (problem depots33)
  (:domain jack_of_all_trades)

  (:objects
    ;; places
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; pallets (surfaces)
    pallet0 pallet1 pallet2 pallet3 - pallet

    ;; crates (also surfaces)
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; locations of crates (consistent with on facts below)
    (at crate0 distributor0)
    (at crate1 distributor0)
    (at crate2 depot2)

    ;; locations of hoists
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ;; locations of pallets
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; locations of trucks
    (at truck0 distributor0)
    (at truck1 depot2)
    (at truck2 depot0)

    ;; hoist availability
    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    ;; clear facts (surfaces with nothing on them)
    (clear crate1)
    (clear crate2)
    (clear pallet0)
    (clear pallet1)

    ;; stacking relations (on)
    (on crate0 pallet3)
    (on crate1 crate0)
    (on crate2 pallet2)
  )

  (:goal
    (and
      ;; required stacking goals
      (on crate0 crate2)
      (on crate1 pallet3)
      (on crate2 pallet1)
    )
  )
)