(define (problem move-crates-to-target-pallets)
  (:domain hoist-truck-multiagent)

  (:objects
    ;; Places
    depot0 depot1 depot2 distributor0 - place

    ;; Trucks
    truck0 truck1 truck2 - truck

    ;; Hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; Crates
    crate0 crate1 crate2 - crate

    ;; Pallets (treated as objects that can support crates)
    pallet0 pallet1 pallet2 pallet3 - pallet
  )

  (:init
    ;; Allowed places (depots and distributor)
    (place-allowed depot0)
    (place-allowed depot1)
    (place-allowed depot2)
    (place-allowed distributor0)

    ;; Road connectivity: roads exist between every distinct pair of depots/distributors (bidirectional)
    ;; Explicitly enumerate directed edges (solver-friendly)
    (road depot0 depot1) (road depot1 depot0)
    (road depot0 depot2) (road depot2 depot0)
    (road depot0 distributor0) (road distributor0 depot0)
    (road depot1 depot2) (road depot2 depot1)
    (road depot1 distributor0) (road distributor0 depot1)
    (road depot2 distributor0) (road distributor0 depot2)

    ;; Initial locations: hoists
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ;; Hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; Initial locations: trucks
    (at truck0 depot0)
    (at truck1 depot0)
    (at truck2 depot1)

    ;; Pallet locations and clear status
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    (clear pallet0)
    (clear pallet1)
    (clear pallet2)
    ;; pallet3 is occupied under crate0 initially -> not clear (omit clear predicate)

    ;; Crates: locations and stacking
    ;; Stack at distributor0: pallet3 <- crate0 <- crate1 <- crate2 (crate2 top and clear)
    (at crate0 distributor0)
    (at crate1 distributor0)
    (at crate2 distributor0)

    (on crate0 pallet3)
    (on crate1 crate0)
    (on crate2 crate1)

    ;; Clear-ness of crates: only top crate2 is clear initially
    (clear crate2)
    ;; crate1 and crate0 not clear initially (omit clear)

    ;; No crates are reserved initially (omit reserved predicates)
    ;; No hoist is holding anything initially (omit holding and hoist-holding-at)
    ;; No crates are in trucks initially (omit in predicates)
  )

  (:goal (and
    ;; Global goal: crate1 on pallet1 at depot1, crate2 on pallet2 at depot2
    (on crate1 pallet1)
    (at crate1 depot1)

    (on crate2 pallet2)
    (at crate2 depot2)
  ))