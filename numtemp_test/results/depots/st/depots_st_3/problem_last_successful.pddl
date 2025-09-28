(define (problem multi-agent-warehouse-problem)
  (:domain multi-agent-warehouse)

  (:objects
    ;; places
    depot0 depot1 depot2 distributor0 distributor1 distributor2 - place

    ;; trucks
    truck0 truck1 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 hoist4 hoist5 - hoist

    ;; pallets
    pallet0 pallet1 pallet2 pallet3 pallet4 pallet5 pallet6 pallet7 pallet8 pallet9 - pallet

    ;; crates
    crate0 crate1 crate2 crate3 crate4 crate5 - crate
  )

  (:init
    ;; actual initial at facts:
    (at crate2 depot0)
    (at crate3 depot0)
    (at crate0 depot2)
    (at crate1 depot2)
    (at crate5 depot2)
    (at crate4 distributor0)

    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)
    (at hoist4 distributor1)
    (at hoist5 distributor2)

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

    (at truck0 distributor1)
    (at truck1 depot0)

    ;; stacking (on)
    (on crate1 crate0)
    (on crate5 crate1)
    (on crate2 pallet0)
    (on crate0 pallet2)
    (on crate4 pallet3)
    (on crate3 pallet8)

    ;; crate/pallet clear surfaces (given)
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

    ;; hoists availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)
    (available hoist4)
    (available hoist5)
  )

  (:goal (and
    (on crate0 pallet0)
    (on crate5 pallet1)
    (on crate2 pallet4)
    (on crate1 pallet5)
    (on crate3 pallet7)
    (on crate4 pallet9)
  ))

  (:metric minimize (total-time))
)