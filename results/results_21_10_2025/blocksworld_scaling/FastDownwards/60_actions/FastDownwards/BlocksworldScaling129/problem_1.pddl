(define (problem assemble-tower-vowels-consonants)
  (:domain blocks-vowel-consonant)
  (:objects
    a b c d e f g h i j k - block
  )

  (:init
    ; static vowel/consonant typing
    (vowel a) (vowel e) (vowel i)
    (consonant b) (consonant c) (consonant d) (consonant f)
    (consonant g) (consonant h) (consonant j) (consonant k)

    ; initial stacks (bottom -> top)
    ; Stack1: C, E, I, H, D, F, G
    (on e c)
    (on i e)
    (on h i)
    (on d h)
    (on f d)
    (on g f)
    (on-table c)

    ; Stack2: B, A, K, J
    (on a b)
    (on k a)
    (on j k)
    (on-table b)

    ; clear/top facts (tops of the two stacks)
    (clear g)
    (clear j)
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
    (on-table k)
  ))
)