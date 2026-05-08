(define (problem depots-problem)
  (:domain depots-domain)
  (:objects
    depot0 depot1 depot2 distributor0 - place
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
  )
  (:init
    ;; Truck locations
    (at-truck truck0 depot0)
    (at-truck truck1 depot0)
    (at-truck truck2 depot1)

    ;; Hoist locations
    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)

    ;; Crate locations (when not held or in truck)
    (at-crate crate0 depot0)
    (at-crate crate1 depot0)
    (at-crate crate2 depot1)

    ;; Connections (all places are connected)
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

    ;; Initial Stacking and Clear states
    ;; Crate 1 is on Crate 0, Crate 0 is on Pallet 0.
    (on crate1 crate0)
    (on crate0 pallet0)
    ;; Crate 2 is on Pallet 1.
    (on crate2 pallet1)

    ;; Explicitly clear objects as per specification
    (clear crate1)
    (clear crate2)
    (clear pallet2)
    (clear pallet3)

    ;; Initialize total-cost for metric
    (= (total-cost) 0)
  )
  (:goal (and
    (on crate0 pallet3)
    (on crate1 pallet0)
  ))
  (:metric minimize (total-cost))
)