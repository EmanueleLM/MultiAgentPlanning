(define (domain meeting_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types person loc slot)

  (:predicates
    (agent-at ?l - loc)
    (pref-loc ?p - person ?l - loc)
    (person-available ?p - person ?s - slot)
    (free ?s - slot)
    (next ?s1 - slot ?s2 - slot)
    (current-slot ?s - slot)
    (met ?p - person)
    (done-person ?p - person)
  )

  ;; travel consumes one slot and moves the agent between locations
  (:action travel
    :parameters (?from - loc ?to - loc ?s - slot ?snext - slot)
    :precondition (and
      (agent-at ?from)
      (current-slot ?s)
      (free ?s)
      (next ?s ?snext)
    )
    :effect (and
      (not (agent-at ?from))
      (agent-at ?to)
      (not (free ?s))
      (not (current-slot ?s))
      (current-slot ?snext)
    )
  )

  ;; wait consumes one slot (idle) to advance time without meeting or moving
  (:action wait-one
    :parameters (?s - slot ?snext - slot)
    :precondition (and
      (current-slot ?s)
      (free ?s)
      (next ?s ?snext)
    )
    :effect (and
      (not (free ?s))
      (not (current-slot ?s))
      (current-slot ?snext)
    )
  )

  ;; A 6-slot meeting action to guarantee at-least-90-minute contiguous meeting for Jessica.
  ;; This is the only action that can set (met jessica), ensuring the minimum contiguous duration constraint.
  (:action meet-jessica-6
    :parameters (?p - person ?loc - loc
                 ?s - slot ?s1 - slot ?s2 - slot ?s3 - slot ?s4 - slot ?s5 - slot ?snext - slot)
    :precondition (and
      (pref-loc ?p ?loc)
      (agent-at ?loc)
      (current-slot ?s)
      (free ?s) (free ?s1) (free ?s2) (free ?s3) (free ?s4) (free ?s5)
      (person-available ?p ?s) (person-available ?p ?s1) (person-available ?p ?s2)
      (person-available ?p ?s3) (person-available ?p ?s4) (person-available ?p ?s5)
      (next ?s ?s1) (next ?s1 ?s2) (next ?s2 ?s3) (next ?s3 ?s4) (next ?s4 ?s5) (next ?s5 ?snext)
      (not (met ?p))
    )
    :effect (and
      (not (free ?s)) (not (free ?s1)) (not (free ?s2))
      (not (free ?s3)) (not (free ?s4)) (not (free ?s5))
      (met ?p)
      (done-person ?p)
      (not (current-slot ?s))
      (current-slot ?snext)
    )
  )
)