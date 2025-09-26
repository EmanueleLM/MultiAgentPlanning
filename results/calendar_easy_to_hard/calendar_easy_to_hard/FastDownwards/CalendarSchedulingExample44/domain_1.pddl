(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant timeslot)
  (:constants kayla sandra ryan kathleen walter arthur heather - participant)
  (:predicates
    (free ?p - participant ?s - timeslot)
    (confirmed ?p - participant ?s - timeslot)
    (scheduled)
    (meeting-at ?s - timeslot)
  )

  (:action confirm-kayla
    :parameters (?s - timeslot)
    :precondition (and (free kayla ?s) (not (confirmed kayla ?s)))
    :effect (and (confirmed kayla ?s))
  )

  (:action confirm-sandra
    :parameters (?s - timeslot)
    :precondition (and (free sandra ?s) (not (confirmed sandra ?s)))
    :effect (and (confirmed sandra ?s))
  )

  (:action confirm-ryan
    :parameters (?s - timeslot)
    :precondition (and (free ryan ?s) (not (confirmed ryan ?s)))
    :effect (and (confirmed ryan ?s))
  )

  (:action confirm-kathleen
    :parameters (?s - timeslot)
    :precondition (and (free kathleen ?s) (not (confirmed kathleen ?s)))
    :effect (and (confirmed kathleen ?s))
  )

  (:action confirm-walter
    :parameters (?s - timeslot)
    :precondition (and (free walter ?s) (not (confirmed walter ?s)))
    :effect (and (confirmed walter ?s))
  )

  (:action confirm-arthur
    :parameters (?s - timeslot)
    :precondition (and (free arthur ?s) (not (confirmed arthur ?s)))
    :effect (and (confirmed arthur ?s))
  )

  (:action confirm-heather
    :parameters (?s - timeslot)
    :precondition (and (free heather ?s) (not (confirmed heather ?s)))
    :effect (and (confirmed heather ?s))
  )

  (:action schedule-meeting
    :parameters (?s - timeslot)
    :precondition (and
      (not (scheduled))
      (confirmed kayla ?s)
      (confirmed sandra ?s)
      (confirmed ryan ?s)
      (confirmed kathleen ?s)
      (confirmed walter ?s)
      (confirmed arthur ?s)
      (confirmed heather ?s)
    )
    :effect (and (scheduled) (meeting-at ?s))
  )
)