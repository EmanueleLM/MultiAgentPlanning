(define (domain meetup-multiagent-classical)
  (:requirements :typing :negative-preconditions :action-costs :fluents)
  (:types agent location time)

  (:predicates
    (at ?a - agent ?l - location ?t - time)
    (succ ?t - time ?t2 - time)
    (succ10 ?t - time ?t2 - time)
    (succ60 ?t - time ?t2 - time)
    (jessica-interval-ok ?t - time)
    (met ?v - agent ?j - agent)
  )

  (:functions (total-cost))

  (:action travel-presidio-to-marina
    :parameters (?t - time ?t2 - time)
    :precondition (and (at visitor presidio ?t) (succ10 ?t ?t2))
    :effect (and
              (not (at visitor presidio ?t))
              (at visitor marina-district ?t2)
              (increase (total-cost) 10)
            )
  )

  (:action travel-marina-to-presidio
    :parameters (?t - time ?t2 - time)
    :precondition (and (at visitor marina-district ?t) (succ10 ?t ?t2))
    :effect (and
              (not (at visitor marina-district ?t))
              (at visitor presidio ?t2)
              (increase (total-cost) 10)
            )
  )

  (:action wait-at-location
    :parameters (?loc - location ?t - time ?t2 - time)
    :precondition (and (at visitor ?loc ?t) (succ ?t ?t2))
    :effect (and
              (not (at visitor ?loc ?t))
              (at visitor ?loc ?t2)
              (increase (total-cost) 1)
            )
  )

  (:action meet-at-marina-start
    :parameters (?t - time ?tend - time)
    :precondition (and
                    (at visitor marina-district ?t)
                    (at jessica marina-district ?t)
                    (jessica-interval-ok ?t)
                    (succ60 ?t ?tend)
                  )
    :effect (and
              (not (at visitor marina-district ?t))
              (at visitor marina-district ?tend)
              (met visitor jessica)
            )
  )
)