(define (problem depots38_problem)
  (:domain depots_instance)

  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    hoist0 hoist1 hoist2 hoist3 - hoist

    truck0 truck1 truck2 - truck

    pallet0 pallet1 pallet2 pallet3 - pallet

    crate0 crate1 crate2 - crate
  )

  (:init
    ;; hoist locations
    (at_hoist hoist0 depot0)
    (at_hoist hoist1 depot1)
    (at_hoist hoist2 depot2)
    (at_hoist hoist3 distributor0)

    ;; pallet locations (surfaces)
    (at_surface pallet0 depot0)
    (at_surface pallet1 depot1)
    (at_surface pallet2 depot2)
    (at_surface pallet3 distributor0)

    ;; truck locations
    (at_truck truck0 depot2)
    (at_truck truck1 distributor0)
    (at_truck truck2 depot0)

    ;; crate locations (crates are surfaces too; they are located at places as well)
    (at_surface crate0 depot0)
    (at_surface crate1 depot0)
    (at_surface crate2 depot2)

    ;; stacking relations
    (on crate0 pallet0)
    (on crate1 crate0)
    (on crate2 pallet2)

    ;; hoist availability
    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    ;; clear surfaces as given (top-most surfaces)
    (clear crate1)
    (clear crate2)
    (clear pallet1)
    (clear pallet3)
  )

  (:goal (and
    (on crate0 pallet1)
    (on crate2 crate0)
  ))
)