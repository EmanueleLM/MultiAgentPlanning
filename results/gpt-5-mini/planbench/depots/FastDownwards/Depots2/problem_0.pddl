(define (problem deposit-task)
  (:domain depot-operations)
  (:objects
    ; agents
    driver1 - driver
    depot1 - depot-manager
    auditor1 - auditor
    hop1 - hoistop

    ; equipment
    truck1 - truck
    hoist1 - hoist

    ; crates and pallets
    crate1 crate2 - crate
    pallet0 pallet3 - pallet

    ; locations
    locA locB locP0 locP3 - location
  )

  (:init
    ; initial agent and equipment locations
    (at-driver driver1 locA)
    (at-depotmanager depot1 locP0)
    (at-auditor auditor1 locP0)

    (at-truck truck1 locA)
    (at-hoist hoist1 locP0)

    ; crate initial positions
    (at-crate crate1 locA)
    (at-crate crate2 locB)

    ; pallet positions (pallet objects located at their pallet location)
    (pallet-at pallet0 locP0)
    (pallet-at pallet3 locP3)

    ; no pallets reserved or occupied initially
    ; no crates audited initially
  )

  (:goal (and
    (on-pallet crate1 pallet0)
    (on-pallet crate2 pallet3)
  ))
)