(define (problem BlocksworldScaling95-problem)
  (:domain BlocksworldScaling95)
  (:objects
    a b c d e f g h i j - block
    table - place
  )
  (:init
    ; initial table placement
    (ontable g)
    (ontable e)

    ; initial on relations (top-of relationships)
    (on f g)
    (on j f)
    (on c j)
    (on h c)
    (on d h)
    (on a e)
    (on i a)
    (on b i)

    ; which blocks are clear (topmost)
    (clear d)
    (clear b)

    ; vowel / consonant typing facts
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