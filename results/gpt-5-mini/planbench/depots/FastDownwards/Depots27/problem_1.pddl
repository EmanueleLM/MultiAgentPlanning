(define (problem cargo_hoist_truck_problem)
  (:domain cargo_hoist_truck)

  (:objects
    driver0 - driver
    hoist0 hoist1 hoist2 hoist3 - hoist_op
    truck0 truck1 truck2 - truck
    crate0 crate1 crate2 - crate
    pallet0 pallet1 pallet2 pallet3 - pallet
    depot0 depot1 depot2 distributor0 - location
  )

  (:init
    (truck-at truck0 depot0)
    (truck-at truck1 depot0)
    (truck-at truck2 depot1)

    (hoistop-at hoist0 depot0)
    (hoistop-at hoist1 depot1)
    (hoistop-at hoist2 depot2)
    (hoistop-at hoist3 distributor0)

    (pallet-at pallet0 depot0)
    (pallet-at pallet1 depot1)
    (pallet-at pallet2 depot2)
    (pallet-at pallet3 distributor0)

    (crate-at crate0 depot0)
    (crate-at crate1 depot0)
    (crate-at crate2 depot1)

    (on-pallet crate0 pallet0)
    (on-crate crate1 crate0)
    (on-pallet crate2 pallet1)

    (hoistop-free hoist0)
    (hoistop-free hoist1)
    (hoistop-free hoist2)
    (hoistop-free hoist3)

    (driver-at driver0 depot0)
    (driver-free driver0)
  )

  (:goal (and
    (on-pallet crate0 pallet3)
    (on-pallet crate1 pallet0)
  ))