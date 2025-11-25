(define (problem stack-red-on-orange)
  (:domain blocks-world-agent)
  (:objects
    agent1 - agent
    red yellow blue orange - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 - step
  )
  (:init
    ;; stacking: red on yellow, yellow on blue, blue on orange, orange on table
    (on red yellow)
    (on yellow blue)
    (on blue orange)
    (on-table orange)

    ;; top block clear and hand empty
    (clear red)
    (handempty agent1)

    ;; discrete stage ordering and initial current stage
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)
    (next s5 s6)
    (next s6 s7)
    (next s7 s8)
    (current s0)
  )
  (:goal (and
    (on red orange)
  ))
)