(define (domain craving-domain)
  ; Domain modeling simple "craving" relations between named objects.
  ; Requirements limited to features supported by FastDownward as requested.
  :requirements :typing :negative-preconditions :strips
  :types obj

  ; Canonical predicate: craves <subject> <object>
  :predicates
    (craves ?from - obj ?to - obj)

  ; A single general action that establishes a craving relation.
  ; Precondition uses a negative precondition to prevent re-establishing
  ; an already-true craving (keeps effects idempotent).
  :action form-crave
    :parameters (?from - obj ?to - obj)
    :precondition (not (craves ?from ?to))
    :effect (and (craves ?from ?to))
)