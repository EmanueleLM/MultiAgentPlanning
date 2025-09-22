(define (problem multi-agent-blocks-problem)
  (:domain multi-agent-blocks)
  (:objects
    a b c d e f g h i j - block
  )

  (:init
    ;; Agent capabilities (mapped from agent inputs: uppercase -> lowercase)
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

    ;; Initial stacking (both agents described the same stack; names unified to lowercase)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f g)
    (on g h)
    (on h i)
    (on i j)
    (ontable j)

    ;; a is on the table separately
    (ontable a)

    ;; Clear/top facts initially: a and b are clear (tops of their respective structures)
    (clear a)
    (clear b)
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
    (ontable j)
  ))
)