(define (problem logistics-task)
  (:domain multiagent-logistics)

  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    truck0 truck1 truck2 - truck

    hoist0 hoist1 hoist2 hoist3 - hoist
  )

  (:init
    ;; type unary facts (reflect public classification)
    (is_place depot0)
    (is_place depot1)
    (is_place depot2)
    (is_place distributor0)

    (is_depot depot0)
    (is_depot depot1)
    (is_depot depot2)
    (is_distributor distributor0)

    (is_pallet pallet0)
    (is_pallet pallet1)
    (is_pallet pallet2)
    (is_pallet pallet3)

    (is_crate crate0)
    (is_crate crate1)
    (is_crate crate2)

    (is_truck truck0)
    (is_truck truck1)
    (is_truck truck2)

    (is_hoist hoist0)
    (is_hoist hoist1)
    (is_hoist hoist2)
    (is_hoist hoist3)

    ;; road connectivity (symmetric pairs expanded)
    (road-connected depot0 depot1)
    (road-connected depot1 depot0)
    (road-connected depot0 depot2)
    (road-connected depot2 depot0)
    (road-connected depot0 distributor0)
    (road-connected distributor0 depot0)
    (road-connected depot1 depot2)
    (road-connected depot2 depot1)
    (road-connected depot1 distributor0)
    (road-connected distributor0 depot1)
    (road-connected depot2 distributor0)
    (road-connected distributor0 depot2)

    ;; pallets location
    (at-pallet pallet0 depot0)
    (at-pallet pallet1 depot1)
    (at-pallet pallet2 depot2)
    (at-pallet pallet3 distributor0)

    ;; surfaces are at places (pallet surfaces)
    (at-surface pallet0 depot0)
    (at-surface pallet1 depot1)
    (at-surface pallet2 depot2)
    (at-surface pallet3 distributor0)

    ;; crates initial placements and stacking (all at depot2)
    (at crate0 depot2)
    (at crate1 depot2)
    (at crate2 depot2)

    ;; also assert these crates as surfaces at the same place so actions can uniformly require at-surface
    (at-surface crate0 depot2)
    (at-surface crate1 depot2)
    (at-surface crate2 depot2)

    ;; stacking relations (topology)
    (on crate0 pallet2)
    (on crate1 crate0)
    (on crate2 crate1)

    ;; clear/top-of-stack facts explicitly provided or derived
    (clear crate2)      ;; topmost crate in the provided stack
    (clear pallet0)
    (clear pallet1)
    (clear pallet3)
    ;; note: pallet2, crate0, crate1 are not declared clear because they have crates atop them

    ;; trucks at places
    (at-truck truck0 distributor0)
    (at-truck truck1 depot1)
    (at-truck truck2 distributor0)

    ;; hoists at places and available in initial state
    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)

    (hoist-free hoist0)
    (hoist-free hoist1)
    (hoist-free hoist2)
    (hoist-free hoist3)

    ;; No in-truck facts initially (explicitly none)
    ;; No hoist-holding facts initially
  )

  (:goal (and
    ;; mandated terminal conditions from the public goal:
    ;; crate1 directly on crate2, and crate2 directly on pallet2.
    (on crate1 crate2)
    (on crate2 pallet2)
  ))
)