(define (problem multiagent-blocks-global)
  (:domain multiagent-blocks-combined)
  (:objects
    A B C D E F G H I J K L M N - block
    vowel_agent consonant_agent orchestrator - agent
  )

  (:init
    ;; Initial stacks according to the environment (stack1 bottom-to-top: I C H G A N K)
    (ontable I)
    (on C I)
    (on H C)
    (on G H)
    (on A G)
    (on N A)
    (on K N)

    ;; stack2 bottom-to-top: D F E M L B J
    (ontable D)
    (on F D)
    (on E F)
    (on M E)
    (on L M)
    (on B L)
    (on J B)

    ;; Top blocks are clear
    (clear K)
    (clear J)

    ;; Vowel / consonant classification (vowels: A E I)
    (is-vowel A)
    (is-vowel E)
    (is-vowel I)

    (is-consonant B)
    (is-consonant C)
    (is-consonant D)
    (is-consonant F)
    (is-consonant G)
    (is-consonant H)
    (is-consonant J)
    (is-consonant K)
    (is-consonant L)
    (is-consonant M)
    (is-consonant N)

    ;; Agents start with empty hands
    (handempty vowel_agent)
    (handempty consonant_agent)
    ;; orchestrator has no direct manipulation rights in this domain (no hand predicates necessary)
  )

  ;; Global goal: single tower on table with N at bottom and sequence above it:
  ;; N M L K J I H G F E D C B A  (bottom-to-top)
  (:goal (and
    (ontable N)
    (on M N)
    (on L M)
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