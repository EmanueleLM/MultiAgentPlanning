(define (problem depot_operator_instance)
  (:domain depot_operator)

  (:objects
    ;; places (depots are declared as type 'depot' which is a place-subtype)
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    ;; pallets and crates (pallet, crate are subtypes of surface)
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist
  )

  ;; Initial facts
  (:init
    ;; Type / identity tokens (explicit as requested)
    (IsPlace depot0) (IsPlace depot1) (IsPlace depot2) (IsPlace distributor0)
    (IsDepot depot0) (IsDepot depot1) (IsDepot depot2)
    (IsDistributor distributor0)

    (IsSurface pallet0) (IsSurface pallet1) (IsSurface pallet2) (IsSurface pallet3)
    (IsPallet pallet0) (IsPallet pallet1) (IsPallet pallet2) (IsPallet pallet3)
    (IsCrate crate0) (IsCrate crate1) (IsCrate crate2)

    (IsTruck truck0) (IsTruck truck1) (IsTruck truck2)
    (IsHoist hoist0) (IsHoist hoist1) (IsHoist hoist2) (IsHoist hoist3)

    ;; Road connectivity - complete connectivity among the four places (bidirectional facts provided explicitly)
    (road-connected depot0 depot1)
    (road-connected depot0 depot2)
    (road-connected depot0 distributor0)
    (road-connected depot1 depot2)
    (road-connected depot1 distributor0)
    (road-connected depot2 distributor0)

    ;; symmetric counterparts
    (road-connected depot1 depot0)
    (road-connected depot2 depot0)
    (road-connected distributor0 depot0)
    (road-connected depot2 depot1)
    (road-connected distributor0 depot1)
    (road-connected distributor0 depot2)

    ;; Hoist and truck locations
    (hoist-at hoist0 depot0)
    (hoist-at hoist1 depot1)
    (hoist-at hoist2 depot2)
    (hoist-at hoist3 distributor0)

    (truck-at truck0 distributor0)
    (truck-at truck1 depot1)
    (truck-at truck2 distributor0)

    ;; Hoist availability initially (none is holding anything)
    (hoist-available hoist0)
    (hoist-available hoist1)
    (hoist-available hoist2)
    (hoist-available hoist3)

    ;; Pallets at places
    (surface-at pallet0 depot0)
    (surface-at pallet1 depot1)
    (surface-at pallet2 depot2)
    (surface-at pallet3 distributor0)

    ;; Crates: initial explicit place facts (they are on pallet2 at depot2 but also provided as crate-place facts)
    (surface-at crate0 depot2)
    (surface-at crate1 depot2)
    (surface-at crate2 depot2)

    ;; Stacking as provided
    (on crate0 pallet2)
    (on crate1 crate0)
    (on crate2 crate1)

    ;; Clear / NotClear tokens, matching the stacking facts
    (clear crate2)
    (clear pallet0)
    (clear pallet1)
    (clear pallet3)

    (not-clear pallet2)
    (not-clear crate0)
    (not-clear crate1)

    ;; No crate-in-truck or holding facts initially (explicit omission)
  )

  ;; Goal: crate1 on crate2 AND crate2 on pallet2
  (:goal (and
           (on crate1 crate2)
           (on crate2 pallet2)
         ))