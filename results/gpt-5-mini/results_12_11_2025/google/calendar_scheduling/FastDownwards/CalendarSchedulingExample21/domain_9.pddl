(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant timepoint slot)

  (:predicates
    ; ordered discrete time progression (adjacent stages)
    (succ ?t1 - timepoint ?t2 - timepoint)

    ; slot mapping to start and end timepoints
    (slot-start ?s - slot ?t - timepoint)
    (slot-end   ?s - slot ?t - timepoint)

    ; explicit asserted 60-minute durations between timepoints
    (duration-60 ?t1 - timepoint ?t2 - timepoint)

    ; participant availability for an entire slot
    (free ?p - participant ?s - slot)

    ; chosen marks the selected slot
    (chosen ?s - slot)

    ; global flag to prevent scheduling more than one meeting
    (meeting-scheduled)
  )

  (:action choose-slot
    :parameters (?s - slot ?st - timepoint ?end - timepoint
                 ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
      ; slot must be a valid 60-minute slot
      (slot-start ?s ?st)
      (slot-end ?s ?end)
      (duration-60 ?st ?end)

      ; meeting not yet scheduled
      (not (meeting-scheduled))

      ; all participants must be free for the entire slot
      (free ?p1 ?s)
      (free ?p2 ?s)
      (free ?p3 ?s)

      ; ensure this slot has not already been chosen
      (not (chosen ?s))
    )
    :effect (and
      ; schedule the meeting on this slot (irreversible)
      (chosen ?s)
      (meeting-scheduled)

      ; remove availability for this slot to enforce contiguous occupancy / no oscillation
      (not (free ?p1 ?s))
      (not (free ?p2 ?s))
      (not (free ?p3 ?s))
    )
  )
)