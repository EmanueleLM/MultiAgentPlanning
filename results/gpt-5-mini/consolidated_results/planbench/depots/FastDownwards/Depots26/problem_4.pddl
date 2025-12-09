(define (problem move-crates)
  (:domain transport-hoists-trucks)

  (:objects
    ;; Places
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    ;; Surfaces: pallets and crates
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    ;; Trucks
    truck0 truck1 truck2 - truck

    ;; Hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; Discrete stages (time steps) - provide enough stages for a sequential plan
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - stage
  )

  (:init
    ;; Surface locations (pallets)
    (surface-at pallet0 depot0)
    (surface-at pallet1 depot1)
    (surface-at pallet2 depot2)
    (surface-at pallet3 distributor0)

    ;; Crates are surfaces too and initially located at their places
    (surface-at crate0 depot0)
    (surface-at crate1 depot1)
    (surface-at crate2 distributor0)

    ;; Crates on top of surfaces
    (on crate0 pallet0)
    (on crate1 pallet1)
    (on crate2 pallet3)

    ;; Surface clearances: only pallet2 initially clear
    (clear pallet2)

    ;; Crates (as surfaces) have no crate on top initially
    (clear crate0)
    (clear crate1)
    (clear crate2)

    ;; Truck locations
    (truck-at truck0 depot0)
    (truck-at truck1 depot1)
    (truck-at truck2 depot0)

    ;; Hoist locations
    (hoist-at hoist0 depot0)
    (hoist-at hoist1 depot1)
    (hoist-at hoist2 depot2)
    (hoist-at hoist3 distributor0)

    ;; Hoist availability
    (hoist-available hoist0)
    (hoist-available hoist1)
    (hoist-available hoist2)
    (hoist-available hoist3)

    ;; Road connectivity: explicit complete connectivity among different places (no self-links)
    (road depot0 depot1)
    (road depot0 depot2)
    (road depot0 distributor0)
    (road depot1 depot0)
    (road depot1 depot2)
    (road depot1 distributor0)
    (road depot2 depot0)
    (road depot2 depot1)
    (road depot2 distributor0)
    (road distributor0 depot0)
    (road distributor0 depot1)
    (road distributor0 depot2)

    ;; Stage ordering and initial current stage
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)
    (succ s6 s7)
    (succ s7 s8)
    (succ s8 s9)
    (succ s9 s10)
    (succ s10 s11)
    (succ s11 s12)
    (succ s12 s13)
    (succ s13 s14)
    (succ s14 s15)
    (current s0)
  )

  (:goal (and
    (on crate0 pallet2)
    (on crate1 pallet3)
    (on crate2 pallet1)
  ))
)