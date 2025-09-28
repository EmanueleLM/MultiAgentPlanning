(define (problem orchestrator-instance)
  (:domain hoist-truck-multiagent)

  (:objects
    depot0 depot1 depot2 depot3 distributor0 distributor1 distributor2 distributor3
    truck0 truck1 truck2 truck3
    hoist0 hoist1 hoist2 hoist3 hoist4 hoist5 hoist6 hoist7
    pallet0 pallet1 pallet2 pallet3 pallet4 pallet5 pallet6 pallet7 pallet8 pallet9
    crate0 crate1 crate2 crate3 crate4 crate5 crate6 crate7
  )

  (:init
    ;; locations (at)
    (at truck0 depot0)
    (at truck1 distributor0)
    (at truck2 depot2)
    (at truck3 distributor3)

    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 depot3)
    (at hoist4 distributor0)
    (at hoist5 distributor1)
    (at hoist6 distributor2)
    (at hoist7 distributor3)

    (at crate0 depot3)
    (at crate1 depot1)
    (at crate2 distributor0)
    (at crate3 distributor1)
    (at crate4 distributor2)
    (at crate5 distributor1)
    (at crate6 depot0)
    (at crate7 depot3)

    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 depot3)
    (at pallet4 distributor0)
    (at pallet5 distributor1)
    (at pallet6 distributor2)
    (at pallet7 distributor3)
    (at pallet8 distributor2)
    (at pallet9 depot3)

    ;; stacking (on)
    (on crate6 pallet0)
    (on crate1 pallet1)
    (on crate2 pallet4)
    (on crate3 pallet5)
    (on crate4 pallet8)
    (on crate7 pallet3)
    (on crate0 pallet9)
    (on crate5 crate3)

    ;; clear surfaces
    (clear crate0)
    (clear crate1)
    (clear crate2)
    (clear crate4)
    (clear crate5)
    (clear crate6)
    (clear crate7)
    (clear pallet2)
    (clear pallet6)
    (clear pallet7)

    ;; hoist states
    (hoist-idle hoist0)
    (hoist-idle hoist1)
    (hoist-idle hoist2)
    (hoist-idle hoist3)
    (hoist-idle hoist4)
    (hoist-idle hoist5)
    (hoist-idle hoist6)
    (hoist-idle hoist7)
  )

  (:goal
    (and
      ;; desired on relations
      (on crate3 crate1)
      (on crate7 crate4)
      (on crate5 crate7)
      (on crate6 pallet4)
      (on crate4 pallet5)
      (on crate0 pallet6)
      (on crate1 pallet8)
    )
  )
)