(define (domain joint-meeting-fd)
  (:requirements :typing :adl :negative-preconditions :action-costs)
  (:types agent location time)

  (:predicates
    (at ?a - agent ?l - location)
    (current-time ?t - time)
    (can-step-8 ?t1 - time ?t2 - time)
    (can-step-6 ?t1 - time ?t2 - time)
    (can-meet ?t1 - time ?t2 - time)
    (met-joseph)
  )

  (:action you-travel-chinatown-nobhill
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (at you Chinatown) (current-time ?t1) (can-step-8 ?t1 ?t2))
    :effect (and
              (not (at you Chinatown))
              (at you Nob_Hill)
              (not (current-time ?t1))
              (current-time ?t2))
    :cost 8
  )

  (:action you-travel-nobhill-chinatown
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (at you Nob_Hill) (current-time ?t1) (can-step-6 ?t1 ?t2))
    :effect (and
              (not (at you Nob_Hill))
              (at you Chinatown)
              (not (current-time ?t1))
              (current-time ?t2))
    :cost 6
  )

  (:action meet-you-joseph
    :parameters (?loc - location ?t1 - time ?t2 - time)
    :precondition (and
                    (at you ?loc)
                    (at joseph ?loc)
                    (current-time ?t1)
                    (can-meet ?t1 ?t2)
                  )
    :effect (and
              (met-joseph)
              (not (current-time ?t1))
              (current-time ?t2))
    :cost 75
  )
)