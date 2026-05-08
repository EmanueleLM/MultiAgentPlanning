(define (problem logistics-instance-0)
  (:domain logistics-stacking)

  ;; Objects (typed)
  (:objects
    depot0 depot1 depot2 distributor0 - place

    truck0 truck1 truck2 - truck

    hoist0 hoist1 hoist2 hoist3 - hoist

    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  ;; Initial state: explicit facts from the analyses.
  ;; - Trucks' locations
  ;; - Hoists' locations and availability
  ;; - Pallet locations
  ;; - Crates on pallets and at-places
  ;; - Clear facts where applicable
  ;; - All-place-pair 'different' facts to forbid no-op drives (from == to)
  (:init
    ;; truck locations (invariants: unique by action effects)
    (at-truck truck0 depot2)
    (at-truck truck1 depot0)
    (at-truck truck2 depot2)

    ;; hoist locations and availability
    (at-hoist hoist0 depot0)
    (hoist-available hoist0)

    (at-hoist hoist1 depot1)
    (hoist-available hoist1)

    (at-hoist hoist2 depot2)
    (hoist-available hoist2)

    (at-hoist hoist3 distributor0)
    (hoist-available hoist3)

    ;; pallet locations (explicit)
    (at-surface pallet0 depot0)
    (at-surface pallet2 depot2)
    (at-surface pallet3 distributor0)
    ;; pallet1 has no explicit place in the provided data and is left without at-surface(pallet1, place).
    ;; It exists as an object but is not usable until given a location by explicit actions.

    ;; crates initially resting on pallets (and at-place facts must be present)
    (on crate0 pallet0)
    (at-crate crate0 depot0)
    (clear crate0)        ;; nothing on crate0

    (on crate1 pallet3)
    (at-crate crate1 distributor0)
    (clear crate1)

    (on crate2 pallet2)
    (at-crate crate2 depot2)
    (clear crate2)

    ;; surface clear flags:
    ;; pallet0, pallet2, pallet3 are not clear because they have crates on them (no facts).
    ;; pallet1 is explicitly clear in the analysis; we represent that fact even without placing the pallet,
    ;; to preserve the declared property (it will only be meaningful if pallet1 is given a place).
    (clear pallet1)

    ;; No crates are initially in trucks or hoists.
    ;; hoist-available facts above encode that.

    ;; 'different' facts for all ordered distinct place pairs (prevents driver-drive no-op)
    (different depot0 depot1) (different depot0 depot2) (different depot0 distributor0)
    (different depot1 depot0) (different depot1 depot2) (different depot1 distributor0)
    (different depot2 depot0) (different depot2 depot1) (different depot2 distributor0)
    (different distributor0 depot0) (different distributor0 depot1) (different distributor0 depot2)
  )

  ;; Goal: enforce final stacking relationships and consistent at-crate placements.
  ;; All "preferences" from analyses are encoded as hard constraints (must hold).
  (:goal (and
            ;; final stacking requirements (explicit)
            (on crate0 crate2)
            (on crate1 pallet2)
            (on crate2 pallet0)

            ;; Ensure corresponding at-crate facts are true at expected places
            ;; pallet0 is at depot0 initially, so crate0 and crate2 on it must be at depot0
            (at-crate crate0 depot0)
            (at-crate crate2 depot0)

            ;; pallet2 is at depot2 initially, so crate1 on pallet2 must be at depot2
            (at-crate crate1 depot2)
          )
  )

  ;; No metric or costs required for this encoding.
)