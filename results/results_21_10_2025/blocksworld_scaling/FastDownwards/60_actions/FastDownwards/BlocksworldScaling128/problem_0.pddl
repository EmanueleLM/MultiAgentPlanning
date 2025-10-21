(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)

  (:objects
    b e l a n g j m c k f d h i - block
  )

  (:init
    ; type membership
    (vowel a)
    (vowel e)
    (vowel i)

    (consonant b)
    (consonant l)
    (consonant n)
    (consonant g)
    (consonant j)
    (consonant m)
    (consonant c)
    (consonant k)
    (consonant f)
    (consonant d)
    (consonant h)

    ; initial stacks: Stack1 bottom->top = B, E, N, G, M, K, F, I
    (ontable b)
    (on e b)
    (on n e)
    (on g n)
    (on m g)
    (on k m)
    (on f k)
    (on i f)

    ; Stack2 bottom->top = L, A, J, C, D, H
    (ontable l)
    (on a l)
    (on j a)
    (on c j)
    (on d c)
    (on h d)

    ; top-of-stack (clear) facts
    (clear i)
    (clear h)

    ; final relations (global goal specification)
    ; final_on x y means x should be on y in the final single stack
    (final_on m n)
    (final_on l m)
    (final_on k l)
    (final_on j k)
    (final_on i j)
    (final_on h i)
    (final_on g h)
    (final_on f g)
    (final_on e f)
    (final_on d e)
    (final_on c d)
    (final_on b c)
    (final_on a b)
    (final_ontable n)

    ; No block is inplace initially (none are marked inplace)
  )

  (:goal (and
    (on m n)
    (on l m)
    (on k l)
    (on j k)
    (on i j)
    (on h i)
    (on g h)
    (on f g)
    (on e f)
    (on d e)
    (on c d)
    (on b c)
    (on a b)
    (ontable n)
  ))