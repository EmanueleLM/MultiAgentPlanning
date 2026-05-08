(define (domain orchestrator)
  :requirements :strips :typing :negative-preconditions
  :types agent task

  :predicates
    (agent ?a - agent)
    (task ?t - task)
    (can-do ?a - agent ?t - task)
    (done ?t - task)
    (done-by ?t - task ?a - agent)
    (audited ?t - task)
    (before ?t1 - task ?t2 - task)
  ; Multi-agent actions are kept distinct by prefixing operator names with the agent identity.
  
  ; Action performed by agent_a1 to complete the "prepare" task.
  (action a1_prepare
    :precondition (and
      (agent agent_a1)
      (task prepare)
      (can-do agent_a1 prepare)
      (not (done prepare))
    )
    :effect (and
      (done prepare)
      (done-by prepare agent_a1)
    )
  )

  ; Action performed by agent_a2 to complete the "verify" task.
  ; This enforces the dependency that "verify" occurs after "prepare" by requiring (done prepare).
  ; It also records the audit as a strict (hard) requirement by setting (audited verify) as an effect.
  (action a2_verify
    :precondition (and
      (agent agent_a2)
      (task verify)
      (can-do agent_a2 verify)
      (done prepare)
      (not (done verify))
    )
    :effect (and
      (done verify)
      (done-by verify agent_a2)
      (audited verify)
    )
  )

  ; Action performed by agent_a1 to complete the "deploy" task.
  ; Requires "verify" to be completed first to enforce the prepare->verify->deploy ordering.
  (action a1_deploy
    :precondition (and
      (agent agent_a1)
      (task deploy)
      (can-do agent_a1 deploy)
      (done verify)
      (not (done deploy))
    )
    :effect (and
      (done deploy)
      (done-by deploy agent_a1)
    )
  )
)