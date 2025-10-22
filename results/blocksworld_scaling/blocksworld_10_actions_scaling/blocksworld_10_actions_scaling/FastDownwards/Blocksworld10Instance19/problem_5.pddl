(define (problem blocksworld10instance19)
  (:domain blocksworld-sequenced)
  (:objects
    a b c d e f g h - block
    manipulator1 manipulator2 orchestrator - agent
  )
  (:init
    (ontable a)
    (on b a)
    (on h b)
    (on e h)

    (ontable g)
    (on f g)
    (on c f)

    (ontable d)

    (clear e)
    (clear c)
    (clear d)

    (handempty manipulator1)
    (handempty manipulator2)

    (at-step s0)
  )
  (:goal (and
    (at-step s10)
    (handempty manipulator1)
    (handempty manipulator2)
  ))
)