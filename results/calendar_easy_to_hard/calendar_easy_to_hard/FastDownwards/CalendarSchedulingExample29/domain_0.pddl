(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types time agent)
  (:predicates
    (available ?ag - agent ?t - time)
    (meeting-scheduled)
    (meeting-start ?t - time)
  )

  (:action schedule
    :parameters (?t - time)
    :precondition (and
      (not (meeting-scheduled))
      (available michael ?t)
      (available samuel ?t)
      (available aaron ?t)
      (available judith ?t)
      (available kevin ?t)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-start ?t)
    )
  )
)