(define (problem blocks_multiagent_problem)
  (:domain blocks_multiagent)
  (:objects
    A E I H G B J C D F - block
    vowel_agent consonant_agent - agent
  )

  (:init
    ;; labelling
    (vowel A) (vowel E) (vowel I)
    (consonant H) (consonant G) (consonant B) (consonant J) (consonant C) (consonant D) (consonant F)

    ;; initial stacking (given)
    (ontable H)
    (ontable A)
    (ontable E)
    (ontable I)

    (on G A)
    (on B E)
    (on J H)
    (on C J)
    (on D B)
    (on F C)

    ;; clear = top blocks only
    (clear F)
    (clear G)
    (clear I)
    (clear D)
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