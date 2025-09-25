(define (domain multiagent-itinerary)
  (:requirements :strips :typing :adl :action-costs :equality)
  (:types agent city day count)

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

    ;; symbolic numeric bookkeeping via count objects
    (days-used ?n - count)
    (next-count ?n - count ?m - count)
    (target-duration ?n - count)
  )

  ;; The scheduler agent assigns the first day to a city; the transport agent
  ;; must be located in that city at assignment time. Assigning a day advances
  ;; the symbolic days-used counter.
  (:action assign-first
    :parameters (?sched - agent ?trav - agent ?d - day ?c - city ?n - count ?n+1 - count)
    :precondition (and (first ?d) (unassigned ?d) (at ?trav ?c) (days-used ?n) (next-count ?n ?n+1))
    :effect (and (assigned ?d ?c) (not (unassigned ?d)) (not (days-used ?n)) (days-used ?n+1))
  )

  ;; Assign a next day to a city. Requires the previous day ordering and that
  ;; the previous day is already assigned. If the city changes, it must be
  ;; connected (direct flight or same-city self-connection). The transport agent
  ;; must be at the new city when the assignment is made. Assigning a day
  ;; advances the symbolic days-used counter.
  (:action assign-next
    :parameters (?sched - agent ?trav - agent ?prev - day ?d - day ?cprev - city ?cnew - city ?n - count ?n+1 - count)
    :precondition (and
      (next ?prev ?d)
      (assigned ?prev ?cprev)
      (connected ?cprev ?cnew)
      (unassigned ?d)
      (at ?trav ?cnew)
      (days-used ?n)
      (next-count ?n ?n+1)
    )
    :effect (and (assigned ?d ?cnew) (not (unassigned ?d)) (not (days-used ?n)) (days-used ?n+1))
  )

  ;; Flight action (transport agent). Flights are only allowed along explicit
  ;; direct-flight edges; they change the agent location instantly.
  (:action fly
    :parameters (?a - agent ?from - city ?to - city)
    :precondition (and (at ?a ?from) (direct-flight ?from ?to))
    :effect (and (not (at ?a ?from)) (at ?a ?to))
  )
)