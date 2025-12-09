(define (problem depots23-instance)
  (:domain depots23)

  (:objects
    ;; places
    depot0 depot1 depot2 distributor0 - place
    ;; surfaces
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
    ;; hoists and trucks
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
    ;; phases (cycle: lift -> load -> drive -> unload -> drop -> lift)
    ph_lift ph_load ph_drive ph_unload ph_drop - phase
  )

  (:init
    ;; phase cycle
    (next ph_lift ph_load)
    (next ph_load ph_drive)
    (next ph_drive ph_unload)
    (next ph_unload ph_drop)
    (next ph_drop ph_lift)
    ;; start in lift phase
    (current-phase ph_lift)

    ;; initial positions: pallets at places
    (surface-at pallet0 depot0)
    (surface-at pallet1 depot1)
    (surface-at pallet2 depot2)
    (surface-at pallet3 distributor0)

    ;; initial stacking: crates on surfaces as stated and crates have surface-at place as well
    (on crate0 pallet0)
    (surface-at crate0 depot0)

    (on crate1 crate0)
    (surface-at crate1 depot0)

    (on crate2 pallet3)
    (surface-at crate2 distributor0)

    ;; initial clear facts (explicit)
    (clear crate1)
    (clear crate2)
    (clear pallet1)
    (clear pallet2)
    ;; surfaces that have something on them are not clear (implicitly false since not listed)
    ;; crate0 is not clear (crate1 on it), pallet0 not clear (crate0 on it), pallet3 not clear (crate2 on it)

    ;; hoist locations and availability
    (hoist-at hoist0 depot0)
    (hoist-at hoist1 depot1)
    (hoist-at hoist2 depot2)
    (hoist-at hoist3 distributor0)
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; truck initial locations
    (truck-at truck0 distributor0)
    (truck-at truck1 depot1)
    (truck-at truck2 distributor0)

    ;; trucks initially empty: represented implicitly by absence of in-truck facts
    ;; no hoist is lifting initially: represented implicitly by absence of lifting facts
  )

  (:goal (and
    (on crate0 pallet2)
    (on crate1 crate0)
    (on crate2 pallet0)
  ))
)