(define (domain schedule_meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types person time_slot)

  (:predicates
    (busy ?p - person ?s - time_slot)
    (slot_free ?s - time_slot)
    (meeting_scheduled)
    (meeting_scheduled_at ?s - time_slot)
  )

  ;; actions to schedule the meeting at a particular 30-min slot.
  ;; Each action requires the chosen slot to be free and that no meeting is scheduled yet.
  (:action schedule_t_09_00
    :parameters ()
    :precondition (and
      (slot_free t_09_00)
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_scheduled_at t_09_00)
      (not (slot_free t_09_00))
    )
  )

  (:action schedule_t_09_30
    :parameters ()
    :precondition (and
      (slot_free t_09_30)
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_scheduled_at t_09_30)
      (not (slot_free t_09_30))
    )
  )

  (:action schedule_t_10_00
    :parameters ()
    :precondition (and
      (slot_free t_10_00)
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_scheduled_at t_10_00)
      (not (slot_free t_10_00))
    )
  )

  (:action schedule_t_10_30
    :parameters ()
    :precondition (and
      (slot_free t_10_30)
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_scheduled_at t_10_30)
      (not (slot_free t_10_30))
    )
  )

  (:action schedule_t_11_00
    :parameters ()
    :precondition (and
      (slot_free t_11_00)
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_scheduled_at t_11_00)
      (not (slot_free t_11_00))
    )
  )

  (:action schedule_t_11_30
    :parameters ()
    :precondition (and
      (slot_free t_11_30)
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_scheduled_at t_11_30)
      (not (slot_free t_11_30))
    )
  )

  (:action schedule_t_12_00
    :parameters ()
    :precondition (and
      (slot_free t_12_00)
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_scheduled_at t_12_00)
      (not (slot_free t_12_00))
    )
  )

  (:action schedule_t_12_30
    :parameters ()
    :precondition (and
      (slot_free t_12_30)
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_scheduled_at t_12_30)
      (not (slot_free t_12_30))
    )
  )

  (:action schedule_t_13_00
    :parameters ()
    :precondition (and
      (slot_free t_13_00)
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_scheduled_at t_13_00)
      (not (slot_free t_13_00))
    )
  )

  (:action schedule_t_13_30
    :parameters ()
    :precondition (and
      (slot_free t_13_30)
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_scheduled_at t_13_30)
      (not (slot_free t_13_30))
    )
  )

  (:action schedule_t_14_00
    :parameters ()
    :precondition (and
      (slot_free t_14_00)
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_scheduled_at t_14_00)
      (not (slot_free t_14_00))
    )
  )

  (:action schedule_t_14_30
    :parameters ()
    :precondition (and
      (slot_free t_14_30)
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_scheduled_at t_14_30)
      (not (slot_free t_14_30))
    )
  )

  (:action schedule_t_15_00
    :parameters ()
    :precondition (and
      (slot_free t_15_00)
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_scheduled_at t_15_00)
      (not (slot_free t_15_00))
    )
  )

  (:action schedule_t_15_30
    :parameters ()
    :precondition (and
      (slot_free t_15_30)
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_scheduled_at t_15_30)
      (not (slot_free t_15_30))
    )
  )

  (:action schedule_t_16_00
    :parameters ()
    :precondition (and
      (slot_free t_16_00)
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_scheduled_at t_16_00)
      (not (slot_free t_16_00))
    )
  )

  (:action schedule_t_16_30
    :parameters ()
    :precondition (and
      (slot_free t_16_30)
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_scheduled_at t_16_30)
      (not (slot_free t_16_30))
    )
  )

)