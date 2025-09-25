(define (domain orchestrated-meeting)
  (:requirements :strips)
  (:constants anthony pamela zachary)
  (:predicates
    (slot ?s)
    (next ?s ?s2)
    (free ?p ?s)
    (confirmed ?p ?s)
    (meeting-scheduled)
    (meeting-start ?s)
    (meeting-with ?p)
    (ok-for-pamela ?s)
  )

  (:action confirm-anthony
    :parameters (?s ?s2)
    :precondition (and
      (next ?s ?s2)
      (free anthony ?s)
      (free anthony ?s2)
    )
    :effect (and
      (confirmed anthony ?s)
    )
  )

  (:action confirm-pamela
    :parameters (?s ?s2)
    :precondition (and
      (next ?s ?s2)
      (free pamela ?s)
      (free pamela ?s2)
      (ok-for-pamela ?s)
    )
    :effect (and
      (confirmed pamela ?s)
    )
  )

  (:action confirm-zachary
    :parameters (?s ?s2)
    :precondition (and
      (next ?s ?s2)
      (free zachary ?s)
      (free zachary ?s2)
    )
    :effect (and
      (confirmed zachary ?s)
    )
  )

  (:action finalize-meeting
    :parameters (?s ?s2)
    :precondition (and
      (next ?s ?s2)
      (confirmed anthony ?s)
      (confirmed pamela ?s)
      (confirmed zachary ?s)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-start ?s)
      (meeting-with anthony)
      (meeting-with pamela)
      (meeting-with zachary)
    )
  )
)