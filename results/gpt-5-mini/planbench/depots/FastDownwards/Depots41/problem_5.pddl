(define (problem jack_of_all_trades_instance)
  (:domain jack_of_all_trades)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
  )
  (:init
    ;; crate locations (on pallets and at places)
    (at_crate crate0 depot1)
    (at_crate crate1 depot0)
    (at_crate crate2 distributor0)
    (on_pallet crate0 pallet1)
    (on_pallet crate1 pallet0)
    (on_pallet crate2 pallet3)

    ;; pallet locations
    (at_pallet pallet0 depot0)
    (at_pallet pallet1 depot1)
    (at_pallet pallet2 depot2)
    (at_pallet pallet3 distributor0)

    ;; trucks and hoists locations
    (at_truck truck0 distributor0)
    (at_truck truck1 distributor0)
    (at_truck truck2 depot0)
    (at_hoist hoist0 depot0)
    (at_hoist hoist1 depot1)
    (at_hoist hoist2 depot2)
    (at_hoist hoist3 distributor0)

    ;; hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; clearance facts (crate clear = nothing on top of crate; pallet clear = no crate on it)
    (clear_crate crate0)
    (clear_crate crate1)
    (clear_crate crate2)
    (clear_pallet pallet2)
  )
  (:goal (and
    (on_pallet crate0 pallet3)
    (on_pallet crate1 pallet0)
    (on_pallet crate2 pallet1)
  ))
)