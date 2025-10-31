(define (problem blocks-problem-playerA)
  (:domain blocksworld)
  (:objects
    red blue yellow orange - block
    playerA playerB orchestrator - agent
  )
  (:init
    (on red blue)
    (ontable blue)
    (on yellow orange)
    (ontable orange)
    (clear red)
    (clear yellow)
    (handempty playerA)
    (handempty playerB)
    (handempty orchestrator)
  )
  (:goal (and (on orange red)))
)