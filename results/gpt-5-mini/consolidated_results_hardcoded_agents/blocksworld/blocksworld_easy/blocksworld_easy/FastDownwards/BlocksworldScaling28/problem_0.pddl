(define (problem blocks-orch-prob)
  (:domain blocks-orchestrated)
  (:objects
    red blue orange yellow - block
    table - support
  )
  (:init
    ;; initial all blocks on the table, all clear, and hand empty (public info)
    (on red table)
    (on blue table)
    (on orange table)
    (on yellow table)

    (clear red)
    (clear blue)
    (clear orange)
    (clear yellow)

    (handempty)
  )
  ;; goal: red on blue and yellow on red (achieve tower blue <- red <- yellow)
  (:goal (and
    (on red blue)
    (on yellow red)
  ))
)