(define (problem blocks-final-arrangement)
  (:domain blocks-world-multiagent)
  (:objects
    A B C D E F G H I J - block
    table - obj
    worker1 worker2 orchestrator - agent
  )
  (:init
    (on A table)
    (on E A)
    (on J table)
    (on B J)
    (on C table)
    (on F C)
    (on D F)
    (on G table)
    (on I G)
    (on H I)

    (clear E)
    (clear B)
    (clear D)
    (clear H)

    (handempty worker1)
    (handempty worker2)
  )
  (:goal (and
    (on A table)
    (on E A)
    (on B E)
    (on G B)

    (on C table)
    (on F C)
    (on D F)

    (on I table)
    (on H I)

    (on J table)
  ))
)