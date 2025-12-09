(define (domain hanoi-consistent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place stage)

  (:predicates
    ;; disk directly on a place (place = peg or disk)
    (on ?d - disk ?x - place)

    ;; place has nothing directly on top of it
    (clear ?x - place)

    ;; size ordering: smaller ?d1 ?d2 means ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)

    ;; discrete stage/time progression
    (at-stage ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Move a top disk that is directly on a disk, onto another disk.
  (:action move_disk_to_disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)              ; nothing on top of the moving disk
      (clear ?to)             ; destination must be free on top
      (smaller ?d ?to)        ; size ordering
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; relocate the disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update clear flags: the former support becomes clear; destination no longer clear
      (clear ?from)
      (not (clear ?to))

      ;; advance stage
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a top disk that is directly on a disk, onto an empty peg.
  (:action move_disk_to_peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)             ; peg must be empty (no disk directly on it)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      (clear ?from)
      (not (clear ?to))

      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a top disk that is directly on a peg, onto another disk.
  (:action move_peg_to_disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      (clear ?from)
      (not (clear ?to))

      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a top disk that is directly on a peg, onto an empty peg.
  (:action move_peg_to_peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      (clear ?from)
      (not (clear ?to))

      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)