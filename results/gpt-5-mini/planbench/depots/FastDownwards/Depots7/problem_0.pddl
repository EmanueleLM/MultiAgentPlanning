(define (problem stack-crates-instance)
  (:domain crate-stacking)

  (:objects
    r1 - agent

    crate0 crate1 crate2 - crate

    pallet1 pallet2 pallet3 - pallet
  )

  (:init
    ;; initial locations: each crate on a pallet
    (on-pallet crate0 pallet1)
    (on-pallet crate1 pallet2)
    (on-pallet crate2 pallet3)

    ;; supports that are occupied are not listed as clear; supports without tops would be listed as clear
    ;; crates initially have nothing on top
    (clear-crate crate0)
    (clear-crate crate1)
    (clear-crate crate2)

    ;; pallets initially are occupied (no clear-pallet facts for pallet1,pallet2,pallet3)

    ;; agent initially empty-handed
    (handempty r1)

    ;; distinctness facts to forbid self-stacking:
    ;; crate onto different crate
    (distinct-crate-crate crate0 crate1)
    (distinct-crate-crate crate0 crate2)
    (distinct-crate-crate crate1 crate0)
    (distinct-crate-crate crate1 crate2)
    (distinct-crate-crate crate2 crate0)
    (distinct-crate-crate crate2 crate1)

    ;; crate onto pallets (all crate-pallet pairs are distinct)
    (distinct-crate-pallet crate0 pallet1)
    (distinct-crate-pallet crate0 pallet2)
    (distinct-crate-pallet crate0 pallet3)

    (distinct-crate-pallet crate1 pallet1)
    (distinct-crate-pallet crate1 pallet2)
    (distinct-crate-pallet crate1 pallet3)

    (distinct-crate-pallet crate2 pallet1)
    (distinct-crate-pallet crate2 pallet2)
    (distinct-crate-pallet crate2 pallet3)
  )

  (:goal (and
    ;; mandated final placements
    (on-pallet crate0 pallet3)
    (on-crate crate1 crate2)
    (on-pallet crate2 pallet1)
  ))
)