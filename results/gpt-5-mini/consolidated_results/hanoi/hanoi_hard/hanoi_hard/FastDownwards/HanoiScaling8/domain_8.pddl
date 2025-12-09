(define (domain hanoi_ordered)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; direct support relations: a disk directly on a peg or directly on another disk
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?under - disk)

    ;; top/clear status separate for disks and pegs
    (clear-disk ?d - disk)
    (clear-peg ?p - peg)

    ;; size ordering
    (smaller ?small - disk ?big - disk)

    ;; explicit discrete stage progression
    (current-stage ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Move a top disk that is directly on a peg to an empty peg.
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; advance stage
      (not (current-stage ?s))
      (current-stage ?s2)

      ;; relocate disk: remove from source peg, put on destination peg
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; source peg becomes clear (disk was top and directly on peg)
      (clear-peg ?from)

      ;; destination peg now has a top disk
      (not (clear-peg ?to))

      ;; moved disk is top
      (clear-disk ?d)
    )
  )

  ;; Move a top disk that is directly on a peg onto the top disk of another peg.
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?from)   ;; disk is directly on source peg
      (clear-disk ?d)     ;; disk is top of its peg
      (clear-disk ?t)     ;; destination disk is top (on some peg or disk)
      (smaller ?d ?t)     ;; size ordering
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (current-stage ?s))
      (current-stage ?s2)

      ;; relocate disk: remove from source peg, put on top of disk ?t
      (not (on-peg ?d ?from))
      (on-disk ?d ?t)

      ;; source peg becomes clear
      (clear-peg ?from)

      ;; destination top disk now has a disk above it
      (not (clear-disk ?t))

      ;; moved disk is top
      (clear-disk ?d)
    )
  )

  ;; Move a top disk that is on top of another disk, onto an empty peg.
  (:action move-disk-to-peg
    :parameters (?d - disk ?under - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?under) ;; disk is directly on another disk
      (clear-disk ?d)     ;; disk is top of its stack
      (clear-peg ?to)     ;; destination peg empty
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (current-stage ?s))
      (current-stage ?s2)

      ;; relocate disk: remove from its under-disk, place on peg
      (not (on-disk ?d ?under))
      (on-peg ?d ?to)

      ;; the disk that was under becomes top/clear
      (clear-disk ?under)

      ;; destination peg now occupied on top
      (not (clear-peg ?to))

      ;; moved disk is top
      (clear-disk ?d)
    )
  )

  ;; Move a top disk that is on top of another disk, onto another top disk.
  (:action move-disk-to-disk
    :parameters (?d - disk ?under - disk ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?under) ;; disk directly on another disk
      (clear-disk ?d)     ;; disk is top of its stack
      (clear-disk ?t)     ;; destination disk is top
      (smaller ?d ?t)     ;; size ordering
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (current-stage ?s))
      (current-stage ?s2)

      ;; relocate disk onto destination disk
      (not (on-disk ?d ?under))
      (on-disk ?d ?t)

      ;; the disk that was under becomes clear
      (clear-disk ?under)

      ;; destination disk no longer clear (has disk on top)
      (not (clear-disk ?t))

      ;; moved disk is top
      (clear-disk ?d)
    )
  )
)