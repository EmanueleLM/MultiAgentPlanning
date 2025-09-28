(define (problem multiagent_hoist_truck_problem)
  (:domain multiagent_hoist_truck_domain)

  (:objects
    depot0 depot1 depot2 distributor0 distributor1 distributor2 - place
    truck0 truck1 - truck
    hoist0 hoist1 hoist2 hoist3 hoist4 hoist5 - hoist
    pallet0 pallet1 pallet2 pallet3 pallet4 pallet5 - pallet
    crate0 crate1 crate2 crate3 crate4 crate5 crate6 crate7 crate8 crate9 crate10 crate11 crate12 crate13 crate14 - crate
  )

  (:init
    (hoist-at hoist0 depot0)
    (at-surface pallet0 depot0)

    (hoist-at hoist1 depot1)
    (at-surface pallet1 depot1)
    (at-surface crate1 depot1)
    (at-surface crate5 depot1)
    (at-surface crate10 depot1)
    (at-surface crate12 depot1)
    (at truck1 depot1)

    (hoist-at hoist2 depot2)
    (at-surface pallet2 depot2)

    (hoist-at hoist3 distributor0)
    (at-surface pallet3 distributor0)
    (at-surface crate2 distributor0)
    (at-surface crate4 distributor0)

    (hoist-at hoist4 distributor1)
    (at-surface pallet4 distributor1)
    (at-surface crate11 distributor1)
    (at-surface crate14 distributor1)
    (at truck0 distributor1)

    (hoist-at hoist5 distributor2)
    (at-surface pallet5 distributor2)
    (at-surface crate0 distributor2)
    (at-surface crate3 distributor2)
    (at-surface crate6 distributor2)
    (at-surface crate7 distributor2)
    (at-surface crate8 distributor2)
    (at-surface crate9 distributor2)
    (at-surface crate13 distributor2)

    (on crate3 crate0)
    (on crate5 crate1)
    (on crate4 crate2)
    (on crate6 crate3)
    (on crate10 crate5)
    (on crate7 crate6)
    (on crate8 crate7)
    (on crate9 crate8)
    (on crate13 crate9)
    (on crate12 crate10)
    (on crate14 crate11)
    (on crate1 pallet1)
    (on crate2 pallet3)
    (on crate11 pallet4)
    (on crate0 pallet5)

    (clear crate4) (clear crate12) (clear crate13) (clear crate14) (clear pallet0) (clear pallet2)

    (hoist-available hoist0) (hoist-available hoist1) (hoist-available hoist2)
    (hoist-available hoist3) (hoist-available hoist4) (hoist-available hoist5)
  )

  (:goal (and
    (on crate2 crate0)
    (on crate6 crate2)
    (on crate3 crate9)
    (on crate14 crate10)
    (on crate1 crate12)
    (on crate10 crate13)
    (on crate5 pallet0)
    (on crate13 pallet1)
    (on crate9 pallet2)
    (on crate0 pallet4)
    (on crate12 pallet5)
  ))

  (:metric minimize (total-time))
)