(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant timeslot)
  (:constants rachel katherine kelly cynthia anthony ryan richard - participant)
  (:predicates
    (available ?p - participant ?t - timeslot)
    (confirmed ?p - participant ?t - timeslot)
    (meeting-scheduled)
    (meeting-at ?t - timeslot)
  )

  (:action confirm-rachel
    :parameters (?t - timeslot)
    :precondition (and (available rachel ?t) (not (confirmed rachel ?t)) (not (meeting-scheduled)))
    :effect (confirmed rachel ?t)
  )

  (:action confirm-katherine
    :parameters (?t - timeslot)
    :precondition (and (available katherine ?t) (not (confirmed katherine ?t)) (not (meeting-scheduled)))
    :effect (confirmed katherine ?t)
  )

  (:action confirm-kelly
    :parameters (?t - timeslot)
    :precondition (and (available kelly ?t) (not (confirmed kelly ?t)) (not (meeting-scheduled)))
    :effect (confirmed kelly ?t)
  )

  (:action confirm-cynthia
    :parameters (?t - timeslot)
    :precondition (and (available cynthia ?t) (not (confirmed cynthia ?t)) (not (meeting-scheduled)))
    :effect (confirmed cynthia ?t)
  )

  (:action confirm-anthony
    :parameters (?t - timeslot)
    :precondition (and (available anthony ?t) (not (confirmed anthony ?t)) (not (meeting-scheduled)))
    :effect (confirmed anthony ?t)
  )

  (:action confirm-ryan
    :parameters (?t - timeslot)
    :precondition (and (available ryan ?t) (not (confirmed ryan ?t)) (not (meeting-scheduled)))
    :effect (confirmed ryan ?t)
  )

  (:action confirm-richard
    :parameters (?t - timeslot)
    :precondition (and (available richard ?t) (not (confirmed richard ?t)) (not (meeting-scheduled)))
    :effect (confirmed richard ?t)
  )

  (:action schedule-meeting
    :parameters (?t - timeslot)
    :precondition (and
      (confirmed rachel ?t)
      (confirmed katherine ?t)
      (confirmed kelly ?t)
      (confirmed cynthia ?t)
      (confirmed anthony ?t)
      (confirmed ryan ?t)
      (confirmed richard ?t)
      (not (meeting-scheduled))
    )
    :effect (and (meeting-scheduled) (meeting-at ?t))
  )
)