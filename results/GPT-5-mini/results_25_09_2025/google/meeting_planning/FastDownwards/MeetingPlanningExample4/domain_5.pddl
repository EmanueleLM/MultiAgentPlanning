(define (domain meetup_multiagent_classical)
  (:requirements :typing :negative-preconditions :adl :equality)
  (:types agent location time)

  (:predicates
    (at ?a - agent ?l - location ?t - time)
    (succ ?t - time ?t2 - time)
    (succ10 ?t - time ?t2 - time)
    (succ60 ?t - time ?t2 - time)
    (jessica_interval_ok ?t - time)
    (meeting_slot ?t - time ?tend - time)
    (met ?v - agent ?j - agent)
  )

  (:action travel_presidio_to_marina
    :parameters (?t - time ?t2 - time)
    :precondition (and (at visitor presidio ?t) (succ10 ?t ?t2))
    :effect (and
              (not (at visitor presidio ?t))
              (at visitor marina_district ?t2)
            )
  )

  (:action travel_marina_to_presidio
    :parameters (?t - time ?t2 - time)
    :precondition (and (at visitor marina_district ?t) (succ10 ?t ?t2))
    :effect (and
              (not (at visitor marina_district ?t))
              (at visitor presidio ?t2)
            )
  )

  (:action wait_at_location
    :parameters (?loc - location ?t - time ?t2 - time)
    :precondition (and (at visitor ?loc ?t) (succ ?t ?t2))
    :effect (and
              (not (at visitor ?loc ?t))
              (at visitor ?loc ?t2)
            )
  )

  (:action meet_via_slot
    :parameters (?t - time ?tend - time)
    :precondition (and
                    (at visitor marina_district ?t)
                    (at jessica marina_district ?t)
                    (meeting_slot ?t ?tend)
                    (jessica_interval_ok ?t)
                  )
    :effect (and
              (not (at visitor marina_district ?t))
              (at visitor marina_district ?tend)
              (met visitor jessica)
            )
  )
)