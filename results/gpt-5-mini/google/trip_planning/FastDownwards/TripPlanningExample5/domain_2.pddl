(define (domain travel_orchestration)
  (:requirements :strips :typing)
  (:types agent day city)

  (:predicates
    ;; temporal successor relation between days
    (next ?d1 - day ?d2 - day)

    ;; direct flight connectivity between cities (directed)
    (direct ?from - city ?to - city)

    ;; agent located in a city on a particular day
    (at ?a - agent ?c - city ?d - day)

    ;; token indicating a day has not yet been assigned a city for the agent
    (day_free ?d - day)
  )

  ;; Assign the same city on the successor day (stay)
  ;; Preconditions:
  ;; - agent is in city ?c on day ?d1
  ;; - ?d2 is the successor of ?d1
  ;; - ?d2 is still free (not yet assigned)
  ;; Effects:
  ;; - agent is at city ?c on day ?d2
  ;; - mark ?d2 as no longer free so only one assignment occurs per day
  (:action stay_assign
    :parameters (?a - agent ?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?a ?c ?d1) (next ?d1 ?d2) (day_free ?d2))
    :effect (and
      (at ?a ?c ?d2)
      (not (day_free ?d2))
    )
  )

  ;; Assign a different city on the successor day using a direct flight (fly)
  ;; Preconditions:
  ;; - agent is in city ?from on day ?d1
  ;; - there is a direct flight from ?from to ?to
  ;; - ?d2 is the successor of ?d1
  ;; - ?d2 is still free
  ;; Effects:
  ;; - agent is at city ?to on day ?d2
  ;; - mark ?d2 as no longer free
  (:action fly_assign
    :parameters (?a - agent ?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?a ?from ?d1) (direct ?from ?to) (next ?d1 ?d2) (day_free ?d2))
    :effect (and
      (at ?a ?to ?d2)
      (not (day_free ?d2))
    )
  )
)