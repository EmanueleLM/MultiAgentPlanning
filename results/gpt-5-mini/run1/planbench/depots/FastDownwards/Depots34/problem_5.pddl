(define (problem depots34_problem_fixed)
  (:domain depots_instance_fixed)

  (:objects
    depot0 depot1 depot2 distributor0 - place
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; crates initial place facts
    (at_crate crate0 depot2)
    (at_crate crate1 depot2)
    (at_crate crate2 depot2)

    ;; hoist locations
    (at_hoist hoist0 depot0)
    (at_hoist hoist1 depot1)
    (at_hoist hoist2 depot2)
    (at_hoist hoist3 distributor0)

    ;; pallet locations
    (at_pallet pallet0 depot0)
    (at_pallet pallet1 depot1)
    (at_pallet pallet2 depot2)
    (at_pallet pallet3 distributor0)

    ;; trucks
    (at_truck truck0 depot1)
    (at_truck truck1 depot1)
    (at_truck truck2 depot0)

    ;; hoist availability
    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    ;; clear surfaces/crates (those with nothing on top)
    (clear_crate crate2)
    (clear_pallet pallet0)
    (clear_pallet pallet1)
    (clear_pallet pallet3)

    ;; stacking (bottom-up) as given:
    ;; crate0 on pallet2, crate1 on crate0, crate2 on crate1
    (on_pallet crate0 pallet2)
    (on_crate crate1 crate0)
    (on_crate crate2 crate1)
  )

  (:goal (and
    (on_crate crate0 crate2)
    (on_pallet crate2 pallet1)
  ))
)