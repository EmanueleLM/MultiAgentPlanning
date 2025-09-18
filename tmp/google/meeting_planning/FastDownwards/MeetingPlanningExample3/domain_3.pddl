(define (domain travel-meeting-coordinated)
  (:requirements :typing :strips :negative-preconditions :fluents :action-costs)
  (:types person location time)

  (:predicates
    (at ?p - person ?l - location ?t - time)
    (travel-arrives ?from - location ?to - location ?ts - time ?te - time)
    (meet-allowed ?ts - time ?te - time)
    (met ?a - person ?b - person)
  )

  (:functions (total-cost))

  (:action travel-bayview-to-ggp
    :parameters (?person - person ?ts - time ?te - time)
    :precondition (and
      (at ?person bayview ?ts)
      (travel-arrives bayview golden-gate-park ?ts ?te)
    )
    :effect (and
      (not (at ?person bayview ?ts))
      (at ?person golden-gate-park ?te)
      (increase (total-cost) 22)
    )
  )

  (:action travel-ggp-to-bayview
    :parameters (?person - person ?ts - time ?te - time)
    :precondition (and
      (at ?person golden-gate-park ?ts)
      (travel-arrives golden-gate-park bayview ?ts ?te)
    )
    :effect (and
      (not (at ?person golden-gate-park ?ts))
      (at ?person bayview ?te)
      (increase (total-cost) 23)
    )
  )

  (:action meet
    :parameters (?trav - person ?with - person ?ts - time ?te - time)
    :precondition (and
      (at ?trav golden-gate-park ?ts)
      (at ?with golden-gate-park ?ts)
      (meet-allowed ?ts ?te)
      (not (met ?trav ?with))
    )
    :effect (and
      (met ?trav ?with)
      (met ?with ?trav)
    )
  )
)