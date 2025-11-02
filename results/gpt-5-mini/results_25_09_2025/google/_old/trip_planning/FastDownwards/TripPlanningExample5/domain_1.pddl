(define (domain unified-trip-planning)
  (:requirements :typing :negative-preconditions :action-costs :adl)
  (:types city day person token)

  (:predicates
    (at-day ?d - day ?c - city)
    (unassigned ?d - day)
    (next ?d1 - day ?d2 - day)

    (at-person ?p - person ?c - city ?d - day)

    (direct ?c1 - city ?c2 - city)

    (token-of ?t - token ?c - city)
    (token-free ?t - token)
  )

  ;; -------------------------
  ;; Agent1 actions (day-centric assignment & flights)
  ;; Tokens are consumed to represent using one of the limited day-slots for a city.
  ;; -------------------------

  ;; Assign day1 to a city (start of itinerary - agent1)
  (:action assign-day1-oslo
    :parameters (?t - token)
    :precondition (and (unassigned day1) (token-of ?t oslo) (token-free ?t))
    :effect (and
              (not (unassigned day1))
              (at-day day1 oslo)
              (not (token-free ?t))
            )
  )

  (:action assign-day1-porto
    :parameters (?t - token)
    :precondition (and (unassigned day1) (token-of ?t porto) (token-free ?t))
    :effect (and
              (not (unassigned day1))
              (at-day day1 porto)
              (not (token-free ?t))
            )
  )

  (:action assign-day1-dubrovnik
    :parameters (?t - token)
    :precondition (and (unassigned day1) (token-of ?t dubrovnik) (token-free ?t))
    :effect (and
              (not (unassigned day1))
              (at-day day1 dubrovnik)
              (not (token-free ?t))
            )
  )

  ;; Staying in the same city from day d to the next day (agent1)
  (:action stay-oslo
    :parameters (?d - day ?next - day ?t - token)
    :precondition (and (next ?d ?next) (at-day ?d oslo) (unassigned ?next) (token-of ?t oslo) (token-free ?t))
    :effect (and
              (not (unassigned ?next))
              (at-day ?next oslo)
              (not (token-free ?t))
            )
  )

  (:action stay-porto
    :parameters (?d - day ?next - day ?t - token)
    :precondition (and (next ?d ?next) (at-day ?d porto) (unassigned ?next) (token-of ?t porto) (token-free ?t))
    :effect (and
              (not (unassigned ?next))
              (at-day ?next porto)
              (not (token-free ?t))
            )
  )

  (:action stay-dubrovnik
    :parameters (?d - day ?next - day ?t - token)
    :precondition (and (next ?d ?next) (at-day ?d dubrovnik) (unassigned ?next) (token-of ?t dubrovnik) (token-free ?t))
    :effect (and
              (not (unassigned ?next))
              (at-day ?next dubrovnik)
              (not (token-free ?t))
            )
  )

  ;; Flights between directly connected cities (agent1 view: assign next day to destination)
  ;; Oslo -> Dubrovnik
  (:action flight-oslo-dubrovnik
    :parameters (?d - day ?next - day ?t - token)
    :precondition (and (next ?d ?next) (at-day ?d oslo) (unassigned ?next) (direct oslo dubrovnik) (token-of ?t dubrovnik) (token-free ?t))
    :effect (and
              (not (unassigned ?next))
              (at-day ?next dubrovnik)
              (not (token-free ?t))
            )
  )

  ;; Dubrovnik -> Oslo
  (:action flight-dubrovnik-oslo
    :parameters (?d - day ?next - day ?t - token)
    :precondition (and (next ?d ?next) (at-day ?d dubrovnik) (unassigned ?next) (direct dubrovnik oslo) (token-of ?t oslo) (token-free ?t))
    :effect (and
              (not (unassigned ?next))
              (at-day ?next oslo)
              (not (token-free ?t))
            )
  )

  ;; Porto -> Oslo
  (:action flight-porto-oslo
    :parameters (?d - day ?next - day ?t - token)
    :precondition (and (next ?d ?next) (at-day ?d porto) (unassigned ?next) (direct porto oslo) (token-of ?t oslo) (token-free ?t))
    :effect (and
              (not (unassigned ?next))
              (at-day ?next oslo)
              (not (token-free ?t))
            )
  )

  ;; Oslo -> Porto
  (:action flight-oslo-porto
    :parameters (?d - day ?next - day ?t - token)
    :precondition (and (next ?d ?next) (at-day ?d oslo) (unassigned ?next) (direct oslo porto) (token-of ?t porto) (token-free ?t))
    :effect (and
              (not (unassigned ?next))
              (at-day ?next porto)
              (not (token-free ?t))
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
  ;; Synchronization actions (propagate person-day to day-assignment & consume tokens)
  ;; These keep the two agents' views consistent. Actions are explicit and distinct.
  ;; -------------------------

  (:action sync-person-to-day-oslo
    :parameters (?p - person ?d - day ?t - token)
    :precondition (and (at-person ?p oslo ?d) (unassigned ?d) (token-of ?t oslo) (token-free ?t))
    :effect (and
              (not (unassigned ?d))
              (at-day ?d oslo)
              (not (token-free ?t))
            )
  )

  (:action sync-person-to-day-porto
    :parameters (?p - person ?d - day ?t - token)
    :precondition (and (at-person ?p porto ?d) (unassigned ?d) (token-of ?t porto) (token-free ?t))
    :effect (and
              (not (unassigned ?d))
              (at-day ?d porto)
              (not (token-free ?t))
            )
  )

  (:action sync-person-to-day-dubrovnik
    :parameters (?p - person ?d - day ?t - token)
    :precondition (and (at-person ?p dubrovnik ?d) (unassigned ?d) (token-of ?t dubrovnik) (token-free ?t))
    :effect (and
              (not (unassigned ?d))
              (at-day ?d dubrovnik)
              (not (token-free ?t))
            )
  )

)