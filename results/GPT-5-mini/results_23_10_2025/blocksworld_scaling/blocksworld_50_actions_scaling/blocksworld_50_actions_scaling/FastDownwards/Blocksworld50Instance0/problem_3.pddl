(define (problem blocks-sequence-verify)
  (:domain multi-agent-blocks-sequenced)

  (:objects
    a b c d e f g h i j k l m - block
    robot1 robot2 - robot
  )

  (:init
    (ontable m)
    (on a m)
    (on l a)
    (on e l)
    (on b e)

    (ontable h)
    (on f h)
    (on d f)
    (on k d)
    (on g k)
    (on j g)
    (on c j)
    (on i c)

    (clear b)
    (clear i)

    (handempty robot1)
    (handempty robot2)

    (step0)
  )

  (:goal (and (step50)))
)