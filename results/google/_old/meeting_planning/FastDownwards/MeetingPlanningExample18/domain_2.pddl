(define (domain integrated-travelers)
  (:requirements :typing)
  (:types person location time)

  (:constants
    traveler - person
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

  (:action a1_travel-marina-to-richmond
    :parameters (?p - person)
    :precondition (at ?p marina)
    :effect (and
              (not (at ?p marina))
              (at ?p richmond)
            )
  )

  (:action a1_travel-richmond-to-marina
    :parameters (?p - person)
    :precondition (at ?p richmond)
    :effect (and
              (not (at ?p richmond))
              (at ?p marina)
            )
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
  )

  (:action a1_meet-betty
    :parameters (?p - person ?s - time ?e - time)
    :precondition (and
                    (at ?p richmond)
                    (now ?s)
                    (can_meet ?s ?e)
                  )
    :effect (and
              (met-betty)
              (not (now ?s))
              (now ?e)
            )
  )

  (:action a2_travel-m2r
    :parameters (?p - person)
    :precondition (at ?p marina)
    :effect (and
              (not (at ?p marina))
              (at ?p richmond)
            )
  )

  (:action a2_travel-r2m
    :parameters (?p - person)
    :precondition (at ?p richmond)
    :effect (and
              (not (at ?p richmond))
              (at ?p marina)
            )
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
  )

  (:action a2_meet-with-betty
    :parameters (?p - person ?s - time ?e - time)
    :precondition (and
                    (at ?p richmond)
                    (now ?s)
                    (can_meet ?s ?e)
                  )
    :effect (and
              (met-betty)
              (not (now ?s))
              (now ?e)
            )
  )
)