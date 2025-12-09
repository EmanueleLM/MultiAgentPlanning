(define (problem depots23-instance)
  (:domain depots23)

  (:objects
    ;; places
    depot0 depot1 depot2 distributor0 - place
    ;; surfaces
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
    ;; hoists and trucks
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
    ;; phases: discrete time steps (allow up to 16 actions)
    ph0 ph1 ph2 ph3 ph4 ph5 ph6 ph7 ph8 ph9 ph10 ph11 ph12 ph13 ph14 ph15 ph16 - phase
  )

  (:init
    ;; phase successors (linear progression)
    (next ph0 ph1) (next ph1 ph2) (next ph2 ph3) (next ph3 ph4) (next ph4 ph5)
    (next ph5 ph6) (next ph6 ph7) (next ph7 ph8) (next ph8 ph9) (next ph9 ph10)
    (next ph10 ph11) (next ph11 ph12) (next ph12 ph13) (next ph13 ph14) (next ph14 ph15)
    (next ph15 ph16)

    ;; start phase
    (current-phase ph0)

    ;; connectivity: roads between any two distinct places (directed)
    (connected depot0 depot1) (connected depot0 depot2) (connected depot0 distributor0)
    (connected depot1 depot0) (connected depot1 depot2) (connected depot1 distributor0)
    (connected depot2 depot0) (connected depot2 depot1) (connected depot2 distributor0)
    (connected distributor0 depot0) (connected distributor0 depot1) (connected distributor0 depot2)

    ;; surfaces at places
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; initial stacking and locations for crates
    (on crate0 pallet0)
    (at crate0 depot0)

    (on crate1 crate0)
    (at crate1 depot0)

    (on crate2 pallet3)
    (at crate2 distributor0)

    ;; clear facts (explicit)
    (clear crate1)
    (clear crate2)
    (clear pallet1)
    (clear pallet2)

    ;; hoist locations and availability
    (hoist-at hoist0 depot0)
    (hoist-at hoist1 depot1)
    (hoist-at hoist2 depot2)
    (hoist-at hoist3 distributor0)
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; truck initial locations
    (truck-at truck0 distributor0)
    (truck-at truck1 depot1)
    (truck-at truck2 distributor0)
  )

  (:goal (and
    (on crate0 pallet2)
    (on crate1 crate0)
    (on crate2 pallet0)
  ))
)