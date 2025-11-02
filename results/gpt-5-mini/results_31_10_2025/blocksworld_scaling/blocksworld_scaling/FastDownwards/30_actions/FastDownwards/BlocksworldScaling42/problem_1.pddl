(define (problem blocks-multiagent-problem)
  (:domain blocks-multiagent)

  (:objects
    A B C D E F G H I J K - block
    vowel_agent consonant_agent orchestrator - agent
  )

  (:init
    ;; initial stacking (two stacks described bottom-to-top)
    (ontable D)
    (on K D)
    (on A K)
    (on H A)
    (on G H)
    (on B G)

    (ontable F)
    (on E F)
    (on I E)
    (on J I)
    (on C J)

    ;; clear = only top blocks are clear initially
    (clear B)
    (clear C)

    ;; type labels: vowels and consonants
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

    ;; agent capabilities and hand state
    (can-move-vowel vowel_agent)
    (can-move-consonant consonant_agent)
    (handempty vowel_agent)
    (handempty consonant_agent)
  )

  (:goal (and
    ;; target single tower bottom-to-top: K J I H G F E D C B A
    (ontable K)
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