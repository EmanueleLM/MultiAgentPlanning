(define (domain integrated-scheduling)
  (:requirements :strips :typing)
  
  (:types person time-slot)
  
  (:predicates
    (available ?p - person ?s - time-slot)
    (meeting-scheduled ?s - time-slot)
    (time-slot ?s - time-slot)
    (time-slot-preference ?p - person ?s - time-slot)
  )
  
  (:action schedule-meeting-heather
    :parameters (?s - time-slot)
    :precondition
      (and
        (available heather ?s)
        (available nicholas ?s)
        (available zachary ?s)
        (not (meeting-scheduled ?s))
      )
    :effect (meeting-scheduled ?s)
  )

  (:action schedule-meeting-nicholas
    :parameters (?s - time-slot)
    :precondition
      (and
        (available heather ?s)
        (available nicholas ?s)
        (available zachary ?s)
        (not (meeting-scheduled ?s))
      )
    :effect (meeting-scheduled ?s)
  )

  (:action schedule-meeting-zachary
    :parameters (?s - time-slot)
    :precondition
      (and
        (available heather ?s)
        (available nicholas ?s)
        (available zachary ?s)
        (not (meeting-scheduled ?s))
      )
    :effect (meeting-scheduled ?s)
  )
)