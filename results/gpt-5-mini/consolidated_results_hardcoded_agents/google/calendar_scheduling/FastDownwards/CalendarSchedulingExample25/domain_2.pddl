(define (domain schedule_meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot time)
  (:predicates
    ;; object membership predicates
    (participant_obj ?p - participant)
    (slot_obj ?s - slot)
    (time_obj ?t - time)

    ;; temporal structure for slots
    (slot_start ?s - slot ?t - time)
    (slot_end ?s - slot ?t - time)
    (time_before ?t1 - time ?t2 - time)
    (duration_60 ?s - slot)

    ;; availability and selection predicates
    (available ?p - participant ?s - slot)
    (chosen ?s - slot)
    (scheduled)
  )

  ;; Action to select a specific audited slot.
  ;; Preconditions enforce:
  ;; - the slot exists and is the required 60-minute duration,
  ;; - the slot has explicit start and end times with ordering,
  ;; - each required participant is explicitly available for that slot,
  ;; - the slot has not already been chosen.
  ;; Effects mark the slot chosen and the meeting scheduled (terminal condition).
  (:action select_slot
    :parameters (?s - slot ?t1 - time ?t2 - time)
    :precondition (and
      (slot_obj ?s)
      (time_obj ?t1)
      (time_obj ?t2)
      (slot_start ?s ?t1)
      (slot_end ?s ?t2)
      (time_before ?t1 ?t2)
      (duration_60 ?s)
      (available anthony ?s)
      (available pamela ?s)
      (available zachary ?s)
      (not (chosen ?s))
    )
    :effect (and
      (chosen ?s)
      (scheduled)
    )
  )
)