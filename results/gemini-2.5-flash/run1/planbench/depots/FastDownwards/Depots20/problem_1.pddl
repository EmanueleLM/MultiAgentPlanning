(define (problem depots20_instance)
  (:domain depots20)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    crate0 crate1 crate2 - crate
    pallet0 pallet1 pallet2 pallet3 - pallet
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
  )
  (:init
    ;; Connectivity: All places are directly connected to each other
    (connected depot0 depot1) (connected depot0 depot2) (connected depot0 distributor0)
    (connected depot1 depot0) (connected depot1 depot2) (connected depot1 distributor0)
    (connected depot2 depot0) (connected depot2 depot1) (connected depot2 distributor0)
    (connected distributor0 depot0) (connected distributor0 depot1) (connected distributor0 depot2)

    ;; Truck Locations
    (at truck0 depot1)
    (at truck1 depot2)
    (at truck2 distributor0)

    ;; Hoist Locations and Availability
    (at hoist0 depot0) (available hoist0)
    (at hoist1 depot1) (available hoist1)
    (at hoist2 depot2) (available hoist2)
    (at hoist3 distributor0) (available hoist3)

    ;; Pallet Locations
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; Crate Locations, Clear status, and On-relations
    (at crate0 depot1) (clear crate0) (on crate0 pallet1)
    (at crate1 depot2) (clear crate1) (on crate1 pallet2)
    (at crate2 depot0) (clear crate2) (on crate2 pallet0)

    ;; Initial clear status for pallets (derived from on-relations and explicit statement)
    (not (clear pallet0)) ; crate2 is on pallet0
    (not (clear pallet1)) ; crate0 is on pallet1
    (not (clear pallet2)) ; crate1 is on pallet2
    (clear pallet3)       ; pallet3 is explicitly stated as clear
  )
  (:goal (and
    (on crate0 pallet2)
    (on crate1 pallet1)
    (on crate2 pallet0)
  ))
)