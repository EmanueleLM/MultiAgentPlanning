(define (problem depots_instance_problem)
  (:domain depots_instance)

  (:objects
    depot0 depot1 depot2 distributor0 - place

    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist

    pallet0 pallet1 pallet2 pallet3 - surface
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; crates at places (they are also on pallets as listed below)
    (at_place crate0 depot2)
    (at_place crate1 depot1)
    (at_place crate2 depot0)

    ;; hoists at places
    (at_place hoist0 depot0)
    (at_place hoist1 depot1)
    (at_place hoist2 depot2)
    (at_place hoist3 distributor0)

    ;; pallets at places
    (at_place pallet0 depot0)
    (at_place pallet1 depot1)
    (at_place pallet2 depot2)
    (at_place pallet3 distributor0)

    ;; trucks at places
    (at_place truck0 distributor0)
    (at_place truck1 depot1)
    (at_place truck2 distributor0)

    ;; hoist availability
    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    ;; clear facts (explicitly stated)
    (clear crate0)
    (clear crate1)
    (clear crate2)
    (clear pallet3)

    ;; on relations (and note corresponding pallets are thereby not clear)
    (on crate0 pallet2)
    (on crate1 pallet1)
    (on crate2 pallet0)
  )

  (:goal (and
    (on crate0 pallet2)
    (on crate1 pallet0)
    (on crate2 pallet3)
  ))
)