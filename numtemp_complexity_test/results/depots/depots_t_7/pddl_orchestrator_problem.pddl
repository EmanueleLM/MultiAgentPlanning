(define (problem multi-agent-temporal-logistics-problem)
  (:domain multi-agent-temporal-logistics)

  (:objects
    depot0 depot1 - depot
    distributor0 distributor1 - distributor
    ; places include the above via type hierarchy
    truck0 truck1 truck2 truck3 - truck
    hoist0 hoist1 hoist2 hoist3 hoist4 hoist5 hoist6 hoist7 - hoist
    pallet0 pallet1 pallet2 pallet3 pallet4 pallet5 pallet6 pallet7 - pallet
    crate0 crate1 crate2 crate3 crate4 crate5 - crate
  )

  (:init
    ; initial locations: trucks
    (at truck2 depot0)
    (at truck0 depot1)
    (at truck1 depot1)
    (at truck3 distributor1)

    ; initial hoist locations
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist5 depot1)
    (at hoist6 depot1)
    (at hoist2 distributor0)
    (at hoist3 distributor1)
    (at hoist4 distributor1)
    (at hoist7 distributor1)

    ; pallets at places according to stacks
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet4 depot1)
    (at pallet6 depot1)
    (at pallet2 distributor0)
    (at pallet7 distributor0)
    (at pallet3 distributor1)
    (at pallet5 distributor1)

    ; initial on-relations (given)
    (on crate3 crate1)
    (on crate5 crate2)
    (on crate2 pallet0)
    (on crate1 pallet1)
    (on crate4 pallet2)
    (on crate0 pallet4)

    ; clear surfaces (given)
    (clear crate0)
    (clear crate3)
    (clear crate4)
    (clear crate5)
    (clear pallet3)
    (clear pallet5)
    (clear pallet6)
    (clear pallet7)

    ; hoists initially free
    (hoist-free hoist0)
    (hoist-free hoist1)
    (hoist-free hoist2)
    (hoist-free hoist3)
    (hoist-free hoist4)
    (hoist-free hoist5)
    (hoist-free hoist6)
    (hoist-free hoist7)

    ; numeric fluents: speeds
    (= (speed truck0) 1)
    (= (speed truck1) 5)
    (= (speed truck2) 9)
    (= (speed truck3) 1)

    ; hoist powers
    (= (power hoist0) 9)
    (= (power hoist1) 1)
    (= (power hoist2) 2)
    (= (power hoist3) 10)
    (= (power hoist4) 6)
    (= (power hoist5) 9)
    (= (power hoist6) 1)
    (= (power hoist7) 9)

    ; crate weights
    (= (weight crate0) 32)
    (= (weight crate1) 46)
    (= (weight crate2) 39)
    (= (weight crate3) 24)
    (= (weight crate4) 2)
    (= (weight crate5) 25)

    ; directed distances
    (= (distance depot0 depot0) 0)
    (= (distance depot0 depot1) 2)
    (= (distance depot0 distributor0) 1)
    (= (distance depot0 distributor1) 9)

    (= (distance depot1 depot0) 9)
    (= (distance depot1 depot1) 0)
    (= (distance depot1 distributor0) 8)
    (= (distance depot1 distributor1) 5)

    (= (distance distributor0 depot0) 1)
    (= (distance distributor0 depot1) 9)
    (= (distance distributor0 distributor0) 0)
    (= (distance distributor0 distributor1) 1)

    (= (distance distributor1 depot0) 5)
    (= (distance distributor1 depot1) 7)
    (= (distance distributor1 distributor0) 2)
    (= (distance distributor1 distributor1) 0)
  )

  (:goal (and
    (on crate4 crate3)
    (on crate3 pallet0)
    (on crate2 pallet1)
    (on crate5 pallet2)
    (on crate0 pallet3)
  ))

  (:metric minimize (total-time))
)