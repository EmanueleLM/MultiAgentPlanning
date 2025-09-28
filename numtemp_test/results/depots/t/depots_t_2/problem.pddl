(define (problem multi-agent-hoist-truck-problem)
  (:domain multi-agent-hoist-truck)
  (:objects
    depot0 depot1 depot2
    distributor0 distributor1 distributor2

    truck0 truck1

    hoist0 hoist1 hoist2 hoist3 hoist4 hoist5

    pallet0 pallet1 pallet2 pallet3 pallet4 pallet5

    crate0 crate1 crate2 crate3 crate4 crate5 crate6 crate7 crate8 crate9 crate10 crate11 crate12 crate13 crate14
  )

  (:init
    (at hoist0 depot0)
    (at pallet0 depot0)

    (at hoist1 depot1)
    (at pallet1 depot1)
    (at truck1 depot1)

    (at hoist2 depot2)
    (at pallet2 depot2)

    (at hoist3 distributor0)
    (at pallet3 distributor0)

    (at hoist4 distributor1)
    (at pallet4 distributor1)
    (at truck0 distributor1)

    (at hoist5 distributor2)
    (at pallet5 distributor2)

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

    (clear crate4)
    (clear crate12)
    (clear crate13)
    (clear crate14)
    (clear pallet0)
    (clear pallet2)

    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)
    (available hoist4)
    (available hoist5)

    (= (speed truck0) 5)
    (= (speed truck1) 10)

    (= (power hoist0) 6)
    (= (power hoist1) 5)
    (= (power hoist2) 6)
    (= (power hoist3) 4)
    (= (power hoist4) 10)
    (= (power hoist5) 9)

    (= (weight crate0) 41)
    (= (weight crate1) 43)
    (= (weight crate2) 25)
    (= (weight crate3) 16)
    (= (weight crate4) 5)
    (= (weight crate5) 16)
    (= (weight crate6) 62)
    (= (weight crate7) 87)
    (= (weight crate8) 30)
    (= (weight crate9) 49)
    (= (weight crate10) 31)
    (= (weight crate11) 81)
    (= (weight crate12) 4)
    (= (weight crate13) 73)
    (= (weight crate14) 31)

    (= (distance depot0 depot0) 0) (= (distance depot0 depot1) 6) (= (distance depot0 depot2) 5) (= (distance depot0 distributor0) 9) (= (distance depot0 distributor1) 10) (= (distance depot0 distributor2) 4)
    (= (distance depot1 depot0) 5) (= (distance depot1 depot1) 0) (= (distance depot1 depot2) 6) (= (distance depot1 distributor0) 8) (= (distance depot1 distributor1) 5) (= (distance depot1 distributor2) 5)
    (= (distance depot2 depot0) 4) (= (distance depot2 depot1) 4) (= (distance depot2 depot2) 0) (= (distance depot2 distributor0) 5) (= (distance depot2 distributor1) 3) (= (distance depot2 distributor2) 2)

    (= (distance distributor0 depot0) 4) (= (distance distributor0 depot1) 2) (= (distance distributor0 depot2) 5) (= (distance distributor0 distributor0) 0) (= (distance distributor0 distributor1) 1) (= (distance distributor0 distributor2) 6)
    (= (distance distributor1 depot0) 5) (= (distance distributor1 depot1) 10) (= (distance distributor1 depot2) 6) (= (distance distributor1 distributor0) 1) (= (distance distributor1 distributor1) 0) (= (distance distributor1 distributor2) 4)
    (= (distance distributor2 depot0) 10) (= (distance distributor2 depot1) 3) (= (distance distributor2 depot2) 10) (= (distance distributor2 distributor0) 4) (= (distance distributor2 distributor1) 1) (= (distance distributor2 distributor2) 0)

    (= (total-time) 0)
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