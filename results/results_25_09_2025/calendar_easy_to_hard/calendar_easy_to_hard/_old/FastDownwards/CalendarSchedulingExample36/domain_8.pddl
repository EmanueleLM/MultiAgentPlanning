(define (domain multiagent_scheduling)
  (:requirements :strips :typing)
  (:types participant slot)
  (:constants donald zachary kathryn deborah teresa james - participant)
  (:predicates
    (available ?p - participant ?s - slot)
    (confirmed ?p - participant ?s - slot)
    (meeting_time ?s - slot)
  )

  (:action attend_donald
    :parameters (?s - slot)
    :precondition (available donald ?s)
    :effect (confirmed donald ?s)
  )

  (:action attend_zachary
    :parameters (?s - slot)
    :precondition (available zachary ?s)
    :effect (confirmed zachary ?s)
  )

  (:action attend_kathryn
    :parameters (?s - slot)
    :precondition (available kathryn ?s)
    :effect (confirmed kathryn ?s)
  )

  (:action attend_deborah
    :parameters (?s - slot)
    :precondition (available deborah ?s)
    :effect (confirmed deborah ?s)
  )

  (:action attend_teresa
    :parameters (?s - slot)
    :precondition (available teresa ?s)
    :effect (confirmed teresa ?s)
  )

  (:action attend_james
    :parameters (?s - slot)
    :precondition (available james ?s)
    :effect (confirmed james ?s)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (confirmed donald ?s)
      (confirmed zachary ?s)
      (confirmed kathryn ?s)
      (confirmed deborah ?s)
      (confirmed teresa ?s)
      (confirmed james ?s)
    )
    :effect (meeting_time ?s)
  )
)