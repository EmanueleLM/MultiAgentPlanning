(define (problem vc-stacking-problem)
  (:domain vc-stacking-domain)
  (:objects
    a b c d e f g h i j k l - block
    table - table
  )

  (:init
    ;; types
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

    ;; initial stacks (on predicates). Each (on X Y) means X is directly on Y.
    ;; Stack1 (bottom to top): a - f - l - c - j - g - b
    (on a table)
    (ontable a)
    (on f a)
    (on l f)
    (on c l)
    (on j c)
    (on g j)
    (on b g)

    ;; Stack2 (bottom to top): d - e - i - k - h
    (on d table)
    (ontable d)
    (on e d)
    (on i e)
    (on k i)
    (on h k)

    ;; clear blocks (tops of stacks)
    (clear b)
    (clear h)
  )

  (:goal (and
    ;; final desired single stack (top to bottom): a on b on c on d on e on f on g on h on i on j on k on l and l on table
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