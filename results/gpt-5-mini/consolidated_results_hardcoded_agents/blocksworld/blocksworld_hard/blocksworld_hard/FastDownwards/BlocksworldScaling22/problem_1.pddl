(define (problem BlocksworldScaling22-problem)
  (:domain blocksworld)
  (:objects
    red orange yellow blue table s0 s1 s2 s3 s4 - object
  )

  (:init
    ;; classify objects
    (block red)
    (block orange)
    (block yellow)
    (block blue)
    (table table)

    ;; stages and successor relation for discrete time progression
    (stage s0)
    (stage s1)
    (stage s2)
    (stage s3)
    (stage s4)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)

    ;; current stage starts at s0 (enforces linear action ordering; exactly one stage is current at any time)
    (current s0)

    ;; initial physical configuration (a single stack: blue on table, red on blue, yellow on red, orange on yellow)
    (ontable blue)
    (on blue table)
    (on red blue)
    (on yellow red)
    (on orange yellow)

    ;; clear predicate: only the top block (orange) is clear initially
    (clear orange)

    ;; hand is empty initially
    (handempty)
  )

  (:goal (and
    ;; required final tower order: red on orange, orange on yellow, yellow on blue
    (on red orange)
    (on orange yellow)
    (on yellow blue)
  ))
)