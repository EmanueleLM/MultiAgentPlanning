(define (problem warehousing-instance)
  (:domain multiagent-warehousing)
  (:objects
    depot0 depot1 distributor0 distributor1 - place
    truck0 truck1 truck2 truck3 - truck
    hoist0 hoist1 hoist2 hoist3 hoist4 hoist5 hoist6 hoist7 - hoist
    pallet0 pallet1 pallet2 pallet3 pallet4 pallet5 pallet6 pallet7 - pallet
    crate0 crate1 crate2 crate3 crate4 crate5 crate6 crate7 crate8 crate9 - crate
  )

  (:init
    ;; place typing
    (at-truck truck3 depot0)
    (at-truck truck0 depot1)
    (at-truck truck2 depot1)
    (at-truck truck1 distributor1)

    ;; hoists fixed at places
    (at-hoist hoist0 depot0)
    (at-hoist hoist4 depot0)
    (at-hoist hoist5 depot0)
    (at-hoist hoist6 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 distributor0)
    (at-hoist hoist3 distributor1)
    (at-hoist hoist7 distributor1)

    ;; pallets at places
    (at-pallet pallet0 depot0)
    (at-pallet pallet6 depot0)
    (at-pallet pallet1 depot1)
    (at-pallet pallet2 distributor0)
    (at-pallet pallet4 distributor0)
    (at-pallet pallet3 distributor1)
    (at-pallet pallet5 distributor1)
    (at-pallet pallet7 distributor1)

    ;; crates at places (on surfaces specified below)
    (at-crate crate3 depot0)
    (at-crate crate4 depot1)
    (at-crate crate2 distributor0)
    (at-crate crate9 distributor0)
    (at-crate crate0 distributor1)
    (at-crate crate1 distributor1)
    (at-crate crate5 distributor1)
    (at-crate crate6 distributor1)
    (at-crate crate7 distributor1)
    (at-crate crate8 distributor1)

    ;; on relations (stacking)
    (on crate5 crate0)
    (on crate7 crate5)
    (on crate8 crate6)
    (on crate4 pallet1)
    (on crate9 pallet2)
    (on crate0 pallet3)
    (on crate2 pallet4)
    (on crate1 pallet5)
    (on crate3 pallet6)
    (on crate6 pallet7)

    ;; available hoists
    (hoist-available hoist0)
    (hoist-available hoist1)
    (hoist-available hoist2)
    (hoist-available hoist3)
    (hoist-available hoist4)
    (hoist-available hoist5)
    (hoist-available hoist6)
    (hoist-available hoist7)

    ;; clear surfaces
    (clear crate1)
    (clear crate2)
    (clear crate3)
    (clear crate4)
    (clear crate7)
    (clear crate8)
    (clear crate9)
    (clear pallet0)
  )

  (:goal (and
    (on crate7 crate3)
    (on crate3 crate8)
    (on crate4 pallet0)
    (on crate6 pallet1)
    (on crate2 pallet4)
    (on crate8 pallet6)
    (on crate1 pallet7)
  ))
)