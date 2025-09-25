(define (domain meeting-domain)
  (:requirements :typing :negative-preconditions :equality :adl :fluents :action-costs)
  (:types agent location time)
  (:predicates
    (at ?a - agent ?l - location)
    (current_time ?t - time)
    (plus1 ?t1 - time ?t2 - time)
    (plus7 ?t1 - time ?t2 - time)
    (plus105 ?t1 - time ?t2 - time)
    (allow_meet_start ?t - time)
    (sarah_at ?l - location ?t - time)
    (met)
  )
  (:functions (total-cost))

  (:action traveler-move
    :parameters (?a - agent ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?a ?from)
      (current_time ?t1)
      (plus7 ?t1 ?t2)
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
      (not (current_time ?t1))
      (current_time ?t2)
      (increase (total-cost) 7)
    )
  )

  (:action traveler-wait
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (current_time ?t1)
      (plus1 ?t1 ?t2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (increase (total-cost) 1)
    )
  )

  (:action meet
    :parameters (?a - agent ?loc - location ?tstart - time ?tend - time)
    :precondition (and
      (at ?a ?loc)
      (current_time ?tstart)
      (allow_meet_start ?tstart)
      (plus105 ?tstart ?tend)
      (sarah_at ?loc ?tstart)
    )
    :effect (and
      (met)
      (not (current_time ?tstart))
      (current_time ?tend)
    )
  )
)