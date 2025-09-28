(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  (:objects
    depot0 depot1 depot2 distributor0 distributor1 distributor2 - place
    truck0 truck1 - truck
    hoist0 hoist1 hoist2 hoist3 hoist4 hoist5 - hoist
    pallet0 pallet1 pallet2 pallet3 pallet4 pallet5 - pallet
    crate0 crate1 crate2 crate3 crate4 crate5 - crate
  )

  (:init
    ;; hoist locations
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)
    (at hoist4 distributor1)
    (at hoist5 distributor2)

    ;; pallets
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)
    (at pallet4 distributor1)
    (at pallet5 distributor2)

    ;; trucks
    (at truck0 depot1)
    (at truck1 depot2)

    ;; crates at places (from specification)
    (at crate1 depot0)
    (at crate0 depot1)
    (at crate4 depot2)
    (at crate5 distributor0)
    (at crate2 distributor2)
    (at crate3 distributor2)

    ;; stacking (from specification)
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
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)
    (available hoist4)
    (available hoist5)

    ;; truck loads and limits (from specification)
    (= (current-load truck0) 0)
    (= (load-limit truck0) 370)
    (= (current-load truck1) 0)
    (= (load-limit truck1) 287)

    ;; crate weights (from specification)
    (= (crate-weight crate0) 96)
    (= (crate-weight crate1) 72)
    (= (crate-weight crate2) 74)
    (= (crate-weight crate3) 16)
    (= (crate-weight crate4) 23)
    (= (crate-weight crate5) 42)

    (= (fuel-cost) 0)
  )

  (:goal (and
    (on crate0 crate4)
    (on crate3 pallet0)
    (on crate2 pallet3)
    (on crate4 pallet5)
  ))

  (:metric minimize (fuel-cost))
)