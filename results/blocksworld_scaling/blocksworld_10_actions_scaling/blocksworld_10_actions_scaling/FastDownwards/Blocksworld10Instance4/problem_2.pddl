(define (problem blocksworld10instance4-problem)
  (:domain blocksworld-multiagent)

  (:objects
    a b c d e f g h - block
    agent1 agent2 - agent
  )

  (:init
    (on c e)
    (on d c)
    (on f h)
    (on g b)

    (ontable a)
    (ontable b)
    (ontable e)
    (ontable h)

    (clear a)
    (clear d)
    (clear f)
    (clear g)

    (handempty agent1)
    (handempty agent2)
  )

  (:goal (and
    (on a f)
    (on d b)
    (on c e)
    (ontable b)
    (ontable e)
    (ontable f)
    (ontable g)
    (ontable h)
  ))
)