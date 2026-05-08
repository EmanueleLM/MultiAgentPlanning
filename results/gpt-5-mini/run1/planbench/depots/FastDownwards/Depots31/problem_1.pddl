(define (problem depots31_instance)
  (:domain depots_sem)
  (:objects
    depot0 depot1 depot2 distributor0 - place
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; trucks at places
    (at truck0 distributor0)
    (at truck1 depot1)
    (at truck2 depot2)

    ;; hoists at places
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ;; hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; pallets at places
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; crates at places (also represented by on relations below)
    (at crate0 depot1)
    (at crate1 depot1)
    (at crate2 distributor0)

    ;; stacking relations (crate on surface)
    (on crate0 pallet1)
    (on crate1 crate0)
    (on crate2 pallet3)

    ;; clear surfaces (those with nothing on them)
    (clear pallet0)
    (clear pallet2)
    (clear crate1)
    (clear crate2)
  )

  (:goal (and
    (on crate0 pallet0)
    (on crate1 crate2)
    (on crate2 pallet3)
  ))
)