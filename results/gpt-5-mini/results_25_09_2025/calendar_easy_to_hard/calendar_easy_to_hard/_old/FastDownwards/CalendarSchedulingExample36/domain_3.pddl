(define (domain multiagent-scheduling)
  (:requirements :strips :typing)
  (:types participant slot)
  (:predicates
    (available ?p - participant ?s - slot)
    (confirmed ?p - participant ?s - slot)
    (meeting-time ?s - slot)
  )

  (:action attend-donald
    :parameters (?s - slot)
    :precondition (available donald ?s)
    :effect (confirmed donald ?s)
  )

  (:action attend-zachary
    :parameters (?s - slot)
    :precondition (available zachary ?s)
    :effect (confirmed zachary ?s)
  )

  (:action attend-kathryn
    :parameters (?s - slot)
    :precondition (available kathryn ?s)
    :effect (confirmed kathryn ?s)
  )

  (:action attend-deborah
    :parameters (?s - slot)
    :precondition (available deborah ?s)
    :effect (confirmed deborah ?s)
  )

  (:action attend-teresa
    :parameters (?s - slot)
    :precondition (available teresa ?s)
    :effect (confirmed teresa ?s)
  )

  (:action attend-james
    :parameters (?s - slot)
    :precondition (available james ?s)
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