(define (domain meeting-schedule)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time)

  (:predicates
    (at ?loc - location ?t - time)
    (edge11 ?from - location ?to - location)
    (edge12 ?from - location ?to - location)
    (succ ?t1 - time ?t2 - time)
    (interval-wait ?t1 - time ?t2 - time)
    (interval-move11 ?t1 - time ?t2 - time)
    (interval-move12 ?t1 - time ?t2 - time)
    (interval-meet ?t1 - time ?t2 - time)
    (mary-available ?loc - location ?t1 - time ?t2 - time)
    (met-mary)
  )

  (:action wait
    :parameters (?loc - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?loc ?t1)
      (succ ?t1 ?t2)
      (interval-wait ?t1 ?t2)
    )
    :effect (and
      (not (at ?loc ?t1))
      (at ?loc ?t2)
    )
  )

  (:action move-11
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?from ?t1)
      (edge11 ?from ?to)
      (succ ?t1 ?t2)
      (interval-move11 ?t1 ?t2)
    )
    :effect (and
      (not (at ?from ?t1))
      (at ?to ?t2)
    )
  )

  (:action move-12
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?from ?t1)
      (edge12 ?from ?to)
      (succ ?t1 ?t2)
      (interval-move12 ?t1 ?t2)
    )
    :effect (and
      (not (at ?from ?t1))
      (at ?to ?t2)
    )
  )

  (:action meet-mary
    :parameters (?loc - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?loc ?t1)
      (succ ?t1 ?t2)
      (interval-meet ?t1 ?t2)
      (mary-available ?loc ?t1 ?t2)
    )
    :effect (and
      (not (at ?loc ?t1))
      (at ?loc ?t2)
      (met-mary)
    )
  )
)