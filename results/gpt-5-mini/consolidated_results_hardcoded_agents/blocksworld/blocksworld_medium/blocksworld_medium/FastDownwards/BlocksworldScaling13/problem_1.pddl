(define (problem stack-red-on-orange)
  (:domain blocks-world-agent)
  (:objects
    agent1 - agent
    red yellow blue orange - block
    s0 s1 s2 - step
  )
  (:init
    ;; initial stacked configuration: red on yellow, yellow on blue, blue on orange, orange on table
    (on red yellow)
    (on yellow blue)
    (on blue orange)
    (on-table orange)

    ;; clear / hand status as specified
    (clear red)
    (handempty agent1)

    ;; explicit stage progression (discrete time modeled as steps)
    (next s0 s1)
    (next s1 s2)
    (current s0)
  )
  (:goal (and
           (on red orange)
         )
  )
)