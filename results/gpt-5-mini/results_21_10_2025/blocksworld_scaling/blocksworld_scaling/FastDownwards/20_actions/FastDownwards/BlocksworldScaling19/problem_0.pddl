(define (problem make-stack-N-bottom-A-top)
  (:domain multi-agent-blocks)
  (:objects
    A N - block
    vowel_agent consonant_agent - agent
  )
  (:init
    ;; Initial placement: both blocks are on the table and clear
    (ontable A)
    (ontable N)
    (clear A)
    (clear N)

    ;; Type labelling for agent movement constraints
    (vowel A)
    (consonant N)

    ;; Both agents start with empty hands
    (handempty-vowel)
    (handempty-consonant)
  )
  (:goal (and
    ;; Single stack requirement: N on the table and A on N
    (ontable N)
    (on A N)
    (clear A)
  ))
)