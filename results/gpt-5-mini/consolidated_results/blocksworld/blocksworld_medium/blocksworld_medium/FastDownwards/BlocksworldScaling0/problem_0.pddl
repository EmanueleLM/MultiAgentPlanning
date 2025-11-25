(define (problem stack-three-blocks)
  (:domain blocks-multiagent)

  (:objects
    bp - blockplayer
    ta - temporalauditor

    red yellow blue - block

    phase1 phase2 - phase
  )

  (:init
    ;; agent hands start empty
    (handempty bp)
    (handempty ta)

    ;; all blocks start on the table and clear
    (ontable red)
    (ontable yellow)
    (ontable blue)

    (clear red)
    (clear yellow)
    (clear blue)

    ;; phase sequencing: start in phase1; phase1 -> phase2
    (current phase1)
    (next phase1 phase2)
  )

  (:goal (and
    (on blue yellow)
    (on yellow red)
  ))
)