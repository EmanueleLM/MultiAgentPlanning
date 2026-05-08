(define (problem depot-hoist-driver-problem)
  (:domain depot-hoist-driver)

  ; Explanation of naming choices and conservative reconciliation:
  ; - The specification referenced objects by kinds: depot, distributor, pallet, crate, truck, hoist, surface.
  ;   These appear here as objects with types: depot and distributor are locations; pallet0/pallet1 are pallets;
  ;   truck0 is a truck; hoist0 is a hoist; surface0/surface1 are surfaces; crate0..crate2 are crates.
  ; - Places (location, truck, pallet, surface) are modeled as the supertype "place" so crates can be "at" any of them.
  ; - Actions are namespaced with prefixes driver- and hoist- as required.
  ; - No additional resources or unstated connectivity were introduced beyond the listed names.
  ; - All soft preferences are treated as hard constraints by construction (no penalty bookkeeping allowed).

  (:objects
    depot distributor - location
    truck0 - truck
    hoist0 - hoist
    pallet0 pallet1 - pallet
    surface0 surface1 - surface
    crate0 crate1 crate2 - crate
  )

  (:init
    ; initial locations of movable places
    (at-place truck0 depot)
    (at-place pallet0 distributor)
    (at-place pallet1 distributor)
    (at-place surface0 distributor)
    (at-place surface1 distributor)

    ; relations between pallets and surfaces (pallets are on their surfaces)
    (pallet-on-surface pallet0 surface0)
    (pallet-on-surface pallet1 surface1)

    ; initial crate positions: all crates start at the depot location
    (crate-at crate0 depot)
    (crate-at crate1 depot)
    (crate-at crate2 depot)

    ; hoist initial location and free status
    (hoist-at hoist0 depot)
    (hoist-free hoist0)
  )

  (:goal (and
    (crate-at crate0 pallet0)
    (crate-at crate2 pallet1)
  ))
)