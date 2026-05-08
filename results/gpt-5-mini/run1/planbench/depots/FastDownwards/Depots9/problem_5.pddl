(define (problem move-crates-problem)
  (:domain hoist-truck-domain)

  (:objects
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
    crate0 crate1 crate2 - crate
    pallet0 pallet1 pallet2 pallet3 - pallet
    depot0 depot1 depot2 - depot
    distributor0 - distributor
  )

  (:init
    ;; hoist locations
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ;; pallet locations
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; truck locations
    (at truck0 distributor0)
    (at truck1 depot2)
    (at truck2 depot0)

    ;; crates on pallets and located at corresponding places
    (on crate0 pallet1)
    (at crate0 depot1)

    (on crate1 pallet2)
    (at crate1 depot2)

    (on crate2 pallet3)
    (at crate2 distributor0)

    ;; hoists are initially available
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; clearance: crates are clear (nothing stacked on them)
    (clear-crate crate0)
    (clear-crate crate1)
    (clear-crate crate2)

    ;; only pallet0 is initially empty on top
    (clear-surface pallet0)
  )

  (:goal (and
           (on crate0 pallet1)
           (on crate1 pallet2)
           (on crate2 pallet0)
         )
  )
)