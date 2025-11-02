(define (problem orchestrator-problem)
  (:domain multi-agent-chain)
  (:objects
    planner_agent validator_agent - agent
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 - obj
  )

  (:init
    ;; Agents available
    (agent planner_agent)
    (agent validator_agent)

    ;; Initial linear chain: 0->1->2->3->4->5->6->7->8
    (next object_0 object_1)
    (next object_1 object_2)
    (next object_2 object_3)
    (next object_3 object_4)
    (next object_4 object_5)
    (next object_5 object_6)
    (next object_6 object_7)
    (next object_7 object_8)

    ;; Free slots (only object_8 has no successor; only object_0 has no predecessor)
    (succ-free object_8)
    (pred-free object_0)

    ;; No other succ-free or pred-free facts are true initially (their absence means false)
    ;; No objects are remembered initially
  )

  (:goal (next object_8 object_6))
)