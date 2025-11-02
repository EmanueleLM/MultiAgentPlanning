(define (problem blocks-multiagent-prob)
  (:domain blocks-multiagent)
  (:objects
    A B C D E F G H I J K - block
    agent_alpha agent_beta - agent
  )
  (:init
    (on A C)
    (on C K)
    (on H G)
    (on G B)
    (on D E)
    (on I J)
    (on J F)
    (ontable K)
    (ontable B)
    (ontable E)
    (ontable F)
    (clear A)
    (clear H)
    (clear I)
    (clear D)
    (handempty agent_alpha)
    (handempty agent_beta)
    ;; no (anyholding) fact: initially no agent is holding any block
  )
  ;; The final state after the (unspecified) 30-step sequence is not provided in the reports.
  ;; Given the available public information and agent reports, the known final state is identical
  ;; to the provided initial state (no actions are guaranteed to have been executed in the reports).
  (:goal (and
    (on A C)
    (on C K)
    (on H G)
    (on G B)
    (on D E)
    (on I J)
    (on J F)
    (ontable K)
    (ontable B)
    (ontable E)
    (ontable F)
    (clear A)
    (clear H)
    (clear I)
    (clear D)
    (handempty agent_alpha)
    (handempty agent_beta)
  ))
)