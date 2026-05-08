(define (problem hoist-truck-problem)
  (:domain hoist-truck-domain)

  (:objects
    ;; crates
    crate0 crate1 crate2 - crate

    ;; pallets (only those referenced in the goal must exist)
    pallet0 pallet2 pallet3 - pallet

    ;; locations
    locA locB locC - location

    ;; agents / vehicles
    hoist1 - hoist
    truck1 - truck
  )

  (:init
    ;; initial locations of hoist and truck
    (at-hoist hoist1 locA)
    (hoist-free hoist1)
    (at-truck truck1 locA)

    ;; initial locations of crates (on the floor, not on pallets or truck)
    (at-crate crate0 locA)
    (at-crate crate1 locB)
    (at-crate crate2 locB)

    ;; initial locations of pallets
    (at-pallet pallet0 locB)
    (at-pallet pallet2 locC)
    (at-pallet pallet3 locA)

    ;; all pallets start empty (enforce one-crate-per-pallet by requiring pallet to be empty for placement)
    (pallet-empty pallet0)
    (pallet-empty pallet2)
    (pallet-empty pallet3)
  )

  ;; Goal: final crate placements as required (strict constraints)
  (:goal (and
    (on crate0 pallet0)
    (on crate1 pallet2)
    (on crate2 pallet3)
  ))
)