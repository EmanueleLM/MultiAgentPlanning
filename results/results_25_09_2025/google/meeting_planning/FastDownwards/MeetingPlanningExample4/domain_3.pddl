(define (domain meetup-multiagent-classical)
  (:requirements :typing :negative-preconditions :adl :action-costs :equality)
  (:types agent location time)

  (:predicates
    (at ?a - agent ?l - location ?t - time)
    (succ ?t - time ?t2 - time)
    (succ10 ?t - time ?t2 - time)
    (succ60 ?t - time ?t2 - time)
    (jessica-interval-ok ?t - time)
    (meeting-slot ?t - time ?tend - time)
    (met ?v - agent ?j - agent)
  )

  (:action travel-presidio-to-marina
    :parameters (?t - time ?t2 - time)
    :precondition (and (at visitor presidio ?t) (succ10 ?t ?t2))
    :effect (and
              (not (at visitor presidio ?t))
              (at visitor marina-district ?t2)
            )
    :cost 10
  )

  (:action travel-marina-to-presidio
    :parameters (?t - time ?t2 - time)
    :precondition (and (at visitor marina-district ?t) (succ10 ?t ?t2))
    :effect (and
              (not (at visitor marina-district ?t))
              (at visitor presidio ?t2)
            )
    :cost 10
  )

  (:action wait-at-location
    :parameters (?loc - location ?t - time ?t2 - time)
    :precondition (and (at visitor ?loc ?t) (succ ?t ?t2))
    :effect (and
              (not (at visitor ?loc ?t))
              (at visitor ?loc ?t2)
            )
    :cost 1
  )

  (:action meet-via-slot
    :parameters (?t - time ?tend - time)
    :precondition (and
                    (at visitor marina-district ?t)
                    (at jessica marina-district ?t)
                    (meeting-slot ?t ?tend)
                    (jessica-interval-ok ?t)
                  )
    :effect (and
              (not (at visitor marina-district ?t))
              (at visitor marina-district ?tend)
              (met visitor jessica)
            )
    :cost 0
  )
)