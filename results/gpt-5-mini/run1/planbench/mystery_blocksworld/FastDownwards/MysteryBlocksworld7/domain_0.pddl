(define (domain craving-domain)
  ; Domain modeling cravings between objects.
  ; Modeling decisions:
  ; - Objects a, b, c, d are declared as domain constants to allow
  ;   actions that enforce an explicit ordering for the required chain.
  ; - Three distinct actions are provided, one per required craving relation.
  ;   This encodes the intended causal/order constraints: a must crave c
  ;   before b can be made to crave a, and b must crave a before d can be
  ;   made to crave b. This prevents reordering of the required steps.
  ; - No penalty or bookkeeping actions are provided; violations are impossible
  ;   because preconditions prevent actions unless the required prior facts hold.
  ; - Requirements are limited to :strips, :typing, and :negative-preconditions
  ;   so the domain is compatible with FastDownward.
  :requirements :strips :typing :negative-preconditions
  :types obj

  ; Domain-level constants for the specific objects mentioned in the problem.
  :constants a b c d - obj

  :predicates
    (object ?x - obj)
    (craves ?from - obj ?to - obj)

  ; Establish that 'a' craves 'c'. No prerequisite cravings required.
  (:action establish-a-craves-c
    :precondition (and
      (object a)
      (object c)
      (not (craves a c))
    )
    :effect (and
      (craves a c)
    )
  )

  ; Establish that 'b' craves 'a'. This requires that (craves a c) already holds,
  ; enforcing that a->c must be created before b->a.
  (:action establish-b-craves-a
    :precondition (and
      (object b)
      (object a)
      (not (craves b a))
      (craves a c)
    )
    :effect (and
      (craves b a)
    )
  )

  ; Establish that 'd' craves 'b'. This requires that (craves b a) already holds,
  ; enforcing that b->a must be created before d->b.
  (:action establish-d-craves-b
    :precondition (and
      (object d)
      (object b)
      (not (craves d b))
      (craves b a)
    )
    :effect (and
      (craves d b)
    )
  )
)