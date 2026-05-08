(define (problem stack-red-blue-orange-yellow)
  (:domain blocks-multiagent)
  (:objects
    red blue orange yellow - block
  )

  (:init
    ;; Grounded initial state consistent with "blue on orange", others on table
    (ontable red)
    (ontable orange)
    (ontable yellow)
    (on blue orange)

    ;; Clear predicates: top blocks (red, blue, yellow) are clear; orange is not clear because blue is on it.
    (clear red)
    (clear blue)
    (clear yellow)

    ;; Single-hand free initially
    (handempty)
  )

  (:goal (and
           (on red blue)
           (on blue orange)
           (on orange yellow)
         ))
)