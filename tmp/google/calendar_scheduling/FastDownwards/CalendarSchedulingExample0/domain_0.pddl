(define (domain combined-meeting)
  (:requirements :strips :typing :negative-preconditions :existential-preconditions)
  (:types person halfslot)

  (:predicates
    (next ?s ?n - halfslot)                 ; adjacency of 30-min slots
    (free ?p - person ?s - halfslot)        ; person is free in that halfslot
    (occupied ?s - halfslot)                ; halfslot is occupied by a scheduled meeting
    (meeting-michelle ?s - halfslot)        ; michelle's scheduler has scheduled meeting starting at ?s
    (meeting-steven ?s - halfslot)          ; steven's scheduler has scheduled meeting starting at ?s
    (meeting-jerry ?s - halfslot)           ; jerry's scheduler has scheduled meeting starting at ?s
  )

  ;; Michelle's scheduling action (keeps agent action distinct)
  ;; Schedules a 60-minute meeting represented as two consecutive halfslots ?s and ?n.
  (:action schedule-michelle
    :parameters (?s ?n - halfslot)
    :precondition (and
      (next ?s ?n)
      (free michelle ?s)
      (free michelle ?n)
      (not (occupied ?s))
      (not (occupied ?n))
    )
    :effect (and
      (meeting-michelle ?s)
      (occupied ?s)
      (occupied ?n)
      (not (free michelle ?s))
      (not (free michelle ?n))
    )
  )

  ;; Steven's scheduling action (keeps agent action distinct)
  (:action schedule-steven
    :parameters (?s ?n - halfslot)
    :precondition (and
      (next ?s ?n)
      (free steven ?s)
      (free steven ?n)
      (not (occupied ?s))
      (not (occupied ?n))
    )
    :effect (and
      (meeting-steven ?s)
      (occupied ?s)
      (occupied ?n)
      (not (free steven ?s))
      (not (free steven ?n))
    )
  )

  ;; Jerry's scheduling action (keeps agent action distinct)
  (:action schedule-jerry
    :parameters (?s ?n - halfslot)
    :precondition (and
      (next ?s ?n)
      (free jerry ?s)
      (free jerry ?n)
      (not (occupied ?s))
      (not (occupied ?n))
    )
    :effect (and
      (meeting-jerry ?s)
      (occupied ?s)
      (occupied ?n)
      (not (free jerry ?s))
      (not (free jerry ?n))
    )
  )
)