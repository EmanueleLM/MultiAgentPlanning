(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person block)

  (:predicates
    (available ?p - person ?b - block) ;; True if person ?p is available during block ?b
    (next ?b1 ?b2 - block)             ;; True if block ?b2 follows block ?b1
    (meeting_scheduled)                ;; True if the meeting has been scheduled
  )

  (:action schedule_one_hour_meeting
    :parameters (?b1 ?b2 - block)
    :precondition (and
      (next ?b1 ?b2)
      ;; Everyone must be available for both consecutive 30-minute blocks
      (available bobby ?b1)
      (available bobby ?b2)
      (available scott ?b1)
      (available scott ?b2)
      (available kimberly ?b1)
      (available kimberly ?b2)
    )
    :effect (meeting_scheduled)
  )
)