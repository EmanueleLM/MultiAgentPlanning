(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)

  (:objects
    A I E - vowel-block
    D F G B J C H K - consonant-block
  )

  (:init
    ;; initial on relations (given)
    (on I D)
    (on G I)
    (on B G)
    (on C B)
    (on H C)
    (on K J)
    (on E K)
    (on J F)

    ;; table facts
    (ontable A)
    (ontable D)
    (ontable F)

    ;; initial clear (top) blocks
    (clear A)
    (clear H)
    (clear E)

    ;; hands free initially
    (handfree-vowel)
    (handfree-consonant)
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
    (on J K)
    (ontable K)
  ))
)