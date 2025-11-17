(define (domain orchestration-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    planner analyzer auditor worker - agent
    agent task stage - object
  )

  (:predicates
    ; type predicates are implicit by typing; these are state predicates:
    (agent-available ?a - agent)
    (task-at ?t - task ?s - stage)
    (next ?s1 - stage ?s2 - stage)
    (analyzed ?t - task)
    (approved ?t - task)
    (completed ?t - task)
  )

  ; Planner schedules a task from stage s1 to its successor s2.
  (:action planner_schedule
    :parameters (?pl - planner ?t - task ?s1 - stage ?s2 - stage)
    :precondition (and
      (agent-available ?pl)
      (task-at ?t ?s1)
      (next ?s1 ?s2)
    )
    :effect (and
      (task-at ?t ?s2)
      (not (task-at ?t ?s1))
    )
  )

  ; Analyzer performs analysis, moving the task from scheduled (s2) to analyzed (s3),
  ; and marks it as analyzed.
  (:action analyzer_analyze
    :parameters (?an - analyzer ?t - task ?s2 - stage ?s3 - stage)
    :precondition (and
      (agent-available ?an)
      (task-at ?t ?s2)
      (next ?s2 ?s3)
    )
    :effect (and
      (task-at ?t ?s3)
      (not (task-at ?t ?s2))
      (analyzed ?t)
    )
  )

  ; Auditor approves after analysis, moving the task from analyzed (s3) to approved (s4),
  ; and marks it as approved. Requires the analyzed flag to be set.
  (:action auditor_approve
    :parameters (?aud - auditor ?t - task ?s3 - stage ?s4 - stage)
    :precondition (and
      (agent-available ?aud)
      (task-at ?t ?s3)
      (next ?s3 ?s4)
      (analyzed ?t)
    )
    :effect (and
      (task-at ?t ?s4)
      (not (task-at ?t ?s3))
      (approved ?t)
    )
  )

  ; Worker executes the task after approval, moving from approved (s4) to executed/completed (s5),
  ; and marks it completed. Requires the approved flag to be set.
  (:action worker_execute
    :parameters (?w - worker ?t - task ?s4 - stage ?s5 - stage)
    :precondition (and
      (agent-available ?w)
      (task-at ?t ?s4)
      (next ?s4 ?s5)
      (approved ?t)
    )
    :effect (and
      (task-at ?t ?s5)
      (not (task-at ?t ?s4))
      (completed ?t)
    )
  )
)