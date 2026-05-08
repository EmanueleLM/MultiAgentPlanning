(define (problem depots0)
  (:domain multiagent_hoist_driver)
  (:objects
    ;; places
    depot0 depot1 depot2 distributor0 - place

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; pallets
    pallet0 pallet1 pallet2 pallet3 - pallet

    ;; crates
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; locations of pallets
    (at_pallet pallet0 depot0)
    (at_pallet pallet1 depot1)
    (at_pallet pallet2 depot2)
    (at_pallet pallet3 distributor0)

    ;; hoist locations
    (at_hoist hoist0 depot0)
    (at_hoist hoist1 depot1)
    (at_hoist hoist2 depot2)
    (at_hoist hoist3 distributor0)

    ;; trucks locations
    (at_truck truck0 depot1)
    (at_truck truck1 depot1)
    (at_truck truck2 distributor0)

    ;; hoists available
    (hoist_free hoist0)
    (hoist_free hoist1)
    (hoist_free hoist2)
    (hoist_free hoist3)

    ;; stacking: crate0 on pallet1 at depot1; crate1 on crate0 at depot1; crate2 on pallet0 at depot0
    (on_pallet crate0 pallet1)
    (at_crate crate0 depot1)

    (on_crate crate1 crate0)
    (at_crate crate1 depot1)

    (on_pallet crate2 pallet0)
    (at_crate crate2 depot0)

    ;; clear-ness
    (clear_crate crate1)
    (clear_crate crate2)
    (clear_pallet pallet2)
    (clear_pallet pallet3)
  )

  (:goal (and
           (on_pallet crate1 pallet1)
           (on_pallet crate2 pallet3)
         ))
)