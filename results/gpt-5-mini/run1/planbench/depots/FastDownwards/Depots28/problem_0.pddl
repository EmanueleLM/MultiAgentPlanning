(define (problem crate-stacking-problem)
  (:domain crate-stacking)
  (:objects
    depot0 depot1 depot2 distributor0 - place
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; Truck initial locations (driver input)
    (truck-at truck0 depot1)
    (truck-at truck1 depot1)
    (truck-at truck2 depot0)

    ;; Hoist initial locations and availability (hoist_operator input)
    (hoist-at hoist0 depot0)
    (hoist-at hoist1 depot1)
    (hoist-at hoist2 depot2)
    (hoist-at hoist3 distributor0)
    (hoist-available hoist0)
    (hoist-available hoist1)
    (hoist-available hoist2)
    (hoist-available hoist3)

    ;; Surfaces and object placements (hoist_operator input)
    ;; pallet0 at depot0, initially clear
    (obj-at pallet0 depot0)
    (clear pallet0)
    ;; pallet1 at depot1 with crate2 on it (pallet1 not clear)
    (obj-at pallet1 depot1)
    (obj-at crate2 depot1)
    (on crate2 pallet1)
    (not (clear pallet1))
    (clear crate2)
    ;; pallet2 at depot2 clear
    (obj-at pallet2 depot2)
    (clear pallet2)
    ;; pallet3 at distributor0 with crate0 on it and crate1 on crate0 (stack: pallet3 <- crate0 <- crate1)
    (obj-at pallet3 distributor0)
    (obj-at crate0 distributor0)
    (obj-at crate1 distributor0)
    (on crate0 pallet3)
    (on crate1 crate0)
    (not (clear pallet3))
    (not (clear crate0))
    (clear crate1)

    ;; No crate is in any truck at start
    ;; Hoist lifting none at start: ensured by hoist-available facts

    ;; Driver-committed sequence flags are false initially (implicitly absent).
    ;; Placed flags absent initially.
  )

  (:goal
    (and
      ;; Mandated final stack: pallet0 <- crate2 <- crate0 <- crate1 at depot0
      (obj-at pallet0 depot0)
      (obj-at crate2 depot0)
      (obj-at crate0 depot0)
      (obj-at crate1 depot0)
      (on crate2 pallet0)
      (on crate0 crate2)
      (on crate1 crate0)

      ;; Driver's asserted final truck positions (driver input -> enforced terminal conditions)
      (truck-at truck0 depot0)
      (truck-at truck1 depot0)
      (truck-at truck2 depot0)

      ;; Enforce driver-committed drive ordering was performed (ensures the specified ordered drives occurred)
      (done-drive-t0)
      (done-drive-t1)

      ;; All hoists returned available as the hoist_operator expects after completion
      (hoist-available hoist0)
      (hoist-available hoist1)
      (hoist-available hoist2)
      (hoist-available hoist3)
    )
  )
)