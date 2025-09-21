(define (domain multiagent-scheduling)
  (:requirements :strips :typing)
  (:types participant aslot slot)
  (:constants donald zachary kathryn deborah teresa james - participant)

  (:predicates
    (owner ?a - aslot ?p - participant)
    (maps ?a - aslot ?s - slot)
    (available ?a - aslot)
    (confirmed ?p - participant ?s - slot)
    (meeting-time ?s - slot)
  )

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