(define (problem loading-hoist-problem)
  (:domain loading-hoist)

  ;; Note on reconciliation choices:
  ;; - The specification referenced depot, distributor, pallets, crates, truck, hoist, and surfaces.
  ;;   I modeled depot and distributor as two locations, used depot-floor and distributor-floor as floor surfaces,
  ;;   and represented pallet0 and pallet1 as surfaces (pallet is a subtype of surface). This is conservative
  ;;   and ensures surface placement checks are explicit and location-bound.
  ;; - Actions are namespaced: driver-* operate the truck, hoist-* operate the hoist.
  ;; - No resource capacities or post-hoc penalty constructs were introduced.
  ;; End of comment.

  (:objects
    depot distributor - location

    depot-floor distributor-floor pallet0 pallet1 - surface

    crate0 crate1 crate2 - crate

    truck0 - truck

    hoist0 - hoist
  )

  (:init
    ;; initial vehicle and equipment locations
    (truck-at truck0 depot)
    (hoist-at hoist0 depot)
    (hoist-free hoist0)

    ;; surfaces are located at explicit locations
    (surface-at depot-floor depot)
    (surface-at distributor-floor distributor)
    (surface-at pallet0 depot)
    (surface-at pallet1 distributor)

    ;; initial crate placements (all crates start on depot floor)
    (on crate0 depot-floor)
    (on crate1 depot-floor)
    (on crate2 depot-floor)
  )

  (:goal (and
    (on crate0 pallet0)
    (on crate2 pallet1)
  ))