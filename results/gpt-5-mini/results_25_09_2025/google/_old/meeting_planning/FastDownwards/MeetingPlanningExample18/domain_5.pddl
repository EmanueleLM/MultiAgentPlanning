(define (domain integrated-travelers)
  (:requirements :typing :strips)
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
  )

  (:action traveler_travel-r2m
    :parameters (?p - person)
    :precondition (at ?p richmond)
    :effect (and
              (not (at ?p richmond))
              (at ?p marina)
            )
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
  )

  (:action betty_travel-m2r
    :parameters (?p - person)
    :precondition (at ?p marina)
    :effect (and
              (not (at ?p marina))
              (at ?p richmond)
            )
  )

  (:action betty_travel-r2m
    :parameters (?p - person)
    :precondition (at ?p richmond)
    :effect (and
              (not (at ?p richmond))
              (at ?p marina)
            )
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
  )
)