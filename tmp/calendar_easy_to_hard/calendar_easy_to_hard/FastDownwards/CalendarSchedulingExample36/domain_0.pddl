(define (domain multiagent-scheduling)
  (:requirements :strips :typing)
  (:types participant aslot slot)

  (:predicates
    (owner ?a - aslot ?p - participant)    ; agent-specific slot owned by participant
    (maps ?a - aslot ?s - slot)           ; agent-specific slot maps to a unified slot
    (available ?a - aslot)                ; that agent-specific slot is available for the agent
    (confirmed ?p - participant ?s - slot); participant confirmed for unified slot
    (meeting-time ?s - slot)              ; meeting scheduled at unified slot
  )

  ;; Distinct confirm actions preserved for each participant (keeps agent actions distinct)
  (:action confirm-donald
    :parameters (?as - aslot ?s - slot)
    :precondition (and (owner ?as donald) (maps ?as ?s) (available ?as))
    :effect (confirmed donald ?s)
  )

  (:action confirm-zachary
    :parameters (?as - aslot ?s - slot)
    :precondition (and (owner ?as zachary) (maps ?as ?s) (available ?as))
    :effect (confirmed zachary ?s)
  )

  (:action confirm-kathryn
    :parameters (?as - aslot ?s - slot)
    :precondition (and (owner ?as kathryn) (maps ?as ?s) (available ?as))
    :effect (confirmed kathryn ?s)
  )

  (:action confirm-deborah
    :parameters (?as - aslot ?s - slot)
    :precondition (and (owner ?as deborah) (maps ?as ?s) (available ?as))
    :effect (confirmed deborah ?s)
  )

  (:action confirm-teresa
    :parameters (?as - aslot ?s - slot)
    :precondition (and (owner ?as teresa) (maps ?as ?s) (available ?as))
    :effect (confirmed teresa ?s)
  )

  (:action confirm-james
    :parameters (?as - aslot ?s - slot)
    :precondition (and (owner ?as james) (maps ?as ?s) (available ?as))
    :effect (confirmed james ?s)
  )

  ;; Final scheduling action requires all participants confirmed for the same unified slot
  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (confirmed donald ?s)
      (confirmed zachary ?s)
      (confirmed kathryn ?s)
      (confirmed deborah ?s)
      (confirmed teresa ?s)
      (confirmed james ?s)
    )
    :effect (meeting-time ?s)
  )
)