(define (domain scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (available ?p - person ?s - slot)        ; participant is available for the 30-min slot starting at ?s
    (succ ?s1 - slot ?s2 - slot)             ; ?s2 is the immediate 30-min successor of ?s1
    (meeting-scheduled)                       ; marker that the required meeting has been scheduled
    (scheduled-at ?s - slot)                 ; meeting start is at slot ?s
    (occupied ?s - slot)                     ; slot ?s is occupied by the scheduled meeting
  )

  ;; Action schedules the single required 60-minute meeting by choosing a start slot ?s and its successor ?s2,
  ;; and explicitly requires availability for each named participant in both slots.
  (:action schedule-meeting
    :parameters (?s - slot ?s2 - slot ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
      (not (meeting-scheduled))    ;; only one meeting allowed (no post-hoc violations)
      (succ ?s ?s2)                ;; enforce contiguity: meeting occupies two consecutive 30-min slots (60 minutes)
      ;; All three participants must be available in both consecutive slots
      (available ?p1 ?s) (available ?p1 ?s2)
      (available ?p2 ?s) (available ?p2 ?s2)
      (available ?p3 ?s) (available ?p3 ?s2)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?s)
      (occupied ?s)
      (occupied ?s2)
    )
  )
)