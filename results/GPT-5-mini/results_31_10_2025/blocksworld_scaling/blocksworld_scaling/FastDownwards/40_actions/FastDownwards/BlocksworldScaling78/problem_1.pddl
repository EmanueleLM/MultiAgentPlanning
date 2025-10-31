(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)
  (:objects
    A E I J H D C G F K B - block
  )

  (:init
    ;; initial "on" relations (stack specifications)
    (on K I)
    (on B G)
    (on G D)
    (on D H)
    (on H A)
    (on F C)
    (on C J)
    (on J E)

    ;; blocks on table (bottoms)
    (ontable I)
    (ontable A)
    (ontable E)

    ;; clear (top) status initially: K, B, F are top of their stacks
    (clear K)
    (clear B)
    (clear F)

    ;; classification of vowels and consonants
    (vowel A)
    (vowel E)
    (vowel I)

    (consonant J)
    (consonant H)
    (consonant D)
    (consonant C)
    (consonant G)
    (consonant F)
    (consonant K)
    (consonant B)
  )

  (:goal (and
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J K)
    (ontable K)
  ))
)