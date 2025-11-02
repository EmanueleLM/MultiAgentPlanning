(define (domain integrated-meeting-domain)
  (:requirements :typing :negative-preconditions :equality :action-costs :fluents)
  (:types agent location time)
  (:predicates
    (at ?a - agent ?l - location)
    (current-time ?t - time)
    (succ11 ?t1 - time ?t2 - time)
    (succ120 ?t1 - time ?t2 - time)
    (will-be-at-marina-window)
    (met-visitor)
    (met-mary)
  )
  (:functions (total-cost))

  (:action visitor-travel-nob-to-mari-540-551
    :parameters ()
    :precondition (and
      (at visitor nob_hill)
      (current-time t540)
      (succ11 t540 t551)
    )
    :effect (and
      (not (at visitor nob_hill))
      (at visitor marina_district)
      (not (current-time t540))
      (current-time t551)
      (increase (total-cost) 11)
    )
  )

  (:action visitor-wait-551-to-1200
    :parameters ()
    :precondition (and
      (current-time t551)
    )
    :effect (and
      (not (current-time t551))
      (current-time t1200)
      (increase (total-cost) 649)
    )
  )

  (:action mary-travel-nob-to-mari-540-551
    :parameters ()
    :precondition (and
      (at mary nob_hill)
      (current-time t540)
      (succ11 t540 t551)
    )
    :effect (and
      (not (at mary nob_hill))
      (at mary marina_district)
      (not (current-time t540))
      (current-time t551)
      (increase (total-cost) 11)
    )
  )

  (:action mary-wait-551-to-1200
    :parameters ()
    :precondition (and
      (current-time t551)
    )
    :effect (and
      (not (current-time t551))
      (current-time t1200)
      (increase (total-cost) 649)
    )
  )

  (:action meet-both-at-1200
    :parameters ()
    :precondition (and
      (current-time t1200)
      (at visitor marina_district)
      (at mary marina_district)
      (will-be-at-marina-window)
      (succ120 t1200 t1320)
    )
    :effect (and
      (met-mary)
      (met-visitor)
      (not (current-time t1200))
      (current-time t1320)
      (increase (total-cost) 120)
    )
  )
)