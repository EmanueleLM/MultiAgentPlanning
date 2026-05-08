(define (problem logistics-multiagent-problem)
  (:domain logistics-multiagent)

  ;; Objects
  (:objects
    depot0 depot1 depot2 distributor0 - place

    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist

    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    ;; treat each crate also as a surface (surface = pallet OR crate)
    pallet0 pallet1 pallet2 pallet3 crate0 crate1 crate2 - surface
  )

  ;; Initial state: locations, stacking, availability, connectivity
  (:init
    ;; Surface placements (pallets and crates as surfaces)
    (surface_at pallet3 distributor0)
    (surface_at pallet1 depot1)
    (surface_at pallet0 depot0)
    (surface_at pallet2 depot2)

    ;; crates that act as surfaces are located where their support surface is
    (surface_at crate0 distributor0)
    (surface_at crate1 depot1)
    (surface_at crate2 distributor0)

    ;; Truck locations
    (truck_at truck0 depot0)
    (truck_at truck1 depot0)
    (truck_at truck2 depot2)

    ;; Hoist locations
    (hoist_at hoist3 distributor0)
    (hoist_at hoist1 depot1)
    (hoist_at hoist0 depot0)
    (hoist_at hoist2 depot2)

    ;; Resource tokens (hoist/truck free)
    (hoist_free hoist3)
    (hoist_free hoist1)
    (hoist_free hoist0)
    (hoist_free hoist2)

    (truck_free truck0)
    (truck_free truck1)
    (truck_free truck2)

    ;; Stack configuration (crate_on)
    (crate_on crate0 pallet3)   ;; crate0 sits on pallet3 at distributor0
    (crate_on crate2 crate0)    ;; crate2 stacked on crate0 at distributor0 (so crate0 not clear)
    (crate_on crate1 pallet1)   ;; crate1 sits on pallet1 at depot1

    ;; Clear/top predicates (computed from stack)
    ;; pallet0 and pallet2 are empty (clear)
    (surface_clear pallet0)
    (surface_clear pallet2)

    ;; crate-level clears
    (crate_clear crate2)
    (crate_clear crate1)

    ;; Surfaces that are occupied are NOT declared surface_clear (pallet1, pallet3, crate0 are occupied)

    ;; Road connectivity: full connectivity among depots and distributors (complete graph)
    ;; (road ?from ?to) for every distinct pair of places
    (road depot0 depot1) (road depot1 depot0)
    (road depot0 depot2) (road depot2 depot0)
    (road depot0 distributor0) (road distributor0 depot0)
    (road depot1 depot2) (road depot2 depot1)
    (road depot1 distributor0) (road distributor0 depot1)
    (road depot2 distributor0) (road distributor0 depot2)
  )

  ;; Goal: crate0 on pallet2, crate1 on pallet0, crate2 on crate1
  (:goal (and
    (crate_on crate0 pallet2)
    (crate_on crate1 pallet0)
    (crate_on crate2 crate1)
  ))
)