(define (domain meeting-scheduler-integrated)
  (:requirements :typing)
  (:types person slot)
  (:constants diane deborah - person)
  (:predicates
     (busy ?p - person ?t - slot)
     (scheduled ?t - slot)
     (free ?p - person ?s - slot)
  )

  ; Agent 1 style action (per-datetime, single time slot)
  (:action schedule-meeting-A
     :parameters (?t - slot)
     :precondition (and (not (busy diane ?t))
                        (not (busy deborah ?t))
                        (not (scheduled ?t)))
     :effect (and
        (busy diane ?t)
        (busy deborah ?t)
        (scheduled ?t))
  )

  ; Agent 2 style action (two persons, one time)
  (:action schedule-meeting-B
     :parameters (?p1 - person ?p2 - person ?t - slot)
     :precondition (and (not (busy ?p1 ?t))
                        (not (busy ?p2 ?t))
                        (not (scheduled ?t)))
     :effect (scheduled ?t)
  )

  ; Agent 3 style action (two persons, one slot, using free predicate)
  (:action schedule-meeting-C
     :parameters (?p1 - person ?p2 - person ?s - slot)
     :precondition (and (free ?p1 ?s)
                        (free ?p2 ?s)
                        (not (scheduled ?s)))
     :effect (and (not (free ?p1 ?s))
                  (not (free ?p2 ?s))
                  (scheduled ?s))
  )
)