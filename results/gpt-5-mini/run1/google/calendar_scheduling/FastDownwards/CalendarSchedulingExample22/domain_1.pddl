(define (domain scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types slot)
  (:predicates
    (avail_theresa ?s - slot)    ; Theresa is available for the 30-min slot starting at ?s
    (avail_charles ?s - slot)    ; Charles is available for the 30-min slot starting at ?s
    (avail_betty ?s - slot)      ; Betty is available for the 30-min slot starting at ?s
    (succ ?s1 - slot ?s2 - slot) ; ?s2 is the immediate 30-min successor of ?s1
    (meeting_scheduled)          ; marker that the required meeting has been scheduled
    (scheduled_at ?s - slot)     ; meeting start is at slot ?s
    (occupied ?s - slot)         ; a slot that is occupied by the scheduled meeting
  )

  ;; Schedule the single required 60-minute meeting by choosing a start slot ?s and its successor ?s2.
  ;; Requires both consecutive 30-min slots to be available for each named participant.
  (:action schedule_meeting
    :parameters (?s - slot ?s2 - slot)
    :precondition (and
      (not (meeting_scheduled))
      (succ ?s ?s2)
      (avail_theresa ?s) (avail_theresa ?s2)
      (avail_charles ?s) (avail_charles ?s2)
      (avail_betty ?s) (avail_betty ?s2)
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at ?s)
      (occupied ?s)
      (occupied ?s2)
    )
  )
)