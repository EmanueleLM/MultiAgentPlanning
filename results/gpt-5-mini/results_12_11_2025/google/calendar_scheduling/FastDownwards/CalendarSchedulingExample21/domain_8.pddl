(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant timepoint slot)

  (:predicates
    (succ ?t1 - timepoint ?t2 - timepoint)
    (slot-start ?s - slot ?t - timepoint)
    (slot-end ?s - slot ?t - timepoint)
    (duration-60 ?t1 - timepoint ?t2 - timepoint)
    (free ?p - participant ?s - slot)
    (chosen ?s - slot)
    (meeting-scheduled)
  )

  (:action choose-slot
    :parameters (?s - slot ?st - timepoint ?end - timepoint
                 ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
      (slot-start ?s ?st)
      (slot-end ?s ?end)
      (duration-60 ?st ?end)
      (not (meeting-scheduled))
      (free ?p1 ?s)
      (free ?p2 ?s)
      (free ?p3 ?s)
      (not (chosen ?s))
    )
    :effect (and
      (chosen ?s)
      (meeting-scheduled)
      (not (free ?p1 ?s))
      (not (free ?p2 ?s))
      (not (free ?p3 ?s))
    )
  )
)