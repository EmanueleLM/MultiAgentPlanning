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
    :parameters (?m - meeting ?a - participant ?b - participant ?c - participant)
    :precondition (and
      (unscheduled ?m)
      (required ?m ?a)
      (required ?m ?b)
      (required ?m ?c)
      (not (blocked ?a s_09_00))
      (not (blocked ?b s_09_00))
      (not (blocked ?c s_09_00))
    )
    :effect (and
      (scheduled ?m s_09_00)
      (meeting_scheduled ?m)
      (not (unscheduled ?m))
    )
  )

  (:action schedule_meeting_at_s_09_30
    :parameters (?m - meeting ?a - participant ?b - participant ?c - participant)
    :precondition (and
      (unscheduled ?m)
      (required ?m ?a)
      (required ?m ?b)
      (required ?m ?c)
      (not (blocked ?a s_09_30))
      (not (blocked ?b s_09_30))
      (not (blocked ?c s_09_30))
    )
    :effect (and
      (scheduled ?m s_09_30)
      (meeting_scheduled ?m)
      (not (unscheduled ?m))
    )
  )

  (:action schedule_meeting_at_s_10_00
    :parameters (?m - meeting ?a - participant ?b - participant ?c - participant)
    :precondition (and
      (unscheduled ?m)
      (required ?m ?a)
      (required ?m ?b)
      (required ?m ?c)
      (not (blocked ?a s_10_00))
      (not (blocked ?b s_10_00))
      (not (blocked ?c s_10_00))
    )
    :effect (and
      (scheduled ?m s_10_00)
      (meeting_scheduled ?m)
      (not (unscheduled ?m))
    )
  )

  (:action schedule_meeting_at_s_10_30
    :parameters (?m - meeting ?a - participant ?b - participant ?c - participant)
    :precondition (and
      (unscheduled ?m)
      (required ?m ?a)
      (required ?m ?b)
      (required ?m ?c)
      (not (blocked ?a s_10_30))
      (not (blocked ?b s_10_30))
      (not (blocked ?c s_10_30))
    )
    :effect (and
      (scheduled ?m s_10_30)
      (meeting_scheduled ?m)
      (not (unscheduled ?m))
    )
  )

  (:action schedule_meeting_at_s_11_00
    :parameters (?m - meeting ?a - participant ?b - participant ?c - participant)
    :precondition (and
      (unscheduled ?m)
      (required ?m ?a)
      (required ?m ?b)
      (required ?m ?c)
      (not (blocked ?a s_11_00))
      (not (blocked ?b s_11_00))
      (not (blocked ?c s_11_00))
    )
    :effect (and
      (scheduled ?m s_11_00)
      (meeting_scheduled ?m)
      (not (unscheduled ?m))
    )
  )

  (:action schedule_meeting_at_s_11_30
    :parameters (?m - meeting ?a - participant ?b - participant ?c - participant)
    :precondition (and
      (unscheduled ?m)
      (required ?m ?a)
      (required ?m ?b)
      (required ?m ?c)
      (not (blocked ?a s_11_30))
      (not (blocked ?b s_11_30))
      (not (blocked ?c s_11_30))
    )
    :effect (and
      (scheduled ?m s_11_30)
      (meeting_scheduled ?m)
      (not (unscheduled ?m))
    )
  )

  (:action schedule_meeting_at_s_12_00
    :parameters (?m - meeting ?a - participant ?b - participant ?c - participant)
    :precondition (and
      (unscheduled ?m)
      (required ?m ?a)
      (required ?m ?b)
      (required ?m ?c)
      (not (blocked ?a s_12_00))
      (not (blocked ?b s_12_00))
      (not (blocked ?c s_12_00))
    )
    :effect (and
      (scheduled ?m s_12_00)
      (meeting_scheduled ?m)
      (not (unscheduled ?m))
    )
  )

  (:action schedule_meeting_at_s_12_30
    :parameters (?m - meeting ?a - participant ?b - participant ?c - participant)
    :precondition (and
      (unscheduled ?m)
      (required ?m ?a)
      (required ?m ?b)
      (required ?m ?c)
      (not (blocked ?a s_12_30))
      (not (blocked ?b s_12_30))
      (not (blocked ?c s_12_30))
    )
    :effect (and
      (scheduled ?m s_12_30)
      (meeting_scheduled ?m)
      (not (unscheduled ?m))
    )
  )

  (:action schedule_meeting_at_s_13_00
    :parameters (?m - meeting ?a - participant ?b - participant ?c - participant)
    :precondition (and
      (unscheduled ?m)
      (required ?m ?a)
      (required ?m ?b)
      (required ?m ?c)
      (not (blocked ?a s_13_00))
      (not (blocked ?b s_13_00))
      (not (blocked ?c s_13_00))
    )
    :effect (and
      (scheduled ?m s_13_00)
      (meeting_scheduled ?m)
      (not (unscheduled ?m))
    )
  )

  (:action schedule_meeting_at_s_13_30
    :parameters (?m - meeting ?a - participant ?b - participant ?c - participant)
    :precondition (and
      (unscheduled ?m)
      (required ?m ?a)
      (required ?m ?b)
      (required ?m ?c)
      (not (blocked ?a s_13_30))
      (not (blocked ?b s_13_30))
      (not (blocked ?c s_13_30))
    )
    :effect (and
      (scheduled ?m s_13_30)
      (meeting_scheduled ?m)
      (not (unscheduled ?m))
    )
  )

  (:action schedule_meeting_at_s_14_00
    :parameters (?m - meeting ?a - participant ?b - participant ?c - participant)
    :precondition (and
      (unscheduled ?m)
      (required ?m ?a)
      (required ?m ?b)
      (required ?m ?c)
      (not (blocked ?a s_14_00))
      (not (blocked ?b s_14_00))
      (not (blocked ?c s_14_00))
    )
    :effect (and
      (scheduled ?m s_14_00)
      (meeting_scheduled ?m)
      (not (unscheduled ?m))
    )
  )

  (:action schedule_meeting_at_s_14_30
    :parameters (?m - meeting ?a - participant ?b - participant ?c - participant)
    :precondition (and
      (unscheduled ?m)
      (required ?m ?a)
      (required ?m ?b)
      (required ?m ?c)
      (not (blocked ?a s_14_30))
      (not (blocked ?b s_14_30))
      (not (blocked ?c s_14_30))
    )
    :effect (and
      (scheduled ?m s_14_30)
      (meeting_scheduled ?m)
      (not (unscheduled ?m))
    )
  )

  (:action schedule_meeting_at_s_15_00
    :parameters (?m - meeting ?a - participant ?b - participant ?c - participant)
    :precondition (and
      (unscheduled ?m)
      (required ?m ?a)
      (required ?m ?b)
      (required ?m ?c)
      (not (blocked ?a s_15_00))
      (not (blocked ?b s_15_00))
      (not (blocked ?c s_15_00))
    )
    :effect (and
      (scheduled ?m s_15_00)
      (meeting_scheduled ?m)
      (not (unscheduled ?m))
    )
  )

  (:action schedule_meeting_at_s_15_30
    :parameters (?m - meeting ?a - participant ?b - participant ?c - participant)
    :precondition (and
      (unscheduled ?m)
      (required ?m ?a)
      (required ?m ?b)
      (required ?m ?c)
      (not (blocked ?a s_15_30))
      (not (blocked ?b s_15_30))
      (not (blocked ?c s_15_30))
    )
    :effect (and
      (scheduled ?m s_15_30)
      (meeting_scheduled ?m)
      (not (unscheduled ?m))
    )
  )

  (:action schedule_meeting_at_s_16_00
    :parameters (?m - meeting ?a - participant ?b - participant ?c - participant)
    :precondition (and
      (unscheduled ?m)
      (required ?m ?a)
      (required ?m ?b)
      (required ?m ?c)
      (not (blocked ?a s_16_00))
      (not (blocked ?b s_16_00))
      (not (blocked ?c s_16_00))
    )
    :effect (and
      (scheduled ?m s_16_00)
      (meeting_scheduled ?m)
      (not (unscheduled ?m))
    )
  )

  (:action schedule_meeting_at_s_16_30
    :parameters (?m - meeting ?a - participant ?b - participant ?c - participant)
    :precondition (and
      (unscheduled ?m)
      (required ?m ?a)
      (required ?m ?b)
      (required ?m ?c)
      (not (blocked ?a s_16_30))
      (not (blocked ?b s_16_30))
      (not (blocked ?c s_16_30))
    )
    :effect (and
      (scheduled ?m s_16_30)
      (meeting_scheduled ?m)
      (not (unscheduled ?m))
    )
  )
)