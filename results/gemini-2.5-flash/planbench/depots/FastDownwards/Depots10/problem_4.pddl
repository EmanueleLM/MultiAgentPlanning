(define (problem depots-problem)
  (:domain depots-domain)
  (:objects
    depot0 depot1 depot2 distributor0 - place
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    crate0 crate1 crate2 - crate
    pallet0 pallet1 pallet2 pallet3 - pallet
  )
  (:init
    ;; Initial costs
    (= (total-cost) 0)

    ;; Truck locations
    (at truck0 depot2)
    (at truck1 distributor0)
    (at truck2 depot1)

    ;; Hoist locations and availability
    (at hoist0 depot0) (available hoist0)
    (at hoist1 depot1) (available hoist1)
    (at hoist2 depot2) (available hoist2)
    (at hoist3 distributor0) (available hoist3)

    ;; Pallet locations (static)
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; Crate initial locations (where they are on a surface)
    (at crate0 depot1)
    (at crate1 depot1)
    (at crate2 depot0)

    ;; Initial stacking
    (on crate0 pallet1)
    (on crate1 crate0)
    (on crate2 pallet0)

    ;; Initially clear surfaces
    (clear crate1)
    (clear crate2)
    (clear pallet2)
    (clear pallet3)
    ;; Implied non-clear surfaces:
    ;; pallet0 (crate2 on it)
    ;; pallet1 (crate0 on it)
    ;; crate0 (crate1 on it)

    ;; Connections (all places connected to each other)
    (connected depot0 depot1)
    (connected depot0 depot2)
    (connected depot0 distributor0)
    (connected depot1 depot0)
    (connected depot1 depot2)
    (connected depot1 distributor0)
    (connected depot2 depot0)
    (connected depot2 depot1)
    (connected depot2 distributor0)
    (connected distributor0 depot0)
    (connected distributor0 depot1)
    (connected distributor0 depot2)
  )
  (:goal (and
    (on crate0 pallet2)
    (on crate1 pallet0)
    (on crate2 pallet1)
  ))
  (:metric minimize (total-cost))