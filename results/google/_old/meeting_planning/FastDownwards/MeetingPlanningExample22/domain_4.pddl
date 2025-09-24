(define (domain combined-meet)
  (:requirements :strips :typing)
  (:types agent location time)

  (:predicates
    (at ?ag - agent ?l - location)
    (time-at ?t - time)
    (plus22 ?t1 - time ?t2 - time)
    (plus24 ?t1 - time ?t2 - time)
    (plus105 ?t1 - time ?t2 - time)
    (before-675 ?t - time)
    (start-allowed ?t - time)
    (met)
  )

  (:action move-presidio-to-union
    :parameters (?ag - agent ?t ?t2 - time)
    :precondition (and (at ?ag presidio) (time-at ?t) (plus22 ?t ?t2))
    :effect (and
              (not (at ?ag presidio))
              (at ?ag union-square)
              (not (time-at ?t))
              (time-at ?t2))
  )

  (:action move-union-to-presidio
    :parameters (?ag - agent ?t ?t2 - time)
    :precondition (and (at ?ag union-square) (time-at ?t) (plus24 ?t ?t2))
    :effect (and
              (not (at ?ag union-square))
              (at ?ag presidio)
              (not (time-at ?t))
              (time-at ?t2))
  )

  (:action wait-until-1115
    :parameters (?t ?tend - time)
    :precondition (and (time-at ?t) (before-675 ?t))
    :effect (and
              (not (time-at ?t))
              (time-at ?tend))
  )

  (:action arrive-at-union
    :parameters (?ag - agent ?t ?tend - time)
    :precondition (and (time-at ?t) (before-675 ?t) (plus22 ?t ?tend))
    :effect (and
              (not (time-at ?t))
              (time-at ?tend)
              (at ?ag union-square))
  )

  (:action meet-for-105
    :parameters (?v - agent ?a - agent ?t ?tend - time)
    :precondition (and
                    (at ?v union-square)
                    (at ?a union-square)
                    (time-at ?t)
                    (plus105 ?t ?tend)
                    (start-allowed ?t))
    :effect (and
              (met)
              (not (time-at ?t))
              (time-at ?tend))
  )
)