(define (domain hanoi-mover)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (on-peg ?d - disk ?p - peg)        ; disk directly on a peg (bottom disk if peg has stack)
    (on-disk ?d - disk ?under - disk)  ; disk directly on another disk (immediately above)
    (clear-peg ?p - peg)               ; peg has no disk on it (empty)
    (clear-disk ?d - disk)             ; disk has no disk on top (is top)
    (smaller ?d1 - disk ?d2 - disk)    ; d1 is smaller than d2
    (succ ?s1 - step ?s2 - step)       ; step ordering (immediate successor)
    (ready ?s - step)                  ; this step is available to execute
    (done ?s - step)                   ; this step has been executed
  )

  ;; Move a disk that is directly on a peg to an empty peg.
  (:action move-peg-to-peg
    :parameters (?s - step ?succ - step ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (ready ?s)
      (succ ?s ?succ)
      (on-peg ?d ?from)
      (clear-disk ?d)         ; must be top (no disk on top)
      (clear-peg ?to)         ; destination peg must be empty
      (not (= ?from ?to))     ; source and destination must be distinct
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (clear-peg ?from)      ; from becomes empty (disk was directly on the peg and top)
      (not (clear-peg ?to))
      (not (ready ?s))
      (done ?s)
      (ready ?succ)
    )
  )

  ;; Move a disk that is directly on a peg onto the top of another disk.
  (:action move-peg-to-disk
    :parameters (?s - step ?succ - step ?d - disk ?from - peg ?to - disk)
    :precondition (and
      (ready ?s)
      (succ ?s ?succ)
      (on-peg ?d ?from)
      (clear-disk ?d)         ; moving disk must be top on its peg
      (clear-disk ?to)        ; destination disk must be top
      (smaller ?d ?to)        ; cannot place larger on smaller
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (clear-peg ?from)       ; peg becomes empty (disk was sole occupant)
      (not (clear-disk ?to))
      (not (ready ?s))
      (done ?s)
      (ready ?succ)
    )
  )

  ;; Move a disk that is directly on another disk to an empty peg.
  (:action move-disk-to-peg
    :parameters (?s - step ?succ - step ?d - disk ?fromdisk - disk ?to - peg)
    :precondition (and
      (ready ?s)
      (succ ?s ?succ)
      (on-disk ?d ?fromdisk)
      (clear-disk ?d)      ; disk being moved must be top
      (clear-peg ?to)      ; destination peg must be empty
    )
    :effect (and
      (not (on-disk ?d ?fromdisk))
      (on-peg ?d ?to)
      (clear-disk ?fromdisk)   ; underlying disk becomes top
      (not (clear-peg ?to))
      (not (ready ?s))
      (done ?s)
      (ready ?succ)
    )
  )

  ;; Move a disk that is directly on another disk onto the top of another disk.
  (:action move-disk-to-disk
    :parameters (?s - step ?succ - step ?d - disk ?fromdisk - disk ?to - disk)
    :precondition (and
      (ready ?s)
      (succ ?s ?succ)
      (on-disk ?d ?fromdisk)
      (clear-disk ?d)       ; disk being moved must be top
      (clear-disk ?to)      ; destination disk must be top
      (smaller ?d ?to)      ; maintain size ordering
      (not (= ?fromdisk ?to)) ; cannot move onto the disk it is currently on
    )
    :effect (and
      (not (on-disk ?d ?fromdisk))
      (on-disk ?d ?to)
      (clear-disk ?fromdisk)    ; underlying disk becomes top
      (not (clear-disk ?to))
      (not (ready ?s))
      (done ?s)
      (ready ?succ)
    )
  )
)