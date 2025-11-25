(define (problem blocks-goal-red-yellow-yellow-blue)
  (:domain blocks-world-orchestrator)
  (:objects
    red yellow blue orange - block
    s0 s1 s2 s3 s4 - stage
  )
  (:init
    ;; initial physical configuration matches the provided stack (bottom to top):
    ;; blue (on table) -> orange -> red -> yellow (top)
    (ontable blue)
    (on orange blue)
    (on red orange)
    (on yellow red)

    ;; clear only for the top block (yellow). Other blocks have blocks above them and are not clear.
    (clear yellow)

    ;; single hand empty at start
    (handempty)

    ;; explicit stage progression objects and initial current stage s0
    (at-stage s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
  )
  (:goal
    (and
      ;; final required stackings
      (on red yellow)
      (on yellow blue)
      ;; require reaching the final stage so the solver must respect the ordered stages
      (at-stage s4)
    )
  )
)