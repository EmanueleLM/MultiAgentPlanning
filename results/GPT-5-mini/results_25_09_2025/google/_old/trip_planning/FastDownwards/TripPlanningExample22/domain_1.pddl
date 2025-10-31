(define (domain multiagent-trip)
  (:requirements :typing :negative-preconditions :equality :adl :action-costs)
  (:types person city day usedcnt bcnt fcnt bucnt scnt)

  (:predicates
    (city ?c - city)
    (direct-flight ?from - city ?to - city)
    (at ?p - person ?c - city)
    (visited ?c - city)

    ;; temporal / counters reified as predicates
    (current-day ?d - day)
    (next ?d - day ?dnext - day)

    (used ?u - usedcnt)
    (next-used ?u - usedcnt ?unext - usedcnt)

    (berlin-days ?b - bcnt)
    (next-berlin ?b - bcnt ?bnext - bcnt)

    (frankfurt-days ?f - fcnt)
    (next-frankfurt ?f - fcnt ?fnext - fcnt)

    (bucharest-days ?bu - bucnt)
    (next-bucharest ?bu - bucnt ?bunext - bucnt)

    (show-days ?s - scnt)
    (next-show ?s - scnt ?snext - scnt)

    ;; static predicates indicating special day ranges
    (show-period ?d - day)                ; true for days 1..7
    (depart-berlin-allowed ?d - day)      ; true for days 8..10
  )

  (:functions
    (total-cost)
  )

  ;; ------------------------
  ;; Traveler actions (prefix traveler-)
  ;; ------------------------

  (:action traveler-travel
    :parameters (?p - person ?from - city ?to - city ?d - day ?dnext - day ?u - usedcnt ?unext - usedcnt)
    :precondition (and
      (at ?p ?from)
      (direct-flight ?from ?to)
      (current-day ?d)
      (next ?d ?dnext)
      (used ?u)
      (next-used ?u ?unext)
    )
    :effect (and
      (not (at ?p ?from))
      (at ?p ?to)
      (visited ?to)

      (not (current-day ?d))
      (current-day ?dnext)

      (not (used ?u))
      (used ?unext)

      (increase (total-cost) 1)
    )
  )

  (:action traveler-stay-berlin
    :parameters (?p - person ?d - day ?dnext - day ?u - usedcnt ?unext - usedcnt ?b - bcnt ?bnext - bcnt)
    :precondition (and
      (at ?p berlin)
      (current-day ?d)
      (next ?d ?dnext)
      (used ?u)
      (next-used ?u ?unext)
      (berlin-days ?b)
      (next-berlin ?b ?bnext)
    )
    :effect (and
      (not (berlin-days ?b))
      (berlin-days ?bnext)

      (not (current-day ?d))
      (current-day ?dnext)

      (not (used ?u))
      (used ?unext)

      (increase (total-cost) 1)
    )
  )

  (:action traveler-stay-frankfurt
    :parameters (?p - person ?d - day ?dnext - day ?u - usedcnt ?unext - usedcnt ?f - fcnt ?fnext - fcnt)
    :precondition (and
      (at ?p frankfurt)
      (current-day ?d)
      (next ?d ?dnext)
      (used ?u)
      (next-used ?u ?unext)
      (frankfurt-days ?f)
      (next-frankfurt ?f ?fnext)
    )
    :effect (and
      (not (frankfurt-days ?f))
      (frankfurt-days ?fnext)

      (not (current-day ?d))
      (current-day ?dnext)

      (not (used ?u))
      (used ?unext)

      (increase (total-cost) 1)
    )
  )

  (:action traveler-stay-bucharest
    :parameters (?p - person ?d - day ?dnext - day ?u - usedcnt ?unext - usedcnt ?bu - bucnt ?bunext - bucnt)
    :precondition (and
      (at ?p bucharest)
      (current-day ?d)
      (next ?d ?dnext)
      (used ?u)
      (next-used ?u ?unext)
      (bucharest-days ?bu)
      (next-bucharest ?bu ?bunext)
    )
    :effect (and
      (not (bucharest-days ?bu))
      (bucharest-days ?bunext)

      (not (current-day ?d))
      (current-day ?dnext)

      (not (used ?u))
      (used ?unext)

      (increase (total-cost) 1)
    )
  )

  (:action traveler-attend-show-in-berlin
    :parameters (?p - person ?d - day ?dnext - day ?u - usedcnt ?unext - usedcnt ?b - bcnt ?bnext - bcnt ?s - scnt ?snext - scnt)
    :precondition (and
      (at ?p berlin)
      (current-day ?d)
      (show-period ?d)
      (next ?d ?dnext)
      (used ?u)
      (next-used ?u ?unext)
      (berlin-days ?b)
      (next-berlin ?b ?bnext)
      (show-days ?s)
      (next-show ?s ?snext)
    )
    :effect (and
      (not (berlin-days ?b))
      (berlin-days ?bnext)

      (not (show-days ?s))
      (show-days ?snext)

      (not (current-day ?d))
      (current-day ?dnext)

      (not (used ?u))
      (used ?unext)

      (increase (total-cost) 1)
    )
  )

  ;; ------------------------
  ;; Network actions (prefix network-)
  ;; ------------------------

  (:action network-wait
    :parameters (?p - person ?d - day ?dnext - day ?u - usedcnt ?unext - usedcnt)
    :precondition (and
      (current-day ?d)
      (next ?d ?dnext)
      (used ?u)
      (next-used ?u ?unext)
    )
    :effect (and
      (not (current-day ?d))
      (current-day ?dnext)

      (not (used ?u))
      (used ?unext)

      (increase (total-cost) 1)
    )
  )

  (:action network-fly
    :parameters (?p - person ?from - city ?to - city ?d - day ?dnext - day ?u - usedcnt ?unext - usedcnt)
    :precondition (and
      (at ?p ?from)
      (direct-flight ?from ?to)
      (not (= ?from berlin))
      (current-day ?d)
      (next ?d ?dnext)
      (used ?u)
      (next-used ?u ?unext)
    )
    :effect (and
      (not (at ?p ?from))
      (at ?p ?to)
      (visited ?to)

      (not (current-day ?d))
      (current-day ?dnext)

      (not (used ?u))
      (used ?unext)

      (increase (total-cost) 1)
    )
  )

  (:action network-fly-from-berlin
    :parameters (?p - person ?to - city ?d - day ?dnext - day ?u - usedcnt ?unext - usedcnt)
    :precondition (and
      (at ?p berlin)
      (direct-flight berlin ?to)
      (depart-berlin-allowed ?d)
      (current-day ?d)
      (next ?d ?dnext)
      (used ?u)
      (next-used ?u ?unext)
    )
    :effect (and
      (not (at ?p berlin))
      (at ?p ?to)
      (visited ?to)

      (not (current-day ?d))
      (current-day ?dnext)

      (not (used ?u))
      (used ?unext)

      (increase (total-cost) 1)
    )
  )
)