(define (domain hanoi-6disk-steps)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; structural stack relations
    (on-peg ?d - disk ?p - peg)    ; ?d is directly on peg ?p (bottom disk of that peg's stack)
    (on-disk ?d - disk ?s - disk)  ; ?d is directly on disk ?s

    ;; per-disk top status (true iff the disk is topmost of its current stack)
    (top ?d - disk)

    ;; per-peg emptiness
    (empty ?p - peg)

    ;; peg membership: disk occupies given peg's stack
    (in ?d - disk ?p - peg)

    ;; static size ordering: smaller ?a ?b means ?a is strictly smaller than ?b
    (smaller ?a - disk ?b - disk)

    ;; discrete step progression
    (next ?s - step ?s2 - step)
    (current ?s - step)
  )

  ;; Move a sole disk that is both bottom and top on its source peg onto an empty destination peg.
  (:action move-peg-to-peg-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-peg ?d ?from)    ; ?d is bottom on source peg
      (top ?d)             ; and also top (sole disk)
      (in ?d ?from)
      (empty ?to)          ; destination empty
      (not (= ?from ?to))
    )
    :effect (and
      ;; advance step
      (not (current ?s))
      (current ?s2)

      ;; relocate bottom/top disk
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; update peg membership
      (not (in ?d ?from))
      (in ?d ?to)

      ;; emptiness updates
      (empty ?from)
      (not (empty ?to))

      ;; top-of-stack updates: moved disk remains top at its new peg
      (top ?d)
    )
  )

  ;; Move a sole disk (bottom & top) from source peg onto a top disk on destination peg.
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?topeg - peg ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-peg ?d ?from)      ; sole disk at source
      (top ?d)
      (top ?to)              ; destination disk is topmost
      (smaller ?d ?to)       ; size invariant
      (in ?d ?from)
      (in ?to ?topeg)
      (not (= ?from ?topeg))
    )
    :effect (and
      ;; advance step
      (not (current ?s))
      (current ?s2)

      ;; remove from peg, place on disk
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      ;; update peg membership
      (not (in ?d ?from))
      (in ?d ?topeg)

      ;; emptiness updates
      (empty ?from)
      (not (empty ?topeg))

      ;; top status updates
      (not (top ?to))
      (top ?d)
    )
  )

  ;; Move a top disk that is directly on another disk onto an empty peg.
  (:action move-disk-to-peg
    :parameters (?d - disk ?below - disk ?frompeg - peg ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-disk ?d ?below)      ; ?d sits directly on ?below
      (top ?d)                 ; and is topmost of its peg
      (in ?d ?frompeg)
      (in ?below ?frompeg)
      (empty ?to)
      (not (= ?frompeg ?to))
    )
    :effect (and
      ;; advance step
      (not (current ?s))
      (current ?s2)

      ;; re-link: remove direct-on relation; disk becomes bottom on destination peg
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)

      ;; update peg membership
      (not (in ?d ?frompeg))
      (in ?d ?to)

      ;; emptiness updates
      (not (empty ?to))

      ;; top status: disk below becomes top of source stack; moved disk becomes top at destination
      (top ?below)
      (top ?d)
    )
  )

  ;; Move a top disk that is directly on another disk onto another top disk.
  (:action move-disk-to-disk
    :parameters (?d - disk ?below - disk ?to - disk ?topeg - peg ?frompeg - peg ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-disk ?d ?below)      ; ?d sits on ?below
      (top ?d)                 ; ?d is top of source peg
      (top ?to)                ; target disk is top of its peg
      (smaller ?d ?to)         ; size invariant
      (in ?d ?frompeg)
      (in ?below ?frompeg)
      (in ?to ?topeg)
      (not (= ?frompeg ?topeg))
    )
    :effect (and
      ;; advance step
      (not (current ?s))
      (current ?s2)

      ;; re-link: move ?d to sit on ?to
      (not (on-disk ?d ?below))
      (on-disk ?d ?to)

      ;; update peg membership
      (not (in ?d ?frompeg))
      (in ?d ?topeg)

      ;; emptiness updates
      (not (empty ?topeg))

      ;; top status updates
      (not (top ?to))
      (top ?d)
      (top ?below)
    )
  )
)