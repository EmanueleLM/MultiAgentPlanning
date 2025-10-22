(define (problem blocks-final-arrangement)
  (:domain blocks-world)
  (:objects a b c d e f g - block)

  (:init
    ;; Initial on / ontable relations (as provided)
    (on f a)
    (on a c)
    (on c b)
    (ontable b)

    (on e d)
    (on d g)
    (ontable g)

    ;; Clear blocks at start (tops of stacks)
    (clear f)
    (clear e)

    ;; Robot is initially free
    (handempty)
  )

  (:goal (and
    ;; Final arrangement derived from the full action sequence
    (on e f)
    (on f a)
    (on a c)
    (on c b)
    (ontable b)
    (on d g)
    (ontable g)
  ))
)