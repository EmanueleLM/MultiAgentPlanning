(define (problem blocks-final-arrangement)
  (:domain blocks-world)
  (:objects a b c d e f g h i j - block)

  (:init
    ;; final arrangement after executing the given action sequence:
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

    ;; tops are clear
    (clear g)
    (clear h)

    ;; hand is empty
    (handempty)
  )

  ;; goal expresses the same final arrangement (instance represented after sequence)
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
    (handempty)
  ))
)