(define (domain trip_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types person loc day)

  (:predicates
    (at ?p - person ?l - loc)
    (visited ?l - loc)
    (days ?d - day)
  )

  ;; ---------- Flight actions (only direct flights proposed by agents)
  ;; Riga planner offers Riga <-> Manchester and Manchester -> Split
  (:action riga_agent_fly_riga_to_manchester
    :parameters ()
    :precondition (and (at traveller riga))
    :effect (and (not (at traveller riga)) (at traveller manchester))
  )

  (:action riga_agent_fly_manchester_to_riga
    :parameters ()
    :precondition (and (at traveller manchester))
    :effect (and (not (at traveller manchester)) (at traveller riga))
  )

  (:action riga_agent_fly_manchester_to_split
    :parameters ()
    :precondition (and (at traveller manchester))
    :effect (and (not (at traveller manchester)) (at traveller split))
  )

  ;; Manchester planner offers Riga -> Manchester and Manchester -> Split
  (:action manchester_agent_fly_riga_to_manchester
    :parameters ()
    :precondition (and (at traveller riga))
    :effect (and (not (at traveller riga)) (at traveller manchester))
  )

  (:action manchester_agent_fly_manchester_to_split
    :parameters ()
    :precondition (and (at traveller manchester))
    :effect (and (not (at traveller manchester)) (at traveller split))
  )

  ;; Split planner offers Manchester -> Split (arrival leg to Split)
  (:action split_agent_fly_manchester_to_split
    :parameters ()
    :precondition (and (at traveller manchester))
    :effect (and (not (at traveller manchester)) (at traveller split))
  )

  ;; ---------- Stay actions (agent-specific). Each stay action is only usable once per city
  ;; and consumes a fixed number of days from the global days-pool.
  ;; To satisfy the global 15-day requirement we provide the concrete transitions needed
  ;; for the intended integrated plan (these are strict constraints: stays must match these
  ;; offered durations when taken).

  ;; Riga planner: offers up to 7 days in Riga. We include the 7-day stay transition from day15->day8
  (:action riga_agent_stay_riga_7_days_from_15_to_8
    :parameters ()
    :precondition (and (at traveller riga) (not (visited riga)) (days day15))
    :effect (and (visited riga) (not (days day15)) (days day8))
  )

  ;; Manchester planner: offers up to 4 days in Manchester. We include a 2-day stay transition
  ;; that is usable when 8 days remain (8->6). This allows allocating fewer than the planner's max,
  ;; but does not exceed the provided maximum.
  (:action manchester_agent_stay_manchester_2_days_from_8_to_6
    :parameters ()
    :precondition (and (at traveller manchester) (not (visited manchester)) (days day8))
    :effect (and (visited manchester) (not (days day8)) (days day6))
  )

  ;; Split planner: offers up to 6 days in Split. We include the 6-day stay transition from day6->day0
  (:action split_agent_stay_split_6_days_from_6_to_0
    :parameters ()
    :precondition (and (at traveller split) (not (visited split)) (days day6))
    :effect (and (visited split) (not (days day6)) (days day0))
  )

  ;; Note:
  ;; - Only direct flights proposed by the agents are modeled as flight actions.
  ;; - Stay actions are agent-specific and constrained to use only the offered durations.
  ;; - Each stay action requires the city not already visited so each city's stay is applied at most once.
)