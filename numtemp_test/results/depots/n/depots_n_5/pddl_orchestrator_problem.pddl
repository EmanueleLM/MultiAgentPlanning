(define (problem deliver-goal)
  (:domain multiagent-hoist-truck)
  (:objects
    depot0 distributor0 distributor1 - place

    truck0 truck1 - truck
    hoist0 hoist1 hoist2 - hoist

    pallet0 pallet1 pallet2 pallet3 pallet4 pallet5 - pallet

    crate0 crate1 crate2 crate3 crate4 crate5 crate6 crate7 crate8 crate9 crate10 crate11 crate12 crate13 crate14 - crate

    ;; treat hoists/trucks/pallets/crates as objects for the generic at predicate
    truck0_obj truck1_obj hoist0_obj hoist1_obj hoist2_obj - object
    pallet0_obj pallet1_obj pallet2_obj pallet3_obj pallet4_obj pallet5_obj - object
    crate0_obj crate1_obj crate2_obj crate3_obj crate4_obj crate5_obj crate6_obj crate7_obj crate8_obj crate9_obj crate10_obj crate11_obj crate12_obj crate13_obj crate14_obj - object
  )

  ;; Initial state
  (:init
    ;; Place locations (use both object-level at and convenience predicates)
    (at truck0_obj distributor0)
    (truck-at truck0 distributor0)
    (at truck1_obj distributor0)
    (truck-at truck1 distributor0)

    (at hoist0_obj depot0)
    (hoist-at hoist0 depot0)
    (at hoist1_obj distributor0)
    (hoist-at hoist1 distributor0)
    (at hoist2_obj distributor1)
    (hoist-at hoist2 distributor1)

    ;; Pallets at places
    (at pallet0_obj depot0)
    (at pallet5_obj depot0)
    (at pallet1_obj distributor0)
    (at pallet4_obj distributor0)
    (at pallet2_obj distributor1)
    (at pallet3_obj distributor1)

    ;; Crates at places (top-level positions as given)
    (at crate1_obj depot0)
    (at crate2_obj depot0)
    (at crate8_obj depot0)

    (at crate3_obj distributor0)
    (at crate6_obj distributor0)
    (at crate7_obj distributor0)
    (at crate9_obj distributor0)
    (at crate11_obj distributor0)
    (at crate12_obj distributor0)
    (at crate14_obj distributor0)

    (at crate0_obj distributor1)
    (at crate4_obj distributor1)
    (at crate5_obj distributor1)
    (at crate10_obj distributor1)
    (at crate13_obj distributor1)

    ;; on relations (crate -> supporting object (crate or pallet))
    (on crate4 crate0)
    (on crate2 crate1)
    (on crate6 crate3)
    (on crate13 crate4)
    (on crate10 crate5)
    (on crate7 crate6)
    (on crate9 crate7)
    (on crate14 crate9)
    (on crate12 crate11)
    (on crate1 pallet0)
    (on crate3 pallet1)
    (on crate0 pallet2)
    (on crate5 pallet3)
    (on crate11 pallet4)
    (on crate8 pallet5)

    ;; Clear surfaces initially (as given)
    (clear crate2)
    (clear crate8)
    (clear crate10)
    (clear crate12)
    (clear crate13)
    (clear crate14)

    ;; Hoist availability
    (hoist-available hoist0)
    (hoist-available hoist1)
    (hoist-available hoist2)

    ;; No crate is initially in any truck
    ;; current loads and limits (functions)
    (= (current-load truck0) 0)
    (= (load-limit truck0) 314)

    (= (current-load truck1) 0)
    (= (load-limit truck1) 246)

    ;; crate weights
    (= (weight crate0) 13)
    (= (weight crate1) 94)
    (= (weight crate2) 45)
    (= (weight crate3) 26)
    (= (weight crate4) 96)
    (= (weight crate5) 74)
    (= (weight crate6) 68)
    (= (weight crate7) 71)
    (= (weight crate8) 81)
    (= (weight crate9) 51)
    (= (weight crate10) 94)
    (= (weight crate11) 36)
    (= (weight crate12) 70)
    (= (weight crate13) 66)
    (= (weight crate14) 55)

    ;; fuel cost starts at 0
    (= (fuel-cost) 0)
  )

  ;; Goal: required on-relations
  (:goal (and
    (on crate9 crate1)
    (on crate1 crate2)
    (on crate13 crate3)
    (on crate0 crate5)
    (on crate4 crate6)
    (on crate2 crate10)
    (on crate12 crate14)
    (on crate3 pallet0)
    (on crate11 pallet1)
    (on crate10 pallet2)
    (on crate14 pallet3)
    (on crate6 pallet4)
    (on crate5 pallet5)
  ))

  (:metric minimize (fuel-cost))
)