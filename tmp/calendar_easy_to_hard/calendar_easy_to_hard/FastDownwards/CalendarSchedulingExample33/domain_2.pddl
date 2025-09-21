(define (domain integrated-meeting-scheduling)
  (:requirements :typing :strips :negative-preconditions)
  (:types person slot)

  (:constants theresa alexander virginia lisa natalie victoria - person)

  (:predicates
    (free ?p - person ?s - slot)
    (attends ?p - person ?s - slot)
    (meeting-scheduled)
    (scheduled-at ?s - slot)
  )

  (:action schedule-theresa
    :parameters (?s - slot)
    :precondition (and (free theresa ?s) (not (meeting-scheduled)))
    :effect (and (attends theresa ?s) (not (free theresa ?s)))
  )

  (:action schedule-alexander
    :parameters (?s - slot)
    :precondition (and (free alexander ?s) (not (meeting-scheduled)))
    :effect (and (attends alexander ?s) (not (free alexander ?s)))
  )

  (:action schedule-virginia
    :parameters (?s - slot)
    :precondition (and (free virginia ?s) (not (meeting-scheduled)))
    :effect (and (attends virginia ?s) (not (free virginia ?s)))
  )

  (:action schedule-lisa
    :parameters (?s - slot)
    :precondition (and (free lisa ?s) (not (meeting-scheduled)))
    :effect (and (attends lisa ?s) (not (free lisa ?s)))
  )

  (:action schedule-natalie
    :parameters (?s - slot)
    :precondition (and (free natalie ?s) (not (meeting-scheduled)))
    :effect (and (attends natalie ?s) (not (free natalie ?s)))
  )

  (:action schedule-victoria
    :parameters (?s - slot)
    :precondition (and (free victoria ?s) (not (meeting-scheduled)))
    :effect (and (attends victoria ?s) (not (free victoria ?s)))
  )

  (:action confirm-meeting
    :parameters (?s - slot)
    :precondition (and
      (attends theresa ?s)
      (attends alexander ?s)
      (attends virginia ?s)
      (attends lisa ?s)
      (attends natalie ?s)
      (attends victoria ?s)
      (not (meeting-scheduled))
    )
    :effect (and (meeting-scheduled) (scheduled-at ?s))
  )
)