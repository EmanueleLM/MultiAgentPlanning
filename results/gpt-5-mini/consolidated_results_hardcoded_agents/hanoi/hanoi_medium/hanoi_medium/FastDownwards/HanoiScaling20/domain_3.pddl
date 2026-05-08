(define (domain hanoi_5_ordered)
  ;; Tower of Hanoi (5 disks) with explicit discrete stage progression.
  ;; Types: disk, peg, stage
  ;; Relations:
  ;;   (on-peg ?d ?p)     => disk is directly on a peg (no disk under it)
  ;;   (on-disk ?d ?under)=> disk is directly on another disk
  ;;   (clear-peg ?p)     => peg has no disk directly on it (empty)
  ;;   (clear-disk ?d)    => disk has nothing on top (is top of its stack)
  ;;   (smaller ?d1 ?d2)  => d1 is strictly smaller than d2 (static)
  ;;   (succ ?s1 ?s2)     => stage successor (static)
  ;;   (now ?s)           => current stage marker (exactly one holds initially)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?under - disk)
    (clear-peg ?p - peg)
    (clear-disk ?d - disk)
    (smaller ?d1 - disk ?d2 - disk)
    (succ ?s1 - stage ?s2 - stage)
    (now ?s - stage)
  )

  ;; Move a top disk that is directly on a peg onto an empty peg.
  (:action move-peg-to-empty
    :parameters (?disk - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?disk ?from)
      (clear-disk ?disk)
      (clear-peg ?to)
      (now ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (on-peg ?disk ?from))
      (on-peg ?disk ?to)
      (not (clear-peg ?to))
      (clear-peg ?from)
      (clear-disk ?disk)
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; Move a top disk that is currently on another disk onto an empty peg.
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
      (not (on-disk ?disk ?fromDisk))
      (on-peg ?disk ?to)
      (clear-disk ?fromDisk)
      (not (clear-peg ?to))
      (clear-disk ?disk)
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; Move a top disk that is directly on a peg onto another top disk.
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
      (not (on-peg ?disk ?from))
      (on-disk ?disk ?toDisk)
      (clear-peg ?from)
      (not (clear-disk ?toDisk))
      (clear-disk ?disk)
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
      (not (on-disk ?disk ?fromDisk))
      (on-disk ?disk ?toDisk)
      (clear-disk ?fromDisk)
      (not (clear-disk ?toDisk))
      (clear-disk ?disk)
      (not (now ?s))
      (now ?s2)
    )
  )
)