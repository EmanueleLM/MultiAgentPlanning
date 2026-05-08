(define (domain workflow-integration)
  (:requirements :strips :typing)
  (:types agent task slot)

  (:predicates
    (capable ?a - agent ?t - task)             ; agent can perform a task
    (task-slot ?t - task ?s - slot)            ; task must be executed in this slot (hard constraint)
    (empty ?s - slot)                          ; slot is currently free
    (occupied ?s - slot)                       ; slot is taken (mutually exclusive with empty)
    (done-at ?t - task ?s - slot)              ; task completed at a particular slot (terminal facts)
    (next ?s1 - slot ?s2 - slot)               ; successor relation between slots (enforces order)
  )

  ;; Observer fragment: performs the observe task in its assigned slot
  (:action observer-perform-observe
    :parameters (?a - agent ?s - slot)
    :precondition (and
      (capable ?a observe)
      (task-slot observe ?s)
      (empty ?s)
    )
    :effect (and
      (done-at observe ?s)
      (occupied ?s)
      (not (empty ?s))
    )
  )

  ;; Reasoner fragment: performs the infer task, requires observe completed in predecessor slot
  (:action reasoner-perform-infer
    :parameters (?a - agent ?prev - slot ?s - slot)
    :precondition (and
      (capable ?a infer)
      (task-slot infer ?s)
      (empty ?s)
      (done-at observe ?prev)
      (next ?prev ?s)
    )
    :effect (and
      (done-at infer ?s)
      (occupied ?s)
      (not (empty ?s))
    )
  )

  ;; Auditor fragment: performs the audit task, requires infer completed in predecessor slot
  (:action auditor-perform-audit
    :parameters (?a - agent ?prev - slot ?s - slot)
    :precondition (and
      (capable ?a audit)
      (task-slot audit ?s)
      (empty ?s)
      (done-at infer ?prev)
      (next ?prev ?s)
    )
    :effect (and
      (done-at audit ?s)
      (occupied ?s)
      (not (empty ?s))
    )
  )

  ;; Auditor remediation fragment: performs remediation, requires audit completed in predecessor slot
  (:action auditor-perform-remediate
    :parameters (?a - agent ?prev - slot ?s - slot)
    :precondition (and
      (capable ?a remediate)
      (task-slot remediate ?s)
      (empty ?s)
      (done-at audit ?prev)
      (next ?prev ?s)
    )
    :effect (and
      (done-at remediate ?s)
      (occupied ?s)
      (not (empty ?s))
    )
  )
)