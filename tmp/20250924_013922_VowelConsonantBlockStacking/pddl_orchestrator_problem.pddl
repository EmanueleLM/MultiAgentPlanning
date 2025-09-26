(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)

  (:objects
    A B C D E F G I - block
    slot1 slot2 slot3 - slot
  )

  (:init
    ;; types (vowels and consonants)
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F) (consonant G)

    ;; initial stacking (lists are bottom-to-top as provided)
    ;; stack1: ['D', 'C', 'B', 'A'] => D bottom, C on D, B on C, A on B
    (table-bottom D)
    (bottom-slot D slot1)
    (on C D)
    (on B C)
    (on A B)

    ;; stack2: ['E', 'G', 'I', 'F'] => E bottom, G on E, I on G, F on I
    (table-bottom E)
    (bottom-slot E slot2)
    (on G E)
    (on I G)
    (on F I)

    ;; slot occupancy: slot1 and slot2 used, slot3 free
    (slot-free slot3)

    ;; clear/top blocks (top_blocks: ['A', 'F'])
    (clear A)
    (clear F)
    ;; other blocks have something on top initially (no clear predicate for them)

    ;; both agents start with empty hands
    (handempty-v)
    (handempty-c)
  )

  (:goal (and
    ;; goal stacks described bottom-to-top:
    ;; stack_left: ['A', 'B', 'D', 'E'] => A bottom on table, B on A, D on B, E on D
    (table-bottom A)
    (on B A)
    (on D B)
    (on E D)
    (clear E)

    ;; stack_right: ['F', 'C', 'I', 'G'] => F bottom on table, C on F, I on C, G on I
    (table-bottom F)
    (on C F)
    (on I C)
    (on G I)
    (clear G)

    ;; agent hands empty at goal (no one holding any block)
    (handempty-v)
    (handempty-c)
  ))
)