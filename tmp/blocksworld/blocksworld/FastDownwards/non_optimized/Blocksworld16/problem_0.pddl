(define (problem multi_agent_stack_problem)
  (:domain multi_agent_blocks)

  (:objects
    A B C D E F G H I J K L M table
  )

  (:init
    ;; initial stacking (unified representation: on = block-on-block, ontable = on table)
    (ontable B)
    (on C B)
    (on D C)
    (on H D)

    (ontable E)
    (on J E)
    (on F J)
    (on G F)
    (on L G)

    (ontable K)
    (on I K)
    (on M I)
    (on A M)

    ;; clear (tops of stacks)
    (clear H)
    (clear L)
    (clear A)

    ;; vowel agent state and capabilities (from vowel agent)
    (handempty)
    (vowel A)
    (vowel E)
    (vowel I)

    ;; consonant agent capabilities (from consonant agent)
    (consonant B)
    (consonant C)
    (consonant D)
    (consonant F)
    (consonant G)
    (consonant H)
    (consonant J)
    (consonant K)
    (consonant L)
    (consonant M)
  )

  (:goal (and
    ;; final stack top-to-bottom: A on B on C on D on E on F on G on H on I on J on K on L on M on table
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
    (on K L)
    (on L M)
    (ontable M)
  ))
)