(define (problem Depots32)
  (:domain depots_domain)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
  )
  (:init
    ;; Crate locations
    (at crate0 depot1)
    (at crate1 depot0)
    (at crate2 distributor0)

    ;; Hoist locations
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ;; Pallet locations
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; Truck locations
    (at truck0 depot2)
    (at truck1 distributor0)
    (at truck2 depot1)

    ;; Hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; Crate clarity (initially nothing on these crates)
    (clear crate0)
    (clear crate1)
    (clear crate2)

    ;; Pallet clarity (pallet2 is clear, others have crates)
    (clear pallet2)

    ;; Crate on surface relations
    (on crate0 pallet1)
    (on crate1 pallet0)
    (on crate2 pallet3)

    ;; Initial cost for action-costs
    (= (total-cost) 0)
  )
  (:goal (and
    (on crate1 crate2)
    (on crate2 pallet3)
  ))
  (:metric minimize (total-cost))
)