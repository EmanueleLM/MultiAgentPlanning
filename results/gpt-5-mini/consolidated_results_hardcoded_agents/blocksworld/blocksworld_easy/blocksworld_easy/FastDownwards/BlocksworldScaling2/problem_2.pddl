(define (problem stack-red-on-orange-blue-on-red)
  (:domain block-stacking-collab)
  (:objects
    picker - picker_agent
    stacker - stacker_agent
    auditor - auditor_agent
    orchestrator - orchestrator_agent
    red blue orange yellow - block
  )
  (:init
    (on red orange)
    (on blue yellow)
    (ontable orange)
    (ontable yellow)
    (clear red)
    (clear blue)
    (handfree)
    (handempty picker)
    (handempty stacker)
    (handempty auditor)
    (handempty orchestrator)
  )
  (:goal (and
    (on red orange)
    (on blue red)
  ))
)