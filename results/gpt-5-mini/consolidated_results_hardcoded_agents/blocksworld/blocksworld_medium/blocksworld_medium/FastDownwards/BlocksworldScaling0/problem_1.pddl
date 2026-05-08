(define (problem stack-three-blocks)
  (:domain blocks-multiagent)

  (:objects
    bp ta - agent

    red yellow blue orange - block

    phase1 phase2 - phase
  )

  (:init
    ;; agent hands
    (handempty bp)
    (handempty ta)

    ;; initial block configuration from the human specification:
    ;; red is on top of yellow; blue is on top of orange; orange on table; yellow on table.
    (on red yellow)
    (on blue orange)
    (ontable orange)
    (ontable yellow)

    ;; clear blocks (those with nothing on top and not held)
    (clear red)
    (clear blue)
    ;; yellow is not clear because red is on it; orange is not clear because blue is on it

    ;; phase sequencing
    (current phase1)
    (next phase1 phase2)
  )

  (:goal (and
    (on blue yellow)
    (on yellow red)
  ))
)