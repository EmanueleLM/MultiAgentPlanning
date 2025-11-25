(define (problem stack-red-on-orange-blue-on-red)
  (:domain block-stacking-collab)
  (:objects
    picker - picker_agent
    stacker - stacker_agent
    auditor - auditor_agent
    orchestrator - orchestrator_agent
    red blue orange yellow - block
    s1 s2 s3 s4 s5 - stage
  )
  (:init
    ; initial stacking
    (on red orange)
    (on blue yellow)
    (ontable orange)
    (ontable yellow)

    ; clear top blocks (no blocks on top and not held)
    (clear red)
    (clear blue)

    ; all agents start with empty hands (enforces single global hold via action preconditions)
    (handempty picker)
    (handempty stacker)
    (handempty auditor)
    (handempty orchestrator)

    ; discrete time/stage progression: start at s1 and successors defined explicitly
    (current s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)
  )
  (:goal (and
    (on red orange)
    (on blue red)
  ))
)