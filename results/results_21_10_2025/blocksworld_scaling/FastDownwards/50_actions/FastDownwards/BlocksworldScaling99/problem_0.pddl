(define (problem blocks-multiagent-problem)
  (:domain blocks-multiagent)
  (:objects
    H D I J C F K E G L B A - block
  )

  (:init
    ;; Type classification: vowels and consonants (per English vowels A,E,I,O,U)
    (vowel A)
    (vowel E)
    (vowel I)
    (consonant H)
    (consonant D)
    (consonant J)
    (consonant C)
    (consonant F)
    (consonant K)
    (consonant G)
    (consonant L)
    (consonant B)

    ;; Initial stacks (bottom-to-top)
    ;; Stack1: bottom H then F then K on top
    (ontable H)
    (on F H)
    (on K F)

    ;; Stack2: bottom D then I then J then E then G then L then B on top
    (ontable D)
    (on I D)
    (on J I)
    (on E J)
    (on G E)
    (on L G)
    (on B L)

    ;; Stack3: bottom C then A on top
    (ontable C)
    (on A C)

    ;; Clear/top blocks (only top blocks of each stack)
    (clear K)
    (clear B)
    (clear A)
  )

  (:goal (and
    ;; Desired single final stack bottom L on the table then K, J, I, H, G, F, E, D, C, B, A (A on top)
    (ontable L)
    (on K L)
    (on J K)
    (on I J)
    (on H I)
    (on G H)
    (on F G)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)
  ))
)