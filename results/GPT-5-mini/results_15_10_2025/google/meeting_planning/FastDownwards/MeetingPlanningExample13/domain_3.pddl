(define (domain meet-betty-domain)
  (:requirements :typing :adl)
  (:types agent location time)
  (:predicates
    (at ?a - agent ?l - location)
    (current-time ?t - time)
    (next ?t1 - time ?t2 - time)
    (plus18 ?t1 - time ?t2 - time)
    (ge-1125 ?t - time)
    (meeting-start-allowed ?t - time)
    (meeting-end ?t1 - time ?t2 - time)
    (available ?a - agent)
    (met ?a - agent ?b - agent)
  )

  (:action wait
    :parameters (?from - time ?to - time)
    :precondition (and (current-time ?from) (next ?from ?to))
    :effect (and (not (current-time ?from)) (current-time ?to))
  )

  (:action travel
    :parameters (?actor - agent ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (current-time ?t1) (plus18 ?t1 ?t2) (at ?actor ?from))
    :effect (and (not (at ?actor ?from)) (at ?actor ?to) (not (current-time ?t1)) (current-time ?t2))
  )

  (:action become-available
    :parameters (?actor - agent ?t - time ?loc - location)
    :precondition (and (current-time ?t) (ge-1125 ?t))
    :effect (and (available ?actor) (at ?actor ?loc))
  )

  (:action meet
    :parameters (?start - time ?end - time ?a - agent ?b - agent ?loc - location)
    :precondition (and (current-time ?start) (meeting-start-allowed ?start) (meeting-end ?start ?end) (at ?a ?loc) (at ?b ?loc) (available ?b))
    :effect (and (not (current-time ?start)) (current-time ?end) (met ?a ?b))
  )
)