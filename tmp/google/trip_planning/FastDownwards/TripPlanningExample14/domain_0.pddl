(define (domain multiagent-itinerary)
  (:requirements :strips :typing :fluents)
  (:types agent city day)

  (:predicates
    ;; connections used by the day-assignment logic (includes self-connections)
    (connected ?c - city ?c2 - city)

    ;; day bookkeeping
    (unassigned ?d - day)
    (assigned ?d - day ?c - city)
    (next ?d1 - day ?d2 - day)
    (first ?d - day)

    ;; agent locations and available flights
    (at ?a - agent ?c - city)
    (direct-flight ?from - city ?to - city)
  )

  (:functions
    (days-used)    ; numeric: how many days have been assigned / consumed
    (trip-duration)
  )

  ;; The scheduler agent assigns the first day to a city; the transport agent
  ;; must be located in that city at assignment time. Assigning a day increases
  ;; days-used by 1.
  (:action assign-first
    :parameters (?sched - agent ?trav - agent ?d - day ?c - city)
    :precondition (and (first ?d) (unassigned ?d) (at ?trav ?c))
    :effect (and (assigned ?d ?c) (not (unassigned ?d)) (increase (days-used) 1))
  )

  ;; Assign a next day to a city. Requires the previous day ordering and that
  ;; the previous day is already assigned. If the city changes, it must be
  ;; connected (direct flight or same-city self-connection). The transport agent
  ;; must be at the new city when the assignment is made. Assigning a day
  ;; increases days-used by 1.
  (:action assign-next
    :parameters (?sched - agent ?trav - agent ?prev - day ?d - day ?cprev - city ?cnew - city)
    :precondition (and
      (next ?prev ?d)
      (assigned ?prev ?cprev)
      (connected ?cprev ?cnew)
      (unassigned ?d)
      (at ?trav ?cnew)
    )
    :effect (and (assigned ?d ?cnew) (not (unassigned ?d)) (increase (days-used) 1))
  )

  ;; Flight action (transport agent). Flights are only allowed along explicit
  ;; direct-flight edges; they change the agent location. Flights are modeled
  ;; as instantaneous with respect to days-used (day consumption is done by
  ;; the assignment actions).
  (:action fly
    :parameters (?a - agent ?from - city ?to - city)
    :precondition (and (at ?a ?from) (direct-flight ?from ?to))
    :effect (and (not (at ?a ?from)) (at ?a ?to))
  )
)