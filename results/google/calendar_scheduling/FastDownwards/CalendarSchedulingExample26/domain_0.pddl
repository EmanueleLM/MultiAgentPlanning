(define (domain orchestrated-meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types participant meeting slot)

  (:predicates
    (slot ?s - slot)
    (next ?s1 - slot ?s2 - slot)                 ; immediate consecutive half-hour slots
    (free ?p - participant ?s - slot)            ; participant is free during this half-hour slot
    (booked ?p - participant ?m - meeting ?s - slot) ; participant ?p has booked meeting ?m starting at slot ?s
    (meeting-scheduled ?m - meeting)             ; meeting has been scheduled (finalized)
    (meeting-at ?m - meeting ?s - slot)         ; meeting ?m starts at slot ?s
  )

  ;; Katherine books two consecutive slots for the meeting on her calendar.
  (:action book-katherine
    :parameters (?m - meeting ?s1 - slot ?s2 - slot)
    :precondition (and
      (next ?s1 ?s2)
      (free katherine ?s1)
      (free katherine ?s2)
      (not (booked katherine ?m ?s1))
    )
    :effect (and
      (booked katherine ?m ?s1)
      (not (free katherine ?s1))
      (not (free katherine ?s2))
    )
  )

  ;; Nicole books two consecutive slots for the meeting on her calendar.
  (:action book-nicole
    :parameters (?m - meeting ?s1 - slot ?s2 - slot)
    :precondition (and
      (next ?s1 ?s2)
      (free nicole ?s1)
      (free nicole ?s2)
      (not (booked nicole ?m ?s1))
    )
    :effect (and
      (booked nicole ?m ?s1)
      (not (free nicole ?s1))
      (not (free nicole ?s2))
    )
  )

  ;; Kevin books two consecutive slots for the meeting on his calendar.
  ;; (Kevin's availability was provided as explicit free slots in the problem.)
  (:action book-kevin
    :parameters (?m - meeting ?s1 - slot ?s2 - slot)
    :precondition (and
      (next ?s1 ?s2)
      (free kevin ?s1)
      (free kevin ?s2)
      (not (booked kevin ?m ?s1))
    )
    :effect (and
      (booked kevin ?m ?s1)
      (not (free kevin ?s1))
      (not (free kevin ?s2))
    )
  )

  ;; Orchestrator finalizes the meeting once all participants have booked the same start slot.
  (:action confirm-meeting
    :parameters (?m - meeting ?s1 - slot ?s2 - slot)
    :precondition (and
      (next ?s1 ?s2)
      (booked katherine ?m ?s1)
      (booked nicole ?m ?s1)
      (booked kevin ?m ?s1)
      (not (meeting-scheduled ?m))
    )
    :effect (and
      (meeting-scheduled ?m)
      (meeting-at ?m ?s1)
    )
  )
)