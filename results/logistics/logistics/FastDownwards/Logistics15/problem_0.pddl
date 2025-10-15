(define (problem scenario1)
  (:domain multiagent-tasks)
  (:objects
    agent1 agent2 - agent
    paltry sip clip wretched memory tightfisted - task
    res1 res2 - resource
    s1 s2 - slot
  )
  (:init
    ;; Agents and tasks
    (agent agent1)
    (agent agent2)
    (task paltry) (task sip) (task clip) (task wretched) (task memory) (task tightfisted)

    ;; Resources and their availability for scenario 1
    (resource res1) (resource res2)
    (available res1)
    (available res2)

    ;; Slots: s1 is the earliest slot for tasks that require earliest; s2 is a later slot
    (slot s1) (slot s2)
    (earliest s1)
    (slot-free s1) (slot-free s2)

    ;; Requirements: which resource each task strictly requires (inferred from public constraints)
    (requires paltry res1)
    (requires sip res2)
    (requires clip res1)
    (requires wretched res2)
    (requires memory res1)
    (requires tightfisted res2)

    ;; Public constraints interpreted as hard:
    ;; - paltry must be scheduled at the earliest available slot (s1)
    ;; - sip must be scheduled at the earliest available slot (s2) for this scenario
    ;; These are encoded by the action preconditions requiring (earliest ?s).
    ;; (earliest s1) already set above; for sip we mark s2 earliest for sip in this scenario:
    (earliest s2)
  )
  (:goal (and
    ;; Goals for scenario 1: finish a set of tasks, assigned to agents implicitly via actions
    (completed paltry)
    (completed sip)
    (completed clip)
  ))
)