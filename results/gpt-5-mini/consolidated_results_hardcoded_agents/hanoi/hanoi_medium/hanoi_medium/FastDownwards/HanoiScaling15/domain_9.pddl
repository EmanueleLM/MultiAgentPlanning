(define (domain hanoi-mover)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; Structural placement predicates (immediate relations only)
    (on-peg ?d - disk ?p - peg)        ; disk directly on a peg (immediately on the peg)
    (on-disk ?d - disk ?under - disk)  ; disk directly on another disk (immediately above)

    ;; Top/empty indicators
    (clear-peg ?p - peg)               ; peg currently empty (no disk directly on it)
    (clear-disk ?d - disk)             ; disk has no disk on top (is the top disk of its peg/stack)

    ;; Size ordering relation (static)
    (smaller ?d1 - disk ?d2 - disk)    ; d1 is smaller than d2

    ;; Explicit temporal/stage ordering to force a single action per stage
    (succ ?s1 - step ?s2 - step)       ; immediate successor relation between stages
    (ready ?s - step)                  ; stage is available for execution
    (done ?s - step)                   ; stage has been executed
  )

  ;; Move a disk that is directly on a peg (and top) to an empty peg.
  (:action move-peg-to-peg
    :parameters (?s - step ?succ - step ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (ready ?s)
      (succ ?s ?succ)
      (on-peg ?d ?from)
      (clear-disk ?d)                 ; disk must be the top disk (sole occupant if on-peg)
      (clear-peg ?to)                 ; destination peg must be empty
      (not (= ?from ?to))             ; must move between distinct pegs
    )
    :effect (and
      ;; relocate disk from one peg to another (immediate relations updated)
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; update peg emptiness
      (clear-peg ?from)
      (not (clear-peg ?to))

      ;; temporal progression: consume this stage and enable successor
      (not (ready ?s))
      (done ?s)
      (ready ?succ)
    )
  )

  ;; Move a disk that is directly on a peg (and top) onto the top of another disk.
  (:action move-peg-to-disk
    :parameters (?s - step ?succ - step ?d - disk ?from - peg ?to - disk)
    :precondition (and
      (ready ?s)
      (succ ?s ?succ)
      (on-peg ?d ?from)
      (clear-disk ?d)         ; moving disk must be top on its peg (sole occupant)
      (clear-disk ?to)        ; destination disk must be top
      (smaller ?d ?to)        ; cannot place larger on smaller
      (not (= ?d ?to))        ; cannot move a disk onto itself
    )
    :effect (and
      ;; relocate disk to be directly on another disk
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      ;; from peg becomes empty (disk was sole occupant)
      (clear-peg ?from)

      ;; destination disk is no longer top
      (not (clear-disk ?to))

      ;; temporal progression
      (not (ready ?s))
      (done ?s)
      (ready ?succ)
    )
  )

  ;; Move a top disk that is directly on another disk to an empty peg.
  (:action move-disk-to-peg
    :parameters (?s - step ?succ - step ?d - disk ?fromdisk - disk ?to - peg)
    :precondition (and
      (ready ?s)
      (succ ?s ?succ)
      (on-disk ?d ?fromdisk)
      (clear-disk ?d)      ; disk being moved must be top
      (clear-peg ?to)      ; destination peg must be empty
      (not (= ?d ?fromdisk)) ; disk and its underneath disk must be distinct (safety)
    )
    :effect (and
      ;; remove top relation and place disk directly on peg
      (not (on-disk ?d ?fromdisk))
      (on-peg ?d ?to)

      ;; the disk that was underneath becomes the top disk
      (clear-disk ?fromdisk)

      ;; destination peg is no longer empty
      (not (clear-peg ?to))

      ;; temporal progression
      (not (ready ?s))
      (done ?s)
      (ready ?succ)
    )
  )

  ;; Move a top disk that is directly on another disk onto the top of another disk.
  (:action move-disk-to-disk
    :parameters (?s - step ?succ - step ?d - disk ?fromdisk - disk ?to - disk)
    :precondition (and
      (ready ?s)
      (succ ?s ?succ)
      (on-disk ?d ?fromdisk)
      (clear-disk ?d)       ; disk being moved must be top
      (clear-disk ?to)      ; destination disk must be top
      (smaller ?d ?to)      ; maintain size ordering: cannot place larger on smaller
      (not (= ?d ?to))      ; cannot move a disk onto itself
      (not (= ?fromdisk ?to)) ; disallow trivial same-disk destination equalities
    )
    :effect (and
      ;; remove previous on-disk relation and place on top of destination disk
      (not (on-disk ?d ?fromdisk))
      (on-disk ?d ?to)

      ;; underlying disk becomes top
      (clear-disk ?fromdisk)

      ;; destination disk is no longer top
      (not (clear-disk ?to))

      ;; temporal progression
      (not (ready ?s))
      (done ?s)
      (ready ?succ)
    )
  )
)