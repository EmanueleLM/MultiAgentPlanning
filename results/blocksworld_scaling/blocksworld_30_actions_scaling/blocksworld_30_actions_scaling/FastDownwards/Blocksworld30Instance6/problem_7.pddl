(define (problem blocks-final-arrangement)
  (:domain blocks-world)
  (:objects a b c d e f g h i j - block)

  (:init
    ;; Stack 1: A - I - C - J - D - G (G is top)
    (ontable a)
    (on i a)
    (on c i)
    (on j c)
    (on d j)
    (on g d)

    ;; Stack 2: B - F - E - H (H is top)
    (ontable b)
    (on f b)
    (on e f)
    (on h e)

    ;; clear tops
    (clear g)
    (clear h)

    (handempty)
  )

  (:goal (and
    (ontable a)
    (on i a)
    (on c i)
    (on j c)
    (on d j)
    (on g d)
    (ontable b)
    (on f b)
    (on e f)
    (on h e)
    (clear g)
    (clear h)
    (handempty)
  ))
)