(define (problem depots45)
  (:domain depots_repairs)
  (:objects
    ;; places
    depot0 depot1 depot2 distributor0 - place

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; pallets and crates (surfaces)
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; crate placements (crate on surface and crate at place)
    (on crate0 pallet1)
    (at crate0 depot1)

    (on crate1 pallet2)
    (at crate1 depot2)

    (on crate2 pallet3)
    (at crate2 distributor0)

    ;; pallets at places
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; clear surfaces: pallet0 empty; crates have no items on top
    (clear pallet0)
    (clear crate0)
    (clear crate1)
    (clear crate2)

    ;; hoists at places and available
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)
    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    ;; trucks at places
    (at truck0 distributor0)
    (at truck1 depot0)
    (at truck2 depot1)
  )

  (:goal (and
    (on crate0 pallet0)
    (on crate1 pallet1)
    (on crate2 crate0)
  ))
)