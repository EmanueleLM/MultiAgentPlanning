(define (problem transport_instance)
  (:domain jack_of_all_trades)

  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    truck0 truck1 truck2 - truck

    hoist0 hoist1 hoist2 hoist3 - hoist

    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; trucks locations
    (truck_at truck0 depot2)
    (truck_at truck1 distributor0)
    (truck_at truck2 depot1)

    ;; hoist locations and availability
    (hoist_at hoist0 depot0)
    (hoist_at hoist1 depot1)
    (hoist_at hoist2 depot2)
    (hoist_at hoist3 distributor0)

    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    ;; surfaces at places
    (at_surface pallet0 depot0)
    (at_surface pallet1 depot1)
    (at_surface pallet2 depot2)
    (at_surface pallet3 distributor0)

    (at_surface crate0 depot1)
    (at_surface crate1 depot0)
    (at_surface crate2 distributor0)

    ;; stacking relations (crate on pallet)
    (on crate0 pallet1)
    (on crate1 pallet0)
    (on crate2 pallet3)

    ;; clear facts: crates are clear; pallet2 is clear
    (clear crate0)
    (clear crate1)
    (clear crate2)
    (clear pallet2)
  )

  (:goal (and
    (on crate1 crate2)
    (on crate2 pallet3)
  ))
)