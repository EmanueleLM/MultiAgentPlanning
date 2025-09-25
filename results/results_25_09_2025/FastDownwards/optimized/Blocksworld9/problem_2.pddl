(define (problem multi-agent-blocks-problem)
  (:domain multi-agent-blocks)
  (:objects
    a b c d e f g h i j k l m n - block
  )

  (:init
    ;; initial stacks
    (ontable d)
    (on a d)
    (on f a)
    (on l f)
    (on k l)
    (on n k)
    (on b n)
    (on i b)

    (ontable h)
    (on m h)
    (on g m)
    (on e g)
    (on c e)
    (on j c)

    ;; clear tops
    (clear i)
    (clear j)

    ;; vowel capability
    (vowel a)
    (vowel e)
    (vowel i)

    ;; consonant capability
    (consonant d)
    (consonant f)
    (consonant l)
    (consonant k)
    (consonant n)
    (consonant b)
    (consonant h)
    (consonant m)
    (consonant g)
    (consonant c)
    (consonant j)
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
    (on l m)
    (on m n)
    (ontable n)
  ))

  (:metric minimize (total-cost))
)