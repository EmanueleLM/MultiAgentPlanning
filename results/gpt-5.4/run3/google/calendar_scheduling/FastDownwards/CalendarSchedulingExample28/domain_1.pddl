(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
    meeting
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (requires ?m - meeting ?p - participant)
    (scheduled ?m - meeting)
    (scheduled_in ?m - meeting ?s - slot)
  )

  (:action schedule_meeting_1_at_11_00
    :parameters (?m - meeting ?b - participant ?e - participant ?d - participant ?s - slot)
    :precondition (and
      (= ?m meeting_1)
      (= ?b brittany)
      (= ?e emily)
      (= ?d doris)
      (= ?s s_11_00)
      (not (scheduled ?m))
      (requires ?m ?b)
      (requires ?m ?e)
      (requires ?m ?d)
      (free ?b ?s)
      (free ?e ?s)
      (free ?d ?s)
    )
    :effect (and
      (scheduled ?m)
      (scheduled_in ?m ?s)
    )
  )
)