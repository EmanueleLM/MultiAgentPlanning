(define (domain multiagent-travel)
  (:requirements :strips :typing)
  (:types day city agent)

  (:predicates
    (current-day ?d - day)
    (next ?d1 - day ?d2 - day)
    (at ?ag - agent ?c - city ?d - day)        ; agent is at city on a given day
    (flight ?from - city ?to - city)           ; direct flight connectivity (static)
    (visited ?c - city)                        ; city has been visited at least once
    (allowed-meet ?d - day)                    ; days when meeting in Bucharest is allowed
    (meeting-done)                             ; meeting constraint satisfied
  )

  ;; Traveler actions: staying in the same city and performing the meeting
  (:action traveler-stay
    :parameters (?trav - agent ?city - city ?d1 - day ?d2 - day)
    :precondition (and (current-day ?d1) (next ?d1 ?d2) (at ?trav ?city ?d1))
    :effect (and
              (not (current-day ?d1))
              (current-day ?d2)
              (at ?trav ?city ?d2)
              (visited ?city)
            )
  )

  (:action traveler-meet
    :parameters (?trav - agent ?d - day)
    :precondition (and (current-day ?d) (at ?trav bucharest ?d) (allowed-meet ?d))
    :effect (meeting-done)
  )

  ;; Flight planner action: operate a direct flight that moves the traveler to the destination the next day.
  (:action flight_planner-fly
    :parameters (?planner - agent ?from - city ?to - city ?d1 - day ?d2 - day ?trav - agent)
    :precondition (and
                    (current-day ?d1)
                    (next ?d1 ?d2)
                    (at ?trav ?from ?d1)
                    (flight ?from ?to)
                  )
    :effect (and
              (not (current-day ?d1))
              (current-day ?d2)
              (at ?trav ?to ?d2)
              (visited ?to)
            )
  )
)