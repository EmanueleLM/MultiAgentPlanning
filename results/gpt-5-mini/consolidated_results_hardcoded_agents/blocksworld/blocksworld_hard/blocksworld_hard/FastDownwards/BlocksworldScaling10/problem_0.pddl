(define (problem make-all-ontable)
  (:domain blocks-singlehanded)

  (:objects
    red orange blue yellow - block
  )

  ;; Initial state corresponds exactly to the observer's snapshot and includes
  ;; the control predicates that enforce the required strict ordering.
  (:init
    ;; world state observed
    (on red orange)
    (on orange blue)
    (on blue yellow)
    (ontable yellow)
    (clear red)
    (handempty)

    ;; control: allow only the first unstack initially
    (allowed-unstack red orange)

    ;; static enables mapping: put-down(red) enables unstack(orange,blue)
    ;; and put-down(orange) enables unstack(blue,yellow)
    (enables red orange blue)
    (enables orange blue yellow)

    ;; Note: no enables mapping for put-down(blue) because no further unstack is required.
  )

  ;; Goal fixes every mandated terminal condition:
  ;; all blocks on the table, all blocks clear, and hand empty.
  (:goal (and
    (ontable red)
    (ontable orange)
    (ontable blue)
    (ontable yellow)
    (clear red)
    (clear orange)
    (clear blue)
    (clear yellow)
    (handempty)
  ))
)