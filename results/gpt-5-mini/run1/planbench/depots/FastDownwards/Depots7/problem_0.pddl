(define (problem stacking-problem)
  (:domain stacking)
  (:objects
    crate0 crate1 crate2 - crate
    pallet1 pallet2 pallet3 - pallet
    worker - robot
  )
  (:init
    ;; initial stacking configuration:
    (on crate1 crate2)
    (on crate2 pallet2)
    (on crate0 pallet3)

    ;; clear supports (only those that have nothing on top)
    (clear crate1)
    (clear crate0)
    (clear pallet1)

    ;; robot initial state
    (handempty worker)
  )
  (:goal
    (and
      (on crate0 pallet3)
      (on crate1 crate2)
      (on crate2 pallet1)
    )
  )
)