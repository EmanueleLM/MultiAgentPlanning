(define (domain trip_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types person loc day)

  (:predicates
    (at ?p - person ?l - loc)
    (visited ?l - loc)
    (days ?d - day)
  )

  ;; ---------- Flight actions (only direct flights offered)
  ;; Flights are allowed only to cities not yet visited to prevent extra commuting.
  (:action riga_agent_fly_riga_to_manchester
    :parameters ()
    :precondition (and (at traveller riga) (not (visited manchester)))
    :effect (and (not (at traveller riga)) (at traveller manchester))
  )

  (:action manchester_agent_fly_manchester_to_riga
    :parameters ()
    :precondition (and (at traveller manchester) (not (visited riga)))
    :effect (and (not (at traveller manchester)) (at traveller riga))
  )

  (:action manchester_agent_fly_manchester_to_split
    :parameters ()
    :precondition (and (at traveller manchester) (not (visited split)))
    :effect (and (not (at traveller manchester)) (at traveller split))
  )

  ;; ---------- Stay actions (agent-specific, fixed durations so the global days pool is consumed exactly)
  ;; Riga stay: consumes 7 days (day15 -> day8)
  (:action riga_agent_stay_riga_7_days
    :parameters ()
    :precondition (and (at traveller riga) (not (visited riga)) (days day15))
    :effect (and (visited riga) (not (days day15)) (days day8))
  )

  ;; Manchester stay: consumes 2 days (day8 -> day6)
  (:action manchester_agent_stay_manchester_2_days
    :parameters ()
    :precondition (and (at traveller manchester) (not (visited manchester)) (days day8))
    :effect (and (visited manchester) (not (days day8)) (days day6))
  )

  ;; Split stay: consumes 6 days (day6 -> day0)
  (:action split_agent_stay_split_6_days
    :parameters ()
    :precondition (and (at traveller split) (not (visited split)) (days day6))
    :effect (and (visited split) (not (days day6)) (days day0))
  )
)