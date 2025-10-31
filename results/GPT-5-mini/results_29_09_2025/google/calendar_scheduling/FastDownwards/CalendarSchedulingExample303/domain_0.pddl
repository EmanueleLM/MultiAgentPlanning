(define (domain meeting-schedule)
  (:requirements :strips)
  (:predicates
    (available ?p ?s)        ; person ?p is available at slot ?s
    (meeting-scheduled ?s)   ; a meeting is scheduled at slot ?s
  )

  (:action schedule-meeting
    :parameters (?s)
    :precondition (and
      (available theresa ?s)
      (available alexander ?s)
      (available virginia ?s)
      (available lisa ?s)
      (available natalie ?s)
      (available victoria ?s)
    )
    :effect (meeting-scheduled ?s)
  )
)