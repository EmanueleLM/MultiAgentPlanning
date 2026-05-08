(define (domain hanoi-orchestrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place
          place
          step
          agent)

  ;; Predicates representing the world state
  (:predicates
    (on ?d - disk ?p - place)            ; disk ?d is directly on place ?p (disk or peg)
    (clear ?p - place)                  ; nothing on top of place ?p
    (smaller ?d1 - disk ?d2 - disk)     ; d1 is strictly smaller than d2
    (different ?p1 - place ?p2 - place) ; true when p1 and p2 are different places (precomputed)
    (at-step ?s - step)                 ; current plan step marker
    (next ?s1 - step ?s2 - step)        ; successor relation for steps
    (moved-at ?d - disk ?s - step)      ; audit record: disk ?d was moved at step ?s

    ;; Agent contribution predicates: explicit, distinct contributions reconciled by requiring all three
    (provides-move-sequence ?a - agent)
    (provides-legal-checks ?a - agent)
    (provides-audit-report ?a - agent)
  )

  ;; Move a disk onto an empty peg (destination is a peg)
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?cur - step ?next - step ?ms - agent ?lc - agent ?ar - agent)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (different ?from ?to)
      (at-step ?cur)
      (next ?cur ?next)
      (provides-move-sequence ?ms)
      (provides-legal-checks ?lc)
      (provides-audit-report ?ar)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (at-step ?cur))
      (at-step ?next)
      (moved-at ?d ?next)
    )
  )

  ;; Move a disk onto another disk (destination is a disk). Enforces size ordering.
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?cur - step ?next - step ?ms - agent ?lc - agent ?ar - agent)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (different ?from ?to)
      (at-step ?cur)
      (next ?cur ?next)
      (smaller ?d ?to)                    ; legal check: cannot place larger onto smaller
      (provides-move-sequence ?ms)
      (provides-legal-checks ?lc)
      (provides-audit-report ?ar)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (at-step ?cur))
      (at-step ?next)
      (moved-at ?d ?next)
    )
  )
)