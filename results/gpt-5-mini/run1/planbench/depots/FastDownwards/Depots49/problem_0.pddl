(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades)

  (:objects
    ;; places
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; surfaces: pallets and crates (crates are surfaces too)
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; pallets at places
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; crates at places (inferred also by on relationships but listed explicitly)
    (at crate0 depot0)
    (at crate1 depot1)
    (at crate2 depot1)

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

    ;; clear surfaces / crates (top free)
    (clear crate0)
    (clear crate2)
    (clear pallet2)
    (clear pallet3)

    ;; stacking: on relations
    (on crate0 pallet0)
    (on crate1 pallet1)
    (on crate2 crate1)

    ;; No crates in trucks initially, no lifting facts initially.
  )

  (:goal (and
    (on crate0 pallet2)
    (on crate2 pallet0)
  ))
)