(define (problem block-stacking-multiagent-problem)
  (:domain block-stacking-multiagent)

  (:objects
    a b c d e f g h i j k l - block
  )

  (:init
    ; table locations (public initial stacks)
    (ontable i)
    (ontable b)
    (ontable j)

    ; stack links (public initial stacks)
    (on l i)
    (on f l)
    (on g f)
    (on c g)

    (on a b)
    (on h a)
    (on d h)
    (on e d)
    (on k e)

    ; which blocks are currently clear (tops of stacks)
    (clear c)
    (clear k)
    (clear j)

    ; agent capabilities (as provided by the two agents)
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
    (consonant l)
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
    (on k l)
    (ontable l)
  ))
)