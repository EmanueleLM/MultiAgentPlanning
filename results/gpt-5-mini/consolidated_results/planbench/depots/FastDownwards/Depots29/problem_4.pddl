(define (problem depots29-problem)
  (:domain depots-hoist)
  (:objects
    depot0 depot1 depot2 distributor0 - place

    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist

    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    ;; explicit stages (ordered objects)
    s_on_surface s_lifted s_in_truck s_lifted_from_truck s_placed - stage
  )

  (:init
    ;; locations of pallets (surfaces)
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; initial crate placements (on surfaces) and place-location facts
    (on crate0 pallet3)
    (at crate0 distributor0)

    (on crate1 pallet0)
    (at crate1 depot0)

    (on crate2 crate1)
    (at crate2 depot0)

    ;; hoists at places
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ;; trucks at depots
    (at truck0 depot0)
    (at truck1 depot1)
    (at truck2 depot2)

    ;; hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; clear surfaces/crates where stated
    (clear crate0)
    (clear crate2)
    (clear pallet1)
    (clear pallet2)

    ;; initial stage assignments (all crates start on surfaces)
    (stage crate0 s_on_surface)
    (stage crate1 s_on_surface)
    (stage crate2 s_on_surface)

    ;; allowed stage transitions (successor relation) - only forward progression
    (next s_on_surface s_lifted)
    (next s_lifted s_in_truck)
    (next s_in_truck s_lifted_from_truck)
    (next s_lifted_from_truck s_placed)
    ;; allow direct progression from lifted to placed (drop without truck)
    (next s_lifted s_placed)

    ;; target pallet assignments (goal destinations)
    (target-pallet crate1 pallet1)
    (target-pallet crate2 pallet2)
  )

  (:goal (and
    (on crate1 pallet1)
    (stage crate1 s_placed)
    (on crate2 pallet2)
    (stage crate2 s_placed)
  ))
)