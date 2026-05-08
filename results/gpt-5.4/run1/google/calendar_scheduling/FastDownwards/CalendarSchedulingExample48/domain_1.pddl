(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
    interval
    meeting
  )

  (:predicates
    (requires_participant ?m - meeting ?p - participant)
    (interval_slot1 ?i - interval ?s - slot)
    (interval_slot2 ?i - interval ?s - slot)
    (available ?p - participant ?s - slot)
    (allowed_interval ?m - meeting ?i - interval)
    (scheduled ?m - meeting)
    (scheduled_in ?m - meeting ?i - interval)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?i - interval ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition
      (and
        (not (scheduled ?m))
        (allowed_interval ?m ?i)
        (requires_participant ?m ?p1)
        (requires_participant ?m ?p2)
        (requires_participant ?m ?p3)
        (not (= ?p1 ?p2))
        (not (= ?p1 ?p3))
        (not (= ?p2 ?p3))
        (exists (?s1 - slot ?s2 - slot)
          (and
            (interval_slot1 ?i ?s1)
            (interval_slot2 ?i ?s2)
            (available ?p1 ?s1)
            (available ?p1 ?s2)
            (available ?p2 ?s1)
            (available ?p2 ?s2)
            (available ?p3 ?s1)
            (available ?p3 ?s2)
          ))
      )
    :effect
      (and
        (scheduled ?m)
        (scheduled_in ?m ?i)
      )
  )
)