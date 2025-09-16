(define (domain travel_meet_coordinated)
  (:requirements :typing)
  (:types person location timepoint)

  (:constants bayview golden_gate_park - location
              t0 t1 t2 - timepoint)

  (:predicates
    (at ?p - person ?l - location ?t - timepoint)
    (met ?p1 - person ?p2 - person)
  )

  ; Travel actions for traveler
  (:action travel_traveler_BV_to_GGP_t0_t1
     :parameters (?p - person)
     :precondition (at ?p bayview t0)
     :effect (and (not (at ?p bayview t0))
                  (at ?p golden_gate_park t1))
  )

  (:action travel_traveler_GGP_to_BV_t1_t2
     :parameters (?p - person)
     :precondition (at ?p golden_gate_park t1)
     :effect (and (not (at ?p golden_gate_park t1))
                  (at ?p bayview t2))
  )

  ; Travel actions for Barbara
  (:action travel_barbara_BV_to_GGP_t0_t1
     :parameters (?p - person)
     :precondition (at ?p bayview t0)
     :effect (and (not (at ?p bayview t0))
                  (at ?p golden_gate_park t1))
  )

  (:action travel_barbara_GGP_to_BV_t1_t2
     :parameters (?p - person)
     :precondition (at ?p golden_gate_park t1)
     :effect (and (not (at ?p golden_gate_park t1))
                  (at ?p bayview t2))
  )

  ; Meeting action
  (:action meet_at_GGP_t2
     :parameters (?p1 - person ?p2 - person)
     :precondition (and (at ?p1 golden_gate_park t2)
                        (at ?p2 golden_gate_park t2))
     :effect (met ?p1 ?p2)
  )
)