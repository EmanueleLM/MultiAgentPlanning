(define (domain hanoi-6disk-steps)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; structural relations
    (on-peg ?d - disk ?p - peg)    ; ?d is directly on peg ?p (bottom-of-stack case)
    (on-disk ?d - disk ?s - disk) ; ?d is directly on disk ?s

    ;; top-of-stack and peg-empty bookkeeping (kept explicit and updated by actions)
    (top ?d - disk)               ; ?d has nothing on top (is the topmost disk of its stack)
    (empty ?p - peg)              ; peg currently has no disks

    ;; static size ordering: true iff first arg is strictly smaller than second
    (smaller ?a - disk ?b - disk)

    ;; discrete step progression (ordered stages)
    (next ?s - step ?s2 - step)   ; successor relation between steps
    (current ?s - step)           ; the current (active) step/stage
  )

  ;; Move a disk that is directly on a peg (therefore the only disk on that peg)
  ;; onto an empty peg.
  (:action move-peg-to-peg-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-peg ?d ?from)   ; ?d is the disk on the peg (bottom/only)
      (top ?d)            ; must be the topmost (so it is the sole disk on ?from)
      (empty ?to)         ; destination peg is empty
    )
    :effect (and
      ;; advance the discrete stage
      (not (current ?s))
      (current ?s2)

      ;; move relation: remove on-peg at source and add on-peg at destination
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; update peg emptiness: source becomes empty; destination becomes non-empty
      (empty ?from)
      (not (empty ?to))

      ;; top bookkeeping: ?d remains top (still topmost at its stack)
      (top ?d)
    )
  )

  ;; Move a disk that is directly on a peg (sole disk) onto another top disk.
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-peg ?d ?from)   ; disk is directly on a peg (so it is the bottom disk of that peg)
      (top ?d)            ; and also the topmost (so it is the only disk on ?from)
      (top ?to)           ; destination disk must be topmost of its stack
      (smaller ?d ?to)    ; cannot place larger on smaller
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

      ;; re-link the moved disk onto the target disk
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      ;; source peg loses its sole disk
      (empty ?from)

      ;; destination disk is no longer top; moved disk becomes the new top
      (not (top ?to))
      (top ?d)

      ;; destination peg is non-empty (if it was marked empty, remove it)
      ;; (we do not require that the peg be explicitly named here; empty facts
      ;;  are maintained by moves that produce or remove the sole on-peg)
      ;; No explicit (not (empty ?dest-peg)) because we cannot identify the peg
      ;; of ?to in STRIPS; emptiness of pegs is maintained only when moves
      ;; add or remove on-peg facts.  This action does not create a new on-peg
      ;; fact, so no change to any empty predicate for the peg of ?to is needed.
    )
  )

  ;; Move a top disk that is directly on another disk onto an empty peg.
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-disk ?d ?from)  ; ?d sits directly on disk ?from
      (top ?d)            ; and is topmost
      (empty ?to)         ; destination peg empty
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

      ;; re-link: remove on-disk relation and add on-peg relation
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      ;; destination peg becomes non-empty
      (not (empty ?to))

      ;; after removing ?d, the disk ?from becomes top
      (top ?from)

      ;; moved disk is top at its new location
      (top ?d)
    )
  )

  ;; Move a top disk that is directly on another disk onto another top disk.
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-disk ?d ?from)  ; ?d directly on ?from
      (top ?d)            ; must be topmost
      (top ?to)           ; target disk must be topmost of its stack
      (smaller ?d ?to)    ; size constraint
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

      ;; relink: remove old direct-on relation and add new one
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      ;; destination top changes: target disk no longer top; moved disk becomes top
      (not (top ?to))
      (top ?d)

      ;; the disk that was under ?d becomes top
      (top ?from)
    )
  )
)