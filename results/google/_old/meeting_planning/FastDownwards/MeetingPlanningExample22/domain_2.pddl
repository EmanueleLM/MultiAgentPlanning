(define (domain combined-meet)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types agent location time)

  (:constants
    visitor andrew - agent
    presidio union-square - location
    t675 - time
  )

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

  (:action visitor-move-presidio-to-union
    :parameters (?t ?t2 - time)
    :precondition (and (at visitor presidio) (time-at ?t) (plus22 ?t ?t2))
    :effect (and
              (not (at visitor presidio))
              (at visitor union-square)
              (not (time-at ?t))
              (time-at ?t2))
    :cost 0
  )

  (:action visitor-move-union-to-presidio
    :parameters (?t ?t2 - time)
    :precondition (and (at visitor union-square) (time-at ?t) (plus24 ?t ?t2))
    :effect (and
              (not (at visitor union-square))
              (at visitor presidio)
              (not (time-at ?t))
              (time-at ?t2))
    :cost 0
  )

  (:action visitor-wait-until-1115
    :parameters (?t - time)
    :precondition (and (time-at ?t) (before-675 ?t))
    :effect (and
              (not (time-at ?t))
              (time-at t675))
    :cost 0
  )

  (:action andrew-arrive-at-union
    :parameters (?t - time)
    :precondition (and (time-at ?t) (before-675 ?t))
    :effect (and
              (not (time-at ?t))
              (time-at t675)
              (at andrew union-square))
    :cost 0
  )

  (:action visitor-meet-andrew-105
    :parameters (?t ?tend - time)
    :precondition (and
                    (at visitor union-square)
                    (at andrew union-square)
                    (time-at ?t)
                    (plus105 ?t ?tend)
                    (start-allowed ?t)
                  )
    :effect (and
              (met)
              (not (time-at ?t))
              (time-at ?tend))
    :cost 0
  )
)