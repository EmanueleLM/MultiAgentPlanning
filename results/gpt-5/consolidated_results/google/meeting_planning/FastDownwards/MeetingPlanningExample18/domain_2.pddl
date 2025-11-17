(define (domain meetingplanningexample18)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time count)
  (:predicates
    (at ?l - location)
    (time-at ?t - time)
    (next-wait ?from - time ?to - time)
    (next-travel-mr ?from - time ?to - time)
    (next-travel-rm ?from - time ?to - time)
    (in-window ?t - time)
    (next-minute ?from - time ?to - time)
    (next-count ?n1 - count ?n2 - count)
    (need-betty ?n - count)
    (meeting-active)
  )

  (:action wait
    :parameters (?from - time ?to - time)
    :precondition (and (time-at ?from) (next-wait ?from ?to) (not (meeting-active)))
    :effect (and (not (time-at ?from)) (time-at ?to))
  )

  (:action travel-mr
    :parameters (?from - time ?to - time)
    :precondition (and (at marina) (time-at ?from) (next-travel-mr ?from ?to) (not (meeting-active)))
    :effect (and (not (at marina)) (at richmond) (not (time-at ?from)) (time-at ?to))
  )

  (:action travel-rm
    :parameters (?from - time ?to - time)
    :precondition (and (at richmond) (time-at ?from) (next-travel-rm ?from ?to) (not (meeting-active)))
    :effect (and (not (at richmond)) (at marina) (not (time-at ?from)) (time-at ?to))
  )

  (:action betty-meet-start
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (at richmond) (time-at ?t1) (next-minute ?t1 ?t2) (in-window ?t1) (in-window ?t2) (not (meeting-active)) (need-betty c75))
    :effect (and (meeting-active) (not (need-betty c75)) (need-betty c74) (not (time-at ?t1)) (time-at ?t2))
  )

  (:action betty-meet-continue
    :parameters (?n1 - count ?n2 - count ?t1 - time ?t2 - time)
    :precondition (and (meeting-active) (need-betty ?n1) (next-count ?n1 ?n2) (not (need-betty c1)) (at richmond) (time-at ?t1) (next-minute ?t1 ?t2) (in-window ?t1) (in-window ?t2))
    :effect (and (not (need-betty ?n1)) (need-betty ?n2) (not (time-at ?t1)) (time-at ?t2))
  )

  (:action betty-meet-finish
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (meeting-active) (need-betty c1) (at richmond) (time-at ?t1) (next-minute ?t1 ?t2) (in-window ?t1) (in-window ?t2))
    :effect (and (not (meeting-active)) (not (need-betty c1)) (need-betty c0) (not (time-at ?t1)) (time-at ?t2))
  )
)