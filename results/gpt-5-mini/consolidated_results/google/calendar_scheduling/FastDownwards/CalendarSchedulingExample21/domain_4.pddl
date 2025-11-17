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
    :parameters (?s - slot ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (unscheduled)
      (available ?s)
      (slot-start ?s ?t1)
      (slot-end ?s ?t2)
      (duration-60 ?t1 ?t2)
      (free bobby ?t1 ?t2)
      (free scott ?t1 ?t2)
      (free kimberly ?t1 ?t2)
    )
    :effect (and
      (chosen ?s)
      (not (available ?s))
      (not (unscheduled))
    )
  )
)