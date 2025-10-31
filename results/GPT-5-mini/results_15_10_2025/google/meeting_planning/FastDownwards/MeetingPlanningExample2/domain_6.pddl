(define (domain sf-meet-discrete)
  (:requirements :strips :typing)
  (:types location time)
  (:predicates
    (at-visitor ?l - location ?t - time)
    (at-jessica ?l - location ?t - time)
    (available-visitor ?t - time)
    (available-jessica ?t - time)
    (next ?t1 - time ?t2 - time)
    (slot15 ?t1 - time ?t2 - time)
    (span90 ?t1 - time ?t2 - time)
    (met)
  )

  (:action advance-visitor
    :parameters (?loc - location ?t1 - time ?t2 - time)
    :precondition (and (at-visitor ?loc ?t1) (next ?t1 ?t2))
    :effect (and (not (at-visitor ?loc ?t1)) (at-visitor ?loc ?t2))
  )

  (:action travel-visitor
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at-visitor ?from ?t1) (slot15 ?t1 ?t2))
    :effect (and (not (at-visitor ?from ?t1)) (at-visitor ?to ?t2))
  )

  (:action advance-jessica
    :parameters (?loc - location ?t1 - time ?t2 - time)
    :precondition (and (at-jessica ?loc ?t1) (next ?t1 ?t2))
    :effect (and (not (at-jessica ?loc ?t1)) (at-jessica ?loc ?t2))
  )

  (:action travel-jessica
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at-jessica ?from ?t1) (slot15 ?t1 ?t2))
    :effect (and (not (at-jessica ?from ?t1)) (at-jessica ?to ?t2))
  )

  (:action meet-visitor-jessica
    :parameters (?loc - location ?tstart - time ?tend - time)
    :precondition (and
      (at-visitor ?loc ?tstart)
      (at-visitor ?loc ?tend)
      (at-jessica ?loc ?tstart)
      (at-jessica ?loc ?tend)
      (available-visitor ?tstart)
      (available-visitor ?tend)
      (available-jessica ?tstart)
      (available-jessica ?tend)
      (span90 ?tstart ?tend)
    )
    :effect (and (met))
  )
)