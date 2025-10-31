(define (domain meeting-schedule)
  (:requirements :typing)
  (:types participant slot)
  (:constants nicholas emma catherine steven adam lori - participant)
  (:predicates
    (available ?p - participant ?s - slot)
    (scheduled ?s - slot)
  )

  (:action schedule
    :parameters (?s - slot)
    :precondition (and
      (available nicholas ?s)
      (available emma ?s)
      (available catherine ?s)
      (available steven ?s)
      (available adam ?s)
      (available lori ?s)
    )
    :effect (scheduled ?s)
  )
)