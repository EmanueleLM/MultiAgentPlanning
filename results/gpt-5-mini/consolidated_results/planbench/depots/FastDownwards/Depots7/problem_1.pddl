(define (problem depots7-instance)
  (:domain depots-logistics)
  (:objects
    depot0 depot1 depot2 distributor0 - place
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - stage
  )

  (:init
    ;; Stage chain and initial current stage
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5)
    (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10)
    (next s10 s11) (next s11 s12) (next s12 s13) (next s13 s14)
    (next s14 s15) (next s15 s16)
    (current s0)

    ;; Places of pallets (pallets are stationary)
    (at-pallet pallet0 depot0)
    (at-pallet pallet1 depot1)
    (at-pallet pallet2 depot2)
    (at-pallet pallet3 distributor0)

    ;; Initial crate placements (also assert crate at place)
    (on-pallet crate0 pallet1)
    (at-crate crate0 depot1)

    (on-pallet crate1 pallet3)
    (at-crate crate1 distributor0)

    (on-pallet crate2 pallet0)
    (at-crate crate2 depot0)

    ;; Clear status: crates are clear initially
    (clear-crate crate0)
    (clear-crate crate1)
    (clear-crate crate2)

    ;; Pallet clearance: only pallet2 is explicitly clear (others with crates are not)
    (clear-pallet pallet2)

    ;; Hoists positions and availability
    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)

    (hoist-available hoist0)
    (hoist-available hoist1)
    (hoist-available hoist2)
    (hoist-available hoist3)

    ;; Trucks positions
    (at-truck truck0 depot0)
    (at-truck truck1 distributor0)
    (at-truck truck2 depot1)

    ;; No crates initially in trucks (in-truck facts absent)

    ;; Identity facts for crates to forbid self-placement (same ?x ?x holds)
    (same crate0 crate0)
    (same crate1 crate1)
    (same crate2 crate2)
  )

  (:goal (and
    (on-pallet crate0 pallet3)
    (on-crate  crate1 crate2)
    (on-pallet crate2 pallet1)
  ))
)