(define (domain monday_meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
    meeting
  )

  (:predicates
    (meeting_to_schedule ?m - meeting)
    (free ?p - participant ?s - slot)
    (allowed_slot ?m - meeting ?s - slot)
    (requires ?m - meeting ?p - participant)
    (scheduled_at ?m - meeting ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (meeting_to_schedule ?m)
      (allowed_slot ?m ?s)
      (requires ?m kathryn)
      (requires ?m charlotte)
      (requires ?m lauren)
      (free kathryn ?s)
      (free charlotte ?s)
      (free lauren ?s)
      (not (scheduled_at ?m s0900_0930))
      (not (scheduled_at ?m s0930_1000))
      (not (scheduled_at ?m s1000_1030))
      (not (scheduled_at ?m s1030_1100))
      (not (scheduled_at ?m s1100_1130))
      (not (scheduled_at ?m s1130_1200))
      (not (scheduled_at ?m s1200_1230))
      (not (scheduled_at ?m s1230_1300))
      (not (scheduled_at ?m s1300_1330))
      (not (scheduled_at ?m s1330_1400))
      (not (scheduled_at ?m s1400_1430))
      (not (scheduled_at ?m s1430_1500))
      (not (scheduled_at ?m s1500_1530))
      (not (scheduled_at ?m s1530_1600))
      (not (scheduled_at ?m s1600_1630))
      (not (scheduled_at ?m s1630_1700))
    )
    :effect (and
      (scheduled_at ?m ?s)
    )
  )
)