(define (problem logistics-instance-01)
  (:domain multiagent_logistics)

  (:objects
    ;; places
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    ;; pallets and crates
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    ;; trucks and hoists
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
  )

  (:init
    ;; topology: complete symmetric connectivity among distinct places (explicit directed pairs)
    (road-connects depot0 depot1)
    (road-connects depot1 depot0)
    (road-connects depot0 depot2)
    (road-connects depot2 depot0)
    (road-connects depot0 distributor0)
    (road-connects distributor0 depot0)
    (road-connects depot1 depot2)
    (road-connects depot2 depot1)
    (road-connects depot1 distributor0)
    (road-connects distributor0 depot1)
    (road-connects depot2 distributor0)
    (road-connects distributor0 depot2)

    ;; location of pallets (surfaces at places)
    (at-surface pallet0 depot0)
    (at-surface pallet1 depot1)
    (at-surface pallet2 depot2)
    (at-surface pallet3 distributor0)

    ;; location of crates used as surfaces (must declare at-surface for crates that serve as bases)
    ;; crate0 supports crate1, crate1 supports crate2; both are at depot2
    (at-surface crate0 depot2)
    (at-surface crate1 depot2)
    ;; crate2 is top-of-stack; it is not declared as an at-surface base here (not used as a base)

    ;; stacking: on facts (crate directly on surface)
    (on crate0 pallet2)   ;; crate0 is directly on pallet2 at depot2
    (on crate1 crate0)    ;; crate1 is on crate0
    (on crate2 crate1)    ;; crate2 is on crate1

    ;; trucks location
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

    ;; clear facts: explicitly asserted for surfaces with nothing on top
    ;; From the public information: crate2, pallet0, pallet1, pallet3 are clear.
    (clear crate2)
    (clear pallet0)
    (clear pallet1)
    (clear pallet3)

    ;; Note: surfaces pallet2, crate0, crate1 are not declared clear here because they have crates on them.
    ;; No crate is initially in any truck, and no hoist is initially holding any crate (represented by absence of (in-truck ...) and (holding ...) and presence of free-hoist facts).
  )

  (:goal
    (and
      ;; Goal: crate1 on crate2, and crate2 on pallet2 (explicit ordering)
      (on crate1 crate2)
      (on crate2 pallet2)
    )
  )
)