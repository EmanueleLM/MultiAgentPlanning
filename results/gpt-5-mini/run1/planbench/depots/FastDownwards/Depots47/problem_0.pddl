(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades)

  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck

    depot0_place depot1_place depot2_place distributor0_place - place
  )

  ;; Note: To keep object names consistent with the specification, map places to their canonical names via at facts below.
  ;; The explicit place objects used in predicates are the same logical places: depot0_place corresponds to depot0, etc.
  ;; The objects list includes both typed place subtypes and place tokens used in 'at' facts below.

  (:init
    ;; place-locations for objects: using place tokens named consistently with original ids
    ;; crates initial locations (also implied by on facts)
    (at crate0 depot2_place)
    (at crate1 depot1_place)
    (at crate2 depot0_place)

    ;; hoists
    (at hoist0 depot0_place)
    (at hoist1 depot1_place)
    (at hoist2 depot2_place)
    (at hoist3 distributor0_place)

    ;; pallets
    (at pallet0 depot0_place)
    (at pallet1 depot1_place)
    (at pallet2 depot2_place)
    (at pallet3 distributor0_place)

    ;; trucks
    (at truck0 distributor0_place)
    (at truck1 depot1_place)
    (at truck2 distributor0_place)

    ;; hoist availability
    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    ;; clear surfaces (only as specified)
    (clear crate0)
    (clear crate1)
    (clear crate2)
    (clear pallet3)

    ;; stacking
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