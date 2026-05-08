(define (problem depots36-instance)
  (:domain depots36)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    crate0 crate1 crate2 - crate
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    truck0 truck1 truck2 - truck
  )

  (:init
    (at crate0 depot0)
    (at crate1 depot2)
    (at crate2 distributor0)
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)
    (at truck0 depot1)
    (at truck1 depot2)
    (at truck2 depot0)
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)
    (clear crate0)
    (clear crate1)
    (clear crate2)
    (clear pallet1) ; pallet1 is clear
    (clear pallet0) ; inferred from crate0 on pallet0, crate0 clear, pallet0 is where crate0 is. No explicit "clear pallet0"
    (clear pallet2) ; inferred from crate1 on pallet2
    (clear pallet3) ; inferred from crate2 on pallet3
    (on crate0 pallet0)
    (on crate1 pallet2)
    (on crate2 pallet3)

    ; Road connections - all distinct pairs of places are connected
    (road depot0 depot1)
    (road depot0 depot2)
    (road depot0 distributor0)
    (road depot1 depot0)
    (road depot1 depot2)
    (road depot1 distributor0)
    (road depot2 depot0)
    (road depot2 depot1)
    (road depot2 distributor0)
    (road distributor0 depot0)
    (road distributor0 depot1)
    (road distributor0 depot2)
  )

  (:goal (and
    (on crate0 pallet3)
    (on crate1 pallet2)
    (on crate2 pallet1)
  ))