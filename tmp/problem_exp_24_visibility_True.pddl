(define (problem vault-orchestrator-problem)
  (:domain vault-orchestrator)

  (:objects
    agent_a agent_b - agent
    key1 - item
    obj1 - item
    vault1 - vault
  )

  (:init
    (has agent_a key1)
    (inVault obj1)
    (not (open vault1))
    (not (insideVault agent_a))
    (not (insideVault agent_b))
    (small agent_b)
  )

  (:goal (and
            (open vault1)
            (has agent_b obj1)
          ))
)