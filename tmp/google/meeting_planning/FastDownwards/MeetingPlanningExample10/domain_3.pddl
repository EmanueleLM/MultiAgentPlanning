(define (domain meet-james-combined-fd)
  (:requirements :typing :negative-preconditions :action-costs :adl)
  (:types person location timepoint)

  (:predicates
    (at ?p - person ?l - location ?t - timepoint)
    (met ?p1 - person ?p2 - person)
    (travel16 ?ts - timepoint ?te - timepoint)
    (travel18 ?ts - timepoint ?te - timepoint)
    (later ?ts - timepoint ?te - timepoint)
    (meeting15 ?ts - timepoint ?te - timepoint)
    (avail-interval ?p - person ?l - location ?ts - timepoint ?te - timepoint)
    (reserved ?p - person ?l - location ?ts - timepoint ?te - timepoint)
  )

  (:functions (total-cost))

  (:action agent1_travel
    :parameters (?p - person ?from - location ?to - location ?ts - timepoint ?te - timepoint)
    :precondition (and (at ?p ?from ?ts) (travel16 ?ts ?te))
    :effect (and
      (not (at ?p ?from ?ts))
      (at ?p ?to ?te)
      (increase (total-cost) 16)
    )
  )

  (:action agent1_wait
    :parameters (?p - person ?loc - location ?ts - timepoint ?te - timepoint)
    :precondition (and (at ?p ?loc ?ts) (later ?ts ?te))
    :effect (and
      (not (at ?p ?loc ?ts))
      (at ?p ?loc ?te)
      ; waiting has zero additional cost
    )
  )

  (:action agent1_meet
    :parameters (?a - person ?b - person ?loc - location ?ts - timepoint ?te - timepoint)
    :precondition (and
      (at ?a ?loc ?ts)
      (at ?b ?loc ?ts)
      (meeting15 ?ts ?te)
      (avail-interval ?b ?loc ?ts ?te)
    )
    :effect (and
      (met ?a ?b)
      (met ?b ?a)
    )
  )

  (:action agent2_travel_ggp_to_marina
    :parameters (?p - person ?from - location ?to - location ?ts - timepoint ?te - timepoint)
    :precondition (and (at ?p ?from ?ts) (travel16 ?ts ?te))
    :effect (and
      (not (at ?p ?from ?ts))
      (at ?p ?to ?te)
      (increase (total-cost) 16)
    )
  )

  (:action agent2_travel_marina_to_ggp
    :parameters (?p - person ?from - location ?to - location ?ts - timepoint ?te - timepoint)
    :precondition (and (at ?p ?from ?ts) (travel18 ?ts ?te))
    :effect (and
      (not (at ?p ?from ?ts))
      (at ?p ?to ?te)
      (increase (total-cost) 18)
    )
  )

  (:action agent2_wait
    :parameters (?p - person ?loc - location ?ts - timepoint ?te - timepoint)
    :precondition (and (at ?p ?loc ?ts) (later ?ts ?te))
    :effect (and
      (not (at ?p ?loc ?ts))
      (at ?p ?loc ?te)
    )
  )

  (:action agent2_reserve_15_min_availability
    :parameters (?p - person ?l - location ?ts - timepoint ?te - timepoint)
    :precondition (and
      (at ?p ?l ?ts)
      (meeting15 ?ts ?te)
      (avail-interval ?p ?l ?ts ?te)
    )
    :effect (and
      (reserved ?p ?l ?ts ?te)
    )
  )
)