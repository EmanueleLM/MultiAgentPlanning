(define (problem logistics-instance-01)
  (:domain multiagent_logistics)

  (:objects
    depot0 depot1 depot2 - depot
    distributor0 distributor1 distributor2 - distributor

    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; explicit discrete time points (sequential execution enforced)
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 - time
  )

  (:init
    ;; complete directed connectivity among distinct places (every ordered pair)
    (road-connects depot0 depot1) (road-connects depot0 depot2) (road-connects depot0 distributor0) (road-connects depot0 distributor1) (road-connects depot0 distributor2)
    (road-connects depot1 depot0) (road-connects depot1 depot2) (road-connects depot1 distributor0) (road-connects depot1 distributor1) (road-connects depot1 distributor2)
    (road-connects depot2 depot0) (road-connects depot2 depot1) (road-connects depot2 distributor0) (road-connects depot2 distributor1) (road-connects depot2 distributor2)
    (road-connects distributor0 depot0) (road-connects distributor0 depot1) (road-connects distributor0 depot2) (road-connects distributor0 distributor1) (road-connects distributor0 distributor2)
    (road-connects distributor1 depot0) (road-connects distributor1 depot1) (road-connects distributor1 depot2) (road-connects distributor1 distributor0) (road-connects distributor1 distributor2)
    (road-connects distributor2 depot0) (road-connects distributor2 depot1) (road-connects distributor2 depot2) (road-connects distributor2 distributor0) (road-connects distributor2 distributor1)

    ;; surfaces (pallets) located at places
    (at-surface pallet0 depot0)
    (at-surface pallet1 depot1)
    (at-surface pallet2 depot2)
    (at-surface pallet3 distributor0)

    ;; crates located at the same place as their supporting surface (explicitly stated)
    (at-surface crate0 depot2)
    (at-surface crate1 depot2)
    (at-surface crate2 depot2)

    ;; stacking: bottom -> top (crate2 on crate1 on crate0 on pallet2)
    (on crate0 pallet2)
    (on crate1 crate0)
    (on crate2 crate1)

    ;; trucks locations
    (at-truck truck0 distributor0)
    (at-truck truck1 depot1)
    (at-truck truck2 distributor0)

    ;; hoists location and availability
    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)

    (free-hoist hoist0)
    (free-hoist hoist1)
    (free-hoist hoist2)
    (free-hoist hoist3)

    ;; clear surfaces/top-most items as given (crate2 is top of its stack)
    (clear crate2)
    (clear pallet0)
    (clear pallet1)
    (clear pallet3)

    ;; time successor chain (sequential single-action progression)
    (next t0 t1) (next t1 t2) (next t2 t3) (next t3 t4) (next t4 t5)
    (next t5 t6) (next t6 t7) (next t7 t8) (next t8 t9) (next t9 t10)
    (next t10 t11) (next t11 t12)

    ;; initial current time
    (current t0)
  )

  (:goal
    (and
      (on crate1 crate2)
      (on crate2 pallet2)
    )
  )
)