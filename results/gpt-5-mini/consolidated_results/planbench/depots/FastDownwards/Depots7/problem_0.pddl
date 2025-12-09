(define (problem stacking-problem)
  (:domain stacking)
  (:objects
    worker1 - agent
    crate0 crate1 crate2 - crate
    pallet1 pallet2 pallet3 - pallet
  )

  (:init
    ;; Initial placements: each crate is initially on a distinct pallet
    (on-pallet crate0 pallet1)
    (on-pallet crate1 pallet2)
    (on-pallet crate2 pallet3)

    ;; Top-of-stack status: each crate currently has nothing on top
    (clear-crate crate0)
    (clear-crate crate1)
    (clear-crate crate2)

    ;; Pallets with crates on them are not declared clear (absence = not clear).
    ;; The pallet clear predicate is only true when explicitly asserted.

    ;; Agent starts free-handed
    (arm-empty worker1)

    ;; Distinctness facts for crates to prohibit placing a crate on itself
    (distinct crate0 crate1)
    (distinct crate0 crate2)
    (distinct crate1 crate0)
    (distinct crate1 crate2)
    (distinct crate2 crate0)
    (distinct crate2 crate1)
  )

  (:goal (and
    ;; Mandated terminal placements:
    (on-pallet crate0 pallet3)
    (on-crate  crate1 crate2)
    (on-pallet crate2 pallet1)
    ;; Ensure agent finishes not holding anything
    (arm-empty worker1)
  ))