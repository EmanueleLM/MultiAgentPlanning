(define (problem blocksworld-scaling10-problem)
  (:domain blocksworld-scaling10-domain)

  ;; Assumptions:
  ;; - Discrete, ordered stages s0..s6 model time progression.
  ;; - Every action consumes exactly one immediate stage transition (s -> s').
  ;; - The next relations below form a contiguous chain; actions may only move to the immediate successor.
  (:objects
    red blue yellow orange - block
    s0 s1 s2 s3 s4 s5 s6 - stage
  )

  (:init
    ;; stack: red on blue on yellow on orange on table
    (on red blue)
    (on blue yellow)
    (on yellow orange)
    (ontable orange)

    ;; only the top-most block is clear
    (clear red)

    ;; hand is initially empty
    (handempty)

    ;; stage/time initialization and contiguous successor relation
    (at-stage s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)
    (next s5 s6)
  )

  (:goal (and
    (on yellow red)
  ))
)