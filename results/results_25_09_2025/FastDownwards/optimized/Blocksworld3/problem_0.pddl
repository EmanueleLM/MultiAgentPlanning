(define (problem multi-agent-blocks-problem)
  (:domain blocks-multi-agent)
  (:objects
    A E - vowel
    B C D - consonant
  )
  (:init
    ;; initial placement (shared initial state as received)
    (ontable A)
    (on B C)
    (on C D)
    (on D E)
    (ontable E)

    ;; clear tops
    (clear A)
    (clear B)

    ;; consonant-agent is initially free-handed
    (handempty-cons)
  )
  (:goal (and
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (ontable E)
  ))
)