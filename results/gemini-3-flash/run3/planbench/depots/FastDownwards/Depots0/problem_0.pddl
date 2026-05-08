(define (problem depots_transport_task)
  (:domain depots_logistics)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; Locations of places (implicit in types)
    
    ;; Locations of trucks
    (at truck0 depot1)
    (at truck1 depot1)
    (at truck2 distributor0)

    ;; Locations of hoists
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ;; Hoist status
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; Locations of surfaces
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)
    (at crate0 depot1)
    (at crate1 depot1)
    (at crate2 depot0)

    ;; Support relations and surface status
    (on crate0 pallet1)
    (on crate1 crate0)
    (on crate2 pallet0)
    
    (clear crate1)
    (clear crate2)
    (clear pallet2)
    (clear pallet3)
    ;; pallet0, pallet1, and crate0 are NOT clear initially
  )

  (:goal
    (and
      (on crate1 pallet1)
      (on crate2 pallet3)
    )
  )
)