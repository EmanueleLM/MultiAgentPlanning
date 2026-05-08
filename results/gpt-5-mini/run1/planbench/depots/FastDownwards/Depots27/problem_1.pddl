(define (problem depots27-problem)
  (:domain depots27)

  (:objects
    ;; places
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    ;; supports (pallets, trucks, crates are all supports)
    pallet0 pallet1 pallet2 pallet3 - pallet
    truck0 truck1 truck2 - truck
    crate0 crate1 crate2 - crate

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist
  )

  (:init
    ;; supports located at places
    (support-at pallet0 depot0)
    (support-at pallet1 depot1)
    (support-at pallet2 depot2)
    (support-at pallet3 distributor0)

    (support-at truck0 depot0)
    (support-at truck1 depot0)
    (support-at truck2 depot1)

    ;; hoists located and available
    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)

    (hoist-available hoist0)
    (hoist-available hoist1)
    (hoist-available hoist2)
    (hoist-available hoist3)

    ;; initial stacking: crate0 on pallet0, crate1 on crate0, crate2 on pallet1
    (on crate0 pallet0)
    (on crate1 crate0)
    (on crate2 pallet1)

    ;; clear/top facts (crate1 and crate2 are clear; pallet2 and pallet3 clear)
    (clear crate1)
    (clear crate2)
    (clear pallet2)
    (clear pallet3)
  )

  (:goal (and
    (on crate0 pallet3)
    (on crate1 pallet0)
  ))
)