(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent city day)

  (:predicates
    (at ?a - agent ?c - city)
    (current-day ?d - day)
    (next-day ?d1 - day ?d2 - day)
    (direct-flight ?c1 - city ?c2 - city)
    (allowed-meet-day ?d - day)
    (bucharest ?c - city)
    (met-friends)
    ;; Need counters per city (grounded as different predicate names)
    (need-vilnius-2)
    (need-vilnius-1)
    (need-vilnius-0)
    (need-amsterdam-3)
    (need-amsterdam-2)
    (need-amsterdam-1)
    (need-amsterdam-0)
    (need-bucharest-6)
    (need-bucharest-5)
    (need-bucharest-4)
    (need-bucharest-3)
    (need-bucharest-2)
    (need-bucharest-1)
    (need-bucharest-0)
    ;; optional recording of presence per day (not required by the goal)
    (presence ?c - city ?d - day)
  )

  ; -------------------------
  ; Traveler actions: day-advancing "stay" actions that decrement the city's remaining need
  ; Each action consumes one day (advances current-day via next-day) and decrements the need counter
  ; for the city where the traveler was at the start of the action.
  ; -------------------------

  ; VILNIUS stays (2 -> 1, 1 -> 0)
  (:action traveler-stay-vilnius-2
    :parameters (?tr - agent ?d1 - day ?d2 - day)
    :precondition (and (at ?tr vilnius) (current-day ?d1) (next-day ?d1 ?d2) (need-vilnius-2))
    :effect (and
      (presence vilnius ?d1)
      (not (need-vilnius-2)) (need-vilnius-1)
      (not (current-day ?d1)) (current-day ?d2)
    )
  )
  (:action traveler-stay-vilnius-1
    :parameters (?tr - agent ?d1 - day ?d2 - day)
    :precondition (and (at ?tr vilnius) (current-day ?d1) (next-day ?d1 ?d2) (need-vilnius-1))
    :effect (and
      (presence vilnius ?d1)
      (not (need-vilnius-1)) (need-vilnius-0)
      (not (current-day ?d1)) (current-day ?d2)
    )
  )

  ; AMSTERDAM stays (3 -> 2, 2 -> 1, 1 -> 0)
  (:action traveler-stay-amsterdam-3
    :parameters (?tr - agent ?d1 - day ?d2 - day)
    :precondition (and (at ?tr amsterdam) (current-day ?d1) (next-day ?d1 ?d2) (need-amsterdam-3))
    :effect (and
      (presence amsterdam ?d1)
      (not (need-amsterdam-3)) (need-amsterdam-2)
      (not (current-day ?d1)) (current-day ?d2)
    )
  )
  (:action traveler-stay-amsterdam-2
    :parameters (?tr - agent ?d1 - day ?d2 - day)
    :precondition (and (at ?tr amsterdam) (current-day ?d1) (next-day ?d1 ?d2) (need-amsterdam-2))
    :effect (and
      (presence amsterdam ?d1)
      (not (need-amsterdam-2)) (need-amsterdam-1)
      (not (current-day ?d1)) (current-day ?d2)
    )
  )
  (:action traveler-stay-amsterdam-1
    :parameters (?tr - agent ?d1 - day ?d2 - day)
    :precondition (and (at ?tr amsterdam) (current-day ?d1) (next-day ?d1 ?d2) (need-amsterdam-1))
    :effect (and
      (presence amsterdam ?d1)
      (not (need-amsterdam-1)) (need-amsterdam-0)
      (not (current-day ?d1)) (current-day ?d2)
    )
  )

  ; BUCHAREST stays (6 -> 5, 5 -> 4, ..., 1 -> 0)
  (:action traveler-stay-bucharest-6
    :parameters (?tr - agent ?d1 - day ?d2 - day)
    :precondition (and (at ?tr bucharest) (current-day ?d1) (next-day ?d1 ?d2) (need-bucharest-6))
    :effect (and
      (presence bucharest ?d1)
      (not (need-bucharest-6)) (need-bucharest-5)
      (not (current-day ?d1)) (current-day ?d2)
    )
  )
  (:action traveler-stay-bucharest-5
    :parameters (?tr - agent ?d1 - day ?d2 - day)
    :precondition (and (at ?tr bucharest) (current-day ?d1) (next-day ?d1 ?d2) (need-bucharest-5))
    :effect (and
      (presence bucharest ?d1)
      (not (need-bucharest-5)) (need-bucharest-4)
      (not (current-day ?d1)) (current-day ?d2)
    )
  )
  (:action traveler-stay-bucharest-4
    :parameters (?tr - agent ?d1 - day ?d2 - day)
    :precondition (and (at ?tr bucharest) (current-day ?d1) (next-day ?d1 ?d2) (need-bucharest-4))
    :effect (and
      (presence bucharest ?d1)
      (not (need-bucharest-4)) (need-bucharest-3)
      (not (current-day ?d1)) (current-day ?d2)
    )
  )
  (:action traveler-stay-bucharest-3
    :parameters (?tr - agent ?d1 - day ?d2 - day)
    :precondition (and (at ?tr bucharest) (current-day ?d1) (next-day ?d1 ?d2) (need-bucharest-3))
    :effect (and
      (presence bucharest ?d1)
      (not (need-bucharest-3)) (need-bucharest-2)
      (not (current-day ?d1)) (current-day ?d2)
    )
  )
  (:action traveler-stay-bucharest-2
    :parameters (?tr - agent ?d1 - day ?d2 - day)
    :precondition (and (at ?tr bucharest) (current-day ?d1) (next-day ?d1 ?d2) (need-bucharest-2))
    :effect (and
      (presence bucharest ?d1)
      (not (need-bucharest-2)) (need-bucharest-1)
      (not (current-day ?d1)) (current-day ?d2)
    )
  )
  (:action traveler-stay-bucharest-1
    :parameters (?tr - agent ?d1 - day ?d2 - day)
    :precondition (and (at ?tr bucharest) (current-day ?d1) (next-day ?d1 ?d2) (need-bucharest-1))
    :effect (and
      (presence bucharest ?d1)
      (not (need-bucharest-1)) (need-bucharest-0)
      (not (current-day ?d1)) (current-day ?d2)
    )
  )

  ; -------------------------
  ; Traveler flight actions (day-advancing) that also decrement the departure city's need
  ; For each departure city we include actions for each positive need level.
  ; Actions are parameterized by destination where allowed by direct-flight facts.
  ; -------------------------

  ; Flights departing VILNIUS (2 -> 1, 1 -> 0). Allowed destination: amsterdam (direct-flight)
  (:action traveler-fly-from-vilnius-2
    :parameters (?tr - agent ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?tr vilnius) (direct-flight vilnius ?to) (current-day ?d1) (next-day ?d1 ?d2) (need-vilnius-2))
    :effect (and
      (presence vilnius ?d1)
      (not (at ?tr vilnius)) (at ?tr ?to)
      (not (need-vilnius-2)) (need-vilnius-1)
      (not (current-day ?d1)) (current-day ?d2)
    )
  )
  (:action traveler-fly-from-vilnius-1
    :parameters (?tr - agent ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?tr vilnius) (direct-flight vilnius ?to) (current-day ?d1) (next-day ?d1 ?d2) (need-vilnius-1))
    :effect (and
      (presence vilnius ?d1)
      (not (at ?tr vilnius)) (at ?tr ?to)
      (not (need-vilnius-1)) (need-vilnius-0)
      (not (current-day ?d1)) (current-day ?d2)
    )
  )

  ; Flights departing AMSTERDAM (3 -> 2, 2 -> 1, 1 -> 0). Allowed destinations: any city with direct-flight amsterdam ?to
  (:action traveler-fly-from-amsterdam-3
    :parameters (?tr - agent ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?tr amsterdam) (direct-flight amsterdam ?to) (current-day ?d1) (next-day ?d1 ?d2) (need-amsterdam-3))
    :effect (and
      (presence amsterdam ?d1)
      (not (at ?tr amsterdam)) (at ?tr ?to)
      (not (need-amsterdam-3)) (need-amsterdam-2)
      (not (current-day ?d1)) (current-day ?d2)
    )
  )
  (:action traveler-fly-from-amsterdam-2
    :parameters (?tr - agent ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?tr amsterdam) (direct-flight amsterdam ?to) (current-day ?d1) (next-day ?d1 ?d2) (need-amsterdam-2))
    :effect (and
      (presence amsterdam ?d1)
      (not (at ?tr amsterdam)) (at ?tr ?to)
      (not (need-amsterdam-2)) (need-amsterdam-1)
      (not (current-day ?d1)) (current-day ?d2)
    )
  )
  (:action traveler-fly-from-amsterdam-1
    :parameters (?tr - agent ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?tr amsterdam) (direct-flight amsterdam ?to) (current-day ?d1) (next-day ?d1 ?d2) (need-amsterdam-1))
    :effect (and
      (presence amsterdam ?d1)
      (not (at ?tr amsterdam)) (at ?tr ?to)
      (not (need-amsterdam-1)) (need-amsterdam-0)
      (not (current-day ?d1)) (current-day ?d2)
    )
  )

  ; Flights departing BUCHAREST (6->5 ... 1->0). Allowed destination: amsterdam (direct-flight)
  (:action traveler-fly-from-bucharest-6
    :parameters (?tr - agent ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?tr bucharest) (direct-flight bucharest ?to) (current-day ?d1) (next-day ?d1 ?d2) (need-bucharest-6))
    :effect (and
      (presence bucharest ?d1)
      (not (at ?tr bucharest)) (at ?tr ?to)
      (not (need-bucharest-6)) (need-bucharest-5)
      (not (current-day ?d1)) (current-day ?d2)
    )
  )
  (:action traveler-fly-from-bucharest-5
    :parameters (?tr - agent ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?tr bucharest) (direct-flight bucharest ?to) (current-day ?d1) (next-day ?d1 ?d2) (need-bucharest-5))
    :effect (and
      (presence bucharest ?d1)
      (not (at ?tr bucharest)) (at ?tr ?to)
      (not (need-bucharest-5)) (need-bucharest-4)
      (not (current-day ?d1)) (current-day ?d2)
    )
  )
  (:action traveler-fly-from-bucharest-4
    :parameters (?tr - agent ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?tr bucharest) (direct-flight bucharest ?to) (current-day ?d1) (next-day ?d1 ?d2) (need-bucharest-4))
    :effect (and
      (presence bucharest ?d1)
      (not (at ?tr bucharest)) (at ?tr ?to)
      (not (need-bucharest-4)) (need-bucharest-3)
      (not (current-day ?d1)) (current-day ?d2)
    )
  )
  (:action traveler-fly-from-bucharest-3
    :parameters (?tr - agent ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?tr bucharest) (direct-flight bucharest ?to) (current-day ?d1) (next-day ?d1 ?d2) (need-bucharest-3))
    :effect (and
      (presence bucharest ?d1)
      (not (at ?tr bucharest)) (at ?tr ?to)
      (not (need-bucharest-3)) (need-bucharest-2)
      (not (current-day ?d1)) (current-day ?d2)
    )
  )
  (:action traveler-fly-from-bucharest-2
    :parameters (?tr - agent ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?tr bucharest) (direct-flight bucharest ?to) (current-day ?d1) (next-day ?d1 ?d2) (need-bucharest-2))
    :effect (and
      (presence bucharest ?d1)
      (not (at ?tr bucharest)) (at ?tr ?to)
      (not (need-bucharest-2)) (need-bucharest-1)
      (not (current-day ?d1)) (current-day ?d2)
    )
  )
  (:action traveler-fly-from-bucharest-1
    :parameters (?tr - agent ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?tr bucharest) (direct-flight bucharest ?to) (current-day ?d1) (next-day ?d1 ?d2) (need-bucharest-1))
    :effect (and
      (presence bucharest ?d1)
      (not (at ?tr bucharest)) (at ?tr ?to)
      (not (need-bucharest-1)) (need-bucharest-0)
      (not (current-day ?d1)) (current-day ?d2)
    )
  )

  ; -------------------------
  ; Meeting action (traveler meets friends in Bucharest on allowed days)
  ; -------------------------
  (:action traveler-meet-friends
    :parameters (?tr - agent ?c - city ?d - day)
    :precondition (and (at ?tr ?c) (bucharest ?c) (current-day ?d) (allowed-meet-day ?d))
    :effect (and (met-friends))
  )

  ; -------------------------
  ; Flight planner action (can add connections; connectivity is provided in the problem init)
  ; -------------------------
  (:action flightplanner-add-connection
    :parameters (?fp - agent ?c1 - city ?c2 - city)
    :precondition (and)
    :effect (and (direct-flight ?c1 ?c2))
  )

)