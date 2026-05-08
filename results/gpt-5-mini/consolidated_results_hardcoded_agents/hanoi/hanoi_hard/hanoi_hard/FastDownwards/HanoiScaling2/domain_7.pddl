(define (domain hanoi-6disk-steps)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ; structural relations: direct adjacency
    (on-peg ?d - disk ?p - peg)    ; ?d is directly on peg ?p (bottom-of-stack disk)
    (on-disk ?d - disk ?s - disk)  ; ?d is directly on disk ?s

    ; occupancy and top bookkeeping
    (top ?d - disk)                ; ?d is the topmost disk of its stack
    (empty ?p - peg)               ; peg currently has no disks
    (in ?d - disk ?p - peg)        ; disk ?d currently occupies peg ?p (peg containing its stack)

    ; static size ordering: true iff first arg is strictly smaller than second
    (smaller ?a - disk ?b - disk)

    ; discrete step progression
    (next ?s - step ?s2 - step)    ; successor relation between steps
    (current ?s - step)            ; the current (active) step/stage
  )

  ; Move the sole disk from one peg onto another empty peg.
  (:action move-peg-to-peg-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-peg ?d ?from)      ; ?d is directly on source peg (thus the bottom/only disk there)
      (top ?d)               ; and it is topmost (sole disk)
      (empty ?to)            ; destination peg is empty
      (in ?d ?from)          ; consistency: disk is recorded in source peg
    )
    :effect (and
      ;; advance the discrete stage
      (not (current ?s))
      (current ?s2)

      ;; move relations: remove old on-peg, add new on-peg
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; update peg membership for the moved disk
      (not (in ?d ?from))
      (in ?d ?to)

      ;; peg emptiness updates
      (empty ?from)
      (not (empty ?to))

      ;; top bookkeeping: moved disk remains top at new location
      (top ?d)
    )
  )

  ; Move the sole disk from a peg onto a top disk on some peg.
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?topeg - peg ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-peg ?d ?from)      ; ?d is sole disk on source peg
      (top ?d)
      (top ?to)              ; destination disk must be topmost
      (smaller ?d ?to)       ; size constraint: cannot place larger on smaller
      (in ?d ?from)          ; consistency of source membership
      (in ?to ?topeg)        ; identify peg that contains the destination disk
      (not (= ?from ?topeg)) ; allow moves across pegs; disallow trivial same-peg moves
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

      ;; relink: removed from peg, now on top of destination disk
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      ;; update peg membership for moved disk
      (not (in ?d ?from))
      (in ?d ?topeg)

      ;; source peg becomes empty (it lost its sole disk)
      (empty ?from)

      ;; destination peg is now non-empty
      (not (empty ?topeg))

      ;; top bookkeeping: target disk is no longer top; moved disk becomes top
      (not (top ?to))
      (top ?d)
    )
  )

  ; Move a top disk that is directly on another disk onto an empty peg.
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?frompeg - peg ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-disk ?d ?from)     ; ?d sits directly on disk ?from
      (top ?d)               ; and is topmost
      (empty ?to)            ; destination peg empty
      (in ?d ?frompeg)       ; identify peg that contains the moved disk and its stack
      (in ?from ?frompeg)    ; consistency: the disk under shares same peg
      (not (= ?frompeg ?to)) ; prevent no-op same-peg moves
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

      ;; re-link: remove on-disk relation and add on-peg relation
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      ;; update peg membership for moved disk
      (not (in ?d ?frompeg))
      (in ?d ?to)

      ;; destination peg becomes non-empty
      (not (empty ?to))

      ;; after removing ?d, the disk ?from becomes top
      (top ?from)

      ;; moved disk is top at its new location
      (top ?d)
    )
  )

  ; Move a top disk that is directly on another disk onto another top disk.
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?topeg - peg ?frompeg - peg ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-disk ?d ?from)      ; ?d directly on ?from
      (top ?d)                ; must be topmost
      (top ?to)               ; target disk must be topmost of its stack
      (smaller ?d ?to)        ; size constraint
      (in ?d ?frompeg)        ; identify peg for source stack
      (in ?from ?frompeg)
      (in ?to ?topeg)         ; identify peg for destination stack
      (not (= ?frompeg ?topeg)) ; avoid same-peg trivial move
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

      ;; relink: remove old direct-on and add new direct-on
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      ;; update peg membership for moved disk
      (not (in ?d ?frompeg))
      (in ?d ?topeg)

      ;; destination peg becomes non-empty
      (not (empty ?topeg))

      ;; destination top changes: target disk no longer top; moved disk becomes top
      (not (top ?to))
      (top ?d)

      ;; the disk that was under ?d becomes top
      (top ?from)
    )
  )
)