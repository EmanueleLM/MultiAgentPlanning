(define (problem multiagent-hoist-truck-problem)
  (:domain multiagent-hoist-truck)
  (:objects
    depot0 depot1 distributor0 distributor1 - place

    truck0 truck1 truck2 truck3 - truck

    hoist0 hoist1 hoist2 hoist3 hoist4 hoist5 hoist6 hoist7 - hoist

    pallet0 pallet1 pallet2 pallet3 pallet4 pallet5 pallet6 pallet7 - pallet

    crate0 crate1 crate2 crate3 crate4 crate5 crate6 crate7 crate8 crate9 crate10 crate11 crate12 crate13 crate14 - crate
  )

  (:init
    ;; trucks at places (from initial locations)
    (truck-at truck2 depot0)
    (truck-at truck0 depot1)
    (truck-at truck3 depot1)
    (truck-at truck1 distributor0)

    ;; hoists fixed at their places
    (hoist-at hoist0 depot0)
    (hoist-at hoist5 depot0)
    (hoist-at hoist1 depot1)
    (hoist-at hoist6 distributor0)
    (hoist-at hoist2 distributor0)
    (hoist-at hoist4 distributor0)
    (hoist-at hoist3 distributor1)
    (hoist-at hoist7 distributor1)

    ;; surfaces (pallets and crates) located at their places
    ;; depot0
    (surface-at pallet0 depot0)
    (surface-at pallet4 depot0)
    (surface-at crate0 depot0)
    (surface-at crate4 depot0)
    (surface-at crate7 depot0)
    (surface-at crate13 depot0)
    ;; depot1
    (surface-at pallet1 depot1)
    (surface-at pallet7 depot1)
    (surface-at crate1 depot1)
    (surface-at crate5 depot1)
    (surface-at crate11 depot1)
    ;; distributor0
    (surface-at pallet2 distributor0)
    (surface-at pallet5 distributor0)
    (surface-at crate2 distributor0)
    (surface-at crate6 distributor0)
    (surface-at crate8 distributor0)
    (surface-at crate12 distributor0)
    (surface-at crate14 distributor0)
    ;; distributor1
    (surface-at pallet3 distributor1)
    (surface-at pallet6 distributor1)
    (surface-at crate3 distributor1)
    (surface-at crate9 distributor1)
    (surface-at crate10 distributor1)

    ;; initial stacking relationships (on)
    (on crate4 crate0)
    (on crate11 crate1)
    (on crate12 crate2)
    (on crate7 crate4)
    (on crate8 crate6)
    (on crate13 crate7)
    (on crate10 crate9)
    (on crate14 crate12)
    (on crate0 pallet0)
    (on crate1 pallet1)
    (on crate2 pallet2)
    (on crate9 pallet3)
    (on crate6 pallet5)
    (on crate3 pallet6)
    (on crate5 pallet7)

    ;; hoists available initially
    (hoist-available hoist0)
    (hoist-available hoist1)
    (hoist-available hoist2)
    (hoist-available hoist3)
    (hoist-available hoist4)
    (hoist-available hoist5)
    (hoist-available hoist6)
    (hoist-available hoist7)

    ;; clear surfaces as provided
    (clear crate3)
    (clear crate5)
    (clear crate8)
    (clear crate10)
    (clear crate11)
    (clear crate13)
    (clear crate14)
    (clear pallet4)

    ;; no crates inside trucks initially (explicitly nothing to state)
  )

  (:goal (and
    ;; goal on-relations as specified
    (on crate9 crate1)
    (on crate8 crate4)
    (on crate12 crate5)
    (on crate0 crate10)
    (on crate2 crate12)
    (on crate14 pallet0)
    (on crate10 pallet1)
    (on crate5 pallet2)
    (on crate13 pallet3)
    (on crate4 pallet4)
    (on crate11 pallet5)
    (on crate1 pallet6)
    (on crate6 pallet7)
  ))
)