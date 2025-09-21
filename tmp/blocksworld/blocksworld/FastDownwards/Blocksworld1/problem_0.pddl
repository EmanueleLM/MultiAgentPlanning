(define (problem multi-agent-blocks-problem)
  (:domain multi-agent-blocks)
  (:objects A B C D E F G H I J - block)

  (:init
    ;; Initial stacks:
    (ontable A)
    (ontable B)
    ;; Chain: C on D on E on F on G on H on I on J on the table
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (ontable J)

    ;; Clear (tops of stacks)
    (clear A)
    (clear B)
    (clear C)

    ;; Agents' hands are empty initially
    (handempty-vowel)
    (handempty-cons)

    ;; Capabilities: which blocks each agent may manipulate
    ;; vowel_agent can manipulate A, E, I
    (vowel A)
    (vowel E)
    (vowel I)

    ;; consonant_agent can manipulate B, C, D, F, G, H, J
    (consonant B)
    (consonant C)
    (consonant D)
    (consonant F)
    (consonant G)
    (consonant H)
    (consonant J)
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
    (ontable J)
  ))
)