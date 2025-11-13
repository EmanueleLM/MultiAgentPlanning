(define (domain meetingplanningexample20_domain)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    location time segment
  )
  (:constants
    chinatown nobhill - location
  )
  (:predicates
    (at ?l - location)
    (current ?t - time)
    (next ?t - time ?t2 - time)
    (after6 ?t - time ?t2 - time)
    (after8 ?t - time ?t2 - time)
    (withinwindow ?t - time)
    (todo ?s - segment)
    (nextseg ?s - segment ?s2 - segment)
    (meeting-active)
  )
  (:functions
    (total-cost)
  )

  (:action move-chinatown-nobhill
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (at chinatown)
      (current ?t)
      (after8 ?t ?t2)
      (not (meeting-active))
    )
    :effect (and
      (not (at chinatown))
      (at nobhill)
      (not (current ?t))
      (current ?t2)
      (increase (total-cost) 8)
    )
  )

  (:action move-nobhill-chinatown
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (at nobhill)
      (current ?t)
      (after6 ?t ?t2)
      (not (meeting-active))
    )
    :effect (and
      (not (at nobhill))
      (at chinatown)
      (not (current ?t))
      (current ?t2)
      (increase (total-cost) 6)
    )
  )

  (:action wait-one-minute
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (current ?t)
      (next ?t ?t2)
      (not (meeting-active))
    )
    :effect (and
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action meet-joseph-nobhill
    :parameters (?t - time ?t2 - time ?s - segment ?s2 - segment)
    :precondition (and
      (at nobhill)
      (current ?t)
      (next ?t ?t2)
      (withinwindow ?t)
      (todo ?s)
      (nextseg ?s ?s2)
    )
    :effect (and
      (not (current ?t))
      (current ?t2)
      (not (todo ?s))
      (todo ?s2)
      (meeting-active)
    )
  )
)