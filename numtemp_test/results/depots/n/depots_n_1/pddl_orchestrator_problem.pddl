(define (problem multiagent-logistics-instance)
  (:domain multiagent-logistics-hoists)

  (:objects
    ; places
    depot0 depot1 depot2 distributor0 distributor1 distributor2 - place

    ; trucks
    truck0 truck1 - truck

    ; hoists
    hoist0 hoist1 hoist2 hoist3 hoist4 hoist5 - hoist

    ; pallets
    pallet0 pallet1 pallet2 pallet3 pallet4 pallet5 - pallet

    ; crates
    crate0 crate1 crate2 crate3 crate4 crate5 - crate
  )

  ;; Initial state (environment->init)
  (:init
    ;; locations: crates and pallets at places
    (at pallet0 depot0)
    (at crate1 depot0)
    (at pallet1 depot1)
    (at crate0 depot1)
    (at pallet2 depot2)
    (at crate4 depot2)
    (at pallet3 distributor0)
    (at crate5 distributor0)
    (at pallet4 distributor1)
    (at hoist4 distributor1)
    (at pallet5 distributor2)
    (at crate2 distributor2)
    (at crate3 distributor2)

    ;; hoists and trucks at places (hoists have their own predicate hoist-at)
    (hoist-at hoist0 depot0)
    (hoist-at hoist1 depot1)
    (hoist-at hoist2 depot2)
    (hoist-at hoist3 distributor0)
    (hoist-at hoist4 distributor1)
    (hoist-at hoist5 distributor2)

    (truck-at truck0 depot1)
    (truck-at truck1 depot2)

    ;; on relations (stacking)
    (on crate3 crate2)
    (on crate1 pallet0)
    (on crate0 pallet1)
    (on crate4 pallet2)
    (on crate5 pallet3)
    (on crate2 pallet5)

    ;; clear surfaces
    (clear crate0)
    (clear crate1)
    (clear crate3)
    (clear crate4)
    (clear crate5)
    (clear pallet4)

    ;; hoists available
    (hoist-available hoist0)
    (hoist-available hoist1)
    (hoist-available hoist2)
    (hoist-available hoist3)
    (hoist-available hoist4)
    (hoist-available hoist5)

    ;; no crates in trucks initially

    ;; Numeric fluents
    (= (fuel-cost) 0)
    (= (load truck0) 0)
    (= (load-limit truck0) 370)
    (= (load truck1) 0)
    (= (load-limit truck1) 287)

    ;; crate weights
    (= (weight crate0) 96)
    (= (weight crate1) 72)
    (= (weight crate2) 74)
    (= (weight crate3) 16)
    (= (weight crate4) 23)
    (= (weight crate5) 42)
  )

  ;; Goal (environment->goal)
  (:goal (and
    (on crate0 crate4)
    (on crate3 pallet0)
    (on crate2 pallet3)
    (on crate4 pallet5)
  ))

  (:metric minimize (fuel-cost))
)