(define (domain trip-planning)
  ;; Requirements chosen to be compatible with FastDownward:
  ;; - :typing for typed objects (city, day)
  ;; - :fluents for numeric counters
  ;; - :negative-preconditions for "unassigned" checks
  ;; - :equality for numeric equality tests
  (:requirements :typing :fluents :negative-preconditions :equality)

  (:types city day)

  ;; Predicates:
  ;; - (at ?c - city ?d - day)         : day ?d is assigned to city ?c (traveler is in ?c on ?d)
  ;; - (unassigned ?d - day)          : day ?d has not yet been assigned to any city
  ;; - (next ?d ?nd - day)            : temporal ordering day ?d is immediately followed by ?nd (= d+1)
  ;; - (direct ?c1 ?c2 - city)        : a direct flight (or staying) is allowed between cities c1 and c2
  (:predicates
    (at ?c - city ?d - day)
    (unassigned ?d - day)
    (next ?d ?nd - day)
    (direct ?c1 ?c2 - city)
  )

  ;; Numeric fluents (functions) to count days spent in each city.
  ;; These let the planner reason about how many days are assigned per city.
  (:functions
    (days-in ?c - city)
  )

  ;; Actions:
  ;; We assign a city to the immediate next day. We only allow assignment to day ?nd if it's unassigned
  ;; and there is a "direct" relation between the city we're on on day ?d and the new city for ?nd.
  ;; The domain encodes "staying" as a reflexive direct link (direct city city).
  ;; Effect increments the city's day-counter.
  (:action move-to-next-day
    :parameters (?cfrom - city ?cto - city ?d - day ?nd - day)
    :precondition (and
      (at ?cfrom ?d)
      (next ?d ?nd)
      (unassigned ?nd)
      (direct ?cfrom ?cto)  ;; includes staying (direct reflexive edges)
    )
    :effect (and
      (not (unassigned ?nd))
      (at ?cto ?nd)
      (increase (days-in ?cto) 1)
    )
  )

  ;; NOTE (documentation of modelling choices and assumptions):
  ;; - Days are discrete objects day1 .. day16.
  ;; - The state will be built forward from day1 (pre-assigned) by repeated move-to-next-day actions.
  ;; - "direct" encodes both air connections and staying in the same city (reflexive).
  ;; - Flights are only allowed when a (direct c1 c2) fact exists for the pair.
  ;; - Conference-day requirements and city-day-count bounds are encoded in the problem goals.
  ;; - The traveler requested total stays that sum to 18 (Lisbon 7 + Florence 4 + Copenhagen 7)
  ;;   while the trip length is 16. Because that set is inconsistent, the PDDL model does NOT
  ;;   enforce exact requested counts; instead it enforces upper-bounds (<= requested) so the planner
  ;;   can choose adjusted stay lengths that fit the 16-day trip. This choice is documented as:
  ;;   "allow the planner to reduce stays when needed, but never exceed requested stays."
  ;; - Each day must be assigned to exactly one city: this is enforced by only allowing assignment
  ;;   once per day (unassigned predicate) and by requiring in the goal that there are no unassigned days.
)