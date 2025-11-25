(define (domain hanoi)
  (:requirements :typing :negative-preconditions :strips)
  (:types disk peg step)

  (:predicates
    (on ?d - disk ?p - peg)
    (expected ?s - step ?d - disk ?from - peg ?to - peg)
    (step-current ?s - step)
    (moved ?s - step)
    (audited ?s - step)
    (next ?s1 - step ?s2 - step)
  )

  ;; Move smallest disk a
  (:action move-a
    :parameters (?s - step ?from - peg ?to - peg)
    :precondition (and
                    (step-current ?s)
                    (expected ?s a ?from ?to)
                    (on a ?from)
                    (not (moved ?s))
                  )
    :effect (and
              (not (on a ?from))
              (on a ?to)
              (moved ?s)
            )
  )

  ;; Move disk b (requires a not on source and not on destination)
  (:action move-b
    :parameters (?s - step ?from - peg ?to - peg)
    :precondition (and
                    (step-current ?s)
                    (expected ?s b ?from ?to)
                    (on b ?from)
                    (not (on a ?from))
                    (not (on a ?to))
                    (not (moved ?s))
                  )
    :effect (and
              (not (on b ?from))
              (on b ?to)
              (moved ?s)
            )
  )

  ;; Move disk c (requires a and b absent on source and destination)
  (:action move-c
    :parameters (?s - step ?from - peg ?to - peg)
    :precondition (and
                    (step-current ?s)
                    (expected ?s c ?from ?to)
                    (on c ?from)
                    (not (on a ?from))
                    (not (on b ?from))
                    (not (on a ?to))
                    (not (on b ?to))
                    (not (moved ?s))
                  )
    :effect (and
              (not (on c ?from))
              (on c ?to)
              (moved ?s)
            )
  )

  ;; Move disk d (requires a,b,c absent on source and destination)
  (:action move-d
    :parameters (?s - step ?from - peg ?to - peg)
    :precondition (and
                    (step-current ?s)
                    (expected ?s d ?from ?to)
                    (on d ?from)
                    (not (on a ?from))
                    (not (on b ?from))
                    (not (on c ?from))
                    (not (on a ?to))
                    (not (on b ?to))
                    (not (on c ?to))
                    (not (moved ?s))
                  )
    :effect (and
              (not (on d ?from))
              (on d ?to)
              (moved ?s)
            )
  )

  ;; Move disk e (largest: requires a,b,c,d absent on source and destination)
  (:action move-e
    :parameters (?s - step ?from - peg ?to - peg)
    :precondition (and
                    (step-current ?s)
                    (expected ?s e ?from ?to)
                    (on e ?from)
                    (not (on a ?from))
                    (not (on b ?from))
                    (not (on c ?from))
                    (not (on d ?from))
                    (not (on a ?to))
                    (not (on b ?to))
                    (not (on c ?to))
                    (not (on d ?to))
                    (not (moved ?s))
                  )
    :effect (and
              (not (on e ?from))
              (on e ?to)
              (moved ?s)
            )
  )

  ;; Auditor action: advance to next step only after a move has occurred in current step
  (:action audit-step
    :parameters (?s - step ?next - step)
    :precondition (and
                    (step-current ?s)
                    (moved ?s)
                    (next ?s ?next)
                    (not (audited ?s))
                  )
    :effect (and
              (audited ?s)
              (not (step-current ?s))
              (step-current ?next)
              (not (moved ?s))
            )
  )
)