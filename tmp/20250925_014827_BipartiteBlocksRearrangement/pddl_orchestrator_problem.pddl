(define (problem blocks-multiagent-problem)
  (:domain blocks-multiagent)

  (:objects
    A B C D E F G I - block
    v-agent c-agent - agent
    stack1 stack2 stack3 - slot
  )

  (:init
    ;; type classification (vowel / consonant)
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F) (consonant G)

    ;; initial stack1: bottom D, then C, then B, top A  (D on stack1)
    (on D stack1)
    (on C D)
    (on B C)
    (on A B)

    ;; initial stack2: bottom E, then G, then I, top F  (E on stack2)
    (on E stack2)
    (on G E)
    (on I G)
    (on F I)

    ;; table slot occupancy / clear nodes (tops)
    (clear A)
    (clear F)
    (clear stack3)      ; empty slot available (max 3 stacks)
    
    ;; agents are free initially
    (handempty v-agent)
    (handempty c-agent)
  )

  (:goal (and
    ;; desired stack1: bottom A, then B, then D, top E  (A on stack1, B on A, D on B, E on D)
    (on A stack1)
    (on B A)
    (on D B)
    (on E D)

    ;; desired stack2: bottom F, then C, then I, top G  (F on stack2, C on F, I on C, G on I)
    (on F stack2)
    (on C F)
    (on I C)
    (on G I)

    ;; exactly two nonempty stacks on the table: stack1 and stack2 are used, stack3 empty
    (clear stack3)
  ))
)