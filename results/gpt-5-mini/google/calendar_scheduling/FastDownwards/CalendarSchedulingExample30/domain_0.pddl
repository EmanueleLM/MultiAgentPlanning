(define (domain jackofalltrades)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)
  (:predicates
    (participant ?p - participant)
    (slot ?s - slot)
    (work_slot ?s - slot)
    (busy ?p - participant ?s - slot)
    (meeting_scheduled)
    (meeting_at ?s - slot)
    (meeting_before_14)
    (before_14 ?s - slot)
  )

  ;; Grounded scheduling actions: one per concrete slot.
  ;; Each action requires the slot to be a work_slot, no meeting scheduled yet,
  ;; and all participants free in that slot. Effects add meeting markers and
  ;; mark participants busy in that slot. meeting_before_14 is included only
  ;; for slots that are before 14:00.

  (:action schedule_slot_9_00
    :parameters ()
    :precondition (and
      (work_slot slot_9_00)
      (not (meeting_scheduled))
      (not (busy jeffrey slot_9_00))
      (not (busy virginia slot_9_00))
      (not (busy melissa slot_9_00))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at slot_9_00)
      (busy jeffrey slot_9_00)
      (busy virginia slot_9_00)
      (busy melissa slot_9_00)
      (meeting_before_14)
    )
  )

  (:action schedule_slot_9_30
    :parameters ()
    :precondition (and
      (work_slot slot_9_30)
      (not (meeting_scheduled))
      (not (busy jeffrey slot_9_30))
      (not (busy virginia slot_9_30))
      (not (busy melissa slot_9_30))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at slot_9_30)
      (busy jeffrey slot_9_30)
      (busy virginia slot_9_30)
      (busy melissa slot_9_30)
      (meeting_before_14)
    )
  )

  (:action schedule_slot_10_00
    :parameters ()
    :precondition (and
      (work_slot slot_10_00)
      (not (meeting_scheduled))
      (not (busy jeffrey slot_10_00))
      (not (busy virginia slot_10_00))
      (not (busy melissa slot_10_00))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at slot_10_00)
      (busy jeffrey slot_10_00)
      (busy virginia slot_10_00)
      (busy melissa slot_10_00)
      (meeting_before_14)
    )
  )

  (:action schedule_slot_10_30
    :parameters ()
    :precondition (and
      (work_slot slot_10_30)
      (not (meeting_scheduled))
      (not (busy jeffrey slot_10_30))
      (not (busy virginia slot_10_30))
      (not (busy melissa slot_10_30))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at slot_10_30)
      (busy jeffrey slot_10_30)
      (busy virginia slot_10_30)
      (busy melissa slot_10_30)
      (meeting_before_14)
    )
  )

  (:action schedule_slot_11_00
    :parameters ()
    :precondition (and
      (work_slot slot_11_00)
      (not (meeting_scheduled))
      (not (busy jeffrey slot_11_00))
      (not (busy virginia slot_11_00))
      (not (busy melissa slot_11_00))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at slot_11_00)
      (busy jeffrey slot_11_00)
      (busy virginia slot_11_00)
      (busy melissa slot_11_00)
      (meeting_before_14)
    )
  )

  (:action schedule_slot_11_30
    :parameters ()
    :precondition (and
      (work_slot slot_11_30)
      (not (meeting_scheduled))
      (not (busy jeffrey slot_11_30))
      (not (busy virginia slot_11_30))
      (not (busy melissa slot_11_30))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at slot_11_30)
      (busy jeffrey slot_11_30)
      (busy virginia slot_11_30)
      (busy melissa slot_11_30)
      (meeting_before_14)
    )
  )

  (:action schedule_slot_12_00
    :parameters ()
    :precondition (and
      (work_slot slot_12_00)
      (not (meeting_scheduled))
      (not (busy jeffrey slot_12_00))
      (not (busy virginia slot_12_00))
      (not (busy melissa slot_12_00))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at slot_12_00)
      (busy jeffrey slot_12_00)
      (busy virginia slot_12_00)
      (busy melissa slot_12_00)
      (meeting_before_14)
    )
  )

  (:action schedule_slot_12_30
    :parameters ()
    :precondition (and
      (work_slot slot_12_30)
      (not (meeting_scheduled))
      (not (busy jeffrey slot_12_30))
      (not (busy virginia slot_12_30))
      (not (busy melissa slot_12_30))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at slot_12_30)
      (busy jeffrey slot_12_30)
      (busy virginia slot_12_30)
      (busy melissa slot_12_30)
      (meeting_before_14)
    )
  )

  (:action schedule_slot_13_00
    :parameters ()
    :precondition (and
      (work_slot slot_13_00)
      (not (meeting_scheduled))
      (not (busy jeffrey slot_13_00))
      (not (busy virginia slot_13_00))
      (not (busy melissa slot_13_00))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at slot_13_00)
      (busy jeffrey slot_13_00)
      (busy virginia slot_13_00)
      (busy melissa slot_13_00)
      (meeting_before_14)
    )
  )

  (:action schedule_slot_13_30
    :parameters ()
    :precondition (and
      (work_slot slot_13_30)
      (not (meeting_scheduled))
      (not (busy jeffrey slot_13_30))
      (not (busy virginia slot_13_30))
      (not (busy melissa slot_13_30))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at slot_13_30)
      (busy jeffrey slot_13_30)
      (busy virginia slot_13_30)
      (busy melissa slot_13_30)
      (meeting_before_14)
    )
  )

  (:action schedule_slot_14_00
    :parameters ()
    :precondition (and
      (work_slot slot_14_00)
      (not (meeting_scheduled))
      (not (busy jeffrey slot_14_00))
      (not (busy virginia slot_14_00))
      (not (busy melissa slot_14_00))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at slot_14_00)
      (busy jeffrey slot_14_00)
      (busy virginia slot_14_00)
      (busy melissa slot_14_00)
    )
  )

  (:action schedule_slot_14_30
    :parameters ()
    :precondition (and
      (work_slot slot_14_30)
      (not (meeting_scheduled))
      (not (busy jeffrey slot_14_30))
      (not (busy virginia slot_14_30))
      (not (busy melissa slot_14_30))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at slot_14_30)
      (busy jeffrey slot_14_30)
      (busy virginia slot_14_30)
      (busy melissa slot_14_30)
    )
  )

  (:action schedule_slot_15_00
    :parameters ()
    :precondition (and
      (work_slot slot_15_00)
      (not (meeting_scheduled))
      (not (busy jeffrey slot_15_00))
      (not (busy virginia slot_15_00))
      (not (busy melissa slot_15_00))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at slot_15_00)
      (busy jeffrey slot_15_00)
      (busy virginia slot_15_00)
      (busy melissa slot_15_00)
    )
  )

  (:action schedule_slot_15_30
    :parameters ()
    :precondition (and
      (work_slot slot_15_30)
      (not (meeting_scheduled))
      (not (busy jeffrey slot_15_30))
      (not (busy virginia slot_15_30))
      (not (busy melissa slot_15_30))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at slot_15_30)
      (busy jeffrey slot_15_30)
      (busy virginia slot_15_30)
      (busy melissa slot_15_30)
    )
  )

  (:action schedule_slot_16_00
    :parameters ()
    :precondition (and
      (work_slot slot_16_00)
      (not (meeting_scheduled))
      (not (busy jeffrey slot_16_00))
      (not (busy virginia slot_16_00))
      (not (busy melissa slot_16_00))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at slot_16_00)
      (busy jeffrey slot_16_00)
      (busy virginia slot_16_00)
      (busy melissa slot_16_00)
    )
  )

  (:action schedule_slot_16_30
    :parameters ()
    :precondition (and
      (work_slot slot_16_30)
      (not (meeting_scheduled))
      (not (busy jeffrey slot_16_30))
      (not (busy virginia slot_16_30))
      (not (busy melissa slot_16_30))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at slot_16_30)
      (busy jeffrey slot_16_30)
      (busy virginia slot_16_30)
      (busy melissa slot_16_30)
    )
  )

)