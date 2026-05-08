(define (problem depots8-instance)
  (:domain depots-hoist)

  ;; Note: the initial state explicitly includes crate2 being at depot1 (it is on crate0).
  ;; This restores the explicit place facts implied by stacking and avoids missing at-surface atoms
  ;; that some planners/encodings may expect.
  (:objects
    ;; places
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; pallets (surfaces) and crates (also surfaces)
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; locations of pallets (surfaces on the ground)
    (at-surface pallet0 depot0)
    (at-surface pallet1 depot1)
    (at-surface pallet2 depot2)
    (at-surface pallet3 distributor0)

    ;; crates that are directly located at places (explicit place atoms)
    (at-surface crate0 depot1)   ;; crate0 is on pallet1 at depot1
    (at-surface crate1 distributor0) ;; crate1 is on pallet3 at distributor0
    (at-surface crate2 depot1)   ;; crate2 is on crate0 at depot1 (explicitly stated)

    ;; stacking: crates on pallets/crates as given
    (on crate0 pallet1)    ;; crate0 is on pallet1 at depot1
    (on crate2 crate0)     ;; crate2 is on crate0 (stacked)
    (on crate1 pallet3)    ;; crate1 is on pallet3 at distributor0

    ;; trucks initial places
    (at-truck truck0 depot1)
    (at-truck truck1 depot2)
    (at-truck truck2 distributor0)

    ;; hoists initial places
    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)

    ;; hoist availability
    (hoist-free hoist0)
    (hoist-free hoist1)
    (hoist-free hoist2)
    (hoist-free hoist3)

    ;; clear surfaces as stated (positive facts only)
    (clear crate1)
    (clear crate2)
    (clear pallet0)
    (clear pallet2)
  )

  (:goal (and
    (on crate0 pallet0)
    (on crate2 pallet1)
  ))
)