(define (domain meeting_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types person loc slot)

  (:predicates
    (agent_at ?l - loc)
    (pref_loc ?p - person ?l - loc)
    (person_available ?p - person ?s - slot)
    (free_slot ?s - slot)
    (next_slot ?s1 - slot ?s2 - slot)
    (current_slot ?s - slot)
    (met ?p - person)
    (connected ?from - loc ?to - loc)
  )

  ;; Travel from one location to another consumes exactly one time-slot.
  (:action travel
    :parameters (?from - loc ?to - loc ?s - slot ?snext - slot)
    :precondition (and
      (agent_at ?from)
      (current_slot ?s)
      (free_slot ?s)
      (next_slot ?s ?snext)
      (connected ?from ?to)
    )
    :effect (and
      (not (agent_at ?from))
      (agent_at ?to)
      (not (free_slot ?s))
      (not (current_slot ?s))
      (current_slot ?snext)
    )
  )

  ;; Consume one time-slot without moving.
  (:action wait_one
    :parameters (?s - slot ?snext - slot)
    :precondition (and
      (current_slot ?s)
      (free_slot ?s)
      (next_slot ?s ?snext)
    )
    :effect (and
      (not (free_slot ?s))
      (not (current_slot ?s))
      (current_slot ?snext)
    )
  )

  ;; Fixed 90-minute meeting encoded as 6 consecutive 15-minute slots.
  ;; This action enforces:
  ;; - Traveler is at the friend's preferred location,
  ;; - There are 6 consecutive free slots,
  ;; - The friend is available for each of these slots,
  ;; - Friend has not already been met.
  (:action meet_jessica_90
    :parameters (?p - person ?loc - loc
                 ?s - slot ?s1 - slot ?s2 - slot ?s3 - slot ?s4 - slot ?s5 - slot ?snext - slot)
    :precondition (and
      (pref_loc ?p ?loc)
      (agent_at ?loc)
      (current_slot ?s)
      (free_slot ?s) (free_slot ?s1) (free_slot ?s2) (free_slot ?s3) (free_slot ?s4) (free_slot ?s5)
      (person_available ?p ?s) (person_available ?p ?s1) (person_available ?p ?s2)
      (person_available ?p ?s3) (person_available ?p ?s4) (person_available ?p ?s5)
      (next_slot ?s ?s1) (next_slot ?s1 ?s2) (next_slot ?s2 ?s3)
      (next_slot ?s3 ?s4) (next_slot ?s4 ?s5) (next_slot ?s5 ?snext)
      (not (met ?p))
    )
    :effect (and
      (not (free_slot ?s)) (not (free_slot ?s1)) (not (free_slot ?s2))
      (not (free_slot ?s3)) (not (free_slot ?s4)) (not (free_slot ?s5))
      (met ?p)
      (not (current_slot ?s))
      (current_slot ?snext)
    )
  )
)