(define (problem stacking-multi-agent-problem)
  (:domain stacking-multi-agent)

  (:objects
    a b c d e f g h i j k l - block
  )

  (:init
    ;; Table bottoms (public)
    (ontable i)
    (ontable b)
    (ontable j)

    ;; on relations (top -> supporting) (merged from both agents; object names unified to lowercase)
    (on l i)
    (on f l)
    (on g f)
    (on c g)

    (on a b)
    (on h a)
    (on d h)
    (on e d)
    (on k e)

    ;; clear (top blocks of each stack)
    (clear c)
    (clear k)
    (clear j)

    ;; agent-specific capabilities (which blocks each agent can move)
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

  ;; Global stacking goal (public)
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
)