(define (problem depots12-instance)
  (:domain depots-logistics)
  (:objects
    ;; places
    depot0 depot1 depot2 distributor0 - place

    ;; pallets (surfaces)
    pallet0 pallet1 pallet2 pallet3 - pallet

    ;; crates
    crate0 crate1 crate2 - crate

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; discrete time steps
    step0 step1 step2 step3 step4 step5 step6 step7 step8 step9 step10 step11 step12 - time
  )

  (:init
    ;; trucks initial locations
    (truck-at truck0 depot1)
    (truck-at truck1 depot0)
    (truck-at truck2 depot1)

    ;; hoists locations
    (hoist-at hoist0 depot0)
    (hoist-at hoist1 depot1)
    (hoist-at hoist2 depot2)
    (hoist-at hoist3 distributor0)

    ;; pallets located at places
    (surface-at pallet0 depot0)
    (surface-at pallet1 depot1)
    (surface-at pallet2 depot2)
    (surface-at pallet3 distributor0)

    ;; crate placements and place membership (explicit crate-at facts to enforce place occupancy semantics)
    (on crate0 pallet2)       ;; crate0 on pallet2 (depot2)
    (crate-at crate0 depot2)

    (on crate1 pallet3)       ;; crate1 on pallet3 (distributor0)
    (crate-at crate1 distributor0)

    (on-crate crate2 crate1)  ;; crate2 on crate1 (distributor0)
    (crate-at crate2 distributor0)

    ;; clear facts consistent with stacks and surfaces
    (clear-pallet pallet0)
    (clear-pallet pallet1)
    ;; pallet2 and pallet3 are not clear because they have crates on them (omitted clear-pallet)
    (clear-crate crate0)
    (clear-crate crate2)
    ;; crate1 is not clear (crate2 is on it)

    ;; hoist availability
    (hoist-available hoist0)
    (hoist-available hoist1)
    (hoist-available hoist2)
    (hoist-available hoist3)

    ;; time progression chain (actions advance the single current stage)
    (current step0)
    (next step0 step1)
    (next step1 step2)
    (next step2 step3)
    (next step3 step4)
    (next step4 step5)
    (next step5 step6)
    (next step6 step7)
    (next step7 step8)
    (next step8 step9)
    (next step9 step10)
    (next step10 step11)
    (next step11 step12)
  )

  (:goal (and
    (on-crate crate0 crate1)  ;; crate0 on crate1
    (on crate1 pallet3)       ;; crate1 on pallet3
    (on crate2 pallet1)       ;; crate2 on pallet1
  ))
)