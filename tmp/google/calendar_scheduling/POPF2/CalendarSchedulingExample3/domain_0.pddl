```lisp
(define (domain unified_schedule_meeting)
  (:requirements :strips :typing :durative-actions :conditional-effects)
  
  (:types 
    time_slot person
  )
  
  (:predicates
    (available ?person - person ?slot - time_slot)
    (meeting_scheduled ?slot - time_slot)
    (next ?slot1 ?slot2 - time_slot)
  )

  (:durative-action schedule_combined_meeting
    :parameters (?slot - time_slot)
    :duration (= ?duration 60)
    :condition (and
      (at start (available Arthur ?slot))
      (at start (available Michael ?slot))
      (at start (available Samantha ?slot))
    )
    :effect (and
      (at end (meeting_scheduled ?slot))
      (at start (not (available Arthur ?slot)))
      (at start (not (available Michael ?slot)))
      (at start (not (available Samantha ?slot)))
    )
  )
)
```