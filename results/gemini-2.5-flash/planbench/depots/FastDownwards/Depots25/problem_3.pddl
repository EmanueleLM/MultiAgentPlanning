(define (problem depots25_problem)
  (:domain depots25)
  (:objects
    depot0 depot1 depot2 distributor0 - place
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
  )
  (:init
    ;; Locations
    (at_surface crate0 depot2)
    (at_surface crate1 depot2)
    (at_surface crate2 depot2)
    (at_hoist hoist0 depot0)
    (at_hoist hoist1 depot1)
    (at_hoist hoist2 depot2)
    (at_hoist hoist3 distributor0)
    (at_surface pallet0 depot0)
    (at_surface pallet1 depot1)
    (at_surface pallet2 depot2)
    (at_surface pallet3 distributor0)
    (at_truck truck0 distributor0)
    (at_truck truck1 depot1)
    (at_truck truck2 distributor0)

    ;; Hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; Stacking relations
    (on crate0 pallet2)
    (on crate1 crate0)
    (on crate2 crate1)

    ;; Clear status - based on stacking, and other explicitly stated clear objects.
    (clear crate2) ; crate2 is on top of crate1, so it is clear
    (clear pallet0)
    (clear pallet1)
    (clear pallet3)
    ;; crate0, crate1, and pallet2 are implicitly not clear due to items on them.
    ;; All crates are implicitly not in trucks, as 'in' is not asserted for any crate-truck pair.
  )
  (:goal (and
    (on crate1 crate2)
    (on crate2 pallet2)
  ))