(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant timepoint slot)

  (:predicates
    (slot-start ?s - slot ?t - timepoint)
    (slot-end ?s - slot ?t - timepoint)
    (succ ?t1 - timepoint ?t2 - timepoint)
    (duration-60 ?t1 - timepoint ?t2 - timepoint)
    (free ?p - participant ?t1 - timepoint ?t2 - timepoint)
    (free-for-all ?s - slot)
    (chosen ?s - slot)
  )

  (:action choose-slot
    :parameters (?s - slot ?st - timepoint ?end - timepoint)
    :precondition (and
      (slot-start ?s ?st)
      (slot-end ?s ?end)
      (duration-60 ?st ?end)
      (free-for-all ?s)
    )
    :effect (and
      (chosen ?s)
      (not (free-for-all ?s))
    )
  )
)