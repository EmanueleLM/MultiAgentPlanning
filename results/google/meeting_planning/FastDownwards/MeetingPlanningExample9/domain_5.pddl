(define (domain meeting-planning)
  (:requirements :strips :typing :negative-preconditions :equality :action-costs)
  (:types agent location time count)

  (:predicates
    (current-time ?t - time)
    (next ?t1 - time ?t2 - time)
    (plus9 ?t1 - time ?t2 - time)
    (plus7 ?t1 - time ?t2 - time)
    (at ?a - agent ?l - location)
    (mary-available ?t - time)
    (meeting-active)
    (met-count ?c - count)
    (nextcount ?c1 - count ?c2 - count)
    (met-started-at ?t - time)
  )

  (:action travel-us-to-nh
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (plus9 ?t ?t2) (at visitor union-square) (not (meeting-active)))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (at visitor union-square)) (at visitor nob-hill))
    :cost 9
  )

  (:action travel-nh-to-us
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (plus7 ?t ?t2) (at visitor nob-hill) (not (meeting-active)))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (at visitor nob-hill)) (at visitor union-square))
    :cost 7
  )

  (:action start-meeting
    :parameters (?t - time ?loc - location)
    :precondition (and (current-time ?t) (at visitor ?loc) (at mary ?loc) (mary-available ?t) (not (meeting-active)))
    :effect (and (meeting-active) (met-started-at ?t) (met-count c0))
    :cost 0
  )

  (:action meet-advance
    :parameters (?t - time ?tnext - time ?c - count ?cnext - count ?loc - location)
    :precondition (and (current-time ?t) (next ?t ?tnext) (meeting-active) (met-count ?c) (nextcount ?c ?cnext) (mary-available ?t) (at visitor ?loc) (at mary ?loc))
    :effect (and (not (current-time ?t)) (current-time ?tnext) (not (met-count ?c)) (met-count ?cnext))
    :cost 0
  )

  (:action end-meeting
    :parameters (?t - time)
    :precondition (and (current-time ?t) (meeting-active) (met-count c75) (mary-available ?t))
    :effect (and (not (meeting-active)) (not (met-count c75)))
    :cost 0
  )

  (:action advance-time
    :parameters (?t - time ?tnext - time)
    :precondition (and (current-time ?t) (next ?t ?tnext) (not (meeting-active)))
    :effect (and (not (current-time ?t)) (current-time ?tnext))
    :cost 1
  )
)