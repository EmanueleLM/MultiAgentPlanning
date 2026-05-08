(define (problem stack-red-on-orange-blue-on-red)
  (:domain block-stacking-collab)
  (:objects
    picker stacker auditor orchestrator - agent
    red blue orange yellow - block
  )
  (:init
    ; initial placement per specification
    (on red orange)
    (on blue yellow)
    (ontable orange)
    (ontable yellow)

    ; clear facts for top blocks
    (clear red)
    (clear blue)

    ; single shared manipulator is free and all agents have empty hands
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