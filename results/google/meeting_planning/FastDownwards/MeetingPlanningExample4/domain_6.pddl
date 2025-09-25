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
    (connected ?from - location ?to - location)
  )

  (:action travel
    :parameters (?a - agent ?from - location ?to - location ?t - time ?t2 - time)
    :precondition (and (at ?a ?from ?t) (connected ?from ?to) (succ10 ?t ?t2))
    :effect (and
              (not (at ?a ?from ?t))
              (at ?a ?to ?t2)
            )
  )

  (:action wait_at_location
    :parameters (?a - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (at ?a ?loc ?t) (succ ?t ?t2))
    :effect (and
              (not (at ?a ?loc ?t))
              (at ?a ?loc ?t2)
            )
  )

  (:action meet_via_slot
    :parameters (?a - agent ?j - agent ?l - location ?t - time ?tend - time)
    :precondition (and
                    (at ?a ?l ?t)
                    (at ?j ?l ?t)
                    (meeting_slot ?t ?tend)
                    (jessica_interval_ok ?t)
                  )
    :effect (and
              (not (at ?a ?l ?t))
              (at ?a ?l ?tend)
              (met ?a ?j)
            )
  )
)