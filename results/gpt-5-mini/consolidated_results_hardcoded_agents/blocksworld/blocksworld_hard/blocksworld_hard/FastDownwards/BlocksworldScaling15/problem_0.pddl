(define (problem blocks-problem)
  (:domain blocks)
  (:objects
    red blue orange yellow - block
  )
  (:init
    ;; initial stack structure
    (on blue orange)
    (on orange yellow)
    (ontable yellow)

    ;; red is on the table and clear
    (ontable red)
    (clear red)

    ;; top blocks are clear
    (clear blue)

    ;; hand initially empty
    (handempty)
  )
  (:goal (and
    ;; required final configuration:
    (on red yellow)
    (on blue red)
    (on yellow orange)
    ;; base of the final tower must be on the table
    (ontable orange)
    ;; hand must be empty at termination
    (handempty)
    ;; top block should be clear in the final configuration
    (clear blue)
  ))
)