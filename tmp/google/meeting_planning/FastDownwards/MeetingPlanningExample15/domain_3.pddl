(define (domain integrated_scheduling_strips)
  (:requirements :strips :typing :negative-preconditions)
  (:types location person schedule time)

  (:predicates
    (at ?l - location)
    (at-user ?l - location)
    (john-location ?l - location)
    (met ?p - person)
    (valid ?s - schedule)

    (now ?t - time)
    (succ21 ?t1 - time ?t2 - time)
    (succ19 ?t1 - time ?t2 - time)
    (le ?t1 - time ?t2 - time)

    (start-time ?s - schedule ?t - time)
    (end-time ?s - schedule ?t - time)
    (arrive-before ?s - schedule)
    (fits-window ?s - schedule)
    (min-duration ?s - schedule)

    (john-start ?t - time)
    (john-end ?t - time)

    (travel-succ ?from - location ?to - location ?t1 - time ?t2 - time)
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?from)
      (now ?t1)
      (travel-succ ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (now ?t1))
      (now ?t2)
      (not (at ?from))
      (at ?to)
    )
  )

  (:action wait-until-john-available
    :parameters (?loc - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?loc)
      (john-location ?loc)
      (now ?t1)
      (john-start ?t2)
      (le ?t1 ?t2)
    )
    :effect (and
      (not (now ?t1))
      (now ?t2)
    )
  )

  (:action validate-schedule
    :parameters (?s - schedule ?from - location ?to - location)
    :precondition (and
      (at-user ?from)
      (john-location ?to)
      (arrive-before ?s)
      (fits-window ?s)
      (min-duration ?s)
    )
    :effect (and
      (valid ?s)
    )
  )

  (:action apply-schedule
    :parameters (?s - schedule ?from - location ?to - location ?tstart - time ?tend - time ?p - person)
    :precondition (and
      (valid ?s)
      (at ?to)
      (john-location ?to)
      (start-time ?s ?tstart)
      (end-time ?s ?tend)
      (now ?tstart)
    )
    :effect (and
      (not (now ?tstart))
      (now ?tend)
      (met ?p)
    )
  )
)