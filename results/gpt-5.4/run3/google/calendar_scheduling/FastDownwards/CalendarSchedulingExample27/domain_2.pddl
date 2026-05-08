(define (domain calendar_scheduling_example27)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (earlier ?s1 - slot ?s2 - slot)
    (chosen ?s - slot)
    (meeting_scheduled)
  )

  (:action schedule_at_earliest_slot
    :parameters (?s - slot)
    :precondition
      (and
        (not (meeting_scheduled))
        (free jesse ?s)
        (free kathryn ?s)
        (free megan ?s)
        (not
          (exists (?earlier_slot - slot)
            (and
              (earlier ?earlier_slot ?s)
              (free jesse ?earlier_slot)
              (free kathryn ?earlier_slot)
              (free megan ?earlier_slot)))))
    :effect
      (and
        (chosen ?s)
        (meeting_scheduled))
  )
)