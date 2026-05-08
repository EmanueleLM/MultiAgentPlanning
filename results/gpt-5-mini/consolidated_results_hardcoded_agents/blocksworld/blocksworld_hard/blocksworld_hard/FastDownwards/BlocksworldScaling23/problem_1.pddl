(define (problem blocks-problem-staged)
  (:domain blocksworld_staged)

  (:objects
    yellow blue orange red - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 - stage
  )

  (:init
    ;; Blocks initial stacking
    (on yellow blue)
    (on blue orange)
    (on orange red)
    (ontable red)

    ;; Clear facts: only yellow is clear initially (nothing on yellow).
    (clear yellow)
    ;; blue, orange, red are not clear initially (they have blocks on top),
    ;; those negative facts will be inferred by planner via absence of (clear ...).

    ;; Hand initial state
    (handempty)

    ;; Stage progression setup: start at s0 and define linear successor chain.
    (current s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)
    (next s5 s6)
    (next s6 s7)
    (next s7 s8)
    (next s8 s9)
    (next s9 s10)
    (next s10 s11)
    (next s11 s12)
  )

  (:goal (and
    (on red blue)
    (on orange red)
    (on yellow orange)
    (handempty)
    ;; Require that the plan reached the terminal stage s12 to enforce ordered progression.
    (current s12)
  ))
)