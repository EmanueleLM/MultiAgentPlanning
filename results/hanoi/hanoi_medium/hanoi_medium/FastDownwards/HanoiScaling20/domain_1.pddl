(define (domain hanoi_5_ordered)
  ;; Tower of Hanoi (5 disks) with explicit discrete stage progression.
  ;; - Disks and pegs are distinct types.
  ;; - Two-place relations model disk-on-peg and disk-on-disk separately to avoid disjunctions.
  ;; - A chain of stage objects and a 'now' marker enforce sequential action steps;
  ;;   each action consumes the current stage and advances to its successor (succ).
  ;; - All constraints (single-disk moves, top-only moves, no larger-on-smaller) are
  ;;   enforced as hard preconditions/effects. :negative-preconditions is used only
  ;;   for inequality and for toggling the 'now' marker.
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; disk is directly on an empty peg
    (on-peg ?d - disk ?p - peg)
    ;; disk is directly on another disk
    (on-disk ?d - disk ?under - disk)
    ;; empty peg (no disk directly on the peg)
    (clear-peg ?p - peg)
    ;; disk has nothing on top of it (is the top element of its stack)
    (clear-disk ?d - disk)
    ;; size ordering: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; stage successor relation (static)
    (succ ?s1 - stage ?s2 - stage)
    ;; current stage marker (exactly one should hold in reachable plans)
    (now ?s - stage)
  )

  ;; Move a top disk that is currently on a peg onto an empty peg.
  (:action move-peg-to-empty
    :parameters (?disk - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?disk ?from)
      (clear-disk ?disk)
      (clear-peg ?to)
      (now ?s)
      (succ ?s ?s2)
      (not (= ?from ?to))
    )
    :effect (and
      ;; remove from source peg, place on destination peg
      (not (on-peg ?disk ?from))
      (on-peg ?disk ?to)
      ;; destination peg now occupied
      (not (clear-peg ?to))
      ;; source peg becomes clear
      (clear-peg ?from)
      ;; moved disk remains top (clear)
      (clear-disk ?disk)
      ;; advance stage marker
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; Move a top disk that is currently on a disk onto an empty peg.
  (:action move-disk-to-empty
    :parameters (?disk - disk ?fromDisk - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?disk ?fromDisk)
      (clear-disk ?disk)
      (clear-peg ?to)
      (now ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ;; remove from under-disk, place on peg
      (not (on-disk ?disk ?fromDisk))
      (on-peg ?disk ?to)
      ;; the disk that was under now becomes clear
      (clear-disk ?fromDisk)
      ;; destination peg now occupied
      (not (clear-peg ?to))
      ;; moved disk is top
      (clear-disk ?disk)
      ;; advance stage marker
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; Move a top disk that is currently on a peg onto another top disk.
  (:action move-peg-to-disk
    :parameters (?disk - disk ?from - peg ?toDisk - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?disk ?from)
      (clear-disk ?disk)
      (clear-disk ?toDisk)
      (smaller ?disk ?toDisk)
      (now ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ;; remove from source peg, place on destination disk
      (not (on-peg ?disk ?from))
      (on-disk ?disk ?toDisk)
      ;; source peg becomes clear
      (clear-peg ?from)
      ;; destination disk no longer clear (has something on top)
      (not (clear-disk ?toDisk))
      ;; moved disk is top
      (clear-disk ?disk)
      ;; advance stage marker
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; Move a top disk that is currently on another disk onto another top disk.
  (:action move-disk-to-disk
    :parameters (?disk - disk ?fromDisk - disk ?toDisk - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?disk ?fromDisk)
      (clear-disk ?disk)
      (clear-disk ?toDisk)
      (smaller ?disk ?toDisk)
      (now ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ;; remove from fromDisk, place on toDisk
      (not (on-disk ?disk ?fromDisk))
      (on-disk ?disk ?toDisk)
      ;; the disk that was under becomes clear
      (clear-disk ?fromDisk)
      ;; destination disk no longer clear
      (not (clear-disk ?toDisk))
      ;; moved disk is top
      (clear-disk ?disk)
      ;; advance stage marker
      (not (now ?s))
      (now ?s2)
    )
  )
)