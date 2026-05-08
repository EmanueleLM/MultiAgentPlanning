(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    meeting
    slot
  )

  (:predicates
    (required ?m - meeting ?p - participant)
    (blocked ?p - participant ?s - slot)
    (scheduled ?m - meeting ?s - slot)
    (meeting_scheduled ?m - meeting)
    (unscheduled ?m - meeting)
  )

  (:action schedule_meeting_at_s_09_00
    :parameters ()
    :precondition (and
      (unscheduled meeting_1)
      (required meeting_1 arthur)
      (required meeting_1 theresa)
      (required meeting_1 carl)
      (not (blocked arthur s_09_00))
      (not (blocked theresa s_09_00))
      (not (blocked carl s_09_00))
    )
    :effect (and
      (scheduled meeting_1 s_09_00)
      (meeting_scheduled meeting_1)
      (not (unscheduled meeting_1))
    )
  )

  (:action schedule_meeting_at_s_09_30
    :parameters ()
    :precondition (and
      (unscheduled meeting_1)
      (required meeting_1 arthur)
      (required meeting_1 theresa)
      (required meeting_1 carl)
      (not (blocked arthur s_09_30))
      (not (blocked theresa s_09_30))
      (not (blocked carl s_09_30))
    )
    :effect (and
      (scheduled meeting_1 s_09_30)
      (meeting_scheduled meeting_1)
      (not (unscheduled meeting_1))
    )
  )

  (:action schedule_meeting_at_s_10_00
    :parameters ()
    :precondition (and
      (unscheduled meeting_1)
      (required meeting_1 arthur)
      (required meeting_1 theresa)
      (required meeting_1 carl)
      (not (blocked arthur s_10_00))
      (not (blocked theresa s_10_00))
      (not (blocked carl s_10_00))
    )
    :effect (and
      (scheduled meeting_1 s_10_00)
      (meeting_scheduled meeting_1)
      (not (unscheduled meeting_1))
    )
  )

  (:action schedule_meeting_at_s_10_30
    :parameters ()
    :precondition (and
      (unscheduled meeting_1)
      (required meeting_1 arthur)
      (required meeting_1 theresa)
      (required meeting_1 carl)
      (not (blocked arthur s_10_30))
      (not (blocked theresa s_10_30))
      (not (blocked carl s_10_30))
    )
    :effect (and
      (scheduled meeting_1 s_10_30)
      (meeting_scheduled meeting_1)
      (not (unscheduled meeting_1))
    )
  )

  (:action schedule_meeting_at_s_11_00
    :parameters ()
    :precondition (and
      (unscheduled meeting_1)
      (required meeting_1 arthur)
      (required meeting_1 theresa)
      (required meeting_1 carl)
      (not (blocked arthur s_11_00))
      (not (blocked theresa s_11_00))
      (not (blocked carl s_11_00))
    )
    :effect (and
      (scheduled meeting_1 s_11_00)
      (meeting_scheduled meeting_1)
      (not (unscheduled meeting_1))
    )
  )

  (:action schedule_meeting_at_s_11_30
    :parameters ()
    :precondition (and
      (unscheduled meeting_1)
      (required meeting_1 arthur)
      (required meeting_1 theresa)
      (required meeting_1 carl)
      (not (blocked arthur s_11_30))
      (not (blocked theresa s_11_30))
      (not (blocked carl s_11_30))
    )
    :effect (and
      (scheduled meeting_1 s_11_30)
      (meeting_scheduled meeting_1)
      (not (unscheduled meeting_1))
    )
  )

  (:action schedule_meeting_at_s_12_00
    :parameters ()
    :precondition (and
      (unscheduled meeting_1)
      (required meeting_1 arthur)
      (required meeting_1 theresa)
      (required meeting_1 carl)
      (not (blocked arthur s_12_00))
      (not (blocked theresa s_12_00))
      (not (blocked carl s_12_00))
    )
    :effect (and
      (scheduled meeting_1 s_12_00)
      (meeting_scheduled meeting_1)
      (not (unscheduled meeting_1))
    )
  )

  (:action schedule_meeting_at_s_12_30
    :parameters ()
    :precondition (and
      (unscheduled meeting_1)
      (required meeting_1 arthur)
      (required meeting_1 theresa)
      (required meeting_1 carl)
      (not (blocked arthur s_12_30))
      (not (blocked theresa s_12_30))
      (not (blocked carl s_12_30))
    )
    :effect (and
      (scheduled meeting_1 s_12_30)
      (meeting_scheduled meeting_1)
      (not (unscheduled meeting_1))
    )
  )

  (:action schedule_meeting_at_s_13_00
    :parameters ()
    :precondition (and
      (unscheduled meeting_1)
      (required meeting_1 arthur)
      (required meeting_1 theresa)
      (required meeting_1 carl)
      (not (blocked arthur s_13_00))
      (not (blocked theresa s_13_00))
      (not (blocked carl s_13_00))
    )
    :effect (and
      (scheduled meeting_1 s_13_00)
      (meeting_scheduled meeting_1)
      (not (unscheduled meeting_1))
    )
  )

  (:action schedule_meeting_at_s_13_30
    :parameters ()
    :precondition (and
      (unscheduled meeting_1)
      (required meeting_1 arthur)
      (required meeting_1 theresa)
      (required meeting_1 carl)
      (not (blocked arthur s_13_30))
      (not (blocked theresa s_13_30))
      (not (blocked carl s_13_30))
    )
    :effect (and
      (scheduled meeting_1 s_13_30)
      (meeting_scheduled meeting_1)
      (not (unscheduled meeting_1))
    )
  )

  (:action schedule_meeting_at_s_14_00
    :parameters ()
    :precondition (and
      (unscheduled meeting_1)
      (required meeting_1 arthur)
      (required meeting_1 theresa)
      (required meeting_1 carl)
      (not (blocked arthur s_14_00))
      (not (blocked theresa s_14_00))
      (not (blocked carl s_14_00))
    )
    :effect (and
      (scheduled meeting_1 s_14_00)
      (meeting_scheduled meeting_1)
      (not (unscheduled meeting_1))
    )
  )

  (:action schedule_meeting_at_s_14_30
    :parameters ()
    :precondition (and
      (unscheduled meeting_1)
      (required meeting_1 arthur)
      (required meeting_1 theresa)
      (required meeting_1 carl)
      (not (blocked arthur s_14_30))
      (not (blocked theresa s_14_30))
      (not (blocked carl s_14_30))
    )
    :effect (and
      (scheduled meeting_1 s_14_30)
      (meeting_scheduled meeting_1)
      (not (unscheduled meeting_1))
    )
  )

  (:action schedule_meeting_at_s_15_00
    :parameters ()
    :precondition (and
      (unscheduled meeting_1)
      (required meeting_1 arthur)
      (required meeting_1 theresa)
      (required meeting_1 carl)
      (not (blocked arthur s_15_00))
      (not (blocked theresa s_15_00))
      (not (blocked carl s_15_00))
    )
    :effect (and
      (scheduled meeting_1 s_15_00)
      (meeting_scheduled meeting_1)
      (not (unscheduled meeting_1))
    )
  )

  (:action schedule_meeting_at_s_15_30
    :parameters ()
    :precondition (and
      (unscheduled meeting_1)
      (required meeting_1 arthur)
      (required meeting_1 theresa)
      (required meeting_1 carl)
      (not (blocked arthur s_15_30))
      (not (blocked theresa s_15_30))
      (not (blocked carl s_15_30))
    )
    :effect (and
      (scheduled meeting_1 s_15_30)
      (meeting_scheduled meeting_1)
      (not (unscheduled meeting_1))
    )
  )

  (:action schedule_meeting_at_s_16_00
    :parameters ()
    :precondition (and
      (unscheduled meeting_1)
      (required meeting_1 arthur)
      (required meeting_1 theresa)
      (required meeting_1 carl)
      (not (blocked arthur s_16_00))
      (not (blocked theresa s_16_00))
      (not (blocked carl s_16_00))
    )
    :effect (and
      (scheduled meeting_1 s_16_00)
      (meeting_scheduled meeting_1)
      (not (unscheduled meeting_1))
    )
  )

  (:action schedule_meeting_at_s_16_30
    :parameters ()
    :precondition (and
      (unscheduled meeting_1)
      (required meeting_1 arthur)
      (required meeting_1 theresa)
      (required meeting_1 carl)
      (not (blocked arthur s_16_30))
      (not (blocked theresa s_16_30))
      (not (blocked carl s_16_30))
    )
    :effect (and
      (scheduled meeting_1 s_16_30)
      (meeting_scheduled meeting_1)
      (not (unscheduled meeting_1))
    )
  )
)