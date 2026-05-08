(define (problem depots_repaired_problem)
  (:domain depots_repaired)

  (:objects
    depot0 depot1 depot2 distributor0
    truck0 truck1 truck2
    hoist0 hoist1 hoist2 hoist3
    pallet0 pallet1 pallet2 pallet3
    crate0 crate1 crate2
  )

  (:init
    ;; trucks
    (truck_at truck0 depot0)
    (truck_at truck1 depot2)
    (truck_at truck2 truck2) ;; placeholder to avoid untyped mismatch removed below
    ;; Correction: truck2 is at depot1 as specified
    (not (truck_at truck2 depot2))

    ;; fix explicit locations consistent with statement:
    (truck_at truck2 depot1)

    ;; hoists
    (hoist_at hoist0 depot0)
    (hoist_at hoist1 depot1)
    (hoist_at hoist2 depot2)
    (hoist_at hoist3 distributor0)

    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    ;; surfaces (pallets are surfaces located at places)
    (surface_at pallet0 depot0)
    (surface_at pallet1 depot1)
    (surface_at pallet2 depot2)
    (surface_at pallet3 distributor0)

    ;; clear surfaces (nothing on top)
    (clear pallet0)
    (clear pallet2)

    ;; stacking: crates are surfaces too; their location is expressed via "on"
    (on crate0 pallet3)
    (on crate1 crate0)
    (on crate2 pallet1)

    ;; crates that have nothing on top are clear
    (clear crate1)
    (clear crate2)
  )

  (:goal (and
    (on crate0 pallet1)
    (on crate1 pallet3)
    (on crate2 pallet2)
  ))
)