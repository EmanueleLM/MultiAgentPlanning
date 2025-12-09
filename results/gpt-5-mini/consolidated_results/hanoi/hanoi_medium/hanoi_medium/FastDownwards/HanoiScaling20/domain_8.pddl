(define (domain hanoi_5_ordered)
  ;; Tower of Hanoi (5 disks) with explicit discrete stage progression.
  ;; Types: disk, peg, stage
  ;; Predicates:
  ;;   (on-peg ?d ?p)     => disk is directly on a peg
  ;;   (on-disk ?d ?under)=> disk is directly on another disk (i.e., ?d sits on ?under)
  ;;   (clear-peg ?p)     => peg has no disk directly on it (empty)
  ;;   (clear-disk ?d)    => disk has nothing on top (is top of its stack)
  ;;   (smaller ?d1 ?d2)  => d1 is strictly smaller than d2 (static)
  ;;   (succ ?s1 ?s2)     => stage successor (static)
  ;;   (now ?s)           => current stage marker (exactly one holds at any time)
  ;; Design notes:
  ;; - Each action advances the unique (now ...) stage to its successor, enforcing one move per stage.
  ;; - No bookkeeping tokens or post-hoc repairs are used; preconditions/effects maintain exact disk placement.
  ;; - The encoding requires the planner to reach now s31 from now s0 (31 moves), matching the minimal solution.
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
      (clear-disk ?disk)        ; disk is top of its stack
      (clear-peg ?to)           ; destination peg is empty
      (now ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (on-peg ?disk ?from))
      (on-peg ?disk ?to)
      (clear-peg ?from)         ; source peg becomes empty
      (not (clear-peg ?to))
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; Move a top disk that is currently on another disk onto an empty peg.
  (:action move-disk-to-empty
    :parameters (?disk - disk ?fromDisk - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?disk ?fromDisk)
      (clear-disk ?disk)        ; disk is top of its stack
      (clear-peg ?to)           ; destination peg is empty
      (now ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (on-disk ?disk ?fromDisk))
      (on-peg ?disk ?to)
      (clear-disk ?fromDisk)    ; disk under becomes top
      (not (clear-peg ?to))
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; Move a top disk that is directly on a peg onto another top disk.
  (:action move-peg-to-disk
    :parameters (?disk - disk ?from - peg ?toDisk - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?disk ?from)
      (clear-disk ?disk)        ; disk is top of its stack
      (clear-disk ?toDisk)      ; destination disk is top of its stack
      (smaller ?disk ?toDisk)   ; cannot place larger on smaller
      (now ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (on-peg ?disk ?from))
      (on-disk ?disk ?toDisk)
      (clear-peg ?from)         ; source peg becomes empty
      (not (clear-disk ?toDisk))
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; Move a top disk that is currently on another disk onto another top disk.
  (:action move-disk-to-disk
    :parameters (?disk - disk ?fromDisk - disk ?toDisk - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?disk ?fromDisk)
      (clear-disk ?disk)        ; disk is top of its stack
      (clear-disk ?toDisk)      ; destination disk is top of its stack
      (smaller ?disk ?toDisk)   ; cannot place larger on smaller
      (now ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (on-disk ?disk ?fromDisk))
      (on-disk ?disk ?toDisk)
      (clear-disk ?fromDisk)    ; disk under becomes top
      (not (clear-disk ?toDisk))
      (not (now ?s))
      (now ?s2)
    )
  )
)