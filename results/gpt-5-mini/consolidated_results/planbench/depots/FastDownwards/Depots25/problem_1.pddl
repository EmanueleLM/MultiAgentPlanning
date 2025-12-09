(define (problem logistics-instance-01)
  (:domain multiagent_logistics)

  (:objects
    depot0 depot1 depot2 - depot
    distributor0 distributor1 distributor2 - distributor

    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
  )

  (:init
    ;; complete directed road connectivity among distinct places
    (road-connects depot0 depot1)
    (road-connects depot1 depot0)
    (road-connects depot0 depot2)
    (road-connects depot2 depot0)
    (road-connects depot0 distributor0)
    (road-connects distributor0 depot0)
    (road-connects depot0 distributor1)
    (road-connects distributor1 depot0)
    (road-connects depot0 distributor2)
    (road-connects distributor2 depot0)

    (road-connects depot1 depot2)
    (road-connects depot2 depot1)
    (road-connects depot1 distributor0)
    (road-connects distributor0 depot1)
    (road-connects depot1 distributor1)
    (road-connects distributor1 depot1)
    (road-connects depot1 distributor2)
    (road-connects distributor2 depot1)

    (road-connects depot2 distributor0)
    (road-connects distributor0 depot2)
    (road-connects depot2 distributor1)
    (road-connects distributor1 depot2)
    (road-connects depot2 distributor2)
    (road-connects distributor2 depot2)

    ;; surfaces located at places
    (at-surface pallet0 depot0)
    (at-surface pallet1 depot1)
    (at-surface pallet2 depot2)
    (at-surface pallet3 distributor0)

    (at-surface crate0 depot2)
    (at-surface crate1 depot2)
    (at-surface crate2 depot2)

    ;; stacking
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

    ;; clear surfaces as given
    (clear crate2)
    (clear pallet0)
    (clear pallet1)
    (clear pallet3)
  )

  (:goal
    (and
      (on crate1 crate2)
      (on crate2 pallet2)
    )
  )
)