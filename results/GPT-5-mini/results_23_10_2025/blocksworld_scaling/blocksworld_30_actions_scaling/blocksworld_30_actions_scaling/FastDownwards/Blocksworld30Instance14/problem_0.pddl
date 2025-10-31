(define (problem blocks-world-multiagent-problem)
  (:domain blocks-world-multiagent)
  (:objects
    a b c d e f g h - block
    ag1 ag2 - agent
  )
  (:init
    ;; initial stacks (bottom-to-top): [d h a e], [f g b], [c]
    (on h d)
    (on a h)
    (on e a)
    (on g f)
    (on b g)

    (ontable d)
    (ontable f)
    (ontable c)

    (clear e)
    (clear b)
    (clear c)

    (handempty ag1)
    (handempty ag2)
  )
  (:goal (and
    ;; A is on the table with G on A
    (ontable a)
    (on g a)

    ;; B is on the table with H on B and D on H
    (ontable b)
    (on h b)
    (on d h)

    ;; C is on top of F
    (on c f)

    ;; E is on the table
    (ontable e)

    ;; F is on the table
    (ontable f)
  ))
)