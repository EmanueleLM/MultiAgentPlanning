(define (problem open-vault-problem-multi-agent)
  (:domain multi-agent-vault)

  (:objects 
    big-robot1 small-robot1 - robot
  )
  
  (:init 
    (vault-closed)
    (object-inside)
    (have-key big-robot1)
    (big-robot big-robot1)
    (at-small small-robot1)
    (small-robot small-robot1)
  )
  
  (:goal 
    (object-retrieved)
  )
)