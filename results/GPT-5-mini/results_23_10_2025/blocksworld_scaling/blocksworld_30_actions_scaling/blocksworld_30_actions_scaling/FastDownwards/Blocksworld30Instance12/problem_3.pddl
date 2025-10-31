(define (problem blocks-final-arrangement)
  (:domain blocks-world-multiagent)
  (:objects
    a b c d e f g h i j - block
    worker1 worker2 orchestrator - agent
  )
  (:init
    (ontable a)
    (on e a)
    (ontable j)
    (on b j)
    (ontable c)
    (on f c)
    (on d f)
    (ontable g)
    (on i g)
    (on h i)

    (clear e)
    (clear b)
    (clear d)
    (clear h)

    (handempty worker1)
    (handempty worker2)
  )
  (:goal (and
    (ontable a)
    (on e a)
    (on b e)
    (on g b)

    (ontable c)
    (on f c)
    (on d f)

    (ontable i)
    (on h i)

    (ontable j)
  ))
)