(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)

  (:constants diane kelly deborah - participant)

  (:predicates
    (busy ?p - participant ?s - slot)
    (approved ?p - participant ?s - slot)
    (meeting-scheduled)
    (scheduled-at ?s - slot)
    (scheduled-in-common)
  )

  (:action approve-diane
    :parameters (?s - slot)
    :precondition (and
      (not (busy diane ?s))
      (not (meeting-scheduled))
      (not (approved diane ?s))
    )
    :effect (and
      (approved diane ?s)
    )
  )

  (:action approve-kelly
    :parameters (?s - slot)
    :precondition (and
      (not (busy kelly ?s))
      (not (meeting-scheduled))
      (not (approved kelly ?s))
    )
    :effect (and
      (approved kelly ?s)
    )
  )

  (:action approve-deborah
    :parameters (?s - slot)
    :precondition (and
      (not (busy deborah ?s))
      (not (meeting-scheduled))
      (not (approved deborah ?s))
    )
    :effect (and
      (approved deborah ?s)
    )
  )

  (:action confirm-orchestrator
    :parameters (?s - slot)
    :precondition (and
      (approved diane ?s)
      (approved kelly ?s)
      (approved deborah ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?s)
      (scheduled-in-common)
    )
  )
)