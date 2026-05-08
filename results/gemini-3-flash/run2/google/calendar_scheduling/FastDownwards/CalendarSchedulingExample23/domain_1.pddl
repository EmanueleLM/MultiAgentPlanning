(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types time person)
  (:constants
    billy maria william - person
  )
  (:predicates
    (next ?t1 ?t2 - time)
    (busy ?p - person ?t - time)
    (scheduled)
  )
  (:action schedule_meeting
    :parameters (?t1 ?t2 ?t3 - time)
    :precondition (and
      (next ?t1 ?t2)
      (next ?t2 ?t3)
      (not (busy billy ?t1))
      (not (busy billy ?t2))
      (not (busy maria ?t1))
      (not (busy maria ?t2))
      (not (busy william ?t1))
      (not (busy william ?t2))
    )
    :effect (scheduled)
  )
)