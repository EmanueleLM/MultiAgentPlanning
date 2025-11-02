(define (domain integrated-travelers)
  (:requirements :typing :adl :action-costs)
  (:types person location time)

  (:constants
    traveler betty - person
    marina richmond - location
    t540 t1230 t1305 t1320 - time
  )

  (:predicates
    (at ?p - person ?l - location)
    (met-betty)
    (now ?t - time)
    (leq ?t1 - time ?t2 - time)
    (can_meet ?s - time ?e - time)
  )

  (:action traveler_travel-m2r
    :parameters (?p - person)
    :precondition (at ?p marina)
    :effect (and
              (not (at ?p marina))
              (at ?p richmond)
            )
    :cost 11
  )

  (:action traveler_travel-r2m
    :parameters (?p - person)
    :precondition (at ?p richmond)
    :effect (and
              (not (at ?p richmond))
              (at ?p marina)
            )
    :cost 9
  )

  (:action traveler_wait-until-betty-start
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

  (:action traveler_meet-betty
    :parameters (?s - time ?e - time)
    :precondition (and
                    (at traveler richmond)
                    (at betty richmond)
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

  (:action betty_travel-m2r
    :parameters (?p - person)
    :precondition (at ?p marina)
    :effect (and
              (not (at ?p marina))
              (at ?p richmond)
            )
    :cost 11
  )

  (:action betty_travel-r2m
    :parameters (?p - person)
    :precondition (at ?p richmond)
    :effect (and
              (not (at ?p richmond))
              (at ?p marina)
            )
    :cost 9
  )

  (:action betty_wait-until-betty-start
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

  (:action betty_meet-with-traveler
    :parameters (?s - time ?e - time)
    :precondition (and
                    (at traveler richmond)
                    (at betty richmond)
                    (now ?s)
                    (can_meet ?s ?e)
                  )
    :effect (and
              (not (now ?s))
              (now ?e)
            )
    :cost 0
  )
)