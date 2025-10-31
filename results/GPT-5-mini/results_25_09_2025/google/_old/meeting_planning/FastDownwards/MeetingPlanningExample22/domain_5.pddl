(define (domain combined-meet)
  (:requirements :strips :typing)
  (:types agent location time)

  (:predicates
    (at ?ag - agent ?l - location)
    (time-at ?t - time)
    (plus22 ?t1 - time ?t2 - time)
    (plus24 ?t1 - time ?t2 - time)
    (plus105 ?t1 - time ?t2 - time)
    (before_675 ?t - time)
    (start_allowed ?t - time)
    (met)
  )

  (:action move_presidio_to_union
    :parameters (?ag - agent ?t - time ?t2 - time)
    :precondition (and (at ?ag presidio) (time-at ?t) (plus22 ?t ?t2))
    :effect (and
              (not (at ?ag presidio))
              (at ?ag union_square)
              (not (time-at ?t))
              (time-at ?t2))
  )

  (:action move_union_to_presidio
    :parameters (?ag - agent ?t - time ?t2 - time)
    :precondition (and (at ?ag union_square) (time-at ?t) (plus24 ?t ?t2))
    :effect (and
              (not (at ?ag union_square))
              (at ?ag presidio)
              (not (time-at ?t))
              (time-at ?t2))
  )

  (:action wait_until_1115
    :parameters (?t - time ?tend - time)
    :precondition (and (time-at ?t) (before_675 ?t))
    :effect (and
              (not (time-at ?t))
              (time-at ?tend))
  )

  (:action arrive_at_union
    :parameters (?ag - agent ?t - time ?tend - time)
    :precondition (and (time-at ?t) (before_675 ?t) (plus22 ?t ?tend))
    :effect (and
              (not (time-at ?t))
              (time-at ?tend)
              (at ?ag union_square))
  )

  (:action meet_for_105
    :parameters (?v - agent ?a - agent ?t - time ?tend - time)
    :precondition (and
                    (at ?v union_square)
                    (at ?a union_square)
                    (time-at ?t)
                    (plus105 ?t ?tend)
                    (start_allowed ?t))
    :effect (and
              (met)
              (not (time-at ?t))
              (time-at ?tend))
  )
)