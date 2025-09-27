(define (domain meeting-planning)
  (:requirements :strips :typing :negative-preconditions :equality :action-costs)
  (:types agent location time count)

  (:constants
    visitor mary - agent
    union-square nob-hill - location
    c0 c1 c2 c3 c4 c5 c6 c7 c8 c9
    c10 c11 c12 c13 c14 c15 c16 c17 c18 c19
    c20 c21 c22 c23 c24 c25 c26 c27 c28 c29
    c30 c31 c32 c33 c34 c35 c36 c37 c38 c39
    c40 c41 c42 c43 c44 c45 c46 c47 c48 c49
    c50 c51 c52 c53 c54 c55 c56 c57 c58 c59
    c60 c61 c62 c63 c64 c65 c66 c67 c68 c69
    c70 c71 c72 c73 c74 c75 - count
  )

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
    :effect (and (not (meeting-active)))
    :cost 0
  )

  (:action advance-time
    :parameters (?t - time ?tnext - time)
    :precondition (and (current-time ?t) (next ?t ?tnext) (not (meeting-active)))
    :effect (and (not (current-time ?t)) (current-time ?tnext))
    :cost 1
  )
)