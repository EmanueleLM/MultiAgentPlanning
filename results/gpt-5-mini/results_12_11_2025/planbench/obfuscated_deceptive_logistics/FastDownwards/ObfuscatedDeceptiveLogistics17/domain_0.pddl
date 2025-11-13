(define (domain sequence-tasks)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent task)

  (:predicates
    ;; capability: agent can perform a specific task (task objects are named exactly)
    (can-perform ?a - agent ?t - task)

    ;; which tasks have been completed
    (done ?t - task)

    ;; which task was the last one completed (enforces immediate succession)
    (last-done ?t - task)

    ;; explicit successor relation recorded when a task is executed immediately after its predecessor
    (next ?t1 - task ?t2 - task)
  )

  ;; The following actions correspond exactly to the provided action names.
  ;; Each action:
  ;;  - requires that the actor can perform that named task,
  ;;  - requires the named task not already done,
  ;;  - requires that the predecessor is the current last-done (except paltry which requires the start marker),
  ;;  - marks the task as done, updates last-done to that task, and asserts the successor relation
  ;;    (the successor relation is asserted only when the action is the immediate successor of its predecessor).
  ;; This enforces a strict contiguous ordering: a successor can only be executed if its immediate
  ;; predecessor is the current last-done; the successor action then records the (next predecessor successor) fact.

  (:action paltry
    :parameters (?a - agent)
    :precondition (and
      (can-perform ?a paltry)
      (not (done paltry))
      ;; paltry is the first real task and must follow the special start marker
      (last-done start)
    )
    :effect (and
      (done paltry)
      (not (last-done start))
      (last-done paltry)
      ;; paltry has no predecessor to record next for (start is a marker, not recorded in next goals)
    )
  )

  (:action sip
    :parameters (?a - agent)
    :precondition (and
      (can-perform ?a sip)
      (not (done sip))
      (last-done paltry)
    )
    :effect (and
      (done sip)
      (not (last-done paltry))
      (last-done sip)
      (next paltry sip)
    )
  )

  (:action clip
    :parameters (?a - agent)
    :precondition (and
      (can-perform ?a clip)
      (not (done clip))
      (last-done sip)
    )
    :effect (and
      (done clip)
      (not (last-done sip))
      (last-done clip)
      (next sip clip)
    )
  )

  (:action wretched
    :parameters (?a - agent)
    :precondition (and
      (can-perform ?a wretched)
      (not (done wretched))
      (last-done clip)
    )
    :effect (and
      (done wretched)
      (not (last-done clip))
      (last-done wretched)
      (next clip wretched)
    )
  )

  (:action memory
    :parameters (?a - agent)
    :precondition (and
      (can-perform ?a memory)
      (not (done memory))
      (last-done wretched)
    )
    :effect (and
      (done memory)
      (not (last-done wretched))
      (last-done memory)
      (next wretched memory)
    )
  )

  (:action tightfisted
    :parameters (?a - agent)
    :precondition (and
      (can-perform ?a tightfisted)
      (not (done tightfisted))
      (last-done memory)
    )
    :effect (and
      (done tightfisted)
      (not (last-done memory))
      (last-done tightfisted)
      (next memory tightfisted)
    )
  )
)