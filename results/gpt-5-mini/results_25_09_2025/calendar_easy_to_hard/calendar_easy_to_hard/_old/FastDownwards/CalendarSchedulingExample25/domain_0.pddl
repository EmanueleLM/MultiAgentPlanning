(define (domain multiagent-scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:predicates
    (free ?p - person ?s - slot)           ; person is free in a 30-min slot
    (next ?s1 - slot ?s2 - slot)          ; successor slot (30 min later)
    (start_allowed ?s - slot)             ; allowed start slots (Pamela's preference)
    (unscheduled)                         ; meeting not scheduled yet
    (confirmed-anthony ?s - slot)         ; anthony confirmed start ?s (covers ?s and next ?s)
    (confirmed-pamela ?s - slot)          ; pamela confirmed start ?s
    (confirmed-zachary ?s - slot)         ; zachary confirmed start ?s
    (meeting-scheduled)                   ; meeting scheduled
    (meeting-start ?s - slot)             ; meeting start slot
  )

  ;; Anthony confirms his availability for a candidate start (requires both slots free)
  (:action anthony-confirm
    :parameters (?s - slot ?s2 - slot)
    :precondition (and
      (unscheduled)
      (next ?s ?s2)
      (free anthony ?s)
      (free anthony ?s2)
    )
    :effect (confirmed-anthony ?s)
  )

  ;; Pamela confirms (requires her availability and that start is allowed per her preference)
  (:action pamela-confirm
    :parameters (?s - slot ?s2 - slot)
    :precondition (and
      (unscheduled)
      (next ?s ?s2)
      (start_allowed ?s)
      (free pamela ?s)
      (free pamela ?s2)
    )
    :effect (confirmed-pamela ?s)
  )

  ;; Zachary confirms his availability
  (:action zachary-confirm
    :parameters (?s - slot ?s2 - slot)
    :precondition (and
      (unscheduled)
      (next ?s ?s2)
      (free zachary ?s)
      (free zachary ?s2)
    )
    :effect (confirmed-zachary ?s)
  )

  ;; Orchestrator schedules the meeting once all agents have confirmed the same start
  (:action orchestrator-schedule
    :parameters (?s - slot ?s2 - slot)
    :precondition (and
      (unscheduled)
      (next ?s ?s2)
      (confirmed-anthony ?s)
      (confirmed-pamela ?s)
      (confirmed-zachary ?s)
    )
    :effect (and
      (not (unscheduled))
      (meeting-scheduled)
      (meeting-start ?s)
      ;; occupy both slots for each participant (remove free facts if present)
      (not (free anthony ?s)) (not (free anthony ?s2))
      (not (free pamela  ?s)) (not (free pamela  ?s2))
      (not (free zachary ?s)) (not (free zachary ?s2))
    )
  )
)