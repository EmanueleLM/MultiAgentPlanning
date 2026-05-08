(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades)

  (:objects
    ;; places (depots and distributor)
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
    ;; crates at places
    (at crate0 depot1)
    (at crate1 depot1)
    (at crate2 depot0)

    ;; hoists at places
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ;; pallets at places
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; trucks at places
    (at truck0 depot1)
    (at truck1 distributor0)
    (at truck2 depot1)

    ;; hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; clear facts (tops that have nothing on them)
    (clear crate1)
    (clear crate2)
    (clear pallet2)
    (clear pallet3)

    ;; stacking relationships (on)
    (on crate0 pallet1)
    (on crate1 crate0)
    (on crate2 pallet0)

    ;; different facts for places to encode inequality without using (=)
    (different depot0 depot1)
    (different depot0 depot2)
    (different depot0 distributor0)
    (different depot1 depot0)
    (different depot1 depot2)
    (different depot1 distributor0)
    (different depot2 depot0)
    (different depot2 depot1)
    (different depot2 distributor0)
    (different distributor0 depot0)
    (different distributor0 depot1)
    (different distributor0 depot2)
  )

  (:goal (and
    (on crate0 pallet3)
    (on crate1 pallet1)
    (on crate2 pallet0)
  ))
)