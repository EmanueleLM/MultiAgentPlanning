(define (problem depots-problem)
  (:domain depots-domain)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    crate0 crate1 crate2 - crate
    pallet0 pallet1 pallet2 pallet3 - pallet
  )
  (:init
    ;; Trucks locations
    (at truck0 distributor0)
    (at truck1 depot1)
    (at truck2 distributor0)

    ;; Crates locations
    (at crate0 depot0)
    (at crate1 depot0)
    (at crate2 distributor0)

    ;; Pallets locations
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; Hoists locations (Implicit from 'at' predicates) and availability
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; Stacking and Clear surfaces
    (on crate0 pallet0)
    (on crate1 crate0)
    (on crate2 pallet3)

    (clear crate1)
    (clear crate2)
    (clear pallet1)
    (clear pallet2)

    ;; Implicit non-clear surfaces from "on" relations, ensuring consistency.
    ;; These are not explicitly stated in the problem but are a logical consequence.
    ;; The planner's negation-as-failure handles the (not (clear ?s)) for these.
    ;; (not (clear pallet0))
    ;; (not (clear crate0))
    ;; (not (clear pallet3))

    ;; Initial cost
    (= (total-cost) 0)
  )
  (:goal (and (on crate0 pallet2)
              (on crate1 crate0)
              (on crate2 pallet0)
         )
  )
  (:metric minimize (total-cost))
)