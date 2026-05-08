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
    ;; --- Road Connectivity (All places directly connected) ---
    (road depot0 depot1) (road depot0 depot2) (road depot0 distributor0)
    (road depot1 depot0) (road depot1 depot2) (road depot1 distributor0)
    (road depot2 depot0) (road depot2 depot1) (road depot2 distributor0)
    (road distributor0 depot0) (road distributor0 depot1) (road distributor0 depot2)

    ;; --- Object Initial Locations ---
    (at truck0 depot0)
    (at truck1 depot1)
    (at truck2 depot2)

    ;; Hoist Locations
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ;; Pallet Locations
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

    ;; Clear Status
    (clear crate1)   
    (clear crate2)   
    (clear pallet1)
    (clear pallet3)

    ;; --- Crate Location Tracking ---
    (is-at crate0 depot0)
    (is-at crate1 depot2)
    (is-at crate2 depot0)
  )
  (:goal (and
    ;; Required stacking configuration
    (on crate0 crate1)
    (on crate1 pallet0)
    (on crate2 pallet2)

    ;; Derived required final crate locations (ensured by the stacking)
    (is-at crate0 depot0) 
    (is-at crate1 depot0) 
    (is-at crate2 depot2) 
  ))
)