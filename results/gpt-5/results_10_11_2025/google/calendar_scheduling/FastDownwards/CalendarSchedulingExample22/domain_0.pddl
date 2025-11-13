(define (domain meeting-scheduling-30min)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant timeslot meeting)
  (:constants
    theresa charles betty - participant
  )
  (:predicates
    (next ?t1 - timeslot ?t2 - timeslot)
    (busy ?p - participant ?t - timeslot)
    (scheduled ?m - meeting)
    (start-at ?m - meeting ?t - timeslot)
    (end-at ?m - meeting ?t - timeslot)
  )
  (:action choose-start-slot
    :parameters (?m - meeting ?s1 - timeslot ?s2 - timeslot)
    :precondition (and
      (next ?s1 ?s2)
      (not (scheduled ?m))
      (not (busy theresa ?s1))
      (not (busy theresa ?s2))
      (not (busy charles ?s1))
      (not (busy charles ?s2))
      (not (busy betty ?s1))
      (not (busy betty ?s2))
    )
    :effect (and
      (scheduled ?m)
      (start-at ?m ?s1)
      (end-at ?m ?s2)
    )
  )
)