(define (problem depots-revised-staged-problem)
  (:domain depots-revised-staged)

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

    ;; discrete stages to enforce contiguous progression
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 - stage
  )

  (:init
    ;; stage chain and initial stage token
    (current-stage s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)
    (next s5 s6)
    (next s6 s7)
    (next s7 s8)
    (next s8 s9)
    (next s9 s10)
    (next s10 s11)
    (next s11 s12)
    (next s12 s13)
    (next s13 s14)
    (next s14 s15)
    (next s15 s16)
    (next s16 s17)
    (next s17 s18)
    (next s18 s19)
    (next s19 s20)

    ;; surface locations (pallets at places)
    (surface-at pallet0 depot0)
    (surface-at pallet1 depot1)
    (surface-at pallet2 depot2)
    (surface-at pallet3 distributor0)

    ;; crate stacking (initial)
    (on crate0 pallet1)
    (crate-clear crate0)

    (on crate1 pallet2)
    (crate-clear crate1)

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

    ;; hoist availability
    (hoist-available hoist0)
    (hoist-available hoist1)
    (hoist-available hoist2)
    (hoist-available hoist3)

    ;; only pallet3 is initially clear (others have crates atop)
    (surface-clear pallet3)
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