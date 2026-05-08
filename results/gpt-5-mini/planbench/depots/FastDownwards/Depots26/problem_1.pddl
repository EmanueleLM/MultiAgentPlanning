(define (problem depots26-instance)
  (:domain depots-hoist-truck)

  (:objects
    ;; places
    depot0 depot1 depot2 distributor0 - place

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; pallets (surfaces)
    pallet0 pallet1 pallet2 pallet3 - pallet

    ;; crates (surfaces)
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; locations: hoists
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ;; locations: pallets
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; trucks locations
    (at truck0 depot0)
    (at truck1 depot1)
    (at truck2 depot0)

    ;; crates initially on pallets and explicitly at the same places
    (on crate0 pallet0)
    (at crate0 depot0)

    (on crate1 pallet1)
    (at crate1 depot1)

    (on crate2 pallet3)
    (at crate2 distributor0)

    ;; clear tokens: crates are top-of-stack when listed; pallet2 is empty/clear
    (clear crate0)
    (clear crate1)
    (clear crate2)
    (clear pallet2)

    ;; hoists available
    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)
  )

  (:goal (and
    (on crate0 pallet2)
    (on crate1 pallet3)
    (on crate2 pallet1)
  ))
)