(define (domain multi-agent-meeting)
  (:requirements :strips :typing :existential-preconditions)
  (:types slot)
  (:predicates
    (slot ?s - slot)
    (free-roy ?s - slot)
    (free-kathryn ?s - slot)
    (free-amy ?s - slot)
    (scheduled-roy ?s - slot)
    (scheduled-kathryn ?s - slot)
    (scheduled-amy ?s - slot)
    (meeting-scheduled ?s - slot)
    (preferred-amy ?s - slot)
  )

  ;; Roy's scheduling action (based on agent 1's model)
  (:action roy_schedule
    :parameters (?s - slot)
    :precondition (free-roy ?s)
    :effect (and (scheduled-roy ?s) (not (free-roy ?s)))
  )

  ;; Kathryn's scheduling action (based on agent 2's model: available -> free-kathryn)
  (:action kathryn_schedule
    :parameters (?s - slot)
    :precondition (free-kathryn ?s)
    :effect (and (scheduled-kathryn ?s) (not (free-kathryn ?s)))
  )

  ;; Amy's scheduling action (based on agent 3's model)
  (:action amy_schedule
    :parameters (?s - slot)
    :precondition (free-amy ?s)
    :effect (and (scheduled-amy ?s) (not (free-amy ?s)))
  )

  ;; Confirmation/join action: only when all three have scheduled the same slot
  (:action confirm_meeting
    :parameters (?s - slot)
    :precondition (and (scheduled-roy ?s) (scheduled-kathryn ?s) (scheduled-amy ?s))
    :effect (and (meeting-scheduled ?s))
  )
)