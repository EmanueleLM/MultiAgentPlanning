(define (problem stack-red-on-orange-blue-on-red)
  (:domain block-stacking-collab)
  (:objects
    picker stacker - agent
    red orange blue - block
  )
  (:init
    ; initial placement: all blocks start on the table and are clear
    (ontable red)
    (ontable orange)
    (ontable blue)
    (clear red)
    (clear orange)
    (clear blue)

    ; no agent is holding anything; single shared manipulator is free
    (handfree)
    (handempty picker)
    (handempty stacker)
  )
  (:goal (and
    (on red orange)
    (on blue red)
    (ontable orange)  ; enforce final bottom location explicitly
    (clear blue)      ; top block should be clear in the terminal state
  ))
)