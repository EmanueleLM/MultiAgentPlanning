(define (domain meetingplanningexample18-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time)

  (:predicates
    (at ?l - location ?t - time)
    (succ ?t1 - time ?t2 - time)
    (travel-edge ?from - location ?to - location ?t1 - time ?t2 - time)
    (plus75 ?t1 - time ?t2 - time)
    (betty-window ?t - time)
    (richmond-loc ?l - location)
    (met-betty)
  )

  (:action wait
    :parameters (?loc - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?loc ?t1)
      (succ ?t1 ?t2)
    )
    :effect (and
      (not (at ?loc ?t1))
      (at ?loc ?t2)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?from ?t1)
      (travel-edge ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (at ?from ?t1))
      (at ?to ?t2)
    )
  )

  (:action meet-betty
    :parameters (?loc - location ?tstart - time ?tend - time)
    :precondition (and
      (at ?loc ?tstart)
      (richmond-loc ?loc)
      (betty-window ?tstart)
      (plus75 ?tstart ?tend)
    )
    :effect (and
      (met-betty)
      (not (at ?loc ?tstart))
      (at ?loc ?tend)
    )
  )
)