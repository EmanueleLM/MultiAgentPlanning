(define (domain integrated-meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :equality)
  (:types person slot meeting)
  (:constants ben juan heather nathan jacob - person)

  (:predicates
    (within_workhours ?s - slot)
    (busy ?p - person ?s - slot)
    (occupied ?s - slot)
    (participant_of ?m - meeting ?p - person)
    (confirmed ?m - meeting ?p - person)
    (meeting_at ?m - meeting ?s - slot)
    (scheduled ?m - meeting)
  )

  (:action confirm_benjamin
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (participant_of ?m ben)
      (within_workhours ?s)
      (not (busy ben ?s))
      (not (occupied ?s))
      (not (confirmed ?m ben))
    )
    :effect (and
      (confirmed ?m ben)
    )
  )

  (:action confirm_juan
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (participant_of ?m juan)
      (within_workhours ?s)
      (not (busy juan ?s))
      (not (occupied ?s))
      (not (confirmed ?m juan))
    )
    :effect (and
      (confirmed ?m juan)
    )
  )

  (:action confirm_heather
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (participant_of ?m heather)
      (within_workhours ?s)
      (not (busy heather ?s))
      (not (occupied ?s))
      (not (confirmed ?m heather))
    )
    :effect (and
      (confirmed ?m heather)
    )
  )

  (:action confirm_nathan
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (participant_of ?m nathan)
      (within_workhours ?s)
      (not (busy nathan ?s))
      (not (occupied ?s))
      (not (confirmed ?m nathan))
    )
    :effect (and
      (confirmed ?m nathan)
    )
  )

  (:action confirm_jacob
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (participant_of ?m jacob)
      (within_workhours ?s)
      (not (busy jacob ?s))
      (not (occupied ?s))
      (not (confirmed ?m jacob))
    )
    :effect (and
      (confirmed ?m jacob)
    )
  )

  (:action finalize_meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (within_workhours ?s)
      (not (occupied ?s))
      (participant_of ?m ben) (confirmed ?m ben)
      (participant_of ?m juan) (confirmed ?m juan)
      (participant_of ?m heather) (confirmed ?m heather)
      (participant_of ?m nathan) (confirmed ?m nathan)
      (participant_of ?m jacob) (confirmed ?m jacob)
      (not (scheduled ?m))
    )
    :effect (and
      (meeting_at ?m ?s)
      (scheduled ?m)
      (occupied ?s)
    )
  )
)