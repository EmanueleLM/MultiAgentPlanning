(define (problem depots_orchestration_problem)
  (:domain depots_orchestration)

  (:objects
    ;; places
    depot0 depot1 depot2 distributor0 - place

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; pallets
    pallet0 pallet1 pallet2 pallet3 - pallet

    ;; crates
    crate0 crate1 crate2 - crate

    ;; stages (linear progression token chain; provide sufficient depth)
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 - stage
  )

  (:init
    ;; successor (linear time)
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5)
    (succ s5 s6) (succ s6 s7) (succ s7 s8) (succ s8 s9) (succ s9 s10)
    (succ s10 s11) (succ s11 s12) (succ s12 s13) (succ s13 s14)

    ;; initial stage token
    (stage-ready s0)

    ;; initial locations (places)
    (crate-at crate0 depot2)
    (crate-at crate1 depot0)
    (crate-at crate2 depot2)

    (hoist-at hoist0 depot0)
    (hoist-at hoist1 depot1)
    (hoist-at hoist2 depot2)
    (hoist-at hoist3 distributor0)

    (pallet-at pallet0 depot0)
    (pallet-at pallet1 depot1)
    (pallet-at pallet2 depot2)
    (pallet-at pallet3 distributor0)

    (truck-at truck0 depot2)
    (truck-at truck1 depot0)
    (truck-at truck2 depot2)

    ;; hoists are initially available
    (hoist-free hoist0)
    (hoist-free hoist1)
    (hoist-free hoist2)
    (hoist-free hoist3)

    ;; stacking initial facts
    (on-pallet crate0 pallet2)
    (on-pallet crate1 pallet0)
    (on-crate crate2 crate0)

    ;; clearance flags per initial description
    ;; crate1 and crate2 are clear; crate0 is NOT clear because crate2 on it
    (clear-crate crate1)
    (clear-crate crate2)

    ;; pallet1 and pallet3 are clear; pallet0 and pallet2 are not
    (clear-pallet pallet1)
    (clear-pallet pallet3)
  )

  (:goal (and
    (on-pallet crate1 pallet0)
    (on-pallet crate2 pallet3)
  ))
)