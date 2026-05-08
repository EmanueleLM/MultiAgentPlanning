(define (problem blocks-goal-red-yellow-yellow-blue)
  (:domain blocks-world-orchestrator)
  (:objects
    red yellow blue - block
  )
  (:init
    ;; initial physical configuration: all blocks start on the table and are clear
    (ontable red)
    (ontable yellow)
    (ontable blue)
    (clear red)
    (clear yellow)
    (clear blue)

    ;; single hand empty at start
    (handempty)
  )
  (:goal
    (and
      ;; final required stackings (both must hold)
      (on red yellow)
      (on yellow blue)
    )
  )
)