(define (problem depots7-problem)
  (:domain depots7)
  (:objects
    ;; places
    depot0 depot1 depot2 distributor0 - place

    ;; supports: pallets and crates (crates are also supports)
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    ;; hoists and trucks
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
  )

  (:init
    ;; support locations (pallets start at given places)
    (support_at pallet0 depot0)
    (support_at pallet1 depot1)
    (support_at pallet2 depot2)
    (support_at pallet3 distributor0)

    ;; initial stacking: crates on pallets
    (on crate0 pallet1)
    (on crate1 pallet3)
    (on crate2 pallet0)

    ;; supports clear status: crates are clear (nothing on them), only pallet2 is initially clear
    (clear crate0)
    (clear crate1)
    (clear crate2)
    (clear pallet2)

    ;; hoists locations and availability
    (hoist_at hoist0 depot0)
    (hoist_at hoist1 depot1)
    (hoist_at hoist2 depot2)
    (hoist_at hoist3 distributor0)

    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    ;; trucks locations
    (truck_at truck0 depot0)
    (truck_at truck1 distributor0)
    (truck_at truck2 depot1)
  )

  (:goal (and
    (on crate0 pallet3)
    (on crate1 crate2)
    (on crate2 pallet1)
  ))
)