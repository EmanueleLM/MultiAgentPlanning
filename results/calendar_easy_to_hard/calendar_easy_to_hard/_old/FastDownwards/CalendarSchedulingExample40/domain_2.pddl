(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant timeslot)
  (:predicates
    (available ?p - participant ?t - timeslot)
    (confirmed ?p - participant ?t - timeslot)
    (meeting-scheduled)
    (meeting-at ?t - timeslot)
  )

  (:action confirm
    :parameters (?p - participant ?t - timeslot)
    :precondition (and (available ?p ?t) (not (confirmed ?p ?t)) (not (meeting-scheduled)))
    :effect (confirmed ?p ?t)
  )

  (:action schedule-meeting
    :parameters (?t - timeslot
                 ?rachel - participant ?katherine - participant ?kelly - participant ?cynthia - participant
                 ?anthony - participant ?ryan - participant ?richard - participant)
    :precondition (and
      (confirmed ?rachel ?t)
      (confirmed ?katherine ?t)
      (confirmed ?kelly ?t)
      (confirmed ?cynthia ?t)
      (confirmed ?anthony ?t)
      (confirmed ?ryan ?t)
      (confirmed ?richard ?t)
      (not (meeting-scheduled))
    )
    :effect (and (meeting-scheduled) (meeting-at ?t))
  )
)