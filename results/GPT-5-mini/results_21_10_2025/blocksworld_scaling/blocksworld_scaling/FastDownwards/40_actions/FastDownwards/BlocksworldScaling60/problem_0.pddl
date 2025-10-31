(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)

  (:objects
    A I E - vowel-block
    D F G B J C H K - consonant-block
  )

  (:init
    ;; initial on relationships (as given)
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

    ;; clear (top) blocks initially: A, H, E
    (clear A)
    (clear H)
    (clear E)

    ;; both agents' hands are free initially
    (handfree-vowel)
    (handfree-consonant)

    ;; protection constraint coming from the vowel-agent preference:
    ;; keep A accessible on the table (no block may be placed onto A)
    (protected A)
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