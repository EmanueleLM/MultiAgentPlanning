(define (problem logistics-instance)
  (:domain hoist-truck-timelogistics)

  (:objects
    ;; places
    depot0 depot1 depot2 distributor0 distributor1 distributor2 - place

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 hoist4 hoist5 - hoist

    ;; trucks
    truck0 truck1 - truck

    ;; pallets
    pallet0 pallet1 pallet2 pallet3 pallet4 pallet5 - pallet

    ;; crates
    crate0 crate1 crate2 crate3 crate4 crate5 crate6 crate7 crate8 crate9 - crate
  )

  (:init
    ;; Hoists at places
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)
    (at hoist4 distributor1)
    (at hoist5 distributor2)

    ;; Trucks at places
    (at truck0 depot2)
    (at truck1 distributor0)

    ;; Pallets at places
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)
    (at pallet4 distributor1)
    (at pallet5 distributor2)

    ;; Crates at places (explicit) -- crates also have 'on' relations below
    (at crate1 depot0)
    (at crate0 depot1)
    (at crate3 depot1)
    (at crate2 depot2)
    (at crate4 depot2)
    (at crate5 depot2)
    (at crate9 depot2)
    (at crate6 distributor2)
    (at crate7 distributor2)
    (at crate8 distributor2)

    ;; 'on' relations describing stacks
    (on crate3 crate0)
    (on crate4 crate2)
    (on crate5 crate4)
    (on crate9 crate5)
    (on crate7 crate6)
    (on crate8 crate7)
    (on crate1 pallet0)
    (on crate0 pallet1)
    (on crate2 pallet2)
    (on crate6 pallet5)

    ;; Clear surfaces
    (clear crate1)
    (clear crate3)
    (clear crate8)
    (clear crate9)
    (clear pallet3)
    (clear pallet4)

    ;; All hoists initially available
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)
    (available hoist4)
    (available hoist5)
  )

  (:goal
    (and
      ;; desired final 'on' relationships (goal)
      (on crate7 crate1)
      (on crate9 crate2)
      (on crate6 crate5)
      (on crate0 crate7)
      (on crate3 crate9)
      (on crate4 pallet0)
      (on crate5 pallet2)
      (on crate8 pallet3)
      (on crate1 pallet4)
      (on crate2 pallet5)
    )
  )

  (:metric minimize (total-time))
)