(define (problem depot_orchestration_problem)
  (:domain depot_orchestration)
  (:objects
    ;; crates
    crate1 crate2 - crate

    ;; pallets (explicit target pallet objects)
    pallet0 pallet3 - pallet

    ;; truck
    truck1 - truck

    ;; actors
    driver1 - driver
    hoist1 - hoist
    auditor1 - auditor

    ;; locations (explicit locations and pallet locations)
    staging1 staging2 pallet_spot0 pallet_spot3 - location
  )

  (:init
    ;; initial crate positions
    (crate-at crate1 staging1)
    (crate-at crate2 staging2)

    ;; truck and hoist initial locations
    (truck-at truck1 staging1)
    (hoist-at hoist1 staging1)

    ;; pallet placements
    (pallet-at pallet0 pallet_spot0)
    (pallet-at pallet3 pallet_spot3)

    ;; availability / capacity flags
    (truck-empty truck1)
    (pallet-empty pallet0)
    (pallet-empty pallet3)
    (hoist-free hoist1)
  )

  ;; Enforce final conditions explicitly: crate1 must be on pallet0 and crate2 on pallet3.
  ;; No other terminal conditions are allowed to be left unspecified for mandated outputs.
  (:goal (and
    (on-pallet crate1 pallet0)
    (on-pallet crate2 pallet3)
  ))
)