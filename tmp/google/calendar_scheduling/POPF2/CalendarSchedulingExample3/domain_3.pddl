(define (domain unified_schedule_meeting)
  (:requirements :strips :typing :durative-actions)
  
  (:types 
    time_slot person
  )
  
  (:predicates
    (available ?person - person ?slot - time_slot)
    (meeting_scheduled ?slot - time_slot)
    (next ?slot1 ?slot2 - time_slot)
  )

  (:durative-action schedule_combined_meeting
    :parameters (?p1 ?p2 ?p3 - person ?slot - time_slot)
    :duration (= ?duration 60)
    :condition (and
      (at start (available ?p1 ?slot))
      (at start (available ?p2 ?slot))
      (at start (available ?p3 ?slot))
    )
    :effect (and
      (at end (meeting_scheduled ?slot))
      (at start (not (available ?p1 ?slot)))
      (at start (not (available ?p2 ?slot)))
      (at start (not (available ?p3 ?slot)))
    )
  )
)