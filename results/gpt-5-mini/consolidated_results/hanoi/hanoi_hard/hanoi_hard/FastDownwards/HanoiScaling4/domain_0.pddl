(define (domain hanoi6)
  (:requirements :strips :typing)
  (:types
    peg disk - object
    place
  )
  ;; NOTE: We use a small, explicit type design: pegs and disks are objects.
  ;; For 'on' the second argument must be a place (either a peg or a disk).
  ;; Because Fast Downward accepts simple typing we keep pegs and disks as objects;
  ;; we will use disks also where "place" is required by convention below.
  ;; To keep the model simple and fully explicit we use predicates:
  ;;   (on ?d ?p)        - ?d is immediately on place ?p (peg or disk)
  ;;   (top ?peg ?d)     - disk ?d is the topmost disk on peg ?peg
  ;;   (empty ?peg)      - peg currently has no disks
  ;;   (clear ?d)        - no disk is immediately on disk ?d
  ;;   (smaller ?d1 ?d2) - static size ordering facts
  (:predicates
    (on ?d - disk ?p - object)
    (top ?peg - peg ?d - disk)
    (empty ?peg - peg)
    (clear ?d - disk)
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move variants without conditional effects. Each variant updates top/empty/clear and on facts
  ;; so invariants (single support, top consistency, size ordering) are preserved.

  ;; Case 1: disk ?d sits directly on peg ?from; move it to an empty peg ?to
  (:action move-from-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (top ?from ?d)
      (on ?d ?from)
      (empty ?to)
      (clear ?d)
    )
    :effect (and
      ;; remove old support
      (not (on ?d ?from))
      ;; new support
      (on ?d ?to)
      ;; update top of source and destination
      (not (top ?from ?d))
      (top ?to ?d)
      ;; pegs empty/non-empty bookkeeping
      (empty ?from)
      (not (empty ?to))
      ;; d remains clear (nothing on d)
      (clear ?d)
    )
  )

  ;; Case 2: disk ?d sits directly on another disk ?below which is on peg ?from;
  ;; move ?d to an empty peg ?to. After the move, ?below becomes the top of ?from (and becomes clear).
  (:action move-from-disk-to-empty
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg)
    :precondition (and
      (top ?from ?d)
      (on ?d ?below)
      (empty ?to)
      (clear ?d)
    )
    :effect (and
      ;; update support: remove on ?d ?below, add on ?d ?to
      (not (on ?d ?below))
      (on ?d ?to)
      ;; update top of source peg: now ?below is top
      (not (top ?from ?d))
      (top ?from ?below)
      ;; destination peg top becomes ?d
      (top ?to ?d)
      (not (empty ?to))
      ;; mark now-top-below as clear (nothing on it anymore)
      (clear ?below)
      ;; d remains clear
      (clear ?d)
    )
  )

  ;; Case 3: disk ?d sits on peg ?from; move it onto disk ?t which is top of peg ?to.
  ;; Enforce size constraint smaller ?d ?t.
  (:action move-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (top ?from ?d)
      (on ?d ?from)
      (top ?to ?t)
      (clear ?d)
      (smaller ?d ?t)
    )
    :effect (and
      ;; update support
      (not (on ?d ?from))
      (on ?d ?t)
      ;; update top at source (becomes empty)
      (not (top ?from ?d))
      (empty ?from)
      ;; update top at destination: remove old top, set new top
      (not (top ?to ?t))
      (top ?to ?d)
      ;; destination top disk ?t now has a disk on it -> not clear
      (not (clear ?t))
      ;; d remains clear
      (clear ?d)
    )
  )

  ;; Case 4: disk ?d sits on disk ?below which is on peg ?from; move onto disk ?t which is top of peg ?to.
  ;; Enforce size constraint smaller ?d ?t. After move, ?below becomes top of ?from and becomes clear.
  (:action move-from-disk-to-disk
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (top ?from ?d)
      (on ?d ?below)
      (top ?to ?t)
      (clear ?d)
      (smaller ?d ?t)
    )
    :effect (and
      ;; change support
      (not (on ?d ?below))
      (on ?d ?t)
      ;; update top of source peg: becomes ?below
      (not (top ?from ?d))
      (top ?from ?below)
      ;; update top of destination peg: replace ?t by ?d
      (not (top ?to ?t))
      (top ?to ?d)
      ;; t is no longer clear (has d on it)
      (not (clear ?t))
      ;; below becomes clear (nothing on it anymore)
      (clear ?below)
      ;; d remains clear
      (clear ?d)
    )
  )

)