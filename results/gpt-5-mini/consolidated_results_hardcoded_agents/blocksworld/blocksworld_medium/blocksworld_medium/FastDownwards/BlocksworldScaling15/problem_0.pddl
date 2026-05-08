(define (problem assemble-colors)
  (:domain blocksworld-multiagent)
  (:objects
    red blue yellow orange - block
    ;; agent-a and agent-b are domain constants (declared in domain)
  )

  (:init
    ;; All blocks start on the table and are clear
    (ontable red)
    (ontable blue)
    (ontable yellow)
    (ontable orange)

    (clear red)
    (clear blue)
    (clear yellow)
    (clear orange)

    ;; Both agents start with empty hands
    (handempty agent-a)
    (handempty agent-b)
  )

  (:goal (and
    ;; Mandated terminal conditions
    (on red yellow)
    (on blue orange)
  ))
)