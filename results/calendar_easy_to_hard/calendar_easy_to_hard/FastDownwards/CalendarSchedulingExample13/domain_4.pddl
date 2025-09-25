(define (domain meeting-scheduling-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent timeslot)
  (:predicates
    (free ?a - agent ?t - timeslot)
    (gerald-pref ?t - timeslot)
    (gerald-nonpref ?t - timeslot)
    (roy-pref ?t - timeslot)
    (roy-nonpref ?t - timeslot)
    (barbara-pref ?t - timeslot)
    (barbara-nonpref ?t - timeslot)
    (meeting-scheduled ?t - timeslot)
    (meeting-scheduled-flag)
    (scheduled-by-gerald ?t - timeslot)
    (scheduled-by-roy ?t - timeslot)
    (scheduled-by-barbara ?t - timeslot)
  )

  (:action schedule-by-gerald-pref
    :parameters (?t - timeslot)
    :precondition (and
      (free gerald ?t)
      (free roy ?t)
      (free barbara ?t)
      (not (meeting-scheduled-flag))
      (gerald-pref ?t)
    )
    :effect (and
      (meeting-scheduled ?t)
      (meeting-scheduled-flag)
      (scheduled-by-gerald ?t)
    )
  )

  (:action schedule-by-gerald-nonpref
    :parameters (?t - timeslot)
    :precondition (and
      (free gerald ?t)
      (free roy ?t)
      (free barbara ?t)
      (not (meeting-scheduled-flag))
      (gerald-nonpref ?t)
    )
    :effect (and
      (meeting-scheduled ?t)
      (meeting-scheduled-flag)
      (scheduled-by-gerald ?t)
    )
  )

  (:action schedule-by-roy-pref
    :parameters (?t - timeslot)
    :precondition (and
      (free gerald ?t)
      (free roy ?t)
      (free barbara ?t)
      (not (meeting-scheduled-flag))
      (roy-pref ?t)
    )
    :effect (and
      (meeting-scheduled ?t)
      (meeting-scheduled-flag)
      (scheduled-by-roy ?t)
    )
  )

  (:action schedule-by-roy-nonpref
    :parameters (?t - timeslot)
    :precondition (and
      (free gerald ?t)
      (free roy ?t)
      (free barbara ?t)
      (not (meeting-scheduled-flag))
      (roy-nonpref ?t)
    )
    :effect (and
      (meeting-scheduled ?t)
      (meeting-scheduled-flag)
      (scheduled-by-roy ?t)
    )
  )

  (:action schedule-by-barbara-pref
    :parameters (?t - timeslot)
    :precondition (and
      (free gerald ?t)
      (free roy ?t)
      (free barbara ?t)
      (not (meeting-scheduled-flag))
      (barbara-pref ?t)
    )
    :effect (and
      (meeting-scheduled ?t)
      (meeting-scheduled-flag)
      (scheduled-by-barbara ?t)
    )
  )

  (:action schedule-by-barbara-nonpref
    :parameters (?t - timeslot)
    :precondition (and
      (free gerald ?t)
      (free roy ?t)
      (free barbara ?t)
      (not (meeting-scheduled-flag))
      (barbara-nonpref ?t)
    )
    :effect (and
      (meeting-scheduled ?t)
      (meeting-scheduled-flag)
      (scheduled-by-barbara ?t)
    )
  )
)