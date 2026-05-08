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

    ;; Pallet Locations (Fixed stack bases)
    (at pallet0 depot0)
    (at pallet1 depot0)
    (at pallet2 depot1)
    (at pallet3 depot1)

    ;; --- Hoist Status ---
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; --- Initial Stacking Configuration ---
    (on crate0 pallet0) ; Stack base: P0 @ D0
    (on crate1 pallet2) ; Stack base: P2 @ D1
    (on crate2 crate0)  ; Stack base: C0 @ D0

    ;; Clear Status (Only objects available for stacking upon are listed)
    (clear crate1)   ; Crate 1 is on top
    (clear crate2)   ; Crate 2 is on top
    (clear pallet1)
    (clear pallet3)

    ;; --- Crate Location Tracking (Derived from stacking configuration) ---
    (is-at crate0 depot0) ; Supported by P0
    (is-at crate1 depot1) ; Supported by P2
    (is-at crate2 depot0) ; Supported by C0 (which is on P0)
  )
  (:goal (and
    ;; Required stacking configuration
    (on crate0 crate1)
    (on crate1 pallet0)
    (on crate2 pallet2)

    ;; Required truck location
    (at truck0 distributor0)

    ;; Derived required final crate locations
    ;; C0, C1 stack on P0 @ D0
    (is-at crate0 depot0)
    (is-at crate1 depot0)
    ;; C2 stack on P2 @ D1
    (is-at crate2 depot1)
  ))
)