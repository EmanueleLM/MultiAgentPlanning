(define (problem assemble-tower-vowels-consonants)
  (:domain blocks-vowel-consonant)
  (:objects
    a b c d e f g h i j k - block
  )

  (:init
    ; static typing facts
    (vowel a) (vowel e) (vowel i)
    (consonant b) (consonant c) (consonant d) (consonant f)
    (consonant g) (consonant h) (consonant j) (consonant k)

    ; must-place constraints (preferences enforced as hard constraints)
    ; vowel a must be placed onto b
    (must-place a b)
    ; vowel e must be placed onto f
    (must-place e f)
    ; vowel i must be placed onto j
    (must-place i j)

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

    ; clear/top predicates (tops only)
    (clear g)
    (clear j)
  )

  (:goal (and
    ; Desired final tower (top -> bottom represented as a chain of on-relations):
    ; A on B, B on C, C on D, D on E, E on F, F on G, G on H, H on I, I on J, J on K, and K on table
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