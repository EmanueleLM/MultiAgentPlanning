(define (problem blocks-world-problem)
  (:domain blocks-world)
  (:objects a b c d e f g h i - block)
  (:init
    ; Initial arrangement (from public information)
    (ontable a)
    (ontable b)
    (ontable f)

    (on g b)
    (on c g)
    (on e c)
    (on i f)
    (on d i)
    (on h a)

    ; Initial clear tops
    (clear e)
    (clear d)
    (clear h)

    (handempty)
  )
  (:goal (and
    ; Final arrangement after executing the full action sequence (integrated reports)
    (on g b)
    (on d g)
    (on h d)
    (on a e)
    (on f i)

    (ontable b)
    (ontable c)
    (ontable e)
    (ontable i)
  ))
)