(define (problem logistics-instance)
  (:domain logistics)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    crate0 crate1 crate2 - crate
    pallet0 pallet1 pallet2 pallet3 - pallet
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck)
  (:init
    (at crate0 depot0) (at crate1 depot0) (at crate2 depot1)
    (at hoist0 depot0) (at hoist1 depot1) (at hoist2 depot2) (at hoist3 distributor0)
    (at pallet0 depot0) (at pallet1 depot1) (at pallet2 depot2) (at pallet3 distributor0)
    (at truck0 depot2) (at truck1 depot1) (at truck2 depot2)
    (hoist_available hoist0) (hoist_available hoist1) (hoist_available hoist2) (hoist_available hoist3)
    (clear crate1) (clear crate2) (clear pallet2) (clear pallet3)
    (on crate0 pallet0) (on crate1 crate0) (on crate2 pallet1))
  (:goal (and
    (on crate0 pallet1)
    (on crate1 crate0)
    (on crate2 pallet0))))