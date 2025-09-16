(define (domain composite-meeting-scheduling)
  (:requirements :typing)
  (:types person slot)

  (:predicates
    (available ?p - person ?s - slot)
    (occupied ?s - slot)
    (scheduled ?s - slot)
    (janet-free ?s - slot)
    (janet-scheduled)
  )

  (:action schedule-diana
    :parameters (?d - person ?s - slot)
    :precondition (and (available ?d ?s)
                       (not (occupied ?s))
                       (not (scheduled ?s)))
    :effect (and (occupied ?s)
                 (not (available ?d ?s))
                 (scheduled ?s))
  )

  (:action schedule-meeting
    :parameters (?t - slot ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and (available ?p1 ?t)
                       (available ?p2 ?t)
                       (available ?p3 ?t)
                       (not (scheduled ?t)))
    :effect (and (scheduled ?t)
                 (not (available ?p1 ?t))
                 (not (available ?p2 ?t))
                 (not (available ?p3 ?t)))
  )

  (:action schedule-janet
    :parameters (?s - slot)
    :precondition (janet-free ?s)
    :effect (and (not (janet-free ?s))
                 (janet-scheduled))
  )
)