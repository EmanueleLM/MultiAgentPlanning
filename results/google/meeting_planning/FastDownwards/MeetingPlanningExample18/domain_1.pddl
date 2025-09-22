(define (domain integrated-travelers)
  (:requirements :strips :typing :adl :action-costs)
  (:types person location time)

  (:predicates
    (at ?p - person ?l - location)
    (met-betty)
    (now ?t - time)
    (leq ?t1 - time ?t2 - time)       ; precomputed <= relation between time points
    (can_meet ?s - time ?e - time)   ; precomputed allowed meeting start->end pairs
  )

  ;; Agent1 actions (prefix a1_)
  (:action a1_travel-marina-to-richmond
    :parameters ()
    :precondition (at traveler marina)
    :effect (and
              (not (at traveler marina))
              (at traveler richmond)
            )
    :cost 1
  )

  (:action a1_travel-richmond-to-marina
    :parameters ()
    :precondition (at traveler richmond)
    :effect (and
              (not (at traveler richmond))
              (at traveler marina)
            )
    :cost 1
  )

  (:action a1_wait-until-betty-start
    :parameters (?t - time)
    :precondition (and
                    (now ?t)
                    (leq ?t t1230)
                  )
    :effect (and
              (not (now ?t))
              (now t1230)
            )
    :cost 0
  )

  (:action a1_meet-betty
    :parameters (?s - time ?e - time)
    :precondition (and
                    (at traveler richmond)
                    (now ?s)
                    (can_meet ?s ?e)
                  )
    :effect (and
              (met-betty)
              (not (now ?s))
              (now ?e)
            )
    :cost 0
  )

  ;; Agent2 actions (prefix a2_)
  (:action a2_travel-m2r
    :parameters ()
    :precondition (at traveler marina)
    :effect (and
              (not (at traveler marina))
              (at traveler richmond)
            )
    :cost 1
  )

  (:action a2_travel-r2m
    :parameters ()
    :precondition (at traveler richmond)
    :effect (and
              (not (at traveler richmond))
              (at traveler marina)
            )
    :cost 1
  )

  (:action a2_wait-until-betty-start
    :parameters (?t - time)
    :precondition (and
                    (now ?t)
                    (leq ?t t1230)
                  )
    :effect (and
              (not (now ?t))
              (now t1230)
            )
    :cost 0
  )

  (:action a2_meet-with-betty
    :parameters (?s - time ?e - time)
    :precondition (and
                    (at traveler richmond)
                    (now ?s)
                    (can_meet ?s ?e)
                  )
    :effect (and
              (met-betty)
              (not (now ?s))
              (now ?e)
            )
    :cost 0
  )
)