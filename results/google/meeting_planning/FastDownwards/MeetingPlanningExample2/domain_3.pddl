(define (domain meeting-domain)
  (:requirements :typing :negative-preconditions :equality)
  (:types agent location time)

  (:predicates
    (at_time ?a - agent ?l - location ?t - time)
    (succ ?t1 - time ?t2 - time)
    (met ?v - agent ?j - agent)
  )

  (:action move-visitor
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at_time visitor ?from ?t1)
      (succ ?t1 ?t2)
      (not (= ?from ?to))
    )
    :effect (and
      (not (at_time visitor ?from ?t1))
      (at_time visitor ?to ?t2)
    )
  )

  (:action stay-visitor
    :parameters (?loc - location ?t1 - time ?t2 - time)
    :precondition (and
      (at_time visitor ?loc ?t1)
      (succ ?t1 ?t2)
    )
    :effect (and
      (not (at_time visitor ?loc ?t1))
      (at_time visitor ?loc ?t2)
    )
  )

  (:action move-jessica
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at_time jessica ?from ?t1)
      (succ ?t1 ?t2)
      (not (= ?from ?to))
    )
    :effect (and
      (not (at_time jessica ?from ?t1))
      (at_time jessica ?to ?t2)
    )
  )

  (:action stay-jessica
    :parameters (?loc - location ?t1 - time ?t2 - time)
    :precondition (and
      (at_time jessica ?loc ?t1)
      (succ ?t1 ?t2)
    )
    :effect (and
      (not (at_time jessica ?loc ?t1))
      (at_time jessica ?loc ?t2)
    )
  )

  (:action meet
    :parameters (?loc - location
                 ?t0 - time ?t1 - time ?t2 - time ?t3 - time ?t4 - time ?t5 - time ?t6 - time)
    :precondition (and
      (succ ?t0 ?t1)
      (succ ?t1 ?t2)
      (succ ?t2 ?t3)
      (succ ?t3 ?t4)
      (succ ?t4 ?t5)
      (succ ?t5 ?t6)
      (at_time visitor ?loc ?t0) (at_time visitor ?loc ?t1) (at_time visitor ?loc ?t2)
      (at_time visitor ?loc ?t3) (at_time visitor ?loc ?t4) (at_time visitor ?loc ?t5) (at_time visitor ?loc ?t6)
      (at_time jessica ?loc ?t0) (at_time jessica ?loc ?t1) (at_time jessica ?loc ?t2)
      (at_time jessica ?loc ?t3) (at_time jessica ?loc ?t4) (at_time jessica ?loc ?t5) (at_time jessica ?loc ?t6)
    )
    :effect (and
      (met visitor jessica)
    )
  )
)