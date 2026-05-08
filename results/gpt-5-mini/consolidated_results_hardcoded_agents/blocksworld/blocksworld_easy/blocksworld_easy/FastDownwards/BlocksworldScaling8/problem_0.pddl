(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  ;; Objects: three blocks and three color tokens (colors are explicit objects)
  (:objects
    blue yellow red - block
    blue-color yellow-color red-color - color
  )

  ;; Initial state:
  ;; - All blocks start on the table and are clear.
  ;; - The hand is empty.
  ;; - Colors are assigned to blocks (auditor-introduced predicate). Colors are static and not changed by any action.
  (:init
    (ontable blue)
    (ontable yellow)
    (ontable red)

    (clear blue)
    (clear yellow)
    (clear red)

    (handempty)

    ;; Auditor-introduced immutable color assignments (must be respected)
    (color-assigned blue blue-color)
    (color-assigned yellow yellow-color)
    (color-assigned red red-color)
  )

  ;; Goal: enforce the terminal stacking configuration explicitly:
  ;;   blue on yellow, and yellow on red.
  ;; These must both hold in the final state (no bookkeeping shortcuts or penalties).
  (:goal
    (and
      (on blue yellow)
      (on yellow red)
    )
  )
)