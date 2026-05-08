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
    (= (total-cost) 0)

    ;; Truck locations (3 facts)
    (at truck0 depot2)
    (at truck1 distributor0)
    (at truck2 depot1)

    ;; Hoist locations and availability (8 facts)
    (at hoist0 depot0) (available hoist0)
    (at hoist1 depot1) (available hoist1)
    (at hoist2 depot2) (available hoist2)
    (at hoist3 distributor0) (available hoist3)

    ;; Pallet locations (static) (4 facts)
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; Crate initial locations (3 facts)
    ; These are explicitly needed as `at` for crates is a dynamic predicate.
    (at crate0 depot1)
    (at crate1 depot1)
    (at crate2 depot0)

    ;; Initial stacking (3 facts)
    (on crate0 pallet1)
    (on crate1 crate0)
    (on crate2 pallet0)

    ;; Initially clear surfaces (4 facts)
    ; Surfaces are clear if nothing is on them. Implied non-clear surfaces (pallet0, pallet1, crate0) are omitted.
    (clear crate1)
    (clear crate2)
    (clear pallet2)
    (clear pallet3)

    ;; Direct road connections (6 facts)
    ; These define the unique pairs for road connections. The 'connected' predicate is derived from these.
    (direct-road depot0 depot1)
    (direct-road depot0 depot2)
    (direct-road depot0 distributor0)
    (direct-road depot1 depot2)
    (direct-road depot1 distributor0)
    (direct-road depot2 distributor0)
  )
  (:goal (and
    (on crate0 pallet2)
    (on crate1 pallet0)
    (on crate2 pallet1)
  ))
  (:metric minimize (total-cost))
)