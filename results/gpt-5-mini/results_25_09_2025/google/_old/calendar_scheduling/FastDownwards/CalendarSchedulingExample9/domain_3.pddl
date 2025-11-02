(define (domain meeting-scheduling-integrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (available ?p - person ?s - slot)
    (voted_diane ?s - slot)
    (voted_kelly ?s - slot)
    (voted_deborah ?s - slot)
    (meeting_scheduled ?s - slot)
    (scheduled_for ?p - person ?s - slot)
    (meeting_made)
  )

  (:action vote_diane
    :parameters (?s - slot)
    :precondition (available diane ?s)
    :effect (voted_diane ?s)
  )

  (:action vote_kelly
    :parameters (?s - slot)
    :precondition (available kelly ?s)
    :effect (voted_kelly ?s)
  )

  (:action vote_deborah
    :parameters (?s - slot)
    :precondition (available deborah ?s)
    :effect (voted_deborah ?s)
  )

  (:action finalize_meeting
    :parameters (?s - slot)
    :precondition (and
                    (voted_diane ?s)
                    (voted_kelly ?s)
                    (voted_deborah ?s)
                    (not (meeting_made))
                  )
    :effect (and
              (meeting_made)
              (meeting_scheduled ?s)
              (scheduled_for diane ?s)
              (scheduled_for kelly ?s)
              (scheduled_for deborah ?s)
              (not (available diane ?s))
              (not (available kelly ?s))
              (not (available deborah ?s))
            )
  )
)