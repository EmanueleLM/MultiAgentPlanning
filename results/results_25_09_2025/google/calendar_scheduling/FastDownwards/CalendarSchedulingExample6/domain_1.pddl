(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :strips :action-costs :equality)
  (:types agent slot)
  (:predicates
    (free ?a - agent ?s - slot)
    (next ?s1 - slot ?s2 - slot)
    (meeting-scheduled)
    (meeting-start ?s - slot)
  )

  (:action schedule-by-thomas
    :parameters (?s - slot ?t - slot)
    :precondition (and
      (next ?s ?t)
      (not (meeting-scheduled))
      (free thomas ?s) (free thomas ?t)
      (free dylan  ?s) (free dylan  ?t)
      (free jerry  ?s) (free jerry  ?t)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-start ?s)
    )
    :cost 1
  )

  (:action schedule-by-dylan
    :parameters (?s - slot ?t - slot)
    :precondition (and
      (next ?s ?t)
      (not (meeting-scheduled))
      (free thomas ?s) (free thomas ?t)
      (free dylan  ?s) (free dylan  ?t)
      (free jerry  ?s) (free jerry  ?t)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-start ?s)
    )
    :cost 1
  )

  (:action schedule-by-jerry
    :parameters (?s - slot ?t - slot)
    :precondition (and
      (next ?s ?t)
      (not (meeting-scheduled))
      (free thomas ?s) (free thomas ?t)
      (free dylan  ?s) (free dylan  ?t)
      (free jerry  ?s) (free jerry  ?t)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-start ?s)
    )
    :cost 1
  )
)