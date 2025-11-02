; Domain: travel-domain
; Notes / assumptions:
; - The user's travel itinerary proposal and the flight planner's connectivity list were not supplied in the prompt.
; - To produce a runnable FastDownwards model I make a minimal, explicit assumption set below.
;   These are UNVERIFIED assumptions and should be replaced with the real itinerary / connectivity
;   if available. Because the user request treats natural-language preferences as hard constraints,
;   this model encodes the requirement to meet friends in Bucharest between day 6 and day 11 inclusive
;   as a strict goal precondition (action only possible on allowed meet days).
; - Distinct agent contributions are preserved: actions that move the traveler are labeled as traveler-*
;   and the flight planner has an action that can add direct-flight facts.
; - If these assumptions conflict with your (unprovided) inputs, please supply the precise itinerary
;   and connectivity and I will regenerate a matching PDDL model.

(define (domain travel-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent city day)

  (:predicates
    (at ?a - agent ?c - city)                ; agent is at city
    (current-day ?d - day)                  ; which day is current
    (next-day ?d1 - day ?d2 - day)          ; successor day relation
    (direct-flight ?c1 - city ?c2 - city)   ; a direct flight exists from c1 to c2 (can be added by planner)
    (allowed-meet-day ?d - day)             ; day allowed to meet friends in Bucharest
    (bucharest ?c - city)                   ; marks which city object denotes Bucharest
    (met-friends)                           ; goal predicate: traveler has met friends
  )

  ; -------------------------
  ; Traveler actions
  ; -------------------------
  (:action traveler-fly
    :parameters (?tr - agent ?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?tr ?from)
      (direct-flight ?from ?to)
      (current-day ?d1)
      (next-day ?d1 ?d2)
    )
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
      (not (current-day ?d1))
      (current-day ?d2)
    )
  )

  (:action traveler-stay
    :parameters (?tr - agent ?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?tr ?c)
      (current-day ?d1)
      (next-day ?d1 ?d2)
    )
    :effect (and
      ; remain at same city, advance to next day
      (not (current-day ?d1))
      (current-day ?d2)
    )
  )

  (:action meet-friends
    :parameters (?tr - agent ?c - city ?d - day)
    :precondition (and
      (at ?tr ?c)
      (bucharest ?c)
      (current-day ?d)
      (allowed-meet-day ?d)
    )
    :effect (and
      (met-friends)
    )
  )

  ; -------------------------
  ; Flight planner actions (distinct agent)
  ; The flight planner may introduce direct-flight facts (e.g., add connectivity)
  ; This models the planner's ability to make connections available/known at planning time.
  ; -------------------------
  (:action flightplanner-add-connection
    :parameters (?fp - agent ?c1 - city ?c2 - city)
    :precondition (and)
    :effect (and
      (direct-flight ?c1 ?c2)
    )
  )

)