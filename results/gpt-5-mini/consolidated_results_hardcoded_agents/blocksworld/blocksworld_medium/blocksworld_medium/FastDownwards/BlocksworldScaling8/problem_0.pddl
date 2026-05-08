(define (problem place-red-on-blue)
  (:domain block-orchestration)
  (:objects
    planner - agent
    auditor  - agent
    red blue - block
  )

  (:init
    ; blocks on table and clear
    (ontable red)
    (ontable blue)
    (clear red)
    (clear blue)

    ; both agents start with empty hands
    (handempty planner)
    (handempty auditor)
  )

  ; The explicit final condition: red must be on blue.
  ; No auxiliary goal predicates are used; final placement is enforced directly.
  (:goal (and
           (on red blue)
         ))
)