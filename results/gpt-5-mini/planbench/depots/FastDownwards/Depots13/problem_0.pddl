(define (problem move-crates-problem)
  (:domain depot-operations)

  (:objects
    ; places
    depot1 - depot
    dist1 - distributor

    ; trucks and hoists
    truck0 - truck
    hoist0 - hoist

    ; crates
    crate0 crate2 - crate

    ; surfaces: pallet, ground surfaces, truck bed, crate top surfaces
    pallet1 ground1 ground2 bed-truck0 top-crate0 top-crate2 - surface
  )

  (:init
    ; locations of actors
    (truck-at truck0 depot1)
    (hoist-at hoist0 depot1)

    ; surfaces are located at places
    (surface-at pallet1 depot1)
    (surface-at ground1 depot1)
    (surface-at ground2 depot1)
    (surface-at bed-truck0 depot1)
    ; top surfaces are not independent places; they are considered located at the same place as their crate
    ; but for clarity we record them as being at the depot initially. The planner will not move top surfaces;
    ; top surfaces are used only to test "clear top" constraints.
    (surface-at top-crate0 depot1)
    (surface-at top-crate2 depot1)

    ; bed-of mapping linking truck bed to truck
    (bed-of bed-truck0 truck0)

    ; top-of mapping linking top surfaces to their crate
    (top-of top-crate0 crate0)
    (top-of top-crate2 crate2)

    ; initial crate placements (both crates are on separate ground surfaces at the depot)
    (on crate0 ground1)
    (on crate2 ground2)

    ; clear facts (only surfaces with no crate on them are declared clear)
    (clear pallet1)
    (clear bed-truck0)
    (clear top-crate0)
    (clear top-crate2)
    ; ground1 and ground2 are NOT declared clear because they have crates on them

    ; hoist is free initially
    (hoist-free hoist0)
  )

  ; Global goals: crate0 must be on pallet1, and crate2 must be on crate0 (i.e., on crate0's top surface)
  (:goal (and
    (on crate0 pallet1)
    (on crate2 top-crate0)
  ))
)