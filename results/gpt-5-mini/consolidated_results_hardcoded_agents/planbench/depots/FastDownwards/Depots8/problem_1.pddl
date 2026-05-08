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
    ;; Surface/locations for pallets
    (surface_at pallet0 depot0)
    (surface_at pallet1 depot1)
    (surface_at pallet2 depot2)
    (surface_at pallet3 distributor0)

    ;; Surface/locations for crates (crate surfaces are located where the crate currently is)
    (surface_at crate0 depot1)
    (surface_at crate1 distributor0)
    (surface_at crate2 depot1)

    ;; Initial placement: crate on surfaces
    (crate_on_surface crate0 pallet1)
    (crate_on_surface crate1 pallet3)
    (crate_on_surface crate2 crate0)

    ;; Crate location facts (consistent with above)
    (crate_at crate0 depot1)
    (crate_at crate1 distributor0)
    (crate_at crate2 depot1)

    ;; Surface clear / crate clear / pallet availability
    ;; Pallets: pallet0 and pallet2 are free; pallet1 and pallet3 have crates on them
    (surface_clear pallet0)
    (pallet_free pallet0)
    (surface_clear pallet2)
    (pallet_free pallet2)

    (not (surface_clear pallet1))
    (not (pallet_free pallet1))
    (not (surface_clear pallet3))
    (not (pallet_free pallet3))

    ;; crate0 has crate2 on it -> crate0 is not clear
    (not (crate_clear crate0))
    ;; crate1 is clear (nothing on it)
    (crate_clear crate1)
    ;; crate2 is clear (nothing on it)
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