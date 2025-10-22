(define (problem blocks-world-instance-verified)
  (:domain blocks-world-verified)
  (:objects a b c d e f g h i - block)
  (:init
    ;; Initial arrangement (from the specification)
    (ontable a)
    (ontable b)
    (ontable f)

    (on g b)
    (on c g)
    (on e c)
    (on i f)
    (on d i)
    (on h a)

    ;; Blocks that are initially clear (tops of stacks)
    (clear e)
    (clear d)
    (clear h)

    (handempty)
  )
  (:goal (and
    ;; Final arrangement as computed from the full action sequence
    (on a e)
    (on d g)
    (on h d)
    (on f i)
    (on g b)

    (ontable b)
    (ontable c)
    (ontable e)
    (ontable i)
  ))
)