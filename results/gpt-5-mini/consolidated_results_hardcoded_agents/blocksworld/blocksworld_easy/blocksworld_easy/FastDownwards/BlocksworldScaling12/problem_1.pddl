(define (problem bw-problem)
  (:domain blocksworld)
  (:objects
    orange blue yellow red - block
    step0 step1 step2 step3 step4 - time
  )
  (:init
    ;; Initial physical configuration per human specification:
    (on-table orange)
    (on-table blue)
    (on-table red)
    (on yellow orange)

    ;; Clear predicates: yellow, red, and blue are clear; orange is NOT clear because yellow is on it.
    (clear yellow)
    (clear red)
    (clear blue)

    (handempty)

    ;; Time progression: single current time and explicit successor chain.
    (current step0)
    (next step0 step1)
    (next step1 step2)
    (next step2 step3)
    (next step3 step4)
  )
  ;; Goal must hold exactly at the designated final step (enforces exact sequence length).
  (:goal (and
    (current step4)
    (on orange blue)
    (on yellow red)
  ))
)