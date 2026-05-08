(define (domain calendar_scheduling_example_40)
  (:requirements :strips :typing)
  (:types slot)
  (:predicates
    (available ?s - slot)
    (next ?s1 ?s2 - slot)
    (meeting_scheduled)
  )
  (:action schedule_1hr_meeting
    :parameters (?s1 ?s2 - slot)
    :precondition (and 
      (next ?s1 ?s2)
      (available ?s1)
      (available ?s2)
    )
    :effect (meeting_scheduled)
  )
)