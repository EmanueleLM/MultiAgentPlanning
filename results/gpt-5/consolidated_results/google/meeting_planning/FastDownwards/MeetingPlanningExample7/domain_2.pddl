(define (domain meeting_sf)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time count)
  (:predicates
    (at ?l - location)
    (idle)
    (current-time ?t - time)
    (next ?t1 - time ?t2 - time)
    (available-john ?t - time)
    (meeting-spot ?l - location)
    (road ?from - location ?to - location)
    (duration ?from - location ?to - location ?d - count)
    (traveling ?from - location ?to - location)
    (rem-travel ?d - count)
    (prev-count ?c - count ?c1 - count)
    (next-count ?c - count ?c1 - count)
    (is-zero ?c - count)
    (is-75 ?c - count)
    (meeting-active)
    (meeting-count ?c - count)
    (met-minimum)
  )

  (:action wait
    :parameters (?l - location ?t - time ?t1 - time)
    :precondition (and (idle) (at ?l) (current-time ?t) (next ?t ?t1))
    :effect (and (not (current-time ?t)) (current-time ?t1))
  )

  (:action start_move
    :parameters (?from - location ?to - location ?d - count ?t - time)
    :precondition (and (idle) (at ?from) (road ?from ?to) (duration ?from ?to ?d) (current-time ?t))
    :effect (and (not (idle)) (not (at ?from)) (traveling ?from ?to) (rem-travel ?d))
  )

  (:action travel_tick
    :parameters (?from - location ?to - location ?c - count ?c1 - count ?t - time ?t1 - time)
    :precondition (and (traveling ?from ?to) (rem-travel ?c) (prev-count ?c ?c1) (current-time ?t) (next ?t ?t1))
    :effect (and (not (current-time ?t)) (current-time ?t1) (not (rem-travel ?c)) (rem-travel ?c1))
  )

  (:action travel_arrive
    :parameters (?from - location ?to - location ?cz - count ?t - time)
    :precondition (and (traveling ?from ?to) (rem-travel ?cz) (is-zero ?cz) (current-time ?t))
    :effect (and (not (traveling ?from ?to)) (not (rem-travel ?cz)) (idle) (at ?to))
  )

  (:action start_meeting
    :parameters (?l - location ?t - time ?cz - count)
    :precondition (and (idle) (at ?l) (meeting-spot ?l) (current-time ?t) (available-john ?t) (is-zero ?cz))
    :effect (and (not (idle)) (meeting-active) (meeting-count ?cz))
  )

  (:action meet_tick
    :parameters (?c - count ?c1 - count ?t - time ?t1 - time)
    :precondition (and (meeting-active) (meeting-count ?c) (next-count ?c ?c1) (current-time ?t) (next ?t ?t1) (available-john ?t))
    :effect (and (not (current-time ?t)) (current-time ?t1) (not (meeting-count ?c)) (meeting-count ?c1))
  )

  (:action mark_met_minimum
    :parameters (?cmax - count)
    :precondition (and (meeting-active) (meeting-count ?cmax) (is-75 ?cmax))
    :effect (met-minimum)
  )

  (:action end_meeting
    :parameters (?t - time)
    :precondition (and (meeting-active) (current-time ?t))
    :effect (and (not (meeting-active)) (idle))
  )
)