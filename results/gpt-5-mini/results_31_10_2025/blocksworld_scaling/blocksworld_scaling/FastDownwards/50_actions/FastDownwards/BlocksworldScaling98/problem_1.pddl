(define (problem two-agent-blocks-problem)
  (:domain two-agent-blocks)

  (:objects
    i c g j a e h k d f b - block
  )

  (:init
    ;; initial stacks: stack1 (bottom->top): i j a e f
    (ontable i)
    (on j i)
    (on a j)
    (on e a)
    (on f e)

    ;; stack2 (bottom->top): c g h k d b
    (ontable c)
    (on g c)
    (on h g)
    (on k h)
    (on d k)
    (on b d)

    ;; clear = top blocks initially
    (clear f)
    (clear b)

    ;; type membership
    (vowel a)
    (vowel e)
    (vowel i)

    (consonant b)
    (consonant c)
    (consonant d)
    (consonant f)
    (consonant g)
    (consonant h)
    (consonant j)
    (consonant k)
  )

  (:goal (and
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f g)
    (on g h)
    (on h i)
    (on i j)
    (on j k)
    (ontable k)
  ))
)