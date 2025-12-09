(define (problem depots22-problem)
  (:domain hoist-truck-warehouse)
  (:objects
    depot0 depot1 depot2 distributor0 - place
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 - stage
  )

  (:init
    ;; surfaces locations
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    (on crate0 pallet1)
    (at crate0 depot1)

    (on crate1 pallet2)
    (at crate1 depot2)

    (on crate2 pallet3)
    (at crate2 distributor0)

    ;; clear facts (as provided)
    (clear crate0)
    (clear crate1)
    (clear crate2)
    (clear pallet0)

    ;; hoist locations and availability
    (hoist-at hoist0 depot0)
    (hoist-at hoist1 depot1)
    (hoist-at hoist2 depot2)
    (hoist-at hoist3 distributor0)

    (hoist-free hoist0)
    (hoist-free hoist1)
    (hoist-free hoist2)
    (hoist-free hoist3)

    ;; trucks
    (truck-at truck0 distributor0)
    (truck-at truck1 depot1)
    (truck-at truck2 depot1)

    ;; stages and ordering (discrete time progression)
    (current s0)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5)
    (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10)
    (next s10 s11) (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15)
    (next s15 s16) (next s16 s17) (next s17 s18) (next s18 s19) (next s19 s20)
  )

  (:goal (and
    (on crate0 crate1)
    (on crate1 pallet0)
  ))
)