(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)
  (:objects A B C D E F G H I J)
  (:init
    ;; Ownership by agents (what each agent can move)
    (vowel A)
    (vowel E)
    (vowel I)

    (consonant B)
    (consonant C)
    (consonant D)
    (consonant F)
    (consonant G)
    (consonant H)
    (consonant J)

    ;; Initial stacks (shared view)
    ;; stack1: A (table) - J - I - G - B (B is top)
    (ontable A)
    (on J A)
    (on I J)
    (on G I)
    (on B G)

    ;; stack2: C (table) - D (D is top)
    (ontable C)
    (on D C)

    ;; stack3: H (table) - F (F is top)
    (ontable H)
    (on F H)

    ;; stack4: E (table) (E is top)
    (ontable E)

    ;; clear (top) blocks
    (clear B)
    (clear D)
    (clear F)
    (clear E)
  )

  (:goal (and
    ;; final single stack bottom J on table then I then H then G then F then E then D then C then B then A on top
    (ontable J)
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