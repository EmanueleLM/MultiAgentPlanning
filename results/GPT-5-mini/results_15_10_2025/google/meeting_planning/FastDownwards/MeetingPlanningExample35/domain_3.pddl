(define (domain multi-agent-scheduling)
  (:requirements :adl :typing)
  (:types location minute)
  (:constants bayview chinatown - location)
  (:predicates
    (current ?t - minute)
    (traveler-at ?l - location)
    (met-jason)
    (next18 ?t1 ?t2 - minute)
    (next22 ?t1 ?t2 - minute)
    (next90 ?t1 ?t2 - minute)
    (available-start ?t - minute)
  )

  (:action travel-traveler-bayview-to-chinatown
    :parameters (?t1 ?t2 - minute)
    :precondition (and (current ?t1) (traveler-at bayview) (next18 ?t1 ?t2))
    :effect (and
              (not (current ?t1))
              (current ?t2)
              (not (traveler-at bayview))
              (traveler-at chinatown)
            )
  )

  (:action travel-traveler-chinatown-to-bayview
    :parameters (?t1 ?t2 - minute)
    :precondition (and (current ?t1) (traveler-at chinatown) (next22 ?t1 ?t2))
    :effect (and
              (not (current ?t1))
              (current ?t2)
              (not (traveler-at chinatown))
              (traveler-at bayview)
            )
  )

  (:action meet-traveler-jason
    :parameters (?t1 ?t2 - minute)
    :precondition (and (current ?t1) (traveler-at chinatown) (next90 ?t1 ?t2) (available-start ?t1))
    :effect (and
              (not (current ?t1))
              (current ?t2)
              (met-jason)
            )
  )
)