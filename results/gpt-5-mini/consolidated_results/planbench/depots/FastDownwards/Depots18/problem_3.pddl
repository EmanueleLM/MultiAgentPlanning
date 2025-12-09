(define (problem depots-hoist-trucks-problem)
  (:domain depots-hoist-trucks)

  (:objects
    ; Places
    depot0 depot1 depot2 distributor0 - place

    ; Pallets
    pallet0 pallet1 pallet2 pallet3 - pallet

    ; Crates
    crate0 crate1 crate2 - crate

    ; Hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ; Trucks
    truck0 truck1 truck2 - truck

    ; Timepoints (discrete global time). Planner must advance current time via actions.
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 - timepoint
  )

  (:init
    ; Timepoint chain and initial current time
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5)
    (succ s5 s6) (succ s6 s7) (succ s7 s8) (succ s8 s9) (succ s9 s10)
    (succ s10 s11) (succ s11 s12) (succ s12 s13) (succ s13 s14) (succ s14 s15)
    (succ s15 s16) (succ s16 s17) (succ s17 s18) (succ s18 s19) (succ s19 s20)
    (current s0)

    ; Locations of pallets
    (at-pallet pallet0 depot0)
    (at-pallet pallet1 depot1)
    (at-pallet pallet2 depot2)
    (at-pallet pallet3 distributor0)

    ; Pallet clearness
    (clear-pallet pallet2)

    ; Locations of crates (each crate has explicit place and support)
    (at-crate crate0 depot1)
    (on-pallet crate0 pallet1)

    (at-crate crate1 depot0)
    (on-pallet crate1 pallet0)

    (at-crate crate2 distributor0)
    (on-pallet crate2 pallet3)

    ; Crates that are clear on top (no crate on top)
    (clear-crate crate0)
    (clear-crate crate1)
    (clear-crate crate2)

    ; Hoists at places and available
    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)

    (hoist-available hoist0)
    (hoist-available hoist1)
    (hoist-available hoist2)
    (hoist-available hoist3)

    ; Trucks initial positions
    (at-truck truck0 depot0)
    (at-truck truck1 depot0)
    (at-truck truck2 distributor0)
  )

  (:goal (and
           ;; Final required placements (terminal conditions)
           (on-crate crate0 crate2)
           (on-pallet crate1 pallet2)
           (on-pallet crate2 pallet3)
           ;; Require plan to reach final declared timepoint to force progression and terminality
           (current s20)
         )
  )
)