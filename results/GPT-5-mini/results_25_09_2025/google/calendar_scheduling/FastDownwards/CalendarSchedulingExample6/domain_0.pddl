(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :strips)
  (:types agent slot)

  (:predicates
    (free ?a - agent ?s - slot)        ; agent ?a is free during slot ?s
    (next ?s1 - slot ?s2 - slot)      ; ?s2 immediately follows ?s1 (30min granularity)
    (meeting-scheduled)                ; meeting has been scheduled
    (meeting-start ?s - slot)          ; meeting starts at slot ?s
  )

  ;; Actions kept distinct for each agent (three separate scheduling actions).
  ;; Each action schedules a 60-minute meeting (two consecutive 30min slots)
  ;; and requires all participants to be free during both slots.
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
  )
)