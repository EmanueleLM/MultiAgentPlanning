(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
    meeting
  )

  (:constants
    raymond billy donald - participant
    t0930_1000 t1100_1130 t1330_1400 t1430_1500 - slot
  )

  (:predicates
    (participant_free ?p - participant ?s - slot)
    (scheduled_at ?m - meeting ?s - slot)
    (meeting_unscheduled ?m - meeting)
    (meeting_scheduled ?m - meeting)
  )

  (:action schedule_at_t0930_1000
    :parameters (?m - meeting)
    :precondition (and
      (meeting_unscheduled ?m)
      (participant_free raymond t0930_1000)
      (participant_free billy t0930_1000)
      (participant_free donald t0930_1000)
      (not (meeting_scheduled ?m))
    )
    :effect (and
      (scheduled_at ?m t0930_1000)
      (meeting_scheduled ?m)
      (not (meeting_unscheduled ?m))
    )
  )

  (:action schedule_at_t1100_1130
    :parameters (?m - meeting)
    :precondition (and
      (meeting_unscheduled ?m)
      (participant_free raymond t1100_1130)
      (participant_free billy t1100_1130)
      (participant_free donald t1100_1130)
      (not (meeting_scheduled ?m))
    )
    :effect (and
      (scheduled_at ?m t1100_1130)
      (meeting_scheduled ?m)
      (not (meeting_unscheduled ?m))
    )
  )

  (:action schedule_at_t1330_1400
    :parameters (?m - meeting)
    :precondition (and
      (meeting_unscheduled ?m)
      (participant_free raymond t1330_1400)
      (participant_free billy t1330_1400)
      (participant_free donald t1330_1400)
      (not (meeting_scheduled ?m))
    )
    :effect (and
      (scheduled_at ?m t1330_1400)
      (meeting_scheduled ?m)
      (not (meeting_unscheduled ?m))
    )
  )

  (:action schedule_at_t1430_1500
    :parameters (?m - meeting)
    :precondition (and
      (meeting_unscheduled ?m)
      (participant_free raymond t1430_1500)
      (participant_free billy t1430_1500)
      (participant_free donald t1430_1500)
      (not (meeting_scheduled ?m))
    )
    :effect (and
      (scheduled_at ?m t1430_1500)
      (meeting_scheduled ?m)
      (not (meeting_unscheduled ?m))
    )
  )
)