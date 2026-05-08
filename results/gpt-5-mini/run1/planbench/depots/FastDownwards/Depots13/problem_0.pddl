(define (problem move-and-stack-crates)
  (:domain multiagent-warehousing)

  ; Objects:
  ; Places: depot1 (a depot) and dist1 (a distributor)
  ; Surfaces: depot-pad-a, depot-pad-b (at depot1); pallet1 (at dist1)
  ; Crates: crate0 and crate2 (crate1 is omitted; only crates used in goal included)
  ; Truck: truck1 (starts at depot1)
  ; Hoist: hoist1 (starts at dist1)
  (:objects
    depot1 - depot
    dist1 - distributor

    depot-pad-a depot-pad-b pallet1 - surface

    crate0 crate2 - crate

    truck1 - truck
    hoist1 - hoist
  )

  ; Initial state:
  ; Connectivity: truck may drive between depot1 and dist1 (bidirectional)
  ; Surfaces are located at places
  ; initial crate positions:
  ;  - crate0 on depot-pad-a at depot1
  ;  - crate2 on depot-pad-b at depot1
  ; truck1 at depot1 and empty
  ; hoist1 at dist1 and free
  ; pallet1 at dist1 and empty
  ; both crates have no crate on top (clear)
  (:init
    ; connectivity
    (connected depot1 dist1)
    (connected dist1 depot1)

    ; surface locations
    (surface-at depot-pad-a depot1)
    (surface-at depot-pad-b depot1)
    (surface-at pallet1 dist1)

    ; crate initial placements
    (on-surface crate0 depot-pad-a)
    (on-surface crate2 depot-pad-b)

    ; surface emptiness: depot pads are not empty, pallet is empty
    (not (surface-empty depot-pad-a)) ; PDDL: (not ...) allowed under :negative-preconditions in requirements;
                                        ; Here we use positive atoms only; represent surface-empty only when true.
                                        ; Because initial facts in PDDL cannot assert (not ...), we instead set surface-empty
                                        ; only for true surfaces. For surfaces with crates we omit surface-empty.
    ; (Above comment documents why we will explicitly assert only positive facts for emptiness)
    (surface-empty pallet1)

    ; trucks and hoist initial states
    (at truck1 depot1)
    (truck-empty truck1)

    (at-hoist hoist1 dist1)
    (hoist-free hoist1)

    ; crate top-clearness
    (clear-crate crate0)
    (clear-crate crate2)
  )

  ; Goals:
  ;  - crate0 must be on pallet1 (on-surface crate0 pallet1)
  ;  - crate2 must be stacked on crate0 (on-crate crate2 crate0)
  ; These goals enforce the required stacking order explicitly: crate0 must be placed on pallet1 first (so pallet has crate0),
  ; and crate2 must be placed on top of crate0.
  (:goal (and
           (on-surface crate0 pallet1)
           (on-crate crate2 crate0)
         )
  )
)