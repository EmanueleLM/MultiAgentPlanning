(define (problem hoist-truck-problem)
  (:domain hoist-truck-domain)

  (:objects
    ;; crates
    crate0 crate1 crate2 - crate

    ;; pallets (pallet0..pallet3)
    pallet0 pallet1 pallet2 pallet3 - pallet

    ;; truck and hoist
    truck0 - truck
    hoist0 - hoist

    ;; locations
    loc0 loc1 loc2 loc3 - loc
  )

  (:init
    ;; Locations are anchored to themselves so supports of type loc can be tested by co-location
    (at loc0 loc0)
    (at loc1 loc1)
    (at loc2 loc2)
    (at loc3 loc3)

    ;; initial placements of pallets (assumed fixed until moved by domain actions; domain provides no pallet-move)
    (at pallet0 loc0)
    (at pallet1 loc1)
    (at pallet2 loc2)
    (at pallet3 loc3)

    ;; initial positions of vehicles
    (at truck0 loc0)
    (at hoist0 loc0)

    ;; initial crate placements (assumption: crates start on ground/locations)
    (on crate0 loc1)
    (on crate1 loc0)
    (on crate2 loc0)

    ;; hoist initially free
    (free-hoist hoist0)

    ;; all pallets start empty (single-crate capacity enforced by free-pallet)
    (free-pallet pallet0)
    (free-pallet pallet1)
    (free-pallet pallet2)
    (free-pallet pallet3)
  )

  (:goal (and
           (on crate0 pallet0)
           (on crate1 pallet2)
           (on crate2 pallet3)
          ))
)