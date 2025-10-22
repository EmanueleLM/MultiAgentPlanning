(define (problem blocks-final-arrangement)
  (:domain blocks-world)
  (:objects a b c d e f g - block)

  (:init
    ;; Initial stacks as provided:
    (on f a)
    (on a c)
    (on c b)
    (ontable b)

    (on e d)
    (on d g)
    (ontable g)

    ;; Top blocks are clear at start
    (clear f)
    (clear e)

    ;; Robot free
    (handempty)
  )

  (:goal (and
    ;; Goal matches the final arrangement derived from the given action sequence
    (on e f)
    (on f a)
    (on a c)
    (on c b)
    (ontable b)
    (on d g)
    (ontable g)
  ))
)