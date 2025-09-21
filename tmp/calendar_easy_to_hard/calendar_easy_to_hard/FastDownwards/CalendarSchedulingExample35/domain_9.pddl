(define (domain meeting-scheduling)
  (:requirements :typing :strips)
  (:types person slot)
  (:predicates
    (unscheduled)
    (meeting-scheduled)
    (meeting-at ?s - slot)
    (available ?p - person ?s - slot)
  )
  (:action schedule
    :parameters (?s - slot
                 ?diane - person
                 ?helen - person
                 ?arthur - person
                 ?ethan - person
                 ?beverly - person
                 ?deborah - person)
    :precondition (and
      (unscheduled)
      (available ?diane ?s)
      (available ?helen ?s)
      (available ?arthur ?s)
      (available ?ethan ?s)
      (available ?beverly ?s)
      (available ?deborah ?s)
    )
    :effect (and
      (not (unscheduled))
      (meeting-scheduled)
      (meeting-at ?s)
    )
  )
)