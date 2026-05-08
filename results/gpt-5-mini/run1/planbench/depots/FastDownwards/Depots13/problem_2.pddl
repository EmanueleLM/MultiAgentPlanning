(define (problem depots13-problem)
  (:domain depots13)

  (:objects
    depot0 depot1 depot2 distributor0 - place

    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
  )

  (:init
    ;; roads (bidirectional)
    (connected depot0 depot1) (connected depot1 depot0)
    (connected depot0 depot2) (connected depot2 depot0)
    (connected depot0 distributor0) (connected distributor0 depot0)
    (connected depot1 depot2) (connected depot2 depot1)
    (connected depot1 distributor0) (connected distributor0 depot1)
    (connected depot2 distributor0) (connected distributor0 depot2)

    ;; surfaces located at places
    (surface_at pallet0 depot0)
    (surface_at pallet1 depot1)
    (surface_at pallet2 depot2)
    (surface_at pallet3 distributor0)

    ;; crates on pallets initially
    (on_surface crate0 pallet2)
    (on_surface crate1 pallet0)
    (on_surface crate2 pallet1)

    ;; surface occupancy flags: pallet3 is empty; others implicitly occupied by listed on_surface facts
    (surface_empty pallet3)

    ;; trucks initial positions and emptiness
    (at truck0 depot2)
    (at truck1 distributor0)
    (at truck2 distributor0)
    (truck_empty truck0)
    (truck_empty truck1)
    (truck_empty truck2)

    ;; hoists initial positions and availability
    (at_hoist hoist0 depot0)
    (at_hoist hoist1 depot1)
    (at_hoist hoist2 depot2)
    (at_hoist hoist3 distributor0)
    (hoist_free hoist0)
    (hoist_free hoist1)
    (hoist_free hoist2)
    (hoist_free hoist3)

    ;; crates are clear (no crate on top) initially
    (clear_crate crate0)
    (clear_crate crate1)
    (clear_crate crate2)
  )

  (:goal (and
           (on_surface crate0 pallet1)
           (on_crate crate2 crate0)
         )
  )
)