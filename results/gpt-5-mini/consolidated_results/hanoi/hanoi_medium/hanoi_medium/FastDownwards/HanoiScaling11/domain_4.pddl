(define (domain hanoi-5-peg3)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-disk ?d - disk ?below - disk)    ; ?d is immediately on top of ?below
    (on-peg  ?d - disk  ?p - peg)        ; ?d is directly on a peg (i.e., bottom-most disk on that peg)
    (clear-disk ?d - disk)               ; nothing on top of ?d
    (top-of-peg  ?d - disk ?p - peg)     ; ?d is the current top disk of peg ?p
    (empty ?p - peg)                     ; peg currently has no disks
    (located ?d - disk ?p - peg)         ; disk is located at peg
    (smaller ?d1 - disk ?d2 - disk)      ; static size ordering: ?d1 is smaller than ?d2
    (stage ?s - stage)
    (next ?s - stage ?s2 - stage)
    (current ?s - stage)
    (diff ?p1 - peg ?p2 - peg)           ; true for every ordered pair of distinct pegs
  )

  ;; move a top disk that currently sits directly on a source peg onto an empty destination peg
  (:action move-from-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (diff ?from ?to)

      ;; disk is top and sits directly on the source peg (sole disk on that peg)
      (top-of-peg ?d ?from)
      (on-peg ?d ?from)
      (clear-disk ?d)

      ;; destination peg must be empty
      (empty ?to)

      ;; location consistency
      (located ?d ?from)
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

      ;; update on-peg/on-disk relations
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; update top-of-peg markers
      (not (top-of-peg ?d ?from))
      (top-of-peg ?d ?to)

      ;; peg emptiness flags
      (not (empty ?to))
      (empty ?from)

      ;; moved disk remains clear
      (clear-disk ?d)

      ;; location update
      (not (located ?d ?from))
      (located ?d ?to)
    )
  )

  ;; move a top disk that currently sits directly on a source peg onto the top disk of a destination peg
  (:action move-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?dest - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (diff ?from ?to)

      ;; source facts: ?d is top and sits directly on ?from (sole disk on that peg)
      (top-of-peg ?d ?from)
      (on-peg ?d ?from)
      (clear-disk ?d)

      ;; destination facts: ?dest is top on ?to and larger than ?d
      (top-of-peg ?dest ?to)
      (smaller ?d ?dest)

      ;; location consistency
      (located ?d ?from)
      (located ?dest ?to)
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

      ;; relocate disk: remove on-peg, add on-disk
      (not (on-peg ?d ?from))
      (on-disk ?d ?dest)

      ;; update top-of-peg markers
      (not (top-of-peg ?d ?from))
      (top-of-peg ?d ?to)
      (not (top-of-peg ?dest ?to))

      ;; destination disk is no longer clear
      (not (clear-disk ?dest))

      ;; moved disk is clear
      (clear-disk ?d)

      ;; source peg becomes empty (it had only ?d)
      (empty ?from)

      ;; destination peg now non-empty
      (not (empty ?to))

      ;; location update
      (not (located ?d ?from))
      (located ?d ?to)
    )
  )

  ;; move a top disk that currently sits on another disk onto an empty destination peg.
  ;; After move the below disk becomes top on the source peg.
  (:action move-from-disk-to-empty
    :parameters (?d - disk ?from - peg ?below - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (diff ?from ?to)

      ;; source facts: ?d is top-of-peg on ?from and is sitting on ?below
      (top-of-peg ?d ?from)
      (on-disk ?d ?below)
      (clear-disk ?d)

      ;; destination must be empty
      (empty ?to)

      ;; location consistency
      (located ?d ?from)
      (located ?below ?from)
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

      ;; relocate disk to empty peg
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)

      ;; update top markers and clear flags:
      ;; - moved disk no longer top at source
      ;; - below disk becomes top and becomes clear
      (not (top-of-peg ?d ?from))
      (top-of-peg ?below ?from)
      (clear-disk ?below)

      ;; moved disk becomes top on destination and is clear
      (top-of-peg ?d ?to)
      (clear-disk ?d)

      ;; destination peg now non-empty
      (not (empty ?to))

      ;; location update
      (not (located ?d ?from))
      (located ?d ?to)
    )
  )

  ;; move a top disk that currently sits on another disk onto the top disk of a destination peg.
  ;; After the move, the below disk at source becomes top.
  (:action move-from-disk-to-disk
    :parameters (?d - disk ?from - peg ?below - disk ?to - peg ?dest - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (diff ?from ?to)

      ;; source facts
      (top-of-peg ?d ?from)
      (on-disk ?d ?below)
      (clear-disk ?d)

      ;; destination facts
      (top-of-peg ?dest ?to)
      (smaller ?d ?dest)

      ;; location consistency
      (located ?d ?from)
      (located ?below ?from)
      (located ?dest ?to)
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

      ;; relocate top disk from being on ?below to being on ?dest
      (not (on-disk ?d ?below))
      (on-disk ?d ?dest)

      ;; update top markers:
      ;; - moved disk no longer top on source, becomes top on destination
      ;; - destination's previous top is no longer top
      (not (top-of-peg ?d ?from))
      (top-of-peg ?d ?to)
      (not (top-of-peg ?dest ?to))

      ;; below disk becomes clear and top on source
      (clear-disk ?below)
      (top-of-peg ?below ?from)

      ;; destination disk is no longer clear
      (not (clear-disk ?dest))

      ;; moved disk is clear
      (clear-disk ?d)

      ;; location update for moved disk
      (not (located ?d ?from))
      (located ?d ?to)
    )
  )
)