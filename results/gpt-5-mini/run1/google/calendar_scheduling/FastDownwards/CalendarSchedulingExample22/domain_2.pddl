(define (domain scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types slot)
  (:predicates
    (avail_theresa ?s - slot)    ; participant Theresa is available for a full 60-min meeting starting at slot ?s
    (avail_charles ?s - slot)    ; participant Charles is available for a full 60-min meeting starting at slot ?s
    (avail_betty ?s - slot)      ; participant Betty is available for a full 60-min meeting starting at slot ?s
    (succ ?s1 - slot ?s2 - slot) ; ?s2 is the immediate 30-min successor of ?s1
    (meeting_scheduled)          ; marker that the required meeting has been scheduled
    (scheduled_at ?s - slot)     ; meeting start is at slot ?s
    (occupied ?s - slot)         ; a slot that is occupied by the scheduled meeting
  )

  ;; Schedule the single required 60-minute meeting by choosing a start slot ?s and its successor ?s2.
  ;; Avail predicates indicate that the participant is free for the entire required duration starting at ?s.
  (:action schedule_meeting
    :parameters (?s - slot ?s2 - slot)
    :precondition (and
      (not (meeting_scheduled))
      (succ ?s ?s2)
      (avail_theresa ?s)
      (avail_charles ?s)
      (avail_betty ?s)
      (not (occupied ?s))
      (not (occupied ?s2))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at ?s)
      (occupied ?s)
      (occupied ?s2)
    )
  )
)