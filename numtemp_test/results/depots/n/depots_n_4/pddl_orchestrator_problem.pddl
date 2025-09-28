(define (problem orchestrator-instance)
  (:domain orchestrator-crate-transport)

  (:objects
    ; places
    depot0 depot1 depot2 distributor0 distributor1 distributor2 - place

    ; trucks
    truck0 truck1 - truck

    ; hoists
    hoist0 hoist1 hoist2 hoist3 hoist4 hoist5 - hoist

    ; pallets
    pallet0 pallet1 pallet2 pallet3 pallet4 pallet5 pallet6 pallet7 pallet8 pallet9 - pallet

    ; crates
    crate0 crate1 crate2 crate3 crate4 crate5 - crate
  )

  ; initial predicates
  (:init
    ; locations (at) for trucks
    (at truck1 depot0)
    (at truck0 distributor1)

    ; locations for hoists
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)
    (at hoist4 distributor1)
    (at hoist5 distributor2)

    ; pallets located at places (per provided locations/stacks)
    (at pallet0 depot0)
    (at pallet7 depot0)
    (at pallet8 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)
    (at pallet9 distributor0)
    (at pallet4 distributor1)
    (at pallet6 distributor1)
    (at pallet5 distributor2)

    ; on relations (stacks)
    (on crate2 pallet0)
    (on crate3 pallet8)
    (on crate0 pallet2)
    (on crate1 crate0)
    (on crate5 crate1)
    (on crate4 pallet3)

    ; crates co-located at places (explicit at facts for co-location checks)
    (at crate2 depot0)
    (at crate3 depot0)
    (at crate0 depot2)
    (at crate1 depot2)
    (at crate5 depot2)
    (at crate4 distributor0)

    ; clear surfaces (top-of-stack surfaces that are free)
    (clear crate2)
    (clear crate3)
    (clear crate4)
    (clear crate5)
    (clear pallet1)
    (clear pallet4)
    (clear pallet5)
    (clear pallet6)
    (clear pallet7)
    (clear pallet9)

    ; hoist availability initial
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)
    (available hoist4)
    (available hoist5)

    ; no crate in any truck initially (in-truck facts absent) and no hoist holding
    ; numeric fluents initial values
    (= (current-load truck0) 0)
    (= (current-load truck1) 0)

    (= (load-limit truck0) 402)
    (= (load-limit truck1) 211)

    (= (weight crate0) 55)
    (= (weight crate1) 100)
    (= (weight crate2) 81)
    (= (weight crate3) 26)
    (= (weight crate4) 50)
    (= (weight crate5) 71)

    (= (fuel-cost) 0)
  )

  ; goals: specified on_relations to achieve, and objective minimize fuel-cost
  (:goal (and
    (on crate0 pallet0)
    (on crate5 pallet1)
    (on crate2 pallet4)
    (on crate1 pallet5)
    (on crate3 pallet7)
    (on crate4 pallet9)
  ))

  (:metric minimize (fuel-cost))
)