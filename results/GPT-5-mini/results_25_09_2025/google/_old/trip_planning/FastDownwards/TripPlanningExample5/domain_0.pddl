(define (domain unified-trip-planning)
  (:requirements :typing :fluents :negative-preconditions)
  (:types city day person)

  ;; Predicates
  (:predicates
    ;; Agent1 view: which city each day is assigned to
    (at-day ?d - day ?c - city)
    (unassigned ?d - day)
    (next ?d1 - day ?d2 - day)

    ;; Agent2 view: where a person is on a given day
    (at-person ?p - person ?c - city ?d - day)

    ;; Flight network connectivity (agent2)
    (direct ?c1 - city ?c2 - city)
  )

  ;; Numeric counters for days spent in each city (agent1)
  (:functions
    (oslo-count)
    (porto-count)
    (dubrovnik-count)
  )

  ;; -------------------------
  ;; Agent1 actions (day-centric assignment & flights)
  ;; -------------------------

  ;; Assign day1 to a city (start of itinerary - agent1)
  (:action assign-day1-oslo
    :parameters ()
    :precondition (and (unassigned day1))
    :effect (and
              (not (unassigned day1))
              (at-day day1 oslo)
              (increase (oslo-count) 1)
            )
  )

  (:action assign-day1-porto
    :parameters ()
    :precondition (and (unassigned day1))
    :effect (and
              (not (unassigned day1))
              (at-day day1 porto)
              (increase (porto-count) 1)
            )
  )

  (:action assign-day1-dubrovnik
    :parameters ()
    :precondition (and (unassigned day1))
    :effect (and
              (not (unassigned day1))
              (at-day day1 dubrovnik)
              (increase (dubrovnik-count) 1)
            )
  )

  ;; Staying in the same city from day d to the next day (agent1)
  (:action stay-oslo
    :parameters (?d - day ?next - day)
    :precondition (and (next ?d ?next) (at-day ?d oslo) (unassigned ?next))
    :effect (and
              (not (unassigned ?next))
              (at-day ?next oslo)
              (increase (oslo-count) 1)
            )
  )

  (:action stay-porto
    :parameters (?d - day ?next - day)
    :precondition (and (next ?d ?next) (at-day ?d porto) (unassigned ?next))
    :effect (and
              (not (unassigned ?next))
              (at-day ?next porto)
              (increase (porto-count) 1)
            )
  )

  (:action stay-dubrovnik
    :parameters (?d - day ?next - day)
    :precondition (and (next ?d ?next) (at-day ?d dubrovnik) (unassigned ?next))
    :effect (and
              (not (unassigned ?next))
              (at-day ?next dubrovnik)
              (increase (dubrovnik-count) 1)
            )
  )

  ;; Flights between directly connected cities (agent1 view: assign next day to destination)
  ;; Oslo -> Dubrovnik
  (:action flight-oslo-dubrovnik
    :parameters (?d - day ?next - day)
    :precondition (and (next ?d ?next) (at-day ?d oslo) (unassigned ?next))
    :effect (and
              (not (unassigned ?next))
              (at-day ?next dubrovnik)
              (increase (dubrovnik-count) 1)
            )
  )

  ;; Dubrovnik -> Oslo
  (:action flight-dubrovnik-oslo
    :parameters (?d - day ?next - day)
    :precondition (and (next ?d ?next) (at-day ?d dubrovnik) (unassigned ?next))
    :effect (and
              (not (unassigned ?next))
              (at-day ?next oslo)
              (increase (oslo-count) 1)
            )
  )

  ;; Porto -> Oslo
  (:action flight-porto-oslo
    :parameters (?d - day ?next - day)
    :precondition (and (next ?d ?next) (at-day ?d porto) (unassigned ?next))
    :effect (and
              (not (unassigned ?next))
              (at-day ?next oslo)
              (increase (oslo-count) 1)
            )
  )

  ;; Oslo -> Porto
  (:action flight-oslo-porto
    :parameters (?d - day ?next - day)
    :precondition (and (next ?d ?next) (at-day ?d oslo) (unassigned ?next))
    :effect (and
              (not (unassigned ?next))
              (at-day ?next porto)
              (increase (porto-count) 1)
            )
  )

  ;; -------------------------
  ;; Agent2 actions (person-centric movement). Kept distinct (names include '-agent2').
  ;; -------------------------

  ;; Initialize traveler on day1 in a city (agent2 initialization actions)
  (:action init-traveler-oslo
    :parameters (?p - person)
    :precondition (and (unassigned day1))
    :effect (and
              (at-person ?p oslo day1)
            )
  )

  (:action init-traveler-porto
    :parameters (?p - person)
    :precondition (and (unassigned day1))
    :effect (and
              (at-person ?p porto day1)
            )
  )

  (:action init-traveler-dubrovnik
    :parameters (?p - person)
    :precondition (and (unassigned day1))
    :effect (and
              (at-person ?p dubrovnik day1)
            )
  )

  ;; Fly along a direct flight from day d1 to the next day d2 (agent2)
  (:action fly-agent2
    :parameters (?p - person ?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at-person ?p ?from ?d1) (direct ?from ?to) (next ?d1 ?d2))
    :effect (and (at-person ?p ?to ?d2))
  )

  ;; Stay in the same city to the next day (agent2)
  (:action stay-agent2
    :parameters (?p - person ?c - city ?d1 - day ?d2 - day)
    :precondition (and (at-person ?p ?c ?d1) (next ?d1 ?d2))
    :effect (and (at-person ?p ?c ?d2))
  )

  ;; -------------------------
  ;; Synchronization actions (propagate person-day to day-assignment & counts)
  ;; These keep the two agents' views consistent. Actions are explicit and distinct.
  ;; -------------------------

  (:action sync-person-to-day-oslo
    :parameters (?p - person ?d - day)
    :precondition (and (at-person ?p oslo ?d) (unassigned ?d))
    :effect (and
              (not (unassigned ?d))
              (at-day ?d oslo)
              (increase (oslo-count) 1)
            )
  )

  (:action sync-person-to-day-porto
    :parameters (?p - person ?d - day)
    :precondition (and (at-person ?p porto ?d) (unassigned ?d))
    :effect (and
              (not (unassigned ?d))
              (at-day ?d porto)
              (increase (porto-count) 1)
            )
  )

  (:action sync-person-to-day-dubrovnik
    :parameters (?p - person ?d - day)
    :precondition (and (at-person ?p dubrovnik ?d) (unassigned ?d))
    :effect (and
              (not (unassigned ?d))
              (at-day ?d dubrovnik)
              (increase (dubrovnik-count) 1)
            )
  )

)