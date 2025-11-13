(define (problem sequence-problem)
  (:domain sequence-tasks)

  ;; objects: two agents and the tasks. 'start' is modeled as a task-like marker used only
  ;; to enforce the required first step (paltry) via last-done start.
  (:objects
    agentA agentB - agent
    start paltry sip clip wretched memory tightfisted - task
  )

  (:init
    ;; Capabilities: which agent can perform which named actions/tasks.
    ;; These are not preferences but hard constraints (encoded as capabilities).
    (can-perform agentA paltry)
    (can-perform agentA sip)
    (can-perform agentA memory)

    (can-perform agentB clip)
    (can-perform agentB wretched)
    (can-perform agentB tightfisted)

    ;; initial ordering marker: nothing done yet, and 'start' is the last-done marker so paltry must come next.
    (last-done start)
  )

  ;; The goal fixes all mandated terminal conditions:
  ;;  - every named task must be done,
  ;;  - the explicit next relations between successive tasks must hold,
  ;;  - the final last-done must be tightfisted (enforces terminal position).
  (:goal (and
    (done paltry)
    (done sip)
    (done clip)
    (done wretched)
    (done memory)
    (done tightfisted)

    (next paltry sip)
    (next sip clip)
    (next clip wretched)
    (next wretched memory)
    (next memory tightfisted)

    (last-done tightfisted)
  ))
)