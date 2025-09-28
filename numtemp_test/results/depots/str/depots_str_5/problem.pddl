(define (problem multi-agent-warehouse-problem)
  (:domain multi-agent-warehouse)
  (:objects
    ; places
    depot0 depot1 depot2 depot3 distributor0 distributor1 distributor2 distributor3
    ; trucks
    truck0 truck1 truck2 truck3
    ; hoists
    hoist0 hoist1 hoist2 hoist3 hoist4 hoist5 hoist6 hoist7
    ; pallets
    pallet0 pallet1 pallet2 pallet3 pallet4 pallet5 pallet6 pallet7 pallet8 pallet9
    ; crates
    crate0 crate1 crate2 crate3 crate4 crate5 crate6 crate7 crate8 crate9 crate10 crate11 crate12 crate13 crate14
  )

  (:init
    ; locations (at)
    ; depot0: hoist0, pallet0, truck1, crate3, crate4, crate13
    (at hoist0 depot0)
    (at pallet0 depot0)
    (at truck1 depot0)
    (at crate3 depot0)
    (at crate4 depot0)
    (at crate13 depot0)

    ; depot1: hoist1, pallet1, pallet8, truck2, crate6, crate11, crate12, crate14
    (at hoist1 depot1)
    (at pallet1 depot1)
    (at pallet8 depot1)
    (at truck2 depot1)
    (at crate6 depot1)
    (at crate11 depot1)
    (at crate12 depot1)
    (at crate14 depot1)

    ; depot2: hoist2, pallet2, pallet9
    (at hoist2 depot2)
    (at pallet2 depot2)
    (at pallet9 depot2)

    ; depot3: hoist3, pallet3, crate2, crate5
    (at hoist3 depot3)
    (at pallet3 depot3)
    (at crate2 depot3)
    (at crate5 depot3)

    ; distributor0: hoist4, pallet4
    (at hoist4 distributor0)
    (at pallet4 distributor0)

    ; distributor1: hoist5, pallet5, truck3, crate1, crate9
    (at hoist5 distributor1)
    (at pallet5 distributor1)
    (at truck3 distributor1)
    (at crate1 distributor1)
    (at crate9 distributor1)

    ; distributor2: hoist6, pallet6, truck0, crate7, crate8
    (at hoist6 distributor2)
    (at pallet6 distributor2)
    (at truck0 distributor2)
    (at crate7 distributor2)
    (at crate8 distributor2)

    ; distributor3: hoist7, pallet7, crate0, crate10
    (at hoist7 distributor3)
    (at pallet7 distributor3)
    (at crate0 distributor3)
    (at crate10 distributor3)

    ; on relations (stacks)
    (on pallet0 crate3)
    (on crate3 crate4)
    (on crate4 crate13)

    (on pallet1 crate6)
    (on crate6 crate12)
    (on crate12 crate14)

    (on pallet8 crate11)

    (on pallet3 crate2)
    (on crate2 crate5)

    (on pallet5 crate1)
    (on crate1 crate9)

    (on pallet6 crate7)
    (on crate7 crate8)

    (on pallet7 crate0)
    (on crate0 crate10)

    ; hoists idle initially
    (idle hoist0) (idle hoist1) (idle hoist2) (idle hoist3)
    (idle hoist4) (idle hoist5) (idle hoist6) (idle hoist7)

    ; clear surfaces (as given)
    (clear crate5) (clear crate8) (clear crate9) (clear crate10) (clear crate11) (clear crate13) (clear crate14)
    (clear pallet2) (clear pallet4) (clear pallet9)
  )

  (:goal
    (and
      ; goal on relations
      (on crate0 crate3)
      (on crate2 crate13)
      (on crate5 crate4)
      (on crate6 crate12)
      (on crate8 crate9)
      (on crate11 crate1)
      (on crate14 crate5)
      (on pallet1 crate14)
      (on pallet2 crate7)
      (on pallet3 crate0)
      (on pallet4 crate6)
      (on pallet5 crate11)
      (on pallet6 crate2)
      (on pallet7 crate8)
    )
  )
)