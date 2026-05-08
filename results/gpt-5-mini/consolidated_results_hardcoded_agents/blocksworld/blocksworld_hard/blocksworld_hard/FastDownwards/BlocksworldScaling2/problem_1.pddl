(define (problem BlocksworldScaling2-problem)
  (:domain blocksworld-scaling2)
  (:objects red orange blue yellow - block s0 s1 - stage)
  (:init
    ;; Initial stacking configuration (exactly as provided)
    (on red orange)
    (on orange blue)
    (on yellow red)
    (ontable blue)

    ;; Explicitly stated initial facts
    (clear yellow)
    (handempty)

    ;; Phase: active manipulation stage
    (phase s0)
  )
  ;; Goal requires the two on-relations AND the explicit terminal condition (finished).
  ;; The planner must therefore reach the desired stacking and then execute the terminal transition.
  (:goal (and
           (on red blue)
           (on yellow orange)
           (finished)))
)