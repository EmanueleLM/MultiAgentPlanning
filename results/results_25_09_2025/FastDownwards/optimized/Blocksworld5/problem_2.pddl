(define (problem stacking-multi-agent-problem)
  (:domain stacking-multi-agent)

  (:objects
    a b c d e f g h i j k l - block
  )

  (:init
    ; table positions are represented by ontable predicates; no numeric fluents used
    (ontable i)
    (ontable b)
    (ontable j)

    ; initial stacks (below -> above)
    (on l i)
    (on f l)
    (on g f)
    (on c g)

    (on a b)
    (on h a)
    (on d h)
    (on e d)
    (on k e)

    ; clear tops of each stack
    (clear c)
    (clear k)
    (clear j)

    ; agent permissions (encoded as predicates)
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

  (:goal
    (and
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
    )
  )

  (:metric minimize (total-cost))
)