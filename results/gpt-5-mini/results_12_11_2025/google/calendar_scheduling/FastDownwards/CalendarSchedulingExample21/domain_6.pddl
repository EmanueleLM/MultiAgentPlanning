(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant timepoint slot)

  (:predicates
    (unscheduled)
    (available ?s - slot)
    (chosen ?s - slot)
    (slot-start ?s - slot ?t - timepoint)
    (slot-end ?s - slot ?t - timepoint)
    (succ ?t1 - timepoint ?t2 - timepoint)
    (duration-60 ?t1 - timepoint ?t2 - timepoint)
    (free ?p - participant ?t1 - timepoint ?t2 - timepoint)
  )

  (:action choose-slot
    :parameters (?s - slot ?st - timepoint ?end - timepoint ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
      (unscheduled)
      (available ?s)
      (slot-start ?s ?st)
      (slot-end ?s ?end)
      (duration-60 ?st ?end)
      (free ?p1 ?st ?end)
      (free ?p2 ?st ?end)
      (free ?p3 ?st ?end)
    )
    :effect (and
      (chosen ?s)
      (not (available ?s))
      (not (unscheduled))
    )
  )
)