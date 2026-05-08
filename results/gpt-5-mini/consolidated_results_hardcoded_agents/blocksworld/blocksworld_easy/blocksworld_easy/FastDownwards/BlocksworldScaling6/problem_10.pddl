(define (problem blocks-orange-on-yellow)
  (:domain blocks-manipulator)

  (:objects
    red blue orange yellow - block
    table - table
    s0 s1 s2 - stage
  )

  (:init
    ;; explicit stage ordering and initial current stage (single at)
    (next s0 s1)
    (next s1 s2)
    (at s0)

    ;; initial tower: orange on blue, blue on red, red on table
    (on orange blue)
    (on blue red)
    (ontable red table)

    ;; yellow is on the table
    (ontable yellow table)

    ;; clear facts for topmost blocks (and blocks not being held)
    (clear orange)
    (clear yellow)

    ;; manipulator hand is empty at start
    (handempty)
  )

  ;; Goal requires the block relation AND that the plan has progressed to the final stage s2.
  (:goal
    (and
      (on orange yellow)
      (at s2)
    )
  )
)