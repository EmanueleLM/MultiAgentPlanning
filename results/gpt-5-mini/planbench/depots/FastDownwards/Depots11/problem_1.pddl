(define (problem depots11-instance)
  (:domain depots-hoist)

  (:objects
    ;; crates
    crate0 crate1 crate2 - crate

    ;; pallets
    pallet0 pallet1 pallet2 pallet3 - pallet

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; locations
    depot0 depot1 depot2 distributor0 - location
  )

  (:init
    ;; crates locations (matching the support they are on)
    (at crate0 depot0)
    (at crate1 depot0)
    (at crate2 depot0)

    ;; stacking relationships (top-down)
    (on crate0 pallet0)
    (on crate1 crate0)
    (on crate2 crate1)

    ;; pallets locations
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; hoists locations and availability
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; trucks locations
    (at truck0 distributor0)
    (at truck1 depot0)
    (at truck2 depot0)

    ;; clear-top facts (initial)
    (clear crate2)
    (clear pallet1)
    (clear pallet2)
    (clear pallet3)

    ;; No crates are inside trucks initially.
    ;; pallet0 is not clear initially (crate0 on it).
    ;; crate0 and crate1 are not clear initially (they have crates above them).
  )

  (:goal (and
    (on crate0 pallet1)
    (on crate1 crate2)
    (on crate2 pallet0)
  ))
)