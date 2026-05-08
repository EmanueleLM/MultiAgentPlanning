(define (problem depots-problem)
  (:domain depots-domain)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
  )
  (:init
    ;; Truck locations
    (at truck0 depot0)
    (at truck1 depot0)
    (at truck2 depot1)

    ;; Hoist locations
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ;; Crate locations (initial, when on a surface)
    (at crate0 depot0)
    (at crate1 depot0)
    (at crate2 depot1)

    ;; Pallet locations (fixed)
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; Connections (all places are connected as per spec)
    (connected depot0 depot1)
    (connected depot1 depot0)
    (connected depot0 depot2)
    (connected depot2 depot0)
    (connected depot0 distributor0)
    (connected distributor0 depot0)
    (connected depot1 depot2)
    (connected depot2 depot1)
    (connected depot1 distributor0)
    (connected distributor0 depot1)
    (connected depot2 distributor0)
    (connected distributor0 depot2)

    ;; Initial Stacking
    ;; Crate 1 is on Crate 0, Crate 0 is on Pallet 0.
    (on crate1 crate0)
    (on crate0 pallet0)
    ;; Crate 2 is on Pallet 1.
    (on crate2 pallet1)

    ;; Initial Clear states
    ;; (clear ?s) means nothing is on surface ?s
    (clear crate1)
    (clear crate2)
    (clear pallet2)
    (clear pallet3)

    ;; Hoist availability
    (hoist-available hoist0)
    (hoist-available hoist1)
    (hoist-available hoist2)
    (hoist-available hoist3)

    ;; Initialize total-cost for metric
    (= (total-cost) 0)
  )
  (:goal (and
    (on crate0 pallet3)
    (on crate1 pallet0)
  ))
  (:metric minimize (total-cost))
)