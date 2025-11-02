(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :fluents :equality)
  (:types person slot)
  (:predicates
    (person ?p)
    (slot ?s)
    (unavailable ?p ?s)
    (scheduled)
    (scheduled-at ?s)
  )
  (:functions
    (index ?s)   ; numeric index for each slot (1..16)
    (chosen)     ; numeric value of chosen slot index (for minimization)
  )
  (:action schedule
    :parameters (?s - slot ?p1 - person ?p2 - person ?p3 - person ?p4 - person)
    :precondition (and
      (not (scheduled))
      ;; bind the four parameters to the known meeting participants
      (= ?p1 Marie) (= ?p2 Janice) (= ?p3 Elijah) (= ?p4 Theresa)
      ;; each participant must NOT be unavailable in the chosen slot
      (not (unavailable ?p1 ?s))
      (not (unavailable ?p2 ?s))
      (not (unavailable ?p3 ?s))
      (not (unavailable ?p4 ?s))
    )
    :effect (and
      (scheduled)
      (scheduled-at ?s)
      (assign (chosen) (index ?s))
    )
  )
)