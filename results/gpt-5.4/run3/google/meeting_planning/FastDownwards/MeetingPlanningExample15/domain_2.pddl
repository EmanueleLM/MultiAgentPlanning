(define (domain san_francisco_john_meeting)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    time
  )

  (:constants
    russian_hill golden_gate_park - location
    john - person
    t_9_00_am t_12_39_pm t_1_00_pm t_2_30_pm t_6_15_pm - time
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (next ?t1 - time ?t2 - time)
    (john_at ?p - person ?l - location)
    (john_available ?p - person ?t_start - time ?t_end - time)
    (met_minimum ?p - person)
  )

  (:action wait_to_next
    :parameters (?from_t - time ?to_t - time ?l - location)
    :precondition (and
      (current_time ?from_t)
      (next ?from_t ?to_t)
      (at ?l)
    )
    :effect (and
      (not (current_time ?from_t))
      (current_time ?to_t)
    )
  )

  (:action travel_russian_hill_to_golden_gate_park_21
    :parameters ()
    :precondition (and
      (at russian_hill)
      (current_time t_12_39_pm)
    )
    :effect (and
      (not (at russian_hill))
      (at golden_gate_park)
      (not (current_time t_12_39_pm))
      (current_time t_1_00_pm)
    )
  )

  (:action meet_john_90
    :parameters ()
    :precondition (and
      (at golden_gate_park)
      (john_at john golden_gate_park)
      (current_time t_1_00_pm)
      (john_available john t_1_00_pm t_6_15_pm)
      (not (met_minimum john))
    )
    :effect (and
      (not (current_time t_1_00_pm))
      (current_time t_2_30_pm)
      (met_minimum john)
    )
  )
)