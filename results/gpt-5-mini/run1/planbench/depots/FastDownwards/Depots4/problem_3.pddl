(define (problem depots4)
  (:domain logistics-hoist-truck)

  (:objects
    ;; places
    depot0 depot1 depot2 distributor0 - place

    ;; pallets and crates
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    ;; equipment
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
  )

  (:init
    ;; pallets at places
    (surface_at pallet0 depot0)
    (surface_at pallet1 depot1)
    (surface_at pallet2 depot2)
    (surface_at pallet3 distributor0)

    ;; crates recorded at their places (they are on top of some surface)
    (surface_at crate0 depot0)
    (surface_at crate1 depot0)
    (surface_at crate2 depot1)

    ;; stacking (which crate is directly on which surface)
    (on crate0 pallet0)
    (on crate1 crate0)
    (on crate2 pallet1)

    ;; clear surfaces/crates (nothing on top)
    (clear crate1)
    (clear crate2)
    (clear pallet2)
    (clear pallet3)

    ;; hoists at places and available
    (at_hoist hoist0 depot0)
    (at_hoist hoist1 depot1)
    (at_hoist hoist2 depot2)
    (at_hoist hoist3 distributor0)
    (hoist_free hoist0)
    (hoist_free hoist1)
    (hoist_free hoist2)
    (hoist_free hoist3)

    ;; trucks at places
    (at_truck truck0 depot2)
    (at_truck truck1 depot1)
    (at_truck truck2 depot2)
  )

  (:goal (and
           (on crate0 pallet1)
           (on crate1 crate0)
           (on crate2 pallet0)
         )
  )
)