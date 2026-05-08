(define (problem global_stacking_logistics)
  (:domain unified_logistics)
  (:objects
    depot0 depot1 depot2 distributor0 - place
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )
  (:init
    ;; --- Road Connectivity ---
    (road depot0 depot1) (road depot0 depot2) (road depot0 distributor0)
    (road depot1 depot0) (road depot1 depot2) (road depot1 distributor0)
    (road depot2 depot0) (road depot2 depot1) (road depot2 distributor0)
    (road distributor0 depot0) (road distributor0 depot1) (road distributor0 depot2)

    ;; --- Object Initial Locations ---
    (at truck0 depot0)
    (at truck1 depot1)
    (at truck2 depot2)

    ;; Hoist Locations (Fixed)
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ;; Pallet Locations (Fixed stack bases) -- CORRECTED based on human spec
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; --- Hoist Status ---
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; --- Initial Stacking Configuration ---
    (on crate0 pallet0) ; C0 @ D0
    (on crate1 pallet2) ; C1 @ D2
    (on crate2 crate0)  ; C2 @ D0

    ;; Clear Status (C1, C2 are on top; P1, P3 are unused)
    (clear crate1)   
    (clear crate2)   
    (clear pallet1)
    (clear pallet3)

    ;; --- Crate Location Tracking (Derived from stacking configuration) ---
    (is-at crate0 depot0) ; Supported by P0 @ D0
    (is-at crate1 depot2) ; Supported by P2 @ D2 (CORRECTED)
    (is-at crate2 depot0) ; Supported by C0 @ D0
  )
  (:goal (and
    ;; Required stacking configuration
    (on crate0 crate1)
    (on crate1 pallet0)
    (on crate2 pallet2)

    ;; Derived required final crate locations
    (is-at crate0 depot0) ; On C1 on P0 @ D0
    (is-at crate1 depot0) ; On P0 @ D0
    (is-at crate2 depot2) ; On P2 @ D2
  ))
)