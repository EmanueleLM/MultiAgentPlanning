(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types participant slot)
  (:predicates
    (free ?p - participant ?s - slot)
    (available ?s - slot)
    (chosen ?s - slot)
    (unscheduled)
  )

  ; Choose exactly one slot: requires the meeting to still be unscheduled,
  ; the chosen slot to be available, and every participant to be free on it.
  ; Effects mark that slot chosen, remove availability for that slot, and
  ; mark the meeting as scheduled (delete unscheduled) so no further choices are possible.
  (:action choose-slot
    :parameters (?s - slot)
    :precondition (and
                   (unscheduled)
                   (available ?s)
                   (free bobby ?s)
                   (free scott ?s)
                   (free kimberly ?s)
                 )
    :effect (and
              (chosen ?s)
              (not (available ?s))
              (not (unscheduled))
            )
  )
)