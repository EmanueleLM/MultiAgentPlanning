(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)

  (:predicates
    (available ?p - person ?s - slot)     ; participant p is available for the 30min slot s
    (next ?s1 - slot ?s2 - slot)          ; s2 is the immediate next 30min slot after s1
    (meeting-scheduled)                   ; a meeting has been scheduled
    (meeting-start ?s - slot)             ; meeting starts at slot s (covers s and next s)
  )

  ;; Thomas's scheduling action (keeps agent actions distinct)
  (:action thomas_schedule
    :parameters (?s - slot ?s2 - slot)
    :precondition (and
      (not (meeting-scheduled))
      (next ?s ?s2)
      (available thomas ?s) (available thomas ?s2)
      (available dylan  ?s) (available dylan  ?s2)
      (available jerry  ?s) (available jerry  ?s2)
    )
    :effect (and (meeting-scheduled) (meeting-start ?s))
  )

  ;; Dylan's scheduling action
  (:action dylan_schedule
    :parameters (?s - slot ?s2 - slot)
    :precondition (and
      (not (meeting-scheduled))
      (next ?s ?s2)
      (available thomas ?s) (available thomas ?s2)
      (available dylan  ?s) (available dylan  ?s2)
      (available jerry  ?s) (available jerry  ?s2)
    )
    :effect (and (meeting-scheduled) (meeting-start ?s))
  )

  ;; Jerry's scheduling action
  (:action jerry_schedule
    :parameters (?s - slot ?s2 - slot)
    :precondition (and
      (not (meeting-scheduled))
      (next ?s ?s2)
      (available thomas ?s) (available thomas ?s2)
      (available dylan  ?s) (available dylan  ?s2)
      (available jerry  ?s) (available jerry  ?s2)
    )
    :effect (and (meeting-scheduled) (meeting-start ?s))
  )
)