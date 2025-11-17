(define (domain meetingplanningexample18)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types location time count)
  (:constants
    marina richmond - location
    c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 c25 c26 c27 c28 c29 c30 c31 c32 c33 c34 c35 c36 c37 c38 c39 c40 c41 c42 c43 c44 c45 c46 c47 c48 c49 c50 c51 c52 c53 c54 c55 c56 c57 c58 c59 c60 c61 c62 c63 c64 c65 c66 c67 c68 c69 c70 c71 c72 c73 c74 c75 - count
  )
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
  (:functions (total-cost))
  (:action wait
    :parameters (?from - time ?to - time)
    :precondition (and (time-at ?from) (next-wait ?from ?to) (not (meeting-active)))
    :effect (and (not (time-at ?from)) (time-at ?to))
  )
  (:action travel-mr
    :parameters (?from - time ?to - time)
    :precondition (and (at marina) (time-at ?from) (next-travel-mr ?from ?to) (not (meeting-active)))
    :effect (and (not (at marina)) (at richmond) (not (time-at ?from)) (time-at ?to) (increase (total-cost) 11))
  )
  (:action travel-rm
    :parameters (?from - time ?to - time)
    :precondition (and (at richmond) (time-at ?from) (next-travel-rm ?from ?to) (not (meeting-active)))
    :effect (and (not (at richmond)) (at marina) (not (time-at ?from)) (time-at ?to) (increase (total-cost) 9))
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