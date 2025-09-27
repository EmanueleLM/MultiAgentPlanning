(define (domain meeting-scheduling)
  (:requirements :typing :action-costs :negative-preconditions :equality :adl)
  (:types orchestrator participant slot meeting)
  (:predicates
    (available ?p - participant ?s - slot)
    (unscheduled ?m - meeting)
    (scheduled ?m - meeting ?s - slot)
    (confirmed ?p - participant ?m - meeting ?s - slot)
    (meeting-scheduled ?m - meeting)
    (late-slot ?s - slot)
  )
  (:action confirm
    :parameters (?p - participant ?m - meeting ?s - slot)
    :precondition (and (unscheduled ?m) (available ?p ?s))
    :effect (and (confirmed ?p ?m ?s))
    :cost 0
  )
  (:action finalize-schedule-no-penalty
    :parameters (?o - orchestrator ?m - meeting ?s - slot ?evelyn - participant ?roy - participant ?billy - participant ?gregory - participant ?vincent - participant ?philip - participant ?william - participant)
    :precondition (and (unscheduled ?m)
                       (confirmed ?evelyn ?m ?s) (confirmed ?roy ?m ?s) (confirmed ?billy ?m ?s)
                       (confirmed ?gregory ?m ?s) (confirmed ?vincent ?m ?s) (confirmed ?philip ?m ?s)
                       (confirmed ?william ?m ?s) (not (late-slot ?s)))
    :effect (and (not (unscheduled ?m)) (scheduled ?m ?s) (meeting-scheduled ?m))
    :cost 0
  )
  (:action finalize-schedule-penalty
    :parameters (?o - orchestrator ?m - meeting ?s - slot ?evelyn - participant ?roy - participant ?billy - participant ?gregory - participant ?vincent - participant ?philip - participant ?william - participant)
    :precondition (and (unscheduled ?m)
                       (confirmed ?evelyn ?m ?s) (confirmed ?roy ?m ?s) (confirmed ?billy ?m ?s)
                       (confirmed ?gregory ?m ?s) (confirmed ?vincent ?m ?s) (confirmed ?philip ?m ?s)
                       (confirmed ?william ?m ?s) (late-slot ?s))
    :effect (and (not (unscheduled ?m)) (scheduled ?m ?s) (meeting-scheduled ?m))
    :cost 1
  )
)