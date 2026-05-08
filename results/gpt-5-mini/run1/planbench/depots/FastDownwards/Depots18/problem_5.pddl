(define (problem depots18-problem)
  (:domain depots18)

  (:objects
    depot0 depot1 depot2 distributor0 - place

    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; pallets and crates as distinct surface types
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    ;; note: 'surface' type exists in domain but we enumerate concrete pallets/crates above
  )

  (:init
    ;; truck locations
    (truck_at truck0 depot0)
    (truck_at truck1 depot0)
    (truck_at truck2 distributor0)

    ;; hoists at places and available
    (hoist_at hoist0 depot0)
    (hoist_at hoist1 depot1)
    (hoist_at hoist2 depot2)
    (hoist_at hoist3 distributor0)
    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    ;; pallets located at places
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; crates initially stacked on pallets (crate location is given by the surface it's on)
    (on crate0 pallet1)
    (on crate1 pallet0)
    (on crate2 pallet3)

    ;; clear facts: crates have nothing on them; pallet2 is empty/clear
    (clear crate0)
    (clear crate1)
    (clear crate2)
    (clear pallet2)
  )

  (:goal (and
    (on crate0 crate2)
    (on crate1 pallet2)
    (on crate2 pallet3)
  ))
)