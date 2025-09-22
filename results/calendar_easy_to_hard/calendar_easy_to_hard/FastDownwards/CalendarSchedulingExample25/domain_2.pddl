(define (domain multiagent-scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:constants anthony pamela zachary - person)
  (:predicates
    (free ?p - person ?s - slot)
    (next ?s1 - slot ?s2 - slot)
    (start_allowed ?s - slot)
    (unscheduled)
    (confirmed-anthony ?s - slot)
    (confirmed-pamela ?s - slot)
    (confirmed-zachary ?s - slot)
    (meeting-scheduled)
    (meeting-start ?s - slot)
  )

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
      (not (free anthony ?s)) (not (free anthony ?s2))
      (not (free pamela ?s)) (not (free pamela ?s2))
      (not (free zachary ?s)) (not (free zachary ?s2))
    )
  )
)