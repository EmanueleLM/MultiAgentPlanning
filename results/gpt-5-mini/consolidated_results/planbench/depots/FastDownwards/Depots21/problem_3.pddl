(define (problem logistics-multiagent-problem)
  (:domain logistics-multiagent)

  (:objects
    depot0 depot1 depot2 distributor0 - place

    truck0 truck1 truck2 - truck

    hoist0 hoist1 hoist2 hoist3 - hoist

    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    ;; steps for explicit stage progression (enough steps to sequence actions)
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 - step
  )

  (:init
    ;; step successor chain and initial current step
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5) (next s5 s6)
    (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12)
    (next s12 s13) (next s13 s14) (next s14 s15) (next s15 s16) (next s16 s17)
    (current_step s0)

    ;; pallets locations (pallet surfaces are located at places)
    (surface_at pallet3 distributor0)
    (surface_at pallet1 depot1)
    (surface_at pallet0 depot0)
    (surface_at pallet2 depot2)

    ;; crate surfaces: crate0 is at distributor0 as a surface supporting crate2
    (surface_at crate0 distributor0)

    ;; crate stack configuration
    (crate_on crate0 pallet3)          ;; crate0 sits on pallet3 at distributor0
    (crate_on crate2 crate0)           ;; crate2 stacked on crate0 at distributor0
    (crate_on crate1 pallet1)          ;; crate1 sits on pallet1 at depot1

    ;; clear/top predicates (consistent with stacking above)
    (surface_clear pallet0)
    (surface_clear pallet2)

    (crate_clear crate2)
    (crate_clear crate1)
    ;; pallet1 and pallet3 are not clear; crate0 not clear

    ;; Truck and hoist locations
    (truck_at truck0 depot0)
    (truck_at truck1 depot0)
    (truck_at truck2 depot2)

    (hoist_at hoist0 depot0)
    (hoist_at hoist1 depot1)
    (hoist_at hoist2 depot2)
    (hoist_at hoist3 distributor0)

    ;; hoists availability
    (hoist_free hoist0)
    (hoist_free hoist1)
    (hoist_free hoist2)
    (hoist_free hoist3)
  )

  (:goal (and
    (crate_on crate0 pallet2)
    (crate_on crate1 pallet0)
    (crate_on crate2 crate1)
  ))
)