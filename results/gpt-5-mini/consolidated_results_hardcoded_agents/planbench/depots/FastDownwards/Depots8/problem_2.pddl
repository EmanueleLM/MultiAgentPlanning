(define (problem load-and-deliver)
  (:domain depot-distributor)

  (:objects
    ;; locations
    depot0 depot1 depot2 distributor0 - location

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; pallets and crates (surfaces)
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    ;; discrete steps for explicit ordering (enough steps to sequence actions)
    step0 step1 step2 step3 step4 step5 step6 step7 step8 step9 step10 step11 step12 - step
  )

  (:init
    ;; surface locations for pallets (pallets are fixed surfaces at their places)
    (surface_at pallet0 depot0)
    (surface_at pallet1 depot1)
    (surface_at pallet2 depot2)
    (surface_at pallet3 distributor0)

    ;; initial surface locations for crates (they are surfaces too)
    (surface_at crate0 depot1)
    (surface_at crate1 distributor0)
    (surface_at crate2 depot1)

    ;; initial placement: crate on surfaces
    (crate_on_surface crate0 pallet1)
    (crate_on_surface crate1 pallet3)
    (crate_on_surface crate2 crate0)

    ;; crate location facts (consistent with above)
    (crate_at crate0 depot1)
    (crate_at crate1 distributor0)
    (crate_at crate2 depot1)

    ;; surface clear facts: only list positives (lack of a fact implies not true)
    ;; Pallets: pallet0 and pallet2 are free
    (surface_clear pallet0)
    (surface_clear pallet2)

    ;; Crates: crate1 and crate2 have nothing on top
    (surface_clear crate2)
    (crate_clear crate1)
    (crate_clear crate2)

    ;; hoists locations
    (hoist_at hoist0 depot0)
    (hoist_at hoist1 depot1)
    (hoist_at hoist2 depot2)
    (hoist_at hoist3 distributor0)

    ;; hoists availability
    (hoist_free hoist0)
    (hoist_free hoist1)
    (hoist_free hoist2)
    (hoist_free hoist3)

    ;; trucks locations
    (truck_at truck0 depot1)
    (truck_at truck1 depot2)
    (truck_at truck2 distributor0)

    ;; stage ordering (successor relation)
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

    ;; initial current stage
    (current step0)
  )

  (:goal (and
    ;; Goal: crate0 on pallet0 and crate2 on pallet1
    (crate_on_surface crate0 pallet0)
    (crate_on_surface crate2 pallet1)
  ))
)