```lisp
(define (problem integrated-blocks-problem)
  (:domain integrated-blocks)

  (:objects
    block-A - block
    block-E - block
    block-I - block
    block-B - block
    block-C - block
    block-D - block
    vowel_robot - robot
    consonant_bot - robot
  )

  (:init
    ; Vowel specific initializations
    (on-table block-A)
    (on-table block-E)
    (on-table block-I)
    (clear block-A)
    (clear block-E)
    (clear block-I)
    (handempty vowel_robot)
    (is-vowel-robot vowel_robot)

    ; Consonant specific initializations
    (ontable block-B)
    (ontable block-C)
    (ontable block-D)
    (clear block-B)
    (clear block-C)
    (clear block-D)
    (handempty consonant_bot)
    (is-consonant block-B)
    (is-consonant block-C)
    (is-consonant block-D)
    (is-consonant-robot consonant_bot)
  )

  (:goal
    (and
      ; Vowel goal configuration
      (on block-A block-E)
      (on block-E block-I)
      (on-table block-I)

      ; Consonant goal configuration
      (on block-B block-A)
      (on block-C block-B)
      (ontable block-D)
      (clear block-C)
      (clear block-D)
    )
  )
)
```