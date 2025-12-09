(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; disk placement relations
    (on-peg ?d - disk ?p - peg)       ; ?d is directly on peg (bottom-most disk of that peg)
    (on-disk ?d - disk ?below - disk) ; ?d is directly on top of ?below

    ;; top-of-peg and peg emptiness
    (top ?d - disk ?p - peg)          ; ?d is the top disk of peg ?p
    (empty ?p - peg)                  ; peg ?p has no disks

    ;; static size ordering (a partial order relation)
    (smaller ?d1 - disk ?d2 - disk)

    ;; distinctness of pegs (avoid using (=) / :equality requirement)
    (different ?p1 - peg ?p2 - peg)

    ;; discrete stage progression
    (current ?s - stage)              ; the current stage at which an action may occur
    (next ?s1 - stage ?s2 - stage)    ; successor relation over stages
  )

  ;; Move when the moved disk is the only disk on the source peg and target peg is empty.
  (:action move-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (top ?d ?from)
      (on-peg ?d ?from)
      (empty ?to)
      (different ?from ?to)
    )
    :effect (and
      ;; stage progression: consume current, produce successor
      (not (current ?s))
      (current ?s2)

      ;; source becomes empty
      (not (on-peg ?d ?from))
      (not (top ?d ?from))
      (empty ?from)

      ;; target: place disk as sole/top disk on ?to
      (not (empty ?to))
      (on-peg ?d ?to)
      (top ?d ?to)
    )
  )

  ;; Move when the moved disk is the only disk on the source peg onto top of another disk at target.
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (top ?d ?from)
      (on-peg ?d ?from)
      (top ?below ?to)
      (smaller ?d ?below)
      (different ?from ?to)
    )
    :effect (and
      ;; stage progression
      (not (current ?s))
      (current ?s2)

      ;; source becomes empty
      (not (on-peg ?d ?from))
      (not (top ?d ?from))
      (empty ?from)

      ;; target: place moved disk on top of ?below, update tops
      (on-disk ?d ?below)
      (top ?d ?to)
      (not (top ?below ?to))
      (not (empty ?to))
    )
  )

  ;; Move when the moved disk is on top of another disk at source and target peg is empty.
  (:action move-disk-to-empty
    :parameters (?d - disk ?from - peg ?below - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (top ?d ?from)
      (on-disk ?d ?below)
      (empty ?to)
      (different ?from ?to)
    )
    :effect (and
      ;; stage progression
      (not (current ?s))
      (current ?s2)

      ;; source: detach ?d from ?below and update source top
      (not (on-disk ?d ?below))
      (not (top ?d ?from))
      (top ?below ?from)

      ;; target: place ?d as sole/top disk on ?to
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))
    )
  )

  ;; Move when the moved disk is on top of another disk at source to be placed on top of another disk at target.
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - peg ?below - disk ?to - peg ?above - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (top ?d ?from)
      (on-disk ?d ?below)
      (top ?above ?to)
      (smaller ?d ?above)
      (different ?from ?to)
    )
    :effect (and
      ;; stage progression
      (not (current ?s))
      (current ?s2)

      ;; source: detach ?d from ?below and update source top
      (not (on-disk ?d ?below))
      (not (top ?d ?from))
      (top ?below ?from)

      ;; target: place ?d on top of ?above, update tops
      (on-disk ?d ?above)
      (top ?d ?to)
      (not (top ?above ?to))
      (not (empty ?to))
    )
  )
)