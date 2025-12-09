(define (problem logistics-multiagent-problem)
  (:domain logistics-multiagent)

  (:objects
    depot0 depot1 depot2 distributor0 - place

    truck0 truck1 truck2 - truck

    hoist0 hoist1 hoist2 hoist3 - hoist

    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; surface locations (pallets)
    (surface_at pallet3 distributor0)
    (surface_at pallet1 depot1)
    (surface_at pallet0 depot0)
    (surface_at pallet2 depot2)

    ;; crates acting as surfaces are initially located where their support surface is:
    (surface_at crate0 distributor0)
    (surface_at crate1 depot1)
    (surface_at crate2 distributor0)

    ;; crate stack configuration
    (crate_on crate0 pallet3)   ;; crate0 sits on pallet3 at distributor0
    (crate_on crate2 crate0)    ;; crate2 stacked on crate0 at distributor0
    (crate_on crate1 pallet1)   ;; crate1 sits on pallet1 at depot1

    ;; clear/top predicates (consistent with stacking above)
    (surface_clear pallet0)
    (surface_clear pallet2)

    (crate_clear crate2)
    (crate_clear crate1)
    ;; crate0 is NOT clear because crate2 is on it; pallet1 and pallet3 are NOT clear

    ;; Truck and hoist locations
    (truck_at truck0 depot0)
    (truck_at truck1 depot0)
    (truck_at truck2 depot2)

    (hoist_at hoist0 depot0)
    (hoist_at hoist1 depot1)
    (hoist_at hoist2 depot2)
    (hoist_at hoist3 distributor0)

    ;; hoists availability must be represented and maintained exactly by actions
    (hoist_free hoist0)
    (hoist_free hoist1)
    (hoist_free hoist2)
    (hoist_free hoist3)

    ;; Road connectivity: complete graph among the four places (both directions)
    (road depot0 depot1) (road depot1 depot0)
    (road depot0 depot2) (road depot2 depot0)
    (road depot0 distributor0) (road distributor0 depot0)
    (road depot1 depot2) (road depot2 depot1)
    (road depot1 distributor0) (road distributor0 depot1)
    (road depot2 distributor0) (road distributor0 depot2)
  )

  (:goal (and
    (crate_on crate0 pallet2)
    (crate_on crate1 pallet0)
    (crate_on crate2 crate1)
  ))
)