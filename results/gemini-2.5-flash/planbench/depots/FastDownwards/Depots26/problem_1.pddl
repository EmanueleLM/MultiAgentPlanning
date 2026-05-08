(define (problem depots26-problem)
  (:domain depots26)
  (:objects
    depot0 depot1 depot2 distributor0 - place
    crate0 crate1 crate2 - crate
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    truck0 truck1 truck2 - truck
  )
  (:init
    (= (total-cost) 0)

    ;; Truck locations
    (at truck0 depot0)
    (at truck1 depot1)
    (at truck2 depot0)

    ;; Hoist locations
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ;; Crate locations (initially on pallets)
    (at crate0 depot0)
    (at crate1 depot1)
    (at crate2 distributor0)

    ;; Pallet locations (static)
    (at-pallet pallet0 depot0)
    (at-pallet pallet1 depot1)
    (at-pallet pallet2 depot2)
    (at-pallet pallet3 distributor0)

    ;; Hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; Initial contents: crates on pallets
    (on crate0 pallet0)
    (on crate1 pallet1)
    (on crate2 pallet3)

    ;; Pallet clear status
    ;; pallet0, pallet1, pallet3 are not clear due to crates on them.
    ;; pallet2 is explicitly clear from the specification.
    (clear pallet2)

    ;; Truck empty status (all trucks start empty)
    (truck-empty truck0)
    (truck-empty truck1)
    (truck-empty truck2)
  )
  (:goal (and
    (on crate0 pallet2)
    (on crate1 pallet3)
    (on crate2 pallet1)
  ))
  (:metric minimize (total-cost))
)