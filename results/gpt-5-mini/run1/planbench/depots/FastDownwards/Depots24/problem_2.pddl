(define (problem logistics-stacking-problem)
  (:domain logistics-stacking)
  (:objects
    depot0 depot1 depot2 distributor0 - place

    ;; entity supertypes are implicit via typing in domain; these are the concrete objects
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    crate0 crate1 crate2 - crate
    pallet0 pallet1 pallet2 pallet3 - pallet
  )
  (:init
    ;; Complete connectivity among places (roads allow driving between any two directionally)
    (adjacent depot0 depot1) (adjacent depot1 depot0)
    (adjacent depot0 depot2) (adjacent depot2 depot0)
    (adjacent depot0 distributor0) (adjacent distributor0 depot0)
    (adjacent depot1 depot2) (adjacent depot2 depot1)
    (adjacent depot1 distributor0) (adjacent distributor0 depot1)
    (adjacent depot2 distributor0) (adjacent distributor0 depot2)

    ;; Trucks initial locations
    (at truck0 depot2)
    (at truck1 depot0)
    (at truck2 depot2)

    ;; Hoists initial locations and availability
    (at hoist0 depot0)
    (hoist_available hoist0)
    (at hoist1 depot1)
    (hoist_available hoist1)
    (at hoist2 depot2)
    (hoist_available hoist2)
    (at hoist3 distributor0)
    (hoist_available hoist3)

    ;; Pallets initial locations (pallets are entities too)
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; Crates initial placements (on pallets) and clear on top
    (at crate0 depot0)
    (on crate0 pallet0)
    (clear crate0)

    (at crate1 distributor0)
    (on crate1 pallet3)
    (clear crate1)

    (at crate2 depot2)
    (on crate2 pallet2)
    (clear crate2)

    ;; Pallet clear status: only pallet1 is clear initially (others have crates on them)
    (clear pallet1)
  )
  (:goal (and
    (on crate0 crate2)
    (on crate1 pallet2)
    (on crate2 pallet0)
  ))
)