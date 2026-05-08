(define (domain hanoi_orchestrated)
  (:requirements :typing :strips :negative-preconditions)
  (:types peg disk stage)

  (:predicates
    ;; stage/time bookkeeping (discrete, ordered)
    (current ?s - stage)
    (next ?s1 - stage ?s2 - stage)

    ;; peg / stack predicates
    (top ?p - peg ?d - disk)         ; top disk on peg
    (empty ?p - peg)                 ; peg is empty
    (on ?d - disk ?p - peg)          ; disk directly on a peg (no disk below)
    (on-disk ?u - disk ?v - disk)    ; disk u is directly on disk v
    (smaller ?u - disk ?v - disk)    ; u is smaller than v (static)
  )

  ;; Move a top disk that is directly on a peg to an empty peg
  (:action move_from_peg_to_empty
    :parameters (?d - disk ?src - peg ?dst - peg ?s1 - stage ?s2 - stage)
    :precondition (and
      (current ?s1)
      (next ?s1 ?s2)
      (top ?src ?d)
      (on ?d ?src)
      (empty ?dst)
    )
    :effect (and
      ;; advance stage
      (not (current ?s1))
      (current ?s2)

      ;; source updates: remove top and on, source becomes empty
      (not (top ?src ?d))
      (not (on ?d ?src))
      (empty ?src)

      ;; destination updates: remove empty, add on and top
      (not (empty ?dst))
      (on ?d ?dst)
      (top ?dst ?d)
    )
  )

  ;; Move a top disk that is directly on a peg to a non-empty peg (onto disk ?z)
  (:action move_from_peg_to_nonempty
    :parameters (?d - disk ?src - peg ?dst - peg ?z - disk ?s1 - stage ?s2 - stage)
    :precondition (and
      (current ?s1)
      (next ?s1 ?s2)
      (top ?src ?d)
      (on ?d ?src)
      (top ?dst ?z)
      (smaller ?d ?z)
    )
    :effect (and
      ;; advance stage
      (not (current ?s1))
      (current ?s2)

      ;; source updates: remove top and on, source becomes empty
      (not (top ?src ?d))
      (not (on ?d ?src))
      (empty ?src)

      ;; destination updates: remove old top, stack new relation, set new top
      (not (top ?dst ?z))
      (on-disk ?d ?z)
      (top ?dst ?d)
    )
  )

  ;; Move a top disk that has a disk below it (on-disk relation) to an empty peg
  (:action move_from_disk_to_empty
    :parameters (?d - disk ?below - disk ?src - peg ?dst - peg ?s1 - stage ?s2 - stage)
    :precondition (and
      (current ?s1)
      (next ?s1 ?s2)
      (top ?src ?d)
      (on-disk ?d ?below)
      (empty ?dst)
    )
    :effect (and
      ;; advance stage
      (not (current ?s1))
      (current ?s2)

      ;; source updates: remove top relation for d, detach d from below, expose below as new top
      (not (top ?src ?d))
      (not (on-disk ?d ?below))
      (top ?src ?below)

      ;; destination updates: place d directly on peg (was empty), set top
      (not (empty ?dst))
      (on ?d ?dst)
      (top ?dst ?d)
    )
  )

  ;; Move a top disk that has a disk below it (on-disk relation) to a non-empty peg (onto disk ?z)
  (:action move_from_disk_to_nonempty
    :parameters (?d - disk ?below - disk ?src - peg ?dst - peg ?z - disk ?s1 - stage ?s2 - stage)
    :precondition (and
      (current ?s1)
      (next ?s1 ?s2)
      (top ?src ?d)
      (on-disk ?d ?below)
      (top ?dst ?z)
      (smaller ?d ?z)
    )
    :effect (and
      ;; advance stage
      (not (current ?s1))
      (current ?s2)

      ;; source updates: remove top for d, detach d from below, expose below as new top
      (not (top ?src ?d))
      (not (on-disk ?d ?below))
      (top ?src ?below)

      ;; destination updates: remove old top, place d on top of z, set new top
      (not (top ?dst ?z))
      (on-disk ?d ?z)
      (top ?dst ?d)
    )
  )
)