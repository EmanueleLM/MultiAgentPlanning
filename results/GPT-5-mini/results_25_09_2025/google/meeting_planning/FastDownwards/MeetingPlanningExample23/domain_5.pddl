(define (domain meeting-schedule-classical)
  (:requirements :typing :action-costs)
  (:types agent location timepoint)
  (:predicates
    (at ?a - agent ?l - location)
    (at-time ?a - agent ?t - timepoint)
    (john_present ?t - timepoint)
    (time-travel ?tfrom - timepoint ?tto - timepoint)
    (time-advances ?tfrom - timepoint ?tto - timepoint)
    (met)
  )
  (:functions (total-cost))
  (:action travel
    :parameters (?a - agent ?from - location ?to - location ?tfrom - timepoint ?tto - timepoint)
    :precondition (and (at ?a ?from) (at-time ?a ?tfrom) (time-travel ?tfrom ?tto))
    :effect (and (not (at ?a ?from)) (at ?a ?to)
                 (not (at-time ?a ?tfrom)) (at-time ?a ?tto))
    :cost 23
  )
  (:action wait
    :parameters (?a - agent ?tfrom - timepoint ?tto - timepoint)
    :precondition (and (at-time ?a ?tfrom) (time-advances ?tfrom ?tto))
    :effect (and (not (at-time ?a ?tfrom)) (at-time ?a ?tto))
    :cost 0
  )
  (:action meet
    :parameters (?a - agent ?b - agent ?l - location ?t - timepoint)
    :precondition (and (at ?a ?l) (at ?b ?l) (at-time ?a ?t) (john_present ?t))
    :effect (met)
    :cost 75
  )
)