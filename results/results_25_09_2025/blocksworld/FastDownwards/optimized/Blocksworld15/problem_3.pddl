(define (problem blocks_multi_agents_problem)
  (:domain blocks_multi_agent)
  (:objects A B C D E F G H I J K - block
            vowel_agent consonant_agent orchestrator - agent)

  (:init
    ;; Stack1 bottom to top: F H J C E G B A
    (ontable F)
    (on H F)
    (on J H)
    (on C J)
    (on E C)
    (on G E)
    (on B G)
    (on A B)

    ;; Stack2 bottom to top: D K I
    (ontable D)
    (on K D)
    (on I K)

    (clear A)
    (clear I)

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
    (consonant K)

    (vowel-agent vowel_agent)
    (consonant-agent consonant_agent)
  )

  (:goal (and
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