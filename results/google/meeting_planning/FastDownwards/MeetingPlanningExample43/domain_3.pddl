(define (domain meeting-domain)
  (:requirements :strips :typing :negative-preconditions :equality :fluents)
  (:types agent location time)
  (:predicates
    (at-traveler ?l - location)
    (at-sandra ?l - location)
    (met-sandra)
    (in-meeting)
    (current ?t - time)
    (next ?t1 ?t2 - time)
    (plus15 ?t1 ?t2 - time)
    (plus16 ?t1 ?t2 - time)
    (plus12 ?t1 ?t2 - time)
  )
  (:functions (total-cost))

  (:action travel-traveler-marina-chinatown
    :parameters (?t - time ?t2 - time)
    :precondition (and (at-traveler marina) (current ?t) (plus16 ?t ?t2) (not (in-meeting)))
    :effect (and
      (not (at-traveler marina))
      (at-traveler chinatown)
      (not (current ?t))
      (current ?t2)
      (increase (total-cost) 0)
    )
  )

  (:action travel-traveler-chinatown-marina
    :parameters (?t - time ?t2 - time)
    :precondition (and (at-traveler chinatown) (current ?t) (plus12 ?t ?t2) (not (in-meeting)))
    :effect (and
      (not (at-traveler chinatown))
      (at-traveler marina)
      (not (current ?t))
      (current ?t2)
      (increase (total-cost) 0)
    )
  )

  (:action start-meeting-15
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (at-traveler chinatown)
      (at-sandra chinatown)
      (current ?t)
      (plus15 ?t ?t2)
      (not (in-meeting))
    )
    :effect (and
      (in-meeting)
      (met-sandra)
      (not (current ?t))
      (current ?t2)
      (increase (total-cost) -16)
    )
  )

  (:action continue-meeting-1min
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (in-meeting)
      (at-traveler chinatown)
      (at-sandra chinatown)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (current ?t))
      (current ?t2)
      (increase (total-cost) -1)
    )
  )

  (:action end-meeting
    :parameters ()
    :precondition (in-meeting)
    :effect (and
      (not (in-meeting))
      (increase (total-cost) 0)
    )
  )
)