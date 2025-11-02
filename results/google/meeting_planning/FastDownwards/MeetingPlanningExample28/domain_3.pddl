(define (domain meeting-planning-example28-strips)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time)
  (:predicates
    (at ?l - location)
    (edge ?from - location ?to - location)
    (joshua-loc ?l - location)
    (met-joshua)
    (time-at ?t - time)
    (succ ?from - time ?to - time)
    (step7 ?from - time ?to - time)
    (step75 ?from - time ?to - time)
    (in-window ?t - time)
    (start-ok ?t - time)
  )

  (:action wait
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (time-at ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (not (time-at ?t))
      (time-at ?t2)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?t - time ?t2 - time)
    :precondition (and
      (at ?from)
      (edge ?from ?to)
      (time-at ?t)
      (step7 ?t ?t2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (time-at ?t))
      (time-at ?t2)
    )
  )

  (:action meet-joshua-75
    :parameters (?l - location ?t - time ?t2 - time)
    :precondition (and
      (joshua-loc ?l)
      (at ?l)
      (not (met-joshua))
      (time-at ?t)
      (in-window ?t)
      (start-ok ?t)
      (step75 ?t ?t2)
    )
    :effect (and
      (met-joshua)
      (not (time-at ?t))
      (time-at ?t2)
    )
  )
)