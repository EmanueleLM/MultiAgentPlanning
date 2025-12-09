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

    ;; time stages (shortened chain to reduce init facts)
    step0 step1 step2 step3 step4 step5 step6 - time
  )

  (:init
    ;; trucks
    (truck-at truck0 depot1)
    (truck-at truck1 depot0)
    (truck-at truck2 depot1)

    ;; hoists
    (hoist-at hoist0 depot0)
    (hoist-at hoist1 depot1)
    (hoist-at hoist2 depot2)
    (hoist-at hoist3 distributor0)

    ;; pallets at places
    (surface-at pallet0 depot0)
    (surface-at pallet1 depot1)
    (surface-at pallet2 depot2)
    (surface-at pallet3 distributor0)

    ;; crates initially stacked and located (only stacking relations needed)
    (on crate0 pallet2)       ;; crate0 on pallet2 (depot2)
    (on crate1 pallet3)       ;; crate1 on pallet3 (distributor0)
    (on-crate crate2 crate1)  ;; crate2 on crate1

    ;; clear predicates (only stateful clear facts; others implied by absence)
    (clear-pallet pallet0)
    (clear-pallet pallet1)
    (clear-crate crate0)
    (clear-crate crate2)

    ;; hoist availability
    (hoist-available hoist0)
    (hoist-available hoist1)
    (hoist-available hoist2)
    (hoist-available hoist3)

    ;; stage progression (shortened)
    (current step0)
    (next step0 step1)
    (next step1 step2)
    (next step2 step3)
    (next step3 step4)
    (next step4 step5)
    (next step5 step6)
  )

  (:goal (and
    (on-crate crate0 crate1)  ;; crate0 on crate1
    (on crate1 pallet3)       ;; crate1 on pallet3
    (on crate2 pallet1)       ;; crate2 on pallet1
  ))
)