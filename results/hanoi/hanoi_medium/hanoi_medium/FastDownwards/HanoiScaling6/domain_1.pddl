(define (domain tower-of-hanoi-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (cur ?s - step)                          ; current stage
    (succ ?s - step ?t - step)               ; ordered successor relation over stages

    (on-peg ?d - disk ?p - peg)              ; disk ?d is immediately on peg ?p (bottom of that peg's stack)
    (on-disk ?d - disk ?under - disk)        ; disk ?d is immediately on top of disk ?under

    (clear ?d - disk)                        ; no disk is on top of disk ?d (it is topmost)
    (empty ?p - peg)                         ; peg ?p has no disks

    (smaller ?a - disk ?b - disk)            ; static size ordering: ?a is smaller than ?b

    (diff-peg ?p1 - peg ?p2 - peg)           ; auxiliary facts encoding peg distinctness
    (diff-disk ?d1 - disk ?d2 - disk)        ; auxiliary facts encoding disk distinctness
  )

  ; Move a top disk that is directly on a peg onto an empty peg.
  ; Stage progression: action is only applicable at the current stage ?s and advances to successor ?t.
  (:action move-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?t - step)
    :precondition (and
      (cur ?s)
      (succ ?s ?t)
      (on-peg ?d ?from)
      (clear ?d)
      (empty ?to)
      (diff-peg ?from ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      (not (empty ?to))
      (empty ?from)

      ; stage advancement (explicit ordered stages)
      (not (cur ?s))
      (cur ?t)
    )
  )

  ; Move a top disk that is directly on a peg onto another disk (target must be clear and larger).
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?tgt - disk ?s - step ?t - step)
    :precondition (and
      (cur ?s)
      (succ ?s ?t)
      (on-peg ?d ?from)
      (clear ?d)
      (clear ?tgt)
      (smaller ?d ?tgt)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?tgt)

      (empty ?from)

      (not (clear ?tgt))  ; target no longer topmost

      (not (cur ?s))
      (cur ?t)
    )
  )

  ; Move a top disk that is on top of another disk onto an empty peg.
  (:action move-disk-to-empty
    :parameters (?d - disk ?under - disk ?to - peg ?s - step ?t - step)
    :precondition (and
      (cur ?s)
      (succ ?s ?t)
      (on-disk ?d ?under)
      (clear ?d)
      (empty ?to)
    )
    :effect (and
      (not (on-disk ?d ?under))
      (on-peg ?d ?to)

      (clear ?under)      ; disk under becomes topmost after removal
      (not (empty ?to))

      (not (cur ?s))
      (cur ?t)
    )
  )

  ; Move a top disk that is on top of another disk onto another disk (target must be clear and larger).
  (:action move-disk-to-disk
    :parameters (?d - disk ?under - disk ?tgt - disk ?s - step ?t - step)
    :precondition (and
      (cur ?s)
      (succ ?s ?t)
      (on-disk ?d ?under)
      (clear ?d)
      (clear ?tgt)
      (smaller ?d ?tgt)
      (not (= ?under ?tgt)) ; note: typed inequality not required for distinct disks if diff facts present
    )
    :effect (and
      (not (on-disk ?d ?under))
      (on-disk ?d ?tgt)

      (clear ?under)
      (not (clear ?tgt))

      (not (cur ?s))
      (cur ?t)
    )
  )
)