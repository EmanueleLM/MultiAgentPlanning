(define (problem depot-hoist-truck-problem)
  (:domain depot-hoist-truck)

  (:objects
    ;; places
    depot0 depot1 depot2 distributor0 - place

    ;; surfaces / pallets
    pallet0 pallet1 pallet2 pallet3 - surface

    ;; crates
    crate0 crate1 crate2 - crate

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; explicit discrete stages (sufficiently many for any feasible serial plan)
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 - stage
  )

  (:init
    ;; surfaces fixed at places
    (at-surface pallet0 depot0)
    (at-surface pallet1 depot1)
    (at-surface pallet2 depot2)
    (at-surface pallet3 distributor0)

    ;; crates initially on surfaces and clear
    (on crate0 pallet2)
    (on crate1 pallet3)
    (on crate2 pallet1)

    (clear-crate crate0)
    (clear-crate crate1)
    (clear-crate crate2)

    ;; surface occupancy: only pallet0 is empty initially
    (clear-surface pallet0)

    ;; trucks at places
    (at-truck truck0 depot1)
    (at-truck truck1 depot1)
    (at-truck truck2 depot1)

    ;; hoists at places and available
    (at-hoist hoist0 depot0)
    (available hoist0)

    (at-hoist hoist1 depot1)
    (available hoist1)

    (at-hoist hoist2 depot2)
    (available hoist2)

    (at-hoist hoist3 distributor0)
    (available hoist3)

    ;; stage chain and initial current stage (enforces serial action succession)
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5)
    (succ s5 s6) (succ s6 s7) (succ s7 s8) (succ s8 s9) (succ s9 s10)
    (succ s10 s11) (succ s11 s12) (succ s12 s13) (succ s13 s14) (succ s14 s15)
    (succ s15 s16) (succ s16 s17) (succ s17 s18) (succ s18 s19) (succ s19 s20)

    (current s0)
  )

  (:goal (and
    (on crate0 pallet0)
    (on crate1 pallet1)
    (on crate2 pallet3)
  ))
)