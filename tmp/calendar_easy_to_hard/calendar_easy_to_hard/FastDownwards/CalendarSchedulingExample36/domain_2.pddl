(define (domain multiagent-scheduling)
  (:requirements :strips :typing)
  (:types participant slot)
  (:constants donald zachary kathryn deborah teresa james - participant)
  (:predicates
    (available ?p - participant ?s - slot)
    (meeting-time ?s - slot)
  )

  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (available donald ?s)
      (available zachary ?s)
      (available kathryn ?s)
      (available deborah ?s)
      (available teresa ?s)
      (available james ?s)
    )
    :effect (meeting-time ?s)
  )
)