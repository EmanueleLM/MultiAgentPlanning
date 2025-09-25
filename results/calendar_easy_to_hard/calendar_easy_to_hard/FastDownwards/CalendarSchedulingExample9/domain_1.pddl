(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:constants diane_kelly deborah - person)
  (:predicates
    (free ?p - person ?s - slot)
    (meeting-scheduled ?s - slot)
    (attended ?p - person)
  )

  (:action schedule-by-diane
    :parameters (?s - slot)
    :precondition (and (free diane_kelly ?s) (free deborah ?s))
    :effect (and
      (meeting-scheduled ?s)
      (attended diane_kelly)
      (attended deborah)
      (not (free diane_kelly ?s))
      (not (free deborah ?s))
    )
  )

  (:action schedule-by-kelly
    :parameters (?s - slot)
    :precondition (and (free diane_kelly ?s) (free deborah ?s))
    :effect (and
      (meeting-scheduled ?s)
      (attended diane_kelly)
      (attended deborah)
      (not (free diane_kelly ?s))
      (not (free deborah ?s))
    )
  )

  (:action schedule-by-deborah
    :parameters (?s - slot)
    :precondition (and (free diane_kelly ?s) (free deborah ?s))
    :effect (and
      (meeting-scheduled ?s)
      (attended diane_kelly)
      (attended deborah)
      (not (free diane_kelly ?s))
      (not (free deborah ?s))
    )
  )
)