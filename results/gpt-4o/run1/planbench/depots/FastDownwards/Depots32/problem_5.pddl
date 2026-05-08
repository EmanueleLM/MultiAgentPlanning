(define (problem logistics-problem)

  (:domain logistics)

  (:objects
    depot0 depot1 depot2 distributor0 - place
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
  )

  (:init
    (at crate0 depot1)
    (at crate1 depot0)
    (at crate2 distributor0)
    (on crate0 pallet1)
    (on crate1 pallet0)
    (on crate2 pallet3)
    (hoist-loc hoist0 depot0)
    (hoist-loc hoist1 depot1)
    (hoist-loc hoist2 depot2)
    (hoist-loc hoist3 distributor0)
    (truck-loc truck0 depot2)
    (truck-loc truck1 distributor0)
    (truck-loc truck2 depot1)
    (hoist-available hoist0)
    (hoist-available hoist1)
    (hoist-available hoist2)
    (hoist-available hoist3)
    (clear crate0)
    (clear crate1)
    (clear crate2)
    (clear pallet2)
  )

  (:goal (and
    (on crate1 crate2)
    (on crate2 pallet3)
  ))