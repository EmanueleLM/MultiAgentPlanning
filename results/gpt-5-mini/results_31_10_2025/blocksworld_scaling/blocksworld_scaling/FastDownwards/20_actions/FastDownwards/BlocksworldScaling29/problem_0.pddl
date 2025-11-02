(define (problem vc-stacking-problem)
  (:domain vc-stacking-domain)
  (:objects
    a e b c - block
    table - table
  )

  (:init
    ; types: vowels and consonants
    (vowel a)
    (vowel e)
    (consonant b)
    (consonant c)

    ; initial on / ontable relations
    (on a table)
    (ontable a)

    (on c a)
    ; c is on a, so a is not clear initially

    (on b table)
    (ontable b)

    (on e table)
    (ontable e)

    ; clear predicates: blocks that have nothing on top
    (clear c)
    (clear b)
    (clear e)
  )

  (:goal (and
    ; global stacking goal: place consonant b on vowel a, and place consonant c on vowel e
    (on b a)
    (on c e)
  ))
)