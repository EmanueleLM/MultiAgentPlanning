(define (problem jack_problem_instance)
  (:domain jack_of_all_trades)
  (:objects
    depot0 depot1 depot2 distributor0 - place
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; truck locations
    (at_place_truck truck0 depot2)
    (at_place_truck truck1 depot2)
    (at_place_truck truck2 depot0)

    ;; hoist locations
    (at_place_hoist hoist0 depot0)
    (at_place_hoist hoist1 depot1)
    (at_place_hoist hoist2 depot2)
    (at_place_hoist hoist3 distributor0)

    ;; hoist availability
    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    ;; pallets at places
    (at_place_surface pallet0 depot0)
    (at_place_surface pallet1 depot1)
    (at_place_surface pallet2 depot2)
    (at_place_surface pallet3 distributor0)

    ;; crates at places
    (at_place_crate crate0 distributor0)
    (at_place_crate crate1 depot0)
    (at_place_crate crate2 depot2)

    ;; on relations (supports)
    (on crate0 pallet3)
    (on crate1 pallet0)
    (on crate2 pallet2)

    ;; clear predicates (surfaces: pallets and crates are subtypes of surface)
    (clear_pc crate0)
    (clear_pc crate1)
    (clear_pc crate2)
    (clear_pc pallet1)
  )

  (:goal (and
    (on crate0 pallet0)
    (on crate1 pallet2)
    (on crate2 crate1)
  ))
)