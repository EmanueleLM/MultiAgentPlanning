(define (domain meeting-domain)
  (:requirements :strips :typing :negative-preconditions :equality :fluents :action-costs :universal-preconditions)
  (:types agent location time)
  (:predicates
    (at-time ?a - agent ?l - location ?t - time)
    (plus1 ?t - time ?t1 - time)
    (plus22 ?t - time ?t2 - time)
    (interval90 ?s - time ?e - time)
    (in-interval ?s - time ?e - time ?t - time)
    (met)
  )
  (:functions (total-cost))

  (:action travel-bayview-to-ggp
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (at-time traveler bayview ?t)
      (plus22 ?t ?t2)
    )
    :effect (and
      (at-time traveler ggp ?t2)
      (increase (total-cost) 22)
    )
  )

  (:action wait
    :parameters (?a - agent ?l - location ?t - time ?t1 - time)
    :precondition (and
      (at-time ?a ?l ?t)
      (plus1 ?t ?t1)
    )
    :effect (and
      (at-time ?a ?l ?t1)
      (increase (total-cost) 1)
    )
  )

  (:action start-meeting
    :parameters (?s - time ?e - time)
    :precondition (and
      (interval90 ?s ?e)
      (forall (?t - time)
        (imply (in-interval ?s ?e ?t)
               (and (at-time traveler ggp ?t) (at-time barbara ggp ?t))
        )
      )
    )
    :effect (and
      (met)
      (increase (total-cost) 90)
    )
  )
)