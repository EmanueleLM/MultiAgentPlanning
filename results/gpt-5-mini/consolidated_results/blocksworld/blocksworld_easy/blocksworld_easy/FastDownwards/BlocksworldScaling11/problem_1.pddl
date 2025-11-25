(define (problem blocksworld-stages-problem)
  (:domain blocksworld-stages)

  (:objects
    red blue orange yellow - block
    s0 s1 s2 s3 s4 - stage
  )

  (:init
    ;; initial spatial relations (as given)
    (on blue yellow)
    (ontable red)
    (ontable orange)
    (ontable yellow)

    ;; initial clear statuses (as given): red, blue, orange are clear; yellow is not clear
    (clear red)
    (clear blue)
    (clear orange)
    ;; note: yellow is not clear because blue is on it (no fact (clear yellow))

    ;; single hand is empty initially
    (handempty)

    ;; stage ordering and initial stage
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (at-stage s0)
  )

  (:goal
    (and
      ;; required final stacking relations
      (on blue orange)
      (on yellow red)

      ;; hand must be empty at the end
      (handempty)

      ;; enforce that the plan has progressed through stages up to the intended terminal stage
      (at-stage s4)
    )
  )
)