(define (problem depots-revised-problem)
  (:domain depots-revised)

  (:objects
    ;; places
    depot0 depot1 depot2 distributor0 - place

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; crates and pallets (pallets and crates are surfaces)
    crate0 crate1 crate2 - crate
    pallet0 pallet1 pallet2 pallet3 - pallet

    ;; steps (explicit ordered stages) - provide a linear timeline long enough for plan execution
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 - step
  )

  (:init
    ;; surface locations
    (surface-at pallet0 depot0)
    (surface-at pallet1 depot1)
    (surface-at pallet2 depot2)
    (surface-at pallet3 distributor0)

    ;; crate positions and stacking (initial)
    (crate-at crate0 depot1)
    (on crate0 pallet1)
    (crate-clear crate0)

    (crate-at crate1 depot2)
    (on crate1 pallet2)
    (crate-clear crate1)

    (crate-at crate2 depot0)
    (on crate2 pallet0)
    (crate-clear crate2)

    ;; hoist and truck locations
    (hoist-at hoist0 depot0)
    (hoist-at hoist1 depot1)
    (hoist-at hoist2 depot2)
    (hoist-at hoist3 distributor0)

    (truck-at truck0 depot1)
    (truck-at truck1 depot2)
    (truck-at truck2 distributor0)

    ;; availability
    (hoist-available hoist0)
    (hoist-available hoist1)
    (hoist-available hoist2)
    (hoist-available hoist3)

    ;; surface clear status: only pallet3 is initially clear per specification
    (surface-clear pallet3)

    ;; explicit step ordering chain; s0 is the only initially done step (timeline head)
    (step-next s0 s1)
    (step-next s1 s2)
    (step-next s2 s3)
    (step-next s3 s4)
    (step-next s4 s5)
    (step-next s5 s6)
    (step-next s6 s7)
    (step-next s7 s8)
    (step-next s8 s9)
    (step-next s9 s10)
    (step-next s10 s11)

    (step-done s0)
  )

  (:goal
    (and
      ;; terminal placement goals exactly as specified
      (on crate0 pallet2)
      (on crate1 pallet1)
      (on crate2 pallet0)
    )
  )
)