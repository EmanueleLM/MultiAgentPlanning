(define (problem crate-transport-rearrangement)
  (:domain multiagent-hoist-truck)
  (:objects
    depot0 depot1 depot2 distributor0 distributor1 distributor2 - place

    truck0 truck1 - truck
    hoist0 hoist1 hoist2 hoist3 hoist4 hoist5 - hoist

    pallet0 pallet1 pallet2 pallet3 pallet4 pallet5 - pallet

    crate0 crate1 crate2 crate3 crate4 crate5 crate6 crate7 crate8 crate9 crate10 crate11 crate12 crate13 crate14 - crate

    ;; entity type members (for generic at-entity/on usage)
    ;; note: trucks/hoists/pallets/crates are implicitly entities in the domain listing
  )

  (:init
    ;; Trucks locations (use truck-at and generic at-entity for entities)
    (truck-at truck0 depot2)
    (at-entity truck0 depot2)
    (truck-at truck1 distributor0)
    (at-entity truck1 distributor0)

    ;; Hoists at places
    (hoist-at hoist0 depot0)
    (at-entity hoist0 depot0)
    (hoist-at hoist1 depot1)
    (at-entity hoist1 depot1)
    (hoist-at hoist2 depot2)
    (at-entity hoist2 depot2)
    (hoist-at hoist3 distributor0)
    (at-entity hoist3 distributor0)
    (hoist-at hoist4 distributor1)
    (at-entity hoist4 distributor1)
    (hoist-at hoist5 distributor2)
    (at-entity hoist5 distributor2)

    ;; Pallets at places
    (at-entity pallet0 depot0)
    (at-entity pallet1 depot1)
    (at-entity pallet2 depot2)
    (at-entity pallet3 distributor0)
    (at-entity pallet4 distributor1)
    (at-entity pallet5 distributor2)

    ;; Crates located and on relations (stacks)
    (at-entity crate1 depot0)
    (on crate1 pallet0)

    (at-entity crate0 depot1)
    (on crate0 pallet1)
    (at-entity crate3 depot1)
    (on crate3 crate0)

    (at-entity crate2 depot2)
    (on crate2 pallet2)
    (at-entity crate4 depot2)
    (on crate4 crate2)
    (at-entity crate5 depot2)
    (on crate5 crate4)
    (at-entity crate9 depot2)
    (on crate9 crate5)

    (at-entity crate6 distributor2)
    (on crate6 pallet5)
    (at-entity crate7 distributor2)
    (on crate7 crate6)
    (at-entity crate8 distributor2)
    (on crate8 crate7)

    ;; Clear surfaces (top elements)
    (clear crate1)
    (clear crate3)
    (clear crate8)
    (clear crate9)
    (clear pallet3)
    (clear pallet4)

    ;; Hoist availability
    (hoist-available hoist0)
    (hoist-available hoist1)
    (hoist-available hoist2)
    (hoist-available hoist3)
    (hoist-available hoist4)
    (hoist-available hoist5)

    ;; Truck loads and limits
    (= (current-load truck0) 0)
    (= (load-limit truck0) 336)

    (= (current-load truck1) 0)
    (= (load-limit truck1) 366)

    ;; Crate weights
    (= (weight crate0) 42)
    (= (weight crate1) 6)
    (= (weight crate2) 74)
    (= (weight crate3) 64)
    (= (weight crate4) 61)
    (= (weight crate5) 79)
    (= (weight crate6) 29)
    (= (weight crate7) 77)
    (= (weight crate8) 19)
    (= (weight crate9) 98)
    (= (weight crate10) 31)
    (= (weight crate11) 81)
    (= (weight crate12) 4)
    (= (weight crate13) 73)
    (= (weight crate14) 31)

    ;; fuel-cost initial
    (= (fuel-cost) 0)
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
  (:metric minimize (fuel-cost))
)