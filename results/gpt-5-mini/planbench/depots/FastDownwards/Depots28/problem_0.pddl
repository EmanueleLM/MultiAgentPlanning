(define (problem move-and-stack-crates)
  (:domain crate_hoist_drive)

  (:objects
    ;; places
    depot0 depot1 - place

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; hoists (one at each depot as assumed)
    hoist0 hoist1 - hoist

    ;; surfaces: include pallets and crates and ground surfaces
    ground0 ground1 pallet0 crate0 crate1 crate2 - surface
  )

  (:init
    ;; Trucks initial locations
    (at truck0 depot1)
    (at truck1 depot1)
    (at truck2 depot0)

    ;; Hoists initial locations and availability
    (at-hoist hoist0 depot0)
    (available hoist0)
    (at-hoist hoist1 depot1)
    (available hoist1)

    ;; Surfaces located at places
    (surface-at ground0 depot0)
    (surface-at ground1 depot1)
    (surface-at pallet0 depot1)

    ;; Initial stacking: crates are on ground surfaces at their initial places
    (on crate0 ground0)
    (on crate2 ground0)
    (on crate1 ground1)

    ;; Which tops are clear initially (all crates and pallet0 are clear)
    (clear crate0)
    (clear crate2)
    (clear crate1)
    (clear pallet0)

    ;; Note: ground surfaces with crates on them are implicitly not clear (no (clear ground0) fact)
  )

  (:goal (and
    ;; Final stack arrangement mandated by the specification:
    ;; crate2 on pallet0 (at depot1), crate0 on crate2, crate1 on crate0
    (on crate2 pallet0)
    (on crate0 crate2)
    (on crate1 crate0)
    ;; truck2 ends at depot1 per the driving sequence summary
    (at truck2 depot1)
  ))