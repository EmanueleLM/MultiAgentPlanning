(define (domain trip-days)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types day city)
  (:predicates
    ; Core state
    (at ?d - day ?c - city)            ; city assigned for a given day
    (next ?d - day ?d2 - day)          ; successor relation between days
    (connected ?c - city ?c2 - city)   ; direct-flight adjacency only

    ; Progress/uniqueness
    (decided ?d - day)                 ; day has been assigned
    (frontier ?d - day)                ; current latest assigned day in sequence

    ; Day-specific requirements (e.g., day 4 must be Berlin)
    (hasreq ?d - day)
    (req ?d - day ?c - city)

    ; Tracking that each city was visited at least once
    (visited ?c - city)
  )
  (:functions (total-cost))

  ; Stay in the same city from day d to the next day d2 (unconstrained next day)
  (:action stay_free
    :parameters (?d - day ?d2 - day ?c - city)
    :precondition (and
      (frontier ?d)
      (next ?d ?d2)
      (at ?d ?c)
      (not (decided ?d2))
      (not (hasreq ?d2))
    )
    :effect (and
      (at ?d2 ?c)
      (decided ?d2)
      (visited ?c)
      (not (frontier ?d))
      (frontier ?d2)
      (increase (total-cost) 0)
    )
  )

  ; Fly between directly connected cities from day d to the next day d2 (unconstrained next day)
  (:action fly_free
    :parameters (?d - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (frontier ?d)
      (next ?d ?d2)
      (at ?d ?from)
      (connected ?from ?to)
      (not (decided ?d2))
      (not (hasreq ?d2))
    )
    :effect (and
      (at ?d2 ?to)
      (decided ?d2)
      (visited ?to)
      (not (frontier ?d))
      (frontier ?d2)
      (increase (total-cost) 1)
    )
  )

  ; Stay to a required city on a required next day (e.g., day 4 must be Berlin)
  (:action stay_required
    :parameters (?d - day ?d2 - day ?c - city)
    :precondition (and
      (frontier ?d)
      (next ?d ?d2)
      (at ?d ?c)
      (not (decided ?d2))
      (hasreq ?d2)
      (req ?d2 ?c)
    )
    :effect (and
      (at ?d2 ?c)
      (decided ?d2)
      (visited ?c)
      (not (frontier ?d))
      (frontier ?d2)
      (increase (total-cost) 0)
    )
  )

  ; Fly to a specifically required city on a required next day
  (:action fly_required
    :parameters (?d - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (frontier ?d)
      (next ?d ?d2)
      (at ?d ?from)
      (connected ?from ?to)
      (not (decided ?d2))
      (hasreq ?d2)
      (req ?d2 ?to)
    )
    :effect (and
      (at ?d2 ?to)
      (decided ?d2)
      (visited ?to)
      (not (frontier ?d))
      (frontier ?d2)
      (increase (total-cost) 1)
    )
  )
)