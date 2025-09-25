(define (domain multi-agent-meeting)
  (:requirements :typing :negative-preconditions)
  (:types slot)
  (:predicates
    ;; slot objects
    (slot ?s - slot)

    ;; availability predicates per agent (keeps agents' predicates distinct)
    (available-joyce ?s - slot)
    (available-christine ?s - slot)
    (available-alexander ?s - slot)

    ;; explicit busy predicates to represent private busy intervals
    (busy-joyce ?s - slot)
    (busy-christine ?s - slot)
    (busy-alexander ?s - slot)

    ;; meeting booking state
    (meeting-scheduled)
    (meeting-at ?s - slot)
  )

  ;; Three distinct scheduling actions (one per agent). Each requires that
  ;; all three agents are available at the chosen slot and that no meeting
  ;; has yet been scheduled. Effects mark the meeting scheduled at that slot.
  (:action joyce-schedule
    :parameters (?s - slot)
    :precondition (and
      (available-joyce ?s)
      (available-christine ?s)
      (available-alexander ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
    )
  )

  (:action christine-schedule
    :parameters (?s - slot)
    :precondition (and
      (available-joyce ?s)
      (available-christine ?s)
      (available-alexander ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
    )
  )

  (:action alexander-schedule
    :parameters (?s - slot)
    :precondition (and
      (available-joyce ?s)
      (available-christine ?s)
      (available-alexander ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
    )
  )
)