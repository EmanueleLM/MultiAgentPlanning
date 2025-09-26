(define (domain meeting-schedule)
  (:requirements :strips)
  (:constants michelle steven jerry)
  (:predicates
    (free ?person ?slot)
    (slot-next ?s1 ?s2)
    (meeting-scheduled ?slot)
  )
  (:action schedule
    :parameters (?s1 ?s2)
    :precondition (and
      (slot-next ?s1 ?s2)
      (free michelle ?s1) (free michelle ?s2)
      (free steven ?s1) (free steven ?s2)
      (free jerry ?s1) (free jerry ?s2)
    )
    :effect (and
      (meeting-scheduled ?s1)
    )
  )
)