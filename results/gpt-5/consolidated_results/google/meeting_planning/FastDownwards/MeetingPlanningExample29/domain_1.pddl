(define (domain sf-meet-nancy-29)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time)
  (:predicates
    (current ?t - time)
    (next ?t - time ?t2 - time)
    (at ?l - location)
    (connected ?l1 - location ?l2 - location)
    (is-meeting-spot ?l - location)
    (nancy-available-start ?t - time)
    (meeting-in-progress)
    (m-rem-5)
    (m-rem-4)
    (m-rem-3)
    (m-rem-2)
    (m-rem-1)
    (m-rem-0)
  )

  (:action travel
    :parameters (?from - location ?to - location ?t - time ?t2 - time)
    :precondition (and
      (current ?t)
      (next ?t ?t2)
      (at ?from)
      (connected ?from ?to)
      (not (meeting-in-progress)))
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current ?t))
      (current ?t2))
  )

  (:action wait
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (current ?t)
      (next ?t ?t2)
      (not (meeting-in-progress)))
    :effect (and
      (not (current ?t))
      (current ?t2))
  )

  (:action meet-required-5
    :parameters (?l - location ?t - time ?t2 - time)
    :precondition (and
      (current ?t)
      (next ?t ?t2)
      (at ?l)
      (is-meeting-spot ?l)
      (nancy-available-start ?t)
      (m-rem-5))
    :effect (and
      (not (current ?t))
      (current ?t2)
      (meeting-in-progress)
      (not (m-rem-5))
      (m-rem-4))
  )

  (:action meet-required-4
    :parameters (?l - location ?t - time ?t2 - time)
    :precondition (and
      (current ?t)
      (next ?t ?t2)
      (at ?l)
      (is-meeting-spot ?l)
      (nancy-available-start ?t)
      (m-rem-4))
    :effect (and
      (not (current ?t))
      (current ?t2)
      (meeting-in-progress)
      (not (m-rem-4))
      (m-rem-3))
  )

  (:action meet-required-3
    :parameters (?l - location ?t - time ?t2 - time)
    :precondition (and
      (current ?t)
      (next ?t ?t2)
      (at ?l)
      (is-meeting-spot ?l)
      (nancy-available-start ?t)
      (m-rem-3))
    :effect (and
      (not (current ?t))
      (current ?t2)
      (meeting-in-progress)
      (not (m-rem-3))
      (m-rem-2))
  )

  (:action meet-required-2
    :parameters (?l - location ?t - time ?t2 - time)
    :precondition (and
      (current ?t)
      (next ?t ?t2)
      (at ?l)
      (is-meeting-spot ?l)
      (nancy-available-start ?t)
      (m-rem-2))
    :effect (and
      (not (current ?t))
      (current ?t2)
      (meeting-in-progress)
      (not (m-rem-2))
      (m-rem-1))
  )

  (:action meet-required-1
    :parameters (?l - location ?t - time ?t2 - time)
    :precondition (and
      (current ?t)
      (next ?t ?t2)
      (at ?l)
      (is-meeting-spot ?l)
      (nancy-available-start ?t)
      (m-rem-1))
    :effect (and
      (not (current ?t))
      (current ?t2)
      (meeting-in-progress)
      (not (m-rem-1))
      (m-rem-0))
  )

  (:action meet-extra
    :parameters (?l - location ?t - time ?t2 - time)
    :precondition (and
      (current ?t)
      (next ?t ?t2)
      (at ?l)
      (is-meeting-spot ?l)
      (nancy-available-start ?t)
      (m-rem-0)
      (meeting-in-progress))
    :effect (and
      (not (current ?t))
      (current ?t2)
      (meeting-in-progress))
  )

  (:action end-meeting
    :parameters (?l - location)
    :precondition (and
      (meeting-in-progress)
      (m-rem-0)
      (at ?l)
      (is-meeting-spot ?l))
    :effect (and
      (not (meeting-in-progress)))
  )
)