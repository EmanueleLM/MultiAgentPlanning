(define (problem hoist-truck-problem)
  (:domain hoist-truck-domain)

  (:objects
    ; places
    depot0 depot1 depot2 distributor0 - place

    ; hoists and trucks
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2           - truck

    ; surfaces: pallets and crates
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2            - crate
  )

  (:init
    ; hoist locations
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ; pallet locations
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ; truck locations
    (at truck0 distributor0)
    (at truck1 depot2)
    (at truck2 depot0)

    ; crate initial placements (on pallets and at places)
    (on crate0 pallet1)
    (on crate1 pallet2)
    (on crate2 pallet3)

    (at crate0 depot1)
    (at crate1 depot2)
    (at crate2 distributor0)

    ; hoist availabilities
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ; clear predicates: crates are top-clear; pallet0 is clear, others occupied by crates
    (clear crate0)
    (clear crate1)
    (clear crate2)
    (clear pallet0)
  )

  (:goal (and
           (on crate0 pallet1)
           (on crate1 pallet2)
           (on crate2 pallet0)
         ))
)