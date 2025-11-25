(define (problem pddl_orchestrator-problem)
  (:domain pddl_orchestrator)
  (:objects
    red orange yellow - block
  )
  (:init
    ; initial placement: all blocks on the table and clear
    (ontable red)
    (ontable orange)
    (ontable yellow)

    (clear red)
    (clear orange)
    (clear yellow)

    (handempty)
    ; no other on relations or holdings initially
  )

  ; Goal: red on orange, yellow on red, and orange must be the bottom (on the table)
  (:goal (and
    (on red orange)
    (on yellow red)
    (ontable orange)
  ))
)