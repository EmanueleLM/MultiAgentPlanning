(define (domain meet-james-combined-symbolic)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types person location timepoint)

  (:predicates
    (at ?p - person ?l - location ?t - timepoint)
    (met ?p1 - person ?p2 - person)
    (travel16 ?ts - timepoint ?te - timepoint)
    (travel18 ?ts - timepoint ?te - timepoint)
    (later ?ts - timepoint ?te - timepoint)
    (meeting15 ?ts - timepoint ?te - timepoint)
    (avail-interval ?p - person ?l - location ?ts - timepoint ?te - timepoint)
  )

  ;; Agent 1 travel using precomputed 16-minute relation
  (:action agent1_travel
    :parameters (?p - person ?from - location ?to - location ?ts - timepoint ?te - timepoint)
    :precondition (and (at ?p ?from ?ts) (travel16 ?ts ?te))
    :effect (and
      (not (at ?p ?from ?ts))
      (at ?p ?to ?te)
    )
    :cost 16
  )

  ;; Agent 1 wait for arbitrary later time (precomputed)
  (:action agent1_wait
    :parameters (?p - person ?loc - location ?ts - timepoint ?te - timepoint)
    :precondition (and (at ?p ?loc ?ts) (later ?ts ?te))
    :effect (and
      (not (at ?p ?loc ?ts))
      (at ?p ?loc ?te)
    )
    :cost 0
  )

  ;; Agent 1 meeting action: symbolic 15-minute meeting (requires availability interval for the partner)
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
    :cost 0
  )

  ;; ---------------------------
  ;; Agent 2 travel actions (kept distinct)
  ;; ---------------------------

  (:action agent2_travel_ggp_to_marina
    :parameters (?p - person ?from - location ?to - location ?ts - timepoint ?te - timepoint)
    :precondition (and (at ?p ?from ?ts) (travel16 ?ts ?te))
    :effect (and
      (not (at ?p ?from ?ts))
      (at ?p ?to ?te)
    )
    :cost 16
  )

  (:action agent2_travel_marina_to_ggp
    :parameters (?p - person ?from - location ?to - location ?ts - timepoint ?te - timepoint)
    :precondition (and (at ?p ?from ?ts) (travel18 ?ts ?te))
    :effect (and
      (not (at ?p ?from ?ts))
      (at ?p ?to ?te)
    )
    :cost 18
  )

  (:action agent2_wait
    :parameters (?p - person ?loc - location ?ts - timepoint ?te - timepoint)
    :precondition (and (at ?p ?loc ?ts) (later ?ts ?te))
    :effect (and
      (not (at ?p ?loc ?ts))
      (at ?p ?loc ?te)
    )
    :cost 0
  )

  (:action agent2_reserve_15_min_availability
    :parameters (?p - person ?l - location ?ts - timepoint ?te - timepoint)
    :precondition (and
      (at ?p ?l ?ts)
      (meeting15 ?ts ?te)
      (avail-interval ?p ?l ?ts ?te)
    )
    :effect (and
      ;; Marking availability for meeting is represented by having a matching avail-interval fact (precomputed).
      ;; This action is a no-op effect-wise for meeting modeling but kept distinct for agent role separation.
    )
    :cost 0
  )

)